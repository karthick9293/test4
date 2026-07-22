import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/exports/controllers.dart';
import '../../core/exports/ui_six_custom_widgets.dart';
import '../../core/flavours/constants.dart';

class UiSixLoginOtp extends StatelessWidget {
  final SignUpController t;
  final bool isDark;
  final TextEditingController? controller;
  final String? customText;
  final void Function(String)? onChanged;
  final Future<void> Function(String?)? onResend;
  final dynamic Function()? onValidate;
  final dynamic data;

  const UiSixLoginOtp({
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
    final companyLogo = Base64Image(
      image: Box3.companyLogo,
      fit: BoxFit.contain,
      padding: const EdgeInsets.all(8),
      height: 100,
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
    return Scaffold(
      backgroundColor: AppConfigs.bodybg(isDark),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: AppConfigs.linearGradientUiSix
          ),
          child: Column(
            children: [
              appBar0("Verify OTP",subTitle: customText ??
                  '${cms(Fields.ConfirmAuthentication_OTPSendOn).textHeading} ${Box3.status == AppStatus.loggedIn ? Box3.customerDetailsFZ?.data?.mobileNo ?? '' : ''}',onTap2: () {
                Get.find<SignUpController>().stopTimer1();
                Get.back();
              }),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.center,
                          child: SizedBox(height:150,child: Center(child: Image.asset(ImagePath.mobilePhone,height: 80,)))),
                      const SizedBox(height: 20),
                      Text(
                        "${"Enter the".tr} ${6} ${"digit OTP".tr}",
                        style: TS.f18B.copyWith(
                            color: isDark ? AppConfigs.gd7 : AppConfigs.g4),
                        textAlign: TextAlign.start,
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
                            borderRadius: 15,
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
                      // const Spacer(),
                      t.loading == true
                          ? loader(top: 20, bottom: 15)
                          : roundButton(
                        cms(Fields.ConfirmAuthentication_ContinueButton)
                            .textHeading ??
                            "Verify & Continue",
                        noMar: false,
                        onTap: onValidate,
                        left: 20,
                        right: 20,
                        top: 20
                      ),
                      const SizedBox(height: 10),
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
                      const SizedBox(height: 20),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
