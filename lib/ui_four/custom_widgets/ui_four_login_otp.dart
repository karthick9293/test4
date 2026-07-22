import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/exports/controllers.dart';
import '../../core/exports/ui_four_custom_widgets.dart';
import '../../core/flavours/constants.dart';

class UiFourLoginOtp extends StatelessWidget {
  final SignUpController t;
  final bool isDark;
  final TextEditingController? controller;
  final String? customText;
  final void Function(String)? onChanged;
  final Future<void> Function(String?)? onResend;
  final dynamic Function()? onValidate;
  final dynamic data;

  const UiFourLoginOtp({
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
    bool isDark = Get.isRegistered<MainController>()
        ? Get.find<MainController>().isDark
        : false;

    return Scaffold(
      backgroundColor: AppConfigs.bodybg(isDark),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Get.find<SignUpController>().stopTimer1();
                  Get.back();
                },
                child: Icon(Icons.arrow_back),
              ),
              title: Text(
                '',
                style: TS.f26B.copyWith(color: isDark ? AppConfigs.gd1 : null),
              ),
            ),
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
              customText ??
                  '${cms(Fields.ConfirmAuthentication_OTPSendOn).textHeading} ${Box3.status == AppStatus.loggedIn ? Box3.customerDetailsFZ?.data?.mobileNo ?? '' : ''}',
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
                  onChanged: (v) {
                    if (onChanged != null) {
                      onChanged?.call(v);
                    }
                    t.update();
                  },
                  onClear: () {
                    controller?.clear();
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (t.sending)
                  Text(
                    cms(Fields.ConfirmAuthentication_Sending).textHeading!,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppConfigs.primaryColor,
                    ),
                  )
                else ...[
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          isDark ? Colors.grey[400] : const Color(0xFF0F172A),
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
                            cms(Fields.ConfirmAuthentication_ResendOTPButton)
                                    .textHeading ??
                                "Resend Code",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppConfigs.primaryColor,
                            ),
                          ),
                        ),
                ]
              ],
            ),
            const Spacer(),
            t.loading == true
                ? loader(top: 15, bottom: 15)
                : roundButton(
                    cms(Fields.ConfirmAuthentication_ContinueButton)
                            .textHeading ??
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
