import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import 'package:mobiremit/ui_common/app_routes.dart';

class ESignaturePage extends StatefulWidget {
  const ESignaturePage({super.key});

  @override
  State<ESignaturePage> createState() => _ESignaturePageState();
}

class _ESignaturePageState extends State<ESignaturePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(signUpController.isDark),
        body: Column(
          children: [
            appBar0('e_signature'.tr, onTap2: Get.back),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("please_take_a_picture_of_holding_your_id_and_submit".tr,
                      style: TS.f12.copyWith(color: signUpController.isDark ? AppConfigs.g8f : AppConfigs.g4)),
                  GestureDetector(onTap: () => signUpController.signatureController.clear(), child: SvgPicture.asset(ImagePath.retake)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                padding: const EdgeInsets.all(10),
                width: 368,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: const Color(0xff707070), width: 1),
                    color: signUpController.isDark ? AppConfigs.g21 : const Color(0xfff5f5f5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please_Draw_your_signature_here".tr,
                        style: TS.f12.copyWith(color: signUpController.isDark ? AppConfigs.g8f : AppConfigs.g4)),
                    const SizedBox(height: 50),
                    signUpController.signing
                        ? Expanded(
                            child: Signature(
                              controller: signUpController.signatureController,
                              width: 300,
                              height: 300,
                              backgroundColor: Colors.transparent,
                            ),
                          )
                        : GestureDetector(
                            onTap: () => signUpController
                              ..signing = true
                              ..update(),
                            child: SvgPicture.asset(ImagePath.eSignature)),
                  ],
                ),
              ),
            ),
            roundButton('submit'.tr, onTap: () => Get.toNamed(AppRoutes.customerDetails))
          ],
        ),
      );
    });
  }
}
