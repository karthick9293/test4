import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_three_custom_widgets.dart';
import '../../core/flavours/constants.dart';

Future<void> sessionTimeOut(
    {String path = '', String? message, String? title}) async {
  if (Get.isDialogOpen == true) Get.back();
  if (Get.isDialogOpen != true) {
    await Get.dialog(
        PopScope(
          canPop: title?.contains('VPN') != true,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop && title?.contains('VPN') == true) {
              SystemNavigator.pop();
            }
          },
          child: GetBuilder<AccountController>(
            builder: (accountController) {
              return Container(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  padding: const EdgeInsets.fromLTRB(15, 8, 15, 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0)
                    ],
                    color:
                        accountController.isDark ? AppConfigs.b : AppConfigs.w,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title ?? 'Session Timeout',
                            style: TS.f20.copyWith(
                                color: accountController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.g4),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: AppConfigs.accentColor,
                              size: 30,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: SelectableText(
                                message ??
                                    'Your session has timed out, please login again.${AppConfigs.env == Environment.prod ? '' : ' in $path'}',
                                style: TS.f14.copyWith(
                                    color: accountController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.g4),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Visibility(
                          visible: title?.contains('VPN') != true,
                          child: roundButton('Ok'.tr,
                              noMar: true, onTap: Get.back),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        barrierDismissible: title?.contains('VPN') != true,
        barrierColor: (Get.isRegistered<AccountController>()
                    ? Get.find<AccountController>()
                    : Get.put(AccountController()))
                .isDark
            ? AppConfigs.w.withOpacity(0.2)
            : null);
  }
}
