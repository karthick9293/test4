import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../core/flavours/constants.dart';

Future<void> customLoader({String title = ''}) async {
  await Get.dialog(GetBuilder<AccountController>(builder: (accountController) {
    return Container(
      // width: 200,
      // height: 200,
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
            color: accountController.isDark ? AppConfigs.b : AppConfigs.w),
        child: Material(
          color: AppConfigs.t,
          child: CircularProgressIndicator(
            color: accountController.isDark ? AppConfigs.w : AppConfigs.primaryColor,
            strokeWidth: 1.5,
          ),
          // child: Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     CircularProgressIndicator(
          //       color: accountController.isDark ? AppConfigs.w : AppConfigs.primaryColor,
          //       strokeWidth: 1.5,
          //     ),
          //     // const SizedBox(
          //     //   height: 15,
          //     // ),
          //     // Text(
          //     //   'Loading...',
          //     //   // 'Loading $title',
          //     //   style: TS.f16
          //     //       .copyWith(color: accountController.isDark ? AppConfigs.gd7 : AppConfigs.g4),
          //     // )
          //   ],
          // ),
        ),
      ),
    );
  }));
}
