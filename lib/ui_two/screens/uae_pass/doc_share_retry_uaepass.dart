import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../models/uae_pass/uae_pass_profile_fz.dart';

class DocShareRetryUaepass extends StatelessWidget {
  const DocShareRetryUaepass({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String message = arguments['message'];
    String authToken = arguments['authToken'];
    UaePassProfileFz? kycBV = Box3.uaePassProfileFz;

    return GetBuilder<SignUpController>(builder: (signUpController) {
      signUpController.uaeLButtonLoading = false;
      signUpController.loading = false;
      signUpController.fillForm(kycBV!);
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
          appBar: appBar0('Document Sharing Request', disableBack: true),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SvgPicture.asset(uaeSvg, height: 80),
                    Text(
                      'UAE PASS',
                      style: TS.f22.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppConfigs.contentTextWhite2(
                              signUpController.isDark)),
                    )
                  ],
                ),
                Text(
                  'UAE PASS Document Sharing',
                  style: TS.f18.copyWith(
                      color: AppConfigs.contentTextWhite2(
                          signUpController.isDark)),
                ),
                const SizedBox(height: 10),
                Text(
                  'Share authentic and up to date documents eliminating the need for paper and physical visits',
                  style: TS.f14.copyWith(
                      color: AppConfigs.contentTextWhite2(
                          signUpController.isDark)),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                      color: AppConfigs.g8f.withOpacity(0.14),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please ensure',
                        style: TS.f14.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppConfigs.contentTextWhite2(
                                signUpController.isDark)),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '● You have added following documents in your UAE PASS app\n\n1.Emirates ID${kycBV.nationalityEN == 'ARE' ? '\n2.Passport (UAE Citizen)' : signUpController.gccCountries.contains(signUpController.uaePassProfileFz?.nationalityEN) ? "" : '\n2.ResidenceVisa (UAE Resident)'}',
                        style: TS.f14.copyWith(
                            color: AppConfigs.contentTextWhite2(
                                signUpController.isDark)),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                signUpController.uaePassLoading
                    ? loader()
                    : UAEButton(
                        'Continue with UAE PASS',
                        onTap: () async {
                          signUpController.uaePassLoading = true;
                          signUpController.update();
                          signUpController.documentSharingRequest(
                            authToken: authToken,
                            uaePassProfileFz: kycBV,
                            isFromPopup: true,
                          );

                          // if (Get.currentRoute != AppRoutes.loadingRoutes) {
                          //   await Get.toNamed(AppRoutes.loadingRoutes);
                          // }
                          // Get.back();
                        },
                      ),
                HyperLinkButton(
                  'Cancel',
                  onTap: () {
                    signUpController.logoutAlert(
                        title: 'Alert',
                        description:
                            'Are you sure want to close the application',
                        yes: 'Yes',
                        no: 'No');
                    // signUpController.signUpAttributes.nidConroller.clear();
                    // signUpController.signUpAttributes.mobile.clear();
                    // Get.back();
                    // Get.back();
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
