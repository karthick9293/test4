import 'package:get/get.dart';

import '../core/exports/controllers.dart';
import '../core/exports/ui_one_pages.dart';
import '../core/flavours/constants.dart';
import '../ui_one/custom_widgets/session_timeout1.dart';

class ApiTokenManager {
  static bool isTokenExpired(Map<String, dynamic> responseData) {
    return (responseData['StatusCode'] == "401" ||
            responseData['StatusCode'] == "RMA-FAILED" ||
            responseData['StatusCode'] == "CC-FAILED") &&
        responseData['Data']?['MessageCode'] == "401";
  }

  static Future<T?> retryWithNewToken<T>(
      Future<T> Function() retryFunction) async {
    await Box3.saveConfig(loadSetting: false);
    final newToken = Box3.appKeyToken;

    if (newToken != null) {
      return await retryFunction();
    }
    return null;
  }

  static Future<void> handleSessionExpiry() async {
    Get.find<MainController>()
      ..pages.clear()
      ..appBars.clear()
      ..push(const DashBoardPage(), dashBoardAppbar())
      ..update();

    if (Box3.settings.preLogin) {
      if (Get.currentRoute != AppRoutes.preLogin) {
        Get.offAllNamed(AppRoutes.preLogin);
      }
    } else {
      if (Get.currentRoute != AppRoutes.login) {
        Get.offAllNamed(AppRoutes.login);
      }
    }
  }

  static Future<void> handleSessionTimeout(String path) async {
    await handleSessionExpiry();
    await sessionTimeOut1(path: path, title: 'Session Timeout');
  }
}
