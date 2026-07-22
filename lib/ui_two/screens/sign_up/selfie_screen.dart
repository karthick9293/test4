import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:permission_handler/permission_handler.dart';

class SelfieScreen extends StatefulWidget {
  final Function(XFile)? onCaptured;

  const SelfieScreen({super.key, this.onCaptured});

  @override
  State<SelfieScreen> createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen> with WidgetsBindingObserver {
  CameraController? _cameraController;
  FaceDetector? _faceDetector;

  bool _isInitialized = false;
  bool _isProcessing = false;
  bool _faceDetected = false;
  bool _verificationComplete = false;
  bool _imageCaptured = false;

  String _statusMessage = 'Initializing camera...';
  List<Face> _faces = [];
  InputImageRotation _rotation = InputImageRotation.rotation0deg;

  // Timer for stable face detection
  Timer? _faceStabilityTimer;
  int _stableFaceCount = 0;
  static const int _requiredStableFrames = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
    _initializeDetectors();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _faceStabilityTimer?.cancel();
    _cameraController?.dispose();
    _faceDetector?.close();
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

      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid ? ImageFormatGroup.yuv420 : ImageFormatGroup.bgra8888,
      );

      await _cameraController!.initialize();
      _determineRotation();

      if (!mounted) return;

      setState(() {
        _isInitialized = true;
        _statusMessage = 'Position your face in the frame';
      });

      _startImageStream();
    } catch (e) {
      setState(() => _statusMessage = 'Camera error: ${e.toString()}');
      debugPrint('Camera error: $e');
    }
  }

  void _initializeDetectors() {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
        enableLandmarks: true,
        enableContours: false,
        enableClassification: false,
        enableTracking: true,
        minFaceSize: 0.15,
      ),
    );
  }

  void _determineRotation() {
    final sensorOrientation = _cameraController?.description.sensorOrientation ?? 0;
    _rotation = InputImageRotationValue.fromRawValue(sensorOrientation) ?? InputImageRotation.rotation0deg;
  }

  void _startImageStream() {
    _cameraController!.startImageStream((CameraImage image) {
      if (!_isProcessing && !_verificationComplete && !_imageCaptured) {
        _isProcessing = true;
        _processImage(image).whenComplete(() {
          if (mounted) _isProcessing = false;
        });
      }
    });
  }

  Future<void> _processImage(CameraImage image) async {
    if (!mounted) return;

    try {
      final inputImage = _convertCameraImage(image);
      if (inputImage == null) return;

      await _detectFaces(inputImage);
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

    final nv21 = Uint8List((image.width * image.height * 1.5).toInt());

    // Copy Y plane
    for (int i = 0; i < image.height; i++) {
      final yStart = i * image.width;
      final yRowStart = i * yPlane.bytesPerRow;
      final yRowEnd = yRowStart + image.width;
      final yLength = min(image.width, yPlane.bytes.length - yRowStart);

      if (yLength > 0) {
        nv21.setRange(yStart, yStart + yLength, yPlane.bytes, yRowStart);
      }
    }

    // Calculate UV pixel stride (how many bytes to skip between pixels)
    // For YUV420, UV planes are subsampled by 2 in both dimensions
    final uvPixelStride = uPlane.bytesPerRow ~/ (image.width ~/ 2);

    // Interleave V and U planes
    var uvIndex = 0;
    var nv21Index = image.width * image.height; // Start after Y plane

    for (int row = 0; row < image.height / 2; row++) {
      for (int col = 0; col < image.width / 2; col++) {
        if (uvIndex < vPlane.bytes.length && nv21Index < nv21.length) {
          nv21[nv21Index] = vPlane.bytes[uvIndex]; // V
        }

        if (uvIndex < uPlane.bytes.length && nv21Index + 1 < nv21.length) {
          nv21[nv21Index + 1] = uPlane.bytes[uvIndex]; // U
        }

        uvIndex += uvPixelStride;
        nv21Index += 2;
      }

      // Move to next row in source planes
      uvIndex = (row + 1) * uPlane.bytesPerRow;
    }

    return nv21;
  }

  Uint8List _concatenatePlanes(List<Plane> planes) {
    final buffer = Uint8List(planes.fold(0, (sum, plane) => sum + plane.bytes.length));
    var offset = 0;
    for (final plane in planes) {
      final length = plane.bytes.length;
      buffer.setRange(offset, offset + length, plane.bytes);
      offset += length;
    }
    return buffer;
  }

  Future<void> _detectFaces(InputImage inputImage) async {
    try {
      final faces = await _faceDetector!.processImage(inputImage);
      debugPrint('Detected ${faces.length} faces');

      bool validFaceFound = false;
      if (faces.isNotEmpty) {
        final face = faces.first;
        debugPrint('Face bounds: ${face.boundingBox}');
        validFaceFound = _isValidFace(face);
      }

      if (mounted) {
        setState(() {
          _faces = faces;
          _faceDetected = validFaceFound;
        });
      }
    } catch (e) {
      debugPrint('Face detection error: $e');
    }
  }

  bool _isValidFace(Face face) {
    final boundingBox = face.boundingBox;
    final faceSize = boundingBox.width * boundingBox.height;
    final imageSize = _cameraController!.value.previewSize!.width * _cameraController!.value.previewSize!.height;

    // Face should be at least 8% of the image area
    final sizeCheck = faceSize > imageSize * 0.08;

    // Check if face is centered
    final centerX = boundingBox.center.dx;
    final centerY = boundingBox.center.dy;
    final imageCenterX = _cameraController!.value.previewSize!.width / 2;
    final imageCenterY = _cameraController!.value.previewSize!.height / 2;

    final distanceFromCenter = ((centerX - imageCenterX).abs() + (centerY - imageCenterY).abs()) / 2;
    final maxDistance = (imageCenterX + imageCenterY) / 4; // Allow some flexibility
    final centerCheck = distanceFromCenter < maxDistance;

    // Check head rotation (looking straight)
    final headEulerAngleY = face.headEulerAngleY ?? 0;
    final headEulerAngleZ = face.headEulerAngleZ ?? 0;
    final rotationCheck = headEulerAngleY.abs() < 15 && headEulerAngleZ.abs() < 15;

    return sizeCheck && centerCheck && rotationCheck;
  }

  void _checkVerificationStatus() {
    if (_faceDetected && !_verificationComplete && !_imageCaptured) {
      _stableFaceCount++;

      if (_stableFaceCount >= _requiredStableFrames) {
        if (mounted) {
          setState(() {
            _statusMessage = 'Perfect! Capturing image...';
          });
        }

        // Capture image after a short delay
        Future.delayed(const Duration(milliseconds: 500), () {
          _captureImage();
        });
      } else {
        if (mounted) {
          setState(() {
            _statusMessage = 'Hold steady... $_stableFaceCount/$_requiredStableFrames';
          });
        }
      }
    } else if (!_faceDetected) {
      _stableFaceCount = 0; // Reset counter when face is not detected
      if (mounted) {
        setState(() {
          _statusMessage = 'Please position your face in the frame';
        });
      }
    }
  }

  Future<void> _captureImage() async {
    if (_imageCaptured || _cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      if (mounted) {
        setState(() {
          _imageCaptured = true;
          _statusMessage = 'Capturing image...';
        });
      }

      // Stop the image stream before capturing
      await _cameraController!.stopImageStream();

      // Capture the image
      final XFile imageFile = await _cameraController!.takePicture();

      if (mounted) {
        setState(() {
          _statusMessage = 'Image captured successfully!';
          _verificationComplete = true;
        });
      }

      // Call the callback with the captured image
      if (widget.onCaptured != null) {
        widget.onCaptured!(imageFile);
      }

      Get.back();

      // Show verification result after a short delay
      // if (mounted) {
      //   Future.delayed(const Duration(seconds: 1), () {
      //     _showVerificationResult(imageFile);
      //   });
      // }
    } catch (e) {
      debugPrint('Error capturing image: $e');
      if (mounted) {
        setState(() {
          _statusMessage = 'Failed to capture image. Please try again.';
          _imageCaptured = false;
        });
      }

      // Restart image stream if capture failed
      _startImageStream();
    }
  }

  // void _showVerificationResult(XFile? imageFile) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => AlertDialog(
  //       title: const Row(
  //         children: [
  //           Icon(Icons.check_circle, color: Colors.green),
  //           SizedBox(width: 10),
  //           Text('Verification Complete'),
  //         ],
  //       ),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Text('✓ Face verification: Passed'),
  //           const Text('✓ Image captured: Success'),
  //           const SizedBox(height: 10),
  //           const Text(
  //             'Your face has been successfully verified and image captured.',
  //           ),
  //           if (imageFile != null) ...[
  //             const SizedBox(height: 10),
  //             Text(
  //               'Image path: ${imageFile.path}',
  //               style: TextStyle(fontSize: 12, color: Colors.grey[600]),
  //             ),
  //           ],
  //         ],
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('Continue'),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //             _retakeImage();
  //           },
  //           child: const Text('Retake'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // void _retakeImage() {
  //   setState(() {
  //     _imageCaptured = false;
  //     _verificationComplete = false;
  //     _faceDetected = false;
  //     _stableFaceCount = 0;
  //     _statusMessage = 'Position your face in the frame';
  //   });
  //   _startImageStream();
  // }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Face Verification'),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
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
          FaceOverlay(
            faceDetected: _faceDetected,
            imageCaptured: _imageCaptured,
            stableCount: _stableFaceCount,
            requiredStableFrames: _requiredStableFrames,
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 60,
            left: 20,
            right: 20,
            child: VerificationStatus(
              faceDetected: _faceDetected,
              statusMessage: _statusMessage,
              imageCaptured: _imageCaptured,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    'Instructions:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• Position your face in the center of frame\n'
                    '• Make sure your face is clearly visible\n'
                    '• Hold steady - image will be captured automatically\n'
                    '• Keep your face in frame for $_requiredStableFrames stable detections',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FaceOverlay extends StatelessWidget {
  final bool faceDetected;
  final bool imageCaptured;
  final int stableCount;
  final int requiredStableFrames;

  const FaceOverlay({
    super.key,
    required this.faceDetected,
    required this.imageCaptured,
    required this.stableCount,
    required this.requiredStableFrames,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    Color borderColor = Colors.white;
    if (imageCaptured) {
      borderColor = Colors.blue;
    } else if (faceDetected) {
      borderColor = Colors.green;
    }

    return Positioned(
      top: topPadding + 120,
      left: size.width * 0.15,
      right: size.width * 0.15,
      child: Container(
        height: size.height * 0.4,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageCaptured) ...[
              const Icon(Icons.camera_alt, size: 60, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'IMAGE CAPTURED',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ] else if (faceDetected) ...[
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: stableCount / requiredStableFrames,
                    strokeWidth: 4,
                    color: Colors.green,
                    backgroundColor: Colors.green.withOpacity(0.3),
                  ),
                  const Icon(Icons.face, size: 40, color: Colors.green),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'FACE DETECTED',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$stableCount/$requiredStableFrames',
                style: const TextStyle(color: Colors.green, fontSize: 14),
              ),
            ] else ...[
              const Icon(
                Icons.face_retouching_natural,
                size: 60,
                color: Colors.white,
              ),
              const SizedBox(height: 16),
              const Text(
                'FACE VERIFICATION',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class VerificationStatus extends StatelessWidget {
  final bool faceDetected;
  final String statusMessage;
  final bool imageCaptured;

  const VerificationStatus({
    super.key,
    required this.faceDetected,
    required this.statusMessage,
    required this.imageCaptured,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildStatusIndicator('Face Detection', faceDetected),
          const SizedBox(height: 8),
          _buildStatusIndicator('Image Capture', imageCaptured),
          const SizedBox(height: 12),
          Text(
            statusMessage,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusIndicator(String label, bool completed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.green : Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: completed ? Colors.green : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
