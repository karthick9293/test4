import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/exports/ui_two_pages.dart';

PreferredSizeWidget dashBoardAppbarUITwo() {
  return PreferredSize(
    preferredSize:
        Size(Get.width, 58 + MediaQuery.of(Get.context!).viewPadding.top),
    child: GetBuilder<MainController>(builder: (mainController) {
      final statusBarHeight = MediaQuery.of(Get.context!).viewPadding.top;

      return Container(
        height: 58 + statusBarHeight,
        padding: EdgeInsets.only(top: statusBarHeight),
        color: mainController.isDark
            ? AppConfigs.g21
            : ConstColors.dashboardappBarBackground,
        child: Row(
          children: [
            GestureDetector(
              onTap: () => mainController.key.currentState?.openDrawer(),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: SvgPicture.asset(
                  ImagePath.hamBurger,
                  colorFilter: mainController.isDark
                      ? const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn)
                      : null,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 15),
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: mainController.isDark
                        ? AppConfigs.g43
                        : const Color(0xffebe7e7),
                    width: 1,
                  ),
                  color: mainController.isDark ? AppConfigs.g43 : AppConfigs.w,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onTap: () async {
                          mainController
                            ..loading = true
                            ..update();
                          if (!Get.isRegistered<BeneficiaryController>()) {
                            Get.put(BeneficiaryController());
                          }
                          await Get.find<DataController>()
                              .getData(BeneficiaryController);
                          mainController
                            ..loading = false
                            ..update();
                        },
                        controller: mainController.dashboardSearch,
                        onChanged: mainController.search,
                        style: TextStyle(
                            color: mainController.isDark ? AppConfigs.w : null),
                        decoration: InputDecoration(
                          hintText: 'Pay_by_Name_or_Account_Number'.tr,
                          hintStyle: TS.f16.copyWith(
                              color: mainController.isDark
                                  ? AppConfigs.gd1
                                  : AppConfigs.g4),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.only(bottom: 10),
                        ),
                      ),
                    ),
                    if (mainController.searchClear.value)
                      GestureDetector(
                        onTap: () {
                          mainController.searchClear.value = false;
                          mainController.dashboardSearch.clear();
                          mainController
                            ..benefs.clear()
                            ..update();
                        },
                        child: Icon(
                          Icons.close,
                          color: AppConfigs.gd1,
                        ),
                      )
                    else
                      SvgPicture.asset(
                        ImagePath.search,
                        colorFilter: mainController.isDark
                            ? const ColorFilter.mode(
                                AppConfigs.gd1, BlendMode.srcIn)
                            : null,
                      ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => mainController.push(
                const AppNotificationPage(),
                AppBars.notification,
              ),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 5, right: 10),
                    child: SvgPicture.asset(
                      ImagePath.notification,
                      colorFilter: ColorFilter.mode(
                          mainController.isDark ? AppConfigs.w : AppConfigs.g4,
                          BlendMode.srcIn),
                    ),
                  ),
                  if (Get.find<DataController>().notificationCount > 0)
                    Container(
                      alignment: Alignment.topRight,
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7.5)),
                          color: AppConfigs.primaryColor,
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          Get.find<DataController>()
                              .notificationCount
                              .toString(),
                          style: TS.f10.copyWith(color: AppConfigs.w),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
    }),
  );
}
