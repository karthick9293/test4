import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/account_controller.dart';
import 'package:mobiremit/core/exports/ui_four_custom_widgets.dart';
import 'package:mobiremit/core/extensions/app_extensions.dart';
import 'package:mobiremit/core/flavours/app_config.dart';
import 'package:mobiremit/core/flavours/constants.dart' show TS, cms, Fields;
import 'package:mobiremit/models/cblimit/cblimit_fz.dart';
import 'package:mobiremit/others/box3.dart';
import 'package:mobiremit/core/models/formatter.dart';

Future cbLimitAlert({
  required CBLimitFz cbLimit,
  dynamic Function()? onTap,
  required String header,
}) {
  if (Get.isDialogOpen == true) Get.back();
  final ac = Get.find<AccountController>();

  final limits = <Widget>[];

  if (cbLimit.perTrnAmtLimit?.isNotEmpty == true) {
    limits.add(_buildLimitRow(
      label: 'Per Transaction Amount Limit',
      amount: cbLimit.perTrnAmtLimit!,
      isDark: ac.isDark,
    ));
  }

  if (cbLimit.trnAmtLmtMonthly?.isNotEmpty == true) {
    limits.add(_buildLimitRow(
      label: 'Monthly Transaction Amount Limit',
      amount: cbLimit.trnAmtLmtMonthly!,
      isDark: ac.isDark,
    ));
  }
  if (cbLimit.trnAmtToBenfPerMonth?.isNotEmpty == true) {
    limits.add(_buildLimitRow(
      label: 'Transaction Amount Limit to a Beneficiary in a Month',
      amount: cbLimit.trnAmtToBenfPerMonth!,
      isDark: ac.isDark,
    ));
  }

  return Get.dialog(
    Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 335),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0,
              )
            ],
            color: ac.isDark ? AppConfigs.g21 : AppConfigs.w,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5),
                Text(
                  header,
                  textAlign: TextAlign.center,
                  style: TS.f20.copyWith(
                    color: ac.isDark ? AppConfigs.w : AppConfigs.bf0,
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...limits.asMap().entries.map((entry) {
                        final idx = entry.key;
                        final widget = entry.value;
                        return Padding(
                          padding: EdgeInsets.only(top: idx > 0 ? 8.0 : 0),
                          child: widget,
                        );
                      }),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                roundButton(
                  cms(Fields.PopUp_OkButton).textHeading!,
                  noMar: true,
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _buildLimitRow({
  required String label,
  required String amount,
  required bool isDark,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Text(
          label.tr,
          style: TS.f14.copyWith(
            color: isDark ? AppConfigs.w : AppConfigs.bf0,
          ),
        ),
      ),
      const SizedBox(width: 10),
      Text(
        ' : ',
        style: TS.f14.copyWith(
          color: isDark ? AppConfigs.w : AppConfigs.bf0,
        ),
      ),
      const SizedBox(width: 5),
      Expanded(
        flex: 1,
        child: CurrencySymbolWithAmount(
          mainAxisAlignment: MainAxisAlignment.start,
          currencyCode:
              Box3.companyDataFZ!.companySettings!.primaryBaseCurrency,
          amount: double.parse(amount.removePrefixSpecialChars())
              .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength),
          color: isDark ? AppConfigs.w : AppConfigs.bf0,
          textStyle: TS.f14.copyWith(
            color: isDark ? AppConfigs.w : AppConfigs.bf0,
          ),
        ),
      ),
    ],
  );
}

