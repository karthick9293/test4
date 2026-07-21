// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../core/exports/controllers.dart';
// import '../../others/constants.dart';
//
// Widget curDropDown(String? value, {void Function(String?)? onChanged, double height = 30, Offset offset = const Offset(0, 0)}) {
//   List<String> imgs = [
//     ImagePath.aed,
//     ImagePath.bdt,
//     ImagePath.cad,
//     ImagePath.egp,
//     ImagePath.inr,
//     ImagePath.lkr,
//     ImagePath.npr,
//     ImagePath.omr,
//     ImagePath.php,
//     ImagePath.pkr,
//     ImagePath.qar,
//     ImagePath.usd,
//     ImagePath.idr
//   ];
//
//   return GetBuilder<MainController>(
//     builder: (_) {
//       return SizedBox(
//         width: 105,
//         height: height,
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton2<String>(
//             buttonStyleData: ButtonStyleData(
//                 width: 90,
//                 height: height,
//                 decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)), color: Colors.transparent, border: Border.all(color: Colors.transparent))),
//             menuItemStyleData: MenuItemStyleData(height: height, padding: EdgeInsets.zero),
//             dropdownStyleData: DropdownStyleData(
//                 width: 90,
//                 offset: offset,
//                 maxHeight: 200,
//                 decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(8)),
//                     border: Border.all(color: Colors.transparent),
//                     color: _.isDark ? AppConfigs.b141313 : const Color(0xfff8f8f8))),
//             value: value,
//             iconStyleData: const IconStyleData(
//                 icon: Icon(
//               Icons.arrow_drop_down,
//               size: 20,
//             )),
//             items: currencies
//                 .where((c) =>
//                     (Box3.settings.serviceCurrency )?.trim().isNotEmpty == true
//                         ? (Box3.settings.serviceCurrency )
//                                 ?.trim()
//                                 .split(',')
//                                 .contains(c) ==
//                             true
//                         : true)
//                 .where((c) => c != APIConstants.currency)
//                 .map(
//                   (e) => DropdownMenuItem<String>(
//                     value: e,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         const SizedBox(width: 10),
//                         Container(
//                           height: 20,
//                           width: 20,
//                           decoration: const BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: AppConfigs.gdc,
//                                 blurRadius: 5,
//                                 offset: Offset(0, 0), // Shadow position
//                               ),
//                             ],
//                           ),
//                           child: Image.asset(
//                             imgs[currencies.indexOf(e)],
//                             height: 20,
//                             width: 20,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Text(e..toUpperCase(), style: TS.f16.copyWith(color: _.isDark ? AppConfigs.w : AppConfigs.bf0, fontWeight: FontWeight.w600), textAlign: TextAlign.left),
//                       ],
//                     ),
//                   ),
//                 )
//                 .toList(),
//             onChanged: onChanged,
//             isExpanded: true,
//           ),
//         ),
//       );
//     },
//   );
// }
