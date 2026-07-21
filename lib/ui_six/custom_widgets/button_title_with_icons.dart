
import 'package:flutter/material.dart';

import '../../core/flavours/constants.dart';

Widget buttonTitleWithIcons(String title){
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(title,style: TS.f16.copyWith(color: Colors.white),),
      SizedBox(width: 10,),
      Icon(Icons.arrow_forward,color: Colors.white)
    ],
  );
}