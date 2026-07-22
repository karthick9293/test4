import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';

class VideoCompressor {
  /// compress video  under  (1 MB)
  static Future<XFile?> compressToMaxSize(XFile file, {int maxSizeInKB = 1024}) async {
    final List<VideoQuality> qualities = [
      // VideoQuality.Res640x480Quality,
      VideoQuality.LowQuality,
      // VideoQuality.Res960x540Quality,
    ];

    for (final quality in qualities) {
      final info = await VideoCompress.compressVideo(
        file.path,
        quality: quality,
        deleteOrigin: false,
        includeAudio: false,
        // frameRate: 10,
        // duration: 10,
        startTime: 0,
      );

      if (info == null || info.path == null) continue;

      final compressedFile = XFile(info.path!);
      final sizeInKB = await compressedFile.length() / 1024;

      if (kDebugMode) {
        print("compressed to: ${sizeInKB.toStringAsFixed(2)} KB using $quality");
      }

      if (sizeInKB <= maxSizeInKB) {
        return compressedFile;
      }
    }

    if (kDebugMode) {
      print("could not compress under ${maxSizeInKB}KB.");
    }
    return null;
  }

  /// delete cache
  static Future<void> dispose() async {
    await VideoCompress.deleteAllCache();
  }
}
