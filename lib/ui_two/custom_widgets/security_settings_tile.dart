import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget securitySettingsTile(
    {bool? value,
    void Function(bool)? onToggle,
    String? image,
    String? svgData,
    String? title,
    String? c1,
    String? c2,
    bool? disableBoder,
    String? content,
    Widget? trailing}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom:
                BorderSide(color: accountController.isDark ? Colors.transparent : (disableBoder == true ? Colors.transparent : ConstColors.greyd7))),
      ),
      // height: 70,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: svgData != null
                    ? Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(svgData,
                            height: 30,
                            colorFilter: ColorFilter.mode(accountController.isDark ? AppConfigs.w : const Color(0xFF8B8B8B), BlendMode.srcIn)),
                      )
                    : SvgPicture.asset(
                        image!,
                        height: 30,
                        colorFilter: ColorFilter.mode(
                          accountController.isDark ? AppConfigs.w : const Color(0xFF8B8B8B),
                          BlendMode.srcIn,
                        ),
                      ),
              ),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        c1 ?? '${'Set'.tr}$title',
                        style: TS.f14.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Text(c2 ?? '${'Secure_your_app_using'.tr}${content ?? title} ',
                    style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g77)),
              ),
              const SizedBox(height: 20),
            ],
          )),
          const SizedBox(width: 20),
          trailing ?? const SizedBox(),
          trailing == null
              ? FlutterSwitch(
                  height: 22,
                  width: 42,
                  padding: 3.5,
                  toggleSize: 18,
                  value: value ?? false,
                  activeColor: AppConfigs.primaryColor,
                  inactiveColor: AppConfigs.gd1,
                  onToggle: onToggle ?? (b) {},
                )
              : const SizedBox(),
          SizedBox(width: trailing == null ? 33 : 0)
        ],
      ),
    );
  });
}
