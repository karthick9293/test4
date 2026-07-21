import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/core/controllers/kyc_controller.dart';
import 'package:mobiremit/core/flavours/app_routes.dart';

import '../../../core/exports/ui_four_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../network/api_service_new.dart';
import 'selfie_screen.dart';

class UploadSelfiePage extends StatelessWidget {
  const UploadSelfiePage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String stepOrderId = arguments['stepOrderId'] ?? '';
    // String customerCode = arguments['customerCode'] ?? '';
    String idNumber = arguments['idNumber'] ?? '';
    (Get.isRegistered<KycController>()
            ? Get.find<KycController>()
            : Get.put(KycController()))
        .selfieImage = null;
    return GetBuilder<KycController>(builder: (kycController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(kycController.isDark),
        appBar: appBar0('Photo_KYC'.tr, onTap2: () {
          Get.back();
        }),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: kycController.selfieImage == null
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
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(10),
                          width: 368,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: const Color(0xff707070), width: 1),
                              color: kycController.isDark
                                  ? AppConfigs.g21
                                  : const Color(0xfff5f5f5)),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Please_make_sure_that_your_face".tr,
                                    style: TS.f12.copyWith(
                                        color: kycController.isDark
                                            ? AppConfigs.g8f
                                            : AppConfigs.g4)),
                              ),
                              //TODO: Add file management and video preview
                              const Spacer(),
                              SvgPicture.asset(ImagePath.videoKyc),
                              const Spacer(),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: SvgPicture.asset(ImagePath.capture)),
                              errorText(kycController.selfieError)
                            ],
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: kycController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: Get.width,
                                        child: Image.file(File(
                                            kycController.selfieImage!.path)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                      ),
              ),
              kycController.loading
                  ? loader(bottom: 20)
                  : roundButton('next'.tr, onTap: () async {
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
                          kycController.cacheSelfieImage =
                              kycController.selfieImage;
                          // kycController.selfieImage = null;
                          await Get.toNamed(AppRoutes.videoKyc, arguments: {
                            "idNumber": idNumber,
                            "stepOrderId": stepOrderId
                          });
                        }
                        kycController
                          ..loading = false
                          ..update();
                      }
                    })
            ],
          ),
        ),
      );
    });
  }
}
