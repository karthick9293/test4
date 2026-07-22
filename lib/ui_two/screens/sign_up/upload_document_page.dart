import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/exports/ui_two_pages.dart';
import '../../../network/api_service_new.dart';
import '../../../ui_one/screens/sign_up/nid_alerts.dart';

class UploadDocumentPage extends StatelessWidget {
  const UploadDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String stepOrderId = arguments['stepOrderId'] ?? '';
    String customerCode = arguments['customerCode'] ?? '';
    String idNumber = arguments['idNumber'] ?? '';

    return GetBuilder<KycController>(builder: (kycController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(kycController.isDark),
        body: SafeArea(
          top: false,
          child: SizedBox.expand(
            child: Column(
              children: [
                appBar0(''.tr, onTap2: Get.back),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    physics: const ClampingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Complete Your KYC Verification",
                          style: TS.f20.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppConfigs.primaryColor),
                        ),
                      ),
                      DocStepper(
                        step: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "1. Upload your ${Box3.settings.primaryDocIDName}",
                              style: TS.f16.copyWith(
                                  color: kycController.isDark
                                      ? AppConfigs.g8f
                                      : AppConfigs.g4,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Please upload both the front and back sides of your ${Box3.settings.primaryDocIDName}."),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Font Side",
                              style: TS.f16.copyWith(
                                  color: kycController.isDark
                                      ? AppConfigs.g8f
                                      : AppConfigs.g4,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.start),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 190,
                            child: docTile(kycController.isDark,
                                delete: () => kycController
                                  ..frontDocPath.removeWhere(
                                      (key, value) => key == AppConfigs.docType)
                                  ..update(),
                                path: kycController
                                    .frontDocPath[AppConfigs.docType],
                                side: 'tap to upload front side'.tr,
                                boxHeight: 170,
                                error: kycController.errorText != "" &&
                                    kycController
                                            .frontDocPath[AppConfigs.docType] ==
                                        null,
                                noExpand: true,
                                isFront: true),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Back Side",
                              style: TS.f16.copyWith(
                                  color: kycController.isDark
                                      ? AppConfigs.g8f
                                      : AppConfigs.g4,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.start),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 190,
                            child: docTile(kycController.isDark,
                                path: kycController
                                    .backDocPath[AppConfigs.docType],
                                delete: () => kycController
                                  ..backDocPath.removeWhere(
                                      (key, value) => key == AppConfigs.docType)
                                  ..update(),
                                side: 'tap to upload back side'.tr,
                                boxHeight: 170,
                                error: kycController.errorText != "" &&
                                    kycController
                                            .backDocPath[AppConfigs.docType] ==
                                        null,
                                noExpand: true,
                                isFront: false),
                          ),
                          errorText(kycController.errorText),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(
                              left: 0, top: 15.2, bottom: 15.2, right: 0),
                          child: Divider(
                            height: 1,
                            color: Color(0xff707070),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, top: 1),
                        child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(children: [
                              TextSpan(
                                  style: TS.f12.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: kycController.isDark
                                          ? AppConfigs.g8f
                                          : AppConfigs.g4),
                                  text:
                                      "1.Upload Oman ROP issued Resident/National ID only\n2.All customer KYC documents are protected under the company’s Consumer Data protection policy of the company."),
                            ])),
                      ),
                      kycController.loading
                          ? loader(bottom: 20)
                          : roundButton(
                              Get.find<AccountController>().completingKYC
                                  ? 'next'.tr
                                  : 'submit'.tr,
                              top: 20,
                              bottom: 30,
                              left: 0,
                              right: 0, onTap: () async {
                              if (kycController
                                          .frontDocPath[AppConfigs.docType] ==
                                      null ||
                                  kycController
                                          .backDocPath[AppConfigs.docType] ==
                                      null) {
                                kycController.errorText = 'required'.tr;
                                kycController.update();
                              } else if (kycController.idNo != '' &&
                                  Box3.settings.processEkycAs == 'UAE-PASS') {
                                Get.back();
                                await Get.dialog(kycPendingAlert(
                                    kycController.isDark,
                                    'The EID number displayed in the uploaded image does not match the given EID number.'
                                        .tr,
                                    title: 'Incorrect EID number'.tr,
                                    image: SvgIcons.deviceVerify));
                              } else if (kycController
                                          .frontDocPath[AppConfigs.docType] !=
                                      null &&
                                  kycController
                                          .backDocPath[AppConfigs.docType] !=
                                      null) {
                                kycController
                                  ..loading = true
                                  ..update();
                                List<bool> list = [];
                                list = [
                                  await ApiService().uploadMediaDocumentNew(
                                      validationValue: idNumber,
                                      file: XFile(kycController
                                          .frontDocPath[AppConfigs.docType]!),
                                      customerCode: customerCode,
                                      documentUploadType: 'IDFRONT'),
                                  await ApiService().uploadMediaDocumentNew(
                                      validationValue: idNumber,
                                      file: XFile(kycController
                                          .backDocPath[AppConfigs.docType]!),
                                      documentUploadType: 'IDBACK')
                                ];
                                kycController
                                  ..loading = false
                                  ..update();
                                if ((list[0] && list[1])) {
                                  // if (Box3.settings.processEkycAs == 'UAE-PASS') {
                                  //   Get.to(
                                  //     () => UAEConfirmDetails(null, () {
                                  //       Get.toNamed(AppRoutes.signUp);
                                  //       kycController.update();
                                  //     }, const []),
                                  //   );
                                  // } else {
                                  Get.toNamed(AppRoutes.selfie, arguments: {
                                    "idNumber": idNumber,
                                    "stepOrderId": stepOrderId
                                  });

                                  kycController
                                    // ..frontDocPath.clear()
                                    // ..backDocPath.clear()
                                    ..errorText = ''
                                    ..update();
                                }
                              }
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
