import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_six_pages.dart';
import '../../core/flavours/constants.dart';
import '../../core/icons/svg_icons.dart';

PreferredSize appBar1(String lang,
    {bool fromMpin = false, bool enableBack = false, String? title}) {
  return PreferredSize(
    preferredSize:
        Size(Get.width, 58 + MediaQuery.of(Get.context!).viewPadding.top),
    child: GetBuilder<AccountController>(builder: (accountController) {
      final statusBarHeight = MediaQuery.of(Get.context!).viewPadding.top;

      return Container(
        height: 58 + statusBarHeight,
        padding: EdgeInsets.only(top: statusBarHeight, left: S.p, right: S.p),
        color: accountController.isDark
            ? AppConfigs.g21
            : ConstColors.appBarBackground,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (Box3.settings.preLogin) && enableBack
                ? GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 58,
                      padding: const EdgeInsets.only(left: 0, right: 20),
                      alignment: Alignment.centerLeft,
                      child: RotatedBox(
                        quarterTurns: Box3.lang?.Code == 'ar' ? 2 : 0,
                        child: SvgPicture.asset(
                          ImagePath.backIcon,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.g4,
                              BlendMode.srcIn),
                          height: 30,
                        ),
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            Get.to(() => SelectLanguage(fromMpin: fromMpin)),
                        child: SvgPicture.asset(
                          ImagePath.language,
                          height: 30,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.g4,
                              BlendMode.srcIn),
                        ),
                      ),
                      Text(
                        lang,
                        style: TextStyles.font16.copyWith(
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          color: accountController.isDark ? AppConfigs.w : null,
                        ),
                      )
                    ],
                  ),
            if (title != null)
              Expanded(
                child: Container(
                  height: 58,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TS.f20.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.w
                          : AppConfigs.bf0,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            GestureDetector(
              onTap: () => Get.to(() => Scaffold(
                    backgroundColor: Colors.white,
                    body: FAQPage(isPreLogin: true),
                  )),
              child: Container(
                alignment: Alignment.center,
                height: 58,
                child: SvgPicture.asset(
                  SvgIcons.faq,
                  colorFilter: ColorFilter.mode(
                      accountController.isDark ? AppConfigs.w : AppConfigs.g4,
                      BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      );
    }),
  );
}
