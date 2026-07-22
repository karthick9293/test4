import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../core/exports/ui_seven_pages.dart';
import '../../../core/flavours/constants.dart';

class NotificationNotExpiredRetry extends StatelessWidget {
  const NotificationNotExpiredRetry({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String msg = arguments['msg'] ?? '';
    String token = arguments['token'] ?? '';
    String emiratesID = arguments['emiratesID'] ?? '';
    String documentType = arguments['documentType'] ?? '';
    String uuid = arguments['uuid'] ?? '';
    String isFrom = arguments['isFrom'] ?? '';
    List<String> gccCountries = ["BHR", "KWT", "OMN", "QAT", "SAU"];
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
                            Get.toNamed(
                                AppRoutes
                                    .notificationNotExpiredRetryRoutesUAEPASS,
                                arguments: {
                                  "token": Get.find<SignUpController>()
                                          .uaePassAuthToken ??
                                      '',
                                  "emiratesID": Get.find<SignUpController>()
                                          .uaePassProfileFz
                                          ?.idn ??
                                      '',
                                  "documentType": Get.find<SignUpController>()
                                              .uaePassProfileFz
                                              ?.nationalityEN ==
                                          'ARE'
                                      ? 'Passport'
                                      : gccCountries.contains(
                                              Get.find<SignUpController>()
                                                  .uaePassProfileFz
                                                  ?.nationalityEN)
                                          ? ""
                                          : 'ResidenceVisa',
                                  "uuid": Get.find<SignUpController>()
                                          .uaePassProfileFz
                                          ?.uuid ??
                                      '',
                                  "isFrom": "deeplink",
                                });
                          }),
                    const SizedBox(
                      height: 10,
                    ),
                    roundButton('cancel'.tr, noMar: true, onTap: () {
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
