// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// import '../../core/exports/controllers.dart';
// import '../../core/exports/ui_one_custom_widgets.dart';
// import '../../core/exports/ui_one_pages.dart';
// import '../../core/icons/home_svgs.dart';
// import '../../others/constants.dart';
// import '../screens/sign_up/uae_details_confirm.dart';
//
// Widget retryAlert({required String msg, required String type, required String isFrom}) {
//   return GetBuilder<AccountController>(builder: (_) {
//     return Align(
//       alignment: Alignment.center,
//       child: Material(
//         color: Colors.transparent,
//         child: Container(
//           width: 400,
//           height: 270,
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.all(Radius.circular(20)),
//               boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
//               color: _.isDark ? AppConfigs.bf0 : AppConfigs.w),
//           margin: const EdgeInsets.only(left: 20, right: 20),
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     alignment: Alignment.topRight,
//                     child: GestureDetector(
//                       onTap: () => Get.back(),
//                       child: SvgPicture.asset(
//                         ImagePath.close,
//                         height: 20,
//                         width: 20,
// colorFilter: ColorFilter.mode(
//                           AppConfigs.primaryColor, BlendMode.srcIn),
//                       ),
//                     ),
//                   ),
//                   Center(child: SvgPicture.asset(HomeSvgs.deviceVerify)),
//                 ],
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 '${'Alert'.tr}!',
//                 style: TS.f20.copyWith(color: _.isDark ? AppConfigs.w : AppConfigs.bf0),
//               ),
//               const SizedBox(height: 10),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     msg,
//                     style: TS.f14.copyWith(
//                       color: _.isDark ? AppConfigs.w : AppConfigs.g4,
//                     ),
//                     textAlign: TextAlign.justify,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               _.retryLoading
//                   ? Center(
//                       child: tinyLoader(size: 20, width: 1.5),
//                     )
//                   : roundButton('Retry'.tr, noMar: true, onTap: () async {
//                       _.retryLoading = true;
//                       Get.find<SignUpController>().docShareRetry = true;
//                       _.update();
//                       Get.back();
//                       if (isFrom == 'Dash') {
//                         _.signWithUAEPassDash();
//                       } else {
//                         // if (Get.currentRoute != AppRoutes.loadingRoutes) {
//                         //   await Get.toNamed(AppRoutes.loadingRoutes);
//                         // }
//                         if (await Get.find<SignUpController>().isUAEPassDataDetails(isFromSignUp: isFrom)) {
//                           var data = Get.find<SignUpController>().uaePassData?[0];
//                           var urls = Get.find<SignUpController>().urls;
//                           var formData = Get.find<SignUpController>().formData;
//                           _.retryLoading = false;
//                           Get.find<SignUpController>().docShareRetry = false;
//                           _.update();
//                           Get.back();
//
//                           if (data?.reqAuthorized == 'I' || data?.reqAuthorized == 'Y') {
//                             Get.showSnackbar(GetSnackBar(
//                               messageText: Text(
//                                 "Profile data received successfully from UAE PASS.",
//                                 style: TS.f14.copyWith(color: AppConfigs.w),
//                               ),
//                               backgroundColor: (AppConfigs.dg).withOpacity(0.7),
//                               duration: const Duration(seconds: 2),
//                             ));
//                             Get.to(() => UAEConfirmDetails(formData, () => Get.toNamed(AppRoutes.signUp), urls));
//                           }
//                         } else {
//                           _.retryLoading = false;
//                           _.update();
//                           Get.back();
//                         }
//                       }
//                     }),
//               const Spacer(),
//               roundButton('cancel'.tr, noMar: true, onTap: () {
//                 Get.back();
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   });
// }
