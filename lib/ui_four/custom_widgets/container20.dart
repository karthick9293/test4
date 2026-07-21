import 'package:flutter/material.dart';

import '../../core/flavours/constants.dart';

Widget container20(
    {Color? color, Widget? child, double left = 0, double top = 0, double right = 0, double bottom = 0, double height = 20, double width = 20}) {
  return Container(
    margin: EdgeInsets.fromLTRB(left, top, right, bottom),
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color ?? ConstColors.grey4,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    ),
    child: child,
  );
}
