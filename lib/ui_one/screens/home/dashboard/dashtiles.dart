import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../flavors.dart';

Widget dashtile1(String image, String text,
    {void Function()? onTap, Widget? page, BillType? b, bool kycCompleted = true, bool enableBorder = false, Key? key, double width = 55}) {
  List<String> restrictions = ['Mobile'.tr, 'DTH'.tr, 'WiFi'.tr, 'Gas'.tr, 'Electricity'.tr, 'Rent'.tr, 'Education'.tr, 'Credit_card'.tr, 'Water'.tr];
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
                        style: TS.f20.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                      ),
                      Text('Exciting_new_feature_coming_soon_Stay_tuned_for_the_latest_utility_service_updates'.tr,
                          style: TS.f12, textAlign: TextAlign.center)
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
                        Get.put(BillPayController(), permanent: true).setBillType(b);
                      }
                      Get.find<MainController>().push(
                          page,
                          appBar0(
                            b == BillType.mobile ? Get.find<BillPayController>().title : '${'pay'.tr} ${Get.find<BillPayController>().title}',
                          ));
                    }
                  : onTap,
      child: Column(
        children: [
          Container(
            decoration: enableBorder
                ? BoxDecoration(border: Border.all(color: AppConfigs.w, width: 2), borderRadius: const BorderRadius.all(Radius.circular(15)))
                : null,
            child: SvgPicture.asset(
              image,
              width: width,
              allowDrawingOutsideViewBox: true,
              clipBehavior: Clip.hardEdge,
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
    {void Function()? onTap, Widget? page, BillType? b, bool kycCompleted = true, bool enableBorder = false, Key? key, double width = 55}) {
  List<String> restrictions = ['Mobile'.tr, 'DTH'.tr, 'WiFi'.tr, 'Gas'.tr, 'Electricity'.tr, 'Rent'.tr, 'Education'.tr, 'Credit_card'.tr, 'Water'.tr];
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
                        style: TS.f20.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                      ),
                      Text('Exciting_new_feature_coming_soon_Stay_tuned_for_the_latest_utility_service_updates'.tr,
                          style: TS.f12, textAlign: TextAlign.center)
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
                        Get.put(BillPayController(), permanent: true).setBillType(b);
                      }
                      Get.find<MainController>().push(
                          page,
                          appBar0(
                            b == BillType.mobile ? Get.find<BillPayController>().title : '${'pay'.tr} ${Get.find<BillPayController>().title}',
                          ));
                    }
                  : onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: accountController.isDark
                    ? AppConfigs.g21
                    : F.appFlavor == Flavor.kabayanremit
                        ? AppConfigs.highlightColor
                        : AppConfigs.primaryColor,
                border: enableBorder ? Border.all(color: accountController.isDark ? AppConfigs.gb5 : AppConfigs.w, width: 2) : null,
                gradient: F.appFlavor == Flavor.kabayanremit
                    ? LinearGradient(colors: [AppConfigs.highlightColor, AppConfigs.primaryColor], transform: GradientRotation(20), stops: [0.7, 0.3])
                    : null,
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: SvgPicture.asset(
              image,
              width: width,
              allowDrawingOutsideViewBox: true,
              clipBehavior: Clip.hardEdge,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
