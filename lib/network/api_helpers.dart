import 'package:dio/dio.dart';

import '../core/flavours/app_config.dart';
import '../others/network_constant.dart';
import 'api_client_new1.dart';
import 'api_endpoints.dart';
import 'api_token_manager.dart';
import 'api_ui_handlers.dart';

class ApiHelpers {
  static Dio getDioClientForPath(String path) {
    final apiClient = ApiClient();
    if (path.startsWith(AppConfigs.uaePass)) {
      return apiClient.uaePass;
    } else if (path.contains('formrules') ||
        path.contains(APIEndPoints.getFormRules)) {
      return apiClient.formRules;
    } else if (path.contains('admin') || path.contains('settings')) {
      return apiClient.admin;
    }
    return apiClient.user;
  }

  static bool shouldUseFormData(String path) {
    return ![
      NetworkConstant.getUserDocumentDetails,
      NetworkConstant.validateUUID,
      NetworkConstant.fetchUAEPassDoc,
    ].contains(path);
  }

  static Response? handleResponse(Response? response, String path) {
    final data = response?.data;

    // Check if it's a known error status or the technical RuleErrors format
    bool isTechnicalError = data is Map<String, dynamic> &&
        data['Body']?['RootNode']?['RuleErrors'] != null &&
        (data['Body']['RootNode']['RuleErrors'] as List).isNotEmpty;

    bool isFailedStatus = data?['StatusCode'] == "RMA-FAILED" ||
        data?['StatusCode'] == "CC-FAILED" ||
        data?['StatusCode'] == "401" ||
        data?['StatusCode'] ==
            "RVIN001" || // Explicitly include the user's example code
        isTechnicalError;

    if (isFailedStatus) {
      if (ApiTokenManager.isTokenExpired(data)) {
        return null;
      } else if (ApiUIHandlers.shouldShowErrorAlert(
          path, data is Map<String, dynamic> ? data : {})) {
        ApiUIHandlers.showApiErrorAlert(
            data is Map<String, dynamic> ? data : {}, path);

        // For technical/unexpected errors, return null so controllers don't show a second alert
        if (isTechnicalError || data?['StatusCode'] == "RVIN001") {
          return null;
        }
      }
    } else if (data?['StatusCode'] == "" &&
        data?['CustomMessageDetails']?['MessageCode'] == "FAIL-0001") {
      ApiUIHandlers.showApiErrorAlert(
          data is Map<String, dynamic> ? data : {}, path);
    }

    return response;
  }
}
