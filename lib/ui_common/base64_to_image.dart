import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Base64Image extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Alignment? alignment;
  final ColorFilter? colorFilter;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? errorWidget;

  // Cache decoded bytes to avoid re-decoding base64 on every rebuild.
  // This is especially important in lists where tab switching triggers rebuilds.
  static final Map<String, Uint8List> _decodeCache = {};

  const Base64Image({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit,
    this.alignment,
    this.colorFilter,
    this.padding,
    this.margin,
    this.errorWidget,
  });

  bool _isSvgHeader() {
    final header = image.split(',').firstOrNull ?? '';
    return image.split(',').length > 1 && header.contains('svg');
  }

  bool _isSvgBytes(Uint8List bytes) {
    try {
      final content = utf8.decode(bytes, allowMalformed: true).toLowerCase();
      return content.contains('<svg');
    } catch (_) {
      return false;
    }
  }

  Uint8List? _decodeBase64() {
    try {
      if (image.isEmpty) return null;

      final stripped = image.contains(',') ? image.split(',').last : image;

      final cached = _decodeCache[stripped];
      if (cached != null) return cached;

      final decoded = base64Decode(stripped);
      _decodeCache[stripped] = decoded;
      return decoded;
    } catch (e) {
      debugPrint("Base64 decode error: $e");
      return null;
    }
  }

  Widget _buildError() {
    return errorWidget ??
        Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          color: Colors.grey.shade300,
          child: const Opacity(
            opacity: 0.5,
            child: Icon(Icons.broken_image, color: Colors.red),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (image.isEmpty) {
      return _wrapWithContainer(child: _buildError());
    }

    final bytes = _decodeBase64();

    if (bytes == null || bytes.isEmpty) {
      return _wrapWithContainer(child: _buildError());
    }

    final bool isSvg = _isSvgHeader() || _isSvgBytes(bytes);

    Widget imageWidget;

    if (isSvg) {
      imageWidget = SvgPicture.memory(
        bytes,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        alignment: alignment ?? Alignment.center,
        colorFilter: colorFilter,
        errorBuilder: (_, __, ___) => _buildError(),
        placeholderBuilder: (_) => SizedBox(
          width: width,
          height: height,
        ),
      );
    } else {
      imageWidget = Image.memory(
        bytes,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment ?? Alignment.center,
        gaplessPlayback: true,
        errorBuilder: (_, __, ___) => _buildError(),
      );
    }

    return _wrapWithContainer(child: imageWidget);
  }

  Widget _wrapWithContainer({required Widget child}) {
    if (padding == null && margin == null) return child;

    return Container(
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}

extension FirstOrNullExtension<T> on List<T> {
  T? get firstOrNull => isNotEmpty ? first : null;
}
