import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/form_rules/form_rules_response_fz.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_three_custom_widgets.dart';
import '../../../core/exports/ui_three_shimmer.dart';
import '../../../core/flavours/constants.dart';
import '../../../network/api_service_new.dart';

class ChangeMPINFormRulesPage extends StatefulWidget {
  const ChangeMPINFormRulesPage({super.key});

  @override
  State<ChangeMPINFormRulesPage> createState() =>
      _ChangeMPINFormRulesPageState();
}

class _ChangeMPINFormRulesPageState extends State<ChangeMPINFormRulesPage> {
  MainController mainController = Get.find<MainController>();

  @override
  void initState() {
    super.initState();
    if (mainController.resetMPINFormFZ == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        mainController.getResetMPINFrom().then((_) {
          if (mainController.resetMPINFormFZ != null) {
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
    for (var field in mainController.resetMPINFormFZ!.formFieldItem) {
      mainController.resetMPINForm.textFieldControllers[field.FzParamName] =
          TextEditingController(text: '');
      mainController.resetMPINForm.nodes[field.FzParamName] = FocusNode();
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
            mainController.resetMPINFormFZ!.formFieldItem.toList();
        fields.sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          switch (f.FieldType) {
            case FieldType.username:
              l.add(
                textFormField(
                    key: mainController.resetMPINForm.keys[f.Id.toString()],
                    controller: mainController
                        .resetMPINForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : '*'),
                    inputFormatters: f.Regex.isNotEmpty
                        ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                        : null,
                    errorText:
                        mainController.resetMPINForm.errorTexts[f.FzParamName]!,
                    enabled: f.enabled,
                    onChanged: (v) async {
                      if (mainController.resetMPINForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        mainController.resetMPINForm.errorTexts[f.FzParamName] =
                            '';
                        mainController.update();
                      }
                      if (f.maxLength != null) {
                        mainController.update();
                      }
                      if (v.length > 3) {}
                    },
                    focusNode:
                        mainController.resetMPINForm.nodes[f.FzParamName],
                    onEditingComplete: () {
                      String? id = mainController.resetMPINFormFZ?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      mainController.resetMPINForm.nodes[id]?.requestFocus();
                    },
                    prefixText: f.Prefix),
              );
              break;
            case FieldType.number:
              l.add(
                textFormField(
                    key: mainController.resetMPINForm.keys[f.Id.toString()],
                    controller: mainController
                        .resetMPINForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : '*'),
                    inputFormatters: f.Regex.isNotEmpty
                        ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                        : null,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    errorText:
                        mainController.resetMPINForm.errorTexts[f.FzParamName]!,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    obscure: mainController
                            .resetMPINForm.visibilities[f.FzParamName] ==
                        true,
                    obscuringCharacter: f.Masking != "" ? f.Masking : null,
                    trailing: f.Masking != ""
                        ? GestureDetector(
                            onTap: () async {
                              if (mainController
                                  .resetMPINForm.visibilities[f.FzParamName]!) {
                                mainController
                                  ..resetMPINForm.visibilities[f.FzParamName] =
                                      false
                                  ..update();
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                mainController
                                  ..resetMPINForm.visibilities[f.FzParamName] =
                                      true
                                  ..update();
                              }
                            },
                            child: Icon(
                              mainController.showNewMpin
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 20,
                              color: AppConfigs.g77,
                            ),
                          )
                        : null,
                    onChanged: (v) {
                      if (mainController.resetMPINForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        mainController.resetMPINForm.errorTexts[f.FzParamName] =
                            '';
                        mainController.update();
                      }
                      if (f.maxLength != null) {
                        mainController.update();
                      }
                    },
                    focusNode:
                        mainController.resetMPINForm.nodes[f.FzParamName],
                    onEditingComplete: () {
                      String? id = mainController.resetMPINFormFZ?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      mainController.resetMPINForm.nodes[id]?.requestFocus();
                    },
                    prefixText: f.Prefix),
              );
              break;
            case FieldType.text:
              l.add(
                textFormField(
                    key: mainController.resetMPINForm.keys[f.Id.toString()],
                    controller: mainController
                        .resetMPINForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : '*'),
                    inputFormatters: f.Regex.isNotEmpty
                        ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                        : null,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    focusNode:
                        mainController.resetMPINForm.nodes[f.FzParamName],
                    errorText: mainController
                            .resetMPINForm.errorTexts[f.FzParamName] ??
                        '',
                    obscure: mainController
                            .resetMPINForm.visibilities[f.FzParamName] ==
                        true,
                    obscuringCharacter: f.Masking != "" ? f.Masking : null,
                    onChanged: (v) {
                      if (mainController.resetMPINForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        mainController.resetMPINForm.errorTexts[f.FzParamName] =
                            '';
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
                      String? id = mainController.resetMPINFormFZ?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      mainController.resetMPINForm.nodes[id]?.requestFocus();
                    },
                    trailing: f.Masking != ""
                        ? GestureDetector(
                            onTap: () async {
                              if (mainController
                                  .resetMPINForm.visibilities[f.FzParamName]!) {
                                mainController
                                  ..resetMPINForm.visibilities[f.FzParamName] =
                                      false
                                  ..update();
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                mainController
                                  ..resetMPINForm.visibilities[f.FzParamName] =
                                      true
                                  ..update();
                              }
                            },
                            child: Icon(
                              mainController.showNewMpin
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
                              mainController.resetMPINForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[A-Z]'))),
                          textConstratint(
                              'contains_at_least_one_lowercase'.tr,
                              mainController.resetMPINForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[a-z]'))),
                          textConstratint(
                              'contains_at_least_one_number'.tr,
                              mainController.resetMPINForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[0-9]'))),
                          textConstratint(
                              'contains_at_least_one_special_char'.tr,
                              mainController.resetMPINForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[!@#\$&*~]'))),
                          textConstratint(
                              'Password length 8-$pwdMaxLength characters',
                              mainController
                                      .resetMPINForm
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

      return GlobalScaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: mainController.resetMPINFormFZ == null
                      ? [FormShimmer()]
                      : [
                          ...children(),
                          FormLoggerView(
                            formName: FormNames.resetMPINFormRules,
                            formRuleData: mainController.resetMPINFormFZ,
                          ),
                        ],
                ),
                mainController.resetMPINFormFZ == null
                    ? SizedBox()
                    : mainController.loading
                        ? loader()
                        : roundButton(
                            cms(Fields.SetCredential_SubmitButton).textHeading!,
                            top: 20,
                            onTap: () async {
                              bool status = mainController.resetMPINForm
                                  .validateNew(mainController
                                      .resetMPINFormFZ!.formFieldItem);

                              debugPrint("change MPIN status $status");

                              if (status) {
                                mainController
                                  ..loading = true
                                  ..update();
                                var formData = mainController.resetMPINForm
                                    .buildJsonNew(mainController
                                        .resetMPINFormFZ!.formFieldItem);

                                Map<String, dynamic> staticParam = {
                                  "CustomerCode": Box3
                                      .customerDetailsFZ?.data?.customerCode,
                                  "IdNo": Box3.customerDetailsFZ?.data?.idNo,
                                  "Mobile":
                                      Box3.customerDetailsFZ?.data?.mobileNo,
                                  "CredentialType": "MPIN",
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
                                        ? '${'MPIN'.tr}${' changed Successfully'.tr}'
                                        : 'Invalid ${'MPIN'.tr}',
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
                              }
                            },
                          ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
