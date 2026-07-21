import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/exports/ui_six_pages.dart';
import '../../../core/flavours/constants.dart';
import '../../../network/api_service_new.dart';
import 'nid_alerts.dart';
import 'upload_doc_tile.dart';

class UploadDocumentPage extends StatelessWidget {
  const UploadDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String stepOrderId = arguments['stepOrderId'] ?? '';
    String customerCode = arguments['customerCode'] ?? '';
    String idNumber = arguments['idNumber'] ?? '';

    return GetBuilder<KycController>(builder: (kycController) {
      bool isDark = kycController.isDark;
      
      final companyLogo = Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppConfigs.w,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: Base64Image(
          image: Box3.companyLogo,
          fit: BoxFit.contain,
          height: 60,
          width: 60,
        ),
      );

      return PopScope(
        canPop: true,
        onPopInvokedWithResult: (t, r) {
          kycController.frontDocPath.clear();
          kycController.backDocPath.clear();
          kycController.update();
        },
        child: Scaffold(
          backgroundColor: AppConfigs.bodybg(isDark),
          body: SafeArea(
            top: false,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppConfigs.linearGradientUiSix,
              ),
              child: Column(
                children: [
                  appBar0('upload_document'.tr, onTap2: () {
                    Get.back();
                    kycController.frontDocPath.clear();
                    kycController.backDocPath.clear();
                  }),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(height: 20),
                        buildStepper(isDark,1),
                        const SizedBox(height: 30),
                        Center(child: companyLogo),
                        const SizedBox(height: 24),
                        Center(
                          child: Text('kyc_document_upload'.tr,
                              style: TS.f18B.copyWith(color: isDark ? AppConfigs.w : AppConfigs.b, fontSize: 20)),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text('upload_clear_images_of_both_sides'.trParams({'doc': Box3.settings.primaryDocIDName}),
                                style: TS.f12.copyWith(color: isDark ? AppConfigs.g8f : Colors.grey, height: 1.4), textAlign: TextAlign.center),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(Box3.settings.primaryDocIDName.toUpperCase(),
                              style: TS.f12.copyWith(fontWeight: FontWeight.w800, color: isDark ? AppConfigs.w : AppConfigs.b, letterSpacing: 0.5)),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            _buildDocCard(
                              kycController,
                              side: 'front_side'.tr,
                              subText: 'Upload front side'.tr,
                              isFront: true,
                              path: kycController.frontDocPath[AppConfigs.docType],
                            ),
                            const SizedBox(width: 12),
                            _buildDocCard(
                              kycController,
                              side: 'back_side'.tr,
                              subText: 'Upload back side'.tr,
                              isFront: false,
                              path: kycController.backDocPath[AppConfigs.docType],
                            ),
                          ],
                        ),
                        errorText(kycController.errorText),
                        const SizedBox(height: 25),
                        const Divider(height: 1),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppConfigs.primaryColor, width: 1.5),
                              ),
                              child: Icon(Icons.priority_high, color: AppConfigs.primaryColor, size: 12),
                            ),
                            const SizedBox(width: 10),
                            Text("Please note".tr,
                                style: TS.f14.copyWith(fontWeight: FontWeight.w700, color: isDark ? AppConfigs.w : AppConfigs.b)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Column(
                            children: [
                              _buildNoteItem("1.", "Upload ${Box3.companyDataFZ?.companySettings?.country} issued ${Box3.settings.primaryDocIDName} only.", isDark),
                              const SizedBox(height: 10),
                              _buildNoteItem(
                                  "2.", "All customer KYC documents are protected under the company’s Consumer Data protection policy.", isDark),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  kycController.loading
                      ? loader(bottom: 20)
                      : Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                        child: roundButton(Get.find<AccountController>().completingKYC ? 'next'.tr : 'submit'.tr, bottom: 0, onTap: () async {
                            if (kycController.frontDocPath[AppConfigs.docType] == null || kycController.backDocPath[AppConfigs.docType] == null) {
                              kycController.errorText = 'required'.tr;
                              kycController.update();
                            } else if (kycController.idNo != '' && Box3.settings.processEkycAs == 'UAE-PASS') {
                              Get.back();
                              await Get.dialog(kycPendingAlert(
                                  isDark, 'The EID number displayed in the uploaded image does not match the given EID number.'.tr,
                                  title: 'Incorrect EID number'.tr, image: SvgIcons.deviceVerify));
                            } else if (kycController.frontDocPath[AppConfigs.docType] != null && kycController.backDocPath[AppConfigs.docType] != null) {
                              kycController
                                ..loading = true
                                ..update();
                              List<bool> list = [];
                              list = [
                                await ApiService().uploadMediaDocumentNew(
                                    validationValue: idNumber,
                                    file: XFile(kycController.frontDocPath[AppConfigs.docType]!),
                                    customerCode: customerCode,
                                    documentUploadType: 'IDFRONT'),
                                await ApiService().uploadMediaDocumentNew(
                                    validationValue: idNumber,
                                    file: XFile(kycController.backDocPath[AppConfigs.docType]!),
                                    documentUploadType: 'IDBACK')
                              ];
                              kycController
                                ..loading = false
                                ..update();
                              if ((list[0] && list[1])) {
                                kycController.cacheFrontDocPath = kycController.frontDocPath;
                                kycController.cacheBackDocPath = kycController.backDocPath;

                                Get.toNamed(AppRoutes.selfie, arguments: {"idNumber": idNumber, "stepOrderId": stepOrderId});
                                kycController.frontDocPath = {};
                                kycController.backDocPath = {};
                                kycController
                                  ..errorText = ''
                                  ..update();
                              }
                            }
                          }),
                      ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDocCard(KycController kycController, {required String side, required String subText, required bool isFront, String? path}) {
    bool isDark = kycController.isDark;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isDark ? AppConfigs.g21 : AppConfigs.w,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              )
            ]),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppConfigs.primaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(ImagePath.identification, colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn), height: 28),
            ),
            const SizedBox(height: 12),
            Text(side, style: TS.f14.copyWith(fontWeight: FontWeight.w700, color: isDark ? AppConfigs.w : AppConfigs.b)),
            const SizedBox(height: 4),
            Text(subText, style: TS.f10.copyWith(color: Colors.grey.shade500, fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            docTile(
              isDark,
              noExpand: true,
              path: path,
              side: 'Tap to upload'.tr,
              isFront: isFront,
              error: kycController.errorText != "" && path == null,
              delete: () => isFront
                  ? (kycController
                    ..frontDocPath.removeWhere((key, value) => key == AppConfigs.docType)
                    ..update())
                  : (kycController
                    ..backDocPath.removeWhere((key, value) => key == AppConfigs.docType)
                    ..update()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteItem(String index, String text, bool isDark) {
    TextStyle style = TS.f12.copyWith(fontWeight: FontWeight.w600, color: isDark ? AppConfigs.g8f : Colors.grey.shade700, height: 1.4);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(index, style: style.copyWith(color: AppConfigs.primaryColor, fontWeight: FontWeight.w700)),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: style)),
      ],
    );
  }
}
