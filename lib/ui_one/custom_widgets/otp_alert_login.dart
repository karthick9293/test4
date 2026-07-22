

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:mobiremit/ui_one/custom_widgets/row_column_button.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_one_custom_widgets.dart';
import '../../core/flavours/constants.dart';
import '../../models/reg_device/register_device_fz.dart';
import '../../network/api_service_new.dart';

class ValidateOTPForgotDefault extends StatelessWidget {
  final AccountController t;
  final TextEditingController? controller;
  final String errorText;
  final void Function(String)? onChanged;
  final void Function(String?)? onResend;
  final dynamic Function()? onValidate;
  final String validationValue;
  final String? customText;

  const ValidateOTPForgotDefault(
      {super.key,
      required this.t,
      this.controller,
      required this.errorText,
      this.onChanged,
      this.onResend,
      this.onValidate,
      required this.validationValue,
      this.customText});

  @override
  Widget build(BuildContext context) {
    bool isDark = t.isDark;
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
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0,
              )
            ],
            color: AppConfigs.bodybg(isDark),
          ),
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
                style: TS.f14
                    .copyWith(color: t.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                textAlign: TextAlign.start,
              ),
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
                          textAlign: TextAlign.start)
                      : t.timeToResend.abs() != 0
                          ? Row(
                              children: [
                                SvgPicture.asset(
                                  ImagePath.clockTime,
                                  height: 12,
                                  width: 12,
                                  colorFilter: isDark
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
                                    color: isDark
                                        ? AppConfigs.a9
                                        : const Color(0xff444444),
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
                                    await ApiService().resendOtpRequest(
                                  userIdentification:
                                      UserIdentification.forgotMpin,
                                  idNo:
                                      Box3.customerDetailsFZ?.data?.idNo ?? '',
                                  mobile:
                                      Box3.customerDetailsFZ?.data?.mobileNo ??
                                          '',
                                );

                                if (resend != null &&
                                    resend.data?.notificationArray != null) {
                                  if (onResend != null) {
                                    onResend?.call(
                                      resend.data!.notificationArray!
                                          .firstWhere((element) =>
                                              element.messageType == 'SMS')
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
  }
}
