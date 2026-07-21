import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/flavours/constants.dart';

Future<void> sessionVPN(
    {String path = '', required String message, required String title}) async {
  if (Get.isDialogOpen == true) Get.back();
  if (Get.isDialogOpen != true) {
    await Get.dialog(
      PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            SystemNavigator.pop();
          }
        },
        child: Container(
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
              color: AppConfigs.w,
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
                      title,
                      style: TS.f20.copyWith(color: AppConfigs.g4),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SelectableText(
                    message,
                    style: TS.f14.copyWith(color: AppConfigs.g4),
                  ),
                  // const SizedBox(height: 10),
                  // Visibility(
                  //   visible: title?.contains('VPN') != true,
                  //   child: roundButton('Ok'.tr, noMar: true, onTap: Get.back),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
