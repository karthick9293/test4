import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget dropDownTextField(String hint, String text, bool isDark,
    {void Function()? onTap, void Function(String)? onTapTile, String error = '', bool filled = true, bool downArrow = false}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: isDark ? AppConfigs.g21 : Colors.transparent,
                border: Border.all(
                    color: error.isNotEmpty
                        ? AppConfigs.der
                        : accountController.isDark
                            ? AppConfigs.g21
                            : AppConfigs.gd7)),
            padding: const EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 0, right: 10),
                    child: text.isNotEmpty
                        ? Text(
                            text,
                            style: TS.f16.copyWith(
                                color: error.isNotEmpty
                                    ? AppConfigs.der
                                    : accountController.isDark
                                        ? AppConfigs.g8f
                                        : filled
                                            ? AppConfigs.g4
                                            : AppConfigs.g77),
                          )
                        : Text(
                            hint,
                            style: TS.f16.copyWith(
                                color: error.isNotEmpty
                                    ? AppConfigs.der
                                    : accountController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g85),
                          ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 10),
                  child: SvgPicture.asset(
                    ImagePath.downArrow,
                    colorFilter: ColorFilter.mode(
                        error.isNotEmpty
                            ? AppConfigs.der
                            : accountController.isDark
                                ? AppConfigs.g8f
                                : text.isNotEmpty
                                    ? AppConfigs.g4
                                    : AppConfigs.g85,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: error.isNotEmpty,
          child: Container(
            margin: EdgeInsets.only(right: S.p, top: 3, left: S.p),
            alignment: Alignment.centerRight,
            child: Text(error, style: TS.f12.copyWith(color: AppConfigs.der, fontWeight: FontWeight.w600), textAlign: TextAlign.start),
          ),
        )
      ],
    );
  });
}
