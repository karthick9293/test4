import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../models/form_rules/form_rules_response_fz.dart';

class ChangeMpinFormRule extends StatefulWidget {
  const ChangeMpinFormRule({super.key});

  @override
  State<ChangeMpinFormRule> createState() => _ChangeMpinFormRuleState();
}

class _ChangeMpinFormRuleState extends State<ChangeMpinFormRule> {
  final AccountController a = Get.find<AccountController>();

  @override
  void initState() {
    super.initState();
    if (a.changeMpinFormBV == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        a.getChangeMpinForm().then((_) {
          if (a.changeMpinFormBV != null) {
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
    for (var field in a.changeMpinFormBV!.formFieldItem) {
      a.changeMpinForm.textFieldControllers[field.FzParamName] =
          TextEditingController(text: '');
      a.changeMpinForm.nodes[field.FzParamName] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      List<Widget> children() {
        List<Widget> l = [];
        List<FormFieldItem> fields =
            accountController.changeMpinFormBV!.formFieldItem.toList()
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
              l.add(Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      f.FieldDisplayName + (f.optional ? '' : '*'),
                      style: TS.f16.copyWith(
                          color: accountController.isDark
                              ? (accountController.changeMpinForm
                                      .errorTexts[f.FzParamName]!.isEmpty
                                  ? AppConfigs.g8f
                                  : AppConfigs.errorBorderDark)
                              : (accountController.changeMpinForm
                                      .errorTexts[f.FzParamName]!.isNotEmpty
                                  ? AppConfigs.der
                                  : AppConfigs.g77)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    MpinPut(
                      controller: accountController
                          .changeMpinForm.textFieldControllers[f.FzParamName],
                      focusNode:
                          accountController.changeMpinForm.nodes[f.FzParamName],
                      errorText: accountController
                          .changeMpinForm.errorTexts[f.FzParamName]!,
                      onChanged: (s) {
                        // authController
                        //   ..authAttributes.mPinTrailer = const SizedBox()
                        //   ..authAttributes.mpinErrorText = ''
                        //   ..update();
                        if (accountController.changeMpinForm
                            .errorTexts[f.FzParamName]!.isNotEmpty) {
                          accountController
                              .changeMpinForm.errorTexts[f.FzParamName] = '';
                        }
                        accountController.update();
                      },
                      obscureText: (accountController
                              .changeMpinForm.visibilities[f.FzParamName] ==
                          true),
                      obscuringCharacter: f.Masking != "" ? f.Masking : null,
                      borderRadius: 50,
                      onCompleted: (p0) async {},
                    ),
                  ],
                ),
              ));
              break;
            case FieldType.text:
              List<TextInputFormatter>? inputFormatters = [];
              if (f.maxLength != null) {
                inputFormatters.add(intLimit(f.maxLength!));
              }
              // if (f.decimalLength != null) {
              //   inputFormatters.add(decimalFormatter(length: f.decimalLength ?? 3));
              // }
              // if (f.Regex != null) {
              //   inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              // }
              l.add(
                textFormField(
                    controller: accountController
                        .changeMpinForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                    hintText: f.FieldDisplayName,
                    inputFormatters: f.Regex.isNotEmpty
                        ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                        : null,
                    // inputFormatters: inputFormatters,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    focusNode:
                        accountController.changeMpinForm.nodes[f.FzParamName],
                    errorText: accountController
                        .changeMpinForm.errorTexts[f.FzParamName]!,
                    onChanged: (v) {
                      if (accountController.changeMpinForm
                          .errorTexts[f.FzParamName]!.isNotEmpty) {
                        accountController
                            .changeMpinForm.errorTexts[f.FzParamName] = '';
                        accountController.update();
                      }
                      if (f.maxLength != null) {
                        accountController.update();
                      }
                    },
                    onEditingComplete: () {
                      String? id = accountController
                          .changeMpinFormBV?.formFieldItem
                          .firstWhere((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          .FzParamName;
                      Get.focusScope?.unfocus();
                      accountController.changeMpinForm.nodes[id]
                          ?.requestFocus();
                    },
                    obscure: accountController
                            .changeMpinForm.visibilities[f.FzParamName] ==
                        true,
                    obscuringCharacter: f.Masking != "" ? f.Masking : null,
                    trailing: f.Masking != ""
                        ? GestureDetector(
                            onTap: () async {
                              if (accountController.changeMpinForm
                                  .visibilities[f.FzParamName]!) {
                                accountController
                                  ..changeMpinForm.visibilities[f.FzParamName] =
                                      false
                                  ..update();
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                accountController
                                  ..changeMpinForm.visibilities[f.FzParamName] =
                                      true
                                  ..update();
                              }
                            },
                            child: Icon(
                              accountController.changeMpinForm
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
              break;

            case FieldType.date:
              l.add(dummyTextField(
                  // DateFormatter.newFormat(accountController.changeMpinForm.dates[f.FzParamName], 'dd/mm/yyyy'),
                  accountController.changeMpinForm.dates[f.FzParamName],
                  accountController.isDark,
                  error: accountController
                      .changeMpinForm.errorTexts[f.FzParamName]!,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : '*'}',
                  onTap: () async {
                DateTime? d = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now());
                // initialDate: f.initialDurationFromNow.inSeconds != 0 ? DateTime.now().add(f.initialDurationFromNow) : null,
                // firstDate: f.startDurationFromNow.inSeconds != 0 ? DateTime.now().add(f.startDurationFromNow) : f.startDate ?? DateTime(1900),
                // lastDate: f.endDurationFromNow.inSeconds != 0 ? DateTime.now().add(f.endDurationFromNow) : f.endDate ?? DateTime(2100));
                if (d != null) {
                  accountController
                    ..changeMpinForm.dates[f.FzParamName] =
                        DateFormatter.newFormat(d, 'dd/MMM/yyyy')
                    ..changeMpinForm.errorTexts[f.FzParamName] = ''
                    ..update();
                }
              }));
              break;
            case FieldType.dropDownSingle:
              l.add(genericBottomSheet(
                  isDark: accountController.isDark,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  value: accountController.changeMpinForm
                          .selectedSources[f.FzParamName]?.Desc ??
                      '',
                  credKey: f.ApiKey,
                  f: f,
                  errorText: accountController
                      .changeMpinForm.errorTexts[f.FzParamName]!,
                  onTap: (s) {
                    accountController
                      ..changeMpinForm.selectedSources[f.FzParamName] = s
                      ..changeMpinForm.errorTexts[f.FzParamName] = ''
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
                            accountController.changeMpinForm.sources[f.ApiKey]!)
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(
                                accountController.changeMpinForm
                                        .selectedSources[f.FzParamName]?.id ==
                                    e.id,
                                e.Desc.tr,
                                onTap: () => accountController
                                  ..changeMpinForm
                                      .selectedSources[f.FzParamName] = e
                                  ..changeMpinForm.errorTexts[f.FzParamName] =
                                      ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(accountController
                          .changeMpinForm.errorTexts[f.FzParamName] ??
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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ListView(
              shrinkWrap: true,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Appbar2(
                  title: cms(Fields.ForgotMPIN_ChangeMPIN).textHeading!,
                ),
                Text(
                  "Create a new password to keep your IFI account secure.",
                  style: TS.f14,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 100,
                ),
                ...accountController.changeMpinFormBV == null
                    ? [loader()]
                    : [
                        ...children(),
                        FormLoggerView(
                            formName: FormNames.changeMPINFormRules,
                            formRuleData: accountController.changeMpinFormBV),
                        accountController.buttonLoading
                            ? loader(top: 20, bottom: 5)
                            : roundButton(
                                cms(Fields.ForgotMPIN_SendButton).textHeading!,
                                top: 20,
                                bottom: 5, onTap: () async {
                                bool status = accountController.changeMpinForm
                                    .validateNew(accountController
                                        .changeMpinFormBV!.formFieldItem);
                                if (status) {
                                  a
                                    ..buttonLoading = true
                                    ..update();

                                  try {
                                    var data = accountController.changeMpinForm
                                        .buildJsonNew(accountController
                                            .changeMpinFormBV!.formFieldItem);
                                    Map<String, dynamic> userCred = {
                                      "CustomerCode": Box3.customerDetailsFZ
                                          ?.data?.customerCode,
                                      "IdNo":
                                          Box3.customerDetailsFZ?.data?.idNo,
                                      "Mobile": Box3
                                          .customerDetailsFZ?.data?.mobileNo,
                                      "CredentialType": "MPIN"
                                    };
                                    data.addAll(userCred);
                                    await a.forgetMpin(
                                        stepOrderId: a.stepOrderID, data: data);
                                  } catch (e) {
                                    logger.i("Error in forgetMpin: $e");
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
                        // Center(
                        //   child: GestureDetector(
                        //     onTap: Get.back,
                        //     child: Text(
                        //         textAlign: TextAlign.center,
                        //         cms(Fields.ForgotMPIN_HomeButton).textHeading!,
                        //         style: TS.f14.copyWith(
                        //           color: AppConfigs.primaryColor,
                        //           decoration: TextDecoration.underline,
                        //         )),
                        //   ),
                        // ),
                        SizedBox(
                          height: 100,
                        )
                      ]
              ],
            ),
          ),
        ),
      );
    });
  }
}
