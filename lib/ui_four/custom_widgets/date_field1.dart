import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget dateField1(
    {required List<TextEditingController> ctrls,
    required List<FocusNode> nodes,
    required Function() update,
    void Function()? onComplete,
    required void Function(bool, {DateTime? date}) erfc,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String error = '',
    double left = 20,
    double right = 20,
    double topMargin = 8,
    String? title,
    Key? key,
    required context}) {
  Widget field(
      {required TextEditingController c,
      required FocusNode n1,
      FocusNode? n2,
      double width = 0,
      required String ht,
      void Function()? onEditingComplete,
      void Function(String)? onChanged}) {
    return GetBuilder<AccountController>(builder: (accountController) {
      return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 20),
        child: IntrinsicWidth(
          child: Container(
            margin: EdgeInsets.only(top: topMargin),
            // width: width,
            // width: ht == 'yyyy' ? 40 : 30,
            height: 30,
            child: TextField(
              controller: c,
              style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
              maxLength: ht == 'yyyy' ? 4 : 2,
              textAlign: TextAlign.start,
              keyboardType: TextInputType.number,
              onTap: () {
                if (ht == 'mm' && (int.tryParse(ctrls[0].text) ?? 0) <= 3 && ctrls[0].text.length == 1) {
                  ctrls[0].text = '0${ctrls[0].text}';
                }
                if (ht == 'yyyy' && (int.tryParse(ctrls[1].text) ?? 0) < 2 && ctrls[1].text.length == 1) {
                  ctrls[1].text = '0${ctrls[01].text}';
                }
              },
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              focusNode: n1,
              onChanged: onChanged,
              textAlignVertical: TextAlignVertical.bottom,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                  counterText: '',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: TS.f16.copyWith(
                      color: error.isNotEmpty
                          ? AppConfigs.der
                          : accountController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g77),
                  hintText: ht),
              onEditingComplete: onEditingComplete ??
                  () {
                    n2?.requestFocus();
                  },
            ),
          ),
        ),
      );
    });
  }

  return GetBuilder<AccountController>(builder: (accountController) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: left, bottom: 5, top: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            title ?? 'Date_of_Birth'.tr,
            style: TextStyles.font12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g77),
          ),
        ),
        Container(
          key: key,
          margin: EdgeInsets.only(left: left, right: right),
          padding: const EdgeInsets.only(left: 10, right: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: accountController.isDark ? AppConfigs.g21 : null,
            border: Border.all(
                color: error.isNotEmpty
                    ? AppConfigs.der
                    : accountController.isDark
                        ? AppConfigs.g21
                        : AppConfigs.gd7),
          ),
          child: Row(
            children: [
              field(
                // width:30,
                c: ctrls[0],
                n1: nodes[0],
                n2: nodes[1],
                ht: 'dd',
                onChanged: (v) {
                  if (error.isNotEmpty && v.isNotEmpty) {
                    error = '';
                  }
                  if (int.parse(v) > 3 || v.length == 2) {
                    if (int.parse(v) > 3 && v.length == 1) {
                      ctrls[0].text = '0${ctrls[0].text}';
                    }
                    nodes[1].requestFocus();
                  }
                },
              ),
              Text(
                '/',
                style: TextStyles.font16.copyWith(color: ConstColors.grey4),
              ),
              field(
                // width: 30,
                c: ctrls[1],
                n1: nodes[1],
                n2: nodes[2],
                ht: 'mm',
                onChanged: (v) {
                  if (v.isEmpty) {
                    nodes[0].requestFocus();
                  } else if (int.parse(v) > 1 || v.length == 2) {
                    if (int.parse(v) > 1 && v.length == 1) {
                      ctrls[1].text = '0${ctrls[1].text}';
                    }
                    nodes[2].requestFocus();
                  }
                },
              ),
              Text(
                '/',
                style: TextStyles.font16.copyWith(color: ConstColors.grey4),
              ),
              field(
                  // width: 40,
                  c: ctrls[2],
                  n1: nodes[2],
                  ht: 'yyyy',
                  onChanged: (v) {
                    if (v.isEmpty) {
                      nodes[1].requestFocus();
                    } else if (v.length == 4) {
                      int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
                      DateTime dt = DateTime(y, m, d);
                      if (dt.year == y &&
                          dt.month == m &&
                          dt.day == d &&
                          (lastDate != null ? dt.isBefore(lastDate) : true) &&
                          (firstDate != null ? dt.isAfter(firstDate) : true)) {
                        if (nodes.length > 3) {
                          nodes[3].requestFocus();
                        }
                        if (onComplete != null) {
                          onComplete();
                        }

                        erfc(true, date: dt);
                      } else {
                        erfc(false);
                      }
                    } else {
                      erfc(true);
                    }
                  },
                  onEditingComplete: () {
                    int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
                    DateTime dt = DateTime(y, m, d);
                    if (dt.year == y &&
                        dt.month == m &&
                        dt.day == d &&
                        (lastDate != null ? DateTime(y, m, d).isBefore(lastDate) : true) &&
                        (firstDate != null ? DateTime(y, m, d).isAfter(firstDate) : true) &&
                        onComplete != null) {
                      onComplete();
                    }
                  }),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      nodes[ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty && ctrls[2].text.isNotEmpty ? 2 : 0].requestFocus();
                    },
                    child: Container(
                      height: 40,
                      color: Colors.transparent,
                    )),
              ),
              GestureDetector(
                onTap: () async {
                  DateTime n = DateTime.now();
                  DateTime? selected = await showDatePicker(
                      context: context,
                      initialDate: initialDate ?? DateTime(n.year - 18, n.month, n.day),
                      firstDate: firstDate ?? DateTime(1900),
                      lastDate: lastDate ?? DateTime(n.year, n.month, n.day));
                  if (selected != null) {
                    ctrls[0].text = selected.day < 10 ? '0${selected.day}' : '${selected.day}';
                    ctrls[1].text = selected.month < 10 ? '0${selected.month}' : '${selected.month}';
                    ctrls[2].text = '${selected.year}';
                    if (nodes[2].hasFocus) {
                      nodes[2].unfocus();
                    }
                    if (onComplete != null) {
                      erfc(true);
                      onComplete();
                    }
                    update();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    ImagePath.calendar,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                        error.isNotEmpty
                            ? AppConfigs.der
                            : accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4,
                        BlendMode.srcIn),
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
            child: Text(error, style: TS.f12.copyWith(color: AppConfigs.der, fontWeight: FontWeight.w600), textAlign: TextAlign.start),
          ),
        )
      ],
    );
  });
}
