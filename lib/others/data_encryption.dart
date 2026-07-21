import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mobiremit/core/flavours/app_config.dart';
import 'package:pointycastle/export.dart';

class DataEncryption {
  // api part
  static String decryptDataPart(String input) {
    input = input.replaceAll("\"", " ").replaceAll('\\', ' ');
    var ciphertext = base64Decode(input);

    if (kDebugMode) {
      print("decryption started");
    }
    // initialization vector value
    var iv = base64Decode(AppConfigs.aesIV);
    // aes key
    var key = base64Decode(AppConfigs.aesKEY);

    var cipher = CBCBlockCipher(AESEngine());
    var params = ParametersWithIV(KeyParameter(key), iv);
    var paddingParams = PaddedBlockCipherParameters(params, null);
    var paddingCipher = PaddedBlockCipherImpl(PKCS7Padding(), cipher);

    paddingCipher.init(false, paddingParams);

    var output = paddingCipher.process(ciphertext);

    return utf8.decode(output);
  }

  static String encryptDataPart(Uint8List input) {
    // initialization vector value
    var iv = base64Decode(AppConfigs.aesIV);
    // aes key
    var key = base64Decode(AppConfigs.aesKEY);

    var cipher = CBCBlockCipher(AESEngine());
    var params = ParametersWithIV<KeyParameter>(KeyParameter(key), iv);
    var paddingParams =
        PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(
            params, null);
    var paddingCipher = PaddedBlockCipherImpl(PKCS7Padding(), cipher);

    paddingCipher.init(true, paddingParams);

    var output = paddingCipher.process(input);

    if (kDebugMode) {
      print("encrypted ${base64Encode(output)}");
    }

    return base64Encode(output);
  }

  /// local data storage encyption

  static String readEncryptBox(String input) {
    input = input.replaceAll("\"", " ").replaceAll('\\', ' ');
    var ciphertext = base64Decode(input);

    if (kDebugMode) {
      print("decryption started");
    }
    // initialization vector value
    var iv = base64Decode(AppConfigs.aesIV);
    // aes key
    var key = base64Decode(AppConfigs.aesKEY);

    var cipher = CBCBlockCipher(AESEngine());
    var params = ParametersWithIV(KeyParameter(key), iv);
    var paddingParams = PaddedBlockCipherParameters(params, null);
    var paddingCipher = PaddedBlockCipherImpl(PKCS7Padding(), cipher);

    paddingCipher.init(false, paddingParams);

    var output = paddingCipher.process(ciphertext);

    if (kDebugMode) {
      print("readEncryptBox : ${String.fromCharCodes(output)}");
    }

    return String.fromCharCodes(output);
  }

  static String writeEncryptBox(Uint8List input) {
    // initialization vector value
    var iv = base64Decode(AppConfigs.aesIV);
    // aes key
    var key = base64Decode(AppConfigs.aesKEY);

    var cipher = CBCBlockCipher(AESEngine());
    var params = ParametersWithIV<KeyParameter>(KeyParameter(key), iv);
    var paddingParams =
        PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(
            params, null);
    var paddingCipher = PaddedBlockCipherImpl(PKCS7Padding(), cipher);

    paddingCipher.init(true, paddingParams);

    var output = paddingCipher.process(input);

    if (kDebugMode) {
      print("writeEncryptBox : ${base64Encode(output)}");
    }

    return base64Encode(output);
  }
}
