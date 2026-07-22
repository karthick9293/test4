import 'dart:io';

import 'package:filesaverplus/filesaverplus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/transaction_details/transaction_details_fz.dart';
import 'package:printing/printing.dart';
import '../../../../core/controllers/account_controller.dart';
import '../../../../core/controllers/main_controller.dart';
import '../../../../core/controllers/transaction_controller.dart';
import '../../../../core/controllers/transfer_controller.dart';
import '../../../../core/exports/built_values.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../core/pdf_template/pdf_template3.dart';
import '../../../../models/transaction_query_type/query_type_fz.dart';
import '../../../../network/api_service_new.dart';
import '../../../../ui_six/screens/home/my_transactions/transaction_cancel.dart';
import 'transaction_complait.dart';

class TransactionReceiptAlert extends StatelessWidget {
  final TransactionDetailsFz transaction;
  final GatewayDetailsBV? gateway;
  final bool? fromSendMoney;

  const TransactionReceiptAlert(this.transaction,
      {this.gateway, this.fromSendMoney = false, super.key});

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
        bool isCurrencyImage = false,
        bool isStatus = false,
        bool? isBorder = true}) {
      return GetBuilder<AccountController>(builder: (accountController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            border: isBorder == true
                ? Border(
                    bottom: BorderSide(
                        color: AppConfigs.primaryColor.withOpacity(0.3)))
                : null,
          ),
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t1,
                  style: TS.f14.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.gd7
                          : AppConfigs.primaryColor.withOpacity(0.8))),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isStatus)
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            child: t2.toLowerCase().contains('processing') ==
                                        true ||
                                    t2
                                            .toLowerCase()
                                            .contains('under process') ==
                                        true
                                ? StatusTiles.underProcessingTile(t2)
                                : t2.toLowerCase().contains('requested') ==
                                            true ||
                                        t2.toLowerCase().contains('pending') ==
                                            true
                                    ? StatusTiles.waitingForApprovalTile(t2)
                                    : t2.toLowerCase() == 'success'
                                        ? StatusTiles.successTile()
                                        : StatusTiles.failTile(text: t2),
                          ),
                        ],
                      ))
                    else ...[
                      StatefulBuilder(builder: (context, refNoState) {
                        return Visibility(
                          visible: t1 ==
                              cms(Fields.MyTransaction_TransactionRefNo)
                                  .textHeading!,
                          child: GestureDetector(
                            onTap: () async {
                              if (!isCopied) {
                                await Clipboard.setData(
                                    ClipboardData(text: t2));

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
                              size: 14,
                              color: AppConfigs.primaryColor,
                            ),
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
                                    : AppConfigs.bf0,
                                fontWeight: FontWeight.w900),
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
                            textStyle: TS.f14.copyWith(
                                color: accountController.isDark
                                    ? AppConfigs.gd7
                                    : AppConfigs.bf0,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                    ]
                  ],
                ),
              )
            ],
          ),
        );
      });
    }

    return GetBuilder<AccountController>(builder: (accountController) {
      return Container(
        decoration: BoxDecoration(
            gradient: accountController.isDark
                ? null
                : AppConfigs.linearGradientUiSix),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFdae8ff), Color(0xFFeaf6ef)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'AMOUNT SENT'.tr,
                    style: TS.f16.copyWith(
                        color: accountController.isDark
                            ? AppConfigs.w
                            : AppConfigs.primaryColor.withOpacity(0.8)),
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: CurrencySymbolWithAmount(
                        currencyWidth: 15,
                        currencyCode: Box3.companyDataFZ!.companySettings!
                            .primaryBaseCurrency,
                        amount:
                            '${transaction.netAmount?.toStringWithOptionalFixed(length)}',
                        color: accountController.isDark
                            ? AppConfigs.w
                            : AppConfigs.g4,
                        textStyle: TS.f28B.copyWith(
                            fontSize: 40,
                            color: accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "= ${transaction.fromCurrencyCode!} ${transaction.paymentAmount?.toStringWithOptionalFixed(length)} Received",
                    style: TS.f18B.copyWith(color: Color(0xff00b894)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        // visible: true,
                        visible: transaction.transactionStatus?.toLowerCase() ==
                            'success',
                        child: Row(
                          children: [
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
                                    child: SvgPicture.asset(
                                      height: 24,
                                      width: 24,
                                      ImagePath.downloadTransactionDetail,
                                      colorFilter: ColorFilter.mode(
                                          AppConfigs.primaryColor,
                                          BlendMode.srcIn),
                                    ),
                                  ),
                            const SizedBox(width: 30),
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
                                    child: SvgPicture.asset(
                                      height: 24,
                                      width: 24,
                                      ImagePath.shareTransactionDetail,
                                      colorFilter: ColorFilter.mode(
                                          AppConfigs.primaryColor,
                                          BlendMode.srcIn),
                                    ),
                                  ),
                            // GestureDetector(
                            //     onTap: () => transactionShare(transaction),
                            //     child:
                            //         SvgPicture.asset(ImagePath.shareTransactionDetail)),
                            const SizedBox(width: 30),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !fromSendMoney!,
                        child: GestureDetector(
                          onTap: () {
                            transactionComplaint(
                                transaction.transactionReference ?? '',
                                cms(Fields.SendTransactionEnquiry_PageHeading)
                                    .textHeading!);
                          },
                          child: SvgPicture.asset(
                            ImagePath.transactionInquiry,
                            colorFilter: ColorFilter.mode(
                                AppConfigs.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                      // const SizedBox(width: 30),
                      // Visibility(
                      //   visible: !fromSendMoney,
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
                        visible: false,
                        child: GestureDetector(
                          onTap: () {
                            transactionCancel(
                                transactionRefNo:
                                    transaction.transactionReference ?? '',
                                type: 'cancel_transaction'.tr);
                          },
                          child: Icon(
                            Icons.cancel_outlined,
                            color: AppConfigs.primaryColor,
                            size: 31,
                          ),
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: accountController.downloadStatus.isNotEmpty,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(accountController.downloadStatus,
                          style: TS.f14.copyWith(
                              color: accountController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.g4)),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            _card(
              child: Column(
                children: [
                  transaction.accountNumber!.isNotEmpty
                      ? contentTile(
                          cms(Fields.MyTransaction_AccountNo).textHeading!,
                          transaction.accountNumber ?? '')
                      : const SizedBox(),
                  contentTile(
                      cms(Fields.MyTransaction_TransactionRefNo).textHeading!,
                      transaction.transactionReference.toString()),
                  contentTile(
                      cms(Fields.MyTransaction_TransactionDateAndTime)
                          .textHeading!,
                      DateFormatter.newFormat(
                          transaction.transactionDate!.toLocal(),
                          'dd/MM/yyyy hh:mm a')),
                  if (Get.find<TransactionController>().agentStatus != null &&
                      Get.find<TransactionController>()
                          .agentStatus!
                          .isNotEmpty &&
                      Box3.settings.requiredAgentStatus == true)
                    contentTile(
                        cms(Fields.MyTransaction_AgentStatus).textHeading!,
                        Get.find<TransactionController>().agentStatus ?? ""),
                  contentTile(cms(Fields.MyTransaction_Status).textHeading!,
                      (transaction.transactionStatus ?? '').tr,
                      isStatus: true),
                  Visibility(
                      visible: transaction.paymentRefNo?.isNotEmpty == true,
                      child: contentTile(
                          cms(Fields.MyTransaction_PaymentRefNo).textHeading!,
                          transaction.paymentRefNo ?? '')),
                ],
              ),
            ),
            _card(
              child: Column(
                children: [
                  contentTile(cms(Fields.MyTransaction_Remitter).textHeading!,
                      transaction.customerName ?? ''),
                  contentTile(
                      cms(Fields.MyTransaction_BenefiicaryName).textHeading!,
                      transaction.beneficiaryName ?? ''),
                  contentTile(
                      cms(Fields.MyTransaction_TransferType).textHeading!,
                      getServiceType(transaction.serviceType)),
                  contentTile(
                      cms(Fields.MyTransaction_PaymentMethod).textHeading!,
                      '${transaction.payModeDesc}'),
                ],
              ),
            ),
            _card(
              child: Column(
                children: [
                  contentTile(
                      cms(Fields.MyTransaction_SendingAmount).textHeading!,
                      (double.tryParse(transaction.receivedAmount ?? '') ?? 0.0)
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
                      (transaction.divisionRate ?? 0).toStringWithOptionalFixed(length),
                      isCurrencyImage: true),
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
                      currencySymbol: transaction.fromCurrencyCode!,
                      isBorder: true),
                  // Visibility(
                  //   visible: transaction.serviceProvider?.isNotEmpty == true,
                  //   child: contentTile(
                  //     cms(Fields.MyTransaction_ServiceProvider).textHeading!,
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
                  if (transaction.purpose != null && transaction.purpose != "")
                    contentTile(cms(Fields.MyTransaction_Purpose).textHeading!,
                        transaction.purpose.toString()),

                  ///_____________End_______________________
                  Visibility(
                    visible: transaction.pinNumber?.isNotEmpty == true,
                    child: contentTile(
                        cms(Fields.MyTransaction_ProviderRefNo).textHeading!,
                        transaction.pinNumber ?? ''),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppConfigs.primaryColor),
                              foregroundColor: AppConfigs.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          child: Text(cms(Fields.MyTransaction_Receipt).textHeading!))),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (Get.isRegistered<TransferController>()) {
                              Get.find<TransferController>()
                                  .reset(t: TransferType.all);
                            } else {
                              Get.put(
                                  TransferController(
                                      transferType: TransferType.all),
                                  permanent: true);
                            }
                            Get.find<MainController>().push(
                                AppConfigs.sendMoney(
                                  key: UniqueKey(),
                                ),
                                transaction.serviceType != 'C'
                                    ? AppBars.bankTransfer
                                    : AppBars.cashTransfer);

                            TransferController transferController =
                                Get.find<TransferController>();
                            transferController
                              ..sourcePurposeVisibility = false
                              ..fromAmountCtrl.text = (double.tryParse(
                                          transaction.receivedAmount ?? '') ??
                                      0.0)
                                  .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)
                              ..selectedBeneficiary =
                                  Get.find<TransferController>()
                                      .benefs
                                      .firstWhere((e) =>
                                          e.coreBeneficiaryUid?.isNotEmpty ==
                                              true &&
                                          e.coreBeneficiaryUid ==
                                              transaction.bneficiaryId)
                              ..toAmtCur = Get.find<TransferController>()
                                  .benefs
                                  .firstWhere((e) =>
                                      e.coreBeneficiaryUid?.isNotEmpty ==
                                          true &&
                                      e.coreBeneficiaryUid ==
                                          transaction.bneficiaryId)
                                  .serviceCurrency
                                  ?.Code
                              ..updateToCurrency(
                                  s: (double.tryParse(
                                              transaction.receivedAmount ??
                                                  '') ??
                                          0.0)
                                      .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength),
                                  type: 'L');

                            await transferController.resetTransferForm();
                          },
                          style: ElevatedButton.styleFrom(
                              side: BorderSide(color: AppConfigs.primaryColor),
                              backgroundColor: AppConfigs.primaryColor,
                              foregroundColor: AppConfigs.w,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text(cms(Fields.MyTransaction_SendAgain).textHeading!)
                      )
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      );
    });
  }

  Widget _card({required Widget child}) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Get.find<AccountController>().isDark
            ? const Color(0xFF333333)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppConfigs.primaryColor.withOpacity(0.3)),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: child,
    );
  }
}
