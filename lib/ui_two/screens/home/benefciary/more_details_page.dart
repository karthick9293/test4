import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../models/beneficiary/beneficiary_fz.dart';

Widget moreBeneficiaryDetails(BeneficiaryFz b) {
  return GetBuilder<AccountController>(builder: (_) {
    return Column(
      children: [
        rowDetails('currency'.tr, b.serviceCurrency?.Desc ?? ""),
        rowDetails('email_address'.tr,
            (b.email?.isNotEmpty ?? false) ? b.email! : '-'),
        rowDetails(
          'mob'.tr,
          b.phone?.isNotEmpty == true ? b.phone! : '-',
        ),
        if (b.dateOfBirth != null && b.dateOfBirth!.isNotEmpty)
          rowDetails(
            'DOB',
            DateFormatter.ddmmmmyyyy(
              DateFormat("dd/MMM/yyyy").parse(b.dateOfBirth ?? ""),
            ),
          ),
        rowDetails(
          'Nationality_'.tr,
          (b.nationality?.Desc.isNotEmpty ?? false) ? b.nationality!.Desc : '-',
        ),
        b.gender!.Code.isNotEmpty
            ? rowDetails(
                'Gender_'.tr,
                b.gender?.Code == 'M'
                    ? 'male'.tr
                    : b.gender?.Code == 'F'
                        ? 'female'.tr
                        : b.gender?.Code == 'O'
                            ? 'Other'.tr
                            : b.gender?.Code ?? '')
            : const SizedBox(),
      ],
    );
  });
}

Widget rowDetails(String data1, String data2) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(data1, style: _textStyle),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Text(
                data2,
                textAlign: TextAlign.end,
                style: _textStyle,
              ),
            ),
          )
        ],
      ),
    );
  });
}

TextStyle get _textStyle => TS.f16.copyWith(
      color:
          Get.find<AccountController>().isDark ? AppConfigs.g8f : AppConfigs.g4,
    );
