import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget radioTile(bool b, String title, {void Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 17.5,
          height: 17.5,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            border: Border.all(color: b ? AppConfigs.primaryColor : AppConfigs.g85),
            borderRadius: const BorderRadius.all(Radius.circular(8.75)),
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              color: b ? AppConfigs.primaryColor : null,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Text(title,
              style: TS.f14
                  .copyWith(color: Get.find<AccountController>().isDark ? (b ? AppConfigs.w : AppConfigs.g8f) : (b ? AppConfigs.g4 : AppConfigs.g77)),
              textAlign: TextAlign.start),
        ),
      ],
    ),
  );
}
