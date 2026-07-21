import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget genderDropdown({Key? key, void Function(String?)? onChanged, String? value, bool error = false}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Padding(
      padding: EdgeInsets.fromLTRB(S.p, 10, S.p, 0),
      child: DropdownButtonFormField2<String>(
        dropdownButtonKey: key,
        items: ['male'.tr, 'female'.tr, 'other'.tr]
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    e,
                    style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4),
                  ),
                ))
            .toList(),
        value: value,
        onChanged: onChanged ?? (v) {},
        buttonStyleData: ButtonStyleData(
          height: S.h,
          elevation: 0,
          padding: const EdgeInsets.only(right: 12.5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: accountController.isDark ? AppConfigs.g21 : null,
              border: Border.all(
                  color: error
                      ? AppConfigs.der
                      : accountController.isDark
                          ? AppConfigs.g21
                          : AppConfigs.gd7)),
        ),
        iconStyleData: IconStyleData(
            icon: SvgPicture.asset(
              ImagePath.downArrow,
              colorFilter: ColorFilter.mode(
                  error
                      ? AppConfigs.der
                      : accountController.isDark
                          ? AppConfigs.g8f
                          : AppConfigs.g4,
                  BlendMode.srcIn),
            ),
            openMenuIcon: SvgPicture.asset(
              ImagePath.downArrow,
              colorFilter: ColorFilter.mode(accountController.isDark ? AppConfigs.g8f : AppConfigs.g4, BlendMode.srcIn),
            )),
        menuItemStyleData: const MenuItemStyleData(height: 32),
        dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: const Color(0xff707070)),
                color: accountController.isDark ? AppConfigs.g21 : const Color(0xfff8f8f8))),
        hint: Text(
          'gender'.tr,
          style: TS.f14.copyWith(
              color: error
                  ? AppConfigs.der
                  : accountController.isDark
                      ? AppConfigs.gd7
                      : AppConfigs.g4),
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          focusedBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppConfigs.gd7),
          ),
        ),
        isExpanded: true,
      ),
    );
  });
}
