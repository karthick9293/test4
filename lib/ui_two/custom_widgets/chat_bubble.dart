import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget chatBubble(String text, bool isLeft) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Container(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: accountController.isDark
              ? (isLeft ? AppConfigs.g21 : AppConfigs.b01222d)
              : (isLeft ? const Color(0xfff5f6fa) : AppConfigs.primaryColor),
          borderRadius: BorderRadius.only(
            topRight: isLeft ? const Radius.circular(10) : Radius.zero,
            topLeft: !isLeft ? const Radius.circular(10) : Radius.zero,
            bottomLeft: const Radius.circular(10),
            bottomRight: const Radius.circular(10),
          ),
        ),
        child: Text(text,
            style: TextStyles.font12.copyWith(
              color: isLeft ? (accountController.isDark ? AppConfigs.g8f : AppConfigs.g4) : AppConfigs.w,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start),
      ),
    );
  });
}
