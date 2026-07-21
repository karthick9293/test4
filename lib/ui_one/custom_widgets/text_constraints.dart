import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/flavours/constants.dart';

Widget textConstratint(String text, bool b) {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.only(right: 4),
        width: 6,
        height: 6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff202020),
        ),
      ),
      Expanded(
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TS.f12.copyWith(color: AppConfigs.g77),
        ),
      ),
      Visibility(
        visible: b,
        child: SvgPicture.asset(
          ImagePath.transactionDone,
          height: 20,
          width: 20,
        ),
      )
    ],
  );
}
