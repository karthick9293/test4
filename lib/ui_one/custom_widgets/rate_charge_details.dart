import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiremit/core/controllers/transfer_controller.dart';
import 'package:mobiremit/models/rate_charge/rate_charge_fz.dart';

import '../../core/exports/ui_one_custom_widgets.dart';
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
    padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              cms(Fields.ConfirmPaymentDetail_YouPay).textHeading!,
              style: TS.f18.copyWith(
                color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
              ),
            ),
            Spacer(),
            CurrencySymbolWithAmount(
              currencyWidth: 12,
              currencyCode:
                  '${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency}',
              amount:
                  '${rateCharge?.netAmount?.toStringWithOptionalFixed(length)}',
              color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
              textStyle: TS.f18.copyWith(
                color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: DottedDivider(
            color: Color(0xff808184),
            dashWidth: 3.0,
            dashSpace: 2.0,
          ),
        ),
        ...contents.map(
          (e) => Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              children: [
                SvgPicture.asset(ImagePath.done),
                SizedBox(width: 10),
                Text(
                  e['key'] ?? '',
                  style: textStyle(),
                ),
                Spacer(),
                CurrencySymbolWithAmount(
                  currencyCode: e['currencyCode']!,
                  amount: e['value'] ?? '',
                  color:
                      transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                  textStyle: textStyle(),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: DottedDivider(
            color: Color(0xff808184),
            dashWidth: 3.0,
            dashSpace: 2.0,
          ),
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
            SizedBox(width: 2.5),
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
        Divider(color: Color(0xff808184), height: 35),
      ],
    ),
  );
}
