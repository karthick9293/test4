// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// import '../../../../core/controllers/account_controller.dart';
// import '../../../../core/controllers/bill_pay_controller.dart';
// import '../../../../core/controllers/main_controller.dart';
// import '../../../../core/exports/ui_six_pages.dart';
// import '../../../../core/icons/svg_icons.dart';
// import '../../../../core/models/carousel_item.dart';
// import '../../../../core/flavours/constants.dart';
//
// class BillRechargeMorePage extends GetView {
//   const BillRechargeMorePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var index = 0.obs;
//     CarouselSliderController sliderController = CarouselSliderController();
//     List<CarouselItem> tiles = [
//       CarouselItem(
//           img: ClientSpecificUI.cSplash1,
//           title: 'enjoy_with_us'.tr,
//           subtitle: 'Lorem_Ipsum_is_simply_dummy_text_of_the_printing'.tr,
//           description: 'Lorem_Ipsum_is_simply_dummy_text_of_the_printing'.tr),
//       CarouselItem(
//           img: ClientSpecificUI.splash1,
//           title: 'enjoy_with_us'.tr,
//           subtitle: 'Lorem_Ipsum_is_simply_dummy_text_of_the_printing'.tr,
//           description: 'Lorem_Ipsum_is_simply_dummy_text_of_the_printing'.tr),
//       CarouselItem(
//           img: ClientSpecificUI.splash1,
//           title: 'enjoy_with_us'.tr,
//           subtitle: 'Lorem_Ipsum_is_simply_dummy_text_of_the_printing'.tr,
//           description: 'Lorem_Ipsum_is_simply_dummy_text_of_the_printing'.tr),
//     ];
//     return GetBuilder<BillPayController>(builder: (billPayController) {
//       return Scaffold(
//         backgroundColor: AppConfigs.bodybg(billPayController.isDark),
//         body: SafeArea(
//           child: GetBuilder<MainController>(builder: (mainController) {
//             return ListView(
//               physics: const ClampingScrollPhysics(),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(30, 18, 30, 14.8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("pay_bills".tr,
//                           style: TextStyles.font12.copyWith(
//                             color: mainController.isDark
//                                 ? AppConfigs.g8f
//                                 : AppConfigs.g4,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           textAlign: TextAlign.start),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Text("pay_bills_of_your_family_and_friends".tr,
//                           style: TextStyles.font10.copyWith(
//                             color: mainController.isDark
//                                 ? AppConfigs.g8f
//                                 : AppConfigs.g4,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           textAlign: TextAlign.start),
//                       const SizedBox(height: 18),
//                       GetBuilder<AccountController>(builder: (mainController) {
//                         List<Widget> tiles = [];
//                         String featureString = Box3.settings.enableUTILITY;
//                         List<String> utilityTypes = [];
//                         if (featureString.isNotEmpty == true) {
//                           String featureData = featureString.toLowerCase();
//                           utilityTypes = featureData.split(",");
//                           if (utilityTypes.contains("mobile")) {
//                             tiles.add(dashtile2(
//                               SvgIcons.recharge,
//                               'Mobile'.tr,
//                               page: const PayBillPage(),
//                             ));
//                           } else if (utilityTypes.contains("dth")) {
//                             tiles.add(
//                               dashtile2(SvgIcons.dth, 'DTH'.tr,
//                                   page: const PayBillPage(), b: BillType.dth),
//                             );
//                           } else if (utilityTypes.contains("wifi")) {
//                             tiles.add(
//                               dashtile2(SvgIcons.wifi, 'WiFi'.tr,
//                                   page: const PayBillPage(), b: BillType.wifi),
//                             );
//                           } else if (utilityTypes.contains("gas")) {
//                             tiles.add(
//                               dashtile2(SvgIcons.gas, 'Gas'.tr,
//                                   page: const PayBillPage(), b: BillType.gas),
//                             );
//                           } else if (utilityTypes.contains("electricity")) {
//                             tiles.add(
//                               dashtile2(SvgIcons.electricity, 'Electricity'.tr,
//                                   page: const PayBillPage(), b: BillType.elec),
//                             );
//                           } else if (utilityTypes.contains("rent")) {
//                             tiles.add(
//                               dashtile2(
//                                 SvgIcons.rent,
//                                 'Rent'.tr,
//                                 page: const PayBillPage(),
//                               ),
//                             );
//                           } else if (utilityTypes.contains("education")) {
//                             tiles.add(
//                               dashtile2(
//                                 SvgIcons.education,
//                                 'Education'.tr,
//                                 page: const PayBillPage(),
//                               ),
//                             );
//                           } else if (utilityTypes.contains("credit card")) {
//                             tiles.add(
//                               dashtile2(
//                                 SvgIcons.creditCard,
//                                 'Credit_card'.tr,
//                                 page: const PayBillPage(),
//                               ),
//                             );
//                           } else if (utilityTypes.contains("water")) {
//                             tiles.add(dashtile2(
//                               SvgIcons.water,
//                               'Water'.tr,
//                               page: const PayBillPage(),
//                             ));
//                           }
//                         }
//
//                         Column tileColumn(int i) {
//                           return Column(
//                             children: [
//                               tiles.isNotEmpty ? tiles[i] : const SizedBox(),
//                               const SizedBox(height: 18),
//                               tiles.length > i + 4
//                                   ? tiles[i + 4]
//                                   : const SizedBox(),
//                               SizedBox(
//                                   height: tiles.length > 8 && i == 0 ? 18 : 0),
//                               tiles.length > 8 && i == 0
//                                   ? tiles[8]
//                                   : const SizedBox(),
//                             ],
//                           );
//                         }
//
//                         return Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children:
//                               [0, 1, 2, 3].map((e) => tileColumn(e)).toList(),
//                         );
//                       }),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(25, 18, 25, 14.8),
//                   child: Stack(
//                     children: [
//                       CarouselSlider(
//                         options: CarouselOptions(
//                           onPageChanged: (value, reason) {
//                             index.value = value;
//                           },
//                           height: 119.0,
//                           viewportFraction: 1.0,
//                           enlargeCenterPage: false,
//                         ),
//                         items: [1, 2, 3].map((i) {
//                           return Builder(
//                             builder: (BuildContext context) {
//                               return Stack(
//                                 children: [
//                                   SvgPicture.asset(mainController.isDark
//                                       ? SvgIcons.adBgl
//                                       : SvgIcons.adBgl),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 35, top: 24),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("enjoy_with_us".tr,
//                                             style: TextStyles.font12.copyWith(
//                                               color: const Color(0xff444444),
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                             textAlign: TextAlign.start),
//                                         Text("5Cr+ Users",
//                                             style: TextStyles.font20.copyWith(
//                                               color: AppConfigs.primaryColor,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                             textAlign: TextAlign.start),
//                                         Text(
//                                             "Lorem_Ipsum_is_simply_dummy_text_of_the_printing"
//                                                 .tr,
//                                             style: TextStyles.font8.copyWith(
//                                               color: const Color(0xff444444),
//                                             ),
//                                             textAlign: TextAlign.start),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         }).toList(),
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         left: 0,
//                         child: Obx(
//                           () => Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: tiles.asMap().entries.map((entry) {
//                               return GestureDetector(
//                                 onTap: () =>
//                                     sliderController.animateToPage(entry.key),
//                                 child: Container(
//                                   width: 7.0,
//                                   height: 7.0,
//                                   margin: const EdgeInsets.symmetric(
//                                       vertical: 8.0, horizontal: 4.0),
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: index.value != entry.key
//                                         ? AppConfigs.primaryColor
//                                             .withOpacity(0.5)
//                                         : AppConfigs.primaryColor,
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 30, bottom: 25.6, right: 30),
//                   child: Row(
//                     children: [
//                       Container(
//                           width: 4,
//                           height: 23.412109375,
//                           decoration:
//                               const BoxDecoration(color: Color(0xffff8800))),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5.5),
//                         child: Text("easy_pay_yours_any_bills".tr,
//                             style: TS.f12.copyWith(
//                                 color: mainController.isDark
//                                     ? AppConfigs.g8f
//                                     : AppConfigs.g4),
//                             textAlign: TextAlign.start),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }),
//         ),
//       );
//     });
//   }
// }
