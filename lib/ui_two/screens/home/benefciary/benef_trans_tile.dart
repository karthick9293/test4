import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../models/transaction_details/transaction_details_fz.dart';

Widget benefTransTile(TransactionDetailsFz t, bool isDark) {
  return Container(
    // height: 80,
    decoration: BoxDecoration(
      border: Border(
          bottom: BorderSide(color: ConstColors.grey70.withOpacity(0.11))),
    ),
    margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
    padding: const EdgeInsets.only(top: 10, bottom: 5),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              DateFormatter.ddmmmmyyyy(t.transactionDate),
              style: TS.f14.copyWith(
                  color: isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Text(
              '${(double.tryParse(t.receivedAmount ?? '') ?? 0.0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ${t.fromCurrencyCode}',
              style: TS.f14.copyWith(
                  color: isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Text(
              '${'ref_no'.tr} ${t.transactionReference}',
              style: TS.f12
                  .copyWith(color: isDark ? AppConfigs.g8f : AppConfigs.a9),
            ),
            const Spacer(),
            t.transactionStatus?.toLowerCase().contains('processing') == true ||
                    t.transactionStatus?.toLowerCase().contains('requested') ==
                        true
                ? StatusTiles.waitingForApprovalTile(t.transactionStatus)
                : t.transactionStatus == 'Success'
                    ? StatusTiles.successTile()
                    : StatusTiles.failTile(text: t.transactionStatus),
          ],
        ),
      ],
    ),
  );
}
