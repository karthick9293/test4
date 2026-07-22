import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget customDropdown<T>(
    {required List<DropdownMenuItem<T>>? items,
    String? hintText,
    bool inTextField = false,
    void Function(T?)? onChanged,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? itemPadding,
    T? value,
    Key? key,
    bool? noPad,
    bool error = false,
    double? left,
    double? top,
    double borderRadius = 5,
    bool disableBorder = false,
    Color? fillColor,
    DropdownStyleData? dropdownStyleData,
    MenuItemStyleData? menuItemStyleData,
    ButtonStyleData? buttonStyleData,
    double? right,
    Widget? icon,
    double? bottom,
    double buttonHeight = 40,
    double? buttonWidth,
    double? dropdownWidth}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Padding(
      padding: noPad == true ? EdgeInsets.zero : EdgeInsets.fromLTRB(left ?? S.p, top ?? 0, right ?? S.p, bottom ?? 0),
      child: DropdownButtonFormField2<T>(
        dropdownButtonKey: key,
        value: value,
        items: items,
        style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
        //copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
        onChanged: onChanged ?? (v) {},
        buttonStyleData: buttonStyleData ??
            ButtonStyleData(
              height: buttonHeight,
              width: buttonWidth,
              elevation: 0,
              padding: padding ?? const EdgeInsets.only(right: 12.5, left: 12.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                color: inTextField
                    ? const Color(0xffe8e8e8).withOpacity(0.47)
                    : fillColor ?? (accountController.isDark ? AppConfigs.g21 : Colors.transparent),
                border: Border.all(
                    color: inTextField
                        ? Colors.transparent
                        : error
                            ? AppConfigs.der
                            : disableBorder
                                ? Colors.transparent
                                : accountController.isDark
                                    ? AppConfigs.g21
                                    : AppConfigs.gd7),
              ),
            ),
        menuItemStyleData: menuItemStyleData ?? MenuItemStyleData(padding: itemPadding, height: 50),
        dropdownStyleData: dropdownStyleData ??
            DropdownStyleData(
                maxHeight: 200,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: inTextField ? Colors.transparent : AppConfigs.gd7),
                    color: accountController.isDark ? AppConfigs.g21 : const Color(0xfff8f8f8))),
        iconStyleData: IconStyleData(
          icon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: icon ??
                SvgPicture.asset(
                  ImagePath.downArrow,
                  colorFilter: ColorFilter.mode(
                      error
                          ? AppConfigs.der
                          : accountController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g4,
                      BlendMode.srcIn),
                ),
          ),
          openMenuIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: icon ??
                SvgPicture.asset(
                  ImagePath.downArrow,
                  colorFilter: ColorFilter.mode(accountController.isDark ? AppConfigs.g8f : AppConfigs.g4, BlendMode.srcIn),
                ),
          ),
        ),
        hint: Text(
          hintText ?? 'gender'.tr,
          style: TS.f16.copyWith(
              color: error
                  ? AppConfigs.der
                  : accountController.isDark
                      ? AppConfigs.g8f
                      : AppConfigs.g77,
              fontWeight: FontWeight.w600),
        ),
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
        isExpanded: true,
      ),
    );
  });
}
