import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget newDateField(
    {required TextEditingController ctrls,
    required FocusNode nodes,
    required Function() update,
    void Function()? onComplete,
    required void Function(bool, {DateTime? date}) erfc,
    int? maxLines,
    bool disableBorder = false,
    String errorText = '',
    DateTime? firstDate,
    DateTime? initialDate,
    DateTime? lastDate,
    double cHeight = 40,
    Color? filledColor,
    String error = '',
    double? top,
    double? left,
    double? right,
    TextStyle? style,
    EdgeInsetsGeometry? contentPadding,
    double? bottom,
    String? hintText,
    String? labelText,
    Key? key,
    required context}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: cHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: accountController.isDark ? (errorText.isNotEmpty ? AppConfigs.errorFillDark : AppConfigs.g21) : filledColor,
          ),
          margin: EdgeInsets.fromLTRB(left ?? S.p, top ?? 10, right ?? S.p, bottom ?? 0),
          child: TextFormField(
            controller: ctrls,
            key: key,
            maxLines: maxLines ?? (cHeight > 50 ? 30 : 1),
            decoration: InputDecoration(
              suffixIcon: const SizedBox(
                height: 24,
                width: 24,
                child: Icon(Icons.calendar_month_outlined),
              ),
              focusedBorder: disableBorder
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                          color: errorText.isNotEmpty
                              ? (accountController.isDark ? AppConfigs.errorBorderDark : AppConfigs.der)
                              : AppConfigs.primaryColor)),
              disabledBorder: disableBorder
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(
                          color: errorText.isNotEmpty ? (accountController.isDark ? AppConfigs.errorBorderDark : AppConfigs.der) : AppConfigs.gd7)),
              enabledBorder: disableBorder
                  ? InputBorder.none
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      borderSide:
                          BorderSide(color: errorText.isNotEmpty ? AppConfigs.der : (accountController.isDark ? AppConfigs.g21 : AppConfigs.gd7))),
              contentPadding: contentPadding ?? EdgeInsets.fromLTRB(15, disableBorder ? 10 : 0, 15, disableBorder ? 13 : 20),
              hintText: hintText,
              labelText: labelText ?? 'Date_of_Birth'.tr,
              labelStyle: TS.f16.copyWith(
                  color: accountController.isDark
                      ? (errorText.isEmpty ? AppConfigs.g8f : AppConfigs.errorBorderDark)
                      : (errorText.isNotEmpty ? AppConfigs.der : AppConfigs.g77)),
              hintStyle: TS.f16.copyWith(
                  color: accountController.isDark
                      ? (errorText.isEmpty ? AppConfigs.g8f : AppConfigs.errorBorderDark)
                      : (errorText.isNotEmpty ? AppConfigs.der : AppConfigs.g77)),
            ),
            style: style ?? TS.f16.copyWith(color: accountController.isDark ? AppConfigs.gd7 : AppConfigs.g4),
            readOnly: true,
            onTap: () async {
              DateTime n = DateTime.now();
              DateTime? selected = await showDatePicker(
                  context: context,
                  initialDate: initialDate ?? DateTime(n.year - 18, n.month, n.day + 1),
                  firstDate: firstDate ?? DateTime(1900),
                  lastDate: lastDate ?? DateTime(n.year, n.month, n.day));
              if (selected != null) {
                var day = selected.day < 10 ? '0${selected.day}' : '${selected.day}';
                var month = selected.month < 10 ? '0${selected.month}' : '${selected.month}';
                var year = '${selected.year}';

                ctrls.text = "$day / $month / $year";

                if (nodes.hasFocus) {
                  nodes.unfocus();
                }

                if (onComplete != null) {
                  erfc(true);
                  onComplete();
                }
                update();
              }
            },
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
