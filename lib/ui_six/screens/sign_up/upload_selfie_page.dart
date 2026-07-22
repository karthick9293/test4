import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/core/controllers/kyc_controller.dart';
import 'package:mobiremit/ui_six/screens/sign_up/selfie_screen.dart';

import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../network/api_service_new.dart';
import 'package:mobiremit/ui_common/app_routes.dart';

import '../../../ui_four/screens/sign_up/upload_doc_tile.dart';

class UploadSelfiePage extends StatelessWidget {
  const UploadSelfiePage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String stepOrderId = arguments['stepOrderId'] ?? '';
    // String customerCode = arguments['customerCode'] ?? '';
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
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(kycController.isDark),
        body: SafeArea(
          top: false,
          child: Container(
            decoration: BoxDecoration(
                gradient: AppConfigs.linearGradientUiSix
            ),
            child: Column(
              children: [
                appBar0('Upload Selfie'.tr, onTap2: Get.back),
                Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      physics: const ClampingScrollPhysics(),
                      children: [
                        const SizedBox(height: 20),
                        buildStepper(isDark,2),
                        const SizedBox(height: 30),
                        Center(child: companyLogo),
                        const SizedBox(height: 24),
                        Center(
                          child: Text(
                            "Complete Your KYC Verification",
                            style: TS.f18B.copyWith(color: kycController.isDark ? AppConfigs.w : AppConfigs.b, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildDocCard(
                          kycController,
                          side: 'Take Selfie'.tr,
                          subText: 'Upload Selfie image'.tr,
                          isFront: true,
                          path: kycController.frontDocPath[AppConfigs.docType],
                        ),
                        SizedBox(height: 20,),
                        Text("Please note",
                            style: TS.f14.copyWith(fontWeight: FontWeight.w700, color: isDark ? AppConfigs.w : AppConfigs.b)),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Make sure your face is clearly visible",
                          style: TextStyle(fontSize: 12,color: AppConfigs.primaryColor, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        kycController.loading
                            ? loader(bottom: 20)
                            : roundButton('next'.tr, noMar: true, onTap: () async {
                          if (kycController.selfieImage == null) {
                            kycController
                              ..selfieError = 'required'.tr
                              ..update();
                          } else {
                            kycController
                              ..loading = true
                              ..update();
                            // if (await ApiService().uploadDocument(
                            //     validationValue: Get.find<SignUpController>()
                            //         .signUpAttributes
                            //         .nidConroller
                            //         .text,
                            //     file: XFile(kycController.selfieImage!.path),
                            //     documentUploadType: 'custimg'))
                            if (await ApiService().uploadMediaDocumentNew(
                                validationValue: idNumber,
                                file: XFile(kycController.selfieImage!.path),
                                documentUploadType: 'SELFIE_IMAGE')) {
                              kycController
                                ..loading = false
                              // ..selfieImage = null
                                ..selfieError = ''
                                ..update();
                              await Get.toNamed(AppRoutes.videoKyc,
                                  arguments: {
                                    "idNumber": idNumber,
                                    "stepOrderId": stepOrderId
                                  });
                            }
                            kycController
                              ..loading = false
                              ..update();
                          }
                        }),
                  SizedBox(height: 20,)
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDocCard(KycController kycController, {required String side, required String subText, required bool isFront, String? path}) {
    bool isDark = kycController.isDark;

    return kycController.selfieImage == null
        ? GestureDetector(
      onTap: () async {
        // kycController.selfieImagePicker();

        Get.to(() => SelfieScreen(
          onCaptured: (img) {
            kycController.onCapture(img, null,
                isSelfie: true);
          },
        ));
      },
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                    ),
                    Text("Tap to Capture".tr,
                        style: TS.f12.copyWith(
                            color: kycController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.g4)),
                  ],
                ),
              ),
              errorText(kycController.selfieError)
            ],
          ),
        ),
      ),
    )
        : Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 400,
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
          child: SizedBox(
            width: Get.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                File(kycController.selfieImage!.path),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        roundButton('retake'.tr, borderOnly: true,
            onTap: () async {
              // final ImagePicker picker = ImagePicker();
              // kycController
              //   ..selfieImage = await picker.pickImage(
              //       source: ImageSource.camera,
              //       preferredCameraDevice: CameraDevice.front)
              //   ..update();
              Get.to(() => SelfieScreen(
                onCaptured: (img) {
                  kycController.onCapture(img, null,
                      isSelfie: true);
                },
              ));
            })
      ],
    );


    return Container(
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
    );
  }
}
