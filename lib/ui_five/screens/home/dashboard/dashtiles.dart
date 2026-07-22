import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_five_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';

Widget dashtile1(String image, String text,
    {void Function()? onTap,
    Widget? page,
    BillType? b,
    bool kycCompleted = true,
    bool enableBorder = false,
    Key? key,
    double width = 55}) {
  List<String> restrictions = [
    'Mobile'.tr,
    'DTH'.tr,
    'WiFi'.tr,
    'Gas'.tr,
    'Electricity'.tr,
    'Rent'.tr,
    'Education'.tr,
    'Credit_card'.tr,
    'Water'.tr
  ];
  return GetBuilder<AccountController>(builder: (accountController) {
    return GestureDetector(
      key: key,
      onTap: restrictions.contains(text)
          ? () async {
              alertDialog(
                  title: '',
                  disableBack: true,
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        //TODO: move string to other file
                        child: SvgPicture.asset(SvgIcons.warning),
                      ),
                      Text(
                        'Coming_Soon'.tr,
                        style: TS.f20.copyWith(
                            color: accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4),
                      ),
                      Text(
                          'Exciting_new_feature_coming_soon_Stay_tuned_for_the_latest_utility_service_updates'
                              .tr,
                          style: TS.f12,
                          textAlign: TextAlign.center)
                    ],
                  ));
            }
          : accountController.kycStatus == KYCStatus.pending
                  // && ( Box3.settings.personalisation.workflow : Box3.settings.workflow) == 'Workflow-1'
                  &&
                  restrictions.contains(text) &&
                  onTap == null
              ? () => accountController.kycAlert()
              : page != null
                  ? () {
                      if (b != null) {
                        Get.put(BillPayController(), permanent: true)
                            .setBillType(b);
                      }
                      Get.find<MainController>().push(
                          page,
                          appBar0(
                            b == BillType.mobile
                                ? Get.find<BillPayController>().title
                                : '${'pay'.tr} ${Get.find<BillPayController>().title}',
                          ));
                    }
                  : onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: enableBorder
                ? BoxDecoration(
                    border: Border.all(color: AppConfigs.w, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(16)))
                : BoxDecoration(
                    color: accountController.isDark
                        ? AppConfigs.g21
                        : AppConfigs.w,
                    boxShadow: [
                      BoxShadow(
                          color: AppConfigs.primaryColor.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4))
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: SvgPicture.asset(
              image,
              width: width * 0.55,
              allowDrawingOutsideViewBox: true,
              clipBehavior: Clip.hardEdge,
              colorFilter: enableBorder
                  ? null
                  : ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: TS.f14.copyWith(
                color: enableBorder
                    ? AppConfigs.w
                    : accountController.isDark
                        ? AppConfigs.w
                        : AppConfigs.g4),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  });
}

Widget dashtile2(String image, String text,
    {void Function()? onTap,
    Widget? page,
    BillType? b,
    bool kycCompleted = true,
    bool enableBorder = false,
    Key? key,
    double width = 55,
    FontWeight fontweight = FontWeight.w600}) {
  List<String> restrictions = [
    'Mobile'.tr,
    'DTH'.tr,
    'WiFi'.tr,
    'Gas'.tr,
    'Electricity'.tr,
    'Rent'.tr,
    'Education'.tr,
    'Credit_card'.tr,
    'Water'.tr
  ];
  return GetBuilder<AccountController>(builder: (accountController) {
    return GestureDetector(
      key: key,
      onTap: restrictions.contains(text)
          ? () async {
              alertDialog(
                  title: '',
                  disableBack: true,
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        //TODO: move string to other file
                        child: SvgPicture.asset(SvgIcons.warning),
                      ),
                      Text(
                        'Coming_Soon'.tr,
                        style: TS.f20.copyWith(
                            color: accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4),
                      ),
                      Text(
                          'Exciting_new_feature_coming_soon_Stay_tuned_for_the_latest_utility_service_updates'
                              .tr,
                          style: TS.f12,
                          textAlign: TextAlign.center)
                    ],
                  ));
            }
          : accountController.kycStatus == KYCStatus.pending &&
                  // (Box3.settings.workflow) == 'Workflow-1' &&
                  restrictions.contains(text) &&
                  onTap == null
              ? () => accountController.kycAlert()
              : page != null
                  ? () {
                      if (b != null) {
                        Get.put(BillPayController(), permanent: true)
                            .setBillType(b);
                      }
                      Get.find<MainController>().push(
                          page,
                          appBar0(
                            b == BillType.mobile
                                ? Get.find<BillPayController>().title
                                : '${'pay'.tr} ${Get.find<BillPayController>().title}',
                          ));
                    }
                  : onTap,
      child: Column(
        children: [
          Container(
            height: width,
            width: width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: accountController.isDark
                    ? const Color(0xFF141C2F)
                    : AppConfigs.w,
                boxShadow: accountController.isDark
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        )
                      ]
                    : [
                        BoxShadow(
                            color:
                                AppConfigs.primaryColor.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4))
                      ],
                border: accountController.isDark
                    ? Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      )
                    : (enableBorder
                        ? Border.all(
                            color: accountController.isDark
                                ? AppConfigs.gb5
                                : AppConfigs.primaryColor
                                    .withValues(alpha: 0.5),
                            width: 1.5)
                        : null),
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            child: SvgPicture.asset(
              image,
              allowDrawingOutsideViewBox: true,
              clipBehavior: Clip.hardEdge,
              colorFilter: ColorFilter.mode(
                  accountController.isDark
                      ? AppConfigs.w.withOpacity(0.8)
                      : AppConfigs.primaryColor,
                  BlendMode.srcIn),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: TS.f14.copyWith(
              fontWeight: fontweight,
              color: enableBorder
                  ? (accountController.isDark
                      ? AppConfigs.w.withOpacity(0.7)
                      : AppConfigs.w)
                  : accountController.isDark
                      ? AppConfigs.w.withOpacity(0.7)
                      : AppConfigs.g4,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  });
}
