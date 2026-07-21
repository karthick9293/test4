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

Future<void> validateOTP(
    {TextEditingController? controller,
    required String errorText,
    void Function(String)? onChanged,
    dynamic Function()? onValidate,
    void Function(RegisterDeviceFZ? reg)? resendOTP,
    required String validationValue,
    String? customText}) async {
  bool isDark = Get.find<AccountController>().isDark;
  await Get.bottomSheet(
      Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: GetBuilder<TimerContoller>(builder: (t) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: AppConfigs.bodybg(isDark)),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Icon(Icons.close,
                                color: isDark ? AppConfigs.gd7 : AppConfigs.g4),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: cms(Fields.ConfirmAuthentication_Image)
                                      .image !=
                                  ""
                              ? Base64Image(
                                  image: cms(Fields.ConfirmAuthentication_Image)
                                      .image!)
                              : SvgPicture.asset(SvgIcons.otp)),
                      Text(
                          customText ??
                              '${cms(Fields.ConfirmAuthentication_OTPSendOn).textHeading!} ${Box3.status == AppStatus.loggedIn ? (obscureText(Box3.customerDetailsFZ?.data?.mobileNo ?? '')) : ''}',
                          style: TS.f14.copyWith(
                              color: t.isDark ? AppConfigs.gd7 : AppConfigs.g4),
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
                          }),
                      Row(
                        children: [
                          Text("${"Enter the".tr} ${6} ${"digit OTP".tr}",
                              style: TS.f14.copyWith(
                                  color:
                                      isDark ? AppConfigs.gd7 : AppConfigs.g4),
                              textAlign: TextAlign.start),
                          const Spacer(),
                          t.sending
                              ? Text(
                                  cms(Fields.ConfirmAuthentication_Sending)
                                      .textHeading!,
                                  style: TS.f14
                                      .copyWith(color: AppConfigs.primaryColor),
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

                                        RegisterDeviceFZ? resendResponse =
                                            await ApiService()
                                                .createOTP(validationValue);
                                        if (resendResponse != null) {
                                          if (resendResponse.data != null) {
                                            if (resendOTP != null) {
                                              resendOTP(resendResponse);
                                            }
                                            t.startTimer1();
                                            t
                                              ..sending = false
                                              ..update();
                                            t
                                              ..otpMessage = ''
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
                                        } else {
                                          t
                                            ..sending = false
                                            ..update();
                                          t
                                            ..isResend = false
                                            ..update();
                                        }
                                      },
                                      child: t.otpMessage.isEmpty == true
                                          ? Text(
                                              cms(Fields
                                                      .ConfirmAuthentication_ResendOTPButton)
                                                  .textHeading!,
                                              style: TS.f14.copyWith(
                                                  color:
                                                      AppConfigs.primaryColor),
                                              textAlign: TextAlign.start)
                                          : const SizedBox(),
                                    )
                        ],
                      ),
                      t.otpMessage.isEmpty == true
                          ? const SizedBox()
                          : const SizedBox(
                              height: 5,
                            ),
                      t.otpMessage.isEmpty == true
                          ? const SizedBox()
                          : Text(t.otpMessage,
                              style: TS.f14
                                  .copyWith(color: AppConfigs.primaryColor),
                              textAlign: TextAlign.start),
                      t.otpMessage.isEmpty == true
                          ? const SizedBox()
                          : const SizedBox(
                              height: 5,
                            ),
                      t.otpMessage.isEmpty == true
                          ? t.buttonLoading
                              ? loader(top: 15, bottom: 15)
                              : roundButton(
                                  cms(Fields
                                          .ConfirmAuthentication_ContinueButton)
                                      .textHeading!,
                                  left: 0,
                                  right: 0,
                                  top: 15,
                                  onTap: onValidate)
                          : const SizedBox()
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
      ignoreSafeArea: false,
      isDismissible: true);
  Get.find<TimerContoller>().stopTimer1();
}
