import 'dart:convert';
import 'dart:typed_data';

import '../../others/enums.dart';

extension Convert on Environment {
  String get toStr {
    switch (this) {
      case Environment.demo:
        return 'Demo';
      case Environment.clientQc:
        return 'Client QC';
      case Environment.dev:
        return 'DEV';
      case Environment.qc:
        return 'QC';
      case Environment.prod:
        return 'Prod';
      case Environment.sandbox:
        return 'SANDBOX';
      case Environment.uat:
        return 'UAT';
    }
  }

  int get code {
    switch (this) {
      case Environment.demo:
        return 6;
      case Environment.dev:
        return 1;
      case Environment.qc:
        return 2;
      case Environment.prod:
        return 3;
      case Environment.clientQc:
        return 4;
      case Environment.sandbox:
        return 5;
      case Environment.uat:
        return 5;
    }
  }
}

extension Base64String on String {
  Uint8List isValidBase64(String base64) {
    return const Base64Decoder().convert(base64);
  }
}
