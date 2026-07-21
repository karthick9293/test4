import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/exports/ui_seven_custom_widgets.dart';

import '../../core/exports/controllers.dart';
import '../../core/flavours/app_config.dart';
import '../../core/flavours/constants.dart';

class UiThreeLoginOtp extends StatelessWidget {
  final SignUpController t;
  final bool isDark;
  final TextEditingController? controller;
  final String? customText;
  final void Function(String)? onChanged;
  final Future<void> Function(String?)? onResend;
  final dynamic Function()? onValidate;
  final dynamic data;

  const UiThreeLoginOtp({
    super.key,
    required this.t,
    required this.isDark,
    this.controller,
    this.customText,
    this.onChanged,
    this.onResend,
    this.onValidate,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    String currentOtp = controller?.text ?? "";
    bool isDark = Get.isRegistered<MainController>()
        ? Get.find<MainController>().isDark
        : false;
    return Scaffold(
      backgroundColor: AppConfigs.bodybg(isDark),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appBar0('', onTap2: () {
              Get.back();
            }),
            const SizedBox(height: 20),
            Text(
              "Enter Verification Code",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? Colors.white
                    : const Color(0xFF0F172A), // Dark blueish black
              ),
            ),
            const SizedBox(height: 12),
            Text(
              customText ?? "Enter the 6-digit code sent to your number.",
              style: TextStyle(
                fontSize: 14,
                color: isDark
                    ? Colors.grey[400]
                    : const Color(0xFF64748B), // Grey text
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 3),
              child: Center(
                child: MpinPut(
                    borderRadius: 25,
                    controller: controller,
                    errorText: t.errorText,
                    onChanged: (s) {},
                    onClear: () {
                      controller?.clear();
                    }),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the code? ",
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey[400] : const Color(0xFF0F172A),
                  ),
                ),
                t.timeToResend.abs() != 0
                    ? Text(
                        "Resend after ${t.timeToResend.abs()}s",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppConfigs.primaryColor,
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          final resendFn = onResend;
                          if (resendFn != null) {
                            await resendFn(null);
                          } else {
                            t
                              ..sending = true
                              ..update();
                            await t.addCustomer(
                                customerData: data,
                                authData: {},
                                stepOrderId: "0");
                            t
                              ..sending = false
                              ..update();
                          }
                        },
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppConfigs.primaryColor,
                          ),
                        ),
                      ),
              ],
            ),
            const Spacer(),
            t.loading == true
                ? loader()
                : roundButton(
                    "Verify & Continue",
                    noMar: false,
                    onTap: onValidate,
                    left: 20,
                    right: 20,
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
