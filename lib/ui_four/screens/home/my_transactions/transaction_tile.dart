import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/transaction_details/transaction_details_fz.dart';
import 'transaction_cancel.dart';
import 'transaction_receipt_alert.dart';
import 'package:mobiremit/core/models/formatter.dart';

Widget transactionTile(
    {required TransactionDetailsFz transaction,
    bool hide = false,
    selected = false,
    void Function()? onTap}) {
  Map<int, String> months = {
    1: 'Jan',
    2: 'Feb',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'Aug',
    9: 'Sept',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };
  final shortName = [
    transaction.benfFirstName,
    transaction.benfMiddleName,
    transaction.benfLastName,
  ]
      .where((e) => e != null && e.trim().isNotEmpty)
      .map((e) => e!.trim()[0].toUpperCase())
      .join();

  return GetBuilder<DataController>(builder: (dControl) {
    return GetBuilder<AccountController>(builder: (accountController) {
      return GestureDetector(
        onTap: onTap ??
            () {
              if (transaction.transactionStatus != 'Failure' && !hide) {
                Get.dialog(
                    transactionReceiptAlert(transaction, fromTxnHistory: true),
                    barrierColor: accountController.isDark
                        ? AppConfigs.w.withOpacity(0.2)
                        : null);
              }
            },
        child: Container(
          height: 85,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          decoration: BoxDecoration(
            color: selected
                ? (accountController.isDark
                    ? const Color(0xFF333333)
                    : AppConfigs.primaryColor.withOpacity(0.1))
                : null,
            border: Border(
              bottom: BorderSide(
                color: AppConfigs.g70.withOpacity(0.1),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                transaction.serviceType == 'B'
                    ? SvgIcons.bankTransfer
                    : transaction.serviceType == 'C'
                        ? SvgIcons.cashTransfer
                        : SvgIcons.mobileWallet,
                height: hide ? 50 : 60,
                colorFilter: ColorFilter.mode(
                  getServiceTypeColor(transaction.serviceType ?? ''),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              // ),
              Expanded(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          transaction.beneficiaryName ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TS.f14.copyWith(
                              color: accountController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.g4,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CurrencySymbolWithAmount(
                        currencyWidth: 11,
                        currencyCode: Box3.companyDataFZ!.companySettings!
                            .primaryBaseCurrency,
                        amount: (transaction.netAmount ?? 0.0)
                            .toStringWithOptionalFixed(
                                Box3.settings.currencyDecimalLength),
                        color: accountController.isDark
                            ? AppConfigs.w
                            : AppConfigs.g4,
                        textStyle: TS.f14.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g4,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          hide && transaction.serviceType == 'C'
                              ? 'Cash_Transfer'.tr
                              : hide && transaction.serviceType == 'W'
                                  ? 'Wallet_Transfer'.tr
                                  : (hide
                                      ? '${transaction.bankName} | ${(transaction.accountNumber ?? '').substring(0, (transaction.accountNumber ?? '').length > 6 ? 6 : (transaction.accountNumber ?? '').length)}${(transaction.accountNumber ?? '').length > 6 ? '...' : ''}'
                                      : "${cms(Fields.MyTransaction_RefNo).textHeading}: ${transaction.transactionReference}"),
                          //Todo:Handle Transalations
                          style: TS.f12.copyWith(
                              color: accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.g77,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
                  const SizedBox(height: 4),
                  hide
                      ? const SizedBox()
                      : Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${cms(Fields.MyTransaction_Date).textHeading!}: ${transaction.transactionDate?.toLocal().day} ${months[transaction.transactionDate?.toLocal().month]} ${transaction.transactionDate?.toLocal().year}",
                                style: TS.f12.copyWith(
                                    color: accountController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g77,
                                    fontWeight: FontWeight.w600),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                  Row(
                    children: [
                      const Spacer(),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                          TextSpan(
                              style: TS.f12.copyWith(
                                color: getServiceTypeColor(
                                    transaction.serviceType ?? ''),
                              ),
                              text:
                                  "${transaction.serviceType == 'B' ? transaction.isMobileTxn == false ? cms(Fields.MyTransaction_BankTransferViaBranch).textHeading : cms(Fields.MyTransaction_BankTransferViaMobile).textHeading : transaction.serviceType == 'C' ? transaction.isMobileTxn == false ? cms(Fields.MyTransaction_CashPickupViaBranch).textHeading : cms(Fields.MyTransaction_CashPickupViaMobile).textHeading : transaction.serviceType == 'W' ? transaction.isMobileTxn == false ? cms(Fields.MyTransaction_WalletViaBranch).textHeading : cms(Fields.MyTransaction_WalletViaMobile).textHeading : '*ServiceType*'.tr} ${transaction.benfActiveStatus == 'Active' && Get.find<DataController>().beneficiaries.firstWhereOrNull((e) => e.id.toString() == transaction.bneficiaryId)?.active == 'Y' ? '|' : ''} "),
                        ]),
                      ),
                      Visibility(
                        /* => CoreBeneficiaryUID will be available only after the first txn of the beneficiary.
                                otherwise it remains empty. */
                        visible: !hide &&
                            Get.find<DataController>()
                                    .beneficiaries
                                    .firstWhereOrNull((e) =>
                                        e.coreBeneficiaryUid?.isNotEmpty ==
                                            true &&
                                        e.coreBeneficiaryUid ==
                                            transaction.bneficiaryId)
                                    ?.active ==
                                'A' &&
                            transaction.isMobileTxn == true,
                        child: GestureDetector(
                          onTap: () async {
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
                                  .toStringWithOptionalFixed(
                                      Box3.settings.currencyDecimalLength)
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
                                      .toStringWithOptionalFixed(
                                          Box3.settings.currencyDecimalLength),
                                  type: 'L');

                            await transferController.resetTransferForm();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: accountController.isDark
                                            ? AppConfigs.w
                                            : AppConfigs.g4))),
                            child: Text(
                              cms(Fields.MyTransaction_SendAgain).textHeading!,
                              style: TS.f12.copyWith(
                                  color: accountController.isDark
                                      ? AppConfigs.w
                                      : AppConfigs.g4),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        // visible: transaction.readyForCancel == 'Y',
                        visible: transaction.transactionStatus
                                        ?.toLowerCase()
                                        .contains('cancel') ==
                                    true ||
                                transaction.transactionStatus?.toLowerCase() ==
                                    'payment rejected'
                            ? false
                            : !hide &&
                                transaction.paymentStatus == 'Y' &&
                                transaction.readyForCancel == '0' &&
                                transaction.isMobileTxn == true
                        // (transaction.transactionStatus
                        //             ?.toLowerCase()
                        //             .contains('processing') ==
                        //         true ||
                        //     transaction.transactionStatus
                        //             ?.toLowerCase()
                        //             .contains('requested') ==
                        //         true ||
                        //     transaction.transactionStatus
                        //             ?.toLowerCase()
                        //             .contains('pending') ==
                        //         true) &&
                        ,
                        child: GestureDetector(
                          onTap: () {
                            transactionCancel(
                                transactionRefNo:
                                    transaction.transactionReference ?? '',
                                type: 'cancel_transaction'.tr);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 7),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: accountController.isDark
                                            ? AppConfigs.der
                                            : AppConfigs.der))),
                            child: Text(
                              cms(Fields.PopUp_Cancel).textHeading!,
                              style: TS.f12.copyWith(
                                  color: accountController.isDark
                                      ? AppConfigs.der
                                      : AppConfigs.der),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      );
    });
  });
}
