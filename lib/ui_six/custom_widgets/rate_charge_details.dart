import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiremit/core/controllers/transfer_controller.dart';
import 'package:mobiremit/models/rate_charge/rate_charge_fz.dart';
import 'package:mobiremit/ui_six/custom_widgets/currency_symbol_widget.dart';
import 'package:mobiremit/ui_six/custom_widgets/dotted_divider.dart';

import '../../core/flavours/constants.dart';
import '../../core/models/formatter.dart';

Padding rateChargeDetails(TransferController transferController) {
  int? length = Box3.settings.currencyDecimalLength;
  ChargeDetails? rateCharge = transferController.rateCharge;

  TextStyle textStyle() => TS.f14.copyWith(
        color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
        fontWeight: FontWeight.w600,
      );

  List<Map<String, String>> contents = [
    {
      'key': cms(Fields.ConfirmPaymentDetail_SendingAmount).textHeading!,
      'value': '${rateCharge?.lcyAmount?.toStringWithOptionalFixed(length)}',
      'currencyCode':
          '${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency}'
    },
    {
      'key': cms(Fields.ConfirmPaymentDetail_TransferFee).textHeading!,
      'value': '${rateCharge?.commission?.toStringWithOptionalFixed(length)}',
      'currencyCode':
          '${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency}'
    },
    if ((rateCharge?.discounts ?? 0) > 0)
      {
        'key': cms(Fields.ConfirmPaymentDetail_Discount).textHeading!,
        'value': '${rateCharge?.discounts?.toStringWithOptionalFixed(length)}',
        'currencyCode':
            '${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency}'
      },
    if (Box3.settings.enableVat == true)
      {
        'key': cms(Fields.ConfirmPaymentDetail_VAT).textHeading!,
        'value': rateCharge?.tax != null
            ? '${rateCharge?.tax!.toStringWithOptionalFixed(length)}'
            : '0',
        'currencyCode':
            '${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency}'
      },
    {
      'key': cms(Fields.ConfirmPaymentDetail_OtherCharges).textHeading!,
      'value':
          rateCharge?.tax != null ? 0.toStringWithOptionalFixed(length) : '0',
      'currencyCode':
          '${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency}'
    },
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    child: Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: transferController.isDark?null:Colors.white,
        border: Border.all(color: transferController.isDark? AppConfigs.primaryColor : AppConfigs.accentColor.withOpacity(0.1),),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                cms(Fields.ConfirmPaymentDetail_YouPay).textHeading!,
                style: TS.f18B.copyWith(
                  color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                ),
              ),
              Spacer(),
              // SizedBox(
              //     width: 15,
              //     child: currencySymbolImage(transferController.fromAmtCur,color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,textStyle: TS.f18.copyWith(
              //       color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
              //       fontWeight: FontWeight.w600,
              //     ))),
              // SizedBox(width: 5,),
              // Text(
              //   '${rateCharge?.netAmount?.toStringAsFixed(length)}',
              //   style: TS.f18.copyWith(
              //     color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              CurrencySymbolWithAmount(
                currencyWidth: 12,
                currencyCode: transferController.fromAmtCur,
                amount: '${rateCharge?.netAmount?.toStringWithOptionalFixed(length)}',
                color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                textStyle: TS.f18B.copyWith(
                  color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          ...contents.map(
            (e) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  // SvgPicture.asset(ImagePath.done),
                  // SizedBox(width: 10),
                  Text(
                    e['key'] ?? '',
                    style: textStyle(),
                  ),
                  Spacer(),
                  CurrencySymbolWithAmount(
                    currencyCode: e['currencyCode']!,
                    amount: (e['value']=='0' || e['value']=='0.00')?'FREE 🎉':e['value'] ?? '',
                    showCurrency: (e['value']=='0' || e['value']=='0.00')?false:true,
                    color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                    textStyle: (e['value']=='0' || e['value']=='0.00')?textStyle().copyWith(color: Colors.green):textStyle(),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ),
          ),
          Divider(
            color: Color(0xff808184),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                cms(Fields.ConfirmPaymentDetail_TheyReceive).textHeading!,
                style: TS.f18.copyWith(
                  color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                ),
              ),
              Spacer(),
              // SizedBox(
              //     width: transferController.toAmtCur=="AED"?15:null,
              //     child: currencySymbolImage(transferController.toAmtCur??'',color: AppConfigs.primaryColor,textStyle: TS.f18.copyWith(
              //       color: AppConfigs.primaryColor,
              //       fontWeight: FontWeight.w600,
              //     ))),
              SizedBox(
                width: 2.5,
              ),
              // Text(
              //   '${rateCharge?.fcyAmount?.toStringAsFixed(length)} ${transferController.toAmtCur ?? ""}',
              //   style: TS.f18.copyWith(
              //     color: AppConfigs.primaryColor,
              //     fontWeight: FontWeight.w600,
              //   ),
              // ),
              CurrencySymbolWithAmount(
                currencyWidth: 12,
                currencyCode: transferController.toAmtCur ?? '',
                amount:
                    '${rateCharge?.fcyAmount?.toStringWithOptionalFixed(length)}',
                color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                textStyle: TS.f18.copyWith(
                  color: AppConfigs.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Padding rateChargeDetails2(TransferController transferController) {
  int? length = Box3.settings.currencyDecimalLength;
  ChargeDetails? rateCharge = transferController.rateCharge;

  bool isDark = transferController.isDark;

  Color textColor = isDark ? AppConfigs.w : AppConfigs.g4;
  Color cardBg = isDark ? Colors.black12 : const Color(0xFFF4F6F9);

  TextStyle labelStyle = TS.f16.copyWith(
    color: textColor.withOpacity(0.7),
    fontWeight: FontWeight.w600,
  );

  TextStyle valueStyle = TS.f14.copyWith(
    color: textColor,
    fontWeight: FontWeight.w800,
  );

  Widget buildRow(String title, Widget value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(title, style: labelStyle),
          const Spacer(),
          value,
        ],
      ),
    );
  }

  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
    child: Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: transferController.isDark?null:Colors.white,
        border: Border.all(color: transferController.isDark? AppConfigs.primaryColor : AppConfigs.accentColor.withOpacity(0.1),),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Transfer Amount
          buildRow(
            cms(Fields.ConfirmPaymentDetail_SendingAmount).textHeading!,
            CurrencySymbolWithAmount(
              currencyCode: transferController.fromAmtCur,
              amount: '${rateCharge?.lcyAmount?.toStringWithOptionalFixed(length)}',
              color: textColor,
              textStyle: valueStyle,
            ),
          ),

          /// Service Fee (FREE 🎉 logic)
          buildRow(
            cms(Fields.ConfirmPaymentDetail_TransferFee).textHeading!,
            (rateCharge?.commission ?? 0) == 0
                ? Text(
              "FREE 🎉",
              style: valueStyle.copyWith(color: Colors.green),
            )
                : CurrencySymbolWithAmount(
              currencyCode: transferController.fromAmtCur,
              amount:
              '${rateCharge?.commission?.toStringWithOptionalFixed(length)}',
              color: textColor,
              textStyle: valueStyle,
            ),
          ),

          /// Exchange Margin
          buildRow(
            "Exchange Margin",
            CurrencySymbolWithAmount(
              currencyCode: transferController.fromAmtCur,
              amount: '${rateCharge?.tax?.toStringWithOptionalFixed(length) ?? "0"}',
              color: textColor,
              textStyle: valueStyle,
            ),
          ),

          const SizedBox(height: 10),

          Divider(color: Colors.grey.shade300),

          const SizedBox(height: 10),

          /// Total to Deduct (highlight)
          buildRow(
            "Total to Deduct",
            CurrencySymbolWithAmount(
              currencyCode: transferController.fromAmtCur,
              amount: '${rateCharge?.netAmount?.toStringWithOptionalFixed(length)}',
              color: const Color(0xFFB68C2A), // golden
              textStyle: TS.f16.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFFB68C2A),
              ),
            ),
          ),

          // const SizedBox(height: 10),
          //
          // /// Delivery Time
          // buildRow(
          //   "Delivery Time",
          //   Text(
          //     "~2 hours ⚡",
          //     style: valueStyle.copyWith(color: Colors.green),
          //   ),
          // ),
        ],
      ),
    ),
  );
}
