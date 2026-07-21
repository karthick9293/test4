import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_one_custom_widgets.dart';
import '../../core/flavours/constants.dart';
import '../../core/icons/svg_icons.dart';

class UiOneLoginOtp extends StatelessWidget {
  final SignUpController t;
  final bool isDark;
  final TextEditingController? controller;
  final String? customText;
  final void Function(String)? onChanged;
  final Future<void> Function(String?)? onResend;
  final dynamic Function()? onValidate;
  final dynamic data;

  const UiOneLoginOtp({
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
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0,
                  )
                ],
                color: AppConfigs.bodybg(isDark)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(SvgIcons.otp)),
                Text(
                    customText ??
                        '${cms(Fields.ConfirmAuthentication_OTPSendOn).textHeading} ${Box3.status == AppStatus.loggedIn ? Box3.customerDetailsFZ?.data?.mobileNo ?? '' : ''}',
                    style: TS.f14.copyWith(
                        color: t.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                    textAlign: TextAlign.start),
                textFormField(
                  controller: controller ?? TextEditingController(),
                  left: 0,
                  right: 0,
                  labelText: t.isDark
                      ? null
                      : cms(Fields.ConfirmAuthentication_OTPText).textHeading!,
                  hintText: t.isDark
                      ? cms(Fields.ConfirmAuthentication_OTPText).textHeading!
                      : null,
                  obscure: true,
                  maxLines: 1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 6,
                  keyboardType:
                      const TextInputType.numberWithOptions(signed: true),
                  errorText: t.errorText,
                  onChanged: (v) {
                    if (onChanged != null) {
                      onChanged?.call(v);
                    }
                    t.update();
                  },
                ),
                Row(
                  children: [
                    Text(
                      "${"Enter the".tr} ${6} ${"digit OTP".tr}",
                      style: TS.f14.copyWith(
                          color: isDark ? AppConfigs.gd7 : AppConfigs.g4),
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(),
                    t.sending
                        ? Text(
                            cms(Fields.ConfirmAuthentication_Sending)
                                .textHeading!,
                            style:
                                TS.f14.copyWith(color: AppConfigs.primaryColor),
                            textAlign: TextAlign.start,
                          )
                        : t.timeToResend.abs() != 0
                            ? Row(
                                children: [
                                  SvgPicture.asset(
                                    ImagePath.clockTime,
                                    height: 12,
                                    width: 12,
                                    colorFilter: t.isDark
                                        ? ColorFilter.mode(
                                            AppConfigs.a9,
                                            BlendMode.srcIn,
                                          )
                                        : null,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${t.timeToResend.abs()}s",
                                    style: TextStyles.font12.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: t.isDark
                                          ? AppConfigs.a9
                                          : const Color(0xff444444),
                                    ),
                                  ),
                                ],
                              )
                            : GestureDetector(
                                onTap: () async {
                                  if (onResend != null) {
                                    onResend?.call(null);
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
                                  cms(Fields
                                          .ConfirmAuthentication_ResendOTPButton)
                                      .textHeading!,
                                  style: TS.f14
                                      .copyWith(color: AppConfigs.primaryColor),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                  ],
                ),
                SizedBox(height: 20),
                t.loading
                    ? loader(top: 15, bottom: 15)
                    : RowColumnButton(
                        reverseOrder: Box3.settings.EnableSwipeButton == true
                            ? false
                            : true,
                        isRow: Box3.settings.EnableSwipeButton == true
                            ? false
                            : true,
                        children: [
                          roundButton(
                              cms(Fields.ConfirmAuthentication_ContinueButton)
                                  .textHeading!,
                              noMar: true,
                              onTap: onValidate),
                          roundButton(
                            cms(Fields.PopUp_Cancel).textHeading ?? "Cancel".tr,
                            noMar: true,
                            isCancelButton: true,
                            onTap: () {
                              Get.find<SignUpController>().stopTimer1();
                              Get.back();
                            },
                            borderOnly: true,
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ),
    );
    // return Align(
    //   alignment: Alignment.topCenter,
    //   child: Container(
    //     width: double.infinity,
    //     margin: const EdgeInsets.symmetric(horizontal: 20),
    //     padding: const EdgeInsets.all(16),
    //     decoration: BoxDecoration(
    //       color: AppConfigs.bodybg(isDark),
    //       borderRadius: const BorderRadius.vertical(top: Radius.circular(30), bottom: Radius.circular(30)),
    //     ),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         SvgPicture.asset(SvgIcons.otp, height: 60),
    //         const SizedBox(height: 15),
    //
    //         Text(
    //           customText ?? "Verification Code",
    //           style: TS.f16.copyWith(fontWeight: FontWeight.bold, color: t.isDark ? AppConfigs.gd7 : AppConfigs.g4),
    //           textAlign: TextAlign.center,
    //         ),
    //         const SizedBox(height: 20),
    //
    //         textFormField(
    //           controller: controller ?? TextEditingController(),
    //           textAlign: TextAlign.center, // Center the digits
    //           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    //           maxLength: 6,
    //           keyboardType: const TextInputType.numberWithOptions(signed: true),
    //           errorText: t.errorText,
    //           onChanged: (v) {
    //             final callback = onChanged;
    //             if (callback != null) {
    //               callback(v);
    //             }
    //             t.update();
    //           },
    //         ),
    //
    //         const SizedBox(height: 10),
    //
    //         if (t.timeToResend.abs() != 0)
    //           Text("Resend available in ${t.timeToResend.abs()}s", style: TS.f12.copyWith(color: Colors.grey))
    //         else
    //           TextButton(
    //             onPressed: () async {
    //               final resendFn = onResend;
    //               if (resendFn != null) {
    //                 await resendFn(null);
    //               } else {
    //                 t..sending = true..update();
    //                 await t.addCustomer(customerData: data, authData: {}, stepOrderId: "0");
    //                 t..sending = false..update();
    //               }
    //
    //             },
    //             child: Text("Resend Code", style: TextStyle(color: AppConfigs.primaryColor)),
    //           ),
    //
    //         const SizedBox(height: 25),
    //
    //         if(t.loading==true)loader()else...[roundButton("Verify & Continue", noMar: true, onTap: onValidate),
    //         const SizedBox(height: 10),
    //         TextButton(
    //           onPressed: () => Get.back(),
    //           child: Text("Cancel", style: TextStyle(color: Colors.grey)),
    //         ),]
    //       ],
    //     ),
    //   ),
    // );
  }
}
