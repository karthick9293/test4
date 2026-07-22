import 'dart:io';

import 'package:device_safety_info/device_safety_info.dart';
import 'package:device_safety_info/vpn_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../models/custom_message/custom_message_details_fz.dart';
import '../../network/api_service_new.dart';
import '../../ui_one/custom_widgets/alert_dialog.dart';
import '../editing_controllers.dart/attributes.dart';
import '../flavours/constants.dart';
import 'account_controller.dart';

class AuthController extends FullLifeCycleController with FullLifeCycleMixin {
  bool fromResume = false;
  bool isFromUser = false;
  bool isVpn = false;
  bool isRooted = false;
  bool isLock = false;
  bool isRealDevice = false;
  bool isDevMode = false;
  bool isExternalStorage = false;
  final LocalAuthentication auth = LocalAuthentication();
  bool isAuthenticated = false,
      ignoreLifecycle = false,
      // isFingerPrint = false,
      // isFaceAuth = false,
      showBiometric = false,
      isBiometricAvailable = false,
      isDark = Get.find<AccountController>().isDark;
  bool isBack = false;

  Future<void> validateMpin(String s,
      {required Future<void> Function() onCompleted}) async {
    dialogAuthAttributes.mpinErrorText = '';
    update();
    Map<String, dynamic> result = await ApiService().validateCredentials(s);

    if (result['isSucc']) {
      Get.back();
      dialogAuthAttributes.mPinController.clear();
      dialogAuthAttributes.mpinErrorText = '';
      update();

      await onCompleted();
    } else {
      CustomMessageDetailsFZ? customMessageDetails = result['message'];
      dialogAuthAttributes.mPinController.clear();
      dialogAuthAttributes.mPinTrailer = const SizedBox();
      dialogAuthAttributes.mpinErrorText =
          customMessageDetails?.MessageDescription ?? 'invalid MPIN';
      update();

      if (result['MessageCode'] == '636') {
        Get.find<AccountController>().onUserBlocked(
            title: customMessageDetails?.MessageHeader,
            content: customMessageDetails?.MessageDescription);
      }
    }
  }

  Future<void> hasEnrolledBiometrics() async {
    try {
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      if (Platform.isIOS) {
        if (availableBiometrics.isNotEmpty) {
          isBiometricAvailable = true;
        }
      } else if (Platform.isAndroid) {
        // if (availableBiometrics.contains(BiometricType.strong)) {
        //   isFingerPrint = true;
        // }
        // if (availableBiometrics.contains(BiometricType.weak)) {
        //   isFaceAuth = true;
        // }
        isBiometricAvailable = availableBiometrics.isNotEmpty;
      }
    } on PlatformException {
      isBiometricAvailable = false;
    } catch (e) {
      isBiometricAvailable = false;
    } finally {
      update(['Login_Biometric']);
    }
  }

  Future<bool?> validate() async {
    if (Box3.status == AppStatus.loggedIn &&
        isBiometricAvailable &&
        Box3.isBiometricEnabled == true) {
      if (await authenticateWithBioMetric()) {
        Get.back();
        return true;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<bool> authenticateWithBioMetric() async {
    ignoreLifecycle = true;
    isAuthenticated = await auth
        .authenticate(
      localizedReason: 'Please_authenticate_to_proceed'.tr,
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: false,
        useErrorDialogs: true,
      ),
    )
        .onError((PlatformException error, stackTrace) {
      // apiAlertDialog(title: 'Error', message: error.message ?? '');
      return false;
    });
    return isAuthenticated;
  }

  @override
  void onInit() async {
    await hasEnrolledBiometrics();
    if ((isBiometricAvailable) &&
        (!isAuthenticated) &&
        Box3.isBiometricEnabled == true) {
      // if (await authenticateWithBioMetric()) {
      //   await mPinValidation(Box3.customerDetailsFZ?.data.pwdPin);
      // }
    }
    super.onInit();
    // checkVPN();
  }

  @override
  void onDetached() {
    debugPrint("life cycle onDetached");
    // isAuthenticated = false;
  }

  @override
  void onInactive() {
    debugPrint("life cycle onInactive");
    // isAuthenticated = false;
  }

  @override
  void onPaused() {
    debugPrint("life cycle onPaused");
    if (!ignoreLifecycle) {
      // isAuthenticated = false;
    }
  }

  @override
  void onResumed() async {
    // if (Platform.isAndroid && !isAuthenticated && !ignoreLifecycle) {
    //   fromResume = true;
    //   if (Get.find<AccountController>().appStatus == AppStatus.loggedIn) {
    //     isBack = true;
    //     if (Get.currentRoute != AppRoutes.preLogin) {
    //       isBack = true;
    //       Get.toNamed(Box3.configResponse.config.preLogin
    //           ? AppRoutes.preLogin
    //           : AppRoutes.login);
    //     } else {
    //       isBack = false;
    //     }
    //     if (kDebugMode) {
    //       print("life cycle onResumed");
    //     }
    //   }
    // }
  }

  final vpnCheck = VPNCheck();

  Future<void> checkRooted() async {
    isRooted = await DeviceSafetyInfo.isRootedDevice;
  }

  Future<void> checkScreenLock() async {
    isLock = await DeviceSafetyInfo.isScreenLock;
  }

  Future<void> checkRealDevice() async {
    isRealDevice = await DeviceSafetyInfo.isRealDevice;
  }

  Future<void> checkExternalStorage() async {
    isExternalStorage = await DeviceSafetyInfo.isExternalStorage;
  }

  Future<void> checkDevMode() async {
    isDevMode = await DeviceSafetyInfo.isDeveloperMode;
  }

  /// auth implementation

  AuthAttributes authAttributes = AuthAttributes();

  DialogMpinAuthAttributes dialogAuthAttributes = DialogMpinAuthAttributes();

  @override
  void onHidden() {}

  void showVPNDialog() {
    Get.dialog(
        Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                color: AppConfigs.w),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: AppConfigs.primaryColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "VPN or Proxy detected",
                        textAlign: TextAlign.center,
                        style: TS.f18.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Oops! You seem to be using a\nVPN or Proxy.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Please disable VPN or Proxy and \n return to access Mobile app.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  )
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }

  void showRooted() {
    Get.dialog(
        Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                color: AppConfigs.w),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: AppConfigs.primaryColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Device is Jail Break / Rooted",
                        textAlign: TextAlign.center,
                        style: TS.f18.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Oops! You seem to be using unsafe device.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Please use different device \n for access Mobile app.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  )
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }

  void showNoScreenLock() {
    Get.dialog(
        Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                color: AppConfigs.w),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: AppConfigs.primaryColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "No Auth Used",
                        textAlign: TextAlign.center,
                        style: TS.f18.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Oops! You are not using\nany lock.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Please secure you application using pin, biometric and face id.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  )
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }

  void showRealDevice() {
    Get.dialog(
        Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                color: AppConfigs.w),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: AppConfigs.primaryColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Emulator/Simulator",
                        textAlign: TextAlign.center,
                        style: TS.f18.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Oops! You are not using\nreal device.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Please user real device to accessing the Mobile app.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  )
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }

  void showExternalStorage() {
    Get.dialog(
        Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                color: AppConfigs.w),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: AppConfigs.primaryColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "External Storage",
                        textAlign: TextAlign.center,
                        style: TS.f18.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Oops! You are using\nsd card.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Please install application inside phone storage for accessing the Mobile app.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  )
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }

  void showDevMode() {
    Get.dialog(
        Container(
          alignment: Alignment.center,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                color: AppConfigs.w),
            child: Material(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: AppConfigs.primaryColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Developer Mode",
                        textAlign: TextAlign.center,
                        style: TS.f18.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Oops! You are enabled\ndeveloper mode.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Please disable developer mode to accessing the Mobile app.",
                    textAlign: TextAlign.center,
                    style: TS.f16,
                  )
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
