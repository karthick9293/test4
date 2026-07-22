import 'dart:io';

import 'package:filesaverplus/filesaverplus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:mobiremit/core/pdf_template/pdf_template3.dart';

import 'package:printing/printing.dart';

import '../../../../core/exports/built_values.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../core/models/formatter.dart';
import '../../../../models/transaction_details/transaction_details_fz.dart';
import '../../../../models/transaction_query_type/query_type_fz.dart';
import '../../../../network/api_service_new.dart';

class TransactionReceiptAlert extends StatelessWidget {
  final TransactionDetailsFz transaction;
  final GatewayDetailsBV? gateway;
  final bool fromTxnHistory;

  const TransactionReceiptAlert(
      {super.key,
      required this.transaction,
      this.gateway,
      this.fromTxnHistory = false});

  @override
  Widget build(BuildContext context) {
    bool sharing = false;
    bool downloading = false;
    bool isCopied = false;
    QueryTypeFz? selectedQueryType;
    int? length = Box3.settings.currencyDecimalLength;

    Get.find<TransactionController>().getQueryTypes();

    Get.find<TransactionController>().agentStatus = null;

    if (transaction.isIntegration?.toLowerCase() == "y" &&
        Box3.settings.requiredAgentStatus == true) {
      Get.find<TransactionController>()
          .getApiTransactionStatus(transaction.transactionReference!);
    }

    Widget contentTile(String t1, String t2,
        {bool isIcon = false,
        String? currencySymbol,
        bool isCurrencyImage = false}) {
      return GetBuilder<AccountController>(builder: (accountController) {
        return SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t1,
                style: TS.f16.copyWith(
                    color: accountController.isDark
                        ? AppConfigs.gd7
                        : AppConfigs.g4),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StatefulBuilder(builder: (context, refNoState) {
                      return Visibility(
                        visible: t1 ==
                            cms(Fields.MyTransaction_TransactionRefNo)
                                .textHeading!,
                        child: GestureDetector(
                          onTap: () async {
                            if (!isCopied) {
                              await Clipboard.setData(ClipboardData(text: t2));

                              refNoState(() {
                                isCopied = true;
                              });

                              // Get.snackbar('Alert',
                              //     'Txn Reference number copied to clipboard',
                              //     duration: const Duration(seconds: 1));
                            }
                          },
                          child: Icon(
                              isCopied ? Icons.done_all_rounded : Icons.copy,
                              size: 14),
                        ),
                      );
                    }),
                    Visibility(
                      visible: isIcon,
                      child: SvgPicture.asset(
                        ImagePath.transactionDone,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    // const Icon(Icons.check_circle_rounded, size: 16, color: AppConfigs.dg,),
                    // const SizedBox(width: 5,),
                    if (isCurrencyImage == false)
                      Expanded(
                        flex: t1 ==
                                    cms(Fields.MyTransaction_TransactionRefNo)
                                        .textHeading! ||
                                isIcon
                            ? 0
                            : 1,
                        child: SelectableText(
                          t2,
                          textAlign: TextAlign.end,
                          maxLines: 2,
                          style: TS.f14.copyWith(
                              color: accountController.isDark
                                  ? AppConfigs.gd7
                                  : AppConfigs.bf0),
                        ),
                      )
                    else
                      Expanded(
                        flex: t1 ==
                                    cms(Fields.MyTransaction_TransactionRefNo)
                                        .textHeading! ||
                                isIcon
                            ? 0
                            : 1,
                        child: CurrencySymbolWithAmount(
                          currencyWidth: 10,
                          currencyCode: currencySymbol ??
                              Box3.companyDataFZ!.companySettings!
                                  .primaryBaseCurrency,
                          amount: t2,
                          color: accountController.isDark
                              ? AppConfigs.gd7
                              : AppConfigs.bf0,
                          textStyle: TS.f16.copyWith(
                              color: accountController.isDark
                                  ? AppConfigs.gd7
                                  : AppConfigs.bf0),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        );
      });
    }

    return GetBuilder<AccountController>(builder: (accountController) {
      return Scaffold(
        backgroundColor:
            accountController.isDark ? AppConfigs.bf0 : Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    BackButton(),
                  ],
                ),
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(36))),
                  child:
                      transaction.transactionStatus?.contains('Success') == true
                          ? SvgPicture.asset(ImagePath.transactionDone)
                          : transaction.transactionStatus?.contains('Failed') ==
                                      true ||
                                  transaction.transactionStatus
                                          ?.contains('Cancel') ==
                                      true
                              ? Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                                  child: SvgPicture.asset(SvgIcons.deviceVerify,
                                      height: 65),
                                )
                              : SvgPicture.asset(ImagePath.waitingTransaction),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '${transaction.beneficiaryName}',
                    style: TS.f20.copyWith(
                        color: accountController.isDark
                            ? AppConfigs.w
                            : AppConfigs.g4,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.copy_outlined,
                      size: 14,
                      color: accountController.isDark
                          ? AppConfigs.g8f
                          : AppConfigs.g77,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${transaction.transactionReference}",
                      //Todo:Handle Transalations
                      style: TS.f16.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g77,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: CurrencySymbolWithAmount(
                      currencyWidth: 15,
                      currencyCode: Box3
                          .companyDataFZ!.companySettings!.primaryBaseCurrency,
                      amount:
                          '${transaction.netAmount?.toStringWithOptionalFixed(length)}',
                      color: accountController.isDark
                          ? AppConfigs.w
                          : AppConfigs.g4,
                      textStyle: TS.f22.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g4,
                          fontSize: 30)),
                ),
                SizedBox(height: 10),
                // transaction.transactionStatus
                //     ?.toLowerCase()
                //     .contains('processing') ==
                //     true ||
                //     transaction.transactionStatus
                //         ?.toLowerCase()
                //         .contains('under process') ==
                //         true
                //     ? StatusTheme1.underProcessingTile(
                //     transaction.transactionStatus)
                //     : transaction.transactionStatus
                //     ?.toLowerCase()
                //     .contains('requested') ==
                //     true ||
                //     transaction.transactionStatus
                //         ?.toLowerCase()
                //         .contains('pending') ==
                //         true
                //     ? StatusTheme1.waitingForApprovalTile(
                //     transaction.transactionStatus)
                //     : transaction.transactionStatus
                //     ?.toLowerCase() ==
                //     'success'
                //     ? StatusTheme1.successTile()
                //     : StatusTheme1.failTile(text: transaction.transactionStatus),

                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: const Color(0xff707070).withOpacity(0.17)),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Transaction Status",
                              style: TS.f16,
                            ),
                            Spacer(),
                            transaction.transactionStatus
                                            ?.toLowerCase()
                                            .contains('processing') ==
                                        true ||
                                    transaction.transactionStatus
                                            ?.toLowerCase()
                                            .contains('under process') ==
                                        true
                                ? StatusTiles.underProcessingTile(
                                    transaction.transactionStatus)
                                : transaction.transactionStatus
                                                ?.toLowerCase()
                                                .contains('requested') ==
                                            true ||
                                        transaction.transactionStatus
                                                ?.toLowerCase()
                                                .contains('pending') ==
                                            true
                                    ? StatusTiles.waitingForApprovalTile(
                                        transaction.transactionStatus)
                                    : transaction.transactionStatus?.toLowerCase() ==
                                            'success'
                                        ? StatusTiles.successTile()
                                        : StatusTiles.failTile(
                                            text: transaction.transactionStatus),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        cms(Fields.MyTransaction_TransactionDetails)
                            .textHeading!,
                        style: TS.f18.copyWith(
                            color: accountController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.primaryColor),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 15),
                      if (Get.find<TransactionController>().agentStatus !=
                              null &&
                          Get.find<TransactionController>()
                              .agentStatus!
                              .isNotEmpty &&
                          Box3.settings.requiredAgentStatus == true)
                        contentTile(
                            cms(Fields.MyTransaction_AgentStatus).textHeading!,
                            Get.find<TransactionController>().agentStatus ??
                                ""),
                      // contentTile(cms(Fields.MyTransaction_Status).textHeading!,
                      //     (transaction.transactionStatus ?? '').tr),
                      contentTile(
                          cms(Fields.MyTransaction_SendingAmount).textHeading!,
                          (double.tryParse(transaction.receivedAmount ?? '') ??
                                  0.0)
                              .toStringWithOptionalFixed(length),
                          isCurrencyImage: true),
                      contentTile(
                          cms(Fields.MyTransaction_Fees).textHeading!,
                          (double.tryParse(transaction.charge ?? '0.0') ?? 0)
                              .toStringWithOptionalFixed(length),
                          isCurrencyImage: true),
                      contentTile(
                          cms(Fields.MyTransaction_OtherCharges).textHeading!,
                          0.toStringWithOptionalFixed(length),
                          isCurrencyImage: true),
                      contentTile(
                          cms(Fields.MyTransaction_ExchangeRate).textHeading!,
                          (transaction.divisionRate ?? 0)
                              .toStringWithOptionalFixed(length),
                          isCurrencyImage: false),
                      Box3.settings.enableVat == true
                          ? contentTile(
                              cms(Fields.MyTransaction_VAT).textHeading!,
                              (transaction.customerVatin ?? 0)
                                  .toStringWithOptionalFixed(length),
                              isCurrencyImage: true)
                          : const SizedBox(),
                      contentTile(
                          cms(Fields.MyTransaction_NetPayAmount).textHeading!,
                          '${transaction.netAmount?.toStringWithOptionalFixed(length)}',
                          isCurrencyImage: true),

                      contentTile(
                          cms(Fields.MyTransaction_ReceiverGets).textHeading!,
                          '${transaction.paymentAmount?.toStringWithOptionalFixed(length)}',
                          isCurrencyImage: true,
                          currencySymbol: transaction.fromCurrencyCode!),
                      contentTile(
                          cms(Fields.MyTransaction_Remitter).textHeading!,
                          transaction.customerName ?? ''),
                      contentTile(
                          cms(Fields.MyTransaction_BenefiicaryName)
                              .textHeading!,
                          transaction.beneficiaryName ?? ''),
                      contentTile(
                          cms(Fields.MyTransaction_TransferType).textHeading!,
                          getServiceType(transaction.serviceType)),
                      contentTile(
                          cms(Fields.MyTransaction_PaymentMethod).textHeading!,
                          '${transaction.payModeDesc}'),
                      transaction.accountNumber!.isNotEmpty
                          ? contentTile(
                              cms(Fields.MyTransaction_AccountNo).textHeading!,
                              transaction.accountNumber ?? '')
                          : const SizedBox(),
                      contentTile(
                          cms(Fields.MyTransaction_TransactionRefNo)
                              .textHeading!,
                          transaction.transactionReference.toString()),
                      contentTile(
                          cms(Fields.MyTransaction_TransactionDateAndTime)
                              .textHeading!,
                          DateFormatter.newFormat(
                              transaction.transactionDate!.toLocal(),
                              'dd/MM/yyyy hh:mm a')),
                      // contentTile(cms(Fields.MyTransaction_PaymentStatus).textHeading!,
                      //     transaction.paymentStatus ?? '',
                      //     isIcon: transaction.paymentStatus
                      //             ?.toLowerCase()
                      //             .contains('success') ==
                      //         true),
                      Visibility(
                          visible: transaction.paymentRefNo?.isNotEmpty == true,
                          child: contentTile(
                              cms(Fields.MyTransaction_PaymentRefNo)
                                  .textHeading!,
                              transaction.paymentRefNo ?? '')),
                      // Visibility(
                      //   visible:
                      //       transaction.serviceProvider?.isNotEmpty == true,
                      //   child: contentTile(
                      //     cms(Fields.MyTransaction_ServiceProvider)
                      //         .textHeading!,
                      //     transaction.serviceProvider ?? '',
                      //   ),
                      // ),

                      if (transaction.serviceType?.toLowerCase() == 'b') ...[
                        if (transaction.bankName != "")
                          contentTile(
                              cms(Fields.MyTransaction_BankName).textHeading!,
                              transaction.bankName.toString()),
                        if (transaction.branchName != null &&
                            transaction.branchName != "")
                          contentTile(
                              cms(Fields.MyTransaction_BranchName).textHeading!,
                              transaction.branchName.toString()),
                      ],
                      if (transaction.purpose != null &&
                          transaction.purpose != "")
                        contentTile(
                            cms(Fields.MyTransaction_Purpose).textHeading!,
                            transaction.purpose.toString()),

                      ///_____________End_______________________
                      Visibility(
                        visible: transaction.pinNumber?.isNotEmpty == true,
                        child: contentTile(
                            cms(Fields.MyTransaction_ProviderRefNo)
                                .textHeading!,
                            transaction.pinNumber ?? ''),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          // visible: true,
                          visible:
                              transaction.transactionStatus?.toLowerCase() ==
                                  'success',
                          child: Row(
                            children: [
                              sharing
                                  ? tinyLoader(size: 24, width: 1.0)
                                  : GestureDetector(
                                      onTap: () async {
                                        sharing = true;
                                        accountController.update();
                                        String? email =
                                            Get.find<AccountController>()
                                                .contactUs
                                                ?.data
                                                ?.email;
                                        String? phone =
                                            Get.find<AccountController>()
                                                .contactUs
                                                ?.data
                                                ?.phoneNo;

                                        var resp = await ApiService()
                                            .transactionDetailsByRefNo(
                                                referenceNo: transaction
                                                        .transactionReference ??
                                                    '');
                                        if (resp == null) {
                                          accountController
                                            ..downloadStatus = ''
                                            ..update();
                                        } else {
                                          var pdfTemplate = PdfTemplate3(resp,
                                              email: email?.trim() ?? '',
                                              mobile: phone?.trim() ?? '',
                                              serviceProvider:
                                                  transaction.serviceProvider);

                                          // This loads currency images in background isolate
                                          await pdfTemplate.initialize();
                                          var printingPdf = await pdfTemplate
                                              .printReceiptInPDF();
                                          var resultData =
                                              await printingPdf.save();
                                          var resultName =
                                              "TransactionReceipt${DateTime.now().second.toString() + DateTime.now().minute.toString() + DateTime.now().hour.toString() + DateTime.now().day.toString() + DateTime.now().month.toString() + DateTime.now().year.toString()}.pdf";

                                          // var resultName =
                                          //     "${"Transaction".tr}${transaction.referenceNo}-${DateTime.now()}.pdf";
                                          await Printing.sharePdf(
                                              bytes: resultData,
                                              filename: resultName);
                                          sharing = false;
                                          accountController.update();
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppConfigs.primaryColor),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              height: 18,
                                              width: 18,
                                              ImagePath.shareTransactionDetail,
                                              colorFilter: ColorFilter.mode(
                                                  AppConfigs.w,
                                                  BlendMode.srcIn),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              "Share",
                                              style: TS.f18B.copyWith(
                                                  color: AppConfigs.w),
                                            )
                                          ],
                                        ),
                                      )),
                              downloading
                                  ? tinyLoader(size: 24, width: 1.0)
                                  : GestureDetector(
                                      onTap: () async {
                                        downloading = true;
                                        accountController.update();

                                        if (Platform.isAndroid) {
                                          accountController
                                            ..downloadStatus = 'Downloading'.tr
                                            ..update();
                                        }

                                        String? email =
                                            Get.find<AccountController>()
                                                .contactUs
                                                ?.data
                                                ?.email;
                                        String? phone =
                                            Get.find<AccountController>()
                                                .contactUs
                                                ?.data
                                                ?.phoneNo;

                                        var resp = await ApiService()
                                            .transactionDetailsByRefNo(
                                                referenceNo: transaction
                                                        .transactionReference ??
                                                    '');
                                        if (resp == null) {
                                          accountController
                                            ..downloadStatus = ''
                                            ..update();
                                        } else {
                                          var pdfTemplate = PdfTemplate3(resp,
                                              email: email?.trim() ?? '',
                                              mobile: phone?.trim() ?? '',
                                              serviceProvider:
                                                  transaction.serviceProvider);

                                          // This loads currency images in background isolate
                                          await pdfTemplate.initialize();
                                          var printingPdf = await pdfTemplate
                                              .printReceiptInPDF();
                                          var resultData =
                                              await printingPdf.save();

                                          var resultName =
                                              "TransactionReceipt${DateTime.now().second.toString() + DateTime.now().minute.toString() + DateTime.now().hour.toString() + DateTime.now().day.toString() + DateTime.now().month.toString() + DateTime.now().year.toString()}.pdf";

                                          await FileSaverPlus().saveFile(
                                            resultData,
                                            resultName,
                                            "appliation/pdf",
                                          );
                                          if (Platform.isAndroid) {
                                            accountController
                                              ..downloadStatus =
                                                  'Saved_to_Download_Folder'.tr
                                              ..update();
                                          }
                                          showSuccessAlert(
                                              content:
                                                  'Saved_to_Download_Folder'.tr,
                                              function: () {
                                                Get.back();
                                              });
                                        }

                                        await Future.delayed(
                                            const Duration(seconds: 2));
                                        accountController
                                          ..downloadStatus = ''
                                          ..update();
                                        downloading = false;
                                        accountController.update();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 10),
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppConfigs.primaryColor),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              height: 20,
                                              width: 20,
                                              ImagePath
                                                  .downloadTransactionDetail,
                                              colorFilter: ColorFilter.mode(
                                                  AppConfigs.w,
                                                  BlendMode.srcIn),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "Download",
                                              style: TS.f18B.copyWith(
                                                  color: AppConfigs.w),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),

                              // GestureDetector(
                              //     onTap: () => transactionShare(transaction),
                              //     child:
                              //         SvgPicture.asset(ImagePath.shareTransactionDetail)),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: fromTxnHistory,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.to(() => TransactionComplaint(
                                  transactionRefNo:
                                      transaction.transactionReference ?? '',
                                  type: cms(Fields
                                          .SendTransactionEnquiry_PageHeading)
                                      .textHeading!));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppConfigs.primaryColor),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    height: 24,
                                    width: 24,
                                    ImagePath.transactionInquiry,
                                    colorFilter: ColorFilter.mode(
                                        AppConfigs.w, BlendMode.srcIn),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Raise Enquiry",
                                    style:
                                        TS.f18B.copyWith(color: AppConfigs.w),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // const SizedBox(width: 30),
                        // Visibility(
                        //   visible: fromTxnHistory,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       transactionComplaint(
                        //           transaction.transactionReference ?? '',
                        //           cms(Fields.TransactionComplaint_PageHeading)
                        //               .textHeading!);
                        //     },
                        //     child: SvgPicture.asset(
                        //       ImagePath.transactionComplaint,
                        //       colorFilter: ColorFilter.mode(
                        //           AppConfigs.primaryColor, BlendMode.srcIn),
                        //       height: 31,
                        //       width: 31,
                        //     ),
                        //   ),
                        // ),
                        Visibility(
                          visible: true,
                          child: GestureDetector(
                            onTap: () {
                              transactionCancel(
                                  transactionRefNo:
                                      transaction.transactionReference ?? '',
                                  type: 'cancel_transaction'.tr);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppConfigs.primaryColor),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Cancel",
                                    style:
                                        TS.f18B.copyWith(color: AppConfigs.w),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Visibility(
                //   visible: accountController.downloadStatus.isNotEmpty,
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 10),
                //     child: Text(accountController.downloadStatus,
                //         style: TS.f14.copyWith(
                //             color: accountController.isDark
                //                 ? AppConfigs.w
                //                 : AppConfigs.g4)),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
