import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../core/exports/built_values.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../models/banks/drawing_bank_fz.dart';
import '../../../custom_widgets/payment_icon.dart';
import '../../../custom_widgets/payment_mode_tile.dart';
import '../../../custom_widgets/rate_charge_details.dart';
import '../../../shimmers/payment_mode_shimmer.dart';

class ConfirmDetailsPage extends StatelessWidget {
  const ConfirmDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    int? length = Box3.settings.currencyDecimalLength;

    Get.find<TransferController>()
      ..acceptTAndC = false
      ..tAndCError = ''
      ..getDataForPaymentMode();

    return GetBuilder<TransferController>(builder: (transferController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(transferController.isDark),
        body: Column(
          children: [
            AppbarUiTwo(
              title: cms(Fields.ConfirmPaymentDetail_PageHeading).textHeading!,
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(ImagePath.sendMoneyBanner),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppConfigs.bodybg(transferController.isDark),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: transferController.listScrollController,
                      children: [
                        _benefDetailsTile(transferController),
                        rateChargeDetails(transferController),
                        transferController.loadingPage
                            ? PaymentModeShimmers()
                            : Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cms(Fields
                                              .PaymentConfirmation_SelectPaymentType)
                                          .textHeading!,
                                      style: TS.f20,
                                    ),
                                    SizedBox(height: 6),
                                    ...transferController.payments
                                        .map((e) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2),
                                              child: paymentModeTile(e),
                                            )),
                                    errorText(transferController.gatewayError),
                                    Obx(
                                      () => Visibility(
                                        visible: transferController
                                                    .gateWay?.type ==
                                                'G' ||
                                            transferController.gateWay?.type ==
                                                'P',
                                        child: transferController
                                                .loadingPaymentGateway.isTrue
                                            ? PaymentModeShimmers(
                                                gatewayOnly: true)
                                            : Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 10, 0, 0),
                                                height: 120,
                                                child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: transferController
                                                      .paymentGateways
                                                      .map(
                                                          (e) => paymentIcon(e))
                                                      .toList(),
                                                ),
                                              ),
                                      ),
                                    ),
                                    _buildAccountTransferSection(
                                        transferController),
                                    Visibility(
                                      visible: (transferController
                                                  .gateWay?.type ==
                                              'D')
                                          ? true
                                          : transferController.gateWay?.type ==
                                                  'D' &&
                                              transferController
                                                      .gateWay?.description !=
                                                  'Instant Bank Transfer',
                                      // visible: transferController.gateWay?.type == 'D' &&
                                      //     // transferController.gateWay?.description != 'DAPI',
                                      //     transferController.gateWay?.description != 'Instant Bank Transfer',
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Column(
                                          children: [
                                            customDropdown<DebitBankBV>(
                                                hintText: 'Debit Bank'.tr,
                                                error: transferController
                                                    .debitBankError.isNotEmpty,
                                                items: transferController
                                                    .debitBanks
                                                    .map(
                                                      (e) => DropdownMenuItem<
                                                          DebitBankBV>(
                                                        value: e,
                                                        child: Text(
                                                            e.bankDescription),
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
                                            errorText(transferController
                                                .debitBankError)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<TransferController>(
                id: 'RPD-TAndC',
                builder: (tf) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Checkbox(
                                value: tf.acceptTAndC,
                                activeColor: AppConfigs.rg,
                                isError: tf.tAndCError.isNotEmpty,
                                onChanged: (b) => tf
                                  ..acceptTAndC = b ?? false
                                  ..tAndCError = ''
                                  ..update(['RPD-TAndC']),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => Get.to(
                                  () => const TermsAndConditionsPage(
                                      isPreLogin: true),
                                ),
                                child: Text.rich(
                                  overflow: TextOverflow.ellipsis,
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          style: TS.f12.copyWith(
                                              color: tf.isDark
                                                  ? AppConfigs.w
                                                  : AppConfigs.g4),
                                          text:
                                              '${cms(Fields.ConfirmPaymentDetail_IhaveRead).textHeading!} '),
                                      TextSpan(
                                        style: TS.f14.copyWith(
                                            color: AppConfigs.primaryColor,
                                            decoration:
                                                TextDecoration.underline),
                                        text: cms(Fields
                                                .ConfirmPaymentDetail_TermsAndConditions)
                                            .textHeading!,
                                      )
                                    ],
                                  ),
                                  softWrap: true,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      errorText(
                        tf.tAndCError,
                        alignment: Alignment.centerLeft,
                        marginBottom: 5,
                        marginTop: 0,
                      ),
                    ],
                  );
                }),
            GetBuilder<TransferController>(
              id: 'RPD-ProceedButton',
              builder: (tf) => tf.buttonLoading
                  ? loader(bottom: 20, top: 20)
                  : roundButton(
                      '${cms(Fields.PaymentConfirmation_PayButton).textHeading!} ${transferController.rateCharge?.netAmount?.toStringWithOptionalFixed(length)} ${Box3.companyDataFZ!.companySettings!.primaryBaseCurrency}',
                      bottom: 30,
                      top: 10,
                      onTap: () async {
                        if (tf.acceptTAndC) {
                          tf.proceedTransaction(saveRemittance: true);
                        } else {
                          tf
                            ..tAndCError =
                                'Please accept terms and conditions'.tr
                            ..update(['RPD-TAndC']);
                        }
                      },
                    ),
            ),
          ],
        ),
      );
    });
  }

  Visibility _buildAccountTransferSection(
      TransferController transferController) {
    return Visibility(
      visible: transferController.gateWay?.type == 'A',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 5),
            child: Row(
              children: [
                Text(
                  '${(Box3.settings.clientName)} ${'bank'.tr} *',
                  style: TS.f16.copyWith(
                      color: transferController.isDark
                          ? AppConfigs.g8f
                          : AppConfigs.g4),
                ),
              ],
            ),
          ),
          transferController.banksList.length == 1 &&
                  BankAttributes.drawingBank != null
              ? dummyTextField(
                  BankAttributes.drawingBank!.bankName,
                  transferController.isDark,
                  // noPad: true,
                )
              : customDropdown<DrawingBankFz>(
                  error: BankAttributes.drawingBankError.isNotEmpty,
                  hintText: 'Please select bank'.tr,
                  top: 5,
                  padding: EdgeInsets.zero,
                  noPad: true,
                  items: transferController.banksList
                      .map(
                        (e) => DropdownMenuItem<DrawingBankFz>(
                            value: e, child: Text(e.bankName)),
                      )
                      .toList(),
                  onChanged: (b) {
                    if (b != null) {
                      BankAttributes.drawingBank = b;
                      BankAttributes.drawingBankError = '';

                      transferController
                        ..accountNumbers = b.payAccountNumbers.toList()
                        ..update();
                      if (transferController.accountNumbers.length == 1) {
                        BankAttributes.payAccountNumber =
                            b.payAccountNumbers[0];
                        transferController.update();
                      } else {
                        BankAttributes.payAccountNumber = null;
                        BankAttributes.payAccountNumberError = '';
                        transferController.update();
                      }
                    }
                  },
                ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 5),
            child: Text(
              '${(Box3.settings.clientName)} ${'account_number'.tr}*',
              style: TS.f16.copyWith(
                  color: transferController.isDark
                      ? AppConfigs.g8f
                      : AppConfigs.g4),
            ),
          ),
          transferController.accountNumbers.length == 1 &&
                  BankAttributes.payAccountNumber != null
              ? dummyTextField(
                  BankAttributes.payAccountNumber!.accountNumber,
                  transferController.isDark,
                  // noPad: true,
                )
              : customDropdown<PayAccountNumberFZ>(
                  error: BankAttributes.payAccountNumberError.isNotEmpty,
                  hintText: 'Select Account Number'.tr,
                  // buttonHeight: 48,
                  top: 5,
                  padding: EdgeInsets.zero,
                  noPad: true,
                  items: transferController.accountNumbers
                      .map(
                        (e) => DropdownMenuItem<PayAccountNumberFZ>(
                          value: e,
                          child: Text(e.accountNumber),
                        ),
                      )
                      .toList(),
                  value: BankAttributes.payAccountNumber,
                  onChanged: (p) {
                    if (p != null) {
                      BankAttributes.payAccountNumber = p;
                      BankAttributes.payAccountNumberError = '';
                      transferController.update();
                    }
                  },
                ),
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 5),
            child: Text(
              '${'Payment_reference_number'.tr} *',
              style: TS.f16.copyWith(
                  color: transferController.isDark
                      ? AppConfigs.g8f
                      : AppConfigs.g4),
            ),
          ),
          textFormField(
            controller: BankAttributes.paymentReferenceNumberController,
            noPad: true,
            onChanged: (s) {
              if (s.isNotEmpty &&
                  BankAttributes.paymentReferenceNumberError.isNotEmpty) {
                BankAttributes.paymentReferenceNumberError = '';
                transferController.update();
              }
            },
            errorText: BankAttributes.paymentReferenceNumberError,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                '${"Upload Receipt/Bill".tr} ${'optional'.tr}',
                style: TS.f16.copyWith(
                  color: transferController.isDark
                      ? BankAttributes.billError.isEmpty
                          ? AppConfigs.g8f
                          : AppConfigs.der
                      : BankAttributes.billError.isEmpty
                          ? AppConfigs.g4
                          : AppConfigs.der,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(child: Container()),
              errorText(
                BankAttributes.billError,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: docTile(
              transferController.isDark,
              noExpand: true,
              delete: () => transferController
                ..bill = null
                ..update(),
              onTap: () async => Get.find<KycController>().openDocSheet(
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
    );
  }

  Container _benefDetailsTile(TransferController transferController) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: AppConfigs.gdc),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppConfigs.primaryColor.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: FittedBox(
              child: Center(
                child: Text(
                  transferController.selectedBeneficiary != null
                      ? getShortName(
                          transferController.selectedBeneficiary!.name ?? '')
                      : 'B',
                  style: TS.f16.copyWith(color: AppConfigs.primaryColor),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 2,
              children: [
                Text(
                  transferController.selectedBeneficiary != null
                      ? transferController.selectedBeneficiary!.name ?? ''
                      : cms(Fields.SendMoney_SelectBeneficiary).textHeading!,
                  style: TS.f16.copyWith(
                    color: transferController.selectedBeneficiary != null
                        ? AppConfigs.primaryColor
                        : transferController.isDark
                            ? AppConfigs.g8f
                            : AppConfigs.g70,
                  ),
                  textAlign: TextAlign.start,
                ),
                if (transferController.selectedBeneficiary != null)
                  Row(
                    children: [
                      Text(
                        '${(transferController.selectedBeneficiary!.serviceType?.Desc ?? '')} | ',
                        style: TS.f14.copyWith(
                          color: transferController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g70,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          transferController
                                      .selectedBeneficiary!.serviceType?.Code ==
                                  'C'
                              ? transferController
                                  .selectedBeneficiary!.country!.Desc
                              : transferController.selectedBeneficiary!
                                          .serviceType?.Code ==
                                      'B'
                                  ? (transferController
                                          .selectedBeneficiary!.bank?.Desc ??
                                      '')
                                  : (transferController
                                          .selectedBeneficiary!.bank?.Desc ??
                                      ''),
                          style: TS.f14.copyWith(
                            color: transferController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g70,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.find<MainController>().push(
                ViewBeneficiaryPageTheme1(
                  beneficiary: transferController.selectedBeneficiary!,
                  fromSendMoney: true,
                ),
                AppBars.viewBeneficiary,
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(70, 30),
              backgroundColor: AppConfigs.primaryColor,
            ),
            child: Text(
              'View',
              style: TS.f13.copyWith(color: AppConfigs.w),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPathTopContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, 0);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
