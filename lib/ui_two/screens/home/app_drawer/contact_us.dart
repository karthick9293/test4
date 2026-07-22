import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../flavors.dart';

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

      Widget contactCard({
        required String icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: accountController.isDark ? AppConfigs.g14 : AppConfigs.w,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                /// Icon Circle
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: AppConfigs.primaryColor.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      height: 22,
                      colorFilter: ColorFilter.mode(
                        AppConfigs.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),

                /// Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TS.f14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: accountController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TS.f12.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g77,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }

      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        body: Column(
          children: [
            Appbar2(
              title: cms(Fields.ContactUs_PageHeading).textHeading!,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 16),
                      child: Text(
                        "For help or questions, contact the IFI Support Team.",
                        textAlign: TextAlign.start,
                        style: TS.f14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: accountController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g77,
                        ),
                      ),
                    ),

                    // title(cms(Fields.ContactUs_ContactNow).textHeading!),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        children: [
                          /// ✉️ Email
                          contactCard(
                            icon: SvgIcons.email,
                            title: "Email Support",
                            subtitle:
                                accountController.contactUs?.data?.email ?? '-',
                            onTap: () async {
                              final email =
                                  accountController.contactUs?.data?.email ??
                                      '';
                              final uri = Uri(
                                scheme: 'mailto',
                                path: email,
                                query: 'subject=Enquiry&body=Hi',
                              );
                              if (await canLaunchUrl(uri)) {
                                launchUrl(uri);
                              }
                            },
                          ),

                          /// 📞 Phone
                          contactCard(
                            icon: SvgIcons.call,
                            title: "Phone Support",
                            subtitle:
                                accountController.contactUs?.data?.phoneNo ??
                                    '-',
                            onTap: () async {
                              String phone =
                                  accountController.contactUs?.data?.phoneNo ??
                                      '';
                              final uri = Uri.parse('tel:$phone');
                              if (await canLaunchUrl(uri)) {
                                launchUrl(uri);
                              }
                            },
                          ),

                          contactCard(
                            icon: SvgIcons.whatsapp,
                            title: "In-App Chat",
                            subtitle:
                                accountController.contactUs?.data?.phoneNo ??
                                    '-',
                            onTap: () async {
                              String whatsapp =
                                  accountController.contactUs?.data?.phoneNo ??
                                      '';
                              try {
                                if (Platform.isAndroid) {
                                  final uri = Uri.parse(
                                      "whatsapp://send?phone=$whatsapp&text=Hello");
                                  await launchUrl(
                                    uri,
                                    mode: LaunchMode
                                        .externalNonBrowserApplication,
                                  );
                                } else {
                                  final uri =
                                      Uri.parse("https://wa.me/$whatsapp");
                                  await launchUrl(uri);
                                }
                              } catch (_) {
                                ScaffoldMessenger.of(Get.context!).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "WhatsApp_is_not_installed_on_the_device"
                                            .tr),
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),

                    // title(cms(Fields.ContactUs_RegisteredOffice).textHeading!),

                    // Container(
                    //   margin: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 4),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       SvgPicture.asset(
                    //         SvgIcons.location,
                    //         height: 20,
                    //         colorFilter: ColorFilter.mode(
                    //           accountController.isDark
                    //               ? AppConfigs.g8f
                    //               : AppConfigs.g4,
                    //           BlendMode.srcIn,
                    //         ),
                    //       ),
                    //       const SizedBox(width: 10),
                    //       Expanded(
                    //         child: Text(
                    //           accountController.contactUs?.data?.address ?? "",
                    //           style: TS.f12.copyWith(
                    //             color: accountController.isDark
                    //                 ? AppConfigs.g8f
                    //                 : AppConfigs.g77,
                    //           ),
                    //           textAlign: TextAlign.justify,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // GestureDetector(
                    //   onTap: () {
                    //     if (!isPreLogin) {
                    //       Get.find<MainController>().push(
                    //         const BranchLocatorPage(),
                    //         AppBars.branchLocator,
                    //       );
                    //     } else {
                    //       Get.to(
                    //         () => const BranchLocatorPage(isPrelogin: true),
                    //       );
                    //     }
                    //   },
                    //   child: Container(
                    //     margin: const EdgeInsets.all(20),
                    //     decoration: BoxDecoration(
                    //       border: Border(
                    //         bottom: BorderSide(
                    //           color: AppConfigs.primaryColor,
                    //         ),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       cms(Fields.ContactUs_BranchesNearMe).textHeading!,
                    //       style: TS.f12.copyWith(
                    //         color: AppConfigs.primaryColor,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });

    // Widget tile(
    //     {void Function()? onTap,
    //     required String image,
    //     required String text,
    //     bool visibility = true,
    //     Color? color}) {
    //   return GestureDetector(
    //     onTap: onTap,
    //     child: Padding(
    //       padding: EdgeInsets.symmetric(vertical: 5.0),
    //       child: Row(
    //         children: [
    //           const SizedBox(height: 14),
    //           SvgPicture.asset(
    //             image,
    //             width: 20,
    //             height: 20,
    //             fit: BoxFit.cover,
    //             colorFilter: color != null
    //                 ? ColorFilter.mode(color, BlendMode.srcIn)
    //                 : null,
    //           ),
    //           const SizedBox(width: 10),
    //           Text(
    //             text,
    //             style: TS.f12.copyWith(
    //                 color: accountController.isDark
    //                     ? AppConfigs.g8f
    //                     : AppConfigs.g77),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }
    //
    // return Scaffold(
    //   backgroundColor: AppConfigs.bodybg(accountController.isDark),
    //   body: Column(
    //     children: [
    //       Visibility(
    //           visible: isPreLogin,
    //           child: appBar0(cms(Fields.ContactUs_PageHeading).textHeading!,
    //               onTap2: Get.back)),
    //       Expanded(
    //           child: SingleChildScrollView(
    //         physics: const ClampingScrollPhysics(),
    //         padding: EdgeInsets.symmetric(horizontal: 10),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             // cms(Fields.ContactUs_Image).image != ""
    //             //     ? Base64Image(image: cms(Fields.ContactUs_Image).image!)
    //             //     : SvgPicture.asset(ImagePath.contactUsImage),
    //             title(cms(Fields.ContactUs_ContactNow).textHeading!),
    //             Padding(
    //               padding: const EdgeInsets.only(left: 20, right: 20),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 children: [
    //                   tile(
    //                       image: SvgIcons.call,
    //                       text: accountController.contactUs?.data?.phoneNo ??
    //                           '-',
    //                       onTap: () async {
    //                         // String phone = accountController.contactUs?.phone ?? '';
    //                         String phone =
    //                             accountController.contactUs?.data?.phoneNo ??
    //                                 ''; //byRahul
    //
    //                         var phoneCall = Uri.parse(
    //                             'tel:${phone.contains(':') ? phone.split(':').last : phone}');
    //                         try {
    //                           if (await canLaunchUrl(phoneCall)) {
    //                             launchUrl(phoneCall);
    //                           } else {
    //                             throw '${'Could_not_launch'.tr}$phoneCall';
    //                           }
    //                         } catch (e) {
    //                           ScaffoldMessenger.of(Get.context!).showSnackBar(
    //                             SnackBar(
    //                               content: Text("Something_Went_wrong".tr),
    //                             ),
    //                           );
    //                         }
    //                       }),
    //                   tile(
    //                       image: SvgIcons.whatsapp,
    //                       //text: accountController.contactus?.data?.whatsApp ?? '-',
    //                       text: accountController.contactUs?.data?.phoneNo ??
    //                           '-',
    //                       onTap: () async {
    //                         String whatsapp =
    //                             accountController.contactUs?.data?.phoneNo ??
    //                                 '-';
    //
    //                         try {
    //                           if (Platform.isAndroid) {
    //                             var androidUrl = Uri.parse(
    //                                 "whatsapp://send?phone=$whatsapp&text=hello");
    //                             await launchUrl(androidUrl,
    //                                 mode: LaunchMode
    //                                     .externalNonBrowserApplication);
    //                           } else if (Platform.isIOS) {
    //                             var iosUrl =
    //                                 "https://wa.me/$whatsapp?text=${Uri.parse('hello')}";
    //                             await launchUrl(Uri.parse(iosUrl));
    //                           }
    //                         } on Exception {
    //                           ScaffoldMessenger.of(Get.context!).showSnackBar(
    //                             SnackBar(
    //                               content: Text(
    //                                   "WhatsApp_is_not_installed_on_the_device"
    //                                       .tr),
    //                             ),
    //                           );
    //                         }
    //                       }),
    //                   tile(
    //                       image: SvgIcons.email,
    //                       text:
    //                           accountController.contactUs?.data?.email ?? '-',
    //                       color: AppConfigs.primaryColor.withOpacity(0.7),
    //                       onTap: () async {
    //                         String email =
    //                             accountController.contactUs?.data?.email ??
    //                                 ''; //by rahul
    //
    //                         try {
    //                           if (Platform.isAndroid) {
    //                             var androidMail = Uri.parse(
    //                                 "mailto:${email.contains(':') ? email.split(':').last : email}?subject=Enquiry&body=Hi");
    //                             await launchUrl(androidMail,
    //                                 mode: LaunchMode
    //                                     .externalNonBrowserApplication);
    //                           } else if (Platform.isIOS) {
    //                             final iosMail = Uri(
    //                               scheme: 'mailto',
    //                               // path: accountController.contactUs?.email ?? 'sample@yahoo.com',
    //                               path: accountController
    //                                       .contactUs?.data?.email ??
    //                                   'sample@yahoo.com',
    //                               query: 'subject=News&body=Hi',
    //                             );
    //                             if (await canLaunchUrl(iosMail)) {
    //                               launchUrl(iosMail);
    //                             } else {
    //                               throw '${'Could_not_launch'.tr}$iosMail';
    //                             }
    //                           }
    //                         } catch (e) {
    //                           ScaffoldMessenger.of(Get.context!).showSnackBar(
    //                             SnackBar(
    //                               content: Text(
    //                                   "WhatsApp_is_not_installed_on_the_device"
    //                                       .tr),
    //                             ),
    //                           );
    //                         }
    //                       }),
    //                   // Container(
    //                   //     width: 1,
    //                   //     margin: const EdgeInsets.only(left: 20, right: 20),
    //                   //     height: 121.3974609375,
    //                   //     color: const Color(0xffd3d3d3)),
    //                   // GestureDetector(
    //                   //   child: Column(
    //                   //     children: [
    //                   //       const SizedBox(height: 14),
    //                   //       Padding(
    //                   //         padding: const EdgeInsets.only(top: 3),
    //                   //         child: SvgPicture.asset(
    //                   //           SvgIcons.mail,
    //                   //           // colorFilter: ColorFilter.mode(
    //                   //           //     accountController.isDark ? AppConfigs.g8f : AppConfigs.g4,
    //                   //           //     BlendMode.srcIn),
    //                   //         ),
    //                   //       ),
    //                   //       const SizedBox(width: 10),
    //                   //       Text(
    //                   //         Get.find<DataController>().contactUs?.email ??
    //                   //             '',
    //                   //         style: TS.f12.copyWith(
    //                   //             color: accountController.isDark
    //                   //                 ? AppConfigs.g8f
    //                   //                 : AppConfigs.g77),
    //                   //       ),
    //                   //     ],
    //                   //   ),
    //                   // )
    //                 ],
    //               ),
    //             ),
    //             // title(cms(Fields.ContactUs_RegisteredOffice).textHeading!),
    //             // Container(
    //             //   margin: const EdgeInsets.only(
    //             //       left: 20, top: 0, bottom: 0, right: 20),
    //             //   child: Row(
    //             //     crossAxisAlignment: CrossAxisAlignment.start,
    //             //     children: [
    //             //       Padding(
    //             //         padding: const EdgeInsets.only(top: 5),
    //             //         child: SvgPicture.asset(
    //             //           SvgIcons.location,
    //             //           colorFilter: ColorFilter.mode(
    //             //               accountController.isDark
    //             //                   ? AppConfigs.g8f
    //             //                   : AppConfigs.g4,
    //             //               BlendMode.srcIn),
    //             //           height: 20,
    //             //         ),
    //             //       ),
    //             //       const SizedBox(width: 10),
    //             //       Expanded(
    //             //         child: Text(
    //             //             accountController.contactUs?.data?.address ?? "",
    //             //             style: TS.f12.copyWith(
    //             //                 color: accountController.isDark
    //             //                     ? AppConfigs.g8f
    //             //                     : AppConfigs.g77),
    //             //             textAlign: TextAlign.justify),
    //             //       ),
    //             //     ],
    //             //   ),
    //             // ),
    //             // Align(
    //             //   alignment: Alignment.centerLeft,
    //             //   child:
    //             // GestureDetector(
    //             //   onTap: () {
    //             //     if (!isPreLogin) {
    //             //       Get.find<MainController>().push(
    //             //           const BranchLocatorPage(), AppBars.branchLocator);
    //             //     } else {
    //             //       Get.to(() => const BranchLocatorPage(isPrelogin: true));
    //             //     }
    //             //   },
    //             //   child: Container(
    //             //     margin: const EdgeInsets.only(
    //             //         left: 20, top: 24, bottom: 20, right: 20),
    //             //     decoration: BoxDecoration(
    //             //         border: Border(
    //             //             bottom:
    //             //                 BorderSide(color: AppConfigs.primaryColor))),
    //             //     child: Text(
    //             //         cms(Fields.ContactUs_BranchesNearMe).textHeading!,
    //             //         textAlign: TextAlign.start,
    //             //         style:
    //             //             TS.f12.copyWith(color: AppConfigs.primaryColor)),
    //             //   ),
    //             // ),
    //             // )
    //           ],
    //         ),
    //       ))
    //     ],
    //   ),
    // );
    //});
  }
}
