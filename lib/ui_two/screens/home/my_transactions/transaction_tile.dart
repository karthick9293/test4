import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/transaction_details/transaction_details_fz.dart';
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
  String shortName = '';
  if (("${transaction.benfFirstName ?? ''}${transaction.benfMiddleName ?? ''}${transaction.benfLastName ?? ''}")
      .replaceAll('  ', ' ')
      .split(' ')
      .isNotEmpty) {
    ("${transaction.benfFirstName ?? ''}${transaction.benfMiddleName ?? ''}${transaction.benfLastName ?? ''}")
        .split(' ')
        .sublist(0, 1)
        .forEach((e) => shortName = shortName + e[0].toUpperCase());
  }

  return GetBuilder<DataController>(builder: (dControl) {
    return GetBuilder<AccountController>(builder: (accountController) {
      return GestureDetector(
        onTap: onTap ??
            () {
              if (transaction.transactionStatus != 'Failure' && !hide) {
                Get.to(() => TransactionReceiptAlert(
                      transaction: transaction,
                      fromTxnHistory: true,
                    ));
              }
            },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
              color: selected
                  ? (accountController.isDark
                      ? const Color(0xFF333333)
                      : AppConfigs.primaryColor.withOpacity(0.1))
                  : null,
              border: Border.all(
                color: AppConfigs.g70.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    transaction.serviceType == 'B'
                        ? SvgIcons.bankTransfer
                        : transaction.serviceType == 'C'
                            ? SvgIcons.cashTransfer
                            : SvgIcons.mobileWallet,
                    height: hide ? 20 : 25,
                    colorFilter: ColorFilter.mode(
                      getServiceTypeColor(transaction.serviceType ?? ''),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        SvgIcons.copy,
                        width: 15,
                        colorFilter: ColorFilter.mode(
                            accountController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.g77,
                            BlendMode.srcIn),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        hide && transaction.serviceType == 'C'
                            ? 'Cash_Transfer'.tr
                            : hide && transaction.serviceType == 'W'
                                ? 'Wallet_Transfer'.tr
                                : (hide
                                    ? '${transaction.bankName} | ${(transaction.accountNumber ?? '').substring(0, (transaction.accountNumber ?? '').length > 6 ? 6 : (transaction.accountNumber ?? '').length)}${(transaction.accountNumber ?? '').length > 6 ? '...' : ''}'
                                    : "${transaction.transactionReference}"),
                        //Todo:Handle Transalations
                        style: TS.f14.copyWith(
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
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    SvgIcons.calender,
                    width: 15,
                    colorFilter: ColorFilter.mode(
                        accountController.isDark
                            ? AppConfigs.g8f
                            : AppConfigs.g77,
                        BlendMode.srcIn),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "${transaction.transactionDate?.toLocal().day} ${months[transaction.transactionDate?.toLocal().month]} ${transaction.transactionDate?.toLocal().year}",
                      style: TS.f14.copyWith(
                          color: accountController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g77,
                          fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  CurrencySymbolWithAmount(
                    currencyWidth: 11,
                    currencyCode: Box3
                        .companyDataFZ!.companySettings!.primaryBaseCurrency,
                    amount: (transaction.netAmount ?? 0.0)
                        .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength),
                    color:
                        accountController.isDark ? AppConfigs.w : AppConfigs.g4,
                    textStyle: TS.f16.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.w
                          : AppConfigs.g4,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
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
                  Spacer(),
                  // RichText(
                  //   overflow: TextOverflow.ellipsis,
                  //   text: TextSpan(children: [
                  //     TextSpan(
                  //         style: TS.f12.copyWith(
                  //           color: getServiceTypeColor(
                  //               transaction.serviceType ?? ''),
                  //         ),
                  //         text:
                  //             "${transaction.serviceType == 'B' ? transaction.isMobileTxn == false ? cms(Fields.MyTransaction_BankTransferViaBranch).textHeading : cms(Fields.MyTransaction_BankTransferViaMobile).textHeading : transaction.serviceType == 'C' ? transaction.isMobileTxn == false ? cms(Fields.MyTransaction_CashPickupViaBranch).textHeading : cms(Fields.MyTransaction_CashPickupViaMobile).textHeading : transaction.serviceType == 'W' ? transaction.isMobileTxn == false ? cms(Fields.MyTransaction_WalletViaBranch).textHeading : cms(Fields.MyTransaction_WalletViaMobile).textHeading : '*ServiceType*'.tr} ${transaction.benfActiveStatus == 'Active' && Get.find<DataController>().beneficiaries.firstWhereOrNull((e) => e.id.toString() == transaction.bneficiaryId)?.active == 'Y' ? '|' : ''} "),
                  //   ]),
                  // ),
                  Visibility(
                    /* => CoreBeneficiaryUID will be available only after the first txn of the beneficiary.
                        otherwise it remains empty. */
                    visible: !hide &&
                        Get.find<DataController>()
                                .beneficiaries
                                .firstWhereOrNull((e) =>
                                    e.coreBeneficiaryUid?.isNotEmpty == true &&
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
                              .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)
                          ..selectedBeneficiary = Get.find<TransferController>()
                              .benefs
                              .firstWhere((e) =>
                                  e.coreBeneficiaryUid?.isNotEmpty == true &&
                                  e.coreBeneficiaryUid ==
                                      transaction.bneficiaryId)
                          ..toAmtCur = Get.find<TransferController>()
                              .benefs
                              .firstWhere((e) =>
                                  e.coreBeneficiaryUid?.isNotEmpty == true &&
                                  e.coreBeneficiaryUid ==
                                      transaction.bneficiaryId)
                              .serviceCurrency
                              ?.Code
                          ..updateToCurrency(
                              s: (double.tryParse(
                                          transaction.receivedAmount ?? '') ??
                                      0.0)
                                  .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength),
                              type: 'L');

                        await transferController.resetTransferForm();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            cms(Fields.MyTransaction_SendAgain).textHeading!,
                            style: TS.f16.copyWith(
                                color: accountController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.primaryColor),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_forward,
                              size: 17,
                              color: accountController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.primaryColor)
                        ],
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
          ),
        ),
      );
    });
  });
}


