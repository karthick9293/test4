import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/data_controller.dart';
import '../../../../core/controllers/main_controller.dart';
import '../../../../core/exports/ui_seven_pages.dart';
import '../../../../core/flavours/constants.dart';

PreferredSizeWidget dashBoardAppbarUIThree() {
  return PreferredSize(
    preferredSize:
        Size(Get.width, 130 + MediaQuery.of(Get.context!).viewPadding.top),
    child: GetBuilder<MainController>(builder: (mainController) {
      final statusBarHeight = MediaQuery.of(Get.context!).viewPadding.top;

      return AppBar(
        // height: 130 + statusBarHeight,
        // padding: EdgeInsets.only(top: statusBarHeight),
        // color: AppConfigs.bodybg(mainController.isDark),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: const [SizedBox.shrink()],
        flexibleSpace: Padding(
          padding: EdgeInsets.fromLTRB(15, statusBarHeight, 15, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                mainController.isDark
                    ? ImagePath.alzamanExchLogoDark
                    : ImagePath.alzamanExchLogo,
                height: 70,
                width: 90,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(
                            () => const AppNotificationPage(isPrelogin: true)),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            SvgPicture.asset(
                              ImagePath.notification,
                              colorFilter: ColorFilter.mode(
                                  mainController.isDark
                                      ? AppConfigs.w
                                      : AppConfigs.primaryColor,
                                  BlendMode.srcIn),
                            ),
                            if (Get.find<DataController>().notificationCount >
                                0)
                              Container(
                                alignment: Alignment.topRight,
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.only(top: 5),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(7.5)),
                                      color: mainController.isDark
                                          ? AppConfigs.w
                                          : AppConfigs.primaryColor),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    // Get.find<DataController>()
                                    //     .notifications
                                    //     .length
                                    //     .toString(),
                                    Get.find<DataController>()
                                        .notificationCount
                                        .toString(),
                                    style: TS.f10.copyWith(
                                        color: mainController.isDark
                                            ? AppConfigs.w
                                            : AppConfigs.primaryColor),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () =>
                            mainController.key.currentState?.openEndDrawer(),
                        child: SvgPicture.asset(
                          ImagePath.hamBurger,
                          colorFilter: ColorFilter.mode(
                              mainController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.primaryColor,
                              BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () =>
                        Get.to(() => ReportFraudPage(isPrelogin: true)),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: mainController.isDark
                                ? AppConfigs.w
                                : AppConfigs.bf0,
                            width: 1.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        cms(Fields.PreLogin_ReportaFraud).textHeading!,
                        style: TS.f14.copyWith(
                            color: mainController.isDark
                                ? AppConfigs.w
                                : AppConfigs.bf0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }),
  );
}
