import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../core/exports/ui_seven_pages.dart';
import '../../../core/flavours/constants.dart';

Widget userExistsAlert(bool isDark,
        {String? svgIcon, String? title, Widget? body}) =>
    Container(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Card(
          margin: const EdgeInsets.only(left: 20, right: 20),
          // decoration: BoxDecoration(
          //     borderRadius: const BorderRadius.all(Radius.circular(20)),
          //     boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
          color: isDark ? AppConfigs.g21 : AppConfigs.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SvgPicture.asset(svgIcon ?? SvgIcons.user),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin:
                        const EdgeInsets.only(top: 10, right: 10, bottom: 10),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        ImagePath.close,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                            AppConfigs.primaryColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                title ?? 'Account_Exist'.tr,
                style: TS.f20
                    .copyWith(color: isDark ? AppConfigs.w : AppConfigs.bf0),
              ),
              const SizedBox(height: 10),
              body ??
                  Column(
                    children: [
                      Text(
                        'This_ID_has_already_an_account_associated'.tr,
                        style: TS.f14.copyWith(
                          color: isDark ? AppConfigs.g8f : AppConfigs.g4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      roundButton(
                        'Login'.tr,
                        top: 20,
                        onTap: () => Get
                          ..back()
                          ..toNamed(AppRoutes.login),
                      )
                    ],
                  ),
            ],
          ),
        ),
      ),
    );

Widget successAlert(bool isDark, {String? content, double height = 167}) =>
    Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 397,
          height: height,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
              color: isDark ? AppConfigs.g21 : AppConfigs.w),
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SvgPicture.asset(ImagePath.transactionDone),
              Text(
                '${'success'.tr}!',
                style: TS.f20
                    .copyWith(color: isDark ? AppConfigs.w : AppConfigs.bf0),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: Text(
                  content ?? 'Your_National_ID_verified_successfully'.tr,
                  style: TS.f14.copyWith(
                    color: isDark ? AppConfigs.g8f : AppConfigs.g4,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget failureAlert(bool isDark, {String? content, Widget? body}) => Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 397,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  color: isDark ? AppConfigs.g21 : AppConfigs.w),
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Visibility(
                    visible: body == null,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        ImagePath.close,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                            AppConfigs.primaryColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(SvgIcons.deviceVerify),
                      Text(
                        '${'Alert'.tr}!',
                        style: TS.f20.copyWith(
                            color: isDark ? AppConfigs.w : AppConfigs.bf0),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        content ?? 'Your_National_ID_verified_successfully'.tr,
                        style: TS.f14.copyWith(
                          color: isDark ? AppConfigs.g8f : AppConfigs.g4,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      body ?? const SizedBox()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget kycPendingAlert(bool isDark, String text,
        {String? title, String? imagePath, String? image}) =>
    Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Align(
          alignment: Alignment.center,
          child: Card(
            // padding: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //     borderRadius: const BorderRadius.all(Radius.circular(20)),
            //     boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
            color: isDark ? AppConfigs.g21 : AppConfigs.w,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      child: title == 'Login Failed'.tr
                          ? SvgPicture.asset(
                              SvgIcons.deviceVerify,
                              colorFilter: ColorFilter.mode(
                                  AppConfigs.primaryColor, BlendMode.srcIn),
                            )
                          : image != null
                              ? SvgPicture.asset(image)
                              : imagePath != null
                                  ? SvgPicture.asset(imagePath)
                                  : SvgPicture.asset(
                                      SvgIcons.kycPending,
                                      colorFilter: ColorFilter.mode(
                                          AppConfigs.primaryColor,
                                          BlendMode.srcIn),
                                    )),
                  Text(
                    title ?? 'KYC_Approval_Pending'.tr,
                    style: TS.f20.copyWith(
                        color: isDark ? AppConfigs.w : AppConfigs.bf0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    text,
                    style: TS.f14.copyWith(
                      color: isDark ? AppConfigs.g8f : AppConfigs.g4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  roundButton(cms(Fields.PopUp_OkButton).textHeading!,
                      left: 0, right: 0, top: 15, bottom: 0, onTap: () {
                    Get.back();
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
