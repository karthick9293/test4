import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/account_controller.dart';
import 'package:mobiremit/core/controllers/main_controller.dart';

import '../../ui_common/app_routes.dart';
import '../../ui_one/custom_widgets/session_timeout.dart';
import '../flavours/constants.dart';

class InactivityController extends GetxController with WidgetsBindingObserver {
  Timer? _timer;
  var timeoutDuration = const Duration(minutes: 5).obs;
  var loginSession = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    ever(loginSession, (bool isLoggedIn) {
      if (isLoggedIn) {
        _startTimer();
      } else {
        _stopTimer();
      }
    });

    ever(timeoutDuration, (_) {
      if (loginSession.value) {
        _startTimer();
      }
    });

    if (loginSession.value) {
      _startTimer();
    }
  }

  @override
  void onClose() {
    _stopTimer();
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  void onUserInteraction() {
    if (loginSession.value) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(timeoutDuration.value, _onTimeout);
    loginSession.value = true;
    debugPrint("Timer started${_timer!.tick}");
  }

  void _stopTimer() {
    _timer?.cancel();
    debugPrint("Timer stopped");
  }

  void _onTimeout() async {
    debugPrint("Timeout triggered");
    if (loginSession.value) {
      try {
        if (Get.isRegistered<MainController>()) {
          Get.find<MainController>()
            ..pages.clear()
            ..appBars.clear()
            ..push(AppRoutes.getPage(AppRoutes.dashboard), dashBoardAppbar())
            ..update();
        }
        if (Get.isRegistered<AccountController>()) {
          Get.find<AccountController>().selfieImage.value = null;
        }

        Get.offAllNamed(
            (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login);

        sessionTimeOut();
      } catch (e) {
        debugPrint("Error in _onTimeout: $e");
      } finally {
        loginSession.value = false;
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!loginSession.value) return;

    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _stopTimer();
    } else if (state == AppLifecycleState.resumed) {
      _startTimer();
    }
  }

  Future<void> gotoPreLoginPage() async {
    if (loginSession.value) {
      try {
        if (Get.isRegistered<MainController>()) {
          Get.find<MainController>()
            ..pages.clear()
            ..appBars.clear()
            ..push(AppRoutes.getPage(AppRoutes.dashboard), dashBoardAppbar())
            ..update();
        }
        if (Get.isRegistered<AccountController>()) {
          Get.find<AccountController>().selfieImage.value = null;
        }
        Get.offAllNamed(
            (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login);
      } catch (e) {
        debugPrint("Error in gotoPreLoginPage: $e");
      } finally {
        loginSession.value = false;
      }
    }
  }
}
