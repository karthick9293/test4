import 'package:mobiremit/core/controllers/account_controller.dart';
import 'package:mobiremit/core/controllers/sign_up_controller.dart';
import 'package:mobiremit/models/reg_device/register_device_fz.dart';
import 'package:mobiremit/network/api_service_new.dart';
import 'package:mobiremit/network/api_endpoints.dart';
import 'package:mobiremit/ui_two/custom_widgets/fail_alert.dart';
import 'package:mobiremit/ui_two/custom_widgets/loader.dart';
import 'package:mobiremit/ui_two/custom_widgets/round_button.dart';
import 'package:mobiremit/ui_two/custom_widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/flavours/constants.dart';

Future<RegisterDeviceFZ?> identityVerificationMailAlert(String type, {required String customerCode, required String mobileNo}) async {
  RegisterDeviceFZ? otpData;
  Get.find<SignUpController>().ivAttributes.idMailError = '';
  await Get.dialog(
    GetBuilder<SignUpController>(builder: (signupCntrl) {
      return Container(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
              color: signupCntrl.isDark ? AppConfigs.b : AppConfigs.w),
          child: Material(
            color: AppConfigs.t,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(top: 16, right: 0),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          ImagePath.close,
                          height: 20,
                          width: 20,
                          colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          child: Text(
                            type,
                            style: TS.f20.copyWith(color: signupCntrl.isDark ? AppConfigs.w : AppConfigs.g4),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textFormField(
                            left: 10,
                            right: 10,
                            labelText: 'email_address'.tr,
                            controller: signupCntrl.ivAttributes.idMailController,
                            errorText: signupCntrl.ivAttributes.idMailError,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (v) {
                              if (v.isNotEmpty) {
                                signupCntrl.ivAttributes.idMailError = '';
                                signupCntrl.ivAttributes.updateEmail = v;
                                signupCntrl.update();
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        signupCntrl.ivAttributes.mailVerificationSubmit == false
                            ? roundButton(
                                'submit'.tr,
                                top: 15,
                                left: 10,
                                right: 10,
                                bottom: 8,
                                onTap: () async {
                                  if (signupCntrl.ivAttributes.idMailController.text.isEmpty) {
                                    signupCntrl.ivAttributes.idMailError = 'required'.tr;
                                    signupCntrl.update();
                                  } else if (!signupCntrl.ivAttributes.idMailController.text.isEmail) {
                                    signupCntrl.ivAttributes.idMailError = 'invalid_email'.tr;
                                    signupCntrl.update();
                                  } else {
                                    signupCntrl.ivAttributes.idMailError = '';
                                    signupCntrl
                                      ..ivAttributes.mailVerificationSubmit = true
                                      ..update();

                                    var updateCustReqData = {
                                      "Token": Box3.appKeyToken,
                                      "Data": {
                                        "CustomerCode": customerCode,
                                        "Email": signupCntrl.ivAttributes.idMailController.text,
                                        "MobileNo": mobileNo,
                                      },
                                    };

                                    bool isUpdated = await ApiService().updateCustomerDetails(updateCustReqData);

                                    if (isUpdated) {
                                      RegisterDeviceFZ? data = await ApiService().createOTP(
                                        OtpType.CREATE_CUSTOMEREMAIL_OTP,
                                        email: signupCntrl.ivAttributes.idMailController.text,
                                      );

                                      if (data?.statusCode == "RMA-SUCC") {
                                        // _.ivAttributes.updateEmail = _.ivAttributes.email.text;
                                        // await Future.delayed(
                                        //     const Duration(seconds: 2));
                                        otpData = data;
                                        signupCntrl.ivAttributes.idMailController.clear();
                                        signupCntrl
                                          ..ivAttributes.mailVerificationSubmit = false
                                          ..update();
                                        Get.back();
                                      } else {
                                        // await Future.delayed(
                                        //     const Duration(seconds: 2));
                                        signupCntrl.ivAttributes.idMailController.clear();
                                        showFailAlert(content: data?.customMessageDetails?.messageDescription ?? '');
                                        signupCntrl
                                          ..ivAttributes.mailVerificationSubmit = false
                                          ..update();
                                        Get.back();
                                      }
                                    } else {
                                      signupCntrl
                                        ..ivAttributes.mailVerificationSubmit = false
                                        ..update();
                                    }
                                  }
                                },
                              )
                            : loader(top: 20)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }),
    barrierColor: Get.find<AccountController>().isDark ? AppConfigs.w.withOpacity(0.2) : null,
  );

  return otpData;
}
