import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/exports/ui_six_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/built_values/debit_bank_bv.dart';
import '../../../../models/banks/drawing_bank_fz.dart';
import '../../../../ui_four/screens/sign_up/upload_doc_tile.dart';
import '../../../../ui_six/shimmers/payment_mode_shimmer.dart';
import '../../../../ui_six/custom_widgets/payment_mode_tile.dart';
import '../../../../ui_two/screens/home/benefciary/view_beneficiary.dart';

class ConfirmDetailsPage extends StatelessWidget {
  const ConfirmDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tf = Get.find<TransferController>();
    tf
      ..acceptTAndC = false
      ..tAndCError = ''
      ..getDataForPaymentMode();

    int? length = Box3.settings.currencyDecimalLength;

    return GetBuilder<TransferController>(builder: (transferController) {
      return Scaffold(
        backgroundColor: transferController.isDark?null:AppConfigs.w,
        body: SafeArea(
          child: Column(
            children: [
              _buildStepper(),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _transferSummaryCard(tf),
                      const SizedBox(height: 20),
                      transferController.loadingPage
                          ? PaymentModeShimmers()
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cms(Fields
                                            .PaymentConfirmation_SelectPaymentType)
                                        .textHeading!
                                        .toString()
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff8298bb)),
                                  ),
                                  SizedBox(height: 6),
                                  ...transferController.payments
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.symmetric(
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
                                                    .map((e) => paymentIcon(e))
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
                                          errorText(
                                              transferController.debitBankError)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: AppConfigs.primaryColor.withOpacity(0.1),
                              border: Border.all(
                                  color:
                                      AppConfigs.primaryColor.withOpacity(0.3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                              "🔒 Transaction protected by 256-bit encryption and CBUAE compliance monitoring.")),
                    ],
                  ),
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
              SizedBox(
                height: 20,
              ),
              GetBuilder<TransferController>(
                  id: 'RPD-ProceedButton',
                  builder: (tf) {
                  return tf.buttonLoading
                      ? loader(bottom: 20, top: 20)
                      : Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,0,20,30),
                        child: Row(
                                            children: [
                        Expanded(
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: AppConfigs.primaryColor),
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    foregroundColor: AppConfigs.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12))),
                                onPressed: () {
                                  Get.find<MainController>().pop();
                                },
                                child: Text("Edit"))),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: roundButton(
                            cms(Fields.SendMoney_ProceedButton).textHeading!,
                            bottom: 0,
                            top: 0,
                            noMar:true,
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
                }
              ),
            ],
          ),
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

  Widget _buildStepper() {
    int currentStep = 2; // This could be managed by the controller later
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom:
                  BorderSide(color: AppConfigs.primaryColor.withOpacity(0.4)))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 80,
            right: 80,
            top: 18,
            child: Container(
              width: Get.width,
              height: 2,
              color: AppConfigs.primaryColor.withOpacity(0.6),
              margin: const EdgeInsets.symmetric(horizontal: 5),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child:
                      _stepCircle("1", currentStep >= 1, "Amount & Recipient")),
              Expanded(
                  child: _stepCircle("2", currentStep >= 2, "Confirm & Send")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stepCircle(String step, bool isActive, String label) {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: step == "1"
                ? Colors.green
                : isActive
                    ? AppConfigs.primaryColor
                    : Colors.white,
            shape: BoxShape.circle,
            border: isActive
                ? Border.all(
                    color: AppConfigs.primaryColor.withOpacity(0.2), width: 3)
                : Border.all(
                    color: AppConfigs.primaryColor.withOpacity(0.2), width: 2),
          ),
          child: Center(
            child: step == "1"
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : Text(
                    step,
                    style: TS.f14.copyWith(
                      color: isActive
                          ? Colors.white
                          : AppConfigs.primaryColor.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TS.f12.copyWith(
            color: step=="1"?Colors.green:AppConfigs.primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _transferSummaryCard(TransferController tf) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: AppConfigs.accentColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              colors: [

                HSLColor.fromColor(AppConfigs.tealLt)
                    .withLightness(
                    (HSLColor.fromColor(AppConfigs.tealLt).lightness + 0.09).clamp(0.0, 1.0))
                    .toColor(),
                AppConfigs.tealLt,
                HSLColor.fromColor(AppConfigs.tealLt)
                    .withLightness(
                    (HSLColor.fromColor(AppConfigs.tealLt).lightness - 0.08).clamp(0.0, 1.0))
                    .toColor(),

              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("TRANSFER SUMMARY",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: AppConfigs.muted2)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You Send",style: TS.f14.copyWith(color: AppConfigs.muted2),),
                  Text(
                    "${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency} ${tf.rateCharge?.netAmount ?? ''}",
                    style: TS.f28B,
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("They Get",style: TS.f14.copyWith(color: AppConfigs.muted2),),
                  Text(
                    "${tf.selectedBeneficiary?.serviceCurrency?.Code} ${tf.rateCharge?.fcyAmount ?? ''}",
                    style: TS.f28B.copyWith(
                        color: AppConfigs.teal),
                  ),
                ],
              ),
            ],
          ),
          const Divider(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("To",
                        style: TS.f14.copyWith(color: AppConfigs.muted2),),
                    Text(tf.selectedBeneficiary?.firstName ?? '',
                      style: TS.f14.copyWith(fontWeight: FontWeight.w900),),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((tf.selectedBeneficiary?.serviceType?.Code == "B")
                        ?"Bank":(tf.selectedBeneficiary?.serviceType?.Code == "C")
                        ?"Provider":"Bank",
                      style: TS.f14.copyWith(color: AppConfigs.muted2),),
                    Text((tf.selectedBeneficiary?.serviceType?.Code == "B")
                        ? tf.selectedBeneficiary?.bank?.Desc ?? '':(tf.selectedBeneficiary?.serviceType?.Code == "C")
                        ? tf.selectedBeneficiary?.serviceProvider?.Desc ?? '':tf.selectedBeneficiary?.bank?.Desc ?? '',
                      textAlign: TextAlign.end,style: TS.f14.copyWith(fontWeight: FontWeight.w900)),
                  ],
                ),
              ),

            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rate",
                      style: TS.f14.copyWith(color: AppConfigs.muted2),),
                    Text((tf.rateCharge?.rate ?? '').toString(),
                      style: TS.f14.copyWith(fontWeight: FontWeight.w900,color: Colors.deepPurple.shade800),),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fee",
                      style: TS.f14.copyWith(color: AppConfigs.muted2),),
                    Text("FREE 🎉",
                      style: TS.f14.copyWith(fontWeight: FontWeight.w900,color: Colors.green),),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _paymentMethods(TransferController tf) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("CHOOSE PAYMENT METHOD",
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _paymentTile(
          title: "Debit / Credit Card",
          subtitle: "**** 8821",
          tag: "Instant",
          selected: true,
        ),
        _paymentTile(
          title: "Bank Transfer",
          subtitle: "**** 4412",
          tag: "1–2 hr",
          selected: false,
        ),
        _paymentTile(
          title: "UAE PASS Wallet",
          subtitle: "Digital wallet linked",
          tag: "Instant",
          selected: false,
        ),
      ],
    );
  }

  Widget _paymentTile({
    required String title,
    required String subtitle,
    required String tag,
    required bool selected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? Colors.blue.shade900 : Colors.grey.shade300,
          width: 2,
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance_wallet),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(tag, style: const TextStyle(color: Colors.green)),
          ),
          const SizedBox(width: 10),
          Icon(
            selected ? Icons.check_circle : Icons.radio_button_off,
            color: selected ? Colors.blue : Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _termsAndButton(TransferController tf) {
    return GetBuilder<TransferController>(
        id: 'RPD-TAndC',
        builder: (tf) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: tf.acceptTAndC,
                      onChanged: (b) => tf
                        ..acceptTAndC = b ?? false
                        ..tAndCError = ''
                        ..update(['RPD-TAndC']),
                    ),
                    const Expanded(
                      child: Text("I have read Terms & Conditions"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GetBuilder<TransferController>(
                  id: 'RPD-ProceedButton',
                  builder: (tf) => tf.buttonLoading
                      ? loader(bottom: 20, top: 20)
                      : roundButton(
                          cms(Fields.SendMoney_ProceedButton).textHeading!,
                          bottom: 30,
                          top: 10,
                          onTap: () async {
                            if (tf.acceptTAndC) {
                              tf.saveRemittence();
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

// @override
// Widget build(BuildContext context) {
//   // int length = Box3.settings.currencyDecimalLength;
//   final transferController = Get.find<TransferController>();
//   transferController
//     ..acceptTAndC = false
//     ..tAndCError = '';
//
//   String getFullName() {
//     final benf = transferController.selectedBeneficiary;
//     return [
//       benf?.firstName,
//       benf?.middleName,
//       benf?.lastName,
//     ].where((part) => part != null && part.isNotEmpty).join(' ');
//   }
//
//   return Scaffold(
//     backgroundColor: AppConfigs.bodybg(transferController.isDark),
//     body: Column(
//       children: [
//         Expanded(
//             child: ListView(
//           physics: const ClampingScrollPhysics(),
//           scrollDirection: Axis.vertical,
//           controller: transferController.listScrollController,
//           children: [
//             benefDetails(
//               transferController,
//               name: getFullName(),
//               serviceType: transferController.selectedBeneficiary?.serviceType,
//             ),
//             rateChargeDetails(transferController),
//           ],
//         )),
//         GetBuilder<TransferController>(
//             id: 'RPD-TAndC',
//             builder: (tf) {
//               return Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           height: 30,
//                           width: 30,
//                           child: Checkbox(
//                             value: tf.acceptTAndC,
//                             activeColor: AppConfigs.rg,
//                             isError: tf.tAndCError.isNotEmpty,
//                             onChanged: (b) => tf
//                               ..acceptTAndC = b ?? false
//                               ..tAndCError = ''
//                               ..update(['RPD-TAndC']),
//                           ),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () => Get.to(
//                               () => const TermsAndConditionsPage(isPreLogin: true),
//                             ),
//                             child: Text.rich(
//                               overflow: TextOverflow.ellipsis,
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                       style: TS.f12.copyWith(color: tf.isDark ? AppConfigs.w : AppConfigs.g4),
//                                       text: '${cms(Fields.ConfirmPaymentDetail_IhaveRead).textHeading!} '),
//                                   TextSpan(
//                                     style: TS.f14.copyWith(color: AppConfigs.primaryColor, decoration: TextDecoration.underline),
//                                     text: cms(Fields.ConfirmPaymentDetail_TermsAndConditions).textHeading!,
//                                   )
//                                 ],
//                               ),
//                               softWrap: true,
//                               textAlign: TextAlign.start,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   errorText(
//                     tf.tAndCError,
//                     alignment: Alignment.centerLeft,
//                     marginBottom: 5,
//                     marginTop: 0,
//                   ),
//                 ],
//               );
//             }),
//         GetBuilder<TransferController>(
//           id: 'RPD-ProceedButton',
//           builder: (tf) => tf.buttonLoading
//               ? loader(bottom: 20, top: 20)
//               : roundButton(
//                   cms(Fields.SendMoney_ProceedButton).textHeading!,
//                   bottom: 30,
//                   top: 10,
//                   onTap: () async {
//                     if (tf.acceptTAndC) {
//                       tf.saveRemittence();
//                     } else {
//                       tf
//                         ..tAndCError = 'Please accept terms and conditions'.tr
//                         ..update(['RPD-TAndC']);
//                     }
//                   },
//                 ),
//         ),
//
//         // : roundButton(
//         //     '${cms(Fields.ConfirmPaymentDetail_PayNowButton).textHeading!} ${(transferController.gateWay?.type == 'C' && (F.appFlavor == Flavor.sharafexchange || F.appFlavor == Flavor.casmex) ? transferController.rateCharge?.netAmount ?? '' : transferController.rateCharge?.netAmount?.toStringAsFixed(length))} ${APIConstants.currency}',
//         //     bottom: 30,
//         //     top: 10,
//         //     onTap: () async {
//         //       if (transferController.acceptTAndC) {
//         //         transferController.proceedTransaction();
//         //       } else {
//         //         transferController
//         //           ..tAndCError =
//         //               'Please accept terms and conditions'.tr
//         //           ..update();
//         //       }
//         //     },
//         //   )
//       ],
//     ),
//   );
// }
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
