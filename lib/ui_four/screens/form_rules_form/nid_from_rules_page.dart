import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/form_rules/form_rules_response_fz.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_four_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/models/formatter.dart';

class NIDFormRulesPage extends StatefulWidget {
  const NIDFormRulesPage({super.key});

  @override
  State<NIDFormRulesPage> createState() => _NIDFormRulesPageState();
}

class _NIDFormRulesPageState extends State<NIDFormRulesPage> {
  late SignUpController controller;
  final captchaCtrl = Get.put(CaptchaController());

  final companyLogo = Base64Image(
    image: Box3.companyLogo,
    fit: BoxFit.contain,
    padding: const EdgeInsets.all(8),
    height: 150,
    width: 200,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );
  final footerImg = cms(Fields.ValidateCustomer_FooterImage).image != ""
      ? Base64Image(
          image: cms(Fields.ValidateCustomer_FooterImage).image ?? "",
          // height: 200,
          // width: 200,
        )
      : SizedBox();

  @override
  void initState() {
    super.initState();
    controller = Get.find<SignUpController>();
    if (controller.nIDFormBV == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.getNIDForm().then((_) {
          if (controller.nIDFormBV != null) {
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
    for (var field in controller.nIDFormBV!.formFieldItem) {
      controller.nIDForm.textFieldControllers[field.FzParamName] =
          TextEditingController(text: '');
      controller.nIDForm.nodes[field.FzParamName] = FocusNode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      List<Widget> children() {
        List<Widget> l = [];
        List<FormFieldItem> fields = signUpController.nIDFormBV!.formFieldItem
            .toList()
          ..sort((a, b) => a.index.compareTo(b.index));
        for (FormFieldItem f in fields) {
          switch (f.FieldType) {
            case FieldType.number:
              List<TextInputFormatter>? inputFormatters = [];
              if (f.Regex.isNotEmpty) {
                inputFormatters.add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              }
              String? trailingIcon;
              if (f.FzParamName == "IdNo") {
                trailingIcon = Get.find<AccountController>().isDark
                    ? ImagePath.darkIdentification
                    : ImagePath.identification;
              }
              l.add(
                Visibility(
                  visible:
                      f.IsVisible.toString().toLowerCase().contains("true"),
                  child: textFormField(
                    key: signUpController.nIDForm.keys[f.Id.toString()],
                    controller: signUpController
                        .nIDForm.textFieldControllers[f.FzParamName],
                    labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                    inputFormatters: inputFormatters,
                    focusNode: signUpController.nIDForm.nodes[f.FzParamName],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    errorText:
                        signUpController.nIDForm.errorTexts[f.FzParamName]!,
                    maxLength: f.maxLength,
                    enabled: f.enabled,
                    onChanged: (v) {
                      if (signUpController
                          .nIDForm.errorTexts[f.FzParamName]!.isNotEmpty) {
                        signUpController.nIDForm.errorTexts[f.FzParamName] = '';
                        signUpController.update();
                      }
                      if (f.maxLength != null) {
                        signUpController.update();
                      }
                    },
                    onEditingComplete: () {
                      String? id = signUpController.nIDFormBV?.formFieldItem
                          .toList()
                          .firstWhereOrNull((f0) =>
                              f0.index == f.index + 1 &&
                              (f0.FieldType == FieldType.text ||
                                  f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      if (id != null) {
                        signUpController.nIDForm.nodes[id]?.requestFocus();
                      } else {
                        Get.focusScope?.unfocus();
                      }
                    },
                    obscure:
                        signUpController.nIDForm.visibilities[f.FzParamName] ==
                            true,
                    obscuringCharacter: f.Masking != "" ? f.Masking : null,
                    trailing: f.Masking != ""
                        ? GestureDetector(
                            onTap: () async {
                              if (signUpController
                                  .nIDForm.visibilities[f.FzParamName]!) {
                                signUpController
                                  ..nIDForm.visibilities[f.FzParamName] = false
                                  ..update();
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                signUpController
                                  ..nIDForm.visibilities[f.FzParamName] = true
                                  ..update();
                              }
                            },
                            child: Icon(
                              signUpController.nIDForm
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
                    prefixText: f.Prefix,
                  ),
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
                  key: signUpController.nIDForm.keys[f.Id.toString()],
                  controller: signUpController
                      .nIDForm.textFieldControllers[f.FzParamName],
                  labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                  inputFormatters: f.Regex.isNotEmpty
                      ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                      : null,
                  maxLength: f.maxLength,
                  enabled: f.enabled,
                  focusNode: signUpController.nIDForm.nodes[f.FzParamName],
                  errorText:
                      signUpController.nIDForm.errorTexts[f.FzParamName]!,
                  onChanged: (v) {
                    if (signUpController
                        .nIDForm.errorTexts[f.FzParamName]!.isNotEmpty) {
                      signUpController.nIDForm.errorTexts[f.FzParamName] = '';
                      signUpController.update();
                    }
                    if (f.maxLength != null) {
                      signUpController.update();
                    }
                  },
                  onEditingComplete: () {
                    String? id = signUpController.nIDFormBV?.formFieldItem
                        .firstWhere((f0) =>
                            f0.index == f.index + 1 &&
                            (f0.FieldType == FieldType.text ||
                                f0.FieldType == FieldType.number))
                        .FzParamName;
                    Get.focusScope?.unfocus();
                    signUpController.nIDForm.nodes[id]?.requestFocus();
                  },
                  obscure:
                      signUpController.nIDForm.visibilities[f.FzParamName] ==
                          true,
                  obscuringCharacter: f.Masking != "" ? f.Masking : null,
                  trailing: f.Masking != ""
                      ? GestureDetector(
                          onTap: () async {
                            if (signUpController
                                .nIDForm.visibilities[f.FzParamName]!) {
                              signUpController
                                ..nIDForm.visibilities[f.FzParamName] = false
                                ..update();
                              await Future.delayed(const Duration(seconds: 2));
                              signUpController
                                ..nIDForm.visibilities[f.FzParamName] = true
                                ..update();
                            }
                          },
                          child: Icon(
                            signUpController
                                        .nIDForm.visibilities[f.FzParamName] ==
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
              l.add(dummyTextField(
                  key: signUpController.nIDForm.keys[f.Id.toString()],
                  signUpController.nIDForm.dates[f.FzParamName],
                  signUpController.isDark,
                  error: signUpController.nIDForm.errorTexts[f.FzParamName]!,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : '*'}',
                  onTap: () async {
                DateTime? d = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now());
                if (d != null) {
                  signUpController
                    ..nIDForm.dates[f.FzParamName] =
                        DateFormatter.newFormat(d, 'dd/MMM/yyyy')
                    ..nIDForm.errorTexts[f.FzParamName] = ''
                    ..update();
                }
              }));
              break;
            case FieldType.dropDownSingle:
              l.add(genericBottomSheet(
                  key: signUpController.nIDForm.keys[f.Id.toString()],
                  isDark: signUpController.isDark,
                  labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                  value: signUpController
                          .nIDForm.selectedSources[f.FzParamName]?.Desc ??
                      '',
                  credKey: f.ApiKey,
                  f: f,
                  errorText:
                      signUpController.nIDForm.errorTexts[f.FzParamName]!,
                  onTap: (s) {
                    signUpController
                      ..nIDForm.selectedSources[f.FzParamName] = s
                      ..nIDForm.errorTexts[f.FzParamName] = ''
                      ..update();
                    Get.back();
                  }));
              break;
            case FieldType.radio:
              l.add(Column(
                key: signUpController.nIDForm.keys[f.Id.toString()],
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText1(f.FieldDisplayName, signUpController.isDark),
                  Wrap(
                    children: (f.setOptions() ??
                            signUpController.nIDForm.sources[f.ApiKey]!)
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(
                                signUpController.nIDForm
                                        .selectedSources[f.FzParamName]?.id ==
                                    e.id,
                                e.Desc.tr,
                                onTap: () => signUpController
                                  ..nIDForm.selectedSources[f.FzParamName] = e
                                  ..nIDForm.errorTexts[f.FzParamName] = ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(
                      signUpController.nIDForm.errorTexts[f.FzParamName] ?? '')
                ],
              ));
              break;
          }
        }
        return l;
      }

      return Scaffold(
        backgroundColor: AppConfigs.bodybg(signUpController.isDark),
        resizeToAvoidBottomInset: false,
        appBar: appBar0('', onTap2: Get.back),
        body: SizedBox(
          height: Get.height - MediaQuery.of(context).padding.top - 58,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                    opacity: signUpController.isDark ? 0.3 : 1,
                    child: footerImg,
                  ),
                ),
              ),
              ListView(
                // physics: const ClampingScrollPhysics(),
                children: [
                  companyLogo,
                  Column(
                    children: signUpController.nIDFormBV == null
                        ? [loader()]
                        : [
                            ...children(),
                            //TODO:: when captcha control by admin setting then pass value in [CaptchaCode(show:true/false)]
                            CaptchaCode(
                              show: false,
                            ),
                            FormLoggerView(
                                formName: FormNames.preLoginFormRules,
                                formRuleData: signUpController.nIDFormBV),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                  ),
                  signUpController.nIDFormBV != null
                      ? signUpController.loading
                          ? loader(top: 15, bottom: 15)
                          : roundButton(cms(Fields.Login_OkButton).textHeading!,
                              bottom: 10, onTap: () async {
                              FocusScope.of(context).unfocus();
                              bool status = signUpController.nIDForm
                                  .validateNew(signUpController
                                      .nIDFormBV!.formFieldItem);

                              captchaCtrl.validateCaptcha();
                              bool captchaStatus =
                                  captchaCtrl.captchaErrorText.isEmpty;
                              if (status && captchaStatus) {
                                signUpController
                                  ..loading = false
                                  ..update();
                                signUpController.validateNid(
                                  stepOrderId: '0',
                                  authData: signUpController.nIDForm
                                      .buildJsonNew(signUpController
                                          .nIDFormBV!.formFieldItem),
                                );
                              } else {
                                signUpController.update();
                              }
                            }, top: 15)
                      : SizedBox(),
                  signUpController.nIDFormBV != null
                      ? Visibility(
                          visible: (Box3.settings.processEkycAs)
                              .split(',')
                              .contains('UAEPASS'),
                          child: const Center(
                            child: Text('OR'),
                          ),
                        )
                      : SizedBox(),
                  signUpController.nIDFormBV != null
                      ? signUpController.uaeLButtonLoading
                          ? loader(top: 15, bottom: 15)
                          : UAEButton(
                              cms(Fields.Login_SignInWithUAEPASS).textHeading!,
                              onTap: () async =>
                                  await signUpController.signWithUAEPass(
                                      type: UAESignInType.login,
                                      isFromSignup: true),
                              left: 20,
                              top: 10,
                              bottom: 11,
                              right: 20,
                            )
                      : SizedBox(),
                  signUpController.nIDFormBV != null
                      ? Visibility(
                          visible: (Box3.settings.processEkycAs)
                              .split(',')
                              .contains('UAEPASS'),
                          child: Center(
                            child: HyperLinkButton(
                              'New user? Register here'.tr,
                              onTap: () => signUpController.registerAlert(
                                  UAESignInType.unverifiedSignup),
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
