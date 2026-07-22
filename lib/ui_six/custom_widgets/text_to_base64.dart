import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

Future<String> textToBase64Image(String text) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);

  // Text painter with some base font size
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 40, // you can adjust this
      ),
    ),
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(); // let it calculate width & height

  // Draw text at (0,0)
  textPainter.paint(canvas, Offset.zero);

  // End recording with exact width & height of text
  final picture = recorder.endRecording();
  final img = await picture.toImage(
    textPainter.width.ceil(),
    textPainter.height.ceil(),
  );

  // Convert to PNG bytes
  final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();

  // Encode to Base64
  return base64Encode(pngBytes);
}
