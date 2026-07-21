import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_seven_custom_widgets.dart';
import '../../core/exports/ui_seven_pages.dart';
import '../../core/flavours/constants.dart';
import '../../network/api_service_new.dart';

Future<void> unregister() async {
  bool buttonLoading = false;
  String buttonText = 'Unregister'.tr;
  await Get.dialog(
    GetBuilder<AccountController>(builder: (accountController) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
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
                    accountController.isDark ? AppConfigs.bf0 : AppConfigs.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Deregister',
                      style: TS.f20.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g4),
                    ),
                    textFormField(labelText: Box3.settings.primaryDocID),
                    textFormField(labelText: 'Mobile'),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'Please enter your ${Box3.settings.primaryDocID} and mobile Number registered with this device, or please copy the reference number below and contact the customer care',
                            style: TS.f14.copyWith(
                                color: accountController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.g4),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 10),
                          Visibility(
                            visible: Box3.status != AppStatus.loggedIn,
                            child: Row(
                              children: [
                                const Text('Reference Number : '),
                                SelectableText(
                                  Box3.deviceId ?? '',
                                  style: TS.f14.copyWith(
                                      color:
                                          Get.find<AccountController>().isDark
                                              ? AppConfigs.w
                                              : AppConfigs.g4),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.copy,
                                  size: 14,
                                  color: AppConfigs.g4,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: roundButton('Cancel', top: 0, right: 10)),
                        Expanded(
                          child: buttonLoading
                              ? loader(top: 15, bottom: 15)
                              : roundButton(buttonText, top: 0, left: 10,
                                  onTap: () async {
                                  buttonLoading = true;
                                  accountController.update();
                                  bool result = await ApiService().deRegister();
                                  if (result) {
                                    buttonText = 'Unregistered_Successfully'.tr;
                                    Get.offAllNamed((Box3.settings.preLogin)
                                        ? AppRoutes.preLogin
                                        : AppRoutes.login);
                                    Get.find<AccountController>().appStatus =
                                        AppStatus.onBoarded;
                                    await Box3.setStatus(AppStatus.onBoarded);
                                    Box3.fetchUAEPassDoc = null;
                                  }
                                  buttonLoading = false;
                                  accountController.update();
                                  if (result) {
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    if (Get.isDialogOpen == true) {
                                      Get.back();
                                    }
                                  }
                                }),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }),
  );
}
