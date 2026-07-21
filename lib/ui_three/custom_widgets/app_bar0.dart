import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/controllers/main_controller.dart';
import '../../core/flavours/constants.dart';

PreferredSizeWidget appBar0(String title,
    {bool? disableBack, void Function()? onTap2, Widget? action}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 58),
    child: GetBuilder<AccountController>(builder: (accountController) {
      // Get the status bar height
      final statusBarHeight = MediaQuery.of(Get.context!).viewPadding.top;

      return AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: const [SizedBox.shrink()],
        scrolledUnderElevation: 0,
        flexibleSpace: Stack(
          children: [
            Container(
              height: 38 + statusBarHeight,
              padding: EdgeInsets.only(top: statusBarHeight),
              alignment: Alignment.center,
              child: Text(
                title,
                style: TS.f20.copyWith(
                    color: accountController.isDark
                        ? AppConfigs.w
                        : AppConfigs.bf0),
              ),
            ),
            disableBack == true
                ? const SizedBox()
                : Positioned(
                    top: statusBarHeight,
                    left: 0,
                    child: GestureDetector(
                      onTap: onTap2 ?? () => Get.find<MainController>().pop(),
                      child: Container(
                        height: 58,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 0),
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
                    ),
                  ),
            action != null
                ? Positioned(
                    top: statusBarHeight,
                    right: 0,
                    child: Container(
                      height: 58,
                      alignment: Alignment.center,
                      child: action,
                    ),
                  )
                : const SizedBox()
          ],
        ),
      );
    }),
  );
}
