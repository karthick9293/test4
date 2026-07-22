import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/account_controller.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../models/form_rules/form_rules_response_fz.dart';

class ChangePasswordFormRule extends StatefulWidget {
  const ChangePasswordFormRule({super.key});

  @override
  State<ChangePasswordFormRule> createState() => _ChangePasswordFormRuleState();
}

class _ChangePasswordFormRuleState extends State<ChangePasswordFormRule> {
  final AccountController a = Get.find<AccountController>();

  @override
  void initState() {
    super.initState();
    if (a.changePasswordFormFZ == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        a.getChangePasswordForm().then((_) {
          if (a.changePasswordFormFZ != null) {
            initializeControllers();
            a.update();
          }
        });
      });
    } else {
      initializeControllers();
    }
  }

  void initializeControllers() {
    for (var field in a.changePasswordFormFZ!.formFieldItem) {
      a.changePasswordForm.textFieldControllers[field.FzParamName] =
          TextEditingController(text: '');
      a.changePasswordForm.nodes[field.FzParamName] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      List<Widget> children() {
        List<Widget> l = [];
        List<FormFieldItem> fields =
            accountController.changePasswordFormFZ!.formFieldItem.toList()
              ..sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          switch (f.FieldType) {
            case FieldType.number:
              String? trailingIcon;
              if (f.FzParamName == "IdNo") {
                trailingIcon = accountController.isDark
                    ? ImagePath.darkIdentification
                    : ImagePath.identification;
              }
              l.add(
                Visibility(
                  visible:
                      f.IsVisible.toString().toLowerCase().contains("true"),
                  child: textFormField(
                      controller: accountController.changePasswordForm
                          .textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      inputFormatters: f.Regex.isNotEmpty
                          ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                          : null,
                      focusNode: accountController
                          .changePasswordForm.nodes[f.FzParamName],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      errorText: accountController
                          .changePasswordForm.errorTexts[f.FzParamName]!,
                      maxLength: f.maxLength,
                      enabled: f.enabled,
                      onChanged: (v) {
                        if (accountController.changePasswordForm
                            .errorTexts[f.FzParamName]!.isNotEmpty) {
                          accountController.changePasswordForm
                              .errorTexts[f.FzParamName] = '';
                          accountController.update();
                        }
                        if (f.maxLength != null) {
                          accountController.update();
                        }
                      },
                      onEditingComplete: () {
                        String? id = accountController
                            .changePasswordFormFZ?.formFieldItem
                            .toList()
                            .firstWhereOrNull((f0) =>
                                f0.index == f.index + 1 &&
                                (f0.FieldType == FieldType.text ||
                                    f0.FieldType == FieldType.number))
                            ?.FzParamName;
                        if (id != null) {
                          accountController.changePasswordForm.nodes[id]
                              ?.requestFocus();
                        } else {
                          Get.focusScope?.unfocus();
                        }
                      },
                      obscure: accountController
                              .changePasswordForm.visibilities[f.FzParamName] ==
                          true,
                      obscuringCharacter: f.Masking != "" ? f.Masking : null,
                      trailing: f.Masking != ""
                          ? GestureDetector(
                              onTap: () async {
                                if (accountController.changePasswordForm
                                    .visibilities[f.FzParamName]!) {
                                  accountController
                                    ..changePasswordForm
                                        .visibilities[f.FzParamName] = false
                                    ..update();
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  accountController
                                    ..changePasswordForm
                                        .visibilities[f.FzParamName] = true
                                    ..update();
                                }
                              },
                              child: Icon(
                                accountController.changePasswordForm
                                            .visibilities[f.FzParamName] ==
                                        true
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                                color: AppConfigs.g77,
                              ),
                            )
                          : trailingIcon != null
                              ? Container(
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                    trailingIcon,
                                    height: 16,
                                  ),
                                )
                              : null,
                      prefixText: '${f.Prefix} '),
                ),
              );
              break;
            case FieldType.text:
              List<TextInputFormatter>? inputFormatters = [];
              if (f.maxLength != null) {
                inputFormatters.add(intLimit(f.maxLength!));
              }
              if (f.Regex.isNotEmpty) {
                inputFormatters
                    .add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              }
              l.add(
                textFormField(
                    controller: accountController
                        .changePasswordForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                    inputFormatters: inputFormatters,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    focusNode: accountController
                        .changePasswordForm.nodes[f.FzParamName],
                    errorText: accountController
                        .changePasswordForm.errorTexts[f.FzParamName]!,
                    onChanged: (v) {
                      if (accountController.changePasswordForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        accountController
                            .changePasswordForm.errorTexts[f.FzParamName] = '';
                        accountController.update();
                      }
                      if (f.maxLength != null) {
                        accountController.update();
                      }
                      if (f.FieldId == 'password' ||
                          f.FieldId == 'confirmPassword') {
                        accountController
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
                      String? id = accountController
                          .changePasswordFormFZ?.formFieldItem
                          .firstWhere((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          .FzParamName;
                      Get.focusScope?.unfocus();
                      accountController.changePasswordForm.nodes[id]
                          ?.requestFocus();
                    },
                    obscure: accountController
                            .changePasswordForm.visibilities[f.FzParamName] ==
                        true,
                    obscuringCharacter: f.Masking != "" ? f.Masking : null,
                    trailing: f.Masking != ""
                        ? GestureDetector(
                            onTap: () async {
                              if (accountController.changePasswordForm
                                  .visibilities[f.FzParamName]!) {
                                accountController
                                  ..changePasswordForm
                                      .visibilities[f.FzParamName] = false
                                  ..update();
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                accountController
                                  ..changePasswordForm
                                      .visibilities[f.FzParamName] = true
                                  ..update();
                              }
                            },
                            child: Icon(
                              accountController.changePasswordForm
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
              if (f.FieldId == 'password') {
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
                          end: accountController.signUpAttributes.pwdStrength,
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
                          accountController.signUpAttributes.pwdStrength < 0.34
                              ? 'weak'.tr
                              : accountController.signUpAttributes.pwdStrength <
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
                              accountController.changePasswordForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[A-Z]'))),
                          textConstratint(
                              'contains_at_least_one_lowercase'.tr,
                              accountController.changePasswordForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[a-z]'))),
                          textConstratint(
                              'contains_at_least_one_number'.tr,
                              accountController.changePasswordForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[0-9]'))),
                          textConstratint(
                              'contains_at_least_one_special_char'.tr,
                              accountController.changePasswordForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[!@#\$&*~]'))),
                          textConstratint(
                              'Password length 8-$pwdMaxLength characters',
                              accountController
                                      .changePasswordForm
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

            case FieldType.date:
              l.add(dummyTextField(
                  accountController.changePasswordForm.dates[f.FzParamName],
                  accountController.isDark,
                  error: accountController
                      .changePasswordForm.errorTexts[f.FzParamName]!,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : '*'}',
                  onTap: () async {
                DateTime? d = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now());
                if (d != null) {
                  accountController
                    ..changePasswordForm.dates[f.FzParamName] =
                        DateFormatter.newFormat(d, 'dd/MMM/yyyy')
                    ..changePasswordForm.errorTexts[f.FzParamName] = ''
                    ..update();
                }
              }));
              break;
            case FieldType.dropDownSingle:
              l.add(genericBottomSheet(
                  isDark: accountController.isDark,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  value: accountController.changePasswordForm
                          .selectedSources[f.FzParamName]?.Desc ??
                      '',
                  credKey: f.ApiKey,
                  f: f,
                  errorText: accountController
                      .changePasswordForm.errorTexts[f.FzParamName]!,
                  onTap: (s) {
                    accountController
                      ..changePasswordForm.selectedSources[f.FzParamName] = s
                      ..changePasswordForm.errorTexts[f.FzParamName] = ''
                      ..update();
                    Get.back();
                  }));
              break;
            case FieldType.radio:
              l.add(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText1(f.FieldDisplayName, accountController.isDark),
                  Wrap(
                    children: (f.setOptions() ??
                            accountController
                                .changePasswordForm.sources[f.ApiKey]!)
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(
                                accountController.changePasswordForm
                                        .selectedSources[f.FzParamName]?.id ==
                                    e.id,
                                e.Desc.tr,
                                onTap: () => accountController
                                  ..changePasswordForm
                                      .selectedSources[f.FzParamName] = e
                                  ..changePasswordForm
                                      .errorTexts[f.FzParamName] = ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(accountController
                          .changePasswordForm.errorTexts[f.FzParamName] ??
                      '')
                ],
              ));
              break;
          }
        }
        return l;
      }

      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        appBar: appBar0(cms(Fields.ForgotPassword_PageHeading).textHeading!,
            onTap2: Get.back),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                // margin: const EdgeInsets.fromLTRB(118.7, 53.8, 117.0, 51.8),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 193, maxHeight: 220),
                  child: cms(Fields.ForgotMPIN_Image).image != ""
                      ? Base64Image(image: cms(Fields.ForgotMPIN_Image).image!)
                      : SvgPicture.asset(ImagePath.forgotPassword),
                ),
              ),
              ...accountController.changePasswordFormFZ == null
                  ? [loader()]
                  : [
                      ...children(),
                      FormLoggerView(
                          formName: FormNames.changePasswordFormRules,
                          formRuleData: accountController.changePasswordFormFZ),
                      accountController.buttonLoading
                          ? loader(top: 20, bottom: 5)
                          : roundButton(
                              cms(Fields.ForgotMPIN_SendButton).textHeading!,
                              top: 20,
                              bottom: 5, onTap: () async {
                              bool status = accountController.changePasswordForm
                                  .validateNew(accountController
                                      .changePasswordFormFZ!.formFieldItem);
                              if (status) {
                                a
                                  ..buttonLoading = true
                                  ..update();

                                try {
                                  var data = accountController
                                      .changePasswordForm
                                      .buildJsonNew(accountController
                                          .changePasswordFormFZ!.formFieldItem);
                                  Map<String, dynamic> userCred = {
                                    "CustomerCode": Box3
                                        .customerDetailsFZ?.data?.customerCode,
                                    "IdNo": Box3.customerDetailsFZ?.data?.idNo,
                                    "Mobile":
                                        Box3.customerDetailsFZ?.data?.mobileNo,
                                    "CredentialType": "PASSWORD"
                                  };
                                  data.addAll(userCred);
                                  await a.forgetMpin(
                                      stepOrderId: a.stepOrderID, data: data);
                                } catch (e) {
                                  logger.i("Error in Forgot password : $e");
                                } finally {
                                  a
                                    ..buttonLoading = false
                                    ..update();
                                }
                              } else {
                                a
                                  ..buttonLoading = false
                                  ..update();
                              }
                            }),
                      Center(
                        child: GestureDetector(
                          onTap: Get.back,
                          child: Text(
                              textAlign: TextAlign.center,
                              cms(Fields.ForgotMPIN_HomeButton).textHeading!,
                              style: TS.f14.copyWith(
                                color: AppConfigs.primaryColor,
                                decoration: TextDecoration.underline,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ]
            ],
          ),
        ),
      );
    });
  }
}
