import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';

import '../../../core/flavours/constants.dart';

class IDScanScreen extends StatefulWidget {
  final String captureType; // 'front' or 'back'
  final Function(XFile?) onCompleted;

  const IDScanScreen({
    super.key,
    required this.captureType,
    required this.onCompleted,
  });

  @override
  State<IDScanScreen> createState() => _IDScanScreenState();
}

class _IDScanScreenState extends State<IDScanScreen> with WidgetsBindingObserver {
  CameraController? _cameraController;
  late TextRecognizer _textRecognizer;
  late FaceDetector _faceDetector;

  bool _isInitialized = false;
  bool _isProcessing = false;
  bool _idCardDetected = false;
  bool _verificationComplete = false;
  bool _hasPhoto = false;
  bool _sideMatchesRequirement = false;
  XFile? _capturedImage;

  // Auto/Manual capture toggle
  bool _isAutoCapture = true;
  bool _isCapturing = false;

  String _statusMessage = 'Initializing camera...';
  String _extractedText = '';
  InputImageRotation _rotation = InputImageRotation.rotation0deg;
  List<TextBlock> _textBlocks = [];
  List<Face> _detectedFaces = [];

  // Debug info
  int _debugScore = 0;
  String _debugReason = '';

  // Focus timer for back side
  Timer? _focusTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
    _initializeRecognizers();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _focusTimer?.cancel();
    _cameraController?.dispose();
    _textRecognizer.close();
    _faceDetector.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      _cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    try {
      setState(() => _statusMessage = 'Checking camera permissions...');

      final status = await Permission.camera.request();

      if (!status.isGranted) {
        setState(() => _statusMessage = 'Camera permission denied');
        return;
      }

      setState(() => _statusMessage = 'Loading camera...');
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        setState(() => _statusMessage = 'No cameras available');
        return;
      }

      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        backCamera,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid ? ImageFormatGroup.yuv420 : ImageFormatGroup.bgra8888,
      );

      await _cameraController!.initialize();
      _determineRotation();

      if (!mounted) return;

      setState(() {
        _isInitialized = true;
        _statusMessage = widget.captureType == 'front' ? 'Position ID FRONT side (with photo) in the frame' : 'Position ID BACK side in the frame';
      });

      await _cameraController!.setFocusMode(FocusMode.auto);
      await _cameraController!.setExposureMode(ExposureMode.auto);

      // Enhanced focus for back side detection
      if (widget.captureType == 'back') {
        _startPeriodicFocus();
      }

      // Only start image stream for auto capture
      if (_isAutoCapture) {
        _startImageStream();
      }
    } catch (e) {
      setState(() => _statusMessage = 'Camera error: ${e.toString()}');
      debugPrint('Camera error: $e');
    }
  }

  void _startPeriodicFocus() {
    _focusTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      if (_cameraController?.value.isInitialized == true && !_verificationComplete) {
        try {
          await _cameraController!.setFocusPoint(const Offset(0.5, 0.5));
        } catch (e) {
          debugPrint('Focus error: $e');
        }
      }
    });
  }

  void _initializeRecognizers() {
    _textRecognizer = TextRecognizer(
      script: TextRecognitionScript.latin,
    );

    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableClassification: false,
        enableLandmarks: false,
        enableContours: false,
        minFaceSize: 0.05,
        performanceMode: FaceDetectorMode.fast,
      ),
    );
  }

  void _determineRotation() {
    final sensorOrientation = _cameraController?.description.sensorOrientation ?? 0;
    _rotation = InputImageRotationValue.fromRawValue(sensorOrientation) ?? InputImageRotation.rotation0deg;
  }

  void _startImageStream() {
    _cameraController!.startImageStream((CameraImage image) {
      if (!_isProcessing && !_verificationComplete && mounted && _isAutoCapture) {
        _isProcessing = true;
        _processImage(image).whenComplete(() {
          if (mounted) _isProcessing = false;
        });
      }
    });
  }

  void _stopImageStream() {
    try {
      _cameraController?.stopImageStream();
    } catch (e) {
      debugPrint('Stop image stream error: $e');
    }
  }

  void _toggleCaptureMode() {
    setState(() {
      _isAutoCapture = !_isAutoCapture;

      if (_isAutoCapture) {
        _statusMessage = widget.captureType == 'front' ? 'Position ID FRONT side (with photo) in the frame' : 'Position ID BACK side in the frame';
        _startImageStream();
      } else {
        _statusMessage = 'Tap the button to capture';
        _stopImageStream();
        // Reset validation states for manual mode
        _idCardDetected = false;
        _sideMatchesRequirement = false;
      }
    });
  }

  Future<void> _processImage(CameraImage image) async {
    if (!mounted) return;

    try {
      final inputImage = _convertCameraImage(image);
      if (inputImage == null) return;

      // Run both text recognition and face detection
      final futures = await Future.wait([
        _textRecognizer.processImage(inputImage),
        _faceDetector.processImage(inputImage),
      ]);

      final recognizedText = futures[0] as RecognizedText;
      final faces = futures[1] as List<Face>;

      if (!mounted) return;

      setState(() {
        _extractedText = recognizedText.text;
        _textBlocks = recognizedText.blocks;
        _detectedFaces = faces;
        _hasPhoto = _detectPhoto(faces, recognizedText.text);
        _sideMatchesRequirement = _checkSideRequirement();
        _idCardDetected = _isValidIdCard(recognizedText.text);
      });

      _checkVerificationStatus();
    } catch (e) {
      debugPrint('Image processing error: $e');
    }
  }

  InputImage? _convertCameraImage(CameraImage image) {
    try {
      if (image.format.group == ImageFormatGroup.yuv420) {
        final nv21Bytes = _yuv420ToNv21(image);
        return InputImage.fromBytes(
          bytes: nv21Bytes,
          metadata: InputImageMetadata(
            size: Size(image.width.toDouble(), image.height.toDouble()),
            rotation: _rotation,
            format: InputImageFormat.nv21,
            bytesPerRow: image.planes[0].bytesPerRow,
          ),
        );
      }

      return InputImage.fromBytes(
        bytes: _concatenatePlanes(image.planes),
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: _rotation,
          format: InputImageFormatValue.fromRawValue(image.format.raw)!,
          bytesPerRow: image.planes[0].bytesPerRow,
        ),
      );
    } catch (e) {
      debugPrint('Image conversion error: $e');
      return null;
    }
  }

  Uint8List _yuv420ToNv21(CameraImage image) {
    final yPlane = image.planes[0];
    final uPlane = image.planes[1];
    final vPlane = image.planes[2];

    final nv21 = Uint8List(yPlane.bytes.length + uPlane.bytes.length + vPlane.bytes.length);

    nv21.setRange(0, yPlane.bytes.length, yPlane.bytes);

    for (int i = 0; i < uPlane.bytes.length; i++) {
      nv21[yPlane.bytes.length + i * 2] = vPlane.bytes[i];
      nv21[yPlane.bytes.length + i * 2 + 1] = uPlane.bytes[i];
    }

    return nv21;
  }

  Uint8List _concatenatePlanes(List<Plane> planes) {
    final buffer = Uint8List(planes.fold(0, (sum, plane) => sum + plane.bytes.length));
    var offset = 0;
    for (final plane in planes) {
      buffer.setRange(offset, offset + plane.bytes.length, plane.bytes);
      offset += plane.bytes.length;
    }
    return buffer;
  }

  bool _detectPhoto(List<Face> faces, String text) {
    if (faces.isNotEmpty) {
      final validFaces = faces.where((face) {
        final boundingBox = face.boundingBox;
        final faceArea = boundingBox.width * boundingBox.height;
        return faceArea > 5000;
      }).toList();

      if (validFaces.isNotEmpty) {
        return true;
      }
    }

    final cleanText = text.toUpperCase().replaceAll(RegExp(r'\s+'), ' ');

    if (RegExp(
      r'PHOTO|PHOTOGRAPH|PICTURE|IMAGE|AFFIX.*PHOTO',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      return true;
    }

    final frontIndicators = [
      RegExp(r'NAME.*[A-Z]{3,}'),
      RegExp(r'DOB|DATE.*OF.*BIRTH'),
      RegExp(r'FATHER|MOTHER'),
      RegExp(r'GENDER|SEX.*[MF]'),
    ];

    final frontMatches = frontIndicators.where((pattern) => pattern.hasMatch(cleanText)).length;

    return frontMatches >= 3;
  }

  bool _checkSideRequirement() {
    if (widget.captureType == 'front') {
      return _hasPhoto;
    } else {
      return !_hasPhoto;
    }
  }

  String _getSideValidationMessage() {
    if (widget.captureType == 'front') {
      if (!_hasPhoto) {
        return 'Please show ID FRONT side with photo';
      }
    } else {
      if (_hasPhoto) {
        return 'Please show ID BACK side';
      }
    }
    return '';
  }

  bool _isValidIdCard(String text) {
    if (!_sideMatchesRequirement) {
      _debugReason = _getSideValidationMessage();
      _debugScore = -1;
      return false;
    }

    if (text.length < 10) {
      _debugReason = 'Text too short (${text.length} chars)';
      _debugScore = 0;
      return false;
    }

    final cleanText = text.toUpperCase().replaceAll(RegExp(r'\s+'), ' ');

    // if (_isBankingCard(cleanText)) {
    //   _debugReason = 'Banking card detected';
    //   _debugScore = -1;
    //   return false;
    // }

    if (_isTaxInvoiceOrBusinessDocument(cleanText)) {
      _debugReason = 'Tax invoice/business document detected';
      _debugScore = -1;
      return false;
    }

    // First check for Emirates ID - if detected, use specialized validation
    if (_isEmiratesId(cleanText)) {
      if (widget.captureType == 'back') {
        return _isValidEmiratesIdBack(cleanText);
      } else {
        return _isValidEmiratesIdFront(cleanText);
      }
    }

    // For other ID types, use general validation
    if (widget.captureType == 'back') {
      return _isValidIdBack(cleanText);
    } else {
      return _isValidIdFront(cleanText);
    }
  }

  bool _isEmiratesId(String cleanText) {
    // Check for strong Emirates ID indicators
    final emiratesIndicators = [
      RegExp(r'UNITED ARAB EMIRATES|U\.?A\.?E|EMIRATES ID|EMIRATES IDENTITY|UAE'),
      RegExp(r'FEDERAL AUTHORITY|IDENTITY.*CITIZENSHIP|CUSTOMS.*PORT.*SECURITY|ICP'),
      RegExp(r'784-?\d{4}-?\d{7,8}-?\d'), // Emirates ID number pattern
    ];

    int emiratesMatches = emiratesIndicators.where((pattern) => pattern.hasMatch(cleanText)).length;

    return emiratesMatches >= 1; // At least one strong indicator
  }

  bool _isValidEmiratesIdFront(String cleanText) {
    int score = 0;
    List<String> reasons = [];

    // Emirates ID specific patterns
    if (RegExp(
      r'UNITED ARAB EMIRATES|U\.?A\.?E|EMIRATES ID|EMIRATES IDENTITY|UAE',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 5;
      reasons.add('UAE/Emirates ID');
    }

    if (RegExp(
      r'FEDERAL AUTHORITY|IDENTITY.*CITIZENSHIP|CUSTOMS.*PORT.*SECURITY|ICP',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 4;
      reasons.add('Emirates authority');
    }

    if (RegExp(
      r'RESIDENT.*IDENTITY.*CARD|IDENTITY.*CARD|ID.*CARD',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 3;
      reasons.add('ID document type');
    }

    // Emirates ID number pattern (784-XXXX-XXXXXXX-X)
    if (RegExp(r'784-?\d{4}-?\d{7,8}-?\d').hasMatch(cleanText)) {
      score += 6;
      reasons.add('Emirates ID number');
    }

    // Name pattern
    if (RegExp(r'NAME:?.*[A-Z][a-z]+ [A-Z][a-z]+').hasMatch(cleanText)) {
      score += 3;
      reasons.add('Name pattern');
    }

    // Date of birth pattern
    if (RegExp(r'(Date of Birth|DOB):?.*\d{1,2}[/-]\d{1,2}[/-]\d{4}').hasMatch(cleanText)) {
      score += 3;
      reasons.add('DOB pattern');
    }

    // Nationality
    if (RegExp(r'Nationality:?.*[A-Za-z]+').hasMatch(cleanText)) {
      score += 2;
      reasons.add('Nationality');
    }

    // Arabic text indicators (common in Emirates ID)
    if (RegExp(r'[ء-ي]').hasMatch(cleanText)) {
      score += 2;
      reasons.add('Arabic text');
    }

    // Card number visible
    if (RegExp(r'Card Number|Card No').hasMatch(cleanText)) {
      score += 2;
      reasons.add('Card number label');
    }

    if (_hasPhoto) {
      score += 3;
      reasons.add('Photo confirmed');
    }

    _debugScore = score;
    _debugReason = 'Emirates ID: ${reasons.join(', ')}';

    return score >= 6;
  }

  bool _isValidEmiratesIdBack(String cleanText) {
    int score = 0;
    List<String> reasons = [];

    // Specific Emirates ID back side patterns

    // 1. Machine Readable Zone (MRZ) - Very strong indicator
    if (RegExp(r'[<]{2,}|[I<][A-Z0-9<]{20,}').hasMatch(cleanText)) {
      score += 6;
      reasons.add('MRZ detected');
    }

    // 2. Emirates ID number pattern (784-XXXX-XXXXXXX-X)
    if (RegExp(r'784-?\d{4}-?\d{7,8}-?\d').hasMatch(cleanText)) {
      score += 5;
      reasons.add('Emirates ID number');
    }

    // 3. Issuing place with Dubai pattern (common format)
    if (RegExp(r'(Issuing Place|Dubai|ABU DHABI|SHARJAH|AJMAN)', caseSensitive: false).hasMatch(cleanText)) {
      score += 3;
      reasons.add('Issuing place');
    }

    // 4. Federal Authority for Identity and Citizenship
    if (RegExp(
      r'FEDERAL AUTHORITY|IDENTITY.*CITIZENSHIP|ICP|CUSTOMS.*PORT',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 4;
      reasons.add('Authority text');
    }

    // 5. Occupation/Employer text
    if (RegExp(
      r'OCCUPATION|EMPLOYER|PROFESSION|JOB',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Occupation field');
    }

    // 6. Sponsor information
    if (RegExp(
      r'SPONSOR|UNIFIED NUMBER',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Sponsor info');
    }

    // 7. Address components
    if (RegExp(
      r'(ADDRESS|P\.?O\.? BOX|AREA|CITY|EMIRATE)',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Address info');
    }

    // 8. Card number or serial number
    if (RegExp(r'(Card Number|Serial|No\.).*\d{5,}').hasMatch(cleanText)) {
      score += 2;
      reasons.add('Card/Serial number');
    }

    // 9. Multiple number sequences (typical on back)
    final numberSequences = RegExp(r'\d{5,}').allMatches(cleanText);
    if (numberSequences.length >= 2) {
      score += 2;
      reasons.add('Multiple numbers');
    }

    // 10. Arabic text presence
    final arabicPatterns = [
      RegExp(r'[ء-ي]{3,}'), // At least 3 consecutive Arabic characters
      RegExp(r'الإمارات|العربية|المتحدة|الهوية'), // UAE/Identity in Arabic
      RegExp(r'رقم|اسم|تاريخ|العنوان'), // Common Arabic ID terms
    ];

    int arabicMatches = arabicPatterns.where((p) => p.hasMatch(cleanText)).length;
    if (arabicMatches >= 1) {
      score += 3;
      reasons.add('Arabic text');
    }

    // 11. Chip indicator (smart card text)
    if (RegExp(r'(CHIP|SMART|ELECTRONIC)', caseSensitive: false).hasMatch(cleanText)) {
      score += 1;
      reasons.add('Chip card');
    }

    // 12. Date formats (issue/expiry)
    if (RegExp(r'\d{1,2}[/-]\d{1,2}[/-]\d{4}').hasMatch(cleanText)) {
      score += 2;
      reasons.add('Date pattern');
    }

    // 13. UAE/Emirates text
    if (RegExp(r'U\.?A\.?E|EMIRATES|UNITED ARAB', caseSensitive: false).hasMatch(cleanText)) {
      score += 2;
      reasons.add('UAE text');
    }

    // 14. Sufficient text length for back side
    if (cleanText.length >= 100) {
      score += 1;
      reasons.add('Sufficient text');
    }

    // 15. No photo confirmation (back side shouldn't have photo)
    if (!_hasPhoto) {
      score += 2;
      reasons.add('No photo (correct)');
    }

    // 16. Back side indicator text
    if (RegExp(r'BACK|VERSO|REVERSE|خلف', caseSensitive: false).hasMatch(cleanText)) {
      score += 1;
      reasons.add('Back indicator');
    }

    _debugScore = score;
    _debugReason = 'Emirates ID Back: ${reasons.join(', ')}';

    // Require a score of at least 8 for back side validation
    return score >= 8;
  }

  bool _isValidIdFront(String cleanText) {
    // Original general ID front validation (keep this for other ID types)
    int score = 0;
    List<String> reasons = [];

    // 1. Government/Official keywords (3 points)
    if (RegExp(
      r'REPUBLIC|STATE|MINISTRY|DEPARTMENT|AUTHORITY|COMMISSION|ELECTION|PASSPORT|DRIVING.*LICENCE',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 3;
      reasons.add('Gov keywords');
    }

    // 2. Specific ID document types (4 points)
    if (RegExp(
      r'IDENTITY\s*CARD|ID\s*CARD|PASSPORT|DRIVING.*LICEN[CS]E|VOTER.*CARD|AADHAAR|AADHAR|PAN.*CARD|NATIONAL.*ID',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 4;
      reasons.add('ID document type');
    }

    // 3. Personal identification structure (2 points)
    if (RegExp(
      r'NAME|DOB|DATE.*OF.*BIRTH|FATHER|MOTHER|GUARDIAN',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Personal info');
    }

    // 4. Date of birth pattern (2 points)
    if (RegExp(
      r'(DOB|DATE.*OF.*BIRTH|BORN).*\d{1,2}[-/]\d{1,2}[-/]\d{2,4}',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('DOB pattern');
    }

    // 5. Gender indicators (1 point)
    if (RegExp(
      r'(GENDER|SEX).*[MF]|MALE|FEMALE',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 1;
      reasons.add('Gender');
    }

    // 6. Government ID number patterns (2 points)
    if (_hasGovernmentIdPattern(cleanText)) {
      score += 2;
      reasons.add('Gov ID number');
    }

    // 7. Address on ID (1 point)
    if (RegExp(
          r'ADDRESS|RESIDENCE|PIN\s*CODE|POSTAL.*CODE',
          caseSensitive: false,
        ).hasMatch(cleanText) &&
        !RegExp(
          r'BILLING|SHIPPING|COMPANY|FIRM',
          caseSensitive: false,
        ).hasMatch(cleanText)) {
      score += 1;
      reasons.add('Residential address');
    }

    // 8. Photo/Signature confirmation (2 points)
    if (_hasPhoto) {
      score += 2;
      reasons.add('Photo confirmed');
    }

    _debugScore = score;
    _debugReason = 'General ID: ${reasons.join(', ')}';

    return score >= 6;
  }

  bool _isValidIdBack(String cleanText) {
    // Original general ID back validation (keep this for other ID types)
    int score = 0;
    List<String> reasons = [];

    // 1. Check for any numeric pattern that could be ID/Serial
    if (_hasGovernmentIdPattern(cleanText)) {
      score += 4;
      reasons.add('Gov ID pattern');
    }

    // 2. General number patterns
    if (RegExp(r'\b\d{6,}\b').hasMatch(cleanText)) {
      score += 2;
      reasons.add('Number pattern');
    }

    // 3. Serial numbers or ID numbers
    if (RegExp(
      r'SERIAL.*NO|ID.*NO|NUMBER|NO\.|رقم|مسلسل|\bNO\s*:|ID\s*:',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Serial/ID number');
    }

    // 4. Check for address information
    if (RegExp(
      r'ADDRESS|STREET|BUILDING|CITY|COUNTRY|PIN.*CODE|POSTAL|شارع|مبنى|عنوان',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Address info');
    }

    // 5. Check for authority/signature information
    if (RegExp(
      r'AUTHORITY|SIGNATURE|DIRECTOR|MANAGER|OFFICER|ISSUED|VALID|توقيع|مدير|صادر',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Authority info');
    }

    // 6. Check for barcode/mrz indicators
    if (RegExp(
      r'BARCODE|MACHINE.*READABLE|MRZ|<<|>>',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Barcode/MRZ');
    }

    // 7. Check for specific back-side phrases
    if (RegExp(
      r'ISSUE.*DATE|EXPIRY|VALID.*UNTIL|EXPIRES|تاريخ.*الإصدار|انتهاء',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 2;
      reasons.add('Date info');
    }

    // 8. Arabic-specific patterns
    final arabicPatterns = [
      RegExp(r'[ء-ي]'),
      RegExp(r'الجنسية|السفر|توقيع|بطاقة|هوية'),
      RegExp(r'رقم|مسلسل|تسلسل'),
      RegExp(r'مبنى|شارع|عنوان'),
      RegExp(r'صادر|إصدار|انتهاء'),
    ];

    int arabicMatches = arabicPatterns.where((p) => p.hasMatch(cleanText)).length;
    if (arabicMatches >= 2) {
      score += 3;
      reasons.add('Arabic ID patterns');
    }

    // 9. General text density check
    if (cleanText.length >= 50) {
      score += 1;
      reasons.add('Sufficient text');
    }

    // 10. Confirmation that no photo exists
    if (!_hasPhoto) {
      score += 1;
      reasons.add('No photo confirmed');
    }

    // 11. Common back-side keywords
    if (RegExp(
      r'BACK|VERSO|REVERSE|REAR|خلف|ظهر',
      caseSensitive: false,
    ).hasMatch(cleanText)) {
      score += 1;
      reasons.add('Back side indicator');
    }

    _debugScore = score;
    _debugReason = 'General ID Back: ${reasons.join(', ')}';

    return score >= 3;
  }

  bool _isTaxInvoiceOrBusinessDocument(String text) {
    final taxInvoicePatterns = [
      RegExp(r'TAX\s*INVOICE|INVOICE|BILL|RECEIPT', caseSensitive: false),
      RegExp(r'GST|CGST|SGST|IGST|VAT|TIN', caseSensitive: false),
      RegExp(r'INVOICE\s*NO|BILL\s*NO|RECEIPT\s*NO', caseSensitive: false),
      RegExp(
        r'COMPANY|CORPORATION|ENTERPRISE|FIRM|BUSINESS',
        caseSensitive: false,
      ),
      RegExp(r'VENDOR|SUPPLIER|CUSTOMER|CLIENT', caseSensitive: false),
      RegExp(r'AMOUNT|TOTAL|SUBTOTAL|DISCOUNT|PAYABLE', caseSensitive: false),
      RegExp(r'PRICE|RATE|QUANTITY|QTY|UNIT', caseSensitive: false),
      RegExp(r'PAYMENT|DUE|BALANCE|CREDIT|DEBIT', caseSensitive: false),
      RegExp(r'GSTIN|CIN|UDYAM|MSME', caseSensitive: false),
      RegExp(r'DESCRIPTION|ITEM|SERVICE|PRODUCT|GOODS', caseSensitive: false),
    ];

    int businessPatternCount = taxInvoicePatterns.where((pattern) => pattern.hasMatch(text)).length;

    return businessPatternCount >= 3;
  }

  bool _hasGovernmentIdPattern(String text) {
    final govIdPatterns = [
      RegExp(r'\b\d{4}\s*\d{4}\s*\d{4}\b'),
      RegExp(r'\b[A-Z]{5}\d{4}[A-Z]\b'),
      RegExp(r'\b[A-Z]{2}\d{2}\s*\d{11}\b'),
      RegExp(r'\b[A-Z]{3}\d{7}\b'),
      RegExp(r'\b[A-Z]\d{7}\b'),
      RegExp(r'\b[A-Z]{2,4}\d{6,12}\b'),
      // Added Emirates ID pattern
      RegExp(r'784-?\d{4}-?\d{7,8}-?\d'),
    ];

    return govIdPatterns.any((pattern) => pattern.hasMatch(text)) && !RegExp(r'\d{4}\s*\d{4}\s*\d{4}\s*\d{4}').hasMatch(text);
  }

  bool _isBankingCard(String text) {
    final bankingPatterns = [
      RegExp(
        r'VISA|MASTERCARD|AMEX|AMERICAN EXPRESS|RuPay',
        caseSensitive: false,
      ),
      RegExp(r'DEBIT|CREDIT|ATM|BANK.*CARD', caseSensitive: false),
      RegExp(r'VALID THRU|EXPIRES|EXP.*\d{2}/\d{2}', caseSensitive: false),
      RegExp(r'\d{4}\s*\d{4}\s*\d{4}\s*\d{4}'),
      RegExp(r'CVV|CVC|CHIP|CONTACTLESS', caseSensitive: false),
    ];

    return bankingPatterns.any((pattern) => pattern.hasMatch(text));
  }

  Future<void> _captureIdImage() async {
    if (_isCapturing) return;

    try {
      setState(() {
        _isCapturing = true;
        _statusMessage = 'Capturing complete ID...';
      });

      final image = await _cameraController!.takePicture();

      // In manual mode, detect text blocks before cropping
      if (!_isAutoCapture) {
        await _detectTextBlocksForCropping(image);
      }

      // Crop image in both auto and manual modes
      final finalImage = await _cropIdCard(image);

      if (!mounted) return;

      setState(() {
        _capturedImage = finalImage;
        _verificationComplete = true;
        _statusMessage = 'Complete ID captured successfully!';
      });

      widget.onCompleted(_capturedImage);

      Get.back();
    } catch (e) {
      setState(() {
        _statusMessage = 'Capture error';
        _isCapturing = false;
      });
      debugPrint('Capture error: $e');
    }
  }

  Future<void> _detectTextBlocksForCropping(XFile image) async {
    try {
      final bytes = await image.readAsBytes();
      final inputImage = InputImage.fromFilePath(image.path);

      final recognizedText = await _textRecognizer.processImage(inputImage);

      if (mounted) {
        setState(() {
          _textBlocks = recognizedText.blocks;
        });
      }
    } catch (e) {
      debugPrint('Text detection for cropping error: $e');
    }
  }

  Future<XFile> _cropIdCard(XFile image) async {
    try {
      final bytes = await image.readAsBytes();
      var decodedImage = img.decodeImage(bytes)!;

      if (_textBlocks.isNotEmpty) {
        double minX = double.infinity;
        double minY = double.infinity;
        double maxX = 0;
        double maxY = 0;

        for (final block in _textBlocks) {
          final rect = block.boundingBox;
          minX = math.min(minX, rect.left);
          minY = math.min(minY, rect.top);
          maxX = math.max(maxX, rect.right);
          maxY = math.max(maxY, rect.bottom);
        }

        final cropLeft = minX.clamp(0, decodedImage.width - 1).toInt();
        final cropTop = minY.clamp(0, decodedImage.height - 1).toInt();
        final cropRight = maxX.clamp(0, decodedImage.width).toInt();
        final cropBottom = maxY.clamp(0, decodedImage.height).toInt();

        final cropWidth = cropRight - cropLeft;
        final cropHeight = cropBottom - cropTop;

        if (cropWidth > 100 && cropHeight > 100) {
          final cropped = img.copyCrop(
            decodedImage,
            x: cropLeft,
            y: cropTop,
            width: cropWidth,
            height: cropHeight,
          );

          final enhanced = img.adjustColor(
            cropped,
            contrast: 1.2,
            brightness: 1.1,
          );

          final tempFile = File('${Directory.systemTemp.path}/cropped_id_${DateTime.now().millisecondsSinceEpoch}.jpg');
          await tempFile.writeAsBytes(img.encodeJpg(enhanced));

          return XFile(tempFile.path);
        }
      }

      final cropWidth = (decodedImage.width * 0.8).toInt();
      final cropHeight = (decodedImage.height * 0.6).toInt();
      final x = (decodedImage.width - cropWidth) ~/ 2;
      final y = (decodedImage.height - cropHeight) ~/ 2;

      final cropped = img.copyCrop(
        decodedImage,
        x: x,
        y: y,
        width: cropWidth,
        height: cropHeight,
      );

      final enhanced = img.adjustColor(
        cropped,
        contrast: 1.2,
        brightness: 1.1,
      );

      final tempFile = File('${Directory.systemTemp.path}/cropped_id_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await tempFile.writeAsBytes(img.encodeJpg(enhanced));

      return XFile(tempFile.path);
    } catch (e) {
      debugPrint('Cropping error: $e');
      return image;
    }
  }

  void _checkVerificationStatus() {
    if (_isAutoCapture && _sideMatchesRequirement && _idCardDetected && !_verificationComplete) {
      setState(() {
        _statusMessage = 'Complete ID detected. Capturing...';
      });
      _captureIdImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.captureType == 'front' ? 'ID Front' : 'ID Back'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (_statusMessage.toLowerCase() == "camera permission denied" || _statusMessage == "no cameras available")
                ? [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _statusMessage,
                      style: TS.f16.copyWith(color: Colors.red),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                        style: ButtonStyle(),
                        onPressed: () async {
                          await openAppSettings();
                          Get.back();
                        },
                        child: Text(
                          "Go to Settings",
                          style: TS.f16.copyWith(color: AppConfigs.primaryColor),
                        ))
                  ]
                : [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    Text(_statusMessage),
                  ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: CameraPreview(_cameraController!)),

          // Header with back button and title
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      widget.captureType == 'front' ? 'ID Front' : 'ID Back',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                  ],
                ),
                // Auto/Manual toggle button
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: _toggleCaptureMode,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _isAutoCapture ? Icons.center_focus_strong_rounded : Icons.touch_app,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Text(
                          _isAutoCapture ? 'Auto' : 'Manual',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ID card overlay
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + (_isAutoCapture ? 100 : 180),
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: (MediaQuery.of(context).size.width * 0.85) / 1.586,
                // ID card ratio (CR80: 85.6mm × 53.98mm ≈ 1.586:1)
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _isAutoCapture ? (_sideMatchesRequirement && _idCardDetected ? Colors.green : Colors.white) : Colors.white,
                    width: 1.8,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.captureType == 'front' ? Icons.person : Icons.credit_card,
                      color: _isAutoCapture ? (_sideMatchesRequirement && _idCardDetected ? Colors.green : Colors.white) : Colors.white,
                      size: 40,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.captureType == 'front' ? 'ALIGN ID FRONT (WITH PHOTO)' : 'ALIGN ID BACK (WITHOUT PHOTO)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _isAutoCapture ? (_sideMatchesRequirement && _idCardDetected ? Colors.green : Colors.white) : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _isAutoCapture ? 'Keep some distance for full capture' : 'Tap capture button when ready',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _isAutoCapture ? (_sideMatchesRequirement && _idCardDetected ? Colors.green : Colors.white) : Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Manual capture button
          if (!_isAutoCapture)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 80,
              left: 0,
              right: 0,
              child: Center(
                child: GestureDetector(
                  onTap: _isCapturing ? null : _captureIdImage,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: _isCapturing
                        ? Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          )
                        : Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                            size: 35,
                          ),
                  ),
                ),
              ),
            ),

          // Status overlay
          Positioned(
            top: MediaQuery.of(context).padding.top + 100,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    _isAutoCapture ? (!_sideMatchesRequirement ? _getSideValidationMessage() : _statusMessage) : _statusMessage,
                    style: TextStyle(
                      color: _isAutoCapture && !_sideMatchesRequirement ? Colors.red : Colors.white,
                    ),
                  ),
                  if (kDebugMode && _isAutoCapture) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Photo: ${_hasPhoto ? 'Detected' : 'Not Detected'} | Score: $_debugScore | $_debugReason',
                      style: const TextStyle(color: Colors.yellow, fontSize: 12),
                    ),
                    Text(
                      'Faces: ${_detectedFaces.length}',
                      style: const TextStyle(color: Colors.yellow, fontSize: 12),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
