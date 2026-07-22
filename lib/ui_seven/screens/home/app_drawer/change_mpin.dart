import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../../core/controllers/main_controller.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../network/api_service_new.dart';

class ChangeMPIN extends StatelessWidget {
  const ChangeMPIN({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (mainController) {
      return KeyboardActions(
        config: mainController.keyboardConfigMPIN(context),
        child: ListView(
          shrinkWrap: true,
          children: [
            textFormField(
              labelText: 'Current_MPIN'.tr,
              top: 30,
              maxLength: 6,
              onChanged: (s) {
                if (s.isNotEmpty) {
                  mainController
                    ..pinAttributes.currentErrorText = ''
                    ..update();
                }
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              controller:
                  mainController.pinAttributes.currentPasswordController,
              nextNode: mainController.pinAttributes.newPasswordFocusNode,
              errorText: mainController.pinAttributes.currentErrorText,
              focusNode: mainController.pinAttributes.currentPasswordFocusNode,
              obscure: mainController.pinAttributes.currentObscure,
              trailing: GestureDetector(
                onTap: () async {
                  if (mainController.pinAttributes.currentObscure) {
                    mainController
                      ..pinAttributes.currentObscure = false
                      ..update();
                    await Future.delayed(const Duration(seconds: 2));
                    mainController
                      ..pinAttributes.currentObscure = true
                      ..update();
                  }
                },
                child: Icon(
                  mainController.pinAttributes.currentObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 20,
                  color: AppConfigs.g77,
                ),
              ),
            ),
            textFormField(
              labelText: 'New_MPIN'.tr,
              maxLength: 6,
              focusNode: mainController.pinAttributes.newPasswordFocusNode,
              errorText: mainController.pinAttributes.newErrorText,
              nextNode: mainController.pinAttributes.confirmPasswordFocusNode,
              controller: mainController.pinAttributes.newPasswordController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              onChanged: (v) {
                if (v.isNotEmpty) {
                  mainController
                    ..pinAttributes.newErrorText = ''
                    ..update();
                }
              },
              obscure: mainController.pinAttributes.newObscure,
              trailing: GestureDetector(
                onTap: () async {
                  if (mainController.pinAttributes.newObscure) {
                    mainController
                      ..pinAttributes.newObscure = false
                      ..update();
                    await Future.delayed(const Duration(seconds: 2));
                    mainController
                      ..pinAttributes.newObscure = true
                      ..update();
                  }
                },
                child: Icon(
                  mainController.pinAttributes.newObscure
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: 20,
                  color: AppConfigs.g77,
                ),
              ),
            ),
            textFormField(
              labelText: 'Confirm_MPIN'.tr,
              maxLength: 6,
              onChanged: (s) {
                if (s.isNotEmpty) {
                  mainController
                    ..pinAttributes.confirmErrorText = ''
                    ..update();
                }
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
              controller:
                  mainController.pinAttributes.confirmPasswordController,
              focusNode: mainController.pinAttributes.confirmPasswordFocusNode,
              errorText: mainController.pinAttributes.confirmErrorText,
              obscure: mainController.pinAttributes.confirmObscure,
              trailing: GestureDetector(
                onTap: () async {
                  if (mainController.pinAttributes.confirmObscure) {
                    mainController
                      ..pinAttributes.confirmObscure = false
                      ..update();
                    await Future.delayed(const Duration(seconds: 2));
                    mainController
                      ..pinAttributes.confirmObscure = true
                      ..update();
                  }
                },
                child: Icon(
                  mainController.pinAttributes.confirmObscure
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
                    'Change_MPIN'.tr,
                    top: 30,
                    onTap: () async {
                      final pinAttr = mainController.pinAttributes;
                      final currentMPIN =
                          pinAttr.currentPasswordController.text.trim();
                      final newMPIN = pinAttr.newPasswordController.text.trim();
                      final confirmMPIN =
                          pinAttr.confirmPasswordController.text.trim();

                      bool isValid = true;

                      // Validate Current MPIN
                      if (currentMPIN.length != 6) {
                        pinAttr.currentErrorText =
                            'Please enter your 6-digit current MPIN';
                        isValid = false;
                      } else {
                        pinAttr.currentErrorText = '';
                      }

                      // Validate New MPIN
                      if (newMPIN.length != 6) {
                        pinAttr.newErrorText =
                            'Please enter a valid 6-digit new MPIN';
                        isValid = false;
                      } else {
                        pinAttr.newErrorText = '';
                      }

                      // Validate Confirm MPIN
                      if (confirmMPIN.length != 6) {
                        pinAttr.confirmErrorText =
                            'Please enter a valid 6-digit confirm MPIN';
                        isValid = false;
                      } else if (newMPIN != confirmMPIN) {
                        pinAttr.confirmErrorText = 'MPIN does not match';
                        isValid = false;
                      } else {
                        pinAttr.confirmErrorText = '';
                      }

                      if (!isValid) {
                        mainController.update();
                        return;
                      }

                      if (Get.focusScope?.hasFocus == true) {
                        Get.focusScope!.unfocus();
                      }

                      mainController
                        ..buttonLoading = true
                        ..update();

                      String? s = await ApiService().changelogincredential(
                        oldCred: currentMPIN,
                        newCred: confirmMPIN,
                        credentialType: 'MPIN',
                      );

                      mainController
                        ..buttonLoading = false
                        ..update();

                      Get.showSnackbar(GetSnackBar(
                        messageText: Text(
                          s == 'SUCCESS'
                              ? '${'MPIN'.tr}${' changed Successfully'.tr}'
                              : 'Invalid ${'MPIN'.tr}',
                          style: TS.f14.copyWith(color: AppConfigs.w),
                        ),
                        backgroundColor:
                            (s == 'SUCCESS' ? AppConfigs.dg : Colors.red)
                                .withOpacity(0.7),
                        duration: const Duration(seconds: 2),
                      ));

                      await Future.delayed(const Duration(seconds: 2));
                      if (mainController.pages.last.runtimeType == ChangeMPIN &&
                          s == 'SUCCESS') {
                        pinAttr.clear();
                        mainController.pop();
                      }
                    },
                  ),
          ],
        ),
      );
    });
  }
}
