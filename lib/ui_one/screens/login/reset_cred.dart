import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/account_controller.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../network/api_service_new.dart';
import '../../../core/flavours/app_routes.dart';
import '../sign_up/nid_alerts.dart';

class ResetCredentials extends StatelessWidget {
  const ResetCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    String authenticationMethod2 = Box3.settings.LOGINAUTHENTICATIONSECONDARY;
    return GetBuilder<AccountController>(builder: (a) {
      return Scaffold(
        appBar: appBar0('Reset_Credentials'.tr, onTap2: Get.back),
        backgroundColor: AppConfigs.bodybg(a.isDark),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 25, right: 25, top: 15, bottom: 20),
              child: Text(
                "To ensure the security of your account, we kindly ask you to reset your login credentials.",
                style: TextStyles.font16.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: a.isDark ? AppConfigs.w : AppConfigs.g8f),
              ),
            ),
            textFormField(
              labelText: authenticationMethod2 == 'MPIN'
                  ? 'New_MPIN'.tr
                  : 'new_password'.tr,
              bottom: 10,
              inputFormatters: [
                authenticationMethod2 == 'MPIN'
                    ? FilteringTextInputFormatter.digitsOnly
                    : FilteringTextInputFormatter.allow(
                        RegExp("[A-Za-z0-9!@#\$%&*]+"))
              ],
              keyboardType: authenticationMethod2 == 'MPIN'
                  ? TextInputType.number
                  : TextInputType.emailAddress,
              maxLength: authenticationMethod2 == 'MPIN' ? 6 : 8,
              controller: a.fptc.newPwd,
              errorText: a.fptc.newPwddErrTxt,
              onChanged: (v) {
                if (a.fptc.newPwddErrTxt.isNotEmpty &&
                    a.fptc.newPwd.text.isNotEmpty) {
                  a.fptc.newPwddErrTxt = '';
                }
                a
                  ..forgotPwdStrength =
                      (v.contains(RegExp(r'[A-Z]')) ? 0.33 : 0) +
                          (v.contains(RegExp(r'[0-9]')) ? 0.33 : 0) +
                          (v.contains(RegExp(r'[!@#\$&*~]')) ? 0.34 : 0)
                  ..update();
              },
              obscure: a.attributes.newObscure,
              trailing: GestureDetector(
                onTap: () async {
                  if (a.attributes.newObscure) {
                    a
                      ..attributes.newObscure = false
                      ..update();
                    await Future.delayed(const Duration(seconds: 2));
                    a
                      ..attributes.newObscure = true
                      ..update();
                  }
                },
                child: Icon(
                  a.attributes.newObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 20,
                  color: AppConfigs.g77,
                ),
              ),
            ),
            Visibility(
              visible: authenticationMethod2 != 'MPIN',
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                tween: Tween<double>(
                  begin: 0,
                  end: a.forgotPwdStrength,
                ),
                builder: (context, value, _) => Container(
                    margin: const EdgeInsets.only(
                        left: 20, bottom: 8, right: 20, top: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2.5),
                      child: LinearProgressIndicator(
                        minHeight: 5,
                        value: value,
                        color: value < 0.34
                            ? const Color(0xffc11010)
                            : value < 0.68
                                ? Colors.yellow
                                : Colors.green,
                        backgroundColor: ConstColors.grey70.withOpacity(0.25),
                      ),
                    )),
              ),
            ),
            Visibility(
              visible: authenticationMethod2 != 'MPIN',
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 6, right: 32),
                child: Text(
                  'weak'.tr,
                  style: TS.f14,
                ),
              ),
            ),
            Visibility(
              visible: authenticationMethod2 != 'MPIN',
              child: Padding(
                padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
                child: Column(
                  children: [
                    textConstratint('contains_at_least_one_uppercase'.tr,
                        a.fptc.newPwd.text.contains(RegExp(r'[A-Z]'))),
                    textConstratint('contains_at_least_one_lowercase'.tr,
                        a.fptc.newPwd.text.contains(RegExp(r'[a-z]'))),
                    textConstratint('contains_at_least_one_number'.tr,
                        a.fptc.newPwd.text.contains(RegExp(r'[0-9]'))),
                    textConstratint('contains_at_least_one_special_char'.tr,
                        a.fptc.newPwd.text.contains(RegExp(r'[!@#\$&*~]'))),
                    textConstratint(
                        'Password length 8-$pwdMaxLength characters',
                        a.fptc.newPwd.text.length > 7)
                  ],
                ),
              ),
            ),
            textFormField(
              labelText: authenticationMethod2 == 'MPIN'
                  ? 'Confirm_MPIN'.tr
                  : 'confirm_password'.tr,
              bottom: 0,
              top: 17,
              controller: a.fptc.confPwd,
              errorText: a.fptc.cnfPwdErrTxt,
              maxLength: authenticationMethod2 == 'MPIN' ? 6 : 8,
              onChanged: (v) {
                if (a.fptc.cnfPwdErrTxt.isNotEmpty &&
                    a.fptc.confPwd.text.isNotEmpty) {
                  a.fptc.cnfPwdErrTxt = '';
                }
                a.update();
              },
              inputFormatters: [
                authenticationMethod2 == 'MPIN'
                    ? FilteringTextInputFormatter.digitsOnly
                    : FilteringTextInputFormatter.allow(
                        RegExp("[A-Za-z0-9!@#\$%&*]+"))
              ],
              keyboardType: authenticationMethod2 == 'MPIN'
                  ? TextInputType.number
                  : TextInputType.emailAddress,
              obscure: a.attributes.confirmObscure,
              trailing: GestureDetector(
                onTap: () async {
                  if (a.attributes.confirmObscure) {
                    a
                      ..attributes.confirmObscure = false
                      ..update();
                    await Future.delayed(const Duration(seconds: 2));
                    a
                      ..attributes.confirmObscure = true
                      ..update();
                  }
                },
                child: Icon(
                  a.attributes.confirmObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 20,
                  color: AppConfigs.g77,
                ),
              ),
            ),
            a.buttonLoading
                ? loader(top: 20)
                : roundButton(cms(Fields.PopUp_Submit).textHeading!, top: 20,
                    onTap: () async {
                    if (a.fptc.validate(
                        authenticationMethod2: authenticationMethod2)) {
                      a
                        ..buttonLoading = true
                        ..update();
                      bool status = authenticationMethod2 == 'MPIN'
                          ? await ApiService().resetMpin(
                              validationValue: Box3.settings.processEkycAs ==
                                      'UAEPASS'
                                  ? a.ltc.usernameCtrl.text
                                  : Box3.customerDetailsFZ?.data!.idNo ?? '',
                              mpin: a.fptc.confPwd.text)
                          : await ApiService().resetPassword(
                              validationValue: Box3.settings.processEkycAs ==
                                      'UAEPASS'
                                  ? a.ltc.usernameCtrl.text
                                  : Box3.customerDetailsFZ?.data?.idNo ?? '',
                              password: a.fptc.confPwd.text);
                      if (status) {
                        // if (Box3.settings.authenticationPreferences
                        //         .authenticationMethod2 ==
                        //     'MPIN') {
                        //   await Box3.saveUserData(Box3.customerDetailsFZ?.data?.rebuild(
                        //       (p0) => p0.mpin = a.fptc.confPwd.text));
                        //   Box3.customerDetailsFZ?.data = Box3.customerDetailsFZ?.data?.rebuild(
                        //       (p0) => p0.mpin = a.fptc.confPwd.text);
                        // } else {
                        //   await Box3.saveUserData(Box3.customerDetailsFZ?.data?.rebuild(
                        //       (p0) => p0.password = a.fptc.confPwd.text));
                        //   Box3.customerDetailsFZ?.data = Box3.customerDetailsFZ?.data?.rebuild(
                        //       (p0) => p0.password = a.fptc.confPwd.text);
                        // }

                        Get.focusScope?.unfocus();
                        a.fptc.newPwd.clear();
                        a.fptc.confPwd.clear();

                        Get.dialog(successAlert(a.isDark,
                            content:
                                '${authenticationMethod2 == 'MPIN' ? 'MPIN' : 'Password'} Changed successfully'));
                        await Future.delayed(
                            const Duration(milliseconds: 1500));
                        Get.offAllNamed(AppRoutes.login);
                        a
                          ..forgotPageCount = 0
                          ..update();
                      }
                      a
                        ..buttonLoading = false
                        ..update();
                    } else {
                      a.update();
                    }
                  }),
          ],
        ),
      );
    });
  }
}
