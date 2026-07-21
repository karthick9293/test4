import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_three_custom_widgets.dart';
import '../../../../core/exports/ui_three_pages.dart';
import '../../../../core/flavours/constants.dart';

Widget appDrawer() {
  Get.lazyPut(() => TransactionController());
  List<String> titles = [];
  Map<String, String> images = {};
  Map<String, Widget> pages = {};
  Map<String, PreferredSizeWidget> appBar = {};

  // titles
  titles.add(cms(Fields.SideMenu_MyProfileIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_SettingsIconAndText).textHeading!);
  // if (Box3.settings.enableSetForexBooking == true) {
  titles.add(cms(Fields.SideMenu_ForexBookingIconAndText).textHeading!);
  // }
  // if (Box3.settings.enableTrackRemittance == true) {
  titles.add(cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!);
  // }

  // titles.add('Admin Settngs'.tr);
  // titles.add('Pre-Login'.tr);
  // titles.add('refer_earn'.tr);
  titles.add(cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading!);
  if (Box3.settings.enableLoyalty == true) {
    titles.add(cms(Fields.SideMenu_OffersIconAndText).textHeading!);
  }
  titles.add(cms(Fields.SideMenu_RateAppIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_AboutUsIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_PrivacyPolicyIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_WhatsAppIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_TermsAndConditionsIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_ContactUsIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_FaqIconAndText).textHeading!);
  titles.add(cms(Fields.SideMenu_ReportFraudIconAndText).textHeading!);

  // images
  images[cms(Fields.SideMenu_MyProfileIconAndText).textHeading!] =
      SvgIcons.myProfile;
  images[cms(Fields.SideMenu_SettingsIconAndText).textHeading!] =
      SvgIcons.setting;

  // if (Box3.settings.enableSetForexBooking == true) {
  images[cms(Fields.SideMenu_ForexBookingIconAndText).textHeading!] =
      SvgIcons.forexRate;
  // }
  // if (Box3.settings.enableTrackRemittance == true) {
  images[cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!] =
      SvgIcons.search;
  // }

  images['Admin Settngs'.tr] = SvgIcons.setting;
  images['Pre-Login'.tr] = SvgIcons.setting;
  images['refer_earn'.tr] = SvgIcons.referAndEarn;
  images['rate_app'.tr] = SvgIcons.referAndEarn;
  images[cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading!] =
      SvgIcons.branchLocator;
  if (Box3.settings.enableLoyalty == true) {
    images[cms(Fields.SideMenu_OffersIconAndText).textHeading!] =
        SvgIcons.offer;
  }
  images[cms(Fields.SideMenu_RateAppIconAndText).textHeading!] =
      SvgIcons.rateMyApp;
  images[cms(Fields.SideMenu_AboutUsIconAndText).textHeading!] =
      SvgIcons.aboutUs;
  images[cms(Fields.SideMenu_PrivacyPolicyIconAndText).textHeading!] =
      SvgIcons.privacyPolicy;
  images[cms(Fields.SideMenu_WhatsAppIconAndText).textHeading!] =
      SvgIcons.whatsapp;
  images[cms(Fields.SideMenu_TermsAndConditionsIconAndText).textHeading!] =
      SvgIcons.terms;
  images[cms(Fields.SideMenu_ContactUsIconAndText).textHeading!] =
      SvgIcons.contactUs;
  images[cms(Fields.SideMenu_FaqIconAndText).textHeading!] = SvgIcons.faq;
  images[cms(Fields.SideMenu_ReportFraudIconAndText).textHeading!] =
      SvgIcons.reportFraud;

  // pages
  pages[cms(Fields.SideMenu_MyProfileIconAndText).textHeading!] =
      const MyProfilePage();
  // pages['settings'.tr] = const SettingsPage();

  // if (Box3.settings.enableTrackRemittance == true) {
  pages[cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!] =
      TrackTransactionsPage();
  // }
  pages[cms(Fields.SideMenu_ForexBookingIconAndText).textHeading!] =
      SetForexRatePage();
  pages[cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading!] =
      const BranchLocatorPage();
  if (Box3.settings.enableLoyalty == true) {
    pages[cms(Fields.SideMenu_OffersIconAndText).textHeading!] =
        const OfferPage();
  }
  // pages['rate_app'.tr] = ImagePath.rateMyApp;
  pages[cms(Fields.SideMenu_AboutUsIconAndText).textHeading!] =
      const AboutUsPage();
  pages[cms(Fields.SideMenu_PrivacyPolicyIconAndText).textHeading!] =
      const PrivacyPolicyPage();
  pages[cms(Fields.SideMenu_WhatsAppIconAndText).textHeading!] =
      const ChatWithUsPage();
  pages[cms(Fields.SideMenu_TermsAndConditionsIconAndText).textHeading!] =
      const TermsAndConditionsPage();
  pages[cms(Fields.SideMenu_ContactUsIconAndText).textHeading!] =
      const ContactUsPage();
  pages[cms(Fields.SideMenu_FaqIconAndText).textHeading!] = const FAQPage();
  pages[cms(Fields.SideMenu_ReportFraudIconAndText).textHeading!] =
      ReportFraudPage();

  // appbars
  appBar[cms(Fields.SideMenu_MyProfileIconAndText).textHeading!] =
      AppBars.myProfile;
  appBar[cms(Fields.SideMenu_SettingsIconAndText).textHeading!] =
      AppBars.settings;

  // if (Box3.settings.enableSetForexBooking == true) {
  appBar[cms(Fields.SideMenu_ForexBookingIconAndText).textHeading!] =
      AppBars.setForexRates;
  // }
  // if (Box3.settings.enableTrackRemittance == true) {
  appBar[cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!] =
      AppBars.trackTransaction;
  // }

  // appBar['Admin Settngs'.tr] = SvgIcons.setting;
  // appBar['Pre-Login'.tr] = SvgIcons.setting;
  // appBar['refer_earn'.tr] = SvgIcons.referAndEarn;
  appBar[cms(Fields.SideMenu_BranchLocatorIconAndText).textHeading!] =
      AppBars.branchLocator;
  if (Box3.settings.enableLoyalty == true) {
    appBar[cms(Fields.SideMenu_OffersIconAndText).textHeading!] = AppBars.offer;
  }
  // appBar['rate_app'.tr] = SvgIcons.rateMyApp;
  appBar[cms(Fields.SideMenu_AboutUsIconAndText).textHeading!] =
      AppBars.aboutUs;
  appBar[cms(Fields.SideMenu_PrivacyPolicyIconAndText).textHeading!] =
      AppBars.privacyPolicy;
  appBar[cms(Fields.SideMenu_WhatsAppIconAndText).textHeading!] =
      AppBars.chatWithUs;
  appBar[cms(Fields.SideMenu_TermsAndConditionsIconAndText).textHeading!] =
      AppBars.termsAndConditions;
  appBar[cms(Fields.SideMenu_ContactUsIconAndText).textHeading!] =
      AppBars.contactUs;
  appBar[cms(Fields.SideMenu_FaqIconAndText).textHeading!] = AppBars.faq;
  appBar[cms(Fields.SideMenu_ReportFraudIconAndText).textHeading!] =
      AppBars.reportaFraud;

  logoutAlert() {
    Get.dialog(
        yesOrNoAlert(
            title: cms(Fields.LogoutAlert_PageHeading).textHeading!,
            body: cms(Fields.LogoutAlert_ImageAndText).textHeading!,
            yesText: cms(Fields.PopUp_LogOut).textHeading!,
            noText: cms(Fields.PopUp_Cancel).textHeading!,
            hideIcon: true,
            onTap: () async {
              await Get.find<AccountController>().userLogout();
            }),
        barrierColor: Get.find<AccountController>().isDark
            ? AppConfigs.w.withOpacity(0.2)
            : null);
  }

  return Drawer(
    backgroundColor: AppConfigs.bodybg(Get.find<AccountController>().isDark),
    width: 307,
    shadowColor: Get.find<AccountController>().isDark ? AppConfigs.g8f : null,
    elevation: 20,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
    child: SafeArea(
      top: false,
      child: GetBuilder<AccountController>(builder: (accountController) {
        return Column(
          children: [
            Container(
              width: 307,
              height: 139,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(20)),
                  color: AppConfigs.primaryColor),
              child: GestureDetector(
                  onTap: () => Get.find<MainController>()
                    ..key.currentState?.closeEndDrawer()
                    ..push(const MyProfilePage(), AppBars.myProfile,
                        fromAppDrawer: true),
                  child: dashProfileTile(
                      isDark: accountController.isDark,
                      isDrawer: true,
                      image: Get.find<DataController>().customerImage)),
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
                            height: e == cms(Fields.SideMenu_WhatsAppIconAndText).textHeading! ||
                                    e ==
                                        cms(Fields.SideMenu_OffersIconAndText)
                                            .textHeading! ||
                                    e ==
                                        cms(Fields.SideMenu_MyProfileIconAndText)
                                            .textHeading! ||
                                    e ==
                                        cms(Fields.SideMenu_FaqIconAndText)
                                            .textHeading!
                                ? 20
                                : e == cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading! ||
                                        e ==
                                            cms(Fields.SideMenu_ReportFraudIconAndText)
                                                .textHeading!
                                    ? 25
                                    : null,
                            enable: (e ==
                                        cms(Fields.SideMenu_BranchLocatorIconAndText)
                                            .textHeading! &&
                                    (AppConfigs.fetchNewConfig
                                        ? Box3.settings.enableBranchLocator
                                        : Box3.settings.enableBranchLocator)) ||
                                (e == cms(Fields.SideMenu_WhatsAppIconAndText).textHeading! &&
                                    (AppConfigs.fetchNewConfig
                                        ? Box3.settings.enableWhatsAppChat
                                        : (Box3
                                            .settings.enableWhatsAppChat))) ||
                                (e == 'Pre-Login'.tr &&
                                    (Box3.settings.preLogin)) ||
                                (e ==
                                    cms(Fields.SideMenu_OffersIconAndText)
                                        .textHeading!
                                // &&
                                //     ((Box3.settings.loyalty))
                                ) ||
                                (e != cms(Fields.SideMenu_ReferAndEarnIconAndText).textHeading! &&
                                    e !=
                                        cms(Fields.SideMenu_WhatsAppIconAndText)
                                            .textHeading! &&
                                    e != 'Pre-Login' &&
                                    e != cms(Fields.SideMenu_OffersIconAndText).textHeading!),
                            title: e,
                            onTap: () async {
                              if (e ==
                                  cms(Fields.SideMenu_RateAppIconAndText)
                                      .textHeading!) {
                                Get.back();
                                await rateApp();
                              } else if (e ==
                                  cms(Fields.SideMenu_SettingsIconAndText)
                                      .textHeading!) {
                                Get.find<MainController>()
                                  ..key.currentState?.closeEndDrawer()
                                  ..push(SettingsPage(), appBar[e],
                                      fromAppDrawer: true);
                              } else if (e ==
                                  cms(Fields.SideMenu_ReferAndEarnIconAndText)
                                      .textHeading!) {
                                await alertDialog(
                                    noPad: true,
                                    borderRadius: 11,
                                    title: 'Invite_Earn'.tr,
                                    top: 7,
                                    body: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "Invite_your_friends_on_CASMEX"
                                                  .tr,
                                              style: TextStyles.font12.copyWith(
                                                  color:
                                                      accountController.isDark
                                                          ? AppConfigs.g77
                                                          : AppConfigs.g8f,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 13),
                                          alignment: Alignment.center,
                                          child:
                                              SvgPicture.asset(ImagePath.refer),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width: 221,
                                            child: Row(
                                              children: [
                                                Text("Code:2022".tr,
                                                    style: TS.f12.copyWith(
                                                        color: accountController
                                                                .isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs
                                                                .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.start),
                                                const Spacer(),
                                                GestureDetector(
                                                  onTap: () async {
                                                    await Clipboard.setData(
                                                        const ClipboardData(
                                                            text: '2022'));
                                                    Get.showSnackbar(
                                                        GetSnackBar(
                                                      message: 'Code_Copied'.tr,
                                                      backgroundColor:
                                                          Colors.green,
                                                      duration: const Duration(
                                                          seconds: 1),
                                                    ));
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    alignment: Alignment.center,
                                                    child: SvgPicture.asset(
                                                      ImagePath.copyIcon,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              accountController
                                                                      .isDark
                                                                  ? AppConfigs
                                                                      .g8f
                                                                  : AppConfigs
                                                                      .g4,
                                                              BlendMode.srcIn),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Share.share('2022');
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 40,
                                                    alignment: Alignment.center,
                                                    child: SvgPicture.asset(
                                                      ImagePath.shareIcon,
                                                      colorFilter:
                                                          ColorFilter.mode(
                                                              accountController
                                                                      .isDark
                                                                  ? AppConfigs
                                                                      .g8f
                                                                  : AppConfigs
                                                                      .g4,
                                                              BlendMode.srcIn),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 43,
                                          decoration: BoxDecoration(
                                              color: AppConfigs.primaryColor
                                                  .withOpacity(0.3)),
                                          alignment: Alignment.center,
                                          child: Text("Get_cashback_up_to".tr,
                                              style: TextStyles.font16.copyWith(
                                                  color:
                                                      accountController.isDark
                                                          ? AppConfigs.g8f
                                                          : AppConfigs.g4,
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.start),
                                        )
                                      ],
                                    ));
                              }

                              // else if (e ==
                              //     cms(Fields.SideMenu_WhatsAppIconAndText)
                              //         .textHeading!) {
                              //   String whatsapp = accountController
                              //           .contactUs?.data?.companyName ??
                              //       '-';
                              //   // try {
                              //   //   if (Platform.isAndroid) {
                              //   //     var androidUrl = Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
                              //   //     await launchUrl(androidUrl, mode: LaunchMode.externalNonBrowserApplication);
                              //   //   } else if (Platform.isIOS) {
                              //   //     var iosUrl = "https://wa.me/$whatsapp?text=${Uri.parse('hello')}";
                              //   //     await launchUrl(Uri.parse(iosUrl));
                              //   //   }
                              //   // } on Exception {
                              //   //   ScaffoldMessenger.of(Get.context!).showSnackBar(
                              //   //     SnackBar(
                              //   //       content: Text("WhatsApp_is_not_installed_on_the_device".tr),
                              //   //     ),
                              //   //   );
                              //   // }
                              //
                              //   // } else if (e ==
                              //   //     cms(Fields.SideMenu_OffersIconAndText)
                              //   //         .textHeading!) {
                              // }

                              //Rahul
                              else if (e ==
                                  cms(Fields.SideMenu_WhatsAppIconAndText)
                                      .textHeading!) {
                                Get.back();
                                String whatsapp = accountController
                                        .contactUs?.data?.phoneNo ??
                                    '910506180856';
                                try {
                                  if (Platform.isAndroid) {
                                    var androidUrl = Uri.parse(
                                        "whatsapp://send?phone=$whatsapp&text=hello");
                                    await launchUrl(
                                      androidUrl,
                                      mode: LaunchMode
                                          .externalNonBrowserApplication,
                                    );
                                  } else if (Platform.isIOS) {
                                    var iosUrl = Uri.parse(
                                        "https://wa.me/$whatsapp?text=${Uri.encodeComponent('hello')}");
                                    await launchUrl(iosUrl);
                                  }
                                } catch (e) {
                                  ScaffoldMessenger.of(Get.context!)
                                      .showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          "WhatsApp_is_not_installed_on_the_device"
                                              .tr),
                                    ),
                                  );
                                }
                              } else if (pages[e] != null) {
                                if (e ==
                                    cms(Fields.SideMenu_OffersIconAndText)
                                        .textHeading!) {
                                  if (Get.isRegistered<TransferController>()) {
                                    Get.find<TransferController>()
                                        .reset(t: TransferType.all);
                                  } else {
                                    Get.put(
                                        TransferController(
                                            transferType: TransferType.all),
                                        permanent: true);
                                  }
                                }
                                Get.find<MainController>()
                                  ..key.currentState?.closeEndDrawer()
                                  ..push(pages[e]!, appBar[e],
                                      fromAppDrawer: true);
                              } else if (e ==
                                  cms(Fields.SideMenu_ForexBookingIconAndText)
                                      .textHeading!) {
                                if (Box3.settings.EnableSetForexBooking ==
                                    true) {
                                  if (Box3.fetchUAEPassDoc?.visualizationExpiry
                                              ?.toLocal() !=
                                          null &&
                                      Box3.fetchUAEPassDoc?.reqAuthorized ==
                                          'I') {
                                    AccountController a =
                                        Get.find<AccountController>();
                                    if (a.contactUs == null) {
                                      a.getContactUs();
                                    }
                                    if (!Get.isRegistered<KycController>()) {
                                      Get.put(KycController());
                                    }
                                    var expDate = Box3
                                        .fetchUAEPassDoc?.visualizationExpiry
                                        ?.toLocal();
                                    int expiryDays = (DateTime(
                                                expDate!.year,
                                                expDate.month,
                                                expDate.day,
                                                expDate.hour,
                                                expDate.minute)
                                            .toLocal())
                                        .difference(DateTime(
                                                DateTime.now().year,
                                                DateTime.now().month,
                                                DateTime.now().day,
                                                DateTime.now().hour,
                                                DateTime.now().minute)
                                            .toLocal())
                                        .inHours;

                                    Get.put(AccountController());

                                    if (expiryDays <= 0) {
                                      if (Get.currentRoute !=
                                          AppRoutes.visualizationRetryRoutes) {
                                        Get.to(const RetryVisualization(),
                                            arguments: {
                                              "msg":
                                                  'There was an error while fetching your documents from UAE PASS. Please retry'
                                                      .tr,
                                              "type": 'P',
                                              "isFrom": 'Dash'
                                            });
                                      }

                                      // Get.dialog(retryAlert(msg: 'There was an error while fetching your documents from UAE PASS. Please retry'.tr, type: 'P', isFrom: 'Dash'));
                                    } else {
                                      Get.dialog(updateProfileBody(
                                          msg:
                                              'Your request/application is under process. We will get back to you within 24 hours'
                                                  .tr,
                                          type: 'P'));
                                    }
                                  } else if ((Box3.fetchUAEPassDoc
                                              ?.visualizationExpiry ==
                                          null) &&
                                      Box3.fetchUAEPassDoc?.reqAuthorized ==
                                          'N') {
                                    AccountController a =
                                        Get.find<AccountController>();
                                    if (a.contactUs == null) {
                                      a.getContactUs();
                                    }
                                    if (!Get.isRegistered<KycController>()) {
                                      Get.put(KycController());
                                    }

                                    Get.put(AccountController());

                                    if (Get.currentRoute !=
                                        AppRoutes.visualizationRetryRoutes) {
                                      Get.to(const RetryVisualization(),
                                          arguments: {
                                            "msg":
                                                'There was an error while fetching your documents from UAE PASS. Please retry'
                                                    .tr,
                                            "type": 'P',
                                            "isFrom": 'Dash'
                                          });
                                    }
                                  } else {
                                    pages[cms(Fields
                                            .SideMenu_ForexBookingIconAndText)
                                        .textHeading!] = SetForexRatePage();
                                  }
                                  // pages['set_forex_rate'.tr] = SetForexRatePage();
                                }
                              }
                            },
                            top: e == cms(Fields.SideMenu_MyProfileIconAndText).textHeading! ? 40 : 15))
                        .toList()),
                appDrawerTile(
                    image: SvgIcons.logout,
                    enable: true,
                    title: cms(Fields.SideMenu_LogOut).textHeading!,
                    top: 15,
                    onTap: logoutAlert)
              ],
            )),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: accountController.isDark
                    ? AppConfigs.g21
                    : const Color(0xFFEFEEEE),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(20)),
              ),
              alignment: Alignment.center,
              child: Text(
                '${AppConfigs.appVersion} ${AppConfigs.buildDate.day.toString().padLeft(2, '0')}${AppConfigs.buildDate.month.toString().padLeft(2, '0')}${AppConfigs.buildDate.year.toString().substring(2)}.${AppConfigs.buildNumber}',
                style:
                    TextStyles.font12.copyWith(color: AppConfigs.primaryColor),
              ),
            )
          ],
        );
      }),
    ),
  );
}
