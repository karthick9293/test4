import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../core/exports/ui_seven_pages.dart';
import '../../../core/flavours/constants.dart';
import '../../../models/uae_pass/uae_pass_profile_fz.dart';
import '../sign_up/uae_details_confirm.dart';

class DocShareRetryVisualizationUaepass extends StatelessWidget {
  const DocShareRetryVisualizationUaepass({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String msg = arguments['msg'] ?? '';
    String isFrom = arguments['isFrom'] ?? '';
    String type = arguments['type'] ?? '';
    UaePassProfileFz? kycBV = Box3.uaePassProfileFz;
    // KycBV kycBV = arguments['kycBV'];

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
                          Get.find<AccountController>().retryLoading = true;
                          Get.find<SignUpController>().docShareRetry = true;
                          signUpController.update();
                          // Get.back();
                          if (await Get.find<SignUpController>()
                              .isUAEPassDataDetails(isFromSignUp: isFrom)) {
                            var data =
                                Get.find<SignUpController>().uaePassData?[0];
                            var urls = Get.find<SignUpController>().urls;
                            var formData =
                                Get.find<SignUpController>().formData;
                            Get.find<AccountController>().retryLoading = false;
                            // signUpController.retryLoading = false;
                            Get.find<SignUpController>().docShareRetry = false;
                            signUpController.update();
                            // Get.back();

                            if (data?.reqAuthorized == 'I' ||
                                data?.reqAuthorized == 'Y') {
                              Get.showSnackbar(GetSnackBar(
                                messageText: Text(
                                  "Profile data received successfully from UAE PASS.",
                                  style: TS.f14.copyWith(color: AppConfigs.w),
                                ),
                                backgroundColor:
                                    (AppConfigs.dg).withOpacity(0.7),
                                duration: const Duration(seconds: 2),
                              ));
                              Get.to(() => UAEConfirmDetails(formData,
                                  () => Get.toNamed(AppRoutes.signUp), urls));
                              signUpController.uaePassLoading = false;
                              signUpController.update();
                            }
                          } else {
                            signUpController.uaePassLoading = false;
                            signUpController.update();
                            // Get.find<SignUpController>().signUpAttributes.nidConroller.clear();
                            // Get.find<SignUpController>().signUpAttributes.mobile.clear();
                            Get.find<AccountController>().retryLoading = false;
                            signUpController.update();
                            Get.back();
                          }
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
