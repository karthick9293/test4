import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageCompress {
  /// compresses  image under 100 KB.
  static Future<XFile?> compressToUnder100KB(File file) async {
    final tempDir = await getTemporaryDirectory();
    final targetPath = path.join(
      tempDir.path,
      '${path.basenameWithoutExtension(file.path)}_compressed.jpg',
    );

    int quality = 30;
    int minWidth = 800;
    int minHeight = 600;
    XFile? compressed;

    for (int i = 0; i < 5; i++) {
      compressed = await FlutterImageCompress.compressAndGetFile(
        file.path,
        targetPath,
        quality: quality,
        minWidth: minWidth,
        minHeight: minHeight,
      );

      if (compressed == null) break;

      final size = await compressed.length();
      if (size <= 100 * 1024) {
        if (kDebugMode) {
          print("compressed to: ${size / 1024} KB");
        }
        return compressed;
      }

      // tune down compression
      quality -= 5;
      minWidth = (minWidth * 0.8).toInt();
      minHeight = (minHeight * 0.8).toInt();
    }

    if (kDebugMode) {
      print("could not compress under 100KB, final size: ${(await compressed?.length() ?? 0) / 1024} KB");
    }
    return compressed;
  }
}
