import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/controllers/account_controller.dart';
import '../core/controllers/sign_up_controller.dart';
import '../core/flavours/app_config.dart';
import '../models/application_settings/settings_fz.dart';
import '../ui_four/custom_widgets/ui_four_login_otp.dart';
import '../ui_one/custom_widgets/ui_one_login_otp.dart';
import '../ui_six/custom_widgets/ui_six_login_otp.dart';
import '../ui_three/custom_widgets/ui_three_login_otp.dart';
import '../ui_two/custom_widgets/ui_two_login_otp.dart';

Future<void> validateOTPLogin({
  required AppUI currentUI,
  required String errorText,
  required String validationValue,
  TextEditingController? controller,
  void Function(String)? onChanged,
  dynamic Function()? onValidate,
  Future<void> Function(String?)? onResend,
  dynamic data,
  String? customText,
}) async {
  final signUpController = Get.find<SignUpController>();
  final isDark = Get.find<AccountController>().isDark;

  signUpController
    ..sending = false
    ..update();

  await Get.dialog(
    GestureDetector(
      onTap: () {
        signUpController.stopTimer1();
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: GetBuilder<SignUpController>(
          id: 'OTP_POPUP',
          builder: (t) {
            return GestureDetector(
              onTap: () => Get.focusScope?.unfocus(),
              child: currentUI.when(
                uiOne: () => UiOneLoginOtp(
                  t: t,
                  isDark: isDark,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  data: data,
                ),
                uiTwo: () => UiTwoLoginOtp(
                  t: t,
                  isDark: isDark,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  data: data,
                ),
                uiThree: () => UiThreeLoginOtp(
                  t: t,
                  isDark: isDark,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  data: data,
                ),
                uiFour: () => UiFourLoginOtp(
                  t: t,
                  isDark: isDark,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  data: data,
                ),
                uiFive: () => UiFourLoginOtp(
                  t: t,
                  isDark: isDark,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  data: data,
                ),
                uiSix: () => UiSixLoginOtp(
                  t: t,
                  isDark: isDark,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  data: data,
                ),
                uiSeven: () => UiThreeLoginOtp(
                  t: t,
                  isDark: isDark,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  data: data,
                ),
                defaultUI: () => UiOneLoginOtp(
                  t: t,
                  isDark: isDark,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  data: data,
                ),
              ),
            );
          },
        ),
      ),
    ),
    barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null,
  ).whenComplete(() {});
}
