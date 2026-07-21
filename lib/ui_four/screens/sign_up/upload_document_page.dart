import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:mobiremit/core/flavours/app_routes.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_four_custom_widgets.dart';
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
      //Todo: Handle clientwise from admn config
      TextStyle textStyle = TS.f12.copyWith(
          fontWeight: FontWeight.w600,
          color: kycController.isDark ? AppConfigs.g8f : AppConfigs.g4);
      return PopScope(
        canPop: true,
        onPopInvokedWithResult: (t, r) {},
        child: Scaffold(
          backgroundColor: AppConfigs.bodybg(kycController.isDark),
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                appBar0('upload_document'.tr, onTap2: () {
                  Get.back();
                }),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 30),
                        child: Text('select_document_to_upload'.tr,
                            style: TS.f14.copyWith(
                                color: kycController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.g4),
                            textAlign: TextAlign.start),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 1),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: TS.f12.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: kycController.isDark
                                      ? AppConfigs.g8f
                                      : AppConfigs.g4),
                              text: 'upload_both_sides_of_doc'.tr),
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 1),
                        child: Text('doc_format'.tr,
                            style: TextStyles.font12.copyWith(
                                fontWeight: FontWeight.w400,
                                color: kycController.isDark
                                    ? AppConfigs.g8f
                                    : null),
                            textAlign: TextAlign.start),
                      ),
                      // Visibility(
                      //   visible: true,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const Padding(
                      //           padding: EdgeInsets.only(
                      //               left: 35, top: 23.2, bottom: 10.2, right: 30),
                      //           child: Divider(
                      //             height: 1,
                      //             color: Color(0xff707070),
                      //           )),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 35, bottom: 5),
                      //         child: Text('emirates_id'.tr,
                      //             style: TS.f14.copyWith(
                      //                 color: kycController.isDark
                      //                     ? AppConfigs.g8f
                      //                     : AppConfigs.g4),
                      //             textAlign: TextAlign.start),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 30, right: 30, top: 0),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             docTile(kycController.isDark,
                      //                 path: kycController
                      //                     .frontDocPath[AppConfigs.docType],
                      //                 delete: () => kycController
                      //                   ..frontDocPath.removeWhere((key, value) =>
                      //                       key == AppConfigs.docType)
                      //                   ..update(),
                      //                 side: 'front_side'.tr,
                      //                 isFront: true),
                      //             const SizedBox(width: 20),
                      //             docTile(kycController.isDark,
                      //                 path: kycController
                      //                     .backDocPath[AppConfigs.docType],
                      //                 delete: () => kycController
                      //                   ..backDocPath.removeWhere((key, value) =>
                      //                       key == AppConfigs.docType)
                      //                   ..update(),
                      //                 side: 'back_side'.tr,
                      //                 isFront: false),
                      //           ],
                      //         ),
                      //       ),
                      //       errorText(kycController.errorText),
                      //     ],
                      //   ),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(
                                  left: 35, top: 23.2, bottom: 10.2, right: 30),
                              child: Divider(
                                height: 1,
                                color: Color(0xff707070),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, bottom: 5),
                            child: Text(Box3.settings.primaryDocIDName,
                                style: TS.f14.copyWith(
                                    color: kycController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4),
                                textAlign: TextAlign.start),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                docTile(kycController.isDark,
                                    delete: () => kycController
                                      ..frontDocPath.removeWhere((key, value) =>
                                          key == AppConfigs.docType)
                                      ..update(),
                                    path: kycController
                                        .frontDocPath[AppConfigs.docType],
                                    side: 'front_side'.tr,
                                    error: kycController.errorText != "" &&
                                        kycController.frontDocPath[
                                                AppConfigs.docType] ==
                                            null,
                                    isFront: true),
                                const SizedBox(width: 20),
                                docTile(kycController.isDark,
                                    path: kycController
                                        .backDocPath[AppConfigs.docType],
                                    delete: () => kycController
                                      ..backDocPath.removeWhere((key, value) =>
                                          key == AppConfigs.docType)
                                      ..update(),
                                    side: 'back_side'.tr,
                                    error: kycController.errorText != "" &&
                                        kycController.backDocPath[
                                                AppConfigs.docType] ==
                                            null,
                                    isFront: false),
                              ],
                            ),
                          ),
                          errorText(kycController.errorText),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(
                              left: 35, top: 23.2, bottom: 10.2, right: 30),
                          child: Divider(
                            height: 1,
                            color: Color(0xff707070),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, top: 1),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "1. ",
                                  style: textStyle,
                                ),
                                Expanded(
                                    child: Text(
                                  "Upload ${Box3.companyDataFZ?.companySettings?.country} issued ${Box3.settings.primaryDocIDName} only.",
                                  style: textStyle,
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "2. ",
                                  style: textStyle,
                                ),
                                Expanded(
                                    child: Text(
                                  "All customer KYC documents are protected under the company’s Consumer Data protection policy of the company.",
                                  style: textStyle,
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                kycController.loading
                    ? loader(bottom: 20)
                    : roundButton(
                        Get.find<AccountController>().completingKYC
                            ? 'next'.tr
                            : 'submit'.tr,
                        top: 20,
                        bottom: 30, onTap: () async {
                        if (kycController.frontDocPath[AppConfigs.docType] ==
                                null ||
                            kycController.backDocPath[AppConfigs.docType] ==
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
                            kycController.backDocPath[AppConfigs.docType] !=
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
                            kycController.cacheFrontDocPath =
                                kycController.frontDocPath;
                            kycController.cacheBackDocPath =
                                kycController.backDocPath;

                            Get.toNamed(AppRoutes.selfie, arguments: {
                              "idNumber": idNumber,
                              "stepOrderId": stepOrderId
                            });
                            // SignUpController su = Get.find<SignUpController>();
                            // su.addCustomer(customerData: su.form.buildJsonNew(su.formBV!.formFieldItem), authData: su.credForm.buildJsonNew(su.credFormBV!.formFieldItem), stepOrderId: stepOrderId);
                            // }
                            // kycController.frontDocPath = {};
                            // kycController.backDocPath = {};
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
        ),
      );
    });
  }
}
