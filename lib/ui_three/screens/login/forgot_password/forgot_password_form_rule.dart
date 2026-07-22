import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/account_controller.dart';
import '../../../../core/exports/ui_three_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../models/form_rules/form_rules_response_fz.dart';

class ForgotPasswordFormRule extends StatefulWidget {
  const ForgotPasswordFormRule({super.key});

  @override
  State<ForgotPasswordFormRule> createState() => _ForgotPasswordFormRuleState();
}

class _ForgotPasswordFormRuleState extends State<ForgotPasswordFormRule> {
  final AccountController a = Get.find<AccountController>();

  @override
  void initState() {
    super.initState();
    if (a.forgotPasswordFormFZ == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        a.getForgotPasswordForm().then((_) {
          if (a.forgotPasswordFormFZ != null) {
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
    for (var field in a.forgotPasswordFormFZ!.formFieldItem) {
      a.forgotPasswordForm.textFieldControllers[field.FzParamName] =
          TextEditingController(text: '');
      a.forgotPasswordForm.nodes[field.FzParamName] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      List<Widget> children() {
        List<Widget> l = [];
        List<FormFieldItem> fields =
            accountController.forgotPasswordFormFZ!.formFieldItem.toList()
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
                      controller: accountController.forgotPasswordForm
                          .textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      inputFormatters: f.Regex.isNotEmpty
                          ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                          : null,
                      focusNode: accountController
                          .forgotPasswordForm.nodes[f.FzParamName],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      errorText: accountController
                          .forgotPasswordForm.errorTexts[f.FzParamName]!,
                      maxLength: f.maxLength,
                      enabled: f.enabled,
                      trailing: trailingIcon != null
                          ? Container(
                              width: 40,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                trailingIcon,
                                height: 16,
                              ),
                            )
                          : null,
                      onChanged: (v) {
                        if (accountController.forgotPasswordForm
                            .errorTexts[f.FzParamName]!.isNotEmpty) {
                          accountController.forgotPasswordForm
                              .errorTexts[f.FzParamName] = '';
                          accountController.update();
                        }
                        if (f.maxLength != null) {
                          accountController.update();
                        }
                      },
                      onEditingComplete: () {
                        String? id = accountController
                            .forgotPasswordFormFZ?.formFieldItem
                            .toList()
                            .firstWhereOrNull((f0) =>
                                f0.index == f.index + 1 &&
                                (f0.FieldType == FieldType.text ||
                                    f0.FieldType == FieldType.number))
                            ?.FzParamName;
                        if (id != null) {
                          accountController.forgotPasswordForm.nodes[id]
                              ?.requestFocus();
                        } else {
                          Get.focusScope?.unfocus();
                        }
                      },
                      prefixText: '${f.Prefix} '),
                ),
              );
              break;
            case FieldType.text:
              List<TextInputFormatter>? inputFormatters = [];
              if (f.maxLength != null) {
                inputFormatters.add(intLimit(f.maxLength!));
              }
              l.add(
                textFormField(
                    controller: accountController
                        .forgotPasswordForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                    inputFormatters: f.Regex.isNotEmpty
                        ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                        : null,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    focusNode: accountController
                        .forgotPasswordForm.nodes[f.FzParamName],
                    errorText: accountController
                        .forgotPasswordForm.errorTexts[f.FzParamName]!,
                    onChanged: (v) {
                      if (accountController.forgotPasswordForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        accountController
                            .forgotPasswordForm.errorTexts[f.FzParamName] = '';
                        accountController.update();
                      }
                      if (f.maxLength != null) {
                        accountController.update();
                      }
                    },
                    onEditingComplete: () {
                      String? id = accountController
                          .forgotPasswordFormFZ?.formFieldItem
                          .firstWhere((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          .FzParamName;
                      Get.focusScope?.unfocus();
                      accountController.forgotPasswordForm.nodes[id]
                          ?.requestFocus();
                    },
                    prefixText: f.Prefix),
              );
              break;

            case FieldType.date:
              l.add(dummyTextField(
                  accountController.forgotPasswordForm.dates[f.FzParamName],
                  accountController.isDark,
                  error: accountController
                      .forgotPasswordForm.errorTexts[f.FzParamName]!,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : '*'}',
                  onTap: () async {
                DateTime? d = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now());
                if (d != null) {
                  accountController
                    ..forgotPasswordForm.dates[f.FzParamName] =
                        DateFormatter.newFormat(d, 'dd/MMM/yyyy')
                    ..forgotPasswordForm.errorTexts[f.FzParamName] = ''
                    ..update();
                }
              }));
              break;
            case FieldType.dropDownSingle:
              l.add(genericBottomSheet(
                  isDark: accountController.isDark,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  value: accountController.forgotPasswordForm
                          .selectedSources[f.FzParamName]?.Desc ??
                      '',
                  credKey: f.ApiKey,
                  f: f,
                  errorText: accountController
                      .forgotPasswordForm.errorTexts[f.FzParamName]!,
                  onTap: (s) {
                    accountController
                      ..forgotPasswordForm.selectedSources[f.FzParamName] = s
                      ..forgotPasswordForm.errorTexts[f.FzParamName] = ''
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
                                .forgotPasswordForm.sources[f.ApiKey]!)
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(
                                accountController.forgotPasswordForm
                                        .selectedSources[f.FzParamName]?.id ==
                                    e.id,
                                e.Desc.tr,
                                onTap: () => accountController
                                  ..forgotPasswordForm
                                      .selectedSources[f.FzParamName] = e
                                  ..forgotPasswordForm
                                      .errorTexts[f.FzParamName] = ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(accountController
                          .forgotPasswordForm.errorTexts[f.FzParamName] ??
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
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 193, maxHeight: 220),
                  child: cms(Fields.ForgotMPIN_Image).image != ""
                      ? Base64Image(image: cms(Fields.ForgotMPIN_Image).image!)
                      : SvgPicture.asset(ImagePath.forgotPassword),
                ),
              ),
              ...accountController.forgotPasswordFormFZ == null
                  ? [loader()]
                  : [
                      ...children(),
                      FormLoggerView(
                          formName: FormNames.forgotPasswordFormRules,
                          formRuleData: accountController.forgotPasswordFormFZ),
                      accountController.buttonLoading
                          ? loader(top: 20, bottom: 5)
                          : roundButton(
                              cms(Fields.ForgotPassword_SendButton)
                                  .textHeading!,
                              top: 20,
                              bottom: 5, onTap: () async {
                              bool status = accountController.forgotPasswordForm
                                  .validateNew(accountController
                                      .forgotPasswordFormFZ!.formFieldItem);
                              if (status) {
                                a
                                  ..buttonLoading = true
                                  ..update();

                                try {
                                  var data = accountController
                                      .forgotPasswordForm
                                      .buildJsonNew(accountController
                                          .forgotPasswordFormFZ!.formFieldItem);

                                  await a.forgetMpin(
                                      stepOrderId: "0", data: data);
                                } catch (e) {
                                  logger.i("Error in forgetPassword: $e");
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
