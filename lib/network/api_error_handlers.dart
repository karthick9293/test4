import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;

import '../core/exports/controllers.dart';
import '../core/flavours/constants.dart';
import '../others/network_constant.dart';
import '../ui_one/custom_widgets/session_timeout.dart';
import '../ui_one/screens/sign_up/nid_alerts.dart';
import 'api_error_extractor.dart';
import 'api_token_manager.dart';
import 'api_ui_handlers.dart';

/// True when the app is NOT in production (covers non-prod release builds too).
bool get _isNonProd => AppConfigs.env != Environment.prod || kDebugMode;

class ApiErrorHandlers {
  static String extractErrorMessage(DioException e) {
    return ApiErrorExtractor.extractErrorMessage(e);
  }

  static String extractErrorMessageFromData(dynamic data) {
    return ApiErrorExtractor.extractErrorMessageFromData(data);
  }

  static Future<Response?> handleSpecificPathErrors(
    DioException e,
    String path,
    String errorMessage,
    String? errorCode,
  ) async {
    switch (path) {
      case NetworkConstant.validateLogin:
        return _handleValidateLoginError(errorMessage);
      case NetworkConstant.getUploadedDocument:
        return _handleUploadedDocumentError(errorMessage);
      case NetworkConstant.transactions:
        return _handleTransactionsError(errorMessage);
      case NetworkConstant.forgotPassword:
        return _handleForgotPasswordError(e, errorMessage);
      case NetworkConstant.transactionDetails:
        return _handleTransactionDetailsError(errorMessage);
      case NetworkConstant.validateCredentials:
        return await _handleValidateCredentialsError(e, errorMessage);
      case NetworkConstant.validateOTP:
        return await _handleValidateOTPError(e, errorMessage, errorCode);
      case NetworkConstant.addCustomer:
        return await _handleAddCustomerError(errorMessage, errorCode);
      default:
        if (errorCode == '401') {
          await _handleAuthError(errorMessage);
        }
        return null;
    }
  }

  static Future<Response?> _handleValidateLoginError(String errorMessage) async {
    Get.dialog(kycPendingAlert(
      Get.find<AccountController>().isDark,
      errorMessage,
      title: 'Login Failed'.tr,
    ));
    return null;
  }

  static Future<Response?> _handleUploadedDocumentError(String errorMessage) async {
    if (!errorMessage.contains('Data not found') && !errorMessage.contains("can't open file")) {
      await ApiUIHandlers.showApiAlertDialog('Error', errorMessage, disableBack: true);
    }
    return null;
  }

  static Future<Response?> _handleTransactionsError(String errorMessage) async {
    if (errorMessage != 'No Records Found') {
      await ApiUIHandlers.showApiAlertDialog('Error', errorMessage, disableBack: true);
    }
    return null;
  }

  static Future<Response?> _handleForgotPasswordError(DioException e, String errorMessage) async {
    if (errorMessage == 'Unregistered ID') {
      return e.response;
    } else {
      await ApiUIHandlers.showApiAlertDialog('Error', errorMessage, disableBack: true);
      return null;
    }
  }

  static Response? _handleTransactionDetailsError(String errorMessage) {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    Get.snackbar(
      'Error',
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white.withOpacity(0.9),
      duration: const Duration(seconds: 5),
    );
    return null;
  }

  static Future<Response?> _handleValidateCredentialsError(DioException e, String errorMessage) async {
    if (errorMessage.contains('Your Mobile is deactivated')) {
      await ApiTokenManager.handleSessionExpiry();
      await sessionTimeOut(title: 'Blocked', message: errorMessage);
      return null;
    } else {
      return e.response;
    }
  }

  static Future<Response?> _handleValidateOTPError(DioException e, String errorMessage, String? errorCode) async {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    if (errorCode == '403') {
      await ApiTokenManager.handleSessionExpiry();
      await sessionTimeOut(title: 'Blocked', message: errorMessage);
    }
    await ApiUIHandlers.showApiAlertDialog('Error', errorMessage);
    return null;
  }

  static Future<Response?> _handleAddCustomerError(String errorMessage, String? errorCode) async {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    if (errorCode == '403' || errorCode == '402' || errorCode == '401') {
      await ApiTokenManager.handleSessionExpiry();
    }
    await ApiUIHandlers.showApiAlertDialog('Error', errorMessage);
    return null;
  }

  static Future<void> _handleAuthError(String errorMessage) async {
    await ApiTokenManager.handleSessionExpiry();
    await ApiUIHandlers.showApiAlertDialog('Error', errorMessage);
  }

  // Additional helper method for generic error handling
  static Future<void> handleGenericError(
    DioException e,
    String path,
    String errorMessage,
  ) async {
    if (Get.isDialogOpen != true) {
      if (e.response?.data['Body']?['RootNode']?['SourceErrorDetails'] == 'Invalid Session ID') {
        await ApiTokenManager.handleSessionTimeout(path);
      } else {
        try {
          final cleanedMessage = errorMessage.replaceAll("'", '"');
          final errorJson = jsonDecode(cleanedMessage) as Map<String, dynamic>;

          if (errorJson["message"] != null) {
            await ApiUIHandlers.showApiAlertDialog(
              'Error',
              errorJson["message"] as String,
              disableBack: true,
            );
          } else {
            _showFallbackError(errorMessage, path);
          }
        } catch (_) {
          _showFallbackError(errorMessage, path);
        }
      }
    }
  }

  static Future<void> _showFallbackError(String errorMessage, String path) async {
    await ApiUIHandlers.showApiAlertDialog(
      'Error',
      _isNonProd ? '$errorMessage\n\n[API: $path]' : errorMessage,
      disableBack: true,
    );
  }

  static bool isSessionInvalidError(DioException e) {
    final errorDetails = e.response?.data['Body']?['RootNode']?['SourceErrorDetails'];
    return errorDetails == 'Invalid Session ID' || errorDetails == 'Session expired' || errorDetails == 'Invalid token';
  }

  static bool isConnectivityError(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.error is SocketException ||
        e.error is HttpException;
  }

  static Future<Response?> handleMediaError(DioException e, String path) async {
    if (Get.isDialogOpen != true) {
      final errorMessage = extractErrorMessage(e);

      if (e.response?.data['Body']?['RootNode']?['SourceErrorDetails'] == 'Invalid Session ID') {
        await ApiTokenManager.handleSessionTimeout(path);
      } else {
        await ApiUIHandlers.showApiAlertDialog(
          'Error',
          _isNonProd ? '$errorMessage\n\n[API: $path]' : errorMessage,
          disableBack: true,
        );
      }
    }
    return null;
  }

  static Future<Response?> handleEncryptedError(DioException e, String path) async {
    if (e.type == DioExceptionType.receiveTimeout) {
      await ApiUIHandlers.showTimeoutAlert(path);
      return null;
    } else {
      await ApiUIHandlers.showApiAlertDialog(
        'Error',
        _isNonProd ? '${e.message}\n\n[API: $path]' : '${e.message}',
        disableBack: true,
      );
      return null;
    }
  }
}
