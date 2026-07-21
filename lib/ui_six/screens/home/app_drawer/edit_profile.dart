import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/ui_six/shimmers/form_shimmers.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../models/customer_details/customer_data_fz.dart';
import '../../../../models/form_rules/form_rules_response_fz.dart';
import '../../../../network/api_service_new.dart';
import '../../sign_up/nid_alerts.dart';
import '../../sign_up/upload_doc_tile.dart';
import '../../sign_up/video_kyc_screen.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  KycController kycController = Get.find<KycController>();

  bool isLoading = false;
  String existingFrontImage = '';
  String existingBackImage = '';
  String existingSelfieImage = '';
  Uint8List? frontBytes, backBytes, selfieBytes;


  @override
  void initState() {
    super.initState();
    final accountController = Get.find<AccountController>();
    existingFrontImage = accountController.frontImage ?? '';
    existingBackImage = accountController.backImage ?? '';
    existingSelfieImage = accountController.selfieImage.value ?? '';

    if (existingFrontImage.isNotEmpty) {
      frontBytes = base64Decode(existingFrontImage);
    }
    if (existingBackImage.isNotEmpty) {
      backBytes = base64Decode(existingBackImage);
    }
    if (existingSelfieImage.isNotEmpty) {
      selfieBytes = base64Decode(existingSelfieImage);
    }
    getFormData();
  }

  Future<void> getFormData() async {
    kycController.getUpdateProfileForm(
        data: Box3.customerDetailsFZ?.data?.toJson());
  }

  Future<void> initVideoPlayer() async {
    if (Get.find<KycController>().cameraVideo != null) {
      Get.find<KycController>().videoPlayerController = VideoPlayerController.file(File(Get.find<KycController>().cameraVideo!.path));
      await Get.find<KycController>().videoPlayerController!.initialize();
      Get.find<KycController>().update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<KycController>(builder: (kycController) {
      List<Widget> children() {
        int allowedMinAge = int.parse(Box3.settings.allowedMinAge);
        List<Widget> l = [];
        List<FormFieldItem> files = [];
        if (kycController.updateProfileFormFZ == null) return [];
        List<FormFieldItem> fields = kycController.updateProfileFormFZ!.formFieldItem.toList();
        fields.sort((a, b) => a.index.compareTo(b.index));

        for (FormFieldItem f in fields) {
          // bool enable = f.enabled;
          bool isVisible = f.IsVisible.toLowerCase() == 'true';
          // bool isMandatory = f.IsMandatory.toLowerCase() == 'true';
          switch (f.FieldType) {
            case FieldType.number:
              // List<TextInputFormatter>? inputFormatters = [];
              // if (f.maxLength != null) {
              //   inputFormatters.add(intLimit(f.maxLength!));
              // }
              // List<TextInputFormatter>? inputFormatters = [];
              // if (f.Regex != null) {
              //   inputFormatters.add(regexFormatter(f.Regex!));
              // }
              l.add(
                Visibility(
                  visible: isVisible,
                  child: textFormField(
                      controller: kycController.form.textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      inputFormatters: f.Regex.isNotEmpty
                          ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))]
                          : null,
                      focusNode: kycController.form.nodes[f.FzParamName],
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      errorText: kycController.form.errorTexts[f.FzParamName]!,
                      maxLength: f.maxLength,
                      enabled: f.enabled,
                      onChanged: (v) {
                        if (kycController.form.errorTexts[f.FzParamName]!.isNotEmpty) {
                          kycController.form.errorTexts[f.FzParamName] = '';
                          kycController.update();
                        }
                        if (f.maxLength != null) {
                          kycController.update();
                        }
                      },
                      onEditingComplete: () {
                        String? id = kycController.updateProfileFormFZ?.formFieldItem
                            .toList()
                            .firstWhereOrNull((f0) => f0.index == f.index + 1 && (f0.FieldType == FieldType.text || f0.FieldType == FieldType.number))
                            ?.FzParamName;
                        Get.focusScope?.unfocus();
                        kycController.form.nodes[id]?.requestFocus();
                      },
                      prefixText: '${f.Prefix} '),
                ),
              );
              break;
            case FieldType.text:
              // List<TextInputFormatter>? inputFormatters = [];
              // if (f.Regex != "") {
              //   inputFormatters
              //       .add(FilteringTextInputFormatter.allow(RegExp(f.Regex)));
              // }
              // if (f.maxLength != null) {
              //   inputFormatters.add(intLimit(f.maxLength!));
              // }

              l.add(
                Visibility(
                  visible: isVisible,
                  child: textFormField(
                      controller: kycController.form.textFieldControllers[f.FzParamName],
                      labelText: f.FieldDisplayName + (f.optional ? '' : ' *'),
                      inputFormatters: f.Regex.isNotEmpty ? [FilteringTextInputFormatter.allow(RegExp(f.Regex))] : null,
                      maxLength: f.maxLength,
                      enabled: f.enabled,
                      focusNode: kycController.form.nodes[f.FzParamName],
                      errorText: kycController.form.errorTexts[f.FzParamName]!,
                      onChanged: (v) {
                        if (kycController.form.errorTexts[f.FzParamName]!.isNotEmpty) {
                          kycController.form.errorTexts[f.FzParamName] = '';
                          kycController.update();
                        }
                        if (f.maxLength != null) {
                          kycController.update();
                        }
                      },
                      onEditingComplete: () {
                        String? id = kycController.updateProfileFormFZ?.formFieldItem
                            .firstWhere((f0) => f0.index == f.index + 1 && (f0.FieldType == FieldType.text || f0.FieldType == FieldType.number))
                            .FzParamName;
                        Get.focusScope?.unfocus();
                        kycController.form.nodes[id]?.requestFocus();
                      },
                      prefixText: f.Prefix),
                ),
              );
              break;
            case FieldType.date:
              l.add(Visibility(
                visible: isVisible,
                child: dateField(
                    key: kycController.form.keys[f.FzParamName],
                    ctrls: kycController.form.dateFieldControllers[f.FzParamName]!,
                    nodes: kycController.form.dateFieldNodes[f.FzParamName]!,
                    error: kycController.form.errorTexts[f.FzParamName]!,
                    update: kycController.update,
                    topMargin: 0,
                    initialDate: {
                          'DateOfBirth': DateTime.now().subtract(Duration(days: 365 * allowedMinAge)),
                          'IdIssueDate': DateTime.now(),
                          'IdExpiryDate': DateTime.now(),
                          'dummy_salary_date': DateTime.now()
                        }[f.FzParamName] ??
                        DateTime.now(),
                    firstDate: {
                          'DateOfBirth': DateTime.now().subtract(const Duration(days: 365 * 100)),
                          'IdIssueDate': DateTime.now().subtract(const Duration(days: 365 * 100)),
                          'IdExpiryDate': DateTime.now(),
                          'dummy_salary_date': DateTime.now().subtract(const Duration(days: 365 * 30)),
                        }[f.FzParamName] ??
                        DateTime.now(),
                    lastDate: {
                          'DateOfBirth': DateTime.now().subtract(Duration(days: 365 * allowedMinAge)),
                          'IdIssueDate': DateTime.now(),
                          'IdExpiryDate': DateTime.now().add(const Duration(days: 365 * 30)),
                          'dummy_salary_date': DateTime.now().add(const Duration(days: 365 * 30)),
                        }[f.FzParamName] ??
                        DateTime.now(),
                    erfc: (b, {DateTime? date}) {
                      //TODO: Handle age limit here
                      if (date == null) {
                        kycController.form.dates.remove(f.FzParamName);
                      } else {
                        kycController.form.dates[f.FzParamName] = DateFormatter.newFormat(date, 'dd/MMM/yyyy');
                      }

                      kycController.form.errorTexts[f.FzParamName] = b ? '' : 'Invalid_date'.tr;
                      kycController.update();
                    },
                    onComplete: () {
                      String? id = kycController.updateProfileFormFZ?.formFieldItem
                          .firstWhereOrNull((f0) => f0.index == f.index + 1 && (f0.FieldType == FieldType.text || f0.FieldType == FieldType.number))
                          ?.FzParamName;
                      Get.focusScope?.unfocus();
                      kycController.form.nodes[id]?.requestFocus();
                    },
                    context: context,
                    title: '${f.FieldDisplayName}${f.optional ? '' : ' *'}'),
              ));
              break;

            case FieldType.dropDownSingle:
              l.add(
                Visibility(
                  visible: isVisible,
                  child: genericBottomSheet(
                      isDark: kycController.isDark,
                      labelText: '${f.FieldDisplayName}${f.optional ? '' : ' *'}',
                      value: kycController.form.selectedSources[f.FzParamName]?.Desc ?? '',
                      errorText: kycController.form.errorTexts[f.FzParamName] ?? "",
                      custKey: f.ApiKey,
                      f: f,
                      onTap: (s) {
                        kycController
                          ..form.selectedSources[f.FzParamName] = s
                          ..form.errorTexts[f.FzParamName] = ''
                          ..update();

                        Get.back();
                      }),
                ),
              );
              break;
            case FieldType.radio:
              l.add(Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText1(f.FieldDisplayName, kycController.isDark),
                  Wrap(
                    children: (f.setOptions() ?? kycController.form.sources[f.ApiKey] ?? [])
                        .toList()
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(left: 20, top: 5),
                            child: radioTile(kycController.form.selectedSources[f.FzParamName]?.id == e.id, e.Desc.tr,
                                onTap: () => kycController
                                  ..form.selectedSources[f.FzParamName] = e
                                  ..form.errorTexts[f.FzParamName] = ''
                                  ..update()),
                          ),
                        )
                        .toList(),
                  ),
                  errorText(kycController.form.errorTexts[f.FzParamName] ?? '')
                ],
              ));
              break;
            case FieldType.file:
              files.add(f);
              break;
            default:
              break;
          }
        }
        return l;
      }

      return Scaffold(
        appBar: appBar0(cms(Fields.UpdateProfile_PageHeading).textHeading!, onTap2: () => Get.back()),
        backgroundColor: kycController.isDark ? AppConfigs.g14 : Colors.white,
        body: Container(
          decoration: BoxDecoration(
              gradient: kycController.isDark?null:AppConfigs.linearGradientUiSix
          ),
          child: SafeArea(
            child: kycController.updateProfileFormFZ == null
                ? FormShimmer()
                : ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(Box3.settings.primaryDocIDName.isEmpty == true ? 'National_ID'.tr : "${Box3.settings.primaryDocIDName} ",
                            style: TS.f14.copyWith(color: kycController.isDark ? AppConfigs.g8f : AppConfigs.primaryColor.withOpacity(0.8),fontWeight: FontWeight.w900), textAlign: TextAlign.start,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'front_side'.tr,
                                    style: TS.f12.copyWith(color: AppConfigs.primaryColor.withOpacity(0.8),fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  docTile(
                                    kycController.isDark,
                                    path: kycController
                                        .frontDocPath[AppConfigs.docType],
                                    base64Image: existingFrontImage,
                                    bytes: frontBytes,
                                    delete: () {
                                      setState(() {
                                        existingFrontImage = '';
                                        frontBytes = null;
                                      });
                                      kycController
                                        ..frontDocPath.removeWhere((key, value) =>
                                        key == AppConfigs.docType)
                                        ..cacheFrontDocPath.removeWhere(
                                                (key, value) =>
                                            key == AppConfigs.docType)
                                        ..update();
                                    },
                                    side: 'front_side'.tr,
                                    noExpand: true,
                                    isFront: true,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'back_side'.tr,
                                    style: TS.f12.copyWith(color: AppConfigs.primaryColor.withOpacity(0.8),fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  docTile(
                                    kycController.isDark,
                                    path: kycController
                                        .backDocPath[AppConfigs.docType],
                                    base64Image: existingBackImage,
                                    bytes: backBytes,
                                    delete: () {
                                      setState(() {
                                        existingBackImage = '';
                                        backBytes = null;
                                      });
                                      kycController
                                        ..backDocPath.removeWhere((key, value) =>
                                        key == AppConfigs.docType)
                                        ..cacheBackDocPath.removeWhere(
                                                (key, value) =>
                                            key == AppConfigs.docType)
                                        ..update();
                                    },
                                    side: 'back_side'.tr,
                                    noExpand: true,
                                    isFront: false,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      errorText(kycController.idErrorText),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            kycController.cameraVideo == null
                                ? SizedBox(
                                    height: 98,
                                    child: docTile(
                                      kycController.isDark,
                                      base64Image: existingSelfieImage,
                                      bytes: selfieBytes,
                                      side: 'selfie_video'.tr,
                                      delete: () {
                                        setState(() {
                                          existingSelfieImage = '';
                                          selfieBytes = null;
                                        });
                                        kycController
                                          ..cameraVideo = null
                                          ..update();
                                      },
                                      onTap: () async {
                                        Get.to(() => VideoKYCScreen(
                                          onVideoCaptured: (vid) async {
                                            await kycController.onCapture(
                                                vid, null,
                                                isVideo: true);
                                            initVideoPlayer();
                                          },
                                        ));
                                      },
                                      noExpand: true,
                                      isFront: null,
                                    ),

                                  )
                                : Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          border: Border.all(color: kycController.isDark ? AppConfigs.g8f : AppConfigs.g4),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 100,
                                              alignment: Alignment.center,
                                              child: kycController.videoPlayerController!.value.isInitialized
                                                  ? AspectRatio(
                                                      aspectRatio: kycController.videoPlayerController!.value.aspectRatio,
                                                      child: VideoPlayer(kycController.videoPlayerController!),
                                                    )
                                                  : Container(),
                                            ),
                                            const SizedBox(width: 30),
                                            GestureDetector(
                                              onTap: () async {
                                                if (kycController.videoPlayerController!.value.isPlaying) {
                                                  await kycController.videoPlayerController!.pause();
                                                } else {
                                                  await kycController.videoPlayerController!.play().whenComplete(() => kycController.update());
                                                }
                                                kycController.update();
                                              },
                                              child: Icon(
                                                kycController.videoPlayerController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      roundButton('retake'.tr, isCancelButton: true, noMar: true, onTap: () async {
                                        Get.to(() => VideoKYCScreen(
                                              onVideoCaptured: (vid) async {
                                                await kycController.onCapture(vid, null, isVideo: true);
                                                initVideoPlayer();
                                              },
                                            ));
                                      })
                                    ],
                                  ),
                            errorText(kycController.selfieErrorText),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      ...children(),
                      FormLoggerView(
                        formName: FormNames.identityVerificationFormRules,
                        formRuleData: kycController.updateProfileFormFZ,
                      ),
                      const SizedBox(height: 20),
                      kycController.updateProfileFormFZ == null
                          ? loader()
                          : Padding(
                              padding: const EdgeInsets.all(30),
                              child: kycController.loading
                                  ? loader()
                                  : roundButton(
                                  cms(Fields.UpdateProfile_UpdateNowButton)
                                      .textHeading!,
                                  noMar: true, onTap: () async {
                                if (kycController.validateEditProfile()) {
                                  var dateArray = kycController
                                      .profileAttributes
                                      .expiryDateController
                                      .text
                                      .split(" / ");
                                  kycController
                                    ..loading = true
                                    ..update();
                                  Get.dialog(DocumentUploading(),
                                      barrierDismissible: false);
                                  List<Future<bool>> uploadFutures = [];
                                  if (kycController.frontDocPath[
                                  AppConfigs.docType] !=
                                      null) {
                                    uploadFutures.add(ApiService()
                                        .uploadMediaDocumentNew(
                                        validationValue: Box3
                                            .customerDetailsFZ
                                            ?.data!
                                            .idNo,
                                        file: XFile(
                                            kycController.frontDocPath[
                                            AppConfigs.docType]!),
                                        customerCode: Box3
                                            .customerDetailsFZ
                                            ?.data!
                                            .customerCode,
                                        documentUploadType: 'IDFRONT',
                                        documentId: Get.find<
                                            AccountController>()
                                            .docIds['IDFRONT'],
                                        isAfterSignUp: true));
                                  } else {
                                    uploadFutures.add(Future.value(true));
                                  }

                                  if (kycController.backDocPath[
                                  AppConfigs.docType] !=
                                      null) {
                                    uploadFutures.add(ApiService()
                                        .uploadMediaDocumentNew(
                                        validationValue: Box3
                                            .customerDetailsFZ
                                            ?.data!
                                            .idNo,
                                        customerCode: Box3
                                            .customerDetailsFZ
                                            ?.data!
                                            .customerCode,
                                        file: XFile(
                                            kycController.backDocPath[
                                            AppConfigs.docType]!),
                                        documentUploadType: 'IDBACK',
                                        documentId: Get.find<
                                            AccountController>()
                                            .docIds['IDBACK'],
                                        isAfterSignUp: true));
                                  } else {
                                    uploadFutures.add(Future.value(true));
                                  }

                                  if (kycController.cameraVideo != null) {
                                    uploadFutures.add(ApiService()
                                        .uploadMediaDocumentNew(
                                        validationValue: Box3
                                            .customerDetailsFZ
                                            ?.data!
                                            .idNo,
                                        customerCode: Box3
                                            .customerDetailsFZ
                                            ?.data!
                                            .customerCode,
                                        file: XFile(kycController
                                            .cameraVideo!.path),
                                        documentUploadType: 'VIDEO_KYC',
                                        documentType: 'video',
                                        documentId: Get.find<
                                            AccountController>()
                                            .docIds['VIDEO_KYC'],
                                        isAfterSignUp: true));
                                  } else {
                                    uploadFutures.add(Future.value(true));
                                  }

                                  List<bool> list =
                                  await Future.wait(uploadFutures);
                                  if (Get.isDialogOpen!) Get.back();
                                  kycController
                                    ..loading = false
                                    ..update();

                                  if (list[0] && list[1] && list[2]) {
                                    kycController
                                      ..loading = true
                                      ..update();
                                    var cusUp =
                                    await kycController.updateProfile();
                                    if (cusUp == true) {
                                      Get.back();
                                      Get.dialog(successAlert(
                                          kycController.isDark,
                                          height: 230,
                                          content:
                                          'Dear customer, please note that your EKYC is submitted successfully & your profile will be updated once authorization process is complete.'));
                                      await Future.delayed(
                                          const Duration(seconds: 5));
                                      if (Get.isDialogOpen == true) {
                                        Get.back();
                                      }
                                      // Get.back();
                                      var cData = await ApiService()
                                          .customerDetails(
                                          customerCode: Box3
                                              .customerDetailsFZ
                                              ?.data
                                              ?.customerCode ??
                                              '',
                                          idNo: Box3.customerDetailsFZ
                                              ?.data?.idNo ??
                                              '');

                                      Get.find<AccountController>()
                                        ..customerDetails =
                                        CustomerDataFZ.fromJson(cData)
                                        ..update();

                                      ///---------Start-------------
                                      //ComplaintBV? data = await ApiService().logoutApp();
                                      if ("200" == "200") {
                                        await Get.find<AccountController>()
                                            .userLogout();
                                      }
                                    }
                                    kycController
                                      ..loading = false
                                      ..update();

                                    ///-------END---------------
                                  } else {
                                    Get.showSnackbar(GetSnackBar(
                                      message:
                                      "Document uploading failed please try again",
                                      duration: Duration(seconds: 2),
                                    ));
                                    await Future.delayed(
                                        Duration(seconds: 2));
                                    return false;
                                  }
                                } else {
                                  kycController
                                    ..loading = false
                                    ..update();
                                }
                              }),
                            ),
                      const SizedBox(height: 20),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
