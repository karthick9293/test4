import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/exports/ui_one_custom_widgets.dart';
import '../../core/flavours/constants.dart';

Widget dummyField(String text, bool isDark,
    {void Function()? onTap, void Function(String)? onTapTile, String error = '', List<String>? texts, bool filled = true, bool downArrow = false}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Column(
      children: [
        Visibility(
          visible: texts != null,
          child: Container(
            padding: const EdgeInsets.only(left: 20, bottom: 5, top: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyles.font12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.fromLTRB(20, texts != null ? 0 : 10, 20, 0),
            height: texts == null ? 40 : null,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: isDark ? AppConfigs.g21 : Colors.transparent,
                border: Border.all(
                    color: error.isNotEmpty
                        ? AppConfigs.der
                        : accountController.isDark
                            ? AppConfigs.g21
                            : AppConfigs.gd7)),
            padding: EdgeInsets.only(left: 15, top: texts == null ? 0 : 15, right: texts == null ? 0 : 0, bottom: texts == null ? 0 : 15),
            alignment: Alignment.centerLeft,
            child: texts != null
                ? Wrap(
                    runSpacing: 15.0,
                    children: texts.map((e) => filterTile(e, onTap: onTapTile)).toList(),
                  )
                : Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 0, right: 10),
                          child: Text(
                            text,
                            style: TS.f16.copyWith(
                                color: error.isNotEmpty
                                    ? AppConfigs.der
                                    : accountController.isDark
                                        ? AppConfigs.g8f
                                        : filled
                                            ? AppConfigs.g4
                                            : AppConfigs.g77),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: downArrow,
                        child: Container(
                          margin: const EdgeInsets.only(left: 5, right: 10),
                          child: SvgPicture.asset(
                            ImagePath.downArrow,
                            colorFilter: ColorFilter.mode(
                                error.isNotEmpty
                                    ? AppConfigs.der
                                    : accountController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4,
                                BlendMode.srcIn),
                          ),
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

Widget dummyTextField(String? text, bool isDark,
    {void Function()? onTap,
    void Function(String)? onTapTile,
    String error = '',
    List<String>? texts,
    bool filled = true,
    Widget? trailing,
    Widget? prefixIcon,
    String? labelText,
    bool downArrow = false,
    Key? key}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return GestureDetector(
      onTap: onTap,
      child: textFormField(
        controller: TextEditingController(text: text),
        enabled: false,
        errorText: error,
        labelText: labelText,
        prefixIcon: prefixIcon,
        trailing: trailing,
        key: key,
      ),
    );
  });
}

Widget dummyBottomField(String? text, bool isDark,
    {void Function()? onTap,
    void Function(String)? onTapTile,
    String error = '',
    List<String>? texts,
    bool filled = true,
    String? labelText,
    bool downArrow = false,
    Key? key}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return GestureDetector(
      onTap: onTap,
      child: textFormField(controller: TextEditingController(text: text), enabled: false, errorText: error, labelText: labelText, key: key),
    );
  });
}

Widget filterTile(String text, {bool visible = true, void Function(String)? onTap}) => Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap(text);
          }
        },
        child: Container(
          margin: const EdgeInsets.only(left: 3, right: 3),
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            color: AppConfigs.primaryColor.withOpacity(0.2),
          ),
          // alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text, style: TS.f12.copyWith(color: AppConfigs.accentColor)),
              Visibility(
                visible: text != 'Reset_Filter'.tr,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SvgPicture.asset(
                    ImagePath.close,
                    height: 12,
                    width: 12,
                    colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
