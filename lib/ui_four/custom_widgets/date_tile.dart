import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget dateTile(String text,
    {DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    double left = 0,
    double right = 0,
    bool isSelected = false,
    required void Function(DateTime?) setDate}) {
  DateTime now = DateTime.now();
  return GetBuilder<AccountController>(builder: (accountController) {
    return GestureDetector(
      onTap: () async {
        DateTime? d = await showDatePicker(
            context: Get.context!,
            initialDate: initialDate ?? DateTime(now.year, now.month, now.day),
            firstDate: firstDate ?? DateTime(now.year, now.month - 6, now.day),
            lastDate: lastDate ?? DateTime.now());
        setDate(d);
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.only(left: left, right: right),
        padding: const EdgeInsets.only(left: 13, right: 13),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: accountController.isDark ? AppConfigs.g21 : AppConfigs.gd7),
            color: accountController.isDark ? AppConfigs.g21 : AppConfigs.w),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TS.f14.copyWith(
                  color: accountController.isDark ? (isSelected ? AppConfigs.w : AppConfigs.g8f) : (isSelected ? AppConfigs.g4 : AppConfigs.gd7)),
            ),
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                ImagePath.calendar,
                height: 20,
              ),
            )
          ],
        ),
      ),
    );
  });
}
