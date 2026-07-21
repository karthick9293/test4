import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/flavours/constants.dart';

import '../../core/controllers/account_controller.dart';

class FlipCardWidget extends StatefulWidget {
  final String? frontImage;
  final String? backImage;

  const FlipCardWidget({
    super.key,
    required this.frontImage,
    required this.backImage,
  });

  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFront = true;
  double _dragStartX = 0;
  bool _isDragging = false;
  late Uint8List _frontImageBytes;
  late Uint8List _backImageBytes;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _loadImages();
  }

  Future<void> _loadImages() async {
    try {
      _frontImageBytes = base64Decode(widget.frontImage?.split(',').last ?? '');
      _backImageBytes = base64Decode(widget.backImage?.split(',').last ?? '');
      setState(() {});
    } catch (e) {
      debugPrint('Error loading images: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _controller.forward();
      Get.find<AccountController>().idSideActiveIdx.value = 1;
    } else {
      _controller.reverse();
      Get.find<AccountController>().idSideActiveIdx.value = 0;
    }
    _isFront = !_isFront;
  }

  void _handleDragStart(DragStartDetails details) {
    _dragStartX = details.globalPosition.dx;
    _isDragging = true;
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!_isDragging) return;

    final currentX = details.globalPosition.dx;
    final delta = currentX - _dragStartX;
    final screenWidth = MediaQuery.of(context).size.width;

    if (delta.abs() > screenWidth * 0.05) {
      if (delta > 0 && !_isFront) {
        // Swipe right to show front
        _flipCard();
        _isDragging = false;
      } else if (delta < 0 && _isFront) {
        // Swipe left to show back
        _flipCard();
        _isDragging = false;
      }
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    _isDragging = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _handleDragStart,
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragEnd: _handleDragEnd,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value * 3.141592),
            alignment: Alignment.center,
            child: _animation.value <= 0.5
                ? IDCardSide(
                    imageBytes: _frontImageBytes,
                    isFront: true,
                    angle: _animation.value,
                  )
                : Transform(
                    transform: Matrix4.identity()..rotateY(3.141592),
                    alignment: Alignment.center,
                    child: IDCardSide(
                      imageBytes: _backImageBytes,
                      isFront: false,
                      angle: _animation.value,
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class IDCardSide extends StatelessWidget {
  final Uint8List? imageBytes;
  final bool isFront;
  final double angle;

  const IDCardSide({
    super.key,
    required this.imageBytes,
    required this.isFront,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    final opacity = isFront ? (1 - angle * 2).clamp(0, 1) : (angle * 2 - 1).clamp(0, 1);

    return Card(
      elevation: 3,
      child: Container(
        width: 330,
        height: 200,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppConfigs.w,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Opacity(
            opacity: double.parse(opacity.toString()),
            child: imageBytes != null && imageBytes!.isNotEmpty
                ? Image.memory(
                    imageBytes!,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter,
                    frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded || frame != null) {
                        return child;
                      }
                      return Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(strokeWidth: 1.5),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (_, __, ___) => _buildErrorWidget(),
                  )
                : _buildErrorWidget(),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Text(
          'Image Not available'.tr,
          style: TS.f14.copyWith(
            color: Get.find<AccountController>().isDark ? AppConfigs.g8f : AppConfigs.g4,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
