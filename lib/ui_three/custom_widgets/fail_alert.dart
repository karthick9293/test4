import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/main_controller.dart';
import '../../core/flavours/constants.dart';

Future<void> showFailAlert({required String content, Function()? function, String? header}) async {
  if (Get.isDialogOpen == true) Get.back();
  bool isDark = Get.isRegistered<MainController>() ? Get.find<MainController>().isDark : false;
  await Get.dialog(
    Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          padding: const EdgeInsets.fromLTRB(17, 0, 17, 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
              color: isDark ? AppConfigs.g21 : AppConfigs.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 12),
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: function ?? Get.back,
                    child: SvgPicture.asset(
                      ImagePath.close,
                      height: 20,
                      width: 20,
                      colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),
                    )),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
                          color: isDark ? AppConfigs.g4 : AppConfigs.w,
                          borderRadius: BorderRadius.all(Radius.circular(36)))),
                  const ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Icon(
                      Icons.error,
                      size: 40,
                      color: AppConfigs.der,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                header ?? 'failed'.tr,
                style: TextStyles.font18.copyWith(color: isDark ? AppConfigs.w : AppConfigs.g4),
              ),
              SizedBox(height: 3),
              Text(
                content,
                style: TextStyles.font12.copyWith(
                  color: isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: true,
  );
}
