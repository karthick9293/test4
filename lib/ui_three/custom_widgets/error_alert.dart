import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/main_controller.dart';
import '../../core/exports/ui_three_custom_widgets.dart';
import '../../core/flavours/constants.dart';

Future<void> errorAlert(
    {required String content, String? title, Function()? function}) async {
  var mainCtrl = Get.isRegistered<MainController>()
      ? Get.find<MainController>()
      : Get.put(MainController());
  if (Get.isDialogOpen == true) Get.back();
  bool isDark = mainCtrl.isDark;
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
              // Container(
              //   padding: const EdgeInsets.only(top: 12),
              //   alignment: Alignment.topRight,
              //   child: GestureDetector(
              //       onTap: function ?? Get.back,
              //       child: SvgPicture.asset(ImagePath.close,
              // colorFilter: ColorFilter.mode(
              //             AppConfigs.primaryColor, BlendMode.srcIn),
              // )),
              // ),
              SizedBox(
                height: 15,
              ),
              Text(
                title ?? 'Error'.tr,
                style: TextStyles.font18
                    .copyWith(color: isDark ? AppConfigs.w : AppConfigs.g4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                content,
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
    barrierDismissible: true,
  );
}

Future<void> cbLimitErrorAlert(
    {required String content,
    String? title,
    Function()? function,
    String? currencySymbol,
    String? amount}) async {
  var mainCtrl = Get.isRegistered<MainController>()
      ? Get.find<MainController>()
      : Get.put(MainController());
  if (Get.isDialogOpen == true) Get.back();
  bool isDark = mainCtrl.isDark;
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
              // Container(
              //   padding: const EdgeInsets.only(top: 12),
              //   alignment: Alignment.topRight,
              //   child: GestureDetector(
              //       onTap: function ?? Get.back,
              //       child: SvgPicture.asset(ImagePath.close,
              // colorFilter: ColorFilter.mode(
              // AppConfigs.primaryColor, BlendMode.srcIn),
              // )),
              // ),
              SizedBox(
                height: 15,
              ),
              Text(
                title ?? 'Error'.tr,
                style: TextStyles.font18
                    .copyWith(color: isDark ? AppConfigs.w : AppConfigs.g4),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                content,
                style: TextStyles.font12.copyWith(
                  color: isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              if (currencySymbol != null && amount != null) ...[
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 11,
                      child: currencySymbolImage(
                        currencySymbol,
                        color: isDark ? AppConfigs.w : AppConfigs.bf0,
                      ),
                    ),
                    Text(
                      amount,
                      style: TextStyles.font12.copyWith(
                        color: isDark ? AppConfigs.w : AppConfigs.g4,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
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
    barrierDismissible: true,
  );
}
