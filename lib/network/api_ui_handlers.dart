import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/flavours/constants.dart';
import '../others/network_constant.dart';
import '../ui_one/custom_widgets/error_alert.dart';
import 'api_endpoints.dart';
import 'api_error_extractor.dart';

/// Returns true when the app is running in a non-production environment
/// (dev, QC, UAT, sandbox, etc.) — including release builds on those envs.
bool get _isNonProd => AppConfigs.env != Environment.prod || kDebugMode;

class ApiUIHandlers {
  static Future<void> showApiAlertDialog(
    String title,
    String message, {
    bool disableBack = false,
  }) async {
    if (Get.isDialogOpen == true && disableBack) {
      return;
    }

    Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
      barrierDismissible: !disableBack,
    );
  }

  static Future<void> showTimeoutAlert(String path) async {
    if (Get.isDialogOpen != true) {
      await showApiAlertDialog(
        'Error',
        'Receive timeout${_isNonProd ? '\n\n[API: $path]' : ''}',
        disableBack: true,
      );
    }
  }

  static bool shouldShowErrorAlert(String path, Map<String, dynamic> responseData) {
    final excludedPaths = [
      NetworkConstant.validateCredentials,
      APIEndPoints.rateCalculator,
      APIEndPoints.validateUserName,
      NetworkConstant.transactions,
      APIEndPoints.getFormRules,
      APIEndPoints.getBanks,
      APIEndPoints.getBranches,
    ];

    if (excludedPaths.contains(path)) {
      return false;
    }

    final messageCode = responseData['CustomMessageDetails']?['MessageCode'];
    return !(messageCode == "FAIL-0007" || messageCode == "FAIL-00020");
  }

  static void showApiErrorAlert(Map<String, dynamic> responseData, String path) {
    final messageHeader = responseData['CustomMessageDetails']?['MessageHeader'] ?? "Error";
    final baseDescription = ApiErrorExtractor.extractErrorMessageFromData(responseData);
    final messageDescription = _isNonProd
        ? '$baseDescription\n\n[API: $path]'
        : baseDescription;

    errorAlert(content: messageDescription, title: messageHeader);
  }

  static Future<void> showErrorAlert(Map<String, dynamic> responseData, String path) async {
    final messageHeader = responseData['CustomMessageDetails']?['MessageHeader'] ?? 'Error';
    final extractedMessage = ApiErrorExtractor.extractErrorMessageFromData(responseData);

    final base = extractedMessage.isNotEmpty
        ? extractedMessage
        : '${responseData['StatusMessaage'] ?? ''}';

    final messageDescription = _isNonProd ? '$base\n\n[API: $path]' : base;

    await showApiAlertDialog(
      messageHeader,
      messageDescription,
      disableBack: true,
    );
  }
}
