import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../../core/controllers/main_controller.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../network/api_service_new.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (mainController) {
      return KeyboardActions(
        config: mainController.keyboardConfigMPIN(context),
        child: ListView(
          shrinkWrap: true,
          children: [
            textFormField(
              labelText: 'Current_Password'.tr,
              top: 30,
              maxLength: 15,
              onChanged: (s) {
                if (s.isNotEmpty) {
                  mainController
                    ..pwdAttributes.currentErrorText = ''
                    ..update();
                }
              },
              inputFormatters: [regexFormatter("[A-Za-z0-9!@#\$%&*]+")],
              keyboardType: TextInputType.emailAddress,
              controller:
                  mainController.pwdAttributes.currentPasswordController,
              nextNode: mainController.pwdAttributes.newPasswordFocusNode,
              errorText: mainController.pwdAttributes.currentErrorText,
              focusNode: mainController.pwdAttributes.currentPasswordFocusNode,
              obscure: mainController.pwdAttributes.currentObscure,
              trailing: GestureDetector(
                onTap: () async {
                  if (mainController.pwdAttributes.currentObscure) {
                    mainController
                      ..pwdAttributes.currentObscure = false
                      ..update();
                    await Future.delayed(const Duration(seconds: 2));
                    mainController
                      ..pwdAttributes.currentObscure = true
                      ..update();
                  }
                },
                child: Icon(
                  mainController.pwdAttributes.currentObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 20,
                  color: AppConfigs.g77,
                ),
              ),
            ),
            textFormField(
              labelText: 'new_password'.tr,
              maxLength: 15,
              focusNode: mainController.pwdAttributes.newPasswordFocusNode,
              errorText: mainController.pwdAttributes.newErrorText,
              nextNode: mainController.pwdAttributes.confirmPasswordFocusNode,
              controller: mainController.pwdAttributes.newPasswordController,
              inputFormatters: [regexFormatter("[A-Za-z0-9!@#\$%&*]+")],
              keyboardType: TextInputType.emailAddress,
              onChanged: (v) {
                mainController
                  ..pwdAttributes.passwordStrength =
                      (v.contains(RegExp(r'[A-Z]')) ? 0.20 : 0) +
                          (v.contains(RegExp(r'[a-z]')) ? 0.20 : 0) +
                          (v.contains(RegExp(r'[0-9]')) ? 0.20 : 0) +
                          (v.contains(RegExp(r'[!@#$&*~]')) ? 0.20 : 0) +
                          (v.length > 7 ? 0.20 : 0)
                  ..update();
                if (v.isNotEmpty) {
                  mainController
                    ..pwdAttributes.newErrorText = ''
                    ..update();
                }
              },
              obscure: mainController.pwdAttributes.newObscure,
              trailing: GestureDetector(
                onTap: () async {
                  if (mainController.pwdAttributes.newObscure) {
                    mainController
                      ..pwdAttributes.newObscure = false
                      ..update();
                    await Future.delayed(const Duration(seconds: 2));
                    mainController
                      ..pwdAttributes.newObscure = true
                      ..update();
                  }
                },
                child: Icon(
                  mainController.pwdAttributes.newObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 20,
                  color: AppConfigs.g77,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 9),
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      tween: Tween<double>(
                        begin: 0,
                        end: mainController.pwdAttributes.passwordStrength,
                      ),
                      builder: (context, value, w) => LinearProgressIndicator(
                        value: value,
                        color: value < 0.5
                            ? Color.alphaBlend(
                                const Color(0xffc11010)
                                    .withOpacity((0.5 - value) * 2),
                                Colors.yellow.withOpacity(value * 2))
                            : Color.alphaBlend(
                                Colors.yellow.withOpacity(1 - value),
                                Colors.green.withOpacity(value)),
                        // value < 0.2
                        //     ? Colors.red //const Color(0xffc11010)
                        //     : value < 0.81
                        //         ? Colors.yellow
                        //         : Colors.green,
                        backgroundColor: AppConfigs.g70.withOpacity(0.2),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                        mainController.pwdAttributes.passwordStrength < 0.20
                            ? 'weak'.tr
                            : mainController.pwdAttributes.passwordStrength <
                                    0.81
                                ? 'Medium'.tr
                                : 'Strong'.tr,
                        style: TS.f14),
                  ),
                  textConstratint(
                      'contains_at_least_one_uppercase'.tr,
                      mainController.pwdAttributes.newPasswordController.text
                          .contains(RegExp(r'[A-Z]'))),
                  textConstratint(
                      'contains_at_least_one_lowercase'.tr,
                      mainController.pwdAttributes.newPasswordController.text
                          .contains(RegExp(r'[a-z]'))),
                  textConstratint(
                      'contains_at_least_one_number'.tr,
                      mainController.pwdAttributes.newPasswordController.text
                          .contains(RegExp(r'[0-9]'))),
                  textConstratint(
                      'contains_at_least_one_special_char'.tr,
                      mainController.pwdAttributes.newPasswordController.text
                          .contains(RegExp(r'[!@#\$&*~]'))),
                  textConstratint(
                      'Password length 8-15 characters',
                      mainController
                              .pwdAttributes.newPasswordController.text.length >
                          7),
                ],
              ),
            ),
            textFormField(
              labelText: 'Confirm_Password'.tr,
              maxLength: 15,
              onChanged: (s) {
                if (s.isNotEmpty) {
                  mainController
                    ..pwdAttributes.confirmErrorText = ''
                    ..update();
                }
              },
              inputFormatters: [regexFormatter("[A-Za-z0-9!@#\$%&*]+")],
              keyboardType: TextInputType.emailAddress,
              controller:
                  mainController.pwdAttributes.confirmPasswordController,
              focusNode: mainController.pwdAttributes.confirmPasswordFocusNode,
              errorText: mainController.pwdAttributes.confirmErrorText,
              obscure: mainController.pwdAttributes.confirmObscure,
              trailing: GestureDetector(
                onTap: () async {
                  if (mainController.pwdAttributes.confirmObscure) {
                    mainController
                      ..pwdAttributes.confirmObscure = false
                      ..update();
                    await Future.delayed(const Duration(seconds: 2));
                    mainController
                      ..pwdAttributes.confirmObscure = true
                      ..update();
                  }
                },
                child: Icon(
                  mainController.pwdAttributes.confirmObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 20,
                  color: AppConfigs.g77,
                ),
              ),
            ),
            mainController.buttonLoading
                ? loader(top: 30)
                : roundButton(
                    'change_password'.tr,
                    top: 30,
                    onTap: () async {
                      if (!mainController.pwdAttributes.validate('Password')) {
                        mainController.update();
                      } else {
                        if (Get.focusScope?.hasFocus == true) {
                          Get.focusScope!.unfocus();
                        }
                        mainController
                          ..buttonLoading = true
                          ..update();
                        String? s = await ApiService().changelogincredential(
                            oldCred: mainController
                                .pwdAttributes.currentPasswordController.text,
                            newCred: mainController
                                .pwdAttributes.confirmPasswordController.text,
                            credentialType: 'Password');
                        mainController
                          ..buttonLoading = false
                          ..update();
                        Get.showSnackbar(GetSnackBar(
                          messageText: Text(
                            s == 'SUCCESS'
                                ? '${'Password'.tr}${' changed Successfully'.tr}'
                                : 'Invalid ${'Password'.tr}',
                            style: TS.f14.copyWith(color: AppConfigs.w),
                          ),
                          backgroundColor:
                              (s == 'SUCCESS' ? AppConfigs.dg : Colors.red)
                                  .withOpacity(0.7),
                          duration: const Duration(seconds: 2),
                        ));
                        await Future.delayed(const Duration(seconds: 2));
                        if (mainController.pages.last.runtimeType ==
                                ChangePassword &&
                            s == 'SUCCESS') {
                          mainController.pwdAttributes.clear();
                          mainController.pop();
                        }
                      }
                    },
                  )
          ],
        ),
      );
    });
  }
}
