import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/flavours/app_routes.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_four_custom_widgets.dart';
import '../../../core/flavours/constants.dart';

class RetryVisualization extends StatelessWidget {
  const RetryVisualization({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String msg = arguments['msg'] ?? '';
    String isFrom = arguments['isFrom'] ?? '';
    String type = arguments['type'] ?? '';
    // KycBV kycBV = arguments['kycBV'];

    return GetBuilder<AccountController>(builder: (accountController) {
      return NavigatorPopHandler(
        onPop: () async {
          // If the user is trying to pop, show the logout alert
          accountController.logoutAlert(
            title: 'Alert',
            description: 'Are you sure want to close the application',
            yes: 'Yes',
            no: 'No',
          );
          return Future.value(false); // Prevent default pop behavior
        },
        child: Scaffold(
          backgroundColor: AppConfigs.bodybg(accountController.isDark),
          body: SafeArea(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImagePath.uae_pass_alert),
                    const SizedBox(height: 30),
                    Text(
                      '${'Alert'.tr}!',
                      style: TS.f20.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.w
                              : AppConfigs.bf0),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      msg,
                      style: TS.f14.copyWith(
                        color: accountController.isDark
                            ? AppConfigs.w
                            : AppConfigs.g4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    accountController.retryLoading
                        ? Center(
                            child: tinyLoader(size: 20, width: 1.5),
                          )
                        : roundButton('Retry'.tr, noMar: true, onTap: () async {
                            accountController.retryLoading = true;
                            Get.find<SignUpController>().docShareRetry = true;
                            accountController.update();
                            Get.back();
                            if (isFrom == 'Dash') {
                              accountController.signWithUAEPassDash();
                            } else {
                              Get.toNamed(
                                  AppRoutes.visualizationRetryRoutesUAEPASS,
                                  arguments: {
                                    "msg": msg,
                                    "type": type,
                                    "isFrom": isFrom,
                                    // "kycBV": kycBV
                                  });
                              // if (await Get.find<SignUpController>().isUAEPassDataDetails(isFromSignUp: isFrom)) {
                              //   var data = Get.find<SignUpController>().uaePassData?[0];
                              //   var urls = Get.find<SignUpController>().urls;
                              //   var formData = Get.find<SignUpController>().formData;
                              //   accountController.retryLoading = false;
                              //   Get.find<SignUpController>().docShareRetry = false;
                              //   accountController.update();
                              //   Get.back();
                              //
                              //   if (data?.reqAuthorized == 'I' || data?.reqAuthorized == 'Y') {
                              //     Get.showSnackbar(GetSnackBar(
                              //       messageText: Text(
                              //         "Profile data received successfully from UAE PASS.",
                              //         style: TS.f14.copyWith(color: AppConfigs.w),
                              //       ),
                              //       backgroundColor: (AppConfigs.dg).withOpacity(0.7),
                              //       duration: const Duration(seconds: 2),
                              //     ));
                              //     Get.to(() => UAEConfirmDetails(formData, () => Get.toNamed(AppRoutes.signUp), urls));
                              //   }
                              // } else {
                              //   Get.find<SignUpController>().signUpAttributes.nidConroller.clear();
                              //   Get.find<SignUpController>().signUpAttributes.mobile.clear();
                              //   accountController.retryLoading = false;
                              //   accountController.update();
                              //   Get.back();
                              // }
                            }
                          }),
                    const SizedBox(
                      height: 10,
                    ),
                    roundButton('cancel'.tr, noMar: true, onTap: () {
                      // Get.back();
                      accountController.logoutAlert(
                          title: 'Alert',
                          description:
                              'Are you sure want to close this session',
                          yes: 'Yes',
                          no: 'No');
                    }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
