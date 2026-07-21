// import 'package:flutter/material.dart';
// import 'package:flutter_swipe_button/flutter_swipe_button.dart';
// import 'package:get/get.dart';
// import 'package:widget_and_text_animator/widget_and_text_animator.dart';
// import '../../others/constants.dart';
//
// Widget roundButtonSwipe(String text,
//     {Function()? onTap,
//     bool borderOnly = false,
//     bool noMar = false,
//     double? left,
//     double? top,
//     double? right,
//     double? bottom,
//     double? width,
//     double? height,
//     Color? borderColor,
//     Color? fillColor,
//     Color? textColor,
//     TextDecoration? textDecoration,
//     Color? color,
//     double fontSize = 16,
//     Key? key}) {
//   return Container(
//     margin: noMar ? EdgeInsets.zero : EdgeInsets.fromLTRB(left ?? S.p, top ?? 0, right ?? S.p, bottom ?? S.p),
//     width: width,
//     key: key,
//     alignment: Alignment.center,
//     child: SwipeButton.expand(
//       thumb: Container(
//         margin: const EdgeInsets.all(2),
//         decoration: const BoxDecoration(
//           color: AppConfigs.w,
//           shape: BoxShape.circle,
//         ),
//         child: WidgetAnimator(
//           atRestEffect: WidgetRestingEffects.wave(),
//           child: Icon(
//             Icons.double_arrow_rounded,
//             color: AppConfigs.primaryColor,
//           ),
//         ),
//       ),
//       activeThumbColor: const Color(0xFFEF9A9A),
//       activeTrackColor: AppConfigs.primaryColor,
//       inactiveTrackColor: const Color(0xFFEF9A9A),
//       onSwipeEnd: onTap ?? Get.back,
//       child: Text(
//         text,
//         style: TS.f16.copyWith(color: textColor ?? (borderOnly == true ? ConstColors.primary : ConstColors.buttonTextColor), fontSize: fontSize, decoration: textDecoration),
//       ),
//     ),
//   );
// }
