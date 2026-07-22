import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/flavours/constants.dart';
import '../../models/masters/master_response_fz.dart';
import 'base64_to_image.dart';

class CurrencyDropdownDashboard extends StatelessWidget {
  const CurrencyDropdownDashboard({
    super.key,
    this.value,
    required this.crItems,
    this.onChanged,
    this.height = 30,
    this.offset = const Offset(0, 0),
    this.textColor,
    this.dropdownTextColor,
  });

  final MasterResponseFZ? value;
  final List<MasterResponseFZ> crItems;
  final void Function(MasterResponseFZ?)? onChanged;
  final double height;
  final Offset offset;
  final Color? textColor; // For the selected item display
  final Color? dropdownTextColor; // For dropdown menu items

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.find<MainController>().isDark;
    final Color defaultTextColor = isDark ? AppConfigs.w : AppConfigs.bf0;

    return SizedBox(
      width: 105,
      height: height,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<MasterResponseFZ>(
          buttonStyleData: ButtonStyleData(
            width: 90,
            height: height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.transparent,
              border: Border.all(color: Colors.transparent),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: height,
            padding: EdgeInsets.zero,
          ),
          dropdownStyleData: DropdownStyleData(
            width: 90,
            offset: offset,
            maxHeight: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.transparent),
              color: isDark ? AppConfigs.b141313 : const Color(0xfff8f8f8),
            ),
          ),
          value: value,
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              size: 20,
            ),
          ),
          selectedItemBuilder: (BuildContext context) {
            return crItems.map<Widget>((MasterResponseFZ item) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(),
                    child: Base64Image(image: item.CurrencyFlagPath),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    item.Code.toUpperCase(),
                    style: TS.f16.copyWith(
                      color: textColor ?? defaultTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              );
            }).toList();
          },
          items: crItems
              .map(
                (e) => DropdownMenuItem<MasterResponseFZ>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(),
                        child: Base64Image(image: e.CurrencyFlagPath),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        e.Code.toUpperCase(),
                        style: TS.f16.copyWith(
                          color: dropdownTextColor ?? defaultTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          isExpanded: true,
        ),
      ),
    );
  }
}
