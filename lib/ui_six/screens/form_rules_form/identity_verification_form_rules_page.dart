import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/models/formatter.dart';
import '../../../models/form_rules/form_rules_response_fz.dart';

class IdentityVerificationFormRulesPage extends StatefulWidget {
  const IdentityVerificationFormRulesPage({super.key});

  @override
  State<IdentityVerificationFormRulesPage> createState() =>
      _IdentityVerificationFormRulesPageState();
}

class _IdentityVerificationFormRulesPageState
    extends State<IdentityVerificationFormRulesPage> {
  late SignUpController controller;

  final companyLogo = Base64Image(
    image: Box3.companyLogo,
    fit: BoxFit.contain,
    padding: const EdgeInsets.all(8),
    height: 200,
    width: 200,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<SignUpController>()) {
      controller = Get.find<SignUpController>();
    } else {
      controller = Get.put(SignUpController());
    }

    if (controller.idVerificationFormBV == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getIdentityVerificationForm().then((_) {
          if (controller.idVerificationFormBV != null) {
            initializeControllers();
            controller.update();
          }
        });
      });
    } else {
      initializeControllers();
    }
  }

  void initializeControllers() {
    for (var field in controller.idVerificationFormBV!.formFieldItem) {
      controller.idVerificationForm.textFieldControllers[field.FzParamName] =
          TextEditingController(text: '');
      controller.idVerificationForm.nodes[field.FzParamName] = FocusNode();
      controller.idVerificationForm.errorTexts[field.FzParamName] = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    int allowedMinAge = int.parse(Box3.settings.allowedMinAge);
    Map<String, dynamic> parameters = Get.parameters;
    String stepOrderId = parameters['stepOrderId'] ?? '';
    String customerCode = parameters['customerCode'] ?? '';
    String mobileNo = parameters['mobileNo'] ?? '';
    // String nid = arguments['idNumber'] ?? '';

    return GetBuilder<SignUpController>(builder: (signUpController) {
      List<Widget> children() {
        List<Widget> l = [];
        List<FormFieldItem> fields =
            signUpController.idVerificationFormBV!.formFieldItem.toList();
        fields.sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          bool isEnabled = f.enabled;
          switch (f.FieldType) {
            case FieldType.number:
              String? trailingIcon;

              if (f.FzParamName == "IdNo") {
                trailingIcon = Get.find<AccountController>().isDark
                    ? ImagePath.darkIdentification
                    : ImagePath.identification;

                if (signUpController.customerAuthData['IdNo'] != null) {
                  signUpController
                      .idVerificationForm
                      .textFieldControllers[f.FzParamName]
                      ?.text = signUpController.customerAuthData['IdNo'];
                  isEnabled = false;
                }
              }

              l.add(
                Visibility(
                  visible:
                      f.IsVisible.toString().toLowerCase().contains("true"),
                  child: textFormField(
                      key: signUpController
                          .idVerificationForm.keys[f.Id.toString()],
                      controller: signUpController.idVerificationForm
                          .textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      hintText: f.FieldDisplayName,
                      // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(f.Regex))],
                      focusNode: signUpController
                          .idVerificationForm.nodes[f.FzParamName],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      errorText: signUpController
                          .idVerificationForm.errorTexts[f.FzParamName]!,
                      maxLength: f.maxLength,
                      enabled: isEnabled,
                      onChanged: (v) {
                        if (signUpController.idVerificationForm
                            .errorTexts[f.FzParamName]!.isNotEmpty) {
                          signUpController.idVerificationForm
                              .errorTexts[f.FzParamName] = '';
                          signUpController.update();
                        }
                        if (f.maxLength != null) {
                          signUpController.update();
                        }
                      },
                      onEditingComplete: () {
                        String? id = signUpController
                            .idVerificationFormBV?.formFieldItem
                            .toList()
                            .firstWhereOrNull((f0) =>
                                f0.index == f.index + 1 &&
                                (f0.FieldType == FieldType.text ||
                                    f0.FieldType == FieldType.number))
                            ?.FzParamName;
                        Get.focusScope?.unfocus();
                        signUpController.idVerificationForm.nodes[id]
                            ?.requestFocus();
                      },
                      obscure: signUpController
                              .idVerificationForm.visibilities[f.FzParamName] ==
                          true,
                      obscuringCharacter: f.Masking != "" ? f.Masking : null,
                      trailing: f.Masking != ""
                          ? GestureDetector(
                              onTap: () async {
                                if (signUpController.idVerificationForm
                                    .visibilities[f.FzParamName]!) {
                                  signUpController
                                    ..idVerificationForm
                                        .visibilities[f.FzParamName] = false
                                    ..update();
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  signUpController
                                    ..idVerificationForm
                                        .visibilities[f.FzParamName] = true
                                    ..update();
                                }
                              },
                              child: Icon(
                                signUpController.idVerificationForm
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
                      suffix: f.Suffix.isNotEmpty
                          ? Text(
                              f.Suffix,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                            )
                          : null,
                      prefixText: f.Prefix != "" ? f.Prefix : null),
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
                  key: signUpController.idVerificationForm.keys[f.Id.toString()],
                  controller: signUpController
                      .idVerificationForm.textFieldControllers[f.FzParamName],
                  labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                  hintText: f.FieldDisplayName,
                  inputFormatters: f.Regex.isNotEmpty
                      ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                      : null,
                  // inputFormatters: inputFormatters,
                  maxLength: f.maxLength,
                  enabled: isEnabled,
                  focusNode:
                      signUpController.idVerificationForm.nodes[f.FzParamName],
                  errorText: signUpController
                      .idVerificationForm.errorTexts[f.FzParamName]!,
                  onChanged: (v) {
                    if (signUpController.idVerificationForm
                        .errorTexts[f.FzParamName]!.isNotEmpty) {
                      signUpController
                          .idVerificationForm.errorTexts[f.FzParamName] = '';
                      signUpController.update();
                    }
                    if (f.maxLength != null) {
                      signUpController.update();
                    }
                  },
                  onEditingComplete: () {
                    String? id = signUpController
                        .idVerificationFormBV?.formFieldItem
                        .firstWhere((f0) =>
                            f0.index == f.index + 1 &&
                            (f0.FieldType == FieldType.text ||
                                f0.FieldType == FieldType.number))
                        .FzParamName;
                    Get.focusScope?.unfocus();
                    signUpController.idVerificationForm.nodes[id]
                        ?.requestFocus();
                  },
                  obscure: signUpController
                          .idVerificationForm.visibilities[f.FzParamName] ==
                      true,
                  obscuringCharacter: f.Masking != "" ? f.Masking : null,
                  trailing: f.Masking != ""
                      ? GestureDetector(
                          onTap: () async {
                            if (signUpController.idVerificationForm
                                .visibilities[f.FzParamName]!) {
                              signUpController
                                ..idVerificationForm
                                    .visibilities[f.FzParamName] = false
                                ..update();
                              await Future.delayed(const Duration(seconds: 2));
                              signUpController
                                ..idVerificationForm
                                    .visibilities[f.FzParamName] = true
                                ..update();
                            }
                          },
                          child: Icon(
                            signUpController.idVerificationForm
                                        .visibilities[f.FzParamName] ==
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

            case FieldType.date:
              l.add(dateField(
                key: signUpController.idVerificationForm.keys[f.Id.toString()],
                context: context,
                ctrls: signUpController
                    .idVerificationForm.dateFieldControllers[f.FzParamName]!,
                nodes: signUpController
                    .idVerificationForm.dateFieldNodes[f.FzParamName]!,
                error: signUpController
                    .idVerificationForm.errorTexts[f.FzParamName]!,
                update: signUpController.update,
                title: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                erfc: (b, {DateTime? date}) {
                  //TODO: Handle age limit here
                  if (date == null) {
                    signUpController.idVerificationForm.dates
                        .remove(f.FzParamName);
                  } else {
                    signUpController.idVerificationForm.dates[f.FzParamName] =
                        DateFormatter.newFormat(date, 'dd/MMM/yyyy');
                  }

                  signUpController.idVerificationForm
                      .errorTexts[f.FzParamName] = b ? '' : 'Invalid_date'.tr;
                  signUpController.update();
                },
                onComplete: () {
                  String? id = signUpController
                      .idVerificationFormBV?.formFieldItem
                      .firstWhereOrNull((f0) =>
                          f0.index == f.index + 1 &&
                          (f0.FieldType == FieldType.text ||
                              f0.FieldType == FieldType.number))
                      ?.FzParamName;
                  Get.focusScope?.unfocus();
                  signUpController.idVerificationForm.nodes[id]?.requestFocus();
                },
                topMargin: 0,
                initialDate: {
                      'DOB': DateTime(
                          DateTime.now().year - allowedMinAge,
                          DateTime.now().month,
                          DateTime.now().day),
                      'dummy_idissueDate': DateTime.now(),
                      'IDEXPIRY': DateTime.now(),
                      'dummy_salary_date': DateTime.now()
                    }[f.FzParamName] ??
                    DateTime.now(),
                firstDate: {
                      'DOB': DateTime(
                          DateTime.now().year - 100,
                          DateTime.now().month,
                          DateTime.now().day),
                      'dummy_idissueDate': DateTime(
                          DateTime.now().year - 100,
                          DateTime.now().month,
                          DateTime.now().day),
                      'IDEXPIRY': DateTime.now(),
                      'dummy_salary_date': DateTime(DateTime.now().year - 30, DateTime.now().month, DateTime.now().day),
                    }[f.FzParamName] ??
                    DateTime.now(),
                lastDate: {
                      'DOB': DateTime(
                          DateTime.now().year - allowedMinAge,
                          DateTime.now().month,
                          DateTime.now().day),
                      'dummy_idissueDate': DateTime.now(),
                      'IDEXPIRY':
                          DateTime.now().add(const Duration(days: 365 * 30)),
                      'dummy_salary_date': DateTime(DateTime.now().year + 30, DateTime.now().month, DateTime.now().day),
                    }[f.FzParamName] ??
                    DateTime.now(),
              ));
              break;
            case FieldType.dropDownSingle:
              l.add(genericBottomSheet(
                  key: signUpController.idVerificationForm.keys[f.Id.toString()],
                  isDark: signUpController.isDark,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  hintText: f.FieldDisplayName,
                  value: signUpController.idVerificationForm
                          .selectedSources[f.FzParamName]?.Desc ??
                      '',
                  f: f,
                  credKey: f.ApiKey,
                  errorText: signUpController
                      .idVerificationForm.errorTexts[f.FzParamName]!,
                  onTap: (s) {
                    signUpController
                      ..idVerificationForm.selectedSources[f.FzParamName] = s
                      ..idVerificationForm.errorTexts[f.FzParamName] = ''
                      ..update();
                    Get.back();
                  }));
              break;
            case FieldType.radio:
              l.add(Column(
                key: signUpController.idVerificationForm.keys[f.Id.toString()],
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText1(f.FieldDisplayName, signUpController.isDark),
                  Wrap(
                    children: (f.setOptions() ??
                            signUpController
                                .idVerificationForm.sources[f.ApiKey]!)
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(
                                signUpController.idVerificationForm
                                        .selectedSources[f.FzParamName]?.id ==
                                    e.id,
                                e.Desc.tr,
                                onTap: () => signUpController
                                  ..idVerificationForm
                                      .selectedSources[f.FzParamName] = e
                                  ..idVerificationForm
                                      .errorTexts[f.FzParamName] = ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(signUpController
                          .idVerificationForm.errorTexts[f.FzParamName] ??
                      '')
                ],
              ));
              break;
          }
        }
        return l;
      }

      return PopScope(
        canPop: true,
        onPopInvokedWithResult: (t, r) {
          signUpController.getIdentityVerificationForm();
        },
        child: Scaffold(
          backgroundColor: AppConfigs.bodybg(signUpController.isDark),
          appBar: appBar0(
            cms(Fields.IdentityVerification_PageHeading).textHeading!,
            onTap2: Get.back,
          ),
          body:
              // KeyboardActions(
              //   disableScroll: true,
              //   config: signUpController.keyboardConfigNID(context),
              //   child:
              SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: AppConfigs.linearGradientUiSix
              ),
              height: Get.height - MediaQuery.of(context).padding.top - 58,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: signUpController.isDark ? 0.3 : 1,
                        child: SizedBox(),
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                              color: AppConfigs.primaryColor.withOpacity(0.2)
                          ),
                          child: companyLogo),
                      Column(
                        children: signUpController.idVerificationFormBV == null
                            ? [loader()]
                            : [
                          SizedBox(height: 10,),
                                ...children(),
                                FormLoggerView(
                                  formName:
                                      FormNames.identityVerificationFormRules,
                                  formRuleData:
                                      signUpController.idVerificationFormBV,
                                ),
                              ],
                      ),

                      ///
                      ///

                      SizedBox(height: 20),

                      signUpController.idVerificationFormBV != null
                          ? signUpController.loading
                              ? loader(top: 15, bottom: 15)
                              : roundButton(
                                  cms(Fields.IdentityVerification_VerifyButton)
                                      .textHeading!,
                                  bottom: 10, onTap: () async {
                                  {
                                    bool status = signUpController
                                        .idVerificationForm
                                        .validateNew(signUpController
                                            .idVerificationFormBV!
                                            .formFieldItem);
                                    debugPrint("identity verification");
                                    if (status) {
                                      Map<String, dynamic> authData =
                                          signUpController.idVerificationForm
                                              .buildJsonNew(signUpController
                                                  .idVerificationFormBV!
                                                  .formFieldItem);
                                      authData['CustomerCode'] = customerCode;
                                      authData['Mobile'] = mobileNo;
                                      signUpController.validateNid(
                                        stepOrderId: stepOrderId,
                                        authData: authData,
                                      );
                                    } else {
                                      signUpController.update();
                                    }
                                  }
                                }, top: 15)
                          : SizedBox(),

                      // signUpController.idVerificationFormBV != null
                      //     ? Visibility(
                      //         visible: Box3.settings.processEkycAs == 'UAEPASS',
                      //         child: const Center(
                      //           child: Text('OR'),
                      //         ),
                      //       )
                      //     : SizedBox(),
                      // signUpController.idVerificationFormBV != null
                      //     ? signUpController.uaeLButtonLoading
                      //         ? loader(top: 15, bottom: 15)
                      //         : UAEButton(
                      //             cms(Fields.Login_SignInWithUAEPASS).textHeading!,
                      //             // onTap: (){
                      //             //   Get.to(const DocShareRetry());
                      //             // },
                      //             onTap: () async => await signUpController.signWithUAEPass(type: UAESignInType.login, isFromSignup: true),
                      //             left: 20,
                      //             top: 10,
                      //             bottom: 11,
                      //             right: 20,
                      //           )
                      //     : SizedBox(),
                      // signUpController.idVerificationFormBV != null
                      //     ? Visibility(
                      //         visible: Box3.settings.processEkycAs == 'UAEPASS',
                      //         child: Center(
                      //           child: HyperLinkButton(
                      //             'New user? Register here'.tr,
                      //             onTap: () => signUpController.registerAlert(UAESignInType.unverifiedSignup),
                      //           ),
                      //         ),
                      //       )
                      //     : SizedBox()
                    ],
                  ),
                ],
              ),
            ),
          ),
          // ),
        ),
      );
    });
  }
}
