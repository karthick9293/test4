import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/controllers/main_controller.dart';
import '../../core/flavours/constants.dart';

PreferredSizeWidget appBar0(String title,
    {bool? disableBack, void Function()? onTap2, Widget? action, String? subTitle}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 68),
    child: GetBuilder<AccountController>(builder: (accountController) {
      // Get the status bar height
      final statusBarHeight = MediaQuery.of(Get.context!).viewPadding.top;
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: accountController.isDark
                ? AppConfigs.g21
                : AppConfigs.w,
            border: Border(bottom: BorderSide(color: AppConfigs.primaryColor.withOpacity(0.3)))
          ),
          child: Row(
            children: [
              disableBack == true
                  ? const SizedBox()
                  : GestureDetector(
                      onTap: onTap2 ?? () => Get.find<MainController>().pop(),
                      child: Container(
                        width: 48,
                        height: 48,
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 0),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppConfigs.primaryColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppConfigs.primaryColor.withOpacity(0.2),),),
                        child: RotatedBox(
                          quarterTurns: Box3.lang?.Code == 'ar' ? 2 : 0,
                          child: SvgPicture.asset(SvgIcons.arrowLeft,colorFilter: ColorFilter.mode(accountController.isDark?AppConfigs.w:AppConfigs.b, BlendMode.srcIn),),
                        ),
                      ),
                    ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10,bottom: disableBack==true?10:0),
                  child: Column(
                    crossAxisAlignment: disableBack==true?CrossAxisAlignment.center:CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: TS.f22B.copyWith(
                            color: accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.bf0),
                      ),
                      if(subTitle!=null)Text(
                        subTitle,
                        style: TS.f14.copyWith(
                            color: accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.primaryColor.withOpacity(0.5)),
                      ),
                    ],
                  ),
                ),
              ),
              (action ?? const SizedBox())
            ],
          ),
        ),
      );
    }),
  );
}
