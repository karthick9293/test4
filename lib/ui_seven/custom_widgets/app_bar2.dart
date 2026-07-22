import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/controllers/main_controller.dart';
import '../../core/flavours/constants.dart';

Widget appBar2(String title, Widget leftIcon, Widget rightIcon, {void Function()? onTapLeft, void Function()? onTapRight}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Container(
      height: 58,
      alignment: Alignment.center,
      color: accountController.isDark ? AppConfigs.g21 : ConstColors.appBarBackground,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTapLeft ?? () => Get.find<MainController>().pop(),
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: leftIcon,
            ),
          ),
          //add icon here
          Expanded(
              child: Center(
            child: Text(
              title,
              style: TextStyles.title.copyWith(color: accountController.isDark ? AppConfigs.w : null),
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: rightIcon,
          ),
        ],
      ),
    );
  });
}
