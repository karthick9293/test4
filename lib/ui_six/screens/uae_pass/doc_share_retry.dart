import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/sign_up_controller.dart';

import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/exports/ui_six_pages.dart';
import '../../../core/flavours/constants.dart';

class DocShareRetry extends StatelessWidget {
  const DocShareRetry({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String message = arguments['message'];
    String authToken = arguments['authToken'];
    // KycBV kycBV = arguments['kycBV'];

    return GetBuilder<SignUpController>(builder: (signUpController) {
      return NavigatorPopHandler(
        onPop: () async {
          // If the user is trying to pop, show the logout alert
          signUpController.logoutAlert(
            title: 'Alert',
            description: 'Are you sure want to close the application',
            yes: 'Yes',
            no: 'No',
          );
          return Future.value(false); // Prevent default pop behavior
        },
        child: Scaffold(
          backgroundColor: AppConfigs.bodybg(signUpController.isDark),
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
                  // SvgPicture.asset(HomeSvgs.deviceVerify),
                  const SizedBox(height: 30),
                  Text(
                    '${'Alert'.tr}!',
                    style: TS.f20.copyWith(color: signUpController.isDark ? AppConfigs.w : AppConfigs.bf0),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    message,
                    style: TS.f14.copyWith(
                      color: signUpController.isDark ? AppConfigs.g8f : AppConfigs.g4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  roundButton('Retry'.tr, noMar: true, onTap: () async {
                    // signUpController.docShareRetry = true;
                    // signUpController.update();
                    // // Get.back();
                    //
                    // // bool? isApp = await ApiService().checkAppInstalledOrNot();
                    //
                    // // if (Get.currentRoute != AppRoutes.loadingRoutes) {
                    // //   await Get.toNamed(AppRoutes.loadingRoutes);
                    // // }
                    //
                    // signUpController.documentSharingRequest(
                    //   authToken: authToken,
                    //   kycBV: kycBV,
                    //   isFromPopup: true,
                    // );
                    //
                    // if (Get.currentRoute != AppRoutes.loadingRoutes) {
                    //   await Get.toNamed(AppRoutes.loadingRoutes);
                    // }
                    // Get.back();

                    Get.toNamed(AppRoutes.docShareRetryRoutesUAEPASS, arguments: {
                      "authToken": authToken,
                      "message": message,
                    });
                  }),
                  // const Spacer(),
                  const SizedBox(height: 20),

                  roundButton('cancel'.tr, noMar: true, onTap: () {
                    signUpController.logoutAlert(title: 'Alert', description: 'Are you sure want to close this session', yes: 'Yes', no: 'No');
                    // Get.back();
                  }),
                ],
              ),
            )),
          ),
        ),
      );
    });
  }
}
