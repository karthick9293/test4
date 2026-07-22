import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/ui_one/screens/sign_up/video_kyc_screen.dart';
import 'package:video_player/video_player.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../core/exports/ui_seven_pages.dart';
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
      Get.find<KycController>().videoPlayerController =
          VideoPlayerController.file(
              File(Get.find<KycController>().cameraVideo!.path));
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
    (Get.isRegistered<KycController>()
            ? Get.find<KycController>()
            : Get.put(KycController()))
        .cameraVideo = null;

    return GetBuilder<KycController>(builder: (kycController) {
      return PopScope(
        canPop: true,
        onPopInvokedWithResult: (t, r) {
          // kycController.videoPlayerController?.dispose();
          // kycController.cameraVideo = null;
          // kycController.update();
        },
        child: GlobalScaffold(
          appBar: appBar0('video_kyc'.tr, onTap2: () {
            Get.back();
            // kycController.cameraVideo == null;
          }),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: kycController.cameraVideo == null
                      ? GestureDetector(
                          onTap: () async {
                            // kycController.selfieVideoPicker();
                            Get.to(() => VideoKYCScreen(
                                  onVideoCaptured: (vid) async {
                                    await kycController.onCapture(vid, null,
                                        isVideo: true);
                                    initVideoPlayer();
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
                                      "Please_make_sure_that_your_face_is".tr,
                                      style: TS.f12.copyWith(
                                          color: kycController.isDark
                                              ? AppConfigs.g8f
                                              : AppConfigs.g4)),
                                ),
                                const Spacer(),
                                //TODO: Add file management and video preview
                                SvgPicture.asset(ImagePath.videoKyc),
                                const Spacer(),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child:
                                        SvgPicture.asset(ImagePath.videoIcon)),
                                errorText(kycController.videoError)
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
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
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
                                          child: kycController
                                                      .videoPlayerController
                                                      ?.value
                                                      .isInitialized ==
                                                  true
                                              ? AspectRatio(
                                                  aspectRatio: kycController
                                                      .videoPlayerController!
                                                      .value
                                                      .aspectRatio,
                                                  child: VideoPlayer(kycController
                                                      .videoPlayerController!),
                                                )
                                              : Container(),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if (kycController.videoPlayerController!
                                            .value.isPlaying) {
                                          await kycController
                                              .videoPlayerController!
                                              .pause();
                                        } else {
                                          await kycController
                                              .videoPlayerController!
                                              .play()
                                              .whenComplete(
                                                  () => kycController.update());
                                        }
                                        kycController.update();
                                      },
                                      child: Icon(
                                        kycController.videoPlayerController
                                                    ?.value.isPlaying ==
                                                true
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            roundButton('retake'.tr,
                                borderOnly: true,
                                isCancelButton: true, onTap: () async {
                              Get.to(
                                () => VideoKYCScreen(
                                  onVideoCaptured: (vid) async {
                                    await kycController.onCapture(vid, null,
                                        isVideo: true);
                                    initVideoPlayer();
                                  },
                                ),
                              );
                            })
                          ],
                        ),
                ),
                kycController.loading
                    ? loader(bottom: 20)
                    : roundButton('next'.tr, onTap: () async {
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
                            kycController.cacheCameraVideo =
                                kycController.cameraVideo;
                            // kycController.cameraVideo = null;
                            Get.toNamed(AppRoutes.signUp, arguments: {
                              "idNumber": idNumber,
                              "stepOrderId": stepOrderId,
                              "mobile": ""
                            });
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
                      })
              ],
            ),
          ),
        ),
      );
    });
  }
}
