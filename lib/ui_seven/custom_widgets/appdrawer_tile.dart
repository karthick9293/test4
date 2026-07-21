import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget appDrawerTile(
    {required String image, required String title, required double top, double? height, required bool enable, void Function()? onTap}) {
  return !enable
      ? const SizedBox()
      : GetBuilder<AccountController>(builder: (accountController) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              // color: accountController.isDark ? AppConfigs.g14 : Colors.transparent,
              padding: EdgeInsets.fromLTRB(15, top, 20, 15),
              // padding: EdgeInsets.fromLTRB(height == 20 ? 63 : 54, top, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30,
                    child: SvgPicture.asset(
                      image,
                      colorFilter: ColorFilter.mode(accountController.isDark ? AppConfigs.gb0 : AppConfigs.primaryColor, BlendMode.srcIn),
                      height: height ?? 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        title,
                        style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
}
