import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/exports/ui_four_custom_widgets.dart';
import '../../core/flavours/constants.dart';

Widget yesOrNoAlert(
    {Function()? onTap,
    bool? hideIcon,
    required String title,
    required String body,
    String? yesText,
    String? noText}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
            color: accountController.isDark ? AppConfigs.g21 : AppConfigs.w),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.fromLTRB(0, 8, 8, 0),
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
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: Alignment.center,
                    child: hideIcon != true
                        ? SvgPicture.asset(
                            ImagePath.myProfile,
                            colorFilter: ColorFilter.mode(
                                AppConfigs.primaryColor, BlendMode.srcIn),
                            width: 45,
                          )
                        : Text(
                            title,
                            style: TextStyles.font20.copyWith(
                                color: accountController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.g4),
                          ),
                  ),
                ],
              ),
              hideIcon != true
                  ? Container(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyles.font20.copyWith(
                            color: accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4),
                      ),
                    )
                  : const SizedBox(),
              Text(
                body,
                style: TextStyles.font12.copyWith(
                    color: accountController.isDark
                        ? AppConfigs.w
                        : const Color(0xff888787)),
              ),
              const SizedBox(
                height: 20,
              ),
              accountController.isYesNoLoader
                  ? tinyLoader(size: 24, width: 2)
                  : RowColumnButton(
                      isRow: Box3.settings.EnableSwipeButton == true
                          ? false
                          : true,
                      children: [
                        roundButton(
                            yesText ?? cms(Fields.PopUp_YesButton).textHeading!,
                            noMar: true,
                            onTap: onTap),
                        roundButton(
                          noText ?? cms(Fields.PopUp_NoButton).textHeading!,
                          borderOnly: true,
                          noMar: true,
                          isCancelButton: true,
                          onTap: () => Get.back(),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  });
}
