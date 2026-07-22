import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/transfer_controller.dart';
import 'package:mobiremit/models/beneficiary/beneficiary_fz.dart';

import '../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/models/formatter.dart';
import '../../../models/form_rules/form_rules_response_fz.dart';
import '../../../models/masters/master_response_fz.dart';

class SendMoneyFormRule extends StatefulWidget {
  final TransferController controller;

  const SendMoneyFormRule({super.key, required this.controller});

  @override
  State<SendMoneyFormRule> createState() => _SendMoneyFormRuleState();
}

class _SendMoneyFormRuleState extends State<SendMoneyFormRule> {
  TransferController transferController = Get.find<TransferController>();

  @override
  void initState() {
    super.initState();
    transferController = widget.controller;
    // transferController.getSendMoneyForm();
  }

  @override
  Widget build(BuildContext context) {
    int allowedMinAge = int.parse(Box3.settings.allowedMinAge);
    return GetBuilder<TransferController>(builder: (transferController) {
      List<Widget> children() {
        List<Widget> l = [];

        List<FormFieldItem> fields =
            transferController.sendMoneyFormBV!.formFieldItem.toList()
              ..sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          bool enable = f.enabled;
          bool isVisible = f.IsVisible.toLowerCase() == 'true';
          bool isMandatory = f.IsMandatory.toLowerCase() == 'true';
          // log('fieldname: ${f.FzParamName}, isvisible: ${f.IsVisible}, isMandatory: ${f.IsMandatory}');
          //debugPrint("${f.FieldDisplayName} : ${f.FieldType} : ${f.FzParamName} :APIKEY: ${f.ApiKey} :: required :: ${!f.optional}");
          switch (f.FieldType) {
            case FieldType.number:
              /* if field visibility is false (no need to show the field) and its
                not mandatory skip adding the field */
              if (!isVisible && !isMandatory) {
                break;
              }

              List<TextInputFormatter>? inputFormatters = [];
              // if (f.intLimit != null) {
              //   inputFormatters.add(intLimit(f.intLimit!));
              // }
              // if (f.decimalLength != null) {
              //   inputFormatters.add(decimalFormatter(length: f.decimalLength ?? 3));
              // }

              if (f.FzParamName == 'AccountNumber') {
                transferController
                        .form.textFieldControllers['AccountNumber']?.text =
                    transferController.selectedBeneficiary?.accountNumber ?? "";
              }

              inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              l.add(
                textFormField(
                    key: transferController.form.keys[f.Id.toString()],
                    controller: transferController
                        .form.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                    inputFormatters: inputFormatters,
                    focusNode: transferController.form.nodes[f.FzParamName],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    errorText:
                        transferController.form.errorTexts[f.FzParamName] ?? "",
                    maxLength: f.maxLength,
                    enabled: enable,
                    onChanged: (v) {
                      if (transferController
                          .form.errorTexts[f.FzParamName]!.isNotEmpty) {
                        transferController.form.errorTexts[f.FzParamName] = '';
                        transferController.update();
                      }
                      if (f.maxLength != null) {
                        transferController.update();
                      }
                    },
                    onEditingComplete: () {
                      String? id = transferController
                          .sendMoneyFormBV?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      transferController.form.nodes[id]?.requestFocus();
                    },
                    prefixText: '${f.Prefix} '),
              );
              break;
            case FieldType.text:
              if (!isVisible && !isMandatory) {
                break;
              }

              List<TextInputFormatter>? inputFormatters = [];

              if (f.Regex != "") {
                inputFormatters
                    .add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              }
              l.add(
                textFormField(
                    key: transferController.form.keys[f.Id.toString()],
                    controller: transferController
                        .form.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                    inputFormatters: inputFormatters,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    focusNode: transferController.form.nodes[f.FzParamName],
                    errorText:
                        transferController.form.errorTexts[f.FzParamName] ?? "",
                    onChanged: (v) {
                      if (transferController
                          .form.errorTexts[f.FzParamName]!.isNotEmpty) {
                        transferController.form.errorTexts[f.FzParamName] = '';
                        transferController.update();
                      }
                      if (f.maxLength != null) {
                        transferController.update();
                      }
                    },
                    onEditingComplete: () {
                      String? id = transferController
                          .sendMoneyFormBV?.formFieldItem
                          .firstWhere((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          .FzParamName;
                      Get.focusScope?.unfocus();
                      transferController.form.nodes[id]?.requestFocus();
                    },
                    prefixText: f.Prefix),
              );
              break;
            case FieldType.dateTime:
              if (!isVisible && !isMandatory) {
                break;
              }

              l.add(
                dateField(
                    key: transferController.form.keys[f.Id.toString()],
                    ctrls: transferController
                        .form.dateFieldControllers[f.FzParamName]!,
                    nodes:
                        transferController.form.dateFieldNodes[f.FzParamName]!,
                    error: transferController.form.errorTexts[f.FzParamName]!,
                    update: transferController.update,
                    topMargin: 0,
                    initialDate: {
                          'DateOfBirth': DateTime(
                              DateTime.now().year - allowedMinAge,
                              DateTime.now().month,
                              DateTime.now().day),
                          'IdIssueDate': DateTime.now(),
                          'IdExpiryDate': DateTime.now(),
                          'dummy_salary_date': DateTime.now()
                        }[f.FzParamName] ??
                        DateTime.now(),
                    firstDate: {
                          'DateOfBirth': DateTime(DateTime.now().year - 100,
                              DateTime.now().month, DateTime.now().day),
                          'IdIssueDate': DateTime(DateTime.now().year - 100,
                              DateTime.now().month, DateTime.now().day),
                          'IdExpiryDate': DateTime.now(),
                          'dummy_salary_date': DateTime.now()
                              .subtract(const Duration(days: 365 * 30)),
                        }[f.FzParamName] ??
                        DateTime.now(),
                    lastDate: {
                          'DateOfBirth': DateTime(
                              DateTime.now().year - allowedMinAge,
                              DateTime.now().month,
                              DateTime.now().day),
                          'IdIssueDate': DateTime.now(),
                          'IdExpiryDate': DateTime.now()
                              .add(const Duration(days: 365 * 30)),
                          'dummy_salary_date': DateTime.now()
                              .add(const Duration(days: 365 * 30)),
                        }[f.FzParamName] ??
                        DateTime.now(),
                    erfc: (b, {DateTime? date}) {
                      // TODO: Handle age limit here
                      if (date == null) {
                        transferController.form.dates.remove(f.FzParamName);
                      } else {
                        transferController.form.dates[f.FzParamName] =
                            DateFormatter.newFormat(date, 'dd/MMM/yyyy');
                      }

                      transferController.form.errorTexts[f.FzParamName] =
                          b ? '' : 'Invalid_date'.tr;
                      transferController.update();
                    },
                    onComplete: () {
                      String? id = transferController
                          .sendMoneyFormBV?.formFieldItem
                          .firstWhere((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          .FzParamName;
                      Get.focusScope?.unfocus();
                      transferController.form.nodes[id]?.requestFocus();
                    },
                    context: context,
                    title: '${f.FieldDisplayName}${f.optional ? '' : ' *'}'),
              );
              break;
            case FieldType.date:
              if (!isVisible && !isMandatory) {
                break;
              }

              l.add(dummyTextField(
                  key: transferController.form.keys[f.Id.toString()],
                  // DateFormatter.newFormat(transferController.form.dates[f.FzParamName], 'dd/MMM/yyyy') ,
                  transferController.form.dates[f.FzParamName],
                  transferController.isDark,
                  trailing: Icon(Icons.calendar_month),
                  error: transferController.form.errorTexts[f.FzParamName]!,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  onTap: () async {
                DateTime? d = await showDatePicker(
                  context: context,
                  initialDate: {
                        'DateOfBirth': DateTime(
                            DateTime.now().year - allowedMinAge,
                            DateTime.now().month,
                            DateTime.now().day),
                        'IdIssueDate': DateTime.now(),
                        'IdExpiryDate': DateTime.now(),
                        'dummy_salary_date': DateTime.now()
                      }[f.FzParamName] ??
                      DateTime.now(),
                  firstDate: {
                        'DateOfBirth': DateTime(DateTime.now().year - 100,
                            DateTime.now().month, DateTime.now().day),
                        'IdIssueDate': DateTime(DateTime.now().year - 100,
                            DateTime.now().month, DateTime.now().day),
                        'IdExpiryDate': DateTime.now(),
                        'dummy_salary_date': DateTime.now()
                            .subtract(const Duration(days: 365 * 30)),
                      }[f.FzParamName] ??
                      DateTime.now(),
                  lastDate: {
                        'DateOfBirth': DateTime(
                            DateTime.now().year - allowedMinAge,
                            DateTime.now().month,
                            DateTime.now().day),
                        'IdIssueDate': DateTime.now(),
                        'IdExpiryDate':
                            DateTime.now().add(const Duration(days: 365 * 30)),
                        'dummy_salary_date':
                            DateTime.now().add(const Duration(days: 365 * 30)),
                      }[f.FzParamName] ??
                      DateTime.now(),
                );
                if (d != null) {
                  transferController
                    ..form.dates[f.FzParamName] =
                        DateFormatter.newFormat(d, 'dd/MMM/yyyy')
                    ..form.errorTexts[f.FzParamName] = ''
                    ..update();
                }
              }));
              break;
            case FieldType.dropDownSingle:
              if (!isVisible && !isMandatory) {
                break;
              }

              if (f.FzParamName == "BeneficiaryBankCode") {
                enable =
                    !(transferController.form.sources[f.ApiKey]?.length == 1 &&
                        transferController
                                .form.selectedSources["BeneficiaryBankCode"] !=
                            null);
              } else if (f.FzParamName == "BankCode") {
                enable =
                    !(transferController.form.sources[f.ApiKey]?.length == 1 &&
                        transferController.form.selectedSources["BankCode"] !=
                            null);
              } else if (f.FzParamName == "BeneficiaryBranchCode") {
                enable =
                    !(transferController.form.sources[f.ApiKey]?.length == 1 &&
                        transferController.form
                                .selectedSources["BeneficiaryBranchCode"] !=
                            null);
              }

              l.add(genericBottomSheet(
                  key: transferController.form.keys[f.Id.toString()],
                  isDark: transferController.isDark,
                  enableSecondTheme: true,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  value: transferController
                          .form.selectedSources[f.FzParamName]?.Desc ??
                      '',
                  errorText:
                      transferController.form.errorTexts[f.FzParamName] ?? "",
                  sendMoneyKey: f.ApiKey,
                  // fillColor: AppConfigs.w,
                  enable: enable,
                  f: f,
                  form: transferController.form,
                  onTap: (s) async {
                    // clear rates
                    transferController.fromAmountCtrl.clear();
                    transferController.toAmountCtrl.clear();

                    if (f.FzParamName == "BeneficiaryBranchCode") {
                      var n = s.copyWith(
                          Desc: s.Desc,
                          Code: s.BranchCode,
                          BankCode: s.BankCode);
                      transferController
                        ..form.selectedSources[f.FzParamName] = n
                        ..form.errorTexts[f.FzParamName] = ''
                        ..update();
                    } else {
                      transferController
                        ..form.selectedSources[f.FzParamName] = s
                        ..form.errorTexts[f.FzParamName] = ''
                        ..update();
                    }

                    Get.back();
                    await transferController.dropdownOnTapHandlers(f);
                  }));
              break;
            case FieldType.radio:
              if (!isVisible && !isMandatory) {
                break;
              }
              l.add(Column(
                key: transferController.form.keys[f.Id.toString()],
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText1("${f.FieldDisplayName} ${f.optional ? '' : '*'}",
                      transferController.isDark),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: (transferController.form.sources[f.ApiKey] ?? [])
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(
                                transferController.form
                                        .selectedSources[f.FzParamName]?.Code ==
                                    e.Code,
                                e.Desc.tr,
                                onTap: () => transferController
                                  ..form.selectedSources[f.FzParamName] = e
                                  ..form.errorTexts[f.FzParamName] = ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(
                      transferController.form.errorTexts[f.FzParamName] ?? "")
                ],
              ));
              // l.add(genericBottomSheet(
              //     isDark: transferController.isDark,
              //     labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
              //     value: transferController.form.selectedSources[f.FzParamName]?.Desc ?? '',
              //     errorText: transferController.form.errorTexts[f.FzParamName] ?? "",
              //     custKey: f.ApiKey,
              //     onTap: (s) {
              //       transferController
              //         ..form.selectedSources[f.FzParamName] = s
              //         ..form.errorTexts[f.FzParamName] = ''
              //         ..update();
              //       Get.back();
              //     }));
              break;
          }
        }
        return l;
      }

      return
          // (transferController.formruleLoading &&
          //         !transferController.isFormUpdating)
          //     ? Center(child: loader())
          //     // ? SignUpFormShimmer()
          //     :
          transferController.sendMoneyFormBV == null
              ? SizedBox.shrink()
              : Column(
                  children: [
                    ...children(),
                    FormLoggerView(
                      formName: FormNames.sendMoneyFormRules,
                      formRuleData: transferController.sendMoneyFormBV,
                    ),
                  ],
                );
    });
  }
}
