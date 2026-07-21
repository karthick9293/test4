import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/main_controller.dart';
import '../../core/exports/ui_four_custom_widgets.dart';
import '../../core/flavours/constants.dart';

Future<void> showSuccessAlert(
    {String? title,
    String? content,
    Function()? function,
    bool isDismiss = false}) async {
  if (Get.isDialogOpen == true) Get.back();
  bool isDark = Get.isRegistered<MainController>()
      ? Get.find<MainController>().isDark
      : false;
  await Get.dialog(
    Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
              color: isDark ? AppConfigs.g21 : AppConfigs.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                          color: isDark ? AppConfigs.g4 : AppConfigs.w,
                          borderRadius: BorderRadius.all(Radius.circular(36)))),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: SvgPicture.asset(
                      ImagePath.transactionDone,
                      height: 48,
                      width: 48,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                title ?? 'success'.tr,
                style: TextStyles.font18
                    .copyWith(color: isDark ? AppConfigs.w : AppConfigs.g4),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3),
              Text(
                content ?? 'statement_downloaded_successfully'.tr,
                style: TextStyles.font12.copyWith(
                  color: isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              roundButton(
                cms(Fields.PopUp_OkButton).textHeading!,
                left: 0,
                right: 0,
                top: 15,
                bottom: 0,
                onTap: function ?? Get.back,
              )
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: isDismiss,
  );
}
