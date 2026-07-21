import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../../core/exports/ui_six_pages.dart';
import '../../../../../core/flavours/constants.dart';
import '../../../../../core/icons/svg_icons.dart';
import '../../../../custom_widgets/unregister.dart';


class PreDrawer extends StatelessWidget {
  const PreDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
        ImagePath.search6;
    images[cms(Fields.SideMenu_Language).textHeading!] = ImagePath.language6;

    images[cms(Fields.SideMenu_RateCalculater).textHeading!] =
        ImagePath.currencyExchange;
    // }
    images[cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading!] =
        ImagePath.bank;
    images[cms(Fields.SideMenu_ContactUsIconAndText).textHeading!] =
        ImagePath.speechBalloon;
    images[cms(Fields.SideMenu_FaqIconAndText).textHeading!] = ImagePath.information;
    images[cms(Fields.SideMenu_TermsAndConditionsIconAndText).textHeading!] =
        ImagePath.locked;
    images[cms(Fields.SideMenu_PrivacyPolicyIconAndText).textHeading!] =
        ImagePath.shield;
    images[cms(Fields.SideMenu_AboutUsIconAndText).textHeading!] =
        ImagePath.information;

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

    return Scaffold(
      backgroundColor: AppConfigs.bodybg(acContrl.isDark),
      body: SafeArea(
        top: false,
        child: GetBuilder<AccountController>(builder: (accountController) {
          return Container(
            decoration: BoxDecoration(
              gradient: AppConfigs.linearGradientUiSix
            ),
            child: Column(
              children: [
                appBar0(cms(Fields.SideMenu_PageHeading).textHeading!,onTap2: (){
                  Get.back();
                }),

                Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Container(
                          width: double.infinity,
                          // height: 139,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                              color: AppConfigs.primaryColor.withOpacity(0.2),
                              gradient: LinearGradient(colors: [Color(0xffdae8ff),Color(0xfffff5f5)],begin: Alignment.topLeft,end: Alignment.bottomRight,transform:GradientRotation(-20))
                          ),
                          child: dashProfileTile(
                              preLogin: true,
                              isDark: accountController.isDark,
                              // bc: accountController.isDark ? AppConfigs.w : null,
                              isDrawer: false,
                              size: 100
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: ["Transfers","Total Sent","Countries","Saved"].map((e)=>Container(
                        //       height: 100,
                        //       width: Get.size.width/4-14,
                        //       padding: EdgeInsets.symmetric(vertical: 20),
                        //       decoration: BoxDecoration(
                        //         color: AppConfigs.w,
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       child: Column(
                        //         children: [
                        //           Text("45",style: TS.f28B,),
                        //           Text(e,style: TS.f14.copyWith(color: AppConfigs.primaryColor.withOpacity(0.5)),),
                        //         ],
                        //       ),
                        //     )).toList(),
                        //   ),
                        // ),
                        Column(
                          children: titles.asMap().entries.map((entry) {
                            int index = entry.key;
                            String e = entry.value;

                            return appDrawerTile(
                              image: images[e]!,
                              height: e == cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!
                                  ? 23
                                  : [
                                cms(Fields.SideMenu_WhatsAppIconAndText).textHeading!,
                                'Deregister'.tr,
                                cms(Fields.SideMenu_Language).textHeading!,
                                cms(Fields.SideMenu_RateCalculater).textHeading!,
                                cms(Fields.SideMenu_FaqIconAndText).textHeading!,
                              ].contains(e)
                                  ? 20
                                  : null,

                              /// Infinite color loop
                              color: AppConfigs.sideMenuColors[index % AppConfigs.sideMenuColors.length],
                              enable:
                              (e == cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading! &&
                                  Box3.settings.enableBranchLocator) ||
                                  (e == cms(Fields.SideMenu_WhatsAppIconAndText).textHeading! &&
                                      Box3.settings.enableWhatsAppChat) ||
                                  (e == 'Pre-Login'.tr && Box3.settings.preLogin) ||
                                  (e !=
                                      cms(Fields.SideMenu_BranchLocatorIconAndText)
                                          .textHeading! &&
                                      e !=
                                          cms(Fields.SideMenu_WhatsAppIconAndText)
                                              .textHeading! &&
                                      e != 'Pre-Login'.tr),

                              title: e,

                              top: e == cms(Fields.SideMenu_MyProfileIconAndText).textHeading!
                                  ? 40
                                  : 15,

                              onTap: () async {
                                if (e == cms(Fields.SideMenu_RateAppIconAndText).textHeading!) {
                                  Get.back();
                                  await rateApp();
                                } else if (e == 'Deregister'.tr) {
                                  unregister();
                                } else if (pages[e] != null) {
                                  Get.to(
                                        () => Scaffold(
                                      backgroundColor:
                                      accountController.isDark ? AppConfigs.b : null,
                                      body: pages[e]!,
                                    ),
                                  );
                                }
                              },
                            );
                          }).toList(),
                        ),
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
                  color: accountController.isDark ? AppConfigs.g21 : AppConfigs.w,
                  alignment: Alignment.center,
                  child: Text(
                    '${AppConfigs.appVersion} +${AppConfigs.buildDate.day.toString().padLeft(2, '0')}${AppConfigs.buildDate.month.toString().padLeft(2, '0')}${AppConfigs.buildDate.year.toString().substring(2)}.${AppConfigs.buildNumber}',
                    style:
                    TextStyles.font12.copyWith(color: AppConfigs.primaryColor),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

