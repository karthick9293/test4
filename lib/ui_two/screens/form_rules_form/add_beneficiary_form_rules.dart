import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/exports/ui_two_shimmer.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/models/formatter.dart';
import '../../../models/form_rules/form_rules_response_fz.dart';
import '../../../models/masters/master_response_fz.dart';

class AddBeneficiaryFormRules extends StatelessWidget {
  final void Function()? onTap2;
  final Map<String, dynamic>? data;

  const AddBeneficiaryFormRules({super.key, this.onTap2, this.data});

  @override
  Widget build(BuildContext context) {
    int allowedMinAge = int.parse(Box3.settings.allowedMinAge);
    late AddBeneficiaryController addBenefController;
    if (Get.isRegistered<AddBeneficiaryController>()) {
      addBenefController = Get.find<AddBeneficiaryController>();
    } else {
      addBenefController = Get.put(AddBeneficiaryController());
    }
    if (addBenefController.addBeneficiaryButtonLoading) {
      addBenefController.addBeneficiaryButtonLoading = false;
    }
    if (data == null) {
      // Add benficiary form
      addBenefController.benefAttributes.isAddBeneficiary = true;

      // CBLimitCheckResult res =
      //     Get.find<AccountController>().checkBenefCreationLimitExeeded();

      // if (res.isLimitExceeded) {
      //   WidgetsBinding.instance.addPostFrameCallback(
      //     (timeStamp) {
      //       errorAlert(
      //         content: '${res.message} ${res.limit}',
      //         function: () {
      //           Get.back();
      //           Get.find<MainController>().pop();
      //         },
      //       );
      //     },
      //   );
      // }
    } else {
      // Edit beneficiary form
      addBenefController.benefAttributes.isAddBeneficiary = false;
    }
    addBenefController.isFormUpdating = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addBenefController.getBeneficiaryForm(data: data);
    });
    return GetBuilder<AddBeneficiaryController>(
      builder: (addBeneficiaryController) {
        List<Widget> children() {
          List<Widget> l = [];
          List<FormFieldItem> fields = addBeneficiaryController
              .beneficiaryFormBV!.formFieldItem
              .toList();
          fields.sort((a, b) => a.index.compareTo(b.index));

          for (FormFieldItem f in fields) {
            switch (f.FieldType) {
              case FieldType.number:
                l.add(
                  Visibility(
                    visible: addBeneficiaryController
                        .visibilityChecker(f.FzParamName),
                    // visible: f.IsVisible.toString().toLowerCase().contains("true"),
                    child: textFormField(
                      key: addBeneficiaryController.form.keys[f.Id.toString()],
                      controller: addBeneficiaryController
                          .form.textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      hintText: f.FieldDisplayName,
                      inputFormatters: f.Regex.isNotEmpty
                          ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                          : null,
                      focusNode:
                          addBeneficiaryController.form.nodes[f.FzParamName],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      errorText: addBeneficiaryController
                          .form.errorTexts[f.FzParamName]!,
                      maxLength: f.maxLength,
                      enabled: f.enabled,
                      obscure: addBeneficiaryController
                              .form.visibilities[f.FzParamName] ==
                          true,
                      obscuringCharacter: f.Masking != "" ? f.Masking : null,
                      onChanged: (v) {
                        if (addBeneficiaryController
                            .form.errorTexts[f.FzParamName]!.isNotEmpty) {
                          addBeneficiaryController
                              .form.errorTexts[f.FzParamName] = '';
                          addBeneficiaryController.update();
                        }
                        if (f.maxLength != null) {
                          addBeneficiaryController.update();
                        }
                      },
                      onEditingComplete: () {
                        String? id = addBeneficiaryController
                            .beneficiaryFormBV?.formFieldItem
                            .toList()
                            .firstWhereOrNull((f0) =>
                                f0.index == f.index + 1 &&
                                (f0.FieldType == FieldType.text ||
                                    f0.FieldType == FieldType.number))
                            ?.FzParamName;
                        Get.focusScope?.unfocus();
                        addBeneficiaryController.form.nodes[id]?.requestFocus();
                      },
                      trailing: f.Masking != ""
                          ? GestureDetector(
                              onTap: () async {
                                if (addBeneficiaryController
                                    .form.visibilities[f.FzParamName]!) {
                                  addBeneficiaryController
                                    ..form.visibilities[f.FzParamName] = false
                                    ..update();
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  addBeneficiaryController
                                    ..form.visibilities[f.FzParamName] = true
                                    ..update();
                                }
                              },
                              child: Icon(
                                addBeneficiaryController
                                            .form.visibilities[f.FzParamName] ==
                                        true
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                                color: AppConfigs.g77,
                              ),
                            )
                          : null,
                      suffix: f.Suffix.isNotEmpty
                          ? Text(
                              f.Suffix,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            )
                          : null,
                      prefixText: f.Prefix,
                    ),
                  ),
                );
                break;
              case FieldType.text:
                l.add(
                  Visibility(
                    visible: addBeneficiaryController
                        .visibilityChecker(f.FzParamName),
                    child: textFormField(
                      key: addBeneficiaryController.form.keys[f.Id.toString()],
                      controller: addBeneficiaryController
                          .form.textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      hintText: f.FieldDisplayName,
                      inputFormatters: f.Regex.isNotEmpty
                          ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                          : null,
                      maxLength: f.maxLength,
                      enabled: f.enabled,
                      focusNode:
                          addBeneficiaryController.form.nodes[f.FzParamName],
                      errorText: addBeneficiaryController
                          .form.errorTexts[f.FzParamName]!,
                      onChanged: (v) {
                        if (addBeneficiaryController
                            .form.errorTexts[f.FzParamName]!.isNotEmpty) {
                          addBeneficiaryController
                              .form.errorTexts[f.FzParamName] = '';
                          addBeneficiaryController.update();
                        }
                        if (f.maxLength != null) {
                          addBeneficiaryController.update();
                        }
                      },
                      onEditingComplete: () {
                        String? id = addBeneficiaryController
                            .beneficiaryFormBV?.formFieldItem
                            .firstWhereOrNull((f0) =>
                                f0.index == f.index + 1 &&
                                (f0.FieldType == FieldType.text ||
                                    f0.FieldType == FieldType.number))
                            ?.FzParamName;
                        Get.focusScope?.unfocus();
                        addBeneficiaryController.form.nodes[id]?.requestFocus();
                      },
                      obscure: addBeneficiaryController
                              .form.visibilities[f.FzParamName] ==
                          true,
                      obscuringCharacter: f.Masking != "" ? f.Masking : null,
                      trailing: f.Masking != ""
                          ? GestureDetector(
                              onTap: () async {
                                if (addBeneficiaryController
                                    .form.visibilities[f.FzParamName]!) {
                                  addBeneficiaryController
                                    ..form.visibilities[f.FzParamName] = false
                                    ..update();
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  addBeneficiaryController
                                    ..form.visibilities[f.FzParamName] = true
                                    ..update();
                                }
                              },
                              child: Icon(
                                addBeneficiaryController
                                            .form.visibilities[f.FzParamName] ==
                                        true
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                                color: AppConfigs.g77,
                              ),
                            )
                          : null,
                      suffix: f.Suffix.isNotEmpty
                          ? Text(
                              f.Suffix,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            )
                          : null,
                      prefixText: f.Prefix,
                    ),
                  ),
                );
                break;
              case FieldType.date:
                l.add(Visibility(
                  visible:
                      addBeneficiaryController.visibilityChecker(f.FzParamName),
                  child: dateField(
                    key: addBeneficiaryController.form.keys[f.Id.toString()],
                    context: context,
                    ctrls: addBeneficiaryController
                        .form.dateFieldControllers[f.FzParamName]!,
                    nodes: addBeneficiaryController
                        .form.dateFieldNodes[f.FzParamName]!,
                    error: addBeneficiaryController
                        .form.errorTexts[f.FzParamName]!,
                    update: addBeneficiaryController.update,
                    title: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                    erfc: (b, {DateTime? date}) {
                      //TODO: Handle age limit here
                      if (date == null) {
                        addBeneficiaryController.form.dates
                            .remove(f.FzParamName);
                      } else {
                        addBeneficiaryController.form.dates[f.FzParamName] =
                            DateFormatter.newFormat(date, 'dd/MMM/yyyy');
                      }

                      addBeneficiaryController.form.errorTexts[f.FzParamName] =
                          b ? '' : 'Invalid_date'.tr;
                      addBeneficiaryController.update();
                    },
                    onComplete: () {
                      String? id = addBeneficiaryController
                          .beneficiaryFormBV?.formFieldItem
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      addBeneficiaryController.form.nodes[id]?.requestFocus();
                    },
                    topMargin: 0,
                    initialDate: {
                          'DateOfBirth': DateTime(
                              DateTime.now().year - allowedMinAge,
                              DateTime.now().month,
                              DateTime.now().day),
                          'dummy_idissueDate': DateTime.now(),
                          'IdExpiryDate': DateTime.now(),
                          'dummy_salary_date': DateTime.now()
                        }[f.FzParamName] ??
                        DateTime.now(),
                    firstDate: {
                          'DateOfBirth': DateTime(
                              DateTime.now().year - 100,
                              DateTime.now().month,
                              DateTime.now().day),
                          'dummy_idissueDate': DateTime(
                              DateTime.now().year - 100,
                              DateTime.now().month,
                              DateTime.now().day),
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
                          'dummy_idissueDate': DateTime.now(),
                          'IdExpiryDate': DateTime.now()
                              .add(const Duration(days: 365 * 30)),
                          'dummy_salary_date': DateTime.now()
                              .add(const Duration(days: 365 * 30)),
                        }[f.FzParamName] ??
                        DateTime.now(),
                  ),
                ));
                break;

              case FieldType.dropDownSingle:
                l.add(
                  Visibility(
                    visible: addBeneficiaryController
                        .visibilityChecker(f.FzParamName),
                    child: genericBottomSheet(
                      key: addBeneficiaryController.form.keys[f.Id.toString()],
                      isDark: addBeneficiaryController.isDark,
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      hintText: f.FieldDisplayName,
                      value: addBeneficiaryController
                              .form.selectedSources[f.FzParamName]?.Desc ??
                          '',
                      benefKey: f.ApiKey,
                      id: f.FzParamName,
                      f: f,
                      errorText: addBeneficiaryController
                          .form.errorTexts[f.FzParamName]!,
                      onTap: (s) async {
                        if (f.FzParamName == '') {
                        } else {
                          final servCode = addBeneficiaryController.form
                              .selectedSources['ServiceCategoryCode']?.Code;
                          if (f.FzParamName == "ServiceCurrencyCode" &&
                              (servCode == 'B' ||
                                  servCode == 'W' ||
                                  servCode == 'C')) {
                            addBeneficiaryController
                              ..form.selectedSources[f.FzParamName] = s
                              ..form.errorTexts[f.FzParamName] = ''
                              ..isFormUpdating = true
                              ..update();

                            Get.back();

                            // Collect current form data
                            Map<String, dynamic> currentFormData =
                                addBeneficiaryController.getCurrentFormData();

                            Box3.addBeneficiaryFormBV = null;

                            // Refetch form with current data
                            await addBenefController.getBeneficiaryForm(
                                data: currentFormData,
                                criteriaMap:
                                    "Correspondent Country = ${addBeneficiaryController.form.selectedSources['CountryCode']?.countryCode};Correspondent Currency = ${addBeneficiaryController.form.selectedSources['ServiceCurrencyCode']?.currencyCode};Correspondent Service Category = ${addBeneficiaryController.form.selectedSources['ServiceCategoryCode']?.Code}");
                            addBenefController
                              ..isFormUpdating = false
                              ..update();

                            await addBeneficiaryController
                                .dropdownOnTapHandlers(f.FzParamName, f);
                          } else if (f.FzParamName == "BeneficiaryBranchCode") {
                            var n = s.copyWith(
                                Desc: s.Desc,
                                Code: s.BranchCode,
                                BankCode: s.BankCode);
                            addBeneficiaryController
                              ..form.selectedSources[f.FzParamName] = n
                              ..form.errorTexts[f.FzParamName] = ''
                              ..update();

                            Get.back();
                            await addBeneficiaryController
                                .dropdownOnTapHandlers(f.FzParamName, f);
                          } else {
                            addBeneficiaryController
                              ..form.selectedSources[f.FzParamName] = s
                              ..form.errorTexts[f.FzParamName] = ''
                              ..update();

                            Get.back();
                            await addBeneficiaryController
                                .dropdownOnTapHandlers(f.FzParamName, f);
                          }
                        }
                      },
                    ),
                  ),
                );
                break;
              case FieldType.radio:
                l.add(Column(
                  key: addBeneficiaryController.form.keys[f.Id.toString()],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText1(
                        f.FieldDisplayName, addBeneficiaryController.isDark),
                    Wrap(
                      children: (f.setOptions() ??
                              addBeneficiaryController.form.sources[f.ApiKey] ??
                              [])
                          .toList()
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 20, top: 5),
                              child: radioTile(
                                  addBeneficiaryController.form
                                          .selectedSources[f.FzParamName]?.id ==
                                      e.id,
                                  e.Desc.tr,
                                  onTap: () => addBeneficiaryController
                                    ..form.selectedSources[f.FzParamName] = e
                                    ..form.errorTexts[f.FzParamName] = ''
                                    ..update()),
                            ),
                          )
                          .toList(),
                    ),
                    errorText(addBeneficiaryController
                            .form.errorTexts[f.FzParamName] ??
                        '')
                  ],
                ));
                break;
            }
          }
          return l;
        }

        return Column(
          children: [
            AppbarUiTwo(
              title: cms(Fields.MyBeneficiary_AddBeneficiary).textHeading!,
            ),
            Expanded(
              child: !addBeneficiaryController.catalogueRetrieved
                  // ? loader()
                  ? FormShimmer()
                  : Stack(
                      children: [
                        ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 20),
                          children: [
                            ...children(),
                            FormLoggerView(
                              formName: FormNames.beneficiaryCreationFormRules,
                              formRuleData:
                                  addBeneficiaryController.beneficiaryFormBV,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            BottomButtons.addBeneficiarySubmit,
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                        if (addBenefController.isFormUpdating) ...[
                          ModalBarrier(
                            color: Colors.black.withOpacity(0.1),
                            dismissible: false,
                          ),
                          loader(),
                        ],
                      ],
                    ),
            ),
          ],
        );
      },
    );
  }
}
