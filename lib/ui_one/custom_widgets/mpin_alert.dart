import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_one_custom_widgets.dart';
import '../../core/flavours/constants.dart';

void validateMPIN(
    {required Future<void> Function() onCompleted,
    bool enableBiometric = false}) {
  Get.bottomSheet(
      GestureDetector(
        onTap: () {
          // Get.back();
        },
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              Get.focusScope?.unfocus();
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  color: AppConfigs.bodybg(Get.find<MainController>().isDark),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Close button
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          ImagePath.close,
                          height: 22,
                          width: 22,
                          colorFilter: ColorFilter.mode(
                              AppConfigs.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 15),
                        alignment: Alignment.center,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                              maxWidth: 150, maxHeight: 100),
                          child: Base64Image(
                            image: Box3.companyLogo,
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Enter your MPIN to authenticate'.tr,
                          style: TS.f14.copyWith(
                            color: Get.find<MainController>().isDark
                                ? AppConfigs.w
                                : AppConfigs.g4,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    GetBuilder<AuthController>(builder: (authController) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 3),
                            child: Center(
                              child: MpinPut(
                                  controller: authController
                                      .dialogAuthAttributes.mPinController,
                                  errorText: authController
                                      .dialogAuthAttributes.mpinErrorText,
                                  onCompleted: (s) async {
                                    authController.dialogAuthAttributes
                                        .mPinTrailer = loader();
                                    await authController.validateMpin(s,
                                        onCompleted: onCompleted);
                                  },
                                  onChanged: (s) {
                                    authController
                                      ..dialogAuthAttributes.mPinTrailer =
                                          const SizedBox()
                                      ..dialogAuthAttributes.mpinErrorText = ''
                                      ..update();
                                  },
                                  trailing: authController
                                      .dialogAuthAttributes.mPinTrailer,
                                  focusNode: authController
                                      .dialogAuthAttributes.mPinFocusNode,
                                  onClear: () {
                                    authController
                                        .dialogAuthAttributes.mPinController
                                        .clear();
                                  }),
                            ),
                          ),
                          Visibility(
                            visible:
                                (authController.isBiometricAvailable == true) &&
                                    Box3.isBiometricEnabled == true &&
                                    enableBiometric,
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () async {
                                  if (authController.isAuthenticated == false) {
                                    if (await authController
                                        .authenticateWithBioMetric()) {
                                      Get.back();
                                      await onCompleted();
                                    }
                                  }
                                },
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      maxWidth: 100, maxHeight: 100),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SvgPicture.asset(ImagePath.s4,
                                        height: 80, width: 80),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Visibility(
                          //   visible:
                          //       (Get.find<AuthController>().isBiometricAvailable == true) &&
                          //           (Get.find<MainController>().userData?.enableBiometric ??
                          //               false),
                          //   child: GestureDetector(
                          //     onTap: () async {
                          //       AuthController a = Get.find<AuthController>();
                          //       if (await a.authenticateWithBioMetric()) {
                          //         await onCompleted();
                          //         accountController.update();
                          //       }
                          //     },
                          //     child: Padding(
                          //       padding: const EdgeInsets.only(top: 20),
                          //       child:
                          //           SvgPicture.asset(ImagePath.s4, height: 80, width: 80),
                          //     ),
                          //   ),
                          // )
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      barrierColor: Get.isRegistered<AccountController>()
          ? Get.find<AccountController>().isDark
              ? AppConfigs.w.withOpacity(0.1)
              : null
          : null);
  // if (accountController.isBiometricAvailable == true &&
  //     Box3.customerDetailsFZ?.data?.enableBiometric == true &&
  //     enableBiometric &&
  //     Get.find<AuthController>().isFaceAuth) {}
}
