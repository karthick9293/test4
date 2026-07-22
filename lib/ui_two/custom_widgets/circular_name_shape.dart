import 'package:flutter/material.dart';

import '../../core/flavours/constants.dart';

Widget circularNameShape(String text) {
  return Container(
    width: 33,
    height: 33,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xff05a6dd), width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyles.font14.copyWith(
          fontWeight: FontWeight.w600,
          color: const Color(0xff05a6dd),
        ),
      ),
    ),
  );
}
