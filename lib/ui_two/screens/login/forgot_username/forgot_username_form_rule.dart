import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../models/form_rules/form_rules_response_fz.dart';

class ForgotUsernameFormRule extends StatefulWidget {
  const ForgotUsernameFormRule({super.key});

  @override
  State<ForgotUsernameFormRule> createState() => _ForgotUsernameFormRuleState();
}

class _ForgotUsernameFormRuleState extends State<ForgotUsernameFormRule> {
  final AccountController a = Get.find<AccountController>();

  @override
  void initState() {
    super.initState();
    if (a.forgotUsernameFormFZ == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        a.getForgotUserNameForm().then((_) {
          if (a.forgotUsernameFormFZ != null) {
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
    for (var field in a.forgotUsernameFormFZ!.formFieldItem) {
      a.forgotUsernameForm.textFieldControllers[field.FzParamName] = TextEditingController(text: '');
      a.forgotUsernameForm.nodes[field.FzParamName] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      List<Widget> children() {
        List<Widget> l = [];
        List<FormFieldItem> fields = accountController.forgotUsernameFormFZ!.formFieldItem.toList()..sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          switch (f.FieldType) {
            case FieldType.number:
              String? trailingIcon;
              if (f.FzParamName == "IdNo") {
                trailingIcon = accountController.isDark ? ImagePath.darkIdentification : ImagePath.identification;
              }
              l.add(
                Visibility(
                  visible: f.IsVisible.toString().toLowerCase().contains("true"),
                  child: textFormField(
                      controller: accountController.forgotUsernameForm.textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      inputFormatters: f.Regex.isNotEmpty
                          ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                          : null,
                      focusNode: accountController.forgotUsernameForm.nodes[f.FzParamName],
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      errorText: accountController.forgotUsernameForm.errorTexts[f.FzParamName]!,
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
                        if (accountController.forgotUsernameForm.errorTexts[f.FzParamName]!.isNotEmpty) {
                          accountController.forgotUsernameForm.errorTexts[f.FzParamName] = '';
                          accountController.update();
                        }
                        if (f.maxLength != null) {
                          accountController.update();
                        }
                      },
                      onEditingComplete: () {
                        String? id = accountController.forgotUsernameFormFZ?.formFieldItem
                            .toList()
                            .firstWhereOrNull((f0) => f0.index == f.index + 1 && (f0.FieldType == FieldType.text || f0.FieldType == FieldType.number))
                            ?.FzParamName;
                        if (id != null) {
                          accountController.forgotUsernameForm.nodes[id]?.requestFocus();
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
                    controller: accountController.forgotUsernameForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                    inputFormatters: f.Regex.isNotEmpty
                        ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                        : null,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    focusNode: accountController.forgotUsernameForm.nodes[f.FzParamName],
                    errorText: accountController.forgotUsernameForm.errorTexts[f.FzParamName]!,
                    onChanged: (v) {
                      if (accountController.forgotUsernameForm.errorTexts[f.FzParamName]!.isNotEmpty) {
                        accountController.forgotUsernameForm.errorTexts[f.FzParamName] = '';
                        accountController.update();
                      }
                      if (f.maxLength != null) {
                        accountController.update();
                      }
                    },
                    onEditingComplete: () {
                      String? id = accountController.forgotUsernameFormFZ?.formFieldItem
                          .firstWhere((f0) => f0.index == f.index + 1 && (f0.FieldType == FieldType.text || f0.FieldType == FieldType.number))
                          .FzParamName;
                      Get.focusScope?.unfocus();
                      accountController.forgotUsernameForm.nodes[id]?.requestFocus();
                    },
                    prefixText: f.Prefix),
              );
              break;

            case FieldType.date:
              l.add(dummyTextField(accountController.forgotUsernameForm.dates[f.FzParamName], accountController.isDark,
                  error: accountController.forgotUsernameForm.errorTexts[f.FzParamName]!,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : '*'}', onTap: () async {
                DateTime? d =
                    await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now());
                if (d != null) {
                  accountController
                    ..forgotUsernameForm.dates[f.FzParamName] = DateFormatter.newFormat(d, 'dd/MMM/yyyy')
                    ..forgotUsernameForm.errorTexts[f.FzParamName] = ''
                    ..update();
                }
              }));
              break;
            case FieldType.dropDownSingle:
              l.add(genericBottomSheet(
                  isDark: accountController.isDark,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  value: accountController.forgotUsernameForm.selectedSources[f.FzParamName]?.Desc ?? '',
                  credKey: f.ApiKey,
                  f: f,
                  errorText: accountController.forgotUsernameForm.errorTexts[f.FzParamName]!,
                  onTap: (s) {
                    accountController
                      ..forgotUsernameForm.selectedSources[f.FzParamName] = s
                      ..forgotUsernameForm.errorTexts[f.FzParamName] = ''
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
                    children: (f.setOptions() ?? accountController.forgotUsernameForm.sources[f.ApiKey]!)
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(accountController.forgotUsernameForm.selectedSources[f.FzParamName]?.id == e.id, e.Desc.tr,
                                onTap: () => accountController
                                  ..forgotUsernameForm.selectedSources[f.FzParamName] = e
                                  ..forgotUsernameForm.errorTexts[f.FzParamName] = ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(accountController.forgotUsernameForm.errorTexts[f.FzParamName] ?? '')
                ],
              ));
              break;
          }
        }
        return l;
      }

      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        appBar: appBar0(cms(Fields.ForgotUserName_PageHeading).textHeading!, onTap2: Get.back),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 193, maxHeight: 220),
                  child: cms(Fields.ForgotUserName_Image).image != ""
                      ? Base64Image(image: cms(Fields.ForgotUserName_Image).image!)
                      : SvgPicture.asset(ImagePath.forgotPassword),
                ),
              ),
              ...accountController.forgotUsernameFormFZ == null
                  ? [loader()]
                  : [
                      ...children(),
                      FormLoggerView(formName: FormNames.forgotUsernameFormRules, formRuleData: accountController.forgotUsernameFormFZ),
                      accountController.buttonLoading
                          ? loader(top: 20, bottom: 5)
                          : roundButton(cms(Fields.ForgotUserName_SendButton).textHeading!, top: 20, bottom: 5, onTap: () async {
                              bool status = accountController.forgotUsernameForm.validateNew(accountController.forgotUsernameFormFZ!.formFieldItem);
                              if (status) {
                                a
                                  ..buttonLoading = true
                                  ..update();

                                try {
                                  var formData =
                                      accountController.forgotUsernameForm.buildJsonNew(accountController.forgotUsernameFormFZ!.formFieldItem);

                                  await a.forgetMpin(stepOrderId: "0", data: formData);
                                } catch (e) {
                                  if (kDebugMode) {
                                    print("Error in forgetUsername: $e");
                                  }
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
                              cms(Fields.ForgotUserName_HomeButton).textHeading!,
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
