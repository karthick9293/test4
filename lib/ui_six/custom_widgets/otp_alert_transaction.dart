import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_six_custom_widgets.dart';
import '../../core/flavours/constants.dart';
import '../../models/reg_device/register_device_fz.dart';
import '../../network/api_service_new.dart';

Future<void> validateOTPTransaction({
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
      Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: GetBuilder<TransferController>(builder: (t) {
            return Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              padding: const EdgeInsets.fromLTRB(15, 27, 15, 0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
                  color: AppConfigs.bodybg(isDark)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.center, child: SvgPicture.string(SvgIcons.otp)),
                  Text(
                      customText ??
                          '${cms(Fields.ConfirmAuthentication_OTPSendOn).textHeading!} ${Box3.status == AppStatus.loggedIn ? Box3.customerDetailsFZ?.data!.mobileNo ?? '' : ''}',
                      style: TS.f14.copyWith(color: t.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                      textAlign: TextAlign.start),
                  textFormField(
                      controller: controller ?? TextEditingController(),
                      left: 0,
                      right: 0,
                      labelText: t.isDark ? null : cms(Fields.ConfirmAuthentication_OTPText).textHeading!,
                      hintText: t.isDark ? cms(Fields.ConfirmAuthentication_OTPText).textHeading! : null,
                      obscure: true,
                      maxLines: 1,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 6,
                      keyboardType: const TextInputType.numberWithOptions(signed: true),
                      errorText: t.errorText,
                      onChanged: (v) {
                        if (onChanged != null) {
                          onChanged(v);
                        }
                        t.update();
                      }),
                  Row(
                    children: [
                      Text("${"Enter the".tr} ${5} ${"digit OTP".tr}",
                          style: TS.f14.copyWith(color: isDark ? AppConfigs.gd7 : AppConfigs.g4), textAlign: TextAlign.start),
                      const Spacer(),
                      t.sending
                          ? Text(cms(Fields.ConfirmAuthentication_Sending).textHeading!,
                              style: TS.f14.copyWith(color: AppConfigs.primaryColor), textAlign: TextAlign.start)
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
                                        color: t.isDark ? AppConfigs.a9 : const Color(0xff444444),
                                      ),
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    t
                                      ..sending = true
                                      ..update();

                                    RegisterDeviceFZ? resend = await ApiService().generateOTP(userIdentification: UserIdentification.transaction);

                                    if (resend != null && resend.data?.notificationArray != null) {
                                      if (onResend != null) {
                                        onResend(resend.data!.notificationArray!.first.otpId);
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
                                  child: Text(cms(Fields.ConfirmAuthentication_ResendOTPButton).textHeading!,
                                      style: TS.f14.copyWith(color: AppConfigs.primaryColor), textAlign: TextAlign.start),
                                )
                    ],
                  ),
                  Get.find<TransferController>().loading
                      ? loader(top: 15, bottom: 15)
                      : roundButton(cms(Fields.ConfirmAuthentication_ContinueButton).textHeading!, left: 0, right: 0, top: 15, onTap: onValidate)
                ],
              ),
            );
          }),
        ),
      ),
      barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null,
      isScrollControlled: true,
      isDismissible: true);
}
