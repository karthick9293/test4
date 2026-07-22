import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_one_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/flavours/app_routes.dart';

class FaceRecognitionPage extends StatefulWidget {
  const FaceRecognitionPage({super.key});

  @override
  State<FaceRecognitionPage> createState() => _FaceRecognitionPageState();
}

class _FaceRecognitionPageState extends State<FaceRecognitionPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(signUpController.isDark),
        body: Column(
          children: [
            appBar0('Face_Recognition'.tr, onTap2: Get.back),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: const EdgeInsets.all(10),
                width: 368,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: AppConfigs.g70, width: 1),
                    color: signUpController.isDark
                        ? AppConfigs.g21
                        : const Color(0xfff5f5f5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "please_take_a_picture_of_holding_your_id_and_submit"
                                .tr,
                            style: TS.f12.copyWith(
                                color: signUpController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.g4)),
                        SvgPicture.asset(ImagePath.retake)
                      ],
                    ),
                    SvgPicture.asset(ImagePath.faceRecognition),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: SvgPicture.asset(ImagePath.faceIcon),
                    )
                  ],
                ),
              ),
            ),
            roundButton('next'.tr, onTap: () => Get.toNamed(AppRoutes.videoKyc))
          ],
        ),
      );
    });
  }
}
