import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/bill_pay_controller.dart';
import '../../core/flavours/constants.dart';

Widget utilityIcon(String image, String text, bool selected, {void Function()? onTap}) {
  return GetBuilder<BillPayController>(builder: (billPayController) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 63,
            height: 63,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: selected
                    ? AppConfigs.primaryColor
                    : billPayController.isDark
                        ? AppConfigs.g21
                        : AppConfigs.gf1),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(
                image,
                colorFilter: ColorFilter.mode(selected ? Colors.white : AppConfigs.gb5, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: TS.f14.copyWith(color: AppConfigs.g4),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  });
}
