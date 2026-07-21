// import 'dart:io';
//
// import 'package:mobiremit/core/icons/svg_icons.dart';
// import 'package:mobiremit/models/transaction/transaction_fz.dart';
// import 'package:filesaverplus/filesaverplus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:printing/printing.dart';
//
// import '../../../../core/controllers/account_controller.dart';
// import '../../../../core/controllers/transaction_controller.dart';
// import '../../../../core/controllers/transfer_controller.dart';
// import '../../../../core/exports/built_values.dart';
// import '../../../../core/exports/ui_one_custom_widgets.dart';
// import '../../../../core/models/formatter.dart';
// import '../../../../core/pdf_template/pdf_template3.dart';
// import '../../../../models/transaction_query_type/query_type_fz.dart';
// import '../../../../network/api_service_new.dart';
// import '../../../../others/constants.dart';
// import '../../../../ui_one/screens/home/my_transactions/transaction_cancel.dart';
// import 'transaction_complait.dart';
//
// Widget transactionDetailsAlert(Transaction transaction,
//     {GatewayDetailsBV? gateway, bool fromSendMoney = false}) {
//   bool sharing = false;
//   bool downloading = false;
//   Get.find<TransactionController>().getQueryTypes();
//   Widget contentTile(String t1, String t2, {bool isIcon = false}) {
//     return GetBuilder<AccountController>(builder: (accountController) {
//       return SizedBox(
//         height: 30,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(t1,
//                 style: TS.f12.copyWith(
//                     color: accountController.isDark
//                         ? AppConfigs.gd7
//                         : AppConfigs.g4)),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Visibility(
//                     visible: t1 ==
//                         cms(Fields.MyTransaction_TransactionRefNo).textHeading!,
//                     child: GestureDetector(
//                         onTap: () async {
//                           await Clipboard.setData(ClipboardData(text: t2));
//                           Get.snackbar('Alert',
//                               'Txn Reference number copied to clipboard',
//                               duration: const Duration(seconds: 1));
//                         },
//                         child: const Icon(Icons.copy, size: 14)),
//                   ),
//                   Visibility(
//                     visible: isIcon,
//                     child: SvgPicture.asset(
//                       ImagePath.transactionDone,
//                       height: 20,
//                       width: 20,
//                     ),
//                   ),
//                   // const Icon(Icons.check_circle_rounded, size: 16, color: AppConfigs.dg,),
//                   // const SizedBox(width: 5,),
//                   Expanded(
//                     flex: t1 ==
//                                 cms(Fields.MyTransaction_TransactionRefNo)
//                                     .textHeading! ||
//                             isIcon
//                         ? 0
//                         : 1,
//                     child: SelectableText(
//                       t2,
//                       textAlign: TextAlign.end,
//                       maxLines: 2,
//                       style: TS.f12.copyWith(
//                           color: accountController.isDark
//                               ? AppConfigs.gd7
//                               : AppConfigs.bf0),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       );
//     });
//   }
//
//   QueryTypeFz? selectedQueryType;
//   int length = Box3.settings.currencyDecimalLength;
//   return GetBuilder<AccountController>(builder: (accountController) {
//     // debugPrint(transaction.toJson());
//     return Container(
//       alignment: Alignment.center,
//       child: Container(
//         constraints: const BoxConstraints(minHeight: 500, maxHeight: 700),
//         margin: const EdgeInsets.only(left: 16, right: 16),
//         padding: const EdgeInsets.fromLTRB(17, 12, 17, 15),
//         decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(20)),
//             boxShadow: const [
//               BoxShadow(
//                   color: Color(0x29000000),
//                   offset: Offset(0, 0),
//                   blurRadius: 10,
//                   spreadRadius: 0)
//             ],
//             color: accountController.isDark ? AppConfigs.bf0 : AppConfigs.w),
//         child: Material(
//           color: Colors.transparent,
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     child: Text(transaction.header ?? '',
//                         style: TS.f18.copyWith(
//                             color: accountController.isDark
//                                 ? AppConfigs.w
//                                 : AppConfigs.g4),
//                         textAlign: TextAlign.start),
//                   ),
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
//                   )
//                 ],
//               ),
//               Center(
//                 child: Text(
//                     '${transaction.netAmount?.toString()} ${fromSendMoney ? Get.find<TransferController>().fromAmtCur : APIConstants.currency}',
//                     style: TS.f22.copyWith(
//                         color: accountController.isDark
//                             ? AppConfigs.w
//                             : AppConfigs.g4)),
//               ),
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                       width: 72,
//                       height: 72,
//                       decoration: BoxDecoration(
//                           boxShadow: transaction.status
//                                           ?.toLowerCase()
//                                           .contains('processing') ==
//                                       true ||
//                                   transaction.status == 'Success'
//                               ? [
//                                   const BoxShadow(
//                                       color: Color(0x29000000),
//                                       offset: Offset(0, 0),
//                                       blurRadius: 10,
//                                       spreadRadius: 0)
//                                 ]
//                               : null,
//                           color: accountController.isDark
//                               ? Colors.grey.shade700
//                               : Colors.white,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(36)))),
//                   transaction.header?.contains('Transfer Request Received') ==
//                               true ||
//                           transaction.header?.contains('Transaction Success') ==
//                               true
//                       ? SvgPicture.asset(ImagePath.transactionDone)
//                       : transaction.header?.contains('Failed') == true ||
//                               transaction.header?.contains('Cancel') == true
//                           ? SizedBox(
//                               height: 72,
//                               child: SvgPicture.asset(
//                                 SvgIcons.deviceVerify,
//                                 height: 50,
//                               ))
//                           : SvgPicture.asset(ImagePath.waitingTransaction),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Visibility(
//                     // visible: true,
//                     visible: transaction.status == 'Success',
//                     child: Row(
//                       children: [
//                         downloading
//                             ? tinyLoader(size: 24, width: 1.0)
//                             : GestureDetector(
//                                 onTap: () async {
//                                   downloading = true;
//                                   accountController.update();
//
//                                   if (Platform.isAndroid) {
//                                     accountController
//                                       ..downloadStatus = 'Downloading'.tr
//                                       ..update();
//                                   }
//
//                                   String? email = Get.find<AccountController>()
//                                       .contactUs
//                                       ?.data
//                                       ?.email;
//                                   String? phone = Get.find<AccountController>()
//                                       .contactUs
//                                       ?.data
//                                       ?.phoneNo;
//
//                                   var resp = await ApiService()
//                                       .transactionDetailsByRefNo(
//                                           referenceNo:
//                                               transaction.referenceNo ?? '');
//                                   if (resp == null) {
//                                     accountController
//                                       ..downloadStatus = ''
//                                       ..update();
//                                     Get.back();
//                                   } else {
//                                     var pdfTemplate = PdfTemplate3(resp,
//                                         email: email?.trim() ?? '',
//                                         mobile: phone?.trim() ?? '',
//                                         serviceProvider:
//                                             transaction.serviceProvider);
//                                     var printingPdf =
//                                         await pdfTemplate.printReceiptInPDF();
//                                     var resultData = await printingPdf.save();
//
//                                     var resultName =
//                                         "TransactionReceipt${DateTime.now().second.toString() + DateTime.now().minute.toString() + DateTime.now().hour.toString() + DateTime.now().day.toString() + DateTime.now().month.toString() + DateTime.now().year.toString()}.pdf";
//
//                                     await FileSaverPlus().saveFile(
//                                       resultData,
//                                       resultName,
//                                       "appliation/pdf",
//                                     );
//                                   }
//
//                                   if (Platform.isAndroid) {
//                                     accountController
//                                       ..downloadStatus =
//                                           'Saved_to_Download_Folder'.tr
//                                       ..update();
//                                   }
//
//                                   await Future.delayed(
//                                       const Duration(seconds: 2));
//                                   accountController
//                                     ..downloadStatus = ''
//                                     ..update();
//
//                                   downloading = false;
//                                   accountController.update();
//                                 },
//                                 child: SvgPicture.asset(
//                                   ImagePath.downloadTransactionDetail,
//                                   colorFilter: ColorFilter.mode(
//                                       AppConfigs.primaryColor, BlendMode.srcIn),
//                                 ),
//                               ),
//                         const SizedBox(width: 30),
//                         sharing
//                             ? tinyLoader(size: 24, width: 1.0)
//                             : GestureDetector(
//                                 onTap: () async {
//                                   sharing = true;
//                                   accountController.update();
//                                   String? email = Get.find<AccountController>()
//                                       .contactUs
//                                       ?.data
//                                       ?.email;
//                                   String? phone = Get.find<AccountController>()
//                                       .contactUs
//                                       ?.data
//                                       ?.phoneNo;
//
//                                   var resp = await ApiService()
//                                       .transactionDetailsByRefNo(
//                                           referenceNo:
//                                               transaction.referenceNo ?? '');
//
//                                   var pdfTemplate = PdfTemplate3(resp!,
//                                       email: email?.trim() ?? '',
//                                       mobile: phone?.trim() ?? '',
//                                       serviceProvider:
//                                           transaction.serviceProvider);
//                                   var printingPdf =
//                                       await pdfTemplate.printReceiptInPDF();
//                                   var resultData = await printingPdf.save();
//                                   var resultName =
//                                       "TransactionReceipt${DateTime.now().second.toString() + DateTime.now().minute.toString() + DateTime.now().hour.toString() + DateTime.now().day.toString() + DateTime.now().month.toString() + DateTime.now().year.toString()}.pdf";
//
//                                   // var resultName =
//                                   //     "${"Transaction".tr}${transaction.referenceNo}-${DateTime.now()}.pdf";
//                                   await Printing.sharePdf(
//                                       bytes: resultData, filename: resultName);
//                                   sharing = false;
//                                   accountController.update();
//                                 },
//                                 child: SvgPicture.asset(
//                                     ImagePath.shareTransactionDetail,
//                                     colorFilter: ColorFilter.mode(
//                                         AppConfigs.primaryColor,
//                                         BlendMode.srcIn))),
//                         // GestureDetector(
//                         //     onTap: () => transactionShare(transaction),
//                         //     child:
//                         //         SvgPicture.asset(ImagePath.shareTransactionDetail)),
//                         const SizedBox(width: 30),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Visibility(
//                         visible: !fromSendMoney,
//                         child: GestureDetector(
//                           onTap: () {
//                             transactionComplaint(
//                               transaction.referenceNo ?? '',
//                               cms(Fields.SendTransactionEnquiry_PageHeading)
//                                   .textHeading!,
//                               selectedQueryType: selectedQueryType,
//                             );
//                           },
//                           child: SvgPicture.asset(
//                             ImagePath.transactionInquiry,
//                             colorFilter: ColorFilter.mode(
//                                 AppConfigs.primaryColor, BlendMode.srcIn),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 30),
//                       Visibility(
//                         visible: !fromSendMoney,
//                         child: GestureDetector(
//                           onTap: () {
//                             transactionComplaint(
//                               transaction.referenceNo ?? '',
//                               cms(Fields.TransactionComplaint_PageHeading)
//                                   .textHeading!,
//                               selectedQueryType: selectedQueryType,
//                             );
//                           },
//                           child: SvgPicture.asset(
//                             ImagePath.transactionComplaint,
//                             colorFilter: ColorFilter.mode(
//                                 AppConfigs.primaryColor, BlendMode.srcIn),
//                             height: 31,
//                             width: 31,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Visibility(
//                     visible: false,
//                     child: GestureDetector(
//                       onTap: () {
//                         transactionCancel(
//                             transactionRefNo: transaction.referenceNo ?? '',
//                             type: 'cancel_transaction'.tr);
//                       },
//                       child: Icon(
//                         Icons.cancel_outlined,
//                         color: AppConfigs.primaryColor,
//                         size: 31,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Visibility(
//                 visible: accountController.downloadStatus.isNotEmpty,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Text(accountController.downloadStatus,
//                       style: TS.f14.copyWith(
//                           color: accountController.isDark
//                               ? AppConfigs.w
//                               : AppConfigs.g4)),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Container(
//                 height: 1,
//                 decoration: BoxDecoration(
//                   color: const Color(0xff707070).withOpacity(0.17),
//                 ),
//               ),
//               Expanded(
//                 child: ListView(
//                   shrinkWrap: true,
//                   physics: const ClampingScrollPhysics(),
//                   // mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(top: 12),
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                           cms(Fields.MyTransaction_TransactionDetails)
//                               .textHeading!,
//                           style: TS.f14.copyWith(
//                               color: accountController.isDark
//                                   ? AppConfigs.g8f
//                                   : AppConfigs.primaryColor),
//                           textAlign: TextAlign.start),
//                     ),
//                     const SizedBox(height: 15),
//                     contentTile(cms(Fields.MyTransaction_Status).textHeading!,
//                         (transaction.transactionStatus ?? '').tr),
//                     contentTile(
//                         cms(Fields.MyTransaction_SendingAmount).textHeading!,
//                         '${transaction.currencyCode} ${(double.tryParse(transaction.lcyAmount ?? '') ?? 0.0).toStringAsFixed(length)}'),
//                     contentTile(cms(Fields.MyTransaction_Fees).textHeading!,
//                         '${transaction.currencyCode} ${(double.tryParse(transaction.charges ?? '') ?? 0).toStringAsFixed(length)}'),
//                     contentTile(
//                         cms(Fields.MyTransaction_OtherCharges).textHeading!,
//                         '${transaction.currencyCode} ${0.toStringAsFixed(length)}'),
//                     contentTile(
//                         cms(Fields.MyTransaction_ExchangeRate).textHeading!,
//                         transaction.divisionRate.toString()),
//                     Box3.settings.enableVat == true
//                         ? contentTile(
//                             cms(Fields.MyTransaction_VAT).textHeading!,
//                             '${transaction.currencyCode} ${(transaction.taxAmount ?? 0).toStringAsFixed(length)}')
//                         : const SizedBox(),
//                     contentTile(
//                         cms(Fields.MyTransaction_NetPayAmount).textHeading!,
//                         '${transaction.currencyCode ?? ''} ${transaction.netAmount?.toStringAsFixed(length)}'),
//                     // contentTile('Receiver_Gets'.tr,
//                     //     '${transaction.benfCurrencyCode ?? ''} ${transaction.fcyAmount}'),
//                     contentTile(
//                         cms(Fields.MyTransaction_ReceiverGets).textHeading!,
//                         transaction.benfCurrencyCode?.toLowerCase() != "inr"
//                             ? '${transaction.benfCurrencyCode} ${transaction.fcyAmount?.toStringAsFixed(length)}'
//                             : '${transaction.benfCurrencyCode} ${transaction.fcyAmount?.toString()}'),
//                     contentTile(
//                         cms(Fields.MyTransaction_Remitter).textHeading!,
//                         [
//                           transaction.custFirstName?.trim(),
//                           transaction.custMiddleName?.trim(),
//                           transaction.custLastName?.trim()
//                         ]
//                             .where((name) => name != null && name.isNotEmpty)
//                             .join(' ')),
//                     contentTile(
//                         cms(Fields.MyTransaction_BenefiicaryName).textHeading!,
//                         [
//                           transaction.benfName?.trim(),
//                           transaction.benfName2?.trim(),
//                           transaction.benfName3?.trim()
//                         ]
//                             .where((name) => name != null && name.isNotEmpty)
//                             .join(' ')),
//                     contentTile(
//                         cms(Fields.MyTransaction_TransferType).textHeading!,
//                         transaction.serviceType?.toUpperCase() == 'C'
//                             ? 'Cash Pickup'
//                             : transaction.serviceType?.toUpperCase() == 'W'
//                                 ? 'Wallet Transfer'
//                                 : 'Bank Transfer'),
//                     contentTile(
//                         cms(Fields.MyTransaction_PaymentMethod).textHeading!,
//                         '${transaction.payModeDesc==""?transaction.payMode:transaction.payModeDesc}'),
//                     (transaction.accountNo ?? "").isNotEmpty
//                         ? contentTile(
//                             cms(Fields.MyTransaction_AccountNo).textHeading!,
//                             transaction.accountNo ?? '')
//                         : const SizedBox(),
//                     contentTile(
//                         cms(Fields.MyTransaction_TransactionRefNo).textHeading!,
//                         transaction.referenceNo.toString()),
//                     contentTile(
//                         cms(Fields.MyTransaction_TransactionDateAndTime)
//                             .textHeading!,
//                         DateFormatter.newFormat(transaction.tranDate?.toLocal(),
//                             'dd/MM/yyyy hh:mm')),
//                     contentTile(
//                         cms(Fields.MyTransaction_PaymentStatus).textHeading!,
//                         transaction.transactionStatus ?? '',
//                         isIcon: transaction.transactionStatus
//                                 ?.toLowerCase()
//                                 .contains('success') ==
//                             true),
//                     Visibility(
//                         visible: transaction.paymentRefNo?.isNotEmpty == true,
//                         child: contentTile(
//                             cms(Fields.MyTransaction_PaymentRefNo).textHeading!,
//                             transaction.paymentRefNo ?? '')),
//                     Visibility(
//                       visible: transaction.serviceProvider?.isNotEmpty == true,
//                       child: contentTile(
//                         cms(Fields.MyTransaction_ServiceProvider).textHeading!,
//                         transaction.serviceProvider ?? '',
//                       ),
//                     ),
//
//                     /// __________New key are show ___________changes by Vijay
//                     if (transaction.serviceType == 'B') ...[
//                       if (transaction.bankName != "")
//                         contentTile(
//                             cms(Fields.MyTransaction_BankName).textHeading!,
//                             transaction.bankName.toString()),
//                       if (transaction.branchName != null &&
//                           transaction.branchName != "")
//                         contentTile(
//                             cms(Fields.MyTransaction_BranchName).textHeading!,
//                             transaction.branchName.toString()),
//                     ],
//                     if (transaction.purpose != null &&
//                         transaction.purpose != "")
//                       contentTile(
//                           cms(Fields.MyTransaction_Purpose).textHeading!,
//                           transaction.purpose.toString()),
//
//                     ///_____________End_______________________
//                     Visibility(
//                       visible: transaction.pinNumber?.isNotEmpty == true,
//                       child: contentTile(
//                           cms(Fields.MyTransaction_ProviderRefNo).textHeading!,
//                           transaction.pinNumber ?? ''),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   });
// }
