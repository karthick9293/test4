import 'package:flutter/material.dart';

Widget dropDownButton({required Type t, required List<DropdownMenuItem> items, required Function(dynamic)? onChanged, required value}) {
  return Container(
    padding: const EdgeInsets.only(left: 12.5),
    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(5)), border: Border.all(color: const Color(0xffd9d7d7), width: 1)),
    height: 50,
    child: DropdownButtonHideUnderline(
      child: DropdownButton<dynamic>(
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    ),
  );
}
