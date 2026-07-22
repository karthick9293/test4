import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiremit/core/controllers/transfer_controller.dart';
import 'package:mobiremit/core/exports/ui_six_custom_widgets.dart';
import 'package:mobiremit/models/masters/master_response_fz.dart';

import '../../core/flavours/constants.dart';
import '../../core/models/formatter.dart';

Padding benefDetails(
  TransferController transferController, {
  String? name,
  required MasterResponseFZ? serviceType,
}) {
  int? length = Box3.settings.currencyDecimalLength;

  String shortForm = '';
  for (String e in (name?.replaceAll('  ', ' ').split(' ') ?? [])) {
    if (e.isNotEmpty) {
      shortForm = shortForm + e[0].toUpperCase();
    }
  }

  TextStyle textStyle({double fontSize = 14}) => TS.f14.copyWith(
        color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      );

  List<Map<String, String>> contents = transferController.selectedBeneficiary?.serviceType?.Code.toUpperCase() == 'B'
      ? [
          {'key': cms(Fields.ConfirmPaymentDetail_AccountNo).textHeading!, 'value': '${transferController.selectedBeneficiary!.accountNumber}'},
          {'key': cms(Fields.ConfirmPaymentDetail_BankName).textHeading!, 'value': '${transferController.selectedBeneficiary!.bank?.Desc}'},
          if (transferController.selectedBeneficiary!.branch?.Desc.isNotEmpty ?? false)
            {'key': cms(Fields.ConfirmPaymentDetail_BranchName).textHeading!, 'value': '${transferController.selectedBeneficiary!.branch?.Desc}'},
          {
            'key': cms(Fields.ConfirmPaymentDetail_SendingAmount).textHeading!,
            'value': (double.tryParse(transferController.fromAmountCtrl.text) ?? 0).toStringWithOptionalFixed(length),
            'currencyCode': transferController.fromAmtCur
          }
        ]
      : transferController.selectedBeneficiary?.serviceType?.Code.toUpperCase() == 'W'
          ? [
              {'key': cms(Fields.ConfirmPaymentDetail_Location).textHeading!, 'value': (transferController.selectedBeneficiary!.address1 ?? '--')},
              {'key': cms(Fields.ConfirmPaymentDetail_Country).textHeading!, 'value': transferController.selectedBeneficiary!.country?.Desc ?? '-'},
              {
                'key': cms(Fields.ConfirmPaymentDetail_SendingAmount).textHeading!,
                'value': (double.tryParse(transferController.fromAmountCtrl.text) ?? 0).toStringWithOptionalFixed(length),
                'currencyCode': transferController.fromAmtCur
              }
            ]
          : [
              {'key': cms(Fields.ConfirmPaymentDetail_Location).textHeading!, 'value': (transferController.selectedBeneficiary!.address1 ?? '--')},
              {'key': cms(Fields.ConfirmPaymentDetail_Country).textHeading!, 'value': transferController.selectedBeneficiary!.country?.Desc ?? '-'},
              {
                'key': cms(Fields.ConfirmPaymentDetail_SendingAmount).textHeading!,
                'value': (double.tryParse(transferController.fromAmountCtrl.text) ?? 0).toStringWithOptionalFixed(length),
                'currencyCode': transferController.fromAmtCur
              }
            ];

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: transferController.isDark ? AppConfigs.b000f14 : AppConfigs.primaryColor.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                  border: Border.all(color: AppConfigs.primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: transferController.isDark ? AppConfigs.b01222d : AppConfigs.w,
                ),
                child: Center(
                  child: Text(
                    shortForm.isNotEmpty ? shortForm.substring(0, shortForm.length > 2 ? 2 : shortForm.length) : 'JB',
                    style: TextStyles.font14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppConfigs.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  name ?? '',
                  style: TS.f16.copyWith(color: transferController.isDark ? AppConfigs.w : AppConfigs.g4),
                ),
              ),
              // Spacer(),
              if (serviceType != null)
                Container(
                  height: 22,
                  width: 22,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 0.7, color: AppConfigs.g84),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      getServiceTypeIcon(serviceType.Code.toUpperCase()),
                    ),
                  ),
                ),
              SizedBox(width: 5),
              Text(
                serviceType?.Desc ?? '',
                style: textStyle(fontSize: 12),
              ),
            ],
          ),
        ),
        ...contents.map(
          (e) => Padding(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    e['key'] ?? '',
                    style: textStyle(),
                  ),
                ),
                Text(
                  ':',
                  style: textStyle(),
                ),
                SizedBox(width: 3),
                Expanded(
                  child: e['currencyCode'] != null
                      ? CurrencySymbolWithAmount(
                          currencyCode: e['currencyCode']!,
                          amount: e['value'] ?? '',
                          textStyle: textStyle(),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                e['value'] ?? '',
                                textAlign: TextAlign.end,
                                style: textStyle(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
