import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/exports/ui_two_pages.dart';
import '../../../network/api_service_new.dart';

class UploadSelfiePage extends StatelessWidget {
  const UploadSelfiePage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String stepOrderId = arguments['stepOrderId'] ?? '';
    // String customerCode = arguments['customerCode'] ?? '';
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
                    Center(
                      child: Text(
                        "Complete Your KYC Verification",
                        style: TS.f20.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppConfigs.primaryColor),
                      ),
                    ),
                    DocStepper(
                      step: 2,
                    ),
                    Text("2. Take a Selfie",
                        style: TS.f16.copyWith(
                            color: kycController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.g4,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Ensure your face is well-lit and inside the frame."),
                    SizedBox(
                      height: 10,
                    ),
                    kycController.selfieImage == null
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
                              padding: const EdgeInsets.all(10),
                              height: 350,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                      color: const Color(0xff707070), width: 1),
                                  color: kycController.isDark
                                      ? AppConfigs.g21
                                      : const Color(0xfff5f5f5)),
                              child: Center(
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
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  border: Border.all(
                                      color: kycController.isDark
                                          ? AppConfigs.g8f
                                          : AppConfigs.g4),
                                ),
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
                          ),
                    Text(
                      "Make sure your face is clearly visible",
                      style: TextStyle(fontSize: 12),
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
                          })
                  ],
                )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
