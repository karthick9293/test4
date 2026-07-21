import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../models/uae_pass/uae_pass_profile_fz.dart';
import '../../../network/api_service_new.dart';

class NotificationNotExpiredRetryUaepass extends StatelessWidget {
  const NotificationNotExpiredRetryUaepass({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String token = arguments['token'] ?? '';
    String emiratesID = arguments['emiratesID'] ?? '';
    String documentType = arguments['documentType'] ?? '';
    String uuid = arguments['uuid'] ?? '';
    String isFrom = arguments['isFrom'] ?? '';
    UaePassProfileFz kycBV = Box3.uaePassProfileFz!;

    return GetBuilder<SignUpController>(builder: (signUpController) {
      signUpController.uaeLButtonLoading = false;
      signUpController.loading = false;
      signUpController.fillForm(kycBV);
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
          body: SafeArea(
            child: Padding(
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

                            switch (isFrom) {
                              case "signup":
                                break;
                              case "deeplink":
                                break;
                            }

                            await ApiService().openUAEPassDoc(
                                token: token,
                                emiratesID: emiratesID,
                                documentType: documentType,
                                uuid: uuid);
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
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
