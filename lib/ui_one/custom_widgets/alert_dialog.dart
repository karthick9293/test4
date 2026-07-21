import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_one_custom_widgets.dart';
import '../../core/flavours/constants.dart';

Future<void> alertDialog(
    {required String title,
    Widget? body,
    double top = 16,
    double borderRadius = 20,
    bool noPad = false,
    Widget? icon,
    bool disableBack = false,
    bool isOKButton = true,
    void Function()? onComplete,
    Function()? function}) async {
  if (Get.isDialogOpen == true) Get.back();
  await Get.dialog(GetBuilder<AccountController>(builder: (accountController) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              // boxShadow: const [
              //   BoxShadow(
              //       color: Color(0x29000000),
              //       offset: Offset(0, 0),
              //       blurRadius: 10,
              //       spreadRadius: 0)
              // ],
              color: accountController.isDark
                  ? AppConfigs.b.withAlpha(200)
                  : AppConfigs.w),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                title.isEmpty
                    ? body!
                    : Column(
                        children: [
                          icon ?? const SizedBox(),
                          Container(
                            // margin: EdgeInsets.only(top: top),
                            alignment: Alignment.center,
                            child: Text(
                              title,
                              style: TS.f20.copyWith(
                                  color: accountController.isDark
                                      ? AppConfigs.w
                                      : AppConfigs.g4,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                title.isNotEmpty ? body ?? const SizedBox() : const SizedBox(),
                if (isOKButton)
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
    );
  }),
          name: "Alert1",
          barrierColor: Get.isRegistered<AccountController>()
              ? Get.find<AccountController>().isDark
                  ? AppConfigs.w.withOpacity(0.1)
                  : null
              : null)
      .then((value) {
    if (onComplete != null) {
      onComplete();
    }
  });
}

Future<void> apiAlertDialog(
    {String? title,
    String? message,
    double borderRadius = 20,
    Widget? icon,
    bool disableBack = false,
    void Function()? onComplete,
    Function()? function}) async {
  if (Get.isDialogOpen == true) Get.back();
  await Get.dialog(GetBuilder<AccountController>(builder: (accountController) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              color: accountController.isDark
                  ? AppConfigs.b.withAlpha(200)
                  : AppConfigs.w),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  icon
                else
                  (title != null && title.isNotEmpty)
                      ? Center(
                          child: Icon(
                            Icons.warning_rounded,
                            size: 60,
                            color: Colors.red,
                          ),
                        )
                      : const SizedBox(),
                if (title != null && title.isNotEmpty)
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: TS.f20.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g4,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: SingleChildScrollView(
                      child: Center(
                          child: SelectableText(
                    message ?? '',
                    style: TS.f14.copyWith(
                        color: accountController.isDark
                            ? AppConfigs.w.withAlpha(200)
                            : null),
                  ))),
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
    );
  }),
          name: "Alert1",
          barrierColor: Get.isRegistered<AccountController>()
              ? Get.find<AccountController>().isDark
                  ? AppConfigs.w.withOpacity(0.1)
                  : null
              : null)
      .then((value) {
    if (onComplete != null) {
      onComplete();
    }
  });
}

Future<void> alertDialogNew(
    {required String title,
    required String description,
    required String statusCode,
    Widget? body,
    double top = 16,
    double borderRadius = 20,
    bool noPad = false,
    Widget? icon,
    bool disableBack = false,
    void Function()? onComplete,
    Function()? function}) async {
  if (Get.isDialogOpen == true) Get.back();
  await Get.dialog(GetBuilder<AccountController>(builder: (accountController) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
              color: accountController.isDark ? AppConfigs.b : AppConfigs.w),
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(
                //   alignment: Alignment.topRight,
                //   margin: EdgeInsets.only(top: top, right: noPad ? 8 : 0),
                //   child: GestureDetector(
                //     onTap: () => Get.back(),
                //     child: SvgPicture.asset(
                //       ImagePath.close,
                //       height: 20,
                //       width: 20,
                // colorFilter: ColorFilter.mode(
                //           AppConfigs.primaryColor, BlendMode.srcIn),
                //     ),
                //   ),
                // ),
                Text(
                  title,
                  style: TS.f20.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.w
                          : AppConfigs.g4),
                ),
                Text(
                  statusCode,
                  style: TS.f20.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.w
                          : AppConfigs.g4),
                ),
                Text(
                  description,
                  style: TS.f20.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.w
                          : AppConfigs.g4),
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
    );
  }),
          barrierColor: Get.find<AccountController>().isDark
              ? AppConfigs.w.withOpacity(0.2)
              : null)
      .then((value) {
    if (onComplete != null) {
      onComplete();
    }
  });
}

void cmsLoadingAlert([String? languageName = ""]) {
  bool isDark = Get.isRegistered<MainController>()
      ? Get.find<MainController>().isDark
      : false;
  Get.dialog(
    Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDark ? AppConfigs.g21 : AppConfigs.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppConfigs.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Loading...",
                style: TextStyles.font12.copyWith(
                  color: isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
