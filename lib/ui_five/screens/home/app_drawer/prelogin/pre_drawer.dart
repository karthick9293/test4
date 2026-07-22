import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_five_custom_widgets.dart';
import '../../../../../core/exports/ui_five_pages.dart';
import '../../../../../core/flavours/constants.dart';
import '../../../../../core/icons/svg_icons.dart';

Widget preDrawer() {
  Get.lazyPut(() => TransactionController());
  final acContrl = Get.isRegistered<AccountController>()
      ? Get.find<AccountController>()
      : Get.put(AccountController());
  List<String> titles = [];
  Map<String, String> images = {};
  Map<String, Widget> pages = {};

  /// titles
  // if (Box3.settings.enableTrackRemittance == true) {
  titles.add(cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!);

  titles.add(cms(Fields.SideMenu_RateCalculater).textHeading!);

  // }
  titles.add(cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_ContactUsIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_FaqIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_TermsAndConditionsIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_PrivacyPolicyIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_AboutUsIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_Language).textHeading!);

  /// images
  // if (Box3.settings.enableTrackRemittance == true) {
  images[cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!] =
      SvgIcons.search;
  images[cms(Fields.SideMenu_Language).textHeading!] = ImagePath.s9;

  images[cms(Fields.SideMenu_RateCalculater).textHeading!] =
      ImagePath.myTransactionBottom;

  // }
  images[cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading!] =
      SvgIcons.branchLocator;
  images[cms(Fields.SideMenu_ContactUsIconAndText).textHeading!] =
      SvgIcons.contactUs;
  images[cms(Fields.SideMenu_FaqIconAndText).textHeading!] = SvgIcons.faq;
  images[cms(Fields.SideMenu_TermsAndConditionsIconAndText).textHeading!] =
      SvgIcons.terms;
  images[cms(Fields.SideMenu_PrivacyPolicyIconAndText).textHeading!] =
      SvgIcons.privacyPolicy;
  images[cms(Fields.SideMenu_AboutUsIconAndText).textHeading!] =
      SvgIcons.aboutUs;

  /// pages
  // if (Box3.settings.enableTrackRemittance == true) {
  pages[cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!] =
      TrackTransactionsPage(fromPrelogin: true);

  // }

  pages[cms(Fields.SideMenu_Language).textHeading!] =
      SelectLanguage(fromMpin: true);
  pages[cms(Fields.SideMenu_RateCalculater).textHeading!] =
      CurrencyRatesPage(isPreLogin: true);

  pages[cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading!] =
      const BranchLocatorPage(isPrelogin: true);
  pages[cms(Fields.SideMenu_ContactUsIconAndText).textHeading!] =
      const ContactUsPage(isPreLogin: true);
  pages[cms(Fields.SideMenu_ContactUsIconAndText).textHeading!] =
      const ContactUsPage(isPreLogin: true);
  pages[cms(Fields.SideMenu_FaqIconAndText).textHeading!] =
      const FAQPage(isPreLogin: true);
  pages[cms(Fields.SideMenu_TermsAndConditionsIconAndText).textHeading!] =
      const TermsAndConditionsPage(isPreLogin: true);
  pages[cms(Fields.SideMenu_PrivacyPolicyIconAndText).textHeading!] =
      const PrivacyPolicyPage(isPrelogin: true);
  pages[cms(Fields.SideMenu_AboutUsIconAndText).textHeading!] =
      const AboutUsPage(fromPrelogin: true);

  return Drawer(
    backgroundColor:
        acContrl.isDark ? const Color(0xFF0B0F1E) : AppConfigs.bodybg(false),
    shadowColor: acContrl.isDark ? Colors.black.withOpacity(0.5) : null,
    elevation: 20,
    width: 260,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
    child: SafeArea(
      top: false,
      child: GetBuilder<AccountController>(builder: (accountController) {
        return Column(
          children: [
            Container(
              width: 260,
              height: 139,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(20)),
                  gradient: accountController.isDark
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF0A1932),
                            Color(0xFF080E1C),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                  color: accountController.isDark
                      ? null
                      : AppConfigs.primaryColor),
              child: dashProfileTile(
                preLogin: true,
                isDark: accountController.isDark,
                // bc: accountController.isDark ? AppConfigs.w : null,
                isDrawer: true,
              ),
            ),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              children: [
                Column(
                    children: titles
                        .map((e) => appDrawerTile(
                            image: images[e]!,
                            height: e ==
                                    cms(Fields.SideMenu_WhatsAppIconAndText)
                                        .textHeading!
                                ? 20
                                : e == 'Deregister'.tr
                                    ? 20
                                    : e ==
                                            cms(Fields.SideMenu_Language)
                                                .textHeading!
                                        ? 20
                                        : e ==
                                                cms(Fields.SideMenu_RateCalculater)
                                                    .textHeading!
                                            ? 20
                                            : e ==
                                                    cms(Fields.SideMenu_FaqIconAndText)
                                                        .textHeading!
                                                ? 20
                                                : e ==
                                                        cms(Fields.SideMenu_TrackRemittanceIconAndText)
                                                            .textHeading!
                                                    ? 23
                                                    : null,
                            enable: (e ==
                                        cms(Fields.SideMenu_BranchLocatorIconAndText)
                                            .textHeading! &&
                                    (AppConfigs.fetchNewConfig
                                        ? Box3.settings.enableBranchLocator
                                        : Box3.settings.enableBranchLocator)) ||
                                (e ==
                                        cms(Fields.SideMenu_WhatsAppIconAndText)
                                            .textHeading! &&
                                    (AppConfigs.fetchNewConfig
                                        ? Box3.settings.enableWhatsAppChat
                                        : (Box3
                                            .settings.enableWhatsAppChat))) ||
                                (e == 'Pre-Login'.tr &&
                                    (Box3.settings.preLogin)) ||
                                (e !=
                                        cms(Fields.SideMenu_BranchLocatorIconAndText)
                                            .textHeading! &&
                                    e !=
                                        cms(Fields.SideMenu_WhatsAppIconAndText)
                                            .textHeading! &&
                                    e != 'Pre-Login'),
                            title: e,
                            onTap: () async {
                              // if (e == 'Admin_Settings'.tr) {
                              //   accountController
                              //     ..tempConfig = accountController.clientConfig
                              //     ..idLabelController.text =
                              //         accountController.tempConfig.idNoLabel
                              //     ..transLimitCtrlr.text =
                              //         accountController.tempConfig.maxAmtAllowedWOKyc ?? '';
                              //
                              //   Get.toNamed(AppRoutes.adminSettings);
                              // } else
                              if (e ==
                                  cms(Fields.SideMenu_RateAppIconAndText)
                                      .textHeading!) {
                                Get.back();
                                await rateApp();
                              } else if (e == 'Deregister'.tr) {
                                // await deviceExistsWithAnotherCivilId();
                                unregister();
                              } else if (pages[e] != null) {
                                // Get.find<MainController>()
                                //   ..fromAmtCtrl.clear()
                                //   ..toAmtCtrl.clear()
                                //   ..update();Todo: Uncomment if clearance required in prelogin
                                Get.to(() => Scaffold(
                                    backgroundColor: accountController.isDark
                                        ? AppConfigs.b
                                        : null,
                                    body: pages[e]!));
                              }
                            },
                            top: e == cms(Fields.SideMenu_MyProfileIconAndText).textHeading! ? 40 : 15))
                        .toList()),
                // appDrawerTile(
                //     image: SvgIcons.logout,
                //     enable: true,
                //     title: 'logout'.tr,
                //     top: 15,
                //     onTap: logoutAlert)
              ],
            )),
            Container(
              height: 50,
              color: accountController.isDark
                  ? const Color(0xFF0A1932)
                  : AppConfigs.w,
              alignment: Alignment.center,
              child: Text(
                '${AppConfigs.appVersion} ${AppConfigs.buildDate.day.toString().padLeft(2, '0')}${AppConfigs.buildDate.month.toString().padLeft(2, '0')}${AppConfigs.buildDate.year.toString().substring(2)}.${AppConfigs.buildNumber}',
                style:
                    TextStyles.font12.copyWith(color: AppConfigs.primaryColor),
              ),
            ),
          ],
        );
      }),
    ),
  );
}
