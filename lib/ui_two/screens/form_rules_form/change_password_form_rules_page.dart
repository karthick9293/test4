import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../models/form_rules/form_rules_response_fz.dart';
import '../../../network/api_service_new.dart';

class ChangePasswordFormRulesPage extends StatefulWidget {
  const ChangePasswordFormRulesPage({super.key});

  @override
  State<ChangePasswordFormRulesPage> createState() =>
      _ChangePasswordFormRulesPageState();
}

class _ChangePasswordFormRulesPageState
    extends State<ChangePasswordFormRulesPage> {
  MainController mainController = Get.find<MainController>();

  @override
  void initState() {
    super.initState();
    if (mainController.resetPasswordFormFZ == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        mainController.getResetPasswordFrom().then((_) {
          if (mainController.resetPasswordFormFZ != null) {
            initializeControllers();
            mainController.update();
          }
        });
      });
    } else {
      initializeControllers();
    }
  }

  void initializeControllers() {
    for (var field in mainController.resetPasswordFormFZ!.formFieldItem) {
      mainController.resetPasswordForm.textFieldControllers[field.FzParamName] =
          TextEditingController(text: '');
      mainController.resetPasswordForm.nodes[field.FzParamName] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> arguments = Get.arguments ?? {};
    // Map<String, dynamic> customerData = arguments['customerData'] ?? {};
    // String stepOrderId = arguments['stepOrderId'] ?? '';

    return GetBuilder<MainController>(builder: (mainController) {
      List<Widget> children() {
        List<Widget> l = [];
        List<FormFieldItem> fields =
            mainController.resetPasswordFormFZ!.formFieldItem.toList();
        fields.sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          switch (f.FieldType) {
            case FieldType.username:
              l.add(
                textFormField(
                    key: mainController.resetPasswordForm.keys[f.Id.toString()],
                    controller: mainController
                        .resetPasswordForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : '*'),
                    inputFormatters: f.Regex.isNotEmpty
                        ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                        : null,
                    errorText: mainController
                        .resetPasswordForm.errorTexts[f.FzParamName]!,
                    enabled: f.enabled,
                    onChanged: (v) async {
                      if (mainController.resetPasswordForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        mainController
                            .resetPasswordForm.errorTexts[f.FzParamName] = '';
                        mainController.update();
                      }
                      if (f.maxLength != null) {
                        mainController.update();
                      }
                      if (v.length > 3) {}
                    },
                    focusNode:
                        mainController.resetPasswordForm.nodes[f.FzParamName],
                    onEditingComplete: () {
                      String? id = mainController
                          .resetPasswordFormFZ?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      mainController.resetPasswordForm.nodes[id]
                          ?.requestFocus();
                    },
                    prefixText: f.Prefix),
              );
              break;
            case FieldType.number:
              List<TextInputFormatter>? inputFormatters = [];

              if (f.Regex.isNotEmpty) {
                inputFormatters
                    .add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              }
              l.add(
                textFormField(
                    key: mainController.resetPasswordForm.keys[f.Id.toString()],
                    controller: mainController
                        .resetPasswordForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : '*'),
                    inputFormatters: inputFormatters,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    errorText: mainController
                        .resetPasswordForm.errorTexts[f.FzParamName]!,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    obscure: mainController
                            .resetPasswordForm.visibilities[f.FzParamName] ==
                        true,
                    obscuringCharacter: f.Masking != "" ? f.Masking : null,
                    trailing: f.Masking != ""
                        ? GestureDetector(
                            onTap: () async {
                              if (mainController.resetPasswordForm
                                  .visibilities[f.FzParamName]!) {
                                mainController
                                  ..resetPasswordForm
                                      .visibilities[f.FzParamName] = false
                                  ..update();
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                mainController
                                  ..resetPasswordForm
                                      .visibilities[f.FzParamName] = true
                                  ..update();
                              }
                            },
                            child: Icon(
                              mainController.resetPasswordForm
                                          .visibilities[f.FzParamName] ==
                                      true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20,
                              color: AppConfigs.g77,
                            ),
                          )
                        : null,
                    onChanged: (v) {
                      if (mainController.resetPasswordForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        mainController
                            .resetPasswordForm.errorTexts[f.FzParamName] = '';
                        mainController.update();
                      }
                      if (f.maxLength != null) {
                        mainController.update();
                      }
                    },
                    focusNode:
                        mainController.resetPasswordForm.nodes[f.FzParamName],
                    onEditingComplete: () {
                      String? id = mainController
                          .resetPasswordFormFZ?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      mainController.resetPasswordForm.nodes[id]
                          ?.requestFocus();
                    },
                    prefixText: f.Prefix),
              );
              break;
            case FieldType.text:
              List<TextInputFormatter>? inputFormatters = [];

              if (f.Regex.isNotEmpty) {
                inputFormatters
                    .add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              }
              l.add(
                textFormField(
                    key: mainController.resetPasswordForm.keys[f.Id.toString()],
                    controller: mainController
                        .resetPasswordForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : '*'),
                    inputFormatters: inputFormatters,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    focusNode:
                        mainController.resetPasswordForm.nodes[f.FzParamName],
                    errorText: mainController
                            .resetPasswordForm.errorTexts[f.FzParamName] ??
                        '',
                    onChanged: (v) {
                      if (mainController.resetPasswordForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        mainController
                            .resetPasswordForm.errorTexts[f.FzParamName] = '';
                        mainController.update();
                      }
                      if (f.maxLength != null) {
                        mainController.update();
                      }
                      if (f.FieldId == 'newPassword' ||
                          f.FieldId == 'confirmPassword') {
                        mainController
                          ..signUpAttributes.pwdStrength =
                              (v.contains(RegExp(r'[A-Z]')) ? 0.20 : 0) +
                                  (v.contains(RegExp(r'[a-z]')) ? 0.20 : 0) +
                                  (v.contains(RegExp(r'[0-9]')) ? 0.20 : 0) +
                                  (v.contains(RegExp(r'[!@#$&*~]'))
                                      ? 0.20
                                      : 0) +
                                  (v.length > 7 ? 0.20 : 0)
                          ..update();
                      }
                    },
                    onEditingComplete: () {
                      String? id = mainController
                          .resetPasswordFormFZ?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      mainController.resetPasswordForm.nodes[id]
                          ?.requestFocus();
                    },
                    obscure: mainController
                            .resetPasswordForm.visibilities[f.FzParamName] ==
                        true,
                    obscuringCharacter: f.Masking != "" ? f.Masking : null,
                    trailing: f.Masking != ""
                        ? GestureDetector(
                            onTap: () async {
                              if (mainController.resetPasswordForm
                                  .visibilities[f.FzParamName]!) {
                                mainController
                                  ..resetPasswordForm
                                      .visibilities[f.FzParamName] = false
                                  ..update();
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                mainController
                                  ..resetPasswordForm
                                      .visibilities[f.FzParamName] = true
                                  ..update();
                              }
                            },
                            child: Icon(
                              mainController.resetPasswordForm
                                          .visibilities[f.FzParamName] ==
                                      true
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20,
                              color: AppConfigs.g77,
                            ),
                          )
                        : null,
                    prefixText: f.Prefix),
              );
              if (f.FieldId == 'newPassword') {
                l.add(Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 9, 20, 0),
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        tween: Tween<double>(
                          begin: 0,
                          end: mainController.signUpAttributes.pwdStrength,
                        ),
                        builder: (context, value, w) => LinearProgressIndicator(
                          value: value,
                          color: value < 0.34
                              ? const Color(0xffc11010)
                              : value < 0.68
                                  ? Colors.yellow
                                  : Colors.green,
                          backgroundColor: ConstColors.grey70.withOpacity(0.2),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 8, 32, 0),
                      child: Text(
                          mainController.signUpAttributes.pwdStrength < 0.34
                              ? 'weak'.tr
                              : mainController.signUpAttributes.pwdStrength <
                                      0.68
                                  ? 'Medium'.tr
                                  : 'Strong'.tr,
                          style: TS.f14),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(44, 0, 44, 0),
                      child: Column(
                        children: [
                          textConstratint(
                              'contains_at_least_one_uppercase'.tr,
                              mainController.resetPasswordForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[A-Z]'))),
                          textConstratint(
                              'contains_at_least_one_lowercase'.tr,
                              mainController.resetPasswordForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[a-z]'))),
                          textConstratint(
                              'contains_at_least_one_number'.tr,
                              mainController.resetPasswordForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[0-9]'))),
                          textConstratint(
                              'contains_at_least_one_special_char'.tr,
                              mainController.resetPasswordForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[!@#\$&*~]'))),
                          textConstratint(
                              'Password length 8-$pwdMaxLength characters',
                              mainController
                                      .resetPasswordForm
                                      .textFieldControllers[f.FzParamName]!
                                      .text
                                      .length >
                                  7)
                        ],
                      ),
                    ),
                  ],
                ));
              }
              break;
          }
        }
        return l;
      }

      return Scaffold(
        backgroundColor: AppConfigs.bodybg(mainController.isDark),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: mainController.resetPasswordFormFZ == null
                      ? [loader()]
                      : [
                          ...children(),
                          FormLoggerView(
                            formName: FormNames.resetPasswordFormRules,
                            formRuleData: mainController.resetPasswordFormFZ,
                          ),
                        ],
                ),
                mainController.resetPasswordFormFZ == null
                    ? SizedBox()
                    : mainController.loading
                        ? loader()
                        : roundButton(
                            cms(Fields.SetCredential_SubmitButton).textHeading!,
                            top: 20,
                            onTap: () async {
                              bool status = mainController.resetPasswordForm
                                  .validateNew(mainController
                                      .resetPasswordFormFZ!.formFieldItem);
                              debugPrint("change password status $status");

                              if (status) {
                                mainController
                                  ..loading = true
                                  ..update();
                                var formData = mainController.resetPasswordForm
                                    .buildJsonNew(mainController
                                        .resetPasswordFormFZ!.formFieldItem);

                                Map<String, dynamic> staticParam = {
                                  "CustomerCode": Box3
                                      .customerDetailsFZ?.data?.customerCode,
                                  "IdNo": Box3.customerDetailsFZ?.data?.idNo,
                                  "Mobile":
                                      Box3.customerDetailsFZ?.data?.mobileNo,
                                  "CredentialType": "Password",
                                  "DeviceType":
                                      (Platform.isAndroid ? 'android' : 'ios'),
                                  "DeviceId": Box3.deviceId,
                                };

                                formData.addAll(staticParam);
                                String? s =
                                    await ApiService().changeMPINPassword(
                                  data: formData,
                                );

                                mainController
                                  ..loading = false
                                  ..update();

                                Get.showSnackbar(GetSnackBar(
                                  messageText: Text(
                                    s == 'SUCCESS'
                                        ? '${'Password'.tr}${' changed Successfully'.tr}'
                                        : 'Invalid ${'Password'.tr}',
                                    style: TS.f14.copyWith(color: AppConfigs.w),
                                  ),
                                  backgroundColor: (s == 'SUCCESS'
                                          ? AppConfigs.dg
                                          : Colors.red)
                                      .withOpacity(0.7),
                                  duration: const Duration(seconds: 2),
                                ));

                                await Future.delayed(
                                    const Duration(seconds: 2));
                                if (s == 'SUCCESS') {
                                  mainController.pop();
                                }
                              } else {
                                mainController
                                  ..loading = false
                                  ..update();
                                mainController.update();
                              }
                            },
                          )
              ],
            ),
          ),
        ),
      );
    });
  }
}
