import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/models/formatter.dart';
import '../../../models/form_rules/form_rules_response_fz.dart';

class SetCredentialsFormRulesPage extends StatelessWidget {
  final bool setCredential;

  const SetCredentialsFormRulesPage({super.key, this.setCredential = false});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    Map<String, dynamic> customerData = arguments['customerData'] ?? {};
    String stepOrderId = arguments['stepOrderId'] ?? '';
    // String mobile = arguments['mobile'] ?? '';
    // String idNumber = arguments['idNumber'] ?? '';
    bool setCredential = arguments['setCredential'] ?? false;
    // bool excludeAppBar = arguments['excludeAppBar'] ?? false;

    Get.find<SignUpController>().getCredForm();
    final companyLogo = Base64Image(
      image: Box3.companyLogo,
      fit: BoxFit.contain,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );

    return GetBuilder<SignUpController>(builder: (signUpController) {
      List<Widget> children() {
        List<Widget> l = [];
        List<FormFieldItem> fields =
            signUpController.credFormBV!.formFieldItem.toList();
        fields.sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          switch (f.FieldType) {
            case FieldType.username:
              l.add(
                textFormField(
                    controller: signUpController
                        .credForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : '*'),
                    inputFormatters: f.Regex.isNotEmpty
                        ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                        : null,
                    errorText:
                        signUpController.credForm.errorTexts[f.FzParamName]!,
                    enabled: f.enabled,
                    onChanged: (v) async {
                      if (signUpController
                          .credForm.errorTexts[f.FzParamName]!.isNotEmpty) {
                        signUpController.credForm.errorTexts[f.FzParamName] =
                            '';
                        signUpController.update();
                      }
                      if (f.maxLength != null) {
                        signUpController.update();
                      }
                      if (v.length > 3) {
                        await signUpController.checkUserNameAvailability(v);
                        if (signUpController
                            .signUpAttributes.usernameAvailable) {
                          signUpController.credForm.errorTexts[f.FzParamName] =
                              '';
                          signUpController.update();
                        } else {
                          signUpController.credForm.errorTexts[f.FzParamName] =
                              signUpController.signUpAttributes.usernameError;
                          signUpController.update();
                        }
                      }
                    },
                    focusNode: signUpController.credForm.nodes[f.FzParamName],
                    onEditingComplete: () {
                      String? id = signUpController.credFormBV?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      signUpController.credForm.nodes[id]?.requestFocus();
                    },
                    trailing: signUpController.signUpAttributes.usernameLoading
                        ? SizedBox(
                            width: 25,
                            height: 25,
                            child:
                                Center(child: tinyLoader(size: 20, width: 2)))
                        : null,
                    prefixText: f.Prefix),
              );
              break;
            case FieldType.number:
              l.add(Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      f.FieldDisplayName + (f.optional ? '' : '*'),
                      style: TS.f16.copyWith(
                          color: signUpController.isDark
                              ? (signUpController.credForm
                                      .errorTexts[f.FzParamName]!.isEmpty
                                  ? AppConfigs.g8f
                                  : AppConfigs.errorBorderDark)
                              : (signUpController.credForm
                                      .errorTexts[f.FzParamName]!.isNotEmpty
                                  ? AppConfigs.der
                                  : AppConfigs.g77)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    MpinPut(
                      controller: signUpController
                          .credForm.textFieldControllers[f.FzParamName],
                      focusNode: signUpController.credForm.nodes[f.FzParamName],
                      errorText:
                          signUpController.credForm.errorTexts[f.FzParamName]!,
                      onChanged: (s) {
                        // authController
                        //   ..authAttributes.mPinTrailer = const SizedBox()
                        //   ..authAttributes.mpinErrorText = ''
                        //   ..update();
                        if (signUpController
                            .credForm.errorTexts[f.FzParamName]!.isNotEmpty) {
                          signUpController.credForm.errorTexts[f.FzParamName] =
                              '';
                        }
                        signUpController.update();
                      },
                      obscureText: (signUpController
                              .credForm.visibilities[f.FzParamName] ==
                          true),
                      obscuringCharacter: f.Masking != "" ? f.Masking : null,
                      borderRadius: 50,
                      onCompleted: (p0) async {
                        // signUpController
                        //   ..loginLoader = true
                        //   ..update();
                        // await ApiService().activateToken(
                        //     uniqueToken: accountController.token ?? '',customerCode: customerCode);
                        // await accountController.login(
                        //   'MPIN',
                        //   authenticationMethod1: 'MPIN',
                        //   customerCode: (customerCode.isNotEmpty == true)
                        //       ? customerCode
                        //       : Box3.customerDetailsFZ!.data?.customerCode ??
                        //       '',
                        //   stepOrderId: stepOrderId,
                        // );
                      },
                    ),
                  ],
                ),
              ));
              break;
            case FieldType.text:
              List<TextInputFormatter>? inputFormatters = [];

              if (f.Regex.isNotEmpty) {
                inputFormatters
                    .add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              }
              bool fieldVisibility = true;
              if (f.FzParamName == "Password" ||
                  f.FzParamName == 'CONFIRMPASSWORD') {
                fieldVisibility =
                    Box3.settings.LOGINAUTHENTICATIONSECONDARY == "PASSWORD" ||
                        Box3.settings.LOGINAUTHENTICATIONSECONDARY ==
                            "PASSWORD_MPIN";
              }
              l.add(
                Visibility(
                  visible: fieldVisibility,
                  child: textFormField(
                      controller: signUpController
                          .credForm.textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : '*'),
                      inputFormatters: inputFormatters,
                      maxLength: f.maxLength,
                      enabled: f.enabled,
                      focusNode: signUpController.credForm.nodes[f.FzParamName],
                      errorText:
                          signUpController.credForm.errorTexts[f.FzParamName] ??
                              '',
                      onChanged: (v) {
                        if (signUpController
                            .credForm.errorTexts[f.FzParamName]!.isNotEmpty) {
                          signUpController.credForm.errorTexts[f.FzParamName] =
                              '';
                          signUpController.update();
                        }
                        if (f.maxLength != null) {
                          signUpController.update();
                        }
                        if (f.FieldId == 'newPassword' ||
                            f.FieldId == 'confirmPassword') {
                          signUpController
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
                        String? id = signUpController.credFormBV?.formFieldItem
                            .toList()
                            .firstWhereOrNull((f0) =>
                                f0.index == f.index + 1 &&
                                (f0.FieldType == FieldType.text ||
                                    f0.FieldType == FieldType.number))
                            ?.FzParamName;
                        Get.focusScope?.unfocus();
                        signUpController.credForm.nodes[id]?.requestFocus();
                      },
                      obscure: signUpController
                              .credForm.visibilities[f.FzParamName] ==
                          true,
                      obscuringCharacter: f.Masking != "" ? f.Masking : null,
                      trailing: f.Masking != ""
                          ? GestureDetector(
                              onTap: () async {
                                if (signUpController
                                    .credForm.visibilities[f.FzParamName]!) {
                                  signUpController
                                    ..credForm.visibilities[f.FzParamName] =
                                        false
                                    ..update();
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  signUpController
                                    ..credForm.visibilities[f.FzParamName] =
                                        true
                                    ..update();
                                }
                              },
                              child: Icon(
                                signUpController.credForm
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
                ),
              );
              if (f.FieldId == 'newPassword' &&
                  (Box3.settings.LOGINAUTHENTICATIONSECONDARY == "PASSWORD" ||
                      Box3.settings.LOGINAUTHENTICATIONSECONDARY ==
                          "PASSWORD_MPIN")) {
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
                          end: signUpController.signUpAttributes.pwdStrength,
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
                          signUpController.signUpAttributes.pwdStrength < 0.34
                              ? 'weak'.tr
                              : signUpController.signUpAttributes.pwdStrength <
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
                              signUpController.credForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[A-Z]'))),
                          textConstratint(
                              'contains_at_least_one_lowercase'.tr,
                              signUpController.credForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[a-z]'))),
                          textConstratint(
                              'contains_at_least_one_number'.tr,
                              signUpController.credForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[0-9]'))),
                          textConstratint(
                              'contains_at_least_one_special_char'.tr,
                              signUpController.credForm
                                  .textFieldControllers[f.FzParamName]!.text
                                  .contains(RegExp(r'[!@#\$&*~]'))),
                          textConstratint(
                              'Password length 8-$pwdMaxLength characters',
                              signUpController
                                      .credForm
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
                  // DateFormatter.newFormat(signUpController.form.dates[f.FzParamName], 'dd/mm/yyyy'),
                  signUpController.nIDForm.dates[f.FzParamName],
                  signUpController.isDark,
                  error: signUpController.form.errorTexts[f.FzParamName]!,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : '*'}',
                  onTap: () async {
                DateTime? d = await showDatePicker(
                  context: context,
                  // initialDate: f.initialDurationFromNow.inSeconds != 0 ? DateTime.now().add(f.initialDurationFromNow) : null,
                  // firstDate: f.startDurationFromNow.inSeconds != 0 ? DateTime.now().add(f.startDurationFromNow) : f.startDate ?? DateTime(1900),
                  // lastDate: f.endDurationFromNow.inSeconds != 0 ? DateTime.now().add(f.endDurationFromNow) : f.endDate ?? DateTime(2100)
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now(),
                );
                if (d != null) {
                  signUpController
                    ..form.dates[f.FzParamName] =
                        DateFormatter.newFormat(d, 'dd/MMM/yyyy')
                    ..form.errorTexts[f.FzParamName] = ''
                    ..update();
                }
              }));
              break;
            case FieldType.dropDownSingle:
              l.add(genericBottomSheet(
                  isDark: signUpController.isDark,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : '*'}',
                  value: signUpController
                          .form.selectedSources[f.FzParamName]?.Desc ??
                      '',
                  credKey: f.ApiKey,
                  errorText: signUpController.form.errorTexts[f.FzParamName]!,
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
              l.add(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText1(f.FieldDisplayName, signUpController.isDark),
                  Wrap(
                    children: (f.setOptions() ??
                            signUpController.form.sources[f.ApiKey]!)
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(
                                signUpController.form
                                        .selectedSources[f.FzParamName]?.id ==
                                    e.id,
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
                      signUpController.form.errorTexts[f.FzParamName] ?? '')
                ],
              ));
              break;
          }
        }
        return l;
      }

      return Scaffold(
        appBar: appBar0(cms(Fields.SetCredential_PageHeading).textHeading!,
            onTap2: Get.back),
        backgroundColor: AppConfigs.bodybg(signUpController.isDark),
        body:
            // KeyboardActions(
            // disableScroll: true,
            // config: signUpController.keyboardConfigSetCred(context),
            //   child:
            SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 250, child: companyLogo),
                      Icon(
                        Icons.lock,
                        size: 30,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create Your MPIN",
                        style: TS.f20.copyWith(color: AppConfigs.primaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: signUpController.credFormBV == null
                      ? [loader()]
                      : [
                          ...children(),
                          FormLoggerView(
                            formName: FormNames.signupCredentialFormRules,
                            formRuleData: signUpController.credFormBV,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                        ],
                ),
                signUpController.credFormBV == null
                    ? SizedBox()
                    : signUpController.loading
                        ? loader()
                        : roundButton(
                            cms(Fields.SetCredential_SubmitButton).textHeading!,
                            top: 20,
                            onTap: () async {
                              if (Box3.settings.processEkycAs == 'UAEPASS') {
                                // if (signUpController.signUpAttributes.username
                                //             .text.length >=
                                //         6 &&
                                //     signUpController
                                //         .signUpAttributes.usernameAvailable) {
                                if (!signUpController.credForm.validateNew(
                                    signUpController.credFormBV!.formFieldItem,
                                    validate:
                                        signUpController.visibilityChecker)) {
                                  signUpController.update();
                                } else {
                                  Map? result;
                                  signUpController
                                    ..loading = true
                                    ..update();
                                  if (setCredential) {
                                    Get.find<SignUpController>()
                                      ..ivAttributes.updateEmail = ''
                                      ..update();

                                    // var validateSetCredData = {
                                    //   // "IDNUMBER": signUpController.signUpAttributes.nidConroller.text,
                                    //   // "MOBILE": signUpController.signUpAttributes.mobile.text,
                                    //   "PASSWORD": signUpController
                                    //       .signUpAttributes.cnfPwd.text,
                                    //   "MPIN": signUpController
                                    //       .signUpAttributes.cnfMpin.text,
                                    //   "USERNAME": signUpController
                                    //       .signUpAttributes.username.text,
                                    //   "UUID": Get.find<SignUpController>()
                                    //           .uaePassProfileFz
                                    //           ?.uuid ??
                                    //       '',
                                    //   "EMAIL": Get.find<SignUpController>()
                                    //           .ivAttributes
                                    //           .updateEmail ??
                                    //       '',
                                    // };
                                    //
                                    // await signUpController.validateNid(
                                    //     authData: validateSetCredData,
                                    //     stepOrderId: stepOrderId);

                                    result = await signUpController.validateNid(
                                        customerData: {
                                          "IdNo": Box3
                                              .customerDetailsFZ?.data?.idNo,
                                          "Mobile": Box3.customerDetailsFZ?.data
                                              ?.mobileNo,
                                          "CustomerCode": Box3.customerDetailsFZ
                                              ?.data?.customerCode,
                                        },
                                        authData: signUpController.credForm
                                            .buildJsonNew(signUpController
                                                .credFormBV!.formFieldItem)
                                          ..addAll({
                                            "UUID": Get.find<SignUpController>()
                                                    .uaePassProfileFz
                                                    ?.uuid ??
                                                '',
                                            "EMAIL":
                                                Get.find<SignUpController>()
                                                        .ivAttributes
                                                        .updateEmail ??
                                                    '',
                                          }),
                                        stepOrderId: stepOrderId);
                                  } else {}
                                  signUpController
                                    ..loading = false
                                    ..update();
                                }
                                // } else {
                                //   signUpController
                                //     ..signUpAttributes.usernameError =
                                //         'Enter valid Username'
                                //     ..update();
                                // }
                              } else {
                                if (!signUpController.credForm.validateNew(
                                    signUpController.credFormBV!.formFieldItem,
                                    validate:
                                        signUpController.visibilityChecker)) {
                                  signUpController.update();
                                } else {
                                  if (setCredential) {
                                    Map? result;
                                    signUpController
                                      ..loading = true
                                      ..update();

                                    result = await signUpController.validateNid(
                                        customerData: {
                                          "IdNo": Box3
                                              .customerDetailsFZ?.data?.idNo,
                                          "Mobile": Box3.customerDetailsFZ?.data
                                              ?.mobileNo,
                                          "CustomerCode": Box3.customerDetailsFZ
                                              ?.data?.customerCode,
                                        },
                                        authData: signUpController.credForm
                                            .buildJsonNew(signUpController
                                                .credFormBV!.formFieldItem),
                                        stepOrderId: stepOrderId);
                                    // if (result!['statusCode'] == '200') {
                                    //   Get.offAllNamed((Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login);
                                    //   Get.dialog(kycPendingAlert(signUpController.isDark, result['message'],
                                    //       imagePath: ImagePath.transactionDone, title: 'Account_Registration_Success'.tr));
                                    // } else {
                                    //   kycPendingAlert(signUpController.isDark, result['message'], image: SvgIcons.deviceVerify, title: 'Error');
                                    // }
                                    signUpController
                                      ..loading = false
                                      ..update();
                                  } else {
                                    Map? result;
                                    signUpController
                                      ..loading = true
                                      ..update();

                                    result = await signUpController.addCustomer(
                                        // customerData: signUpController.form.buildJsonNew(signUpController.formBV!.formFieldItem),
                                        customerData: customerData,
                                        authData: signUpController.credForm
                                            .buildJsonNew(signUpController
                                                .credFormBV!.formFieldItem),
                                        stepOrderId: stepOrderId);

                                    // if (result!['statusCode'] == '200') {
                                    //   Get.offAllNamed((Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login);
                                    //   Get.dialog(kycPendingAlert(signUpController.isDark, result['message'],
                                    //       imagePath: ImagePath.transactionDone, title: 'Account_Registration_Success'.tr));
                                    // } else {
                                    //   kycPendingAlert(signUpController.isDark, result['message'], image: SvgIcons.deviceVerify, title: 'Error');
                                    // }
                                    signUpController
                                      ..loading = false
                                      ..update();
                                  }
                                }
                              }
                            },
                          )
              ],
            ),
          ),
        ),
        // ),
      );
    });
  }
}
