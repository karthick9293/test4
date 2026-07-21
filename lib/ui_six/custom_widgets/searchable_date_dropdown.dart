import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/flavours/constants.dart';

final List<GlobalKey<AutoCompleteTextFieldState<String>>> keys = [
  GlobalKey<AutoCompleteTextFieldState<String>>(),
  GlobalKey<AutoCompleteTextFieldState<String>>(),
  GlobalKey<AutoCompleteTextFieldState<String>>()
];

Widget searchableDateDropdown({
  required List<TextEditingController> ctrlrs,
  required List<FocusNode> nodes,
  required List<String> days,
  required List<dynamic Function(String)?> onEditingComplete,
  dynamic Function(String)? monthChange,
  String? title,
}) {
  List<String> years = Iterable<String>.generate(100, (i) => (i = DateTime.now().year - i).toString()).toList();
  List<String> months = Iterable<String>.generate(12, (i) => (i + 1).toString()).toList();

  Widget customField(
      {String? hintText,
      List<String>? suggestions,
      dynamic Function(String)? onSubmit,
      FocusNode? focusNode,
      required final GlobalKey<AutoCompleteTextFieldState<String>> key,
      dynamic Function(String)? textChanged,
      TextEditingController? controller}) {
    return Expanded(
      child: SimpleAutoCompleteTextField(
          focusNode: focusNode,
          decoration: InputDecoration(
              focusedBorder:
                  const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(color: ConstColors.greyd7)),
              enabledBorder:
                  const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)), borderSide: BorderSide(color: ConstColors.greyd7)),
              contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
              labelText: hintText,
              labelStyle: TextStyles.font14,
              hintStyle: TextStyles.font14),
          key: key,
          controller: controller,
          textCapitalization: TextCapitalization.none,
          suggestions: suggestions ?? [],
          clearOnSubmit: false,
          suggestionsAmount: 8,
          textChanged: textChanged,
          keyboardType: TextInputType.number,
          submitOnSuggestionTap: true,
          textSubmitted: onSubmit),
    );
  }

  return Column(
    children: [
      Container(
        padding: const EdgeInsets.only(left: 20, bottom: 5, top: 0),
        alignment: Alignment.centerLeft,
        child: Text(
          title ?? 'Date_of_Birth'.tr,
          style: TextStyles.font12.copyWith(color: ConstColors.grey4),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            customField(
              controller: ctrlrs[0],
              focusNode: nodes[0],
              hintText: 'days'.tr,
              key: keys[0],
              onSubmit: onEditingComplete[0],
              suggestions: days,
            ),
            const SizedBox(width: 15),
            customField(
              controller: ctrlrs[1],
              focusNode: nodes[1],
              hintText: 'month'.tr,
              key: keys[1],
              textChanged: monthChange,
              onSubmit: onEditingComplete[1],
              suggestions: months,
            ),
            const SizedBox(width: 15),
            customField(
              controller: ctrlrs[2],
              focusNode: nodes[2],
              hintText: 'year'.tr,
              key: keys[2],
              onSubmit: onEditingComplete[2],
              suggestions: years,
            ),
          ],
        ),
      ),
    ],
  );
}
