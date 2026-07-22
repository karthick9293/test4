import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/ui_one/custom_widgets/otp_alert_login.dart';

import '../core/controllers/account_controller.dart';
import '../core/controllers/sign_up_controller.dart';
import '../core/flavours/app_config.dart';
import '../models/application_settings/settings_fz.dart';
import '../ui_six/custom_widgets/otp_alert_login.dart';

Future<void> validateOTPForgot({
  required AppUI currentUI,
  required String errorText,
  required String validationValue,
  TextEditingController? controller,
  void Function(String)? onChanged,
  dynamic Function()? onValidate,
  Future<void> Function(String?)? onResend,
  String? customText,
}) async {
  final signUpController = Get.find<AccountController>();
  final isDark = Get.find<AccountController>().isDark;

  signUpController
    ..sending = false
    ..update();

  await Get.dialog(
    GestureDetector(
      onTap: () {
        Get.find<AccountController>().stopTimer1();
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: GetBuilder<AccountController>(
          id: 'OTP_POPUP',
          builder: (t) {
            return GestureDetector(
              onTap: () => Get.focusScope?.unfocus(),
              child: currentUI.when(
                uiOne: () => ValidateOTPForgotDefault(
                  t: t,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  errorText: errorText,
                  validationValue: validationValue,
                ),
                uiTwo: () => ValidateOTPForgotDefault(
                  t: t,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  errorText: errorText,
                  validationValue: validationValue,
                ),
                uiThree: () => ValidateOTPForgotDefault(
                  t: t,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  errorText: errorText,
                  validationValue: validationValue,
                ),
                uiFour: () => ValidateOTPForgotDefault(
                  t: t,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  errorText: errorText,
                  validationValue: validationValue,
                ),
                uiFive: () => ValidateOTPForgotDefault(
                  t: t,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  errorText: errorText,
                  validationValue: validationValue,
                ),
                uiSix: () => UiSixValidateOTPForgot(
                  t: t,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  errorText: errorText,
                  validationValue: validationValue,
                ),
                uiSeven: () => ValidateOTPForgotDefault(
                  t: t,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  errorText: errorText,
                  validationValue: validationValue,
                ),
                defaultUI: () => ValidateOTPForgotDefault(
                  t: t,
                  controller: controller,
                  customText: customText,
                  onChanged: onChanged,
                  onResend: onResend,
                  onValidate: onValidate,
                  errorText: errorText,
                  validationValue: validationValue,
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
