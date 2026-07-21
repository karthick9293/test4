import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mobiremit/models/application_settings/settings_fz.dart';
import 'package:pinput/pinput.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

class MpinPut extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final String errorText;
  final FocusNode? focusNode;
  final Widget? trailing;
  final bool autofocus;
  final bool obscureText;
  final String? obscuringCharacter;
  final void Function()? onClear;
  final double borderRadius;

  const MpinPut(
      {super.key,
      this.controller,
      this.onChanged,
      this.onCompleted,
      this.errorText = '',
      this.focusNode,
      this.trailing,
      this.autofocus = false,
      this.obscureText = true,
      this.obscuringCharacter,
      this.onClear,
      this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      return SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Pinput(
                      length: 6,
                      controller: controller,
                      autofocus: autofocus,
                      focusNode: focusNode,
                      obscureText: obscureText,
                      obscuringCharacter: obscuringCharacter ?? "*",
                      errorText: errorText.isNotEmpty ? errorText : null,
                      errorTextStyle: TextStyles.font10.copyWith(
                        color: accountController.isDark
                            ? AppConfigs.w
                            : const Color(0xffa20202),
                        fontWeight: FontWeight.w600,
                      ),
                      onCompleted: onCompleted,
                      onChanged: onChanged,
                      submittedPinTheme: Box3.primaryUI == AppUI.uiOne
                          ? _pinTheme(context, accountController, errorText,
                              borderRadius: borderRadius,
                              borderColor: AppConfigs.primaryColor,
                              color: AppConfigs.primaryColor)
                          : null,
                      defaultPinTheme: _pinTheme(
                        context,
                        accountController,
                        errorText,
                        borderRadius: borderRadius,
                      ),
                      focusedPinTheme: _pinTheme(
                        context,
                        accountController,
                        errorText,
                        borderRadius: borderRadius,
                        borderColor: AppConfigs.primaryColor,
                      ),
                    ),
                  ),
                  if (errorText.isNotEmpty)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 6,
                          right: MediaQuery.sizeOf(context).width * 0.08,
                        ),
                        child: Text(
                          errorText,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 13),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (trailing != null)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: onClear,
                  child: trailing!,
                ),
              ),
          ],
        ),
      );
    });
  }

  PinTheme _pinTheme(BuildContext context, AccountController accountController,
      String errorText,
      {double borderRadius = 8, Color? borderColor, Color? color}) {
    return PinTheme(
      width: MediaQuery.sizeOf(context).width / 8.5,
      height: MediaQuery.sizeOf(context).width / 8.5,
      textStyle: TextStyle(
          color:
              accountController.isDark || color != null ? AppConfigs.w : null),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        border: Border.all(
          color: errorText.isNotEmpty
              ? AppConfigs.der
              : borderColor ??
                  (accountController.isDark ? AppConfigs.g70 : AppConfigs.gb5),
        ),
      ),
    );
  }
}
