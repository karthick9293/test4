import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../core/exports/ui_four_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../sign_up/compenents/device_exists_with_another_civil_id.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    String authenticationMethod2 = (Box3.settings.LOGINAUTHENTICATIONSECONDARY);
    Widget title(String title, bool isDark) {
      return Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: isDark ? AppConfigs.w : ConstColors.greyd7)),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TS.f14
              .copyWith(color: isDark ? AppConfigs.w : AppConfigs.accentColor),
        ),
      );
    }

    return Column(
      children: [
        Expanded(child: GetBuilder<MainController>(builder: (mainController) {
          return ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              title(cms(Fields.Setting_Security).textHeading!,
                  mainController.isDark),
              Visibility(
                visible: authenticationMethod2 == 'MPIN' ||
                    authenticationMethod2 == 'PASSWORD_MPIN',
                child: GestureDetector(
                  onTap: () => mainController
                    ..push(const ChangeMPINFormRulesPage(),
                        appBar0('Change_MPIN'.tr))
                    // ..push(const ChangeMPIN(), appBar0('Change_MPIN'.tr))
                    ..pinAttributes.clear(),
                  child: securitySettingsTile(
                      disableBoder: true,
                      image: ImagePath.s1,
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: SvgPicture.asset(ImagePath.downArrow)),
                      ),
                      c1: 'Change_MPIN'.tr,
                      c2: '●●●●●●●●'),
                ),
              ),
              Visibility(
                visible: authenticationMethod2 == 'PASSWORD' ||
                    authenticationMethod2 == 'PASSWORD_MPIN',
                child: GestureDetector(
                  onTap: () => mainController
                    // ..push(const ChangePassword(), AppBars.changePassword)
                    ..push(
                        ChangePasswordFormRulesPage(), AppBars.changePassword)
                    ..pwdAttributes.clear(),
                  child: securitySettingsTile(
                      disableBoder: true,
                      image: ImagePath.s1,
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: SvgPicture.asset(ImagePath.downArrow)),
                      ),
                      c1: 'change_password'.tr,
                      c2: '●●●●●●●●'),
                ),
              ),
              Visibility(
                visible: Box3.settings.enableDeRegistration,
                child: GestureDetector(
                  onTap: () => deviceExistsWithAnotherCivilId(),
                  child: securitySettingsTile(
                      disableBoder: true,
                      svgData: SvgIcons.deviceVerify,
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: SvgPicture.asset(ImagePath.downArrow)),
                      ),
                      c1: 'Deregister device',
                      c2: 'Device can be logged in with any other account'),
                ),
              ),
              Visibility(
                visible: (Box3.settings.enableBiometric) &&
                    authController.isBiometricAvailable,
                child: securitySettingsTile(
                    disableBoder: true,
                    value: mainController.isBiometric,
                    onToggle: (b) async {
                      if (b) {
                        if (await authController.authenticateWithBioMetric()) {
                          await Box3.setBiometric(b);
                          mainController
                            ..isBiometric = Box3.isBiometricEnabled ?? false
                            ..update();
                        }
                      } else {
                        await Box3.setBiometric(b);
                        mainController
                          ..isBiometric = Box3.isBiometricEnabled ?? false
                          ..update();
                      }
                    },
                    image: ImagePath.s4,
                    c1: 'Set faceID/Fingerprint'.tr,
                    c2: 'secure_your_app_using_fingerprint'.tr),
              ),
              title(cms(Fields.Setting_Appearance).textHeading!,
                  mainController.isDark),
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  width: 70,
                  child: SvgPicture.asset(
                    ImagePath.s10,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      mainController.isDark
                          ? AppConfigs.w
                          : const Color(0xFF8B8B8B),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        radioTile(
                          mainController.themeType == ThemeType.light,
                          'Light'.tr,
                          onTap: () async =>
                              await mainController.updateTheme(ThemeType.light),
                        ),
                        const SizedBox(width: 15),
                        radioTile(
                          mainController.themeType == ThemeType.dark,
                          'Dark'.tr,
                          onTap: () async =>
                              await mainController.updateTheme(ThemeType.dark),
                        ),
                        const SizedBox(width: 15),
                      ],
                    ),
                    Text("Select_theme_as_per_your_choice".tr,
                        style: TS.f12.copyWith(
                            color: mainController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.g77),
                        textAlign: TextAlign.start)
                  ],
                )
              ]),
              title(cms(Fields.Setting_Language).textHeading!,
                  mainController.isDark),
              GestureDetector(
                onTap: () => mainController.push(
                    const SelectLanguage(), AppBars.selectLanguage),
                child: securitySettingsTile(
                    disableBoder: true,
                    image: ImagePath.s9,
                    trailing: const SizedBox(),
                    c1: 'change_language'.tr,
                    c2: 'update_language'.tr),
              ),
            ],
          );
        }))
      ],
    );
  }
}
