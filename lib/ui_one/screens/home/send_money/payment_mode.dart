import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/kyc_controller.dart';
import 'package:mobiremit/core/controllers/transfer_controller.dart';
import 'package:mobiremit/core/editing_controllers.dart/attributes.dart';
import 'package:mobiremit/core/flavours/constants.dart';
import 'package:mobiremit/core/models/built_values/debit_bank_bv.dart';
import 'package:mobiremit/models/banks/drawing_bank_fz.dart';

import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/exports/ui_one_shimmer.dart';
import '../../../../core/models/formatter.dart';
import '../../sign_up/upload_doc_tile.dart';

class PaymentModeScreen extends StatelessWidget {
  const PaymentModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int? length = Box3.settings.currencyDecimalLength;
    Get.find<TransferController>().getDataForPaymentMode();

    return GetBuilder<TransferController>(builder: (transferController) {
      return WillPopScope(
        onWillPop: () async {
          transferController.showCancelTxnAlert();
          return false;
        },
        child: Scaffold(
          backgroundColor: AppConfigs.bodybg(transferController.isDark),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                transferController.loadingPage
                    ? PaymentModeShimmers()
                    : Expanded(
                        child: ListView(
                          children: [
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 31, right: 31, bottom: 14.7),
                              child: Text(
                                cms(Fields
                                        .PaymentConfirmation_SelectPaymentType)
                                    .textHeading!,
                                style: TextStyles.font15.copyWith(
                                  color: transferController.isDark
                                      ? AppConfigs.w
                                      : AppConfigs.g4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              height: 120,
                              child: ListView(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                controller:
                                    transferController.listScrollController,
                                scrollDirection: Axis.horizontal,
                                children: transferController.payments
                                    .map((e) => paymentIcon(e))
                                    .toList(),
                              ),
                            ),
                            Visibility(
                              visible: transferController.gateWay?.type == 'A',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: S.p, top: 10),
                                    child: Row(
                                      children: [
                                        // SvgPicture.asset(
                                        //   ImagePath.info,
                                        //   colorFilter: ColorFilter.mode(
                                        //     Get.find<TransferController>().isDark
                                        //         ? AppConfigs.g8f
                                        //         : AppConfigs.g4,
                                        //     BlendMode.srcIn,
                                        //   ),
                                        // ),
                                        // SizedBox(width: 4),
                                        Text(
                                          '${(Box3.settings.clientName)} ${'bank'.tr} *',
                                          style: TS.f14.copyWith(
                                              color: transferController.isDark
                                                  ? AppConfigs.g8f
                                                  : AppConfigs.g4),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                  transferController.banksList.length == 1 &&
                                          BankAttributes.drawingBank != null
                                      ? dummyTextField(
                                          BankAttributes.drawingBank!.bankName,
                                          transferController.isDark)
                                      : customDropdown<DrawingBankFz>(
                                          error: BankAttributes
                                              .drawingBankError.isNotEmpty,
                                          hintText: 'Please select bank'.tr,
                                          top: 5,
                                          padding: EdgeInsets.zero,
                                          items: transferController.banksList
                                              .map(
                                                (e) => DropdownMenuItem<
                                                        DrawingBankFz>(
                                                    value: e,
                                                    child: Text(e.bankName)),
                                              )
                                              .toList(),
                                          onChanged: (b) {
                                            if (b != null) {
                                              BankAttributes.drawingBank = b;
                                              BankAttributes.drawingBankError =
                                                  '';

                                              transferController
                                                ..accountNumbers =
                                                    b.payAccountNumbers.toList()
                                                ..update();
                                              if (transferController
                                                      .accountNumbers.length ==
                                                  1) {
                                                BankAttributes
                                                        .payAccountNumber =
                                                    b.payAccountNumbers[0];
                                                transferController.update();
                                              } else {
                                                BankAttributes
                                                    .payAccountNumber = null;
                                                BankAttributes
                                                    .payAccountNumberError = '';
                                                transferController.update();
                                              }
                                            }
                                          },
                                        ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: S.p, top: 10),
                                    child: Text(
                                        '${(Box3.settings.clientName)} ${'account_number'.tr}*',
                                        style: TextStyles.font12.copyWith(
                                            color: transferController.isDark
                                                ? AppConfigs.g8f
                                                : AppConfigs.g4),
                                        textAlign: TextAlign.start),
                                  ),
                                  transferController.accountNumbers.length ==
                                              1 &&
                                          BankAttributes.payAccountNumber !=
                                              null
                                      ? dummyTextField(
                                          BankAttributes
                                              .payAccountNumber!.accountNumber,
                                          transferController.isDark,
                                        )
                                      : customDropdown<PayAccountNumberFZ>(
                                          error: BankAttributes
                                              .payAccountNumberError.isNotEmpty,
                                          hintText: 'Select Account Number'.tr,
                                          top: 5,
                                          padding: EdgeInsets.zero,
                                          items: transferController
                                              .accountNumbers
                                              .map(
                                                (e) => DropdownMenuItem<
                                                    PayAccountNumberFZ>(
                                                  value: e,
                                                  child: Text(e.accountNumber),
                                                ),
                                              )
                                              .toList(),
                                          value:
                                              BankAttributes.payAccountNumber,
                                          onChanged: (p) {
                                            if (p != null) {
                                              BankAttributes.payAccountNumber =
                                                  p;
                                              BankAttributes
                                                  .payAccountNumberError = '';
                                              transferController.update();
                                            }
                                          },
                                        ),
                                  textFormField(
                                      controller: BankAttributes
                                          .paymentReferenceNumberController,
                                      focusNode: BankAttributes
                                          .paymentReferenceNumberFocusNode,
                                      labelText:
                                          '${'Payment_reference_number'.tr} *',
                                      onChanged: (s) {
                                        if (s.isNotEmpty &&
                                            BankAttributes
                                                .paymentReferenceNumberError
                                                .isNotEmpty) {
                                          BankAttributes
                                              .paymentReferenceNumberError = '';
                                          transferController.update();
                                        }
                                      },
                                      errorText: BankAttributes
                                          .paymentReferenceNumberError),
                                  const SizedBox(height: 20),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        // right: 33,
                                        bottom: 14.7),
                                    child: Row(
                                      children: [
                                        Text(
                                            '${"Upload Receipt/Bill".tr} ${'optional'.tr}',
                                            //Todo: Handle with form rules
                                            //Todo: Translate
                                            style: TextStyles.font12.copyWith(
                                              color: transferController.isDark
                                                  ? BankAttributes
                                                          .billError.isEmpty
                                                      ? AppConfigs.g8f
                                                      : AppConfigs.der
                                                  : BankAttributes
                                                          .billError.isEmpty
                                                      ? AppConfigs.g77
                                                      : AppConfigs.der,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.start),
                                        Expanded(child: Container()),
                                        errorText(
                                          BankAttributes.billError,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 0, 20, 20),
                                    child: docTile(
                                      transferController.isDark,
                                      noExpand: true,
                                      delete: () => transferController
                                        ..bill = null
                                        ..update(),
                                      onTap: () async =>
                                          Get.find<KycController>()
                                              .openDocSheet(
                                                  type: KYCType.BILL_RECEIPT,
                                                  isFront: null,
                                                  isCrop: false,
                                                  isFromReceipt: true),
                                      side: 'Bill/Receipt'.tr,
                                      path: transferController.bill?.path,
                                      type: KYCType.BILL_RECEIPT,
                                      isFront: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.only(
                            //       left: 31, right: 33, bottom: 20, top: 20),
                            //   alignment: Alignment.centerRight,
                            //   child: Text(
                            //     '${transferController.rateCharge!.netAmount?.toStringAsFixed(2)} ${APIConstants.currency}',
                            //     style: TS.f14.copyWith(
                            //       color: AppConfigs.accentColor,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                            Visibility(
                              visible: (transferController.gateWay?.type == 'D')
                                  ? true
                                  : transferController.gateWay?.type == 'D' &&
                                      transferController.gateWay?.description !=
                                          'Instant Bank Transfer',
                              // visible: transferController.gateWay?.type == 'D' &&
                              //     // transferController.gateWay?.description != 'DAPI',
                              //     transferController.gateWay?.description != 'Instant Bank Transfer',
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    customDropdown<DebitBankBV>(
                                        hintText: 'Debit Bank'.tr,
                                        error: transferController
                                            .debitBankError.isNotEmpty,
                                        items: transferController.debitBanks
                                            .map(
                                              (e) =>
                                                  DropdownMenuItem<DebitBankBV>(
                                                value: e,
                                                child: Text(e.bankDescription),
                                                // child: Text('${e.bankDescription} (${e.paymentModeKey})'),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (db) {
                                          transferController
                                            ..selectedDebitBank = db
                                            ..debitBankError = ''
                                            ..update();
                                        }),
                                    errorText(transferController.debitBankError)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                transferController.loadingPage
                    ? SizedBox.shrink()
                    : transferController.buttonLoading
                        ? loader(bottom: 20, top: 20)
                        : roundButton(
                            '${cms(Fields.PaymentConfirmation_PayButton).textHeading!} ${transferController.rateCharge?.netAmount?.toStringWithOptionalFixed(length)} ${Box3.companyDataFZ!.companySettings!.primaryBaseCurrency}',
                            child: Box3.settings.requiredCurrencySymbol == false
                                ? null
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        cms(Fields
                                                .PaymentConfirmation_PayButton)
                                            .textHeading!,
                                        style: TS.f16
                                            .copyWith(color: AppConfigs.w),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CurrencySymbolWithAmount(
                                        currencyWidth: 13,
                                        currencyCode: Box3
                                            .companyDataFZ!
                                            .companySettings!
                                            .primaryBaseCurrency,
                                        amount:
                                            '${transferController.rateCharge?.netAmount?.toStringWithOptionalFixed(length)}',
                                        color: AppConfigs.w,
                                        textStyle: TS.f16.copyWith(
                                          color: AppConfigs.w,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                            bottom: 30,
                            top: 10,
                            onTap: () async {
                              transferController.proceedTransaction();
                            },
                          )
              ],
            ),
          ),
        ),
      );
    });
  }
}
