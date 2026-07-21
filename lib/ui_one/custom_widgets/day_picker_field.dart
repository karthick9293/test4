import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/account_controller.dart';
import 'package:mobiremit/core/flavours/constants.dart';

import '../../core/exports/ui_one_custom_widgets.dart';

class DayPickerField extends StatelessWidget {
  final List<TextEditingController> ctrls;
  final List<FocusNode> nodes;
  final int? selectedDay;
  final DateTime currentDate;
  final Function(bool, {int? day}) onSelected;
  final String? title;
  final Color? textColor;
  final String error;
  final double topMargin;
  final double left;
  final double right;

  DayPickerField({
    super.key,
    required this.ctrls,
    required this.nodes,
    this.selectedDay,
    DateTime? currentDate,
    required this.onSelected,
    this.title,
    this.textColor,
    this.error = '',
    this.topMargin = 8,
    this.left = 20,
    this.right = 20,
  }) : currentDate = currentDate ?? DateTime.now();

  void validate() {
    if (ctrls[0].text.isNotEmpty) {
      int? day = int.tryParse(ctrls[0].text);
      int maxDay = DateTime(currentDate.year, currentDate.month + 1, 0).day;

      bool isValid = !(day == null || day < 1 || day > maxDay);

      onSelected(isValid, day: int.parse(ctrls[0].text));
    } else {
      onSelected(false);
    }
  }

  Widget field(
      {required TextEditingController c,
      required FocusNode n1,
      required String ht,
      void Function()? onEditingComplete,
      void Function()? onTap,
      void Function(String)? onChanged}) {
    return GetBuilder<AccountController>(builder: (ac) {
      return Container(
        margin: EdgeInsets.only(top: topMargin),
        height: 30,
        child: TextField(
          controller: c,
          focusNode: n1,
          style: TS.f16.copyWith(
              color: ac.isDark ? AppConfigs.w : textColor ?? AppConfigs.g4),
          maxLength: 2,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          onTap: onTap,
          maxLengthEnforcement: services.MaxLengthEnforcement.enforced,
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.bottom,
          inputFormatters: [services.FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 13),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: TS.f16.copyWith(
                  color: error.isNotEmpty
                      ? AppConfigs.der
                      : ac.isDark
                          ? AppConfigs.g8f
                          : AppConfigs.g77),
              hintText: ht),
          onEditingComplete: onEditingComplete,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (ac) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: left, bottom: 5, top: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              title ?? 'Salary_Release_Date'.tr,
              style: TextStyles.font12
                  .copyWith(color: ac.isDark ? AppConfigs.g8f : AppConfigs.g77),
            ),
          ),
          Container(
            // key: key,
            margin: EdgeInsets.only(left: left, right: right),
            padding: const EdgeInsets.only(left: 10, right: 15),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: ac.isDark ? AppConfigs.g21 : null,
              border: Border.all(
                  color: error.isNotEmpty
                      ? AppConfigs.der
                      : ac.isDark
                          ? AppConfigs.g21
                          : AppConfigs.gd7),
            ),
            child: Row(
              children: [
                Expanded(
                  child: field(
                    c: ctrls[0],
                    n1: nodes[0],
                    ht: 'DD',
                    onChanged: (v) {
                      validate();
                    },
                    onEditingComplete: () {
                      // Add leading zero only when leaving the field if it's a single digit
                      if (ctrls[0].text.length == 1) {
                        ctrls[0].text = ctrls[0].text.padLeft(2, '0');
                      }
                      ctrls[1].text =
                          currentDate.month.toString().padLeft(2, '0');
                      ctrls[2].text = currentDate.year.toString();
                      nodes[0].unfocus();

                      validate();
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => DayPicker(
                        onSelected: (day) {
                          if (day.toString().length == 1) {
                            ctrls[0].text = day.toString().padLeft(2, '0');
                          } else {
                            ctrls[0].text = day.toString();
                          }
                          ctrls[1].text =
                              currentDate.month.toString().padLeft(2, '0');
                          ctrls[2].text = currentDate.year.toString();

                          nodes[0].unfocus();

                          onSelected(true, day: day); // call onSelected event
                        },
                        currentDate: currentDate,
                        selectedDay: selectedDay,
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      ImagePath.calendar,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        error.isNotEmpty
                            ? AppConfigs.der
                            : ac.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: error.isNotEmpty,
            child: Container(
              margin: EdgeInsets.only(right: S.p, top: 3, left: S.p),
              alignment: Alignment.centerRight,
              child: Text(error,
                  style: TS.f12.copyWith(
                      color: AppConfigs.der, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start),
            ),
          )
        ],
      );
    });
  }
}
