import 'dart:async';
import 'dart:io' show Platform;
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/flavours/constants.dart';

class VideoKYCScreen extends StatefulWidget {
  final Function(XFile) onVideoCaptured;

  const VideoKYCScreen({super.key, required this.onVideoCaptured});

  @override
  State<VideoKYCScreen> createState() => _VideoKYCScreenState();
}

class _VideoKYCScreenState extends State<VideoKYCScreen> {
  CameraController? _controller;
  FaceDetector? _faceDetector;

  bool _isInitialized = false;
  bool _isProcessing = false;
  bool _isRecording = false;
  bool _faceDetected = false;
  bool _recordingComplete = false;
  bool _isDisposed = false;
  bool _canStartRecording = false;

  String _status = 'Position your face in view';
  int _countdown = 5;
  Timer? _timer;
  Timer? _faceLostTimer;

  InputImageRotation _rotation = InputImageRotation.rotation0deg;

  // Detection bounds
  Rect? _detectedFaceBounds;

  // Track if image stream is running
  bool _isImageStreamRunning = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    _initializeDetectors();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      if (mounted) setState(() => _status = 'No cameras available');
      return;
    }

    final status = await Permission.camera.request();
    if (!status.isGranted) {
      if (mounted) setState(() => _status = 'Camera permission denied');
      return;
    }

    final micStatus = await Permission.microphone.request();
    if (!micStatus.isGranted) {
      if (mounted) setState(() => _status = 'Mic permission denied');
      return;
    }

    final camera = cameras.firstWhere(
      (c) => c.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    // Device-specific resolution selection
    ResolutionPreset resolution = _getOptimalResolution();
    ImageFormatGroup imageFormat = _getOptimalImageFormat();

    _controller = CameraController(
      camera,
      resolution,
      enableAudio: false,
      imageFormatGroup: imageFormat,
    );

    try {
      await _controller!.initialize();
      _determineRotation();
      if (mounted) {
        setState(() => _isInitialized = true);
        await Future.delayed(Duration(milliseconds: 500));
        _startImageStream();
      }
    } catch (e) {
      debugPrint('Camera initialization error: $e');
      // Try fallback settings
      await _tryFallbackCameraSettings(camera);
    }
  }

  // Get optimal resolution based on device capabilities
  ResolutionPreset _getOptimalResolution() {
    return ResolutionPreset.medium;
  }

  // Get optimal image format based on platform
  ImageFormatGroup _getOptimalImageFormat() {
    if (Platform.isAndroid) {
      return ImageFormatGroup.nv21;
    } else {
      return ImageFormatGroup.bgra8888;
    }
  }

  // Fallback camera settings for problematic devices
  Future<void> _tryFallbackCameraSettings(CameraDescription camera) async {
    try {
      _controller?.dispose();

      _controller = CameraController(
        camera,
        ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid ? ImageFormatGroup.yuv420 : ImageFormatGroup.bgra8888,
      );

      await _controller!.initialize();
      _determineRotation();

      if (mounted) {
        setState(() => _isInitialized = true);
        await Future.delayed(Duration(milliseconds: 500));
        _startImageStream();
      }
    } catch (e) {
      debugPrint('Fallback camera initialization failed: $e');
      if (mounted) setState(() => _status = 'Camera initialization failed: $e');
    }
  }

  void _determineRotation() {
    final sensorOrientation = _controller?.description.sensorOrientation ?? 0;
    if (Platform.isAndroid) {
      _rotation = InputImageRotationValue.fromRawValue(sensorOrientation) ?? InputImageRotation.rotation0deg;
    } else {
      _rotation = InputImageRotation.rotation90deg;
    }
  }

  void _initializeDetectors() {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        performanceMode: FaceDetectorMode.accurate,
        minFaceSize: 0.15,
        enableLandmarks: true,
        enableClassification: false,
        enableTracking: false,
      ),
    );
  }

  void _startImageStream() {
    if (_controller == null || _isDisposed || !_controller!.value.isInitialized || _isImageStreamRunning) {
      return;
    }

    try {
      DateTime? lastProcessTime;
      _controller!.startImageStream((image) {
        _isImageStreamRunning = true;
        final now = DateTime.now();
        if (lastProcessTime == null || now.difference(lastProcessTime!) > Duration(milliseconds: 500)) {
          lastProcessTime = now;
          if (!_isProcessing && !_isRecording && !_recordingComplete) {
            _isProcessing = true;
            _processImage(image);
          }
        }
      });
    } catch (e) {
      debugPrint('Error starting image stream: $e');
      _isImageStreamRunning = false;
      if (mounted) setState(() => _status = 'Failed to start camera stream');
    }
  }

  // Safe method to stop image stream
  Future<void> _stopImageStreamSafely() async {
    if (_controller != null && _controller!.value.isStreamingImages && _isImageStreamRunning) {
      try {
        await _controller!.stopImageStream();
        _isImageStreamRunning = false;
        debugPrint('Image stream stopped successfully');
      } catch (e) {
        debugPrint('Error stopping image stream: $e');
        _isImageStreamRunning = false;
      }
    } else {
      debugPrint('Image stream not running or already stopped');
      _isImageStreamRunning = false;
    }
  }

  Future<void> _processImage(CameraImage image) async {
    if (_isDisposed || !mounted) {
      _isProcessing = false;
      return;
    }

    try {
      final inputImage = _convertCameraImage(image);
      if (inputImage != null && !_isDisposed && mounted) {
        // Process face detection only
        final faces = await _faceDetector!.processImage(inputImage);

        if (!_isDisposed && mounted) {
          await _detectFaces(faces, inputImage);
          _updateStatus();
        }
      }
    } catch (e) {
      debugPrint('Error processing image: $e');
    } finally {
      _isProcessing = false;
    }
  }

  InputImage? _convertCameraImage(CameraImage image) {
    try {
      if (Platform.isAndroid) {
        if (image.format.group == ImageFormatGroup.yuv420) {
          return _convertYUV420Image(image);
        } else if (image.format.group == ImageFormatGroup.nv21) {
          return _convertNV21Image(image);
        } else {
          return _convertGenericImage(image);
        }
      } else {
        return _convertIOSImage(image);
      }
    } catch (e) {
      debugPrint('Image conversion error: $e');
      return null;
    }
  }

  InputImage? _convertYUV420Image(CameraImage image) {
    try {
      final nv21Bytes = _yuv420ToNv21(image);
      final rotation = _getProperRotation();

      return InputImage.fromBytes(
        bytes: nv21Bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: rotation,
          format: InputImageFormat.nv21,
          bytesPerRow: image.planes[0].bytesPerRow,
        ),
      );
    } catch (e) {
      debugPrint('YUV420 conversion error: $e');
      return null;
    }
  }

  InputImage? _convertNV21Image(CameraImage image) {
    try {
      return InputImage.fromBytes(
        bytes: image.planes[0].bytes,
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: _getProperRotation(),
          format: InputImageFormat.nv21,
          bytesPerRow: image.planes[0].bytesPerRow,
        ),
      );
    } catch (e) {
      debugPrint('NV21 conversion error: $e');
      return null;
    }
  }

  InputImage? _convertGenericImage(CameraImage image) {
    try {
      final format = InputImageFormatValue.fromRawValue(image.format.raw);
      if (format == null) {
        debugPrint('Unsupported image format: ${image.format.raw}');
        return null;
      }

      return InputImage.fromBytes(
        bytes: _concatenatePlanes(image.planes),
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: _getProperRotation(),
          format: format,
          bytesPerRow: image.planes[0].bytesPerRow,
        ),
      );
    } catch (e) {
      debugPrint('Generic conversion error: $e');
      return null;
    }
  }

  InputImage? _convertIOSImage(CameraImage image) {
    try {
      return InputImage.fromBytes(
        bytes: _concatenatePlanes(image.planes),
        metadata: InputImageMetadata(
          size: Size(image.width.toDouble(), image.height.toDouble()),
          rotation: InputImageRotation.rotation90deg,
          format: InputImageFormat.bgra8888,
          bytesPerRow: image.planes[0].bytesPerRow,
        ),
      );
    } catch (e) {
      debugPrint('iOS conversion error: $e');
      return null;
    }
  }

  Uint8List _yuv420ToNv21(CameraImage image) {
    try {
      final yPlane = image.planes[0];
      final uPlane = image.planes[1];
      final vPlane = image.planes[2];

      final nv21 = Uint8List((image.width * image.height * 1.5).toInt());

      for (int i = 0; i < image.height; i++) {
        final yStart = i * image.width;
        final yRowStart = i * yPlane.bytesPerRow;
        final yLength = min(image.width, yPlane.bytes.length - yRowStart);

        if (yLength > 0 && yStart + yLength <= nv21.length) {
          nv21.setRange(yStart, yStart + yLength, yPlane.bytes, yRowStart);
        }
      }

      final uvPixelStride = max(1, uPlane.bytesPerRow ~/ max(1, (image.width ~/ 2)));
      var nv21Index = image.width * image.height;

      for (int row = 0; row < image.height ~/ 2; row++) {
        for (int col = 0; col < image.width ~/ 2; col++) {
          final uvIndex = row * uPlane.bytesPerRow + col * uvPixelStride;

          if (uvIndex < vPlane.bytes.length && uvIndex < uPlane.bytes.length && nv21Index + 1 < nv21.length) {
            nv21[nv21Index] = vPlane.bytes[uvIndex];
            nv21[nv21Index + 1] = uPlane.bytes[uvIndex];
            nv21Index += 2;
          }
        }
      }

      return nv21;
    } catch (e) {
      debugPrint('YUV420 to NV21 conversion error: $e');
      return Uint8List((image.width * image.height * 1.5).toInt());
    }
  }

  Uint8List _concatenatePlanes(List<Plane> planes) {
    final WriteBuffer allBytes = WriteBuffer();
    for (final plane in planes) {
      allBytes.putUint8List(plane.bytes);
    }
    return allBytes.done().buffer.asUint8List();
  }

  InputImageRotation _getProperRotation() {
    final sensorOrientation = _controller?.description.sensorOrientation ?? 0;

    if (Platform.isAndroid) {
      final deviceOrientation = MediaQuery.of(context).orientation;

      int rotationDegrees = sensorOrientation;

      if (deviceOrientation == Orientation.landscape) {
        rotationDegrees += 90;
      }

      rotationDegrees = rotationDegrees % 360;

      switch (rotationDegrees) {
        case 0:
          return InputImageRotation.rotation0deg;
        case 90:
          return InputImageRotation.rotation90deg;
        case 180:
          return InputImageRotation.rotation180deg;
        case 270:
          return InputImageRotation.rotation270deg;
        default:
          return InputImageRotation.rotation0deg;
      }
    } else {
      return _controller?.description.lensDirection == CameraLensDirection.front
          ? InputImageRotation.rotation270deg
          : InputImageRotation.rotation90deg;
    }
  }

  Future<void> _detectFaces(List<Face> faces, InputImage inputImage) async {
    if (_isDisposed || !mounted) return;

    try {
      // Face detection
      bool faceDetected = false;
      Rect? faceBounds;

      if (faces.isNotEmpty) {
        final validFace = _isValidFace(faces.first);
        if (validFace) {
          faceDetected = true;
          faceBounds = _convertBounds(faces.first.boundingBox, inputImage.metadata!.size);
        }
      }

      if (!_isDisposed && mounted) {
        setState(() {
          _faceDetected = faceDetected;
          _detectedFaceBounds = faceBounds;
        });
      }
    } catch (e) {
      debugPrint('Face detection error: $e');
      if (!_isDisposed && mounted) {
        setState(() {
          _faceDetected = false;
          _detectedFaceBounds = null;
        });
      }
    }
  }

  bool _isValidFace(Face face) {
    final bounds = face.boundingBox;
    final previewSize = _controller!.value.previewSize!;
    final faceArea = bounds.width * bounds.height;
    final imageArea = previewSize.width * previewSize.height;
    return faceArea > imageArea * 0.03;
  }

  Rect _convertBounds(Rect bounds, Size imageSize) {
    final screenSize = MediaQuery.of(context).size;
    final previewSize = _controller!.value.previewSize!;

    final scaleX = screenSize.width / previewSize.height;
    final scaleY = screenSize.height / previewSize.width;

    return Rect.fromLTWH(
      bounds.left * scaleX,
      bounds.top * scaleY,
      bounds.width * scaleX,
      bounds.height * scaleY,
    );
  }

  void _updateStatus() {
    if (!mounted || _isDisposed) return;

    if (_faceDetected && !_isRecording && !_recordingComplete) {
      if (!_canStartRecording) {
        _canStartRecording = true;
        setState(() => _status = 'Face detected! Starting recording...');
        debugPrint('Starting recording immediately - face detected');
        _startRecording();
      }
    } else if (!_faceDetected && _isRecording) {
      // Face lost during recording - start timer to stop recording
      _faceLostTimer ??= Timer(Duration(seconds: 5), () {
        if (!_faceDetected && _isRecording && !_isDisposed && mounted) {
          debugPrint('Face lost for 5 seconds - stopping recording');
          _stopRecording();
        }
        _faceLostTimer = null;
      });
      setState(() => _status = 'Face lost. Recording will stop soon...');
    } else if (!_faceDetected) {
      _canStartRecording = false;
      setState(() => _status = 'Position your face in view');
    }
  }

  Future<void> _startRecording() async {
    debugPrint('_startRecording called - isRecording: $_isRecording, isDisposed: $_isDisposed, mounted: $mounted');

    if (!mounted || _isDisposed || _isRecording || !_controller!.value.isInitialized) {
      debugPrint('Recording conditions not met');
      return;
    }

    try {
      debugPrint('Stopping image stream...');
      await _stopImageStreamSafely();
      await Future.delayed(Duration(milliseconds: 500));

      debugPrint('Starting video recording...');
      await _controller!.startVideoRecording();
      debugPrint('Video recording started successfully');

      if (!_isDisposed && mounted) {
        setState(() {
          _isRecording = true;
          _status = 'Recording video... Keep your face in view';
          _countdown = 5;
          _canStartRecording = false;
        });
      }

      _timer?.cancel();
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (!_isDisposed && mounted && _isRecording) {
          setState(() => _countdown--);
          debugPrint('Recording countdown: $_countdown');
          if (_countdown <= 0) {
            timer.cancel();
            _stopRecording();
          }
        } else {
          timer.cancel();
        }
      });
    } catch (e) {
      debugPrint('Recording start error: $e');
      if (!_isDisposed && mounted) {
        setState(() {
          _status = 'Recording failed: ${e.toString()}. Tap to retry.';
          _isRecording = false;
          _canStartRecording = false;
        });

        try {
          await Future.delayed(Duration(milliseconds: 500));
          _startImageStream();
        } catch (streamError) {
          debugPrint('Error restarting image stream: $streamError');
        }
      }
    }
  }

  Future<void> _stopRecording() async {
    if (!mounted || _isDisposed || !_isRecording) return;

    try {
      final video = await _controller!.stopVideoRecording();
      if (!_isDisposed && mounted) {
        setState(() {
          _isRecording = false;
          _recordingComplete = true;
          _status = 'Video captured successfully!';
        });

        widget.onVideoCaptured(video);
        Get.back();
      }
    } catch (e) {
      debugPrint('Recording stop error: $e');
      if (!_isDisposed && mounted) {
        setState(() {
          _status = 'Failed to save video: ${e.toString()}. Try again.';
          _isRecording = false;
          _recordingComplete = false;
          _canStartRecording = false;
        });

        try {
          await Future.delayed(Duration(milliseconds: 500));
          _startImageStream();
        } catch (streamError) {
          debugPrint('Error restarting image stream: $streamError');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Video KYC'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (_status == "Mic permission denied" || _status == "Camera permission denied")
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
                      _status,
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
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(_status),
                  ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Camera preview - Full screen
          Positioned.fill(
            child: CameraPreview(_controller!),
          ),

          // Face detection frame
          if (_detectedFaceBounds != null)
            Positioned(
              left: _detectedFaceBounds!.left,
              top: _detectedFaceBounds!.top,
              width: _detectedFaceBounds!.width,
              height: _detectedFaceBounds!.height,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _faceDetected ? Colors.green : Colors.red,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: -30,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _faceDetected ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'FACE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Back button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Recording indicator
          if (_isRecording)
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, color: Colors.white, size: 12),
                    SizedBox(width: 5),
                    Text(
                      'REC ${_countdown}s',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Status bar
          Positioned(
            top: MediaQuery.of(context).padding.top + 60,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatusIcon('Face', _faceDetected),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    _status,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Instructions at bottom
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 40,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isRecording
                        ? 'Keep your face in view! Recording $_countdown seconds remaining...'
                        : 'Position your face in view.\nRecording starts automatically when face is detected and stops when face is lost.',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  if (_status.contains('failed') || _status.contains('Tap to retry'))
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _canStartRecording = false;
                            _status = 'Position your face in view';
                          });
                          _startImageStream();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Retry Recording'),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Debug info panel (only in debug mode)
          if (kDebugMode)
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 160,
              left: 10,
              right: 10,
              child: Container(
                constraints: BoxConstraints(maxHeight: 120),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.yellow, width: 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'DEBUG INFO:',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Face: $_faceDetected | Recording: $_isRecording',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text(
                        'Countdown: $_countdown | Can Start: $_canStartRecording',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusIcon(String label, bool detected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            detected ? Icons.check_circle : Icons.radio_button_unchecked,
            color: detected ? Colors.green : Colors.grey,
            size: 16,
          ),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: detected ? Colors.green : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    _timer?.cancel();
    _timer = null;
    _faceLostTimer?.cancel();
    _faceLostTimer = null;

    try {
      _stopImageStreamSafely();
    } catch (e) {
      debugPrint('Error stopping image stream in dispose: $e');
    }

    _controller?.dispose();
    _controller = null;

    _faceDetector?.close();
    _faceDetector = null;

    super.dispose();
  }
}

// import 'dart:async';
// import 'dart:io' show Platform;
// import 'dart:math';
// import 'package:camera/camera.dart';
// import 'package:mobiremit/others/constants.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:permission_handler/permission_handler.dart';

// class VideoKYCScreen extends StatefulWidget {
//   final Function(XFile) onVideoCaptured;

//   const VideoKYCScreen({super.key, required this.onVideoCaptured});

//   @override
//   State<VideoKYCScreen> createState() => _VideoKYCScreenState();
// }

// class _VideoKYCScreenState extends State<VideoKYCScreen> {
//   CameraController? _controller;
//   FaceDetector? _faceDetector;
//   TextRecognizer? _textRecognizer;

//   bool _isInitialized = false;
//   bool _isProcessing = false;
//   bool _isRecording = false;
//   bool _faceDetected = false;
//   bool _idDetected = false;
//   bool _recordingComplete = false;
//   bool _isDisposed = false;
//   bool _canStartRecording = false;

//   String _status = 'Position face and ID card in view';
//   String _detectedIdType = '';
//   int _countdown = 3;
//   Timer? _timer;

//   InputImageRotation _rotation = InputImageRotation.rotation0deg;

//   // Detection bounds
//   Rect? _detectedFaceBounds;
//   Rect? _detectedIdBounds;
//   String _detectedIdText = '';

//   // ID validation properties
//   bool _hasPhoto = false;
//   String _debugReason = '';
//   int _debugScore = 0;

//   String _lastDetectedText = '';
//   String _detectionLog = '';
//   List<String> _allDetectedBlocks = [];

//   // Track if image stream is running
//   bool _isImageStreamRunning = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//     _initializeDetectors();
//   }

//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     if (cameras.isEmpty) {
//       if (mounted) setState(() => _status = 'No cameras available');
//       return;
//     }

//     final status = await Permission.camera.request();
//     if (!status.isGranted) {
//       if (mounted) setState(() => _status = 'Camera permission denied');
//       return;
//     }

//     await Permission.microphone.request();

//     final camera = cameras.firstWhere(
//       (c) => c.lensDirection == CameraLensDirection.front,
//       orElse: () => cameras.first,
//     );

//     // Device-specific resolution selection
//     ResolutionPreset resolution = _getOptimalResolution();
//     ImageFormatGroup imageFormat = _getOptimalImageFormat();

//     _controller = CameraController(
//       camera,
//       resolution,
//       enableAudio: false,
//       imageFormatGroup: imageFormat,
//     );

//     try {
//       await _controller!.initialize();
//       _determineRotation();
//       if (mounted) {
//         setState(() => _isInitialized = true);
//         await Future.delayed(Duration(milliseconds: 500));
//         _startImageStream();
//       }
//     } catch (e) {
//       debugPrint('Camera initialization error: $e');
//       // Try fallback settings
//       await _tryFallbackCameraSettings(camera);
//     }
//   }

//   // Get optimal resolution based on device capabilities
//   ResolutionPreset _getOptimalResolution() {
//     return ResolutionPreset.medium;
//   }

//   // Get optimal image format based on platform
//   ImageFormatGroup _getOptimalImageFormat() {
//     if (Platform.isAndroid) {
//       return ImageFormatGroup.nv21;
//     } else {
//       return ImageFormatGroup.bgra8888;
//     }
//   }

//   // Fallback camera settings for problematic devices
//   Future<void> _tryFallbackCameraSettings(CameraDescription camera) async {
//     try {
//       _controller?.dispose();

//       _controller = CameraController(
//         camera,
//         ResolutionPreset.low,
//         enableAudio: false,
//         imageFormatGroup: Platform.isAndroid
//             ? ImageFormatGroup.yuv420
//             : ImageFormatGroup.bgra8888,
//       );

//       await _controller!.initialize();
//       _determineRotation();

//       if (mounted) {
//         setState(() => _isInitialized = true);
//         await Future.delayed(Duration(milliseconds: 500));
//         _startImageStream();
//       }
//     } catch (e) {
//       debugPrint('Fallback camera initialization failed: $e');
//       if (mounted) setState(() => _status = 'Camera initialization failed: $e');
//     }
//   }

//   void _determineRotation() {
//     final sensorOrientation = _controller?.description.sensorOrientation ?? 0;
//     if (Platform.isAndroid) {
//       _rotation = InputImageRotationValue.fromRawValue(sensorOrientation) ??
//           InputImageRotation.rotation0deg;
//     } else {
//       _rotation = InputImageRotation.rotation90deg;
//     }
//   }

//   void _initializeDetectors() {
//     _faceDetector = FaceDetector(
//       options: FaceDetectorOptions(
//         performanceMode: FaceDetectorMode.accurate,
//         minFaceSize: 0.15,
//         enableLandmarks: true,
//         enableClassification: false,
//         enableTracking: false,
//       ),
//     );

//     _textRecognizer = TextRecognizer(
//       script: TextRecognitionScript.latin,
//     );
//   }

//   void _startImageStream() {
//     if (_controller == null ||
//         _isDisposed ||
//         !_controller!.value.isInitialized ||
//         _isImageStreamRunning) {
//       // Check if already running
//       return;
//     }

//     try {
//       DateTime? lastProcessTime;
//       _controller!.startImageStream((image) {
//         _isImageStreamRunning = true; // Mark as running
//         final now = DateTime.now();
//         if (lastProcessTime == null ||
//             now.difference(lastProcessTime!) > Duration(milliseconds: 500)) {
//           lastProcessTime = now;
//           if (!_isProcessing && !_isRecording && !_recordingComplete) {
//             _isProcessing = true;
//             _processImage(image);
//           }
//         }
//       });
//     } catch (e) {
//       debugPrint('Error starting image stream: $e');
//       _isImageStreamRunning = false; //  Reset on error
//       if (mounted) setState(() => _status = 'Failed to start camera stream');
//     }
//   }

//   //  Safe method to stop image stream
//   Future<void> _stopImageStreamSafely() async {
//     if (_controller != null &&
//         _controller!.value.isStreamingImages &&
//         _isImageStreamRunning) {
//       try {
//         await _controller!.stopImageStream();
//         _isImageStreamRunning = false;
//         debugPrint('Image stream stopped successfully');
//       } catch (e) {
//         debugPrint('Error stopping image stream: $e');
//         _isImageStreamRunning = false;
//       }
//     } else {
//       debugPrint('Image stream not running or already stopped');
//       _isImageStreamRunning = false;
//     }
//   }

//   Future<void> _processImage(CameraImage image) async {
//     if (_isDisposed || !mounted) {
//       _isProcessing = false;
//       return;
//     }

//     try {
//       final inputImage = _convertCameraImage(image);
//       if (inputImage != null && !_isDisposed && mounted) {
//         // Process face and text detection
//         final faces = await _faceDetector!.processImage(inputImage);
//         final recognizedText = await _textRecognizer!.processImage(inputImage);

//         if (!_isDisposed && mounted) {
//           _logDetectedText(recognizedText);

//           await _detectFacesAndID(faces, recognizedText, inputImage);
//           _updateStatus();
//         }
//       }
//     } catch (e) {
//       debugPrint('Error processing image: $e');
//     } finally {
//       _isProcessing = false;
//     }
//   }

//   void _logDetectedText(RecognizedText recognizedText) {
//     final allText = recognizedText.blocks.map((block) => block.text).join(' ');
//     if (allText != _lastDetectedText && allText.isNotEmpty) {
//       _lastDetectedText = allText;
//       debugPrint('=== DETECTED TEXT ===');
//       debugPrint('Full text: $allText');

//       _allDetectedBlocks =
//           recognizedText.blocks.map((block) => block.text).toList();
//       for (int i = 0; i < _allDetectedBlocks.length; i++) {
//         debugPrint('Block $i: ${_allDetectedBlocks[i]}');
//       }
//       debugPrint('====================');
//     }
//   }

//   void _handleImageProcessingFallback() {
//     _reinitializeCameraWithDifferentSettings();
//   }

//   Future<void> _reinitializeCameraWithDifferentSettings() async {
//     try {
//       await _stopImageStreamSafely(); //  Use safe stop
//       await _controller?.dispose();

//       final cameras = await availableCameras();
//       final camera = cameras.firstWhere(
//         (c) => c.lensDirection == CameraLensDirection.front,
//         orElse: () => cameras.first,
//       );

//       _controller = CameraController(
//         camera,
//         ResolutionPreset.low,
//         enableAudio: false,
//         imageFormatGroup: Platform.isAndroid
//             ? ImageFormatGroup.nv21
//             : ImageFormatGroup.bgra8888,
//       );

//       await _controller!.initialize();
//       _determineRotation();

//       if (mounted) {
//         setState(() => _isInitialized = true);
//         await Future.delayed(Duration(milliseconds: 500));
//         _startImageStream();
//       }
//     } catch (e) {
//       debugPrint('Fallback camera initialization error: $e');
//     }
//   }

//   InputImage? _convertCameraImage(CameraImage image) {
//     try {
//       if (Platform.isAndroid) {
//         if (image.format.group == ImageFormatGroup.yuv420) {
//           return _convertYUV420Image(image);
//         } else if (image.format.group == ImageFormatGroup.nv21) {
//           return _convertNV21Image(image);
//         } else {
//           return _convertGenericImage(image);
//         }
//       } else {
//         return _convertIOSImage(image);
//       }
//     } catch (e) {
//       debugPrint('Image conversion error: $e');
//       return null;
//     }
//   }

//   InputImage? _convertYUV420Image(CameraImage image) {
//     try {
//       final nv21Bytes = _yuv420ToNv21(image);
//       final rotation = _getProperRotation();

//       return InputImage.fromBytes(
//         bytes: nv21Bytes,
//         metadata: InputImageMetadata(
//           size: Size(image.width.toDouble(), image.height.toDouble()),
//           rotation: rotation,
//           format: InputImageFormat.nv21,
//           bytesPerRow: image.planes[0].bytesPerRow,
//         ),
//       );
//     } catch (e) {
//       debugPrint('YUV420 conversion error: $e');
//       return null;
//     }
//   }

//   InputImage? _convertNV21Image(CameraImage image) {
//     try {
//       return InputImage.fromBytes(
//         bytes: image.planes[0].bytes,
//         metadata: InputImageMetadata(
//           size: Size(image.width.toDouble(), image.height.toDouble()),
//           rotation: _getProperRotation(),
//           format: InputImageFormat.nv21,
//           bytesPerRow: image.planes[0].bytesPerRow,
//         ),
//       );
//     } catch (e) {
//       debugPrint('NV21 conversion error: $e');
//       return null;
//     }
//   }

//   InputImage? _convertGenericImage(CameraImage image) {
//     try {
//       final format = InputImageFormatValue.fromRawValue(image.format.raw);
//       if (format == null) {
//         debugPrint('Unsupported image format: ${image.format.raw}');
//         return null;
//       }

//       return InputImage.fromBytes(
//         bytes: _concatenatePlanes(image.planes),
//         metadata: InputImageMetadata(
//           size: Size(image.width.toDouble(), image.height.toDouble()),
//           rotation: _getProperRotation(),
//           format: format,
//           bytesPerRow: image.planes[0].bytesPerRow,
//         ),
//       );
//     } catch (e) {
//       debugPrint('Generic conversion error: $e');
//       return null;
//     }
//   }

//   InputImage? _convertIOSImage(CameraImage image) {
//     try {
//       return InputImage.fromBytes(
//         bytes: _concatenatePlanes(image.planes),
//         metadata: InputImageMetadata(
//           size: Size(image.width.toDouble(), image.height.toDouble()),
//           rotation: InputImageRotation.rotation90deg,
//           format: InputImageFormat.bgra8888,
//           bytesPerRow: image.planes[0].bytesPerRow,
//         ),
//       );
//     } catch (e) {
//       debugPrint('iOS conversion error: $e');
//       return null;
//     }
//   }

//   Uint8List _yuv420ToNv21(CameraImage image) {
//     try {
//       final yPlane = image.planes[0];
//       final uPlane = image.planes[1];
//       final vPlane = image.planes[2];

//       final nv21 = Uint8List((image.width * image.height * 1.5).toInt());

//       for (int i = 0; i < image.height; i++) {
//         final yStart = i * image.width;
//         final yRowStart = i * yPlane.bytesPerRow;
//         final yLength = min(image.width, yPlane.bytes.length - yRowStart);

//         if (yLength > 0 && yStart + yLength <= nv21.length) {
//           nv21.setRange(yStart, yStart + yLength, yPlane.bytes, yRowStart);
//         }
//       }

//       final uvPixelStride =
//           max(1, uPlane.bytesPerRow ~/ max(1, (image.width ~/ 2)));
//       var nv21Index = image.width * image.height;

//       for (int row = 0; row < image.height ~/ 2; row++) {
//         for (int col = 0; col < image.width ~/ 2; col++) {
//           final uvIndex = row * uPlane.bytesPerRow + col * uvPixelStride;

//           if (uvIndex < vPlane.bytes.length &&
//               uvIndex < uPlane.bytes.length &&
//               nv21Index + 1 < nv21.length) {
//             nv21[nv21Index] = vPlane.bytes[uvIndex];
//             nv21[nv21Index + 1] = uPlane.bytes[uvIndex];
//             nv21Index += 2;
//           }
//         }
//       }

//       return nv21;
//     } catch (e) {
//       debugPrint('YUV420 to NV21 conversion error: $e');
//       return Uint8List((image.width * image.height * 1.5).toInt());
//     }
//   }

//   Uint8List _concatenatePlanes(List<Plane> planes) {
//     final WriteBuffer allBytes = WriteBuffer();
//     for (final plane in planes) {
//       allBytes.putUint8List(plane.bytes);
//     }
//     return allBytes.done().buffer.asUint8List();
//   }

//   InputImageRotation _getProperRotation() {
//     final sensorOrientation = _controller?.description.sensorOrientation ?? 0;

//     if (Platform.isAndroid) {
//       final deviceOrientation = MediaQuery.of(context).orientation;

//       int rotationDegrees = sensorOrientation;

//       if (deviceOrientation == Orientation.landscape) {
//         rotationDegrees += 90;
//       }

//       rotationDegrees = rotationDegrees % 360;

//       switch (rotationDegrees) {
//         case 0:
//           return InputImageRotation.rotation0deg;
//         case 90:
//           return InputImageRotation.rotation90deg;
//         case 180:
//           return InputImageRotation.rotation180deg;
//         case 270:
//           return InputImageRotation.rotation270deg;
//         default:
//           return InputImageRotation.rotation0deg;
//       }
//     } else {
//       return _controller?.description.lensDirection == CameraLensDirection.front
//           ? InputImageRotation.rotation270deg
//           : InputImageRotation.rotation90deg;
//     }
//   }

//   Future<void> _detectFacesAndID(List<Face> faces,
//       RecognizedText recognizedText, InputImage inputImage) async {
//     if (_isDisposed || !mounted) return;

//     try {
//       // Face detection
//       bool faceDetected = false;
//       Rect? faceBounds;

//       if (faces.isNotEmpty) {
//         final validFace = _isValidFace(faces.first);
//         if (validFace) {
//           faceDetected = true;
//           faceBounds = _convertBounds(
//               faces.first.boundingBox, inputImage.metadata!.size);
//         }
//       }

//       // ID detection with enhanced validation
//       final fullText =
//           recognizedText.blocks.map((block) => block.text).join(' ');
//       final validationResult =
//           _findValidIdBlock(recognizedText, faces, fullText);

//       if (!_isDisposed && mounted) {
//         setState(() {
//           _faceDetected = faceDetected;
//           _detectedFaceBounds = faceBounds;
//           _idDetected = validationResult['isValid'] ?? false;
//           _detectedIdType = validationResult['idType'] ?? '';
//           _detectedIdBounds = validationResult['block'] != null
//               ? _convertBounds(validationResult['block'].boundingBox,
//                   inputImage.metadata!.size)
//               : null;
//           _detectedIdText = validationResult['block']?.text ?? '';
//         });
//       }
//     } catch (e) {
//       debugPrint('Detection error: $e');
//       if (!_isDisposed && mounted) {
//         setState(() {
//           _faceDetected = false;
//           _detectedFaceBounds = null;
//           _idDetected = false;
//           _detectedIdBounds = null;
//           _detectedIdText = '';
//           _detectedIdType = '';
//         });
//       }
//     }
//   }

//   Map<String, dynamic> _findValidIdBlock(
//       RecognizedText recognizedText, List<Face> faces, String fullText) {
//     debugPrint(
//         'Finding valid ID block from ${recognizedText.blocks.length} blocks');

//     // First validate the full text
//     final validationResult = _isValidIdFront(fullText, faces);

//     if (!validationResult['isValid']) {
//       debugPrint('Full text validation failed: $_debugReason');
//       return {'isValid': false, 'idType': '', 'block': null};
//     }

//     // Find the best text block
//     TextBlock? bestBlock;
//     double bestScore = 0;
//     String detectedIdType = validationResult['idType'] ?? '';

//     for (int i = 0; i < recognizedText.blocks.length; i++) {
//       final block = recognizedText.blocks[i];
//       if (block.text.length < 3) continue;

//       final blockSize = block.boundingBox.width * block.boundingBox.height;
//       final textScore =
//           _calculateImprovedBlockScore(block.text, detectedIdType);
//       final sizeScore = min(1.0, blockSize / 10000);
//       final combinedScore = textScore * (0.7 + 0.3 * sizeScore);

//       debugPrint(
//           'Block $i: "${block.text}" - Text score: $textScore, Size score: $sizeScore, Combined: $combinedScore');

//       if (combinedScore > bestScore && combinedScore > 0.1) {
//         bestScore = combinedScore;
//         bestBlock = block;
//       }
//     }

//     debugPrint('Best block selected with score: $bestScore');

//     return {
//       'isValid': bestBlock != null,
//       'idType': detectedIdType,
//       'block': bestBlock,
//     };
//   }

//   double _calculateImprovedBlockScore(String text, String idType) {
//     final cleanText = text.toUpperCase().replaceAll(RegExp(r'[^\w\s]'), ' ');

//     if (idType == 'PAN') {
//       return _calculatePanBlockScore(cleanText);
//     } else if (idType == 'AADHAAR') {
//       return _calculateAadhaarBlockScore(cleanText);
//     } else if (idType == 'EMIRATES_ID') {
//       return _calculateEmiratesIdBlockScore(cleanText);
//     } else {
//       return _calculateGeneralBlockScore(cleanText);
//     }
//   }

//   double _calculatePanBlockScore(String text) {
//     double score = 0;

//     if (RegExp(r'PAN|PERMANENT|ACCOUNT').hasMatch(text)) score += 0.4;
//     if (RegExp(r'[A-Z]{5}\d{4}[A-Z]').hasMatch(text)) score += 0.4;
//     if (RegExp(r'FATHER|MOTHER|NAME').hasMatch(text)) score += 0.3;
//     if (RegExp(r'SIGNATURE|INCOME|TAX').hasMatch(text)) score += 0.2;

//     return min(1.0, score);
//   }

//   double _calculateAadhaarBlockScore(String text) {
//     double score = 0;

//     if (RegExp(r'AADHAAR|AADHAR').hasMatch(text)) score += 0.4;
//     if (RegExp(r'\d{4}\s*\d{4}\s*\d{4}').hasMatch(text)) score += 0.4;
//     if (RegExp(r'GOVT.*INDIA|UNIQUE').hasMatch(text)) score += 0.3;
//     if (RegExp(r'NAME|DOB|ADDRESS').hasMatch(text)) score += 0.2;

//     return min(1.0, score);
//   }

//   //  Emirates ID specific scoring
//   double _calculateEmiratesIdBlockScore(String text) {
//     double score = 0;

//     // High priority Emirates ID patterns
//     if (RegExp(r'UNITED.*ARAB.*EMIRATES|U\.?A\.?E\.?').hasMatch(text)) {
//       score += 0.6;
//     }
//     if (RegExp(r'IDENTITY.*CARD|RESIDENT.*IDENTITY').hasMatch(text)) {
//       score += 0.5;
//     }
//     if (RegExp(r'FEDERAL.*AUTHORITY').hasMatch(text)) score += 0.4;
//     if (RegExp(r'\d{3}-\d{4}-\d{7}-\d').hasMatch(text)) {
//       score += 0.6; // ID number pattern
//     }
//     if (RegExp(r'CITIZENSHIP|CUSTOMS|PORT.*SECURITY').hasMatch(text)) {
//       score += 0.3;
//     }
//     if (RegExp(r'NATIONALITY|INDIA|INDIAN').hasMatch(text)) score += 0.2;
//     if (RegExp(r'DATE.*BIRTH|ISSUING|EXPIRY').hasMatch(text)) score += 0.2;

//     return min(1.0, score);
//   }

//   double _calculateGeneralBlockScore(String text) {
//     double score = 0;

//     if (RegExp(r'NAME|FATHER|MOTHER').hasMatch(text)) score += 0.3;
//     if (RegExp(r'ADDRESS|RESIDENCE').hasMatch(text)) score += 0.2;
//     if (RegExp(r'DOB|DATE.*BIRTH').hasMatch(text)) score += 0.2;
//     if (RegExp(r'GOVT|GOVERNMENT|STATE').hasMatch(text)) score += 0.2;
//     if (_hasAnyIdNumberPattern(text)) score += 0.3;

//     return min(1.0, score);
//   }

//   String _preprocessTextForRecognition(String text) {
//     return text
//         .toUpperCase()
//         .replaceAll(RegExp(r'[^\w\s]'), ' ')
//         .replaceAll(RegExp(r'\s+'), ' ')
//         .trim();
//   }

//   double _calculatePositionScore(Rect boundingBox) {
//     final screenSize = MediaQuery.of(context).size;
//     final centerX = screenSize.width / 2;
//     final centerY = screenSize.height / 2;

//     final blockCenterX = boundingBox.left + boundingBox.width / 2;
//     final blockCenterY = boundingBox.top + boundingBox.height / 2;

//     final distanceFromCenter =
//         sqrt(pow(blockCenterX - centerX, 2) + pow(blockCenterY - centerY, 2));

//     final maxDistance = sqrt(pow(centerX, 2) + pow(centerY, 2));
//     return 1.0 - (distanceFromCenter / maxDistance);
//   }

//   double _calculateIdBlockScore(String text, String idType) {
//     final cleanText = text.toUpperCase().replaceAll(RegExp(r'\s+'), ' ');
//     double score = 0;

//     if (idType == 'PAN') {
//       if (RegExp(r'PAN|PERMANENT.*ACCOUNT|INCOME.*TAX|TAX.*DEPARTMENT')
//           .hasMatch(cleanText)) {
//         score += 0.4;
//       }

//       if (RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]').hasMatch(cleanText)) {
//         score += 0.4;
//       }

//       if (RegExp(r'FATHER|MOTHER|NAME|SIGNATURE').hasMatch(cleanText)) {
//         score += 0.2;
//       }

//       return score;
//     }

//     if (RegExp(
//             r'REPUBLIC|STATE|MINISTRY|DEPARTMENT|AUTHORITY|COMMISSION|ELECTION|PASSPORT|DRIVING.*LICENCE')
//         .hasMatch(cleanText)) {
//       score += 0.3;
//     }

//     if (RegExp(
//             r'IDENTITY\s*CARD|ID\s*CARD|PASSPORT|DRIVING.*LICEN[CS]E|VOTER.*CARD|AADHAAR|AADHAR|NATIONAL.*ID')
//         .hasMatch(cleanText)) {
//       score += 0.4;
//     }

//     if (RegExp(r'NAME|DOB|DATE.*OF.*BIRTH|FATHER|MOTHER|GUARDIAN')
//         .hasMatch(cleanText)) {
//       score += 0.2;
//     }

//     if (_hasGovernmentIdPattern(cleanText)) {
//       score += 0.2;
//     }

//     return score;
//   }

//   bool _detectPhoto(List<Face> faces, String text) {
//     // For Emirates ID and other documents, assume they have photos
//     // This makes detection faster and more reliable
//     return true;
//   }

//   Map<String, dynamic> _isValidIdFront(String text, List<Face> faces) {
//     if (text.length < 5) {
//       _debugReason = 'Text too short (${text.length} chars)';
//       _debugScore = 0;
//       return {'isValid': false, 'idType': ''};
//     }

//     final cleanText = text
//         .toUpperCase()
//         .replaceAll(RegExp(r'[^\w\s]'), ' ')
//         .replaceAll(RegExp(r'\s+'), ' ');
//     debugPrint('Clean text for validation: $cleanText');

//     //  Enhanced logging for verification scores
//     _logVerificationScores(cleanText, faces);

//     // Exclude obvious non-ID documents first
//     if (_isBankingCard(cleanText) ||
//         _isTaxInvoiceOrBusinessDocument(cleanText)) {
//       _debugReason = 'Banking card or business document detected';
//       _debugScore = -1;
//       return {'isValid': false, 'idType': ''};
//     }

//     // Check for specific ID types with more lenient criteria
//     String detectedIdType = _detectSpecificIdType(cleanText);
//     if (detectedIdType.isNotEmpty) {
//       _debugReason = '$detectedIdType detected via specific patterns';
//       _debugScore = 10;
//       return {'isValid': true, 'idType': detectedIdType};
//     }

//     // Fallback to general ID detection with lower threshold
//     final score = _calculateGeneralIdScore(cleanText, faces);
//     final isValid = score >= 3;

//     _debugScore = score;
//     debugPrint(
//         'ID validation score: $score, isValid: $isValid, reason: $_debugReason');

//     return {
//       'isValid': isValid,
//       'idType': 'GENERAL',
//     };
//   }

//   //  Enhanced logging for verification scores
//   void _logVerificationScores(String cleanText, List<Face> faces) {
//     DevLog.i('=== VERIFICATION SCORE BREAKDOWN ===');
//     DevLog.i(
//         'Text being analyzed: ${cleanText.substring(0, min(100, cleanText.length))}...');

//     // Check specific ID types
//     final idTypes = [
//       'EMIRATES_ID',
//       'PAN',
//       'AADHAAR',
//       'DRIVING_LICENSE',
//       'PASSPORT',
//       'VOTER_ID'
//     ];
//     for (final idType in idTypes) {
//       bool detected = false;
//       switch (idType) {
//         case 'EMIRATES_ID':
//           detected = _isEmiratesId(cleanText);
//           break;
//         case 'PAN':
//           detected = _isPanCardImproved(cleanText);
//           break;
//         case 'AADHAAR':
//           detected = _isAadhaarCard(cleanText);
//           break;
//         case 'DRIVING_LICENSE':
//           detected = _isDrivingLicense(cleanText);
//           break;
//         case 'PASSPORT':
//           detected = _isPassport(cleanText);
//           break;
//         case 'VOTER_ID':
//           detected = _isVoterId(cleanText);
//           break;
//       }
//       DevLog.i('$idType: $detected');
//     }

//     // Calculate and log general score breakdown
//     final generalScore = _calculateDetailedGeneralIdScore(cleanText, faces);
//     DevLog.i('General ID Score: $generalScore');
//     DevLog.i('================================');
//   }

//   //  Detailed general ID score calculation for logging
//   int _calculateDetailedGeneralIdScore(String cleanText, List<Face> faces) {
//     int score = 0;
//     List<String> reasons = [];

//     DevLog.i('--- Detailed General ID Score Calculation ---');

//     // 1. Government/Official indicators (2 points)
//     if (RegExp(
//             r'GOVERNMENT|GOVT|STATE|MINISTRY|DEPARTMENT|AUTHORITY|COMMISSION|REPUBLIC|INDIA')
//         .hasMatch(cleanText)) {
//       score += 2;
//       reasons.add('Gov indicators (+2)');
//       DevLog.i('✓ Government indicators found');
//     }

//     // 2. Personal information structure (2 points)
//     final personalInfoPatterns = [
//       RegExp(r'NAME'),
//       RegExp(r'FATHER|MOTHER|GUARDIAN'),
//       RegExp(r'DOB|DATE.*OF.*BIRTH|BORN'),
//       RegExp(r'ADDRESS|RESIDENCE'),
//       RegExp(r'SIGNATURE'),
//     ];

//     int personalMatches = personalInfoPatterns
//         .where((pattern) => pattern.hasMatch(cleanText))
//         .length;
//     if (personalMatches >= 2) {
//       score += 2;
//       reasons.add('Personal info ($personalMatches matches) (+2)');
//       DevLog.i('✓ Personal info: $personalMatches matches');
//     } else {
//       DevLog.i('✗ Personal info: only $personalMatches matches (need 2)');
//     }

//     // 3. Date patterns (1 point)
//     if (RegExp(r'\d{1,2}[-/]\d{1,2}[-/]\d{2,4}|\d{2}-\d{2}-\d{4}')
//         .hasMatch(cleanText)) {
//       score += 1;
//       reasons.add('Date pattern (+1)');
//       DevLog.i('✓ Date pattern found');
//     } else {
//       DevLog.i('✗ No date pattern found');
//     }

//     // 4. ID number patterns (1 point)
//     if (_hasAnyIdNumberPattern(cleanText)) {
//       score += 1;
//       reasons.add('ID number pattern (+1)');
//       DevLog.i('✓ ID number pattern found');
//     } else {
//       DevLog.i('✗ No ID number pattern found');
//     }

//     // 5. Document structure indicators (1 point)
//     if (RegExp(r'CARD|CERTIFICATE|LICENSE|PERMIT').hasMatch(cleanText)) {
//       score += 1;
//       reasons.add('Document type (+1)');
//       DevLog.i('✓ Document type indicator found');
//     } else {
//       DevLog.i('✗ No document type indicator found');
//     }

//     DevLog.i('Total Score: $score');
//     DevLog.i('Breakdown: ${reasons.join(", ")}');
//     DevLog.i('--- End Detailed Calculation ---');

//     _debugReason = reasons.join(', ');
//     return score;
//   }

//   //  Add Emirates ID detection at the top for priority
//   String _detectSpecificIdType(String cleanText) {
//     // Emirates ID detection - HIGH PRIORITY
//     if (_isEmiratesId(cleanText)) {
//       debugPrint('🎯 Emirates ID detected with high confidence');
//       return 'EMIRATES_ID';
//     }

//     // PAN Card detection - more flexible
//     if (_isPanCardImproved(cleanText)) {
//       debugPrint('🎯 PAN Card detected');
//       return 'PAN';
//     }

//     // Aadhaar Card detection
//     if (_isAadhaarCard(cleanText)) {
//       debugPrint('🎯 Aadhaar Card detected');
//       return 'AADHAAR';
//     }

//     // Driving License detection
//     if (_isDrivingLicense(cleanText)) {
//       debugPrint('🎯 Driving License detected');
//       return 'DRIVING_LICENSE';
//     }

//     // Passport detection
//     if (_isPassport(cleanText)) {
//       debugPrint('🎯 Passport detected');
//       return 'PASSPORT';
//     }

//     // Voter ID detection
//     if (_isVoterId(cleanText)) {
//       debugPrint('🎯 Voter ID detected');
//       return 'VOTER_ID';
//     }

//     debugPrint('🎯 No specific ID type detected');
//     return '';
//   }

//   //  Emirates ID detection function
//   bool _isEmiratesId(String text) {
//     // Multiple strong indicators for Emirates ID
//     final emiratesIndicators = [
//       RegExp(r'UNITED\s*ARAB\s*EMIRATES', caseSensitive: false),
//       RegExp(r'U\.?\s*A\.?\s*E\.?', caseSensitive: false),
//       RegExp(r'EMIRATES\s*ID', caseSensitive: false),
//       RegExp(r'IDENTITY\s*CARD', caseSensitive: false),
//       RegExp(r'FEDERAL\s*AUTHORITY', caseSensitive: false),
//       RegExp(r'RESIDENT\s*IDENTITY', caseSensitive: false),
//       RegExp(r'\d{3}-\d{4}-\d{7}-\d'), // ID number pattern: 784-1979-4817160-4
//       RegExp(r'CITIZENSHIP\s*&?\s*CUSTOMS', caseSensitive: false),
//       RegExp(r'PORT\s*SECURITY', caseSensitive: false),
//     ];

//     int matches =
//         emiratesIndicators.where((pattern) => pattern.hasMatch(text)).length;

//     // Also check for common Emirates ID text elements
//     final emiratesTexts = [
//       'IDENTITY',
//       'CARD',
//       'RESIDENT',
//       'FEDERAL',
//       'AUTHORITY',
//       'CITIZENSHIP',
//       'CUSTOMS',
//       'PORT',
//       'SECURITY',
//       'NATIONALITY'
//     ];

//     int textMatches = emiratesTexts.where((word) => text.contains(word)).length;

//     debugPrint(
//         'Emirates ID detection - Pattern matches: $matches, Text matches: $textMatches');

//     // Very lenient detection for Emirates ID - only need 1 strong match or 3 text matches
//     return matches >= 1 || textMatches >= 3;
//   }

//   bool _isPanCardImproved(String text) {
//     final panIndicators = [
//       RegExp(r'PAN\b'),
//       RegExp(r'PERMANENT\s+ACCOUNT'),
//       RegExp(r'INCOME\s+TAX'),
//       RegExp(r'TAX\s+DEPARTMENT'),
//       RegExp(r'GOVT\s+OF\s+INDIA.*INCOME'),
//       RegExp(r'[A-Z]{5}\d{4}[A-Z]'),
//     ];

//     int matches =
//         panIndicators.where((pattern) => pattern.hasMatch(text)).length;

//     final panTexts = [
//       'FATHER',
//       'MOTHER',
//       'NAME',
//       'SIGNATURE',
//       'PERMANENT',
//       'ACCOUNT',
//       'NUMBER'
//     ];
//     int textMatches = panTexts.where((word) => text.contains(word)).length;

//     debugPrint(
//         'PAN detection - Pattern matches: $matches, Text matches: $textMatches');

//     return matches >= 1 || textMatches >= 3;
//   }

//   bool _isAadhaarCard(String text) {
//     return RegExp(r'AADHAAR|AADHAR|\d{4}\s*\d{4}\s*\d{4}(?!\s*\d{4})')
//             .hasMatch(text) ||
//         text.contains('UNIQUE IDENTIFICATION') ||
//         text.contains('GOVT OF INDIA');
//   }

//   bool _isDrivingLicense(String text) {
//     return RegExp(r'DRIVING\s*LICEN[CS]E|DL\s*NO|TRANSPORT').hasMatch(text) ||
//         text.contains('MOTOR VEHICLE') ||
//         text.contains('VALIDITY');
//   }

//   bool _isPassport(String text) {
//     return RegExp(r'PASSPORT|REPUBLIC\s+OF\s+INDIA|TYPE\s*P|PLACE\s+OF\s+BIRTH')
//         .hasMatch(text);
//   }

//   bool _isVoterId(String text) {
//     return RegExp(r'ELECTION\s+COMMISSION|VOTER|EPIC\s+NO|CONSTITUENCY')
//         .hasMatch(text);
//   }

//   int _calculateGeneralIdScore(String cleanText, List<Face> faces) {
//     return _calculateDetailedGeneralIdScore(cleanText, faces);
//   }

//   bool _hasAnyIdNumberPattern(String text) {
//     final idPatterns = [
//       RegExp(r'[A-Z]{5}\d{4}[A-Z]'), // PAN
//       RegExp(r'\d{3}-\d{4}-\d{7}-\d'), //  Emirates ID pattern
//       RegExp(r'\d{4}\s*\d{4}\s*\d{4}(?!\s*\d{4})'), // Aadhaar
//       RegExp(r'[A-Z]{2}\d{2}\s*\d{7,}'), // Voter ID
//       RegExp(r'[A-Z]\d{7}'), // Passport
//       RegExp(r'[A-Z]{2}\d{13}'), // Driving License
//       RegExp(r'\b\d{8,15}\b'), // General long numbers
//     ];

//     return idPatterns.any((pattern) => pattern.hasMatch(text));
//   }

//   bool _isPanCard(String text) {
//     final cleanText = text.toUpperCase().replaceAll(RegExp(r'\s+'), ' ');

//     bool hasPanKeywords = RegExp(
//             r'PAN|PERMANENT.*ACCOUNT.*NUMBER|INCOME.*TAX|TAX.*DEPARTMENT|GOVT.*OF.*INDIA.*INCOME.*TAX',
//             caseSensitive: false)
//         .hasMatch(cleanText);

//     bool hasPanNumber = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]').hasMatch(cleanText);

//     bool hasPersonalInfo =
//         RegExp(r'NAME|FATHER|MOTHER|SIGNATURE').hasMatch(cleanText);

//     return hasPanKeywords && (hasPanNumber || hasPersonalInfo);
//   }

//   bool _hasGovernmentIdPattern(String text) {
//     final govIdPatterns = [
//       RegExp(r'\b\d{4}\s*\d{4}\s*\d{4}\b'), // Aadhaar
//       RegExp(r'\b[A-Z]{5}\d{4}[A-Z]\b'), // PAN
//       RegExp(r'\b\d{3}-\d{4}-\d{7}-\d\b'), // Emirates ID
//       RegExp(r'\b[A-Z]{2}\d{2}\s*\d{11}\b'), // Voter ID
//       RegExp(r'\b[A-Z]{3}\d{7}\b'), // Passport
//       RegExp(r'\b[A-Z]\d{7}\b'), // Some regional IDs
//       RegExp(r'\b[A-Z]{2,4}\d{6,12}\b'), // Various government IDs
//     ];

//     return govIdPatterns.any((pattern) => pattern.hasMatch(text)) &&
//         !RegExp(r'\d{4}\s*\d{4}\s*\d{4}\s*\d{4}').hasMatch(text);
//   }

//   bool _isBankingCard(String text) {
//     final bankingIndicators = [
//       RegExp(r'VISA|MASTERCARD|AMEX|RUPAY'),
//       RegExp(r'DEBIT|CREDIT|ATM'),
//       RegExp(r'VALID\s*THRU|EXPIRES|EXP'),
//       RegExp(r'\d{4}\s*\d{4}\s*\d{4}\s*\d{4}'),
//       RegExp(r'CVV|CVC'),
//       RegExp(r'BANK.*CARD'),
//     ];

//     int matches =
//         bankingIndicators.where((pattern) => pattern.hasMatch(text)).length;
//     return matches >= 2;
//   }

//   bool _isTaxInvoiceOrBusinessDocument(String text) {
//     final businessIndicators = [
//       RegExp(r'INVOICE|BILL|RECEIPT'),
//       RegExp(r'GST|CGST|SGST|IGST'),
//       RegExp(r'AMOUNT|TOTAL|PRICE|RATE'),
//       RegExp(r'COMPANY|CORPORATION|ENTERPRISE'),
//       RegExp(r'VENDOR|SUPPLIER|CUSTOMER'),
//       RegExp(r'QUANTITY|QTY|UNIT'),
//     ];

//     int matches =
//         businessIndicators.where((pattern) => pattern.hasMatch(text)).length;
//     return matches >= 3;
//   }

//   bool _isValidFace(Face face) {
//     final bounds = face.boundingBox;
//     final previewSize = _controller!.value.previewSize!;
//     final faceArea = bounds.width * bounds.height;
//     final imageArea = previewSize.width * previewSize.height;
//     return faceArea > imageArea * 0.03;
//   }

//   Rect _convertBounds(Rect bounds, Size imageSize) {
//     final screenSize = MediaQuery.of(context).size;
//     final previewSize = _controller!.value.previewSize!;

//     final scaleX = screenSize.width / previewSize.height;
//     final scaleY = screenSize.height / previewSize.width;

//     return Rect.fromLTWH(
//       bounds.left * scaleX,
//       bounds.top * scaleY,
//       bounds.width * scaleX,
//       bounds.height * scaleY,
//     );
//   }

//   void _updateStatus() {
//     if (!mounted || _isDisposed) return;

//     if (_faceDetected && _idDetected && !_isRecording && !_recordingComplete) {
//       if (!_canStartRecording) {
//         _canStartRecording = true;
//         String idTypeText = _detectedIdType == 'EMIRATES_ID'
//             ? 'Emirates ID'
//             : _detectedIdType == 'PAN'
//                 ? 'PAN Card'
//                 : 'ID';
//         setState(() =>
//             _status = 'Valid $idTypeText detected! Starting recording...');
//         debugPrint('Starting recording immediately for $_detectedIdType');
//         _startRecording();
//       }
//     } else if (_faceDetected && !_idDetected) {
//       _canStartRecording = false;
//       setState(() => _status = 'Face detected. Show ID card clearly');
//     } else if (!_faceDetected && _idDetected) {
//       _canStartRecording = false;
//       String idTypeText = _detectedIdType == 'EMIRATES_ID'
//           ? 'Emirates ID'
//           : _detectedIdType == 'PAN'
//               ? 'PAN Card'
//               : 'ID';
//       setState(
//           () => _status = '$idTypeText detected. Position your face in view');
//     } else {
//       _canStartRecording = false;
//       setState(() => _status = 'Position face and ID card in view');
//     }
//   }

//   Future<void> _startRecording() async {
//     debugPrint(
//         '_startRecording called - isRecording: $_isRecording, isDisposed: $_isDisposed, mounted: $mounted');

//     if (!mounted ||
//         _isDisposed ||
//         _isRecording ||
//         !_controller!.value.isInitialized) {
//       debugPrint('Recording conditions not met');
//       return;
//     }

//     try {
//       debugPrint('Stopping image stream...');
//       await _stopImageStreamSafely(); //  Use safe stop
//       await Future.delayed(Duration(milliseconds: 500));

//       debugPrint('Starting video recording...');
//       await _controller!.startVideoRecording();
//       debugPrint('Video recording started successfully');

//       if (!_isDisposed && mounted) {
//         setState(() {
//           _isRecording = true;
//           _status = 'Recording video...';
//           _countdown = 3;
//           _canStartRecording = false;
//         });
//       }

//       _timer?.cancel();
//       _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//         if (!_isDisposed && mounted && _isRecording) {
//           setState(() => _countdown--);
//           debugPrint('Recording countdown: $_countdown');
//           if (_countdown <= 0) {
//             timer.cancel();
//             _stopRecording();
//           }
//         } else {
//           timer.cancel();
//         }
//       });
//     } catch (e) {
//       debugPrint('Recording start error: $e');
//       if (!_isDisposed && mounted) {
//         setState(() {
//           _status = 'Recording failed: ${e.toString()}. Tap to retry.';
//           _isRecording = false;
//           _canStartRecording = false;
//         });

//         try {
//           await Future.delayed(Duration(milliseconds: 500));
//           _startImageStream();
//         } catch (streamError) {
//           debugPrint('Error restarting image stream: $streamError');
//         }
//       }
//     }
//   }

//   Future<void> _stopRecording() async {
//     if (!mounted || _isDisposed || !_isRecording) return;

//     try {
//       final video = await _controller!.stopVideoRecording();
//       if (!_isDisposed && mounted) {
//         setState(() {
//           _isRecording = false;
//           _recordingComplete = true;
//           _status = 'Video captured successfully!';
//         });

//         widget.onVideoCaptured(video);
//         Get.back();
//       }
//     } catch (e) {
//       debugPrint('Recording stop error: $e');
//       if (!_isDisposed && mounted) {
//         setState(() {
//           _status = 'Failed to save video: ${e.toString()}. Try again.';
//           _isRecording = false;
//           _recordingComplete = false;
//           _canStartRecording = false;
//         });

//         try {
//           await Future.delayed(Duration(milliseconds: 500));
//           _startImageStream();
//         } catch (streamError) {
//           debugPrint('Error restarting image stream: $streamError');
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isInitialized) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Video KYC'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               SizedBox(height: 16),
//               Text(_status),
//             ],
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Camera preview - Full screen
//           Positioned.fill(
//             child: CameraPreview(_controller!),
//           ),

//           // Face detection frame
//           if (_detectedFaceBounds != null)
//             Positioned(
//               left: _detectedFaceBounds!.left,
//               top: _detectedFaceBounds!.top,
//               width: _detectedFaceBounds!.width,
//               height: _detectedFaceBounds!.height,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: _faceDetected ? Colors.green : Colors.red,
//                     width: 3,
//                   ),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: -30,
//                       left: 0,
//                       right: 0,
//                       child: Center(
//                         child: Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: _faceDetected ? Colors.green : Colors.red,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Text(
//                             'FACE',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//           // ID card frame
//           if (_detectedIdBounds != null)
//             Positioned(
//               left: _detectedIdBounds!.left,
//               top: _detectedIdBounds!.top,
//               width: _detectedIdBounds!.width,
//               height: _detectedIdBounds!.height,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: _idDetected ? Colors.green : Colors.orange,
//                     width: 3,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: -30,
//                       left: 0,
//                       right: 0,
//                       child: Center(
//                         child: Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                           decoration: BoxDecoration(
//                             color: _idDetected ? Colors.green : Colors.orange,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Text(
//                             _detectedIdType.isNotEmpty
//                                 ? _detectedIdType
//                                 : 'ID FRONT',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//           // Back button
//           Positioned(
//             top: MediaQuery.of(context).padding.top + 10,
//             left: 10,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black54,
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: IconButton(
//                 icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ),

//           // Recording indicator
//           if (_isRecording)
//             Positioned(
//               top: MediaQuery.of(context).padding.top + 10,
//               right: 20,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.circle, color: Colors.white, size: 12),
//                     SizedBox(width: 5),
//                     Text(
//                       'REC ${_countdown}s',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//           // Status bar
//           Positioned(
//             top: MediaQuery.of(context).padding.top + 60,
//             left: 20,
//             right: 20,
//             child: Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.black87,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _buildStatusIcon('Face', _faceDetected),
//                       SizedBox(width: 8),
//                       _buildStatusIcon('ID Card', _idDetected),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     _status,
//                     style: TextStyle(color: Colors.white, fontSize: 14),
//                     textAlign: TextAlign.center,
//                   ),
//                   if (_detectedIdText.isNotEmpty)
//                     Padding(
//                       padding: EdgeInsets.only(top: 4),
//                       child: Text(
//                         'Detected: ${_detectedIdText.length > 20 ? _detectedIdText.substring(0, 20) + "..." : _detectedIdText}',
//                         style: TextStyle(color: Colors.white70, fontSize: 10),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),

//           // Instructions at bottom
//           Positioned(
//             bottom: MediaQuery.of(context).padding.bottom + 40,
//             left: 20,
//             right: 20,
//             child: Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.black54,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     _isRecording
//                         ? 'Hold steady! Recording ${_countdown} seconds remaining...'
//                         : 'Position your face and ID card in view.\nFrames will appear when detected.\nRecording starts immediately when both are detected.',
//                     style: TextStyle(color: Colors.white, fontSize: 14),
//                     textAlign: TextAlign.center,
//                   ),
//                   if (_status.contains('failed') ||
//                       _status.contains('Tap to retry'))
//                     Padding(
//                       padding: EdgeInsets.only(top: 12),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             _canStartRecording = false;
//                             _status = 'Position face and ID card in view';
//                           });
//                           _startImageStream();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                         ),
//                         child: Text('Retry Recording'),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),

//           // Debug info panel (only in debug mode)
//           if (kDebugMode)
//             Positioned(
//               bottom: MediaQuery.of(context).padding.bottom + 160,
//               left: 10,
//               right: 10,
//               child: Container(
//                 constraints: BoxConstraints(maxHeight: 120),
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.black87,
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(color: Colors.yellow, width: 1),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         'DEBUG INFO:',
//                         style: TextStyle(
//                           color: Colors.yellow,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text(
//                         'Face: $_faceDetected | ID: $_idDetected | Type: $_detectedIdType',
//                         style: TextStyle(color: Colors.white, fontSize: 10),
//                       ),
//                       Text(
//                         'Score: $_debugScore | Recording: $_isRecording',
//                         style: TextStyle(color: Colors.white, fontSize: 10),
//                       ),
//                       if (_debugReason.isNotEmpty)
//                         Text(
//                           'Reason: $_debugReason',
//                           style: TextStyle(color: Colors.white, fontSize: 10),
//                         ),
//                       if (_lastDetectedText.isNotEmpty)
//                         Text(
//                           'Last Text: ${_lastDetectedText.length > 30 ? _lastDetectedText.substring(0, 30) + "..." : _lastDetectedText}',
//                           style: TextStyle(color: Colors.white, fontSize: 10),
//                         ),
//                       if (_allDetectedBlocks.isNotEmpty)
//                         Text(
//                           'Blocks: ${_allDetectedBlocks.length} detected',
//                           style: TextStyle(color: Colors.white, fontSize: 10),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatusIcon(String label, bool detected) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.5),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             detected ? Icons.check_circle : Icons.radio_button_unchecked,
//             color: detected ? Colors.green : Colors.grey,
//             size: 16,
//           ),
//           SizedBox(width: 4),
//           Text(
//             label,
//             style: TextStyle(
//               color: detected ? Colors.green : Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _isDisposed = true;
//     _timer?.cancel();
//     _timer = null;

//     try {
//       _stopImageStreamSafely(); // Use safe stop
//     } catch (e) {
//       debugPrint('Error stopping image stream in dispose: $e');
//     }

//     _controller?.dispose();
//     _controller = null;

//     _faceDetector?.close();
//     _faceDetector = null;

//     _textRecognizer?.close();
//     _textRecognizer = null;

//     super.dispose();
//   }
// }
