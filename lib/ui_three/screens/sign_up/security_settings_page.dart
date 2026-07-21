import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_three_custom_widgets.dart';
import '../../../core/exports/ui_three_pages.dart';
import '../../../core/flavours/constants.dart';

class SecuritySettingsPage extends StatelessWidget {
  const SecuritySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController a = Get.find<AccountController>();
    return GetBuilder<AccountController>(builder: (accountController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        body: Column(
          children: [
            appBar0('security_setting'.tr, onTap2: Get.back),
            Expanded(
                child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                securitySettingsTile(
                    image: ImagePath.changePassword,
                    value: a.ssp.pin,
                    c1: 'set_pin'.tr,
                    c2: 'secure_your_app_using_PIN'.tr,
                    onToggle: (v) {
                      a
                        ..ssp.pin = v
                        ..update();
                    }),
                securitySettingsTile(
                    image: ImagePath.faceId,
                    value: a.ssp.faceId,
                    c1: 'set_face_id'.tr,
                    c2: 'secure_your_app_using_face_id'.tr,
                    onToggle: (v) {
                      a
                        ..ssp.faceId = v
                        ..update();
                    }),
                securitySettingsTile(
                    image: ImagePath.fingerprint,
                    value: a.ssp.biometric,
                    c1: 'set_biometric'.tr,
                    c2: 'secure_your_app_using_fingerprint'.tr,
                    onToggle: (v) {
                      a
                        ..ssp.biometric = v
                        ..update();
                    }),
                securitySettingsTile(
                    image: ImagePath.uadhiId,
                    value: a.ssp.uidai,
                    c1: 'set_UADHI'.tr,
                    c2: 'secure_your_app_using_aadhar'.tr,
                    onToggle: (v) {
                      a
                        ..ssp.uidai = v
                        ..update();
                    })
              ],
            )),
            accountController.loading
                ? loader(bottom: 20)
                : roundButton(
                    'save'.tr,
                    onTap: () async {
                      accountController
                        ..loading = true
                        ..update();
                      await Future.delayed(const Duration(seconds: 1));
                      await Box3.setKYCStatus(KYCStatus.complete);
                      await Box3.setStatus(AppStatus.loggedIn);
                      Get
                        ..find<AccountController>().kycStatus =
                            KYCStatus.complete
                        ..find<MainController>().key =
                            GlobalKey<ScaffoldState>()
                        ..put(AuthController())
                        ..offNamedUntil(AppRoutes.main, (route) => false);
                    },
                  )
          ],
        ),
      );
    });
  }
}
