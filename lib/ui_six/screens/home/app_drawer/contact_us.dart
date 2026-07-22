import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/ui_six/shimmers/beneficiary_simmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../flavors.dart';
import '../branch_locator_page.dart';

class ContactUsPage extends StatelessWidget {
  final bool isPreLogin;

  const ContactUsPage({super.key, this.isPreLogin = false});

  @override
  Widget build(BuildContext context) {
    // if (accountController.contactus == null) {
    Get.find<AccountController>().getContactUs();
    // }
    return GetBuilder<AccountController>(builder: (accountController) {
      Widget title(String s, {TextDecoration? textDecoration}) {
        return Container(
          margin:
              const EdgeInsets.only(left: 20, top: 20, bottom: 10, right: 20),
          // alignment: Alignment.centerLeft,
          child: Text(s,
              style: TS.f16.copyWith(
                  color: accountController.isDark
                      ? AppConfigs.w
                      : F.appFlavor == Flavor.cityexchangeuae
                          ? AppConfigs.accentColor
                          : AppConfigs.primaryColor,
                  decoration: textDecoration,
                  decorationThickness: 5),
              textAlign: TextAlign.start),
        );
      }

      Widget tile(
          {void Function()? onTap,
          required String image,
          required String text,
            double? width,
          String? text2,
          bool visibility = true,
          Color? color}) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: width ?? Get.size.width * 0.435,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border:
                    Border.all(color: AppConfigs.accentColor.withOpacity(0.2))),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SvgPicture.asset(
                    image,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    colorFilter: color != null
                        ? ColorFilter.mode(color, BlendMode.srcIn)
                        : null,
                  ),
                  const SizedBox(height: 10),
                  if (text2 != null) ...[
                    Text(
                      text2,
                      style: TS.f18B.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.b),
                    ),
                    const SizedBox(height: 0),
                  ],
                  Text(
                    text,
                    style: TS.f12.copyWith(
                        color: accountController.isDark
                            ? AppConfigs.g8f
                            : AppConfigs.g77),
                  ),
                ],
              ),
            ),
          ),
        );
      }

      return Scaffold(
        backgroundColor: AppConfigs.bg2,
        body: Container(
          decoration: BoxDecoration(
              gradient: accountController.isDark?null:AppConfigs.linearGradientUiSix
          ),
          child: Column(
            children: [
              Visibility(
                  visible: isPreLogin,
                  child: appBar0(cms(Fields.ContactUs_PageHeading).textHeading!,
                      onTap2: Get.back)),
              Expanded(
                  child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // cms(Fields.ContactUs_Image).image != ""
                    //     ? Base64Image(image: cms(Fields.ContactUs_Image).image!)
                    //     : SvgPicture.asset(ImagePath.contactUsImage),
                    if (accountController.contactUs == null) ...[
                      ShimmerCard(),
                      ShimmerCard(),
                      ShimmerCard(),
                      ShimmerCard(),
                      ShimmerCard()
                    ] else ...[
                      SizedBox(height: 40,),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("🤝",style: TS.f28B.copyWith(fontSize: 50),),
                            Text("How can we help?",style: TS.f28B,),
                            Text("Available 24/7 for all remittance queries.",style: TS.f14,),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: LayoutBuilder(
                          builder: (context,size) {
                            var w = size.maxWidth/2 - 5;
                            return Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                tile(
                                  width: w,
                                    image: SvgIcons.call2,
                                    text2: "Live Chat",
                                    text:
                                        accountController.contactUs?.data?.phoneNo ??
                                            '-',
                                    onTap: () async {
                                      // String phone = accountController.contactUs?.phone ?? '';
                                      String phone = accountController
                                              .contactUs?.data?.phoneNo ??
                                          ''; //byRahul

                                      var phoneCall = Uri.parse(
                                          'tel:${phone.contains(':') ? phone.split(':').last : phone}');
                                      try {
                                        if (await canLaunchUrl(phoneCall)) {
                                          launchUrl(phoneCall);
                                        } else {
                                          throw '${'Could_not_launch'.tr}$phoneCall';
                                        }
                                      } catch (e) {
                                        ScaffoldMessenger.of(Get.context!)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text("Something_Went_wrong".tr),
                                          ),
                                        );
                                      }
                                    }),
                                tile(
                                    width: w,
                                    image: SvgIcons.whatsapp,
                                    text2: "Call Us",
                                    text:
                                        accountController.contactUs?.data?.phoneNo ??
                                            '-',
                                    onTap: () async {
                                      String whatsapp = accountController
                                              .contactUs?.data?.phoneNo ??
                                          '-';

                                      try {
                                        if (Platform.isAndroid) {
                                          var androidUrl = Uri.parse(
                                              "whatsapp://send?phone=$whatsapp&text=hello");
                                          await launchUrl(androidUrl,
                                              mode: LaunchMode
                                                  .externalNonBrowserApplication);
                                        } else if (Platform.isIOS) {
                                          var iosUrl =
                                              "https://wa.me/$whatsapp?text=${Uri.parse('hello')}";
                                          await launchUrl(Uri.parse(iosUrl));
                                        }
                                      } on Exception {
                                        ScaffoldMessenger.of(Get.context!)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "WhatsApp_is_not_installed_on_the_device"
                                                    .tr),
                                          ),
                                        );
                                      }
                                    }),
                                tile(
                                    width: w,
                                    image: SvgIcons.email,
                                    text2: "Email",
                                    text: accountController.contactUs?.data?.email ??
                                        '-',
                                    color: AppConfigs.primaryColor.withOpacity(0.7),
                                    onTap: () async {
                                      String email =
                                          accountController.contactUs?.data?.email ??
                                              ''; //by rahul

                                      try {
                                        if (Platform.isAndroid) {
                                          var androidMail = Uri.parse(
                                              "mailto:${email.contains(':') ? email.split(':').last : email}?subject=Enquiry&body=Hi");
                                          await launchUrl(androidMail,
                                              mode: LaunchMode
                                                  .externalNonBrowserApplication);
                                        } else if (Platform.isIOS) {
                                          final iosMail = Uri(
                                            scheme: 'mailto',
                                            // path: accountController.contactUs?.email ?? 'sample@yahoo.com',
                                            path: accountController
                                                    .contactUs?.data?.email ??
                                                'sample@yahoo.com',
                                            query: 'subject=News&body=Hi',
                                          );
                                          if (await canLaunchUrl(iosMail)) {
                                            launchUrl(iosMail);
                                          } else {
                                            throw '${'Could_not_launch'.tr}$iosMail';
                                          }
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
                                    }),
                                tile(
                                    width: w,
                                    image: SvgIcons.bankTransfer2,
                                    text2: "Branch",
                                    text:
                                    accountController.contactUs!.data!.branchDetails!.first.branchName ??
                                        '-',
                                    onTap: () async {
                                      if (!isPreLogin) {
                                        Get.find<MainController>().push(
                                            const BranchLocatorPage(), AppBars.branchLocator);
                                      } else {
                                        Get.to(
                                                () => const BranchLocatorPage(isPrelogin: true));
                                      }
                                    }),
                                tile(image: SvgIcons.locationPin, text: accountController.contactUs?.data?.address ??
                                    "",text2: cms(Fields.ContactUs_RegisteredOffice).textHeading!,width: Get.size.width),
                              ],
                            );
                          }
                        ),
                      ),
                      // Container(
                      //   margin: const EdgeInsets.only(
                      //       left: 20, top: 0, bottom: 0, right: 20),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 5),
                      //         child: SvgPicture.asset(
                      //           SvgIcons.location,
                      //           colorFilter: ColorFilter.mode(
                      //               accountController.isDark
                      //                   ? AppConfigs.g8f
                      //                   : AppConfigs.g4,
                      //               BlendMode.srcIn),
                      //           height: 20,
                      //         ),
                      //       ),
                      //       const SizedBox(width: 10),
                      //       Expanded(
                      //         child: Text(
                      //             accountController.contactUs?.data?.address ??
                      //                 "",
                      //             style: TS.f12.copyWith(
                      //                 color: accountController.isDark
                      //                     ? AppConfigs.g8f
                      //                     : AppConfigs.g77),
                      //             textAlign: TextAlign.justify),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     if (!isPreLogin) {
                      //       Get.find<MainController>().push(
                      //           const BranchLocatorPage(), AppBars.branchLocator);
                      //     } else {
                      //       Get.to(
                      //           () => const BranchLocatorPage(isPrelogin: true));
                      //     }
                      //   },
                      //   child: Container(
                      //     margin: const EdgeInsets.only(
                      //         left: 20, top: 24, bottom: 20, right: 20),
                      //     decoration: BoxDecoration(
                      //         border: Border(
                      //             bottom: BorderSide(
                      //                 color: AppConfigs.primaryColor))),
                      //     child: Text(
                      //         cms(Fields.ContactUs_BranchesNearMe).textHeading!,
                      //         textAlign: TextAlign.start,
                      //         style: TS.f12
                      //             .copyWith(color: AppConfigs.primaryColor)),
                      //   ),
                      // ),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   padding: EdgeInsets.symmetric(horizontal: 20),
                      //   child: Row(
                      //     children: List.generate(
                      //         accountController.contactUs!.data!.branchDetails!
                      //                     .length <
                      //                 4
                      //             ? accountController
                      //                 .contactUs!.data!.branchDetails!.length
                      //             : 4, (i) {
                      //       return Text(
                      //         "\u25CF ${accountController.contactUs!.data!.branchDetails![i].branchName} ",
                      //         style: TS.f12.copyWith(
                      //             color: accountController.isDark
                      //                 ? AppConfigs.g8f
                      //                 : AppConfigs.g77),
                      //       );
                      //     }),
                      //   ),
                      // )
                    ]
                  ],
                ),
              ))
            ],
          ),
        ),
      );
    });
  }
}
