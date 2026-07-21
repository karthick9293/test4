// import 'package:mobiremit/core/icons/svg_icons.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../network/api_service_new.dart';
// import '../../../core/exports/controllers.dart';
// import '../../../core/exports/ui_six_custom_widgets.dart';
// import '../../../core/exports/ui_six_pages.dart';
// import '../../../flavors.dart';
// import '../../../others/constants.dart';
//
// class ValidateOtp extends StatelessWidget {
//   const ValidateOtp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     bool isDark = Get.find<AccountController>().isDark;
//     Map<String, dynamic> arguments = Get.arguments ?? {};
//     String stepOrderId = arguments['stepOrderId'] ?? '';
//     String customerCode = arguments['customerCode'] ?? '';
//     String idNumber = arguments['idNumber'] ?? '';
//     return Scaffold(
//       backgroundColor: AppConfigs.bodybg(isDark),
//       body: Column(
//         children: [
//           appBar0(cms(Fields.ValidateOTP_PageHeading).textHeading!, onTap2: Get.back),
//           Expanded(
//             child: ListView(
//               physics: const ClampingScrollPhysics(),
//               children: [
//                 Align(
//                   alignment: Alignment.center,
//                   child: Material(
//                     color: Colors.transparent,
//                     child: GetBuilder<SignUpController>(builder: (t) {
//                       return Container(
//                         margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
//                         padding: const EdgeInsets.fromLTRB(15, 27, 15, 0),
//                         decoration: BoxDecoration(
//                             borderRadius: const BorderRadius.all(Radius.circular(20)),
//                             boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
//                             color: AppConfigs.bodybg(isDark)),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Align(alignment: Alignment.center, child: SvgPicture.asset(SvgIcons.otp)),
//                             Text(
//                                 '${cms(Fields.ConfirmAuthentication_OTPText).textHeading}${Box3.status == AppStatus.loggedIn ? (' +${AppConfigs.countryCode} ${Box3.customerDetailsFZ?.data?.mobileNo ?? ''}') : ''}',
//                                 style: TS.f14.copyWith(color: t.isDark ? AppConfigs.gd7 : AppConfigs.g4),
//                                 textAlign: TextAlign.start),
//                             textFormField(
//                                 controller: t.mobOTP,
//                                 left: 0,
//                                 right: 0,
//                                 labelText: t.isDark ? null : 'OTP'.tr,
//                                 hintText: t.isDark ? 'OTP'.tr : null,
//                                 obscure: true,
//                                 maxLines: 1,
//                                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                                 maxLength: 6,
//                                 keyboardType: const TextInputType.numberWithOptions(signed: true),
//                                 errorText: t.errorText,
//                                 onChanged: (v) {
//                                   t.update();
//                                 }),
//                             Row(
//                               children: [
//                                 Text("${"Enter the".tr} ${5} ${"digit OTP".tr}",
//                                     style: TS.f14.copyWith(color: isDark ? AppConfigs.gd7 : AppConfigs.g4), textAlign: TextAlign.start),
//                                 const Spacer(),
//                                 t.sending
//                                     ? Text("Sending".tr, style: TS.f14.copyWith(color: AppConfigs.primaryColor), textAlign: TextAlign.start)
//                                     : t.timeToResend.abs() != 0
//                                         ? Row(
//                                             children: [
//                                               SvgPicture.asset(
//                                                 ImagePath.clockTime,
//                                                 height: 12,
//                                                 width: 12,
//                                               ),
//                                               const SizedBox(width: 5),
//                                               Text(
//                                                 "${t.timeToResend.abs()}s",
//                                                 style: TextStyles.font12.copyWith(
//                                                   fontWeight: FontWeight.w400,
//                                                   color: const Color(0xff444444),
//                                                 ),
//                                               ),
//                                             ],
//                                           )
//                                         : GestureDetector(
//                                             onTap: () async {
//                                               t
//                                                 ..sending = true
//                                                 ..update();
//
//                                               var validateLoginOTP = [
//                                                 {
//                                                   "IDNUMBER",
//                                                   Box3.customerDetailsFZ?.data?.idNo ?? '',
//                                                 },
//                                                 {
//                                                   "MOBILE",
//                                                   Box3.customerDetailsFZ?.data?.mobileNo ?? '',
//                                                   // AppConfigs.countryCode + Box.userDataFZ?.mobileNo,
//                                                 },
//                                               ];
//
//                                               // if (await ApiService().resendOTP(validationType: "ID No", validationValue: validationValue)) {
//                                               if (await ApiService().generateOTP(userIdentification: "ID No")) {
//                                                 t.startTimer1();
//                                                 t
//                                                   ..sending = false
//                                                   ..update();
//                                                 t
//                                                   ..isResend = true
//                                                   ..update();
//                                               } else {
//                                                 t
//                                                   ..sending = false
//                                                   ..update();
//                                                 t
//                                                   ..isResend = false
//                                                   ..update();
//                                               }
//
//                                               // String? result = await ApiService().resendOTP(
//                                               //     validationType: "ID No",
//                                               //     validationValue: validationValue);
//                                               // if (result == 'Enter OTP') {
//                                               //
//                                               //
//                                               // }
//                                             },
//                                             child: Text(cms(Fields.ConfirmAuthentication_ResendOTPButton).textHeading!,
//                                                 style: TS.f14.copyWith(color: AppConfigs.primaryColor), textAlign: TextAlign.start),
//                                           )
//                               ],
//                             ),
//                             t.loading
//                                 ? loader(top: 15, bottom: 15)
//                                 : roundButton(cms(Fields.ConfirmAuthentication_ContinueButton).textHeading!, left: 0, right: 0, top: 15, onTap: () {
//                                     if (t.mobOTP.text.isEmpty) {
//                                       t.errorText = 'otp_required'.tr;
//                                       t.update();
//                                     } else if (t.mobOTP.text.length < 5) {
//                                       t.errorText = '${'Enter'.tr}${5} digit OTP';
//                                       t.update();
//                                     } else {
//                                       Map<String, dynamic> auth = t.credForm.buildJsonNew(t.credFormBV!.formFieldItem);
//                                       auth['Otp']=t.mobOTP.text;
//                                       t.addCustomer(customerData: t.form.buildJsonNew(t.formBV!.formFieldItem), authData: auth, stepOrderId: stepOrderId);
//                                     }
//                                   })
//                           ],
//                         ),
//                       );
//                     }),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
