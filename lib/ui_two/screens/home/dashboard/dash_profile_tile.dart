import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/exports/ui_two_pages.dart';

Widget dashProfileTileUiTwo(
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
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: size,
              width: size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33),
                color: isDark
                    ? AppConfigs.g21
                    : AppConfigs.primaryColor.withOpacity(0.1),
              ),
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
                      : Center(
                          child: SvgPicture.asset(
                            SvgIcons.user2,
                            width: 25,
                            colorFilter: ColorFilter.mode(
                                AppConfigs.primaryColor, BlendMode.srcIn),
                            // fit: BoxFit.fitWidth,
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
                            "${cms(Fields.SideMenu_HiText).textHeading!} ${preLogin ? 'User'.tr : (isDrawer ? Box3.customerDetailsFZ?.data?.firstName : Box3.customerDetailsFZ?.data?.name)}"
                                .replaceAll("  ", " "),
                            style: TS.f20.copyWith(
                                color: isDrawer || isDark ? AppConfigs.w : c1),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          if (!isDrawer)
                            Text(
                              Box3.customerDetailsFZ?.data?.nationality ?? "",
                              style: TS.f14.copyWith(
                                  color:
                                      isDark ? AppConfigs.w : AppConfigs.g77),
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
                      child: SvgPicture.asset(SvgIcons.info)),
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
            ],
          ))
        ],
      );
    },
  );
}
