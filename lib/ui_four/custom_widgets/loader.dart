import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/flavours/constants.dart';

Widget loader({double left = 0, double top = 0, double right = 0, double bottom = 0, double height = 40, double width = 40}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Center(
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: accountController.isDark ? AppConfigs.g21 : Colors.white,
            boxShadow: const [BoxShadow(color: ConstColors.greya9, blurRadius: 5)]),
        child: CircularProgressIndicator(
          color: accountController.isDark ? AppConfigs.w : AppConfigs.primaryColor,
          strokeWidth: 1.5,
        ),
      ),
    );
  });
}

Widget tinyLoader({double size = 10, double width = 0.5, Color? color}) {
  return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: width,
        color: color ?? AppConfigs.accentColor,
      ));
}
