import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/ui_six/screens/sign_up/video_kyc_screen.dart';
import 'package:video_player/video_player.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/exports/ui_six_pages.dart';
import '../../../core/flavours/constants.dart';
import '../../../network/api_service_new.dart';

class UploadVideoKYCPage extends StatefulWidget {
  const UploadVideoKYCPage({super.key});

  @override
  State<UploadVideoKYCPage> createState() => _UploadVideoKYCPageState();
}

class _UploadVideoKYCPageState extends State<UploadVideoKYCPage> {
  @override
  void initState() {
    super.initState();
    initVideoPlayer();
  }

  Future<void> initVideoPlayer() async {
    if (Get.find<KycController>().cameraVideo != null) {
      Get.find<KycController>().videoPlayerController = VideoPlayerController.file(File(Get.find<KycController>().cameraVideo!.path));
      await Get.find<KycController>().videoPlayerController!.initialize();
      Get.find<KycController>().update();
    }
  }

  @override
  void dispose() {
    Get.find<KycController>().videoPlayerController?.dispose();
    super.dispose();
  }

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
        appBar: appBar0('Upload Video'.tr, onTap2: Get.back),
        backgroundColor: AppConfigs.bodybg(kycController.isDark),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: AppConfigs.linearGradientUiSix
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  buildStepper(isDark,3),
                  const SizedBox(height: 30),

                  Center(child: companyLogo),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      "Complete Your KYC Verification",
                      style: TS.f18B.copyWith(color: kycController.isDark ? AppConfigs.w : AppConfigs.b, fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 24),
                  kycController.cameraVideo == null
                      ? GestureDetector(
                    onTap: () async {
                      // kycController.selfieVideoPicker();
                      Get.to(() => VideoKYCScreen(
                        onVideoCaptured: (vid) async {
                          await kycController.onCapture(vid, null, isVideo: true);
                          initVideoPlayer();
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
                            Icon(
                              CupertinoIcons.videocam,
                              size: 80,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Tap to Capture".tr, style: TS.f12.copyWith(color: kycController.isDark ? AppConfigs.g8f : AppConfigs.g4)),
                            errorText(kycController.videoError)
                          ],
                        ),
                      ),
                    ),
                  )
                      : Column(
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
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: Get.width,
                                height: 400,
                                child: kycController.videoPlayerController?.value.isInitialized == true
                                    ? AspectRatio(
                                  aspectRatio: kycController.videoPlayerController!.value.aspectRatio,
                                  child: VideoPlayer(kycController.videoPlayerController!),
                                )
                                    : Container(),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    if (kycController.videoPlayerController!.value.isPlaying) {
                                      await kycController.videoPlayerController!.pause();
                                    } else {
                                      await kycController.videoPlayerController!.play().whenComplete(() => kycController.update());
                                    }
                                    kycController.update();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(
                                      kycController.videoPlayerController?.value.isPlaying == true ? Icons.pause : Icons.play_arrow,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      roundButton('retake'.tr, borderOnly: true, isCancelButton: true,noMar: true, onTap: () async {
                        Get.to(
                              () => VideoKYCScreen(
                            onVideoCaptured: (vid) async {
                              await kycController.onCapture(vid, null, isVideo: true);
                              initVideoPlayer();
                            },
                          ),
                        );
                      })
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Please note",
                      style: TS.f14.copyWith(fontWeight: FontWeight.w700, color: isDark ? AppConfigs.w : AppConfigs.b),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Hold your Emirates ID (front and back) while facing the camera.",style: TextStyle(fontSize: 12,color: AppConfigs.primaryColor, fontWeight: FontWeight.w700),),
                  SizedBox(
                    height: 10,
                  ),

                  kycController.loading
                      ? loader(bottom: 20)
                      : roundButton('next'.tr, noMar: true, onTap: () async {
                    if (kycController.cameraVideo == null) {
                      kycController
                        ..videoError = 'required'.tr
                        ..update();
                    } else {
                      kycController
                        ..loading = true
                        ..update();
                      if (await ApiService().uploadMediaDocumentNew(
                          validationValue: idNumber,
                          file: XFile(kycController.cameraVideo!.path),
                          documentUploadType: 'VIDEO_KYC',
                          documentType: 'VIDEO')) {
                        Get.toNamed(AppRoutes.signUp, arguments: {"idNumber": idNumber, "stepOrderId": stepOrderId, "mobile": ""});
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          kycController
                          // ..cameraVideo = null
                            ..videoError = ''
                            ..update();
                        });
                      }
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        kycController
                          ..loading = false
                          ..update();
                      });
                    }
                  }),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
