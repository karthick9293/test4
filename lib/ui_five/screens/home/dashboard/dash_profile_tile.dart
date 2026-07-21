import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_five_pages.dart';
import '../../../../core/exports/ui_five_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

Widget dashProfileTile(
    {Color? c1,
    Color? c2,
    bool preLogin = false,
    void Function()? onTap,
    // Color? bc,
    bool isDark = false,
    File? image,
    bool isDrawer = false,
    double size = 66}) {
  String shortForm = '';
  if (Box3.customerDetailsFZ != null && Box3.customerDetailsFZ!.data != null) {
    final profile = Box3.customerDetailsFZ!.data!;
    shortForm = [
      profile.firstName,
      profile.middleName ?? '',
      profile.lastName ?? ''
    ]
        .where((name) => name.trim().isNotEmpty)
        .map((name) => name.trim()[0].toUpperCase())
        .join();
  }
  final accountController = Get.find<AccountController>();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    accountController.ensureSelfieImageLoaded();
  });

  return Obx(
    () {
      final selfieImage = accountController.selfieImage.value;

      return Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: size,
              width: size,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33),
                  border: Border.all(
                      color: isDrawer
                          ? AppConfigs.w
                          : (isDark ? AppConfigs.primaryColor : AppConfigs.w),
                      width: 2),
                  color: isDark ? const Color(0xFF00101D) : null),
              // alignment: Alignment.center,
              child: accountController.appStatus != AppStatus.loggedIn
                  ? Center(
                      child: Text(
                        shortForm.substring(
                            0, shortForm.length > 2 ? 2 : shortForm.length),
                        style: TextStyles.font20.copyWith(
                            color: isDrawer
                                ? (isDark
                                    ? AppConfigs.primaryColor
                                    : AppConfigs.w)
                                : AppConfigs.primaryColor),
                      ),
                    )
                  : (Box3.customerDetailsFZ != null && selfieImage != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(33),
                          child: Base64Image(
                            image: selfieImage
                            // ??
                            //     Box3.customerDetailsFZ?.data?.profilePic ??
                            //     "",
                            ,
                            fit: BoxFit.cover,
                            errorWidget: Center(
                              child: Text(
                                shortForm.substring(
                                    0,
                                    shortForm.length > 2
                                        ? 2
                                        : shortForm.length),
                                style: TextStyles.font20.copyWith(
                                  color: isDrawer
                                      ? (isDark
                                          ? AppConfigs.primaryColor
                                          : AppConfigs.w)
                                      : AppConfigs.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      // : accountController.customerDetails!.profImage != null
                      //     ? AspectRatio(
                      //         aspectRatio: 1,
                      //         child: ClipRRect(
                      //           borderRadius: const BorderRadius.all(Radius.circular(33)),
                      //           child: Image.network(
                      //             accountController.customerDetails!.profImage!,
                      //             fit: BoxFit.cover,
                      //             alignment: Alignment.center,
                      //             errorBuilder: (context, error, stackTrace) => Center(
                      //               child: Text(
                      //                 shortForm.substring(0, shortForm.length > 2 ? 2 : shortForm.length),
                      //                 style: TextStyles.font20
                      //                     .copyWith(color: isDrawer ? (isDark ? AppConfigs.primaryColor : AppConfigs.w) : AppConfigs.primaryColor),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      : Center(
                          child: Text(
                            shortForm.substring(
                                0, shortForm.length > 2 ? 2 : shortForm.length),
                            style: TextStyles.font20.copyWith(
                                color: isDrawer
                                    ? (isDark
                                        ? AppConfigs.primaryColor
                                        : AppConfigs.w)
                                    : AppConfigs.primaryColor),
                          ),
                        ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: onTap,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Box3.settings.clientName,
                            style: TS.f18.copyWith(
                                color: isDark ? AppConfigs.w : AppConfigs.w),
                          ),
                          Text(
                            "${cms(Fields.SideMenu_HiText).textHeading!} ${preLogin ? 'User'.tr : (isDrawer ? Box3.customerDetailsFZ?.data?.firstName : Box3.customerDetailsFZ?.data?.name)}"
                                .replaceAll("  ", " "),
                            style: TS.f20.copyWith(
                                color: isDrawer || isDark
                                    ? AppConfigs.w
                                    : AppConfigs.w),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isDrawer &&
                        Get.find<AccountController>().kycStatus ==
                            KYCStatus.pending,
                    child: SvgPicture.asset(SvgIcons.info),
                  ),
                  Visibility(
                    visible: !isDrawer &&
                        Get.find<AccountController>().kycStatus ==
                            KYCStatus.pending,
                    child: GestureDetector(
                      onTap: () {
                        Get.put(AuthController());
                        Get.find<AccountController>()
                          ..completingKYC = false
                          ..update();
                        Get
                          ..put(KycController())
                          ..put(SignUpController());
                        Get.to(() => const UploadDocumentPage());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            bottom: 4, left: 3, right: 14),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: AppConfigs.primaryColor))),
                        child: Text(
                          cms(Fields.SideMenu_CompleteKYCIconAndText)
                              .textHeading!,
                          style:
                              TS.f12.copyWith(color: AppConfigs.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Box3.loginResponse?.login?.setCredential == 'N'
              //     ? HyperLinkButton(
              //         'Click here to complete your profile and unlock features!',
              //         padding: const EdgeInsets.only(right: 15),
              //         onTap: () {
              //           if (!Get.isRegistered<SignUpController>()) {
              //             Get.put(SignUpController());
              //           }
              //           Get.find<MainController>().push(
              //               SetCredentialsPage(
              //                 excludeAppBar: true,
              //                 setCredential: true,
              //                 idNumber: Box3.customerDetailsFZ?.data?.idNo ?? '',
              //                 mobile: Box3.customerDetailsFZ?.data?.mobileNo ?? '',
              //               ),
              //               AppBars.setCredential);
              //         },
              //       )
              //     : GestureDetector(
              //         onTap: onTap,
              //         child: Padding(
              //           padding: const EdgeInsets.only(right: 20),
              //           child: Text(
              //               "${"welcome_back".tr}${(Box3.settings.clientName : Box3.settings.clientName) ?? ''}",
              //               style: TS.f12
              //                   .copyWith(color: isDark || isDrawer ? AppConfigs.w : c2 ?? const Color(0xFF77DDF9), overflow: TextOverflow.ellipsis)),
              //         ),
              //       )
            ],
          ))
        ],
      );
    },
  );
}
