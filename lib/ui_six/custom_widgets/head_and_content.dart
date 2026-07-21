import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget singleHeadAndContentColumn(List<List<String>> data, {CrossAxisAlignment? c}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Column(
      crossAxisAlignment: c ?? CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: data
          .map((e) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: TS.f14.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g77, fontWeight: FontWeight.w600),
                      text: e[0]),
                  TextSpan(
                      style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4, fontWeight: FontWeight.w600),
                      text: e[1]),
                ])),
          ))
          .toList(),
    );
  });
}

Widget singleHeadAndContentRow(List<List<String>> data, {CrossAxisAlignment? c}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: data
          .map((e) => RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g77, fontWeight: FontWeight.w600),
                    text: e[0]),
                TextSpan(
                    style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4, fontWeight: FontWeight.w600),
                    text: e[1]),
              ])))
          .toList(),
    );
  });
}

Widget headAndContent(String s1, String s2, String s3, String s4, {bool primaryColor = false}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Row(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              style: TextStyles.font12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4, fontWeight: FontWeight.w600),
              text: s1),
          TextSpan(
              style: GoogleFonts.openSans(color: const Color(0xff0e0e0e), fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 12.0),
              text: s2),
        ])),
        Expanded(
          child: RichText(
              text: TextSpan(children: [
            TextSpan(style: TextStyles.font12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4), text: s3),
            TextSpan(
                style: GoogleFonts.openSans(
                    color: accountController.isDark ? AppConfigs.g8f : const Color(0xff0e0e0e),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0),
                text: s4),
          ])),
        ),
      ],
    );
  });
}
