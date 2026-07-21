import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_two_custom_widgets.dart';
import '../../core/flavours/constants.dart';
import '../../models/reg_device/register_device_fz.dart';
import '../../network/api_service_new.dart';

Future<void> validateOTPLogin({
  TextEditingController? controller,
  required String errorText,
  void Function(String)? onChanged,
  dynamic Function()? onValidate,
  required String validationValue,
  Future<void> Function(String?)? onResend,
  dynamic data,
  String? customText,
}) async {
  bool isDark = Get.find<AccountController>().isDark;
  Get.find<SignUpController>()
    ..sending = false
    ..update();
  await Get.bottomSheet(
    GestureDetector(
      onTap: () {
        Get.find<SignUpController>().stopTimer1();
        Get.back();
      },
      child: Material(
        color: Colors.transparent,
        child: GetBuilder<SignUpController>(
            id: 'OTP_POPUP',
            builder: (t) {
              return GestureDetector(
                onTap: () {
                  Get.focusScope?.unfocus();
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
                                color:
                                    t.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                            textAlign: TextAlign.start),
                        textFormField(
                          controller: controller ?? TextEditingController(),
                          left: 0,
                          right: 0,
                          labelText: t.isDark
                              ? null
                              : cms(Fields.ConfirmAuthentication_OTPText)
                                  .textHeading!,
                          hintText: t.isDark
                              ? cms(Fields.ConfirmAuthentication_OTPText)
                                  .textHeading!
                              : null,
                          obscure: true,
                          maxLines: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 6,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true),
                          errorText: t.errorText,
                          onChanged: (v) {
                            if (onChanged != null) {
                              onChanged(v);
                            }
                            t.update();
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "${"Enter the".tr} ${6} ${"digit OTP".tr}",
                              style: TS.f14.copyWith(
                                  color:
                                      isDark ? AppConfigs.gd7 : AppConfigs.g4),
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            t.sending
                                ? Text(
                                    cms(Fields.ConfirmAuthentication_Sending)
                                        .textHeading!,
                                    style: TS.f14.copyWith(
                                        color: AppConfigs.primaryColor),
                                    textAlign: TextAlign.start,
                                  )
                                : t.timeToResend.abs() != 0
                                    ? Row(
                                        children: [
                                          SvgPicture.asset(
                                            ImagePath.clockTime,
                                            height: 12,
                                            width: 12,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "${t.timeToResend.abs()}s",
                                            style: TextStyles.font12.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff444444),
                                            ),
                                          ),
                                        ],
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          if (onResend != null) {
                                            onResend(null);
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

                                            //
                                            //
                                            // RegisterDeviceFZ? resend = await ApiService().generateOTP(userIdentification: UserIdentification.addCustmer,data: data);
                                            //
                                            // if(resend!=null && resend.data?.notificationArray!=null){
                                            //   if(onResend!=null){
                                            //     onResend(resend.data!.notificationArray!.first.otpId);
                                            //   }
                                            //   t.startTimer1();
                                            //   t
                                            //     ..sending = false
                                            //     ..update();
                                            //   t
                                            //     ..isResend = true
                                            //     ..update();
                                            // } else {
                                            //   t
                                            //     ..sending = false
                                            //     ..update();
                                            //   t
                                            //     ..isResend = false
                                            //     ..update();
                                            // }

                                            // String? result = await ApiService().resendOTP(
                                            //     validationType: "ID No",
                                            //     validationValue: validationValue);
                                            // if (result == 'Enter OTP') {
                                            //
                                            //
                                            // }
                                          }
                                        },
                                        child: Text(
                                          cms(Fields
                                                  .ConfirmAuthentication_ResendOTPButton)
                                              .textHeading!,
                                          style: TS.f14.copyWith(
                                              color: AppConfigs.primaryColor),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                          ],
                        ),
                        SizedBox(height: 20),
                        t.loading
                            ? loader(top: 15, bottom: 15)
                            : RowColumnButton(
                                reverseOrder:
                                    Box3.settings.EnableSwipeButton == true
                                        ? false
                                        : true,
                                isRow: Box3.settings.EnableSwipeButton == true
                                    ? false
                                    : true,
                                children: [
                                  roundButton(
                                      cms(Fields
                                              .ConfirmAuthentication_ContinueButton)
                                          .textHeading!,
                                      noMar: true,
                                      onTap: onValidate),
                                  roundButton(
                                    cms(Fields.PopUp_Cancel).textHeading ??
                                        "Cancel".tr,
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
              );
            }),
      ),
    ),
    barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null,
    isScrollControlled: true,
    isDismissible: true,
  );
}

Future<void> validateOTPForgot({
  TextEditingController? controller,
  required String errorText,
  void Function(String)? onChanged,
  void Function(String?)? onResend,
  dynamic Function()? onValidate,
  required String validationValue,
  String? customText,
}) async {
  bool isDark = Get.find<AccountController>().isDark;
  await Get.bottomSheet(
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
                onTap: () {
                  Get.focusScope?.unfocus();
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
                          textAlign: TextAlign.start,
                        ),
                        textFormField(
                          controller: controller ?? TextEditingController(),
                          left: 0,
                          right: 0,
                          labelText: t.isDark
                              ? null
                              : cms(Fields.ConfirmAuthentication_OTPText)
                                  .textHeading!,
                          hintText: t.isDark
                              ? cms(Fields.ConfirmAuthentication_OTPText)
                                  .textHeading!
                              : null,
                          obscure: true,
                          maxLines: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          maxLength: 6,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true),
                          errorText: t.errorText,
                          onChanged: (v) {
                            if (onChanged != null) {
                              onChanged(v);
                            }
                            t.update();
                          },
                        ),
                        Row(
                          children: [
                            Text(
                              "${"Enter the".tr} ${6} ${"digit OTP".tr}",
                              style: TS.f14.copyWith(
                                  color:
                                      isDark ? AppConfigs.gd7 : AppConfigs.g4),
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            t.sending
                                ? Text(
                                    cms(Fields.ConfirmAuthentication_Sending)
                                        .textHeading!,
                                    style: TS.f14.copyWith(
                                        color: AppConfigs.primaryColor),
                                    textAlign: TextAlign.start)
                                : t.timeToResend.abs() != 0
                                    ? Row(
                                        children: [
                                          SvgPicture.asset(
                                            ImagePath.clockTime,
                                            height: 12,
                                            width: 12,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            "${t.timeToResend.abs()}s",
                                            style: TextStyles.font12.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xff444444),
                                            ),
                                          ),
                                        ],
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          t
                                            ..sending = true
                                            ..update();

                                          RegisterDeviceFZ? resend =
                                              await ApiService()
                                                  .resendOtpRequest(
                                            userIdentification:
                                                UserIdentification.forgotMpin,
                                            idNo: Box3.customerDetailsFZ?.data
                                                    ?.idNo ??
                                                '',
                                            mobile: Box3.customerDetailsFZ?.data
                                                    ?.mobileNo ??
                                                '',
                                          );

                                          if (resend != null &&
                                              resend.data?.notificationArray !=
                                                  null) {
                                            if (onResend != null) {
                                              onResend(
                                                resend.data!.notificationArray!
                                                    .firstWhere((element) =>
                                                        element.messageType ==
                                                        'SMS')
                                                    .otpId,
                                              );
                                            }
                                            t.startTimer1();
                                            t
                                              ..sending = false
                                              ..update();
                                            t
                                              ..isResend = true
                                              ..update();
                                          } else {
                                            t
                                              ..sending = false
                                              ..update();
                                            t
                                              ..isResend = false
                                              ..update();
                                          }

                                          // String? result = await ApiService().resendOTP(
                                          //     validationType: "ID No",
                                          //     validationValue: validationValue);
                                          // if (result == 'Enter OTP') {
                                          //
                                          //
                                          // }
                                        },
                                        child: Text(
                                          cms(Fields
                                                  .ConfirmAuthentication_ResendOTPButton)
                                              .textHeading!,
                                          style: TS.f14.copyWith(
                                              color: AppConfigs.primaryColor),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                          ],
                        ),
                        SizedBox(height: 20),
                        t.loading
                            ? loader(top: 15, bottom: 15)
                            : RowColumnButton(
                                reverseOrder:
                                    Box3.settings.EnableSwipeButton == true
                                        ? false
                                        : true,
                                isRow: Box3.settings.EnableSwipeButton == true
                                    ? false
                                    : true,
                                children: [
                                  roundButton(
                                      cms(Fields
                                              .ConfirmAuthentication_ContinueButton)
                                          .textHeading!,
                                      noMar: true,
                                      onTap: onValidate),
                                  roundButton(
                                    cms(Fields.PopUp_Cancel).textHeading ??
                                        "Cancel".tr,
                                    noMar: true,
                                    isCancelButton: true,
                                    onTap: () {
                                      t.stopTimer1();
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
              );
            }),
      ),
    ),
    barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null,
    isScrollControlled: true,
    isDismissible: true,
  );
  Get.find<AccountController>().stopTimer1();
}
