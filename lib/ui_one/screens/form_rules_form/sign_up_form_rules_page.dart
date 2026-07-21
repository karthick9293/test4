import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_one_custom_widgets.dart';
import '../../../core/exports/ui_one_pages.dart';
import '../../../core/exports/ui_one_shimmer.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/models/formatter.dart';
import '../../../models/form_rules/form_rules_response_fz.dart';

class SignUpFormRulesPage extends StatefulWidget {
  const SignUpFormRulesPage({super.key});

  @override
  State<SignUpFormRulesPage> createState() => _SignUpFormRulesPageState();
}

class _SignUpFormRulesPageState extends State<SignUpFormRulesPage> {
  @override
  void initState() {
    super.initState();
    Get.find<SignUpController>().scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    Get.find<SignUpController>().scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get.find<SignUpController>().getSignUpForm(nIDLogin: true);
    int allowedMinAge = int.parse(Box3.settings.allowedMinAge);
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String stepOrderId = arguments['stepOrderId'] ?? '';
    // String customerCode = arguments['customerCode'] ?? '';
    // String idNumber = arguments['idNumber'] ?? '';
    // String mobile = arguments['mobile'] ?? '';

    return GetBuilder<SignUpController>(builder: (signUpController) {
      List<Widget> children() {
        List<Widget> l = [];
        l.add(Visibility(
          visible: false,
          //Todo:Disabled by default to be enabled on corporte flow
          child: Row(
            children: [
              const SizedBox(width: 20),
              radioTile(signUpController.type == 'Individual', 'Individual',
                  onTap: () => signUpController
                    ..type = 'Individual'
                    ..update()),
              const SizedBox(width: 15),
              radioTile(signUpController.type == 'Corporate', 'Corporate',
                  onTap: () => signUpController
                    ..type = 'Corporate'
                    ..update()),
            ],
          ),
        ));

        List<FormFieldItem> fields = signUpController.formBV!.formFieldItem
            .toList()
          ..sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          bool enable = f.enabled;
          bool isVisible = f.IsVisible.toLowerCase() == 'true';
          bool isMandatory = f.IsMandatory.toLowerCase() == 'true';

          // Prefill extracted ID details from KYC/OCR
          signUpController.prefillExtractedIDdetails(f);
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
              if (f.FzParamName == "IdNo") {
                if (signUpController.customerAuthData['IdNo'] != null) {
                  signUpController.form.textFieldControllers[f.FzParamName]
                      ?.text = signUpController.customerAuthData['IdNo'];
                  enable = false;
                }
              }
              if (f.FzParamName == "Mobile") {
                if (signUpController.customerAuthData['Mobile'] != null) {
                  String mobile = "";
                  if (f.MaxLength.isNotEmpty &&
                      signUpController.customerAuthData['Mobile']
                              .toString()
                              .length >
                          int.parse(f.MaxLength)) {
                    mobile = signUpController.customerAuthData['Mobile']
                        .toString()
                        .substring(f.Prefix.length);
                  } else {
                    mobile = signUpController.customerAuthData['Mobile'] ?? "";
                  }
                  if (mobile != "") {
                    enable = false;
                  }
                  signUpController
                      .form.textFieldControllers[f.FzParamName]?.text = mobile;
                }
              }
              if (f.Regex.isNotEmpty) inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              l.add(
                textFormField(
                  key: signUpController.form.keys[f.Id.toString()],
                  controller:
                      signUpController.form.textFieldControllers[f.FzParamName],
                  labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                  inputFormatters: inputFormatters,
                  focusNode: signUpController.form.nodes[f.FzParamName],
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  errorText:
                      signUpController.form.errorTexts[f.FzParamName] ?? "",
                  maxLength: f.maxLength,
                  enabled: enable,
                  onChanged: (v) {
                    if (signUpController
                        .form.errorTexts[f.FzParamName]!.isNotEmpty) {
                      signUpController.form.errorTexts[f.FzParamName] = '';
                      signUpController.update();
                    }
                    if (f.maxLength != null) {
                      signUpController.update();
                    }
                  },
                  onEditingComplete: () {
                    String? id = signUpController.formBV?.formFieldItem
                        .toList()
                        .firstWhereOrNull((f0) =>
                            f0.index == f.index + 1 &&
                            (f0.FieldType == FieldType.text ||
                                f0.FieldType == FieldType.number))
                        ?.FzParamName;
                    Get.focusScope?.unfocus();
                    signUpController.form.nodes[id]?.requestFocus();
                  },
                  obscure:
                      signUpController.form.visibilities[f.FzParamName] == true,
                  obscuringCharacter: f.Masking != "" ? f.Masking : null,
                  trailing: f.Masking != ""
                      ? GestureDetector(
                          onTap: () async {
                            if (signUpController
                                .form.visibilities[f.FzParamName]!) {
                              signUpController
                                ..form.visibilities[f.FzParamName] = false
                                ..update();
                              await Future.delayed(const Duration(seconds: 2));
                              signUpController
                                ..form.visibilities[f.FzParamName] = true
                                ..update();
                            }
                          },
                          child: Icon(
                            signUpController.form.visibilities[f.FzParamName] ==
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
                  prefixText: '${f.Prefix} ',
                ),
              );
              break;
            case FieldType.text:
              if (!isVisible && !isMandatory) {
                break;
              }

              List<TextInputFormatter>? inputFormatters = [];

              if (f.Regex.isNotEmpty) {
                inputFormatters
                    .add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              }
              l.add(
                textFormField(
                  key: signUpController.form.keys[f.Id.toString()],
                  controller:
                      signUpController.form.textFieldControllers[f.FzParamName],
                  labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                  inputFormatters: inputFormatters,
                  maxLength: f.maxLength,
                  enabled: f.enabled,
                  focusNode: signUpController.form.nodes[f.FzParamName],
                  errorText:
                      signUpController.form.errorTexts[f.FzParamName] ?? "",
                  onChanged: (v) {
                    if (signUpController
                        .form.errorTexts[f.FzParamName]!.isNotEmpty) {
                      signUpController.form.errorTexts[f.FzParamName] = '';
                      signUpController.update();
                    }
                    if (f.maxLength != null) {
                      signUpController.update();
                    }
                  },
                  onEditingComplete: () {
                    String? id = signUpController.formBV?.formFieldItem
                        .firstWhere((f0) =>
                            f0.index == f.index + 1 &&
                            (f0.FieldType == FieldType.text ||
                                f0.FieldType == FieldType.number))
                        .FzParamName;
                    Get.focusScope?.unfocus();
                    signUpController.form.nodes[id]?.requestFocus();
                  },
                  obscure:
                      signUpController.form.visibilities[f.FzParamName] == true,
                  obscuringCharacter: f.Masking != "" ? f.Masking : null,
                  trailing: f.Masking != ""
                      ? GestureDetector(
                          onTap: () async {
                            if (signUpController
                                .form.visibilities[f.FzParamName]!) {
                              signUpController
                                ..form.visibilities[f.FzParamName] = false
                                ..update();
                              await Future.delayed(const Duration(seconds: 2));
                              signUpController
                                ..form.visibilities[f.FzParamName] = true
                                ..update();
                            }
                          },
                          child: Icon(
                            signUpController.form.visibilities[f.FzParamName] ==
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
              );
              break;
            case FieldType.dateTime:
              if (!isVisible && !isMandatory) {
                break;
              }
              f.FzParamName == "SalaryDate"
                  ? l.add(
                      DayPickerField(
                        key: signUpController.form.keys[f.Id.toString()],
                        selectedDay: 1,
                        ctrls: signUpController
                            .form.dateFieldControllers[f.FzParamName]!,
                        nodes: signUpController
                            .form.dateFieldNodes[f.FzParamName]!,
                        title: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                        error: signUpController.form.errorTexts[f.FzParamName]!,
                        onSelected: (isValid, {int? day}) {
                          if (isValid) {
                            signUpController.form.dates[f.FzParamName] =
                                DateFormatter.newFormat(
                                    DateTime.now().copyWith(day: day),
                                    'dd/MMM/yyyy');
                            signUpController.form.errorTexts[f.FzParamName] =
                                '';
                          } else {
                            if (day == null) {
                              signUpController.form.dates.remove(f.FzParamName);
                              signUpController.form.errorTexts[f.FzParamName] =
                                  "Required".tr;
                            } else {
                              signUpController.form.dates[f.FzParamName] = '';
                              signUpController.form.errorTexts[f.FzParamName] =
                                  """Enter Current Month's Date""".tr;
                            }
                          }
                          signUpController.update();
                        },
                      ),
                    )
                  : l.add(
                      dateField(
                          key: signUpController.form.keys[f.Id.toString()],
                          ctrls: signUpController
                              .form.dateFieldControllers[f.FzParamName]!,
                          nodes: signUpController
                              .form.dateFieldNodes[f.FzParamName]!,
                          error:
                              signUpController.form.errorTexts[f.FzParamName]!,
                          update: signUpController.update,
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
                                'DateOfBirth': DateTime(
                                    DateTime.now().year - 100,
                                    DateTime.now().month,
                                    DateTime.now().day),
                                'IdIssueDate': DateTime(
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
                                'IdIssueDate': DateTime.now(),
                                'IdExpiryDate': DateTime.now()
                                    .add(const Duration(days: 365 * 30)),
                                'dummy_salary_date': DateTime.now()
                                    .add(const Duration(days: 365 * 30)),
                              }[f.FzParamName] ??
                              DateTime.now(),
                          erfc: (b, {DateTime? date}) {
                            //TODO: Handle age limit here
                            if (date == null) {
                              signUpController.form.dates.remove(f.FzParamName);
                            } else {
                              signUpController.form.dates[f.FzParamName] =
                                  DateFormatter.newFormat(date, 'dd/MMM/yyyy');
                            }

                            signUpController.form.errorTexts[f.FzParamName] =
                                b ? '' : 'Invalid_date'.tr;
                            signUpController.update();
                          },
                          onComplete: () {
                            String? id = signUpController.formBV?.formFieldItem
                                .firstWhereOrNull((f0) =>
                                    f0.index == f.index + 1 &&
                                    (f0.FieldType == FieldType.text ||
                                        f0.FieldType == FieldType.number))
                                ?.FzParamName;
                            Get.focusScope?.unfocus();
                            signUpController.form.nodes[id]?.requestFocus();
                          },
                          context: context,
                          title:
                              '${f.FieldDisplayName}${f.optional ? '' : ' *'}'),
                    );

              break;
            case FieldType.date:
              if (!isVisible && !isMandatory) {
                break;
              }
              f.FzParamName == "SalaryDate"
                  ? l.add(
                      DayPickerField(
                        key: signUpController.form.keys[f.Id.toString()],
                        selectedDay: 1,
                        ctrls: signUpController
                            .form.dateFieldControllers[f.FzParamName]!,
                        nodes: signUpController
                            .form.dateFieldNodes[f.FzParamName]!,
                        title: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                        error: signUpController.form.errorTexts[f.FzParamName]!,
                        onSelected: (isValid, {int? day}) {
                          if (isValid) {
                            signUpController.form.dates[f.FzParamName] =
                                DateFormatter.newFormat(
                                    DateTime.now().copyWith(day: day),
                                    'dd/MMM/yyyy');
                            signUpController.form.errorTexts[f.FzParamName] =
                                '';
                          } else {
                            if (day == null) {
                              signUpController.form.dates.remove(f.FzParamName);
                              signUpController.form.errorTexts[f.FzParamName] =
                                  "Required".tr;
                            } else {
                              signUpController.form.dates[f.FzParamName] = '';
                              signUpController.form.errorTexts[f.FzParamName] =
                                  """Enter Current Month's Date""".tr;
                            }
                          }
                          signUpController.update();
                        },
                      ),
                    )
                  : l.add(
                      dateField(
                          key: signUpController.form.keys[f.Id.toString()],
                          ctrls: signUpController
                              .form.dateFieldControllers[f.FzParamName]!,
                          nodes: signUpController
                              .form.dateFieldNodes[f.FzParamName]!,
                          error:
                              signUpController.form.errorTexts[f.FzParamName]!,
                          update: signUpController.update,
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
                                'DateOfBirth': DateTime(
                                    DateTime.now().year - 100,
                                    DateTime.now().month,
                                    DateTime.now().day),
                                'IdIssueDate': DateTime(
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
                                'IdIssueDate': DateTime.now(),
                                'IdExpiryDate': DateTime.now()
                                    .add(const Duration(days: 365 * 30)),
                                'dummy_salary_date': DateTime.now()
                                    .add(const Duration(days: 365 * 30)),
                              }[f.FzParamName] ??
                              DateTime.now(),
                          erfc: (b, {DateTime? date}) {
                            //TODO: Handle age limit here
                            if (date == null) {
                              signUpController.form.dates.remove(f.FzParamName);
                            } else {
                              signUpController.form.dates[f.FzParamName] =
                                  DateFormatter.newFormat(date, 'dd/MMM/yyyy');
                            }

                            signUpController.form.errorTexts[f.FzParamName] =
                                b ? '' : 'Invalid_date'.tr;
                            signUpController.update();
                          },
                          onComplete: () {
                            String? id = signUpController.formBV?.formFieldItem
                                .firstWhereOrNull((f0) =>
                                    f0.index == f.index + 1 &&
                                    (f0.FieldType == FieldType.text ||
                                        f0.FieldType == FieldType.number))
                                ?.FzParamName;
                            Get.focusScope?.unfocus();
                            signUpController.form.nodes[id]?.requestFocus();
                          },
                          context: context,
                          title:
                              '${f.FieldDisplayName}${f.optional ? '' : ' *'}'),
                    );
              break;
            case FieldType.dropDownSingle:
              if (!isVisible && !isMandatory) {
                break;
              }

              l.add(genericBottomSheet(
                  key: signUpController.form.keys[f.Id.toString()],
                  isDark: signUpController.isDark,
                  enable: enable,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  value: signUpController
                          .form.selectedSources[f.FzParamName]?.Desc ??
                      '',
                  errorText:
                      signUpController.form.errorTexts[f.FzParamName] ?? "",
                  custKey: f.ApiKey,
                  f: f,
                  onTap: (s) {
                    signUpController
                      ..form.selectedSources[f.FzParamName] = s
                      ..form.errorTexts[f.FzParamName] = ''
                      ..update();

                    Get.back();
                  }));
              break;
            case FieldType.radio:
              if (!isVisible && !isMandatory) {
                break;
              }
              l.add(Column(
                key: signUpController.form.keys[f.Id.toString()],
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText1("${f.FieldDisplayName} ${f.optional ? '' : '*'}",
                      signUpController.isDark),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: (signUpController.form.sources[f.ApiKey] ?? [])
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(
                                signUpController.form
                                        .selectedSources[f.FzParamName]?.Code ==
                                    e.Code,
                                e.Desc.tr,
                                onTap: () => signUpController
                                  ..form.selectedSources[f.FzParamName] = e
                                  ..form.errorTexts[f.FzParamName] = ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(
                      signUpController.form.errorTexts[f.FzParamName] ?? "")
                ],
              ));
              break;
            case FieldType.checkBox:
              if (!isVisible && !isMandatory) {
                break;
              }
              if (f.FzParamName.contains("term")) {
                l.add(Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    key: signUpController.form.keys[f.Id.toString()],
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Checkbox(
                              value: signUpController
                                      .form.checkBoxes[f.FzParamName] ??
                                  false,
                              activeColor: AppConfigs.rg,
                              onChanged: (b) => signUpController
                                ..form.checkBoxes[f.FzParamName] = b ?? false
                                ..form.errorTexts[f.FzParamName] = ''
                                ..update(),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.to(
                                () => Scaffold(
                                  backgroundColor: AppConfigs.bodybg(
                                      signUpController.isDark),
                                  body: const TermsAndConditionsPage(
                                      isPreLogin: true),
                                ),
                              ),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        style: TS.f14,
                                        text:
                                            '${'by_signing_up_you_are_confirming'.tr} '),
                                    TextSpan(
                                      style: TS.f14.copyWith(
                                          color: AppConfigs.primaryColor,
                                          decoration: TextDecoration.underline),
                                      text: 't_and_c'.tr,
                                    )
                                  ],
                                ),
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        child: errorText(
                            signUpController.form.errorTexts[f.FzParamName]!),
                      )
                    ],
                  ),
                ));
              } else {}

              break;
          }
        }
        // l.addAll([
        //   Padding(
        //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       key: signUpController.form.keys["t&c"],
        //       children: [
        //         Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             SizedBox(
        //               height: 30,
        //               width: 30,
        //               child: Checkbox(
        //                 value: signUpController.signUpAttributes.acceptTAndC,
        //                 activeColor: AppConfigs.rg,
        //                 onChanged: (b) => signUpController
        //                   ..signUpAttributes.acceptTAndC = b ?? false
        //                   ..form.errorTexts['t&c'] = ''
        //                   ..update(),
        //               ),
        //             ),
        //             Expanded(
        //               child: GestureDetector(
        //                 onTap: () => Get.to(
        //                   () => Scaffold(
        //                     backgroundColor:
        //                         AppConfigs.bodybg(signUpController.isDark),
        //                     body:
        //                         const TermsAndConditionsPage(isPreLogin: true),
        //                   ),
        //                 ),
        //                 child: Text.rich(
        //                   TextSpan(
        //                     children: [
        //                       TextSpan(
        //                           style: TS.f14,
        //                           text:
        //                               '${'by_signing_up_you_are_confirming'.tr} '),
        //                       TextSpan(
        //                         style: TS.f14.copyWith(
        //                             color: AppConfigs.primaryColor,
        //                             decoration: TextDecoration.underline),
        //                         text: 't_and_c'.tr,
        //                       )
        //                     ],
        //                   ),
        //                   softWrap: true,
        //                   textAlign: TextAlign.start,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Align(
        //           child: errorText(signUpController.form.errorTexts['t&c']!),
        //         )
        //       ],
        //     ),
        //   ),
        //   errorText(signUpController.signUpAttributes.tAndCError),
        // ]);
        return l;
      }

      return Scaffold(
        appBar:
            appBar0(cms(Fields.Signup_PageHeading).textHeading!, onTap2: () {
          Get.focusScope?.unfocus();
          Get.back();
        }),
        backgroundColor: signUpController.isDark ? AppConfigs.b : AppConfigs.w,
        body: signUpController.formBV == null
            //? Center(child: loader())
            ? FormShimmer()
            : SafeArea(
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Text(
                            '${'signin_up_is'.tr} ',
                            style: TextStyles.font12.copyWith(
                                color: signUpController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.g4),
                          ),
                          Text(
                            'fast_and_easy'.tr,
                            style: TextStyles.font12
                                .copyWith(color: ConstColors.primary),
                          ),
                        ],
                      ),
                    ),
                    ...children(),
                    FormLoggerView(
                      formName: FormNames.signUpFormRule,
                      formRuleData: signUpController.formBV,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
        bottomNavigationBar: SafeArea(
          child: signUpController.formBV == null
              ? SizedBox()
              : signUpController.loading
                  ? SizedBox(height: 50, child: loader())
                  : roundButton(cms(Fields.Signup_NextButton).textHeading!,
                      top: 20, onTap: () async {
                      signUpController.loading = true;
                      signUpController.update();
                      bool status = signUpController.form
                          .validateNew(signUpController.formBV!.formFieldItem);
                      if (status) {
                        try {
                          await signUpController.addCustomer(
                              customerData: signUpController.form.buildJsonNew(
                                  signUpController.formBV!.formFieldItem),
                              authData: {},
                              stepOrderId: stepOrderId);
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      }
                      signUpController.loading = false;
                      signUpController.update();
                    }),
        ),
      );
    });
  }
}
