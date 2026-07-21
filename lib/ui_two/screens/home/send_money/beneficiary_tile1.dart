import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/beneficiary/beneficiary_fz.dart';
import '../../../../network/api_endpoints.dart';

Widget beneficiaryTile1(int i, {required BeneficiaryFz beneficiary}) {
  String shortForm = '';
  for (String e in (beneficiary.firstName!.replaceAll('  ', ' ').split(' '))) {
    if (e.isNotEmpty) {
      shortForm = shortForm + e[0].toUpperCase();
    }
  }

  List<Color> colors = [const Color(0xffee9e4e), const Color(0xff4e89ee), const Color(0xffee5e4e)];
  return GetBuilder<AccountController>(builder: (accountController) {
    return GestureDetector(
      onTap: () async {
        final t = Get.find<TransferController>();

        t
          ..selectedBeneficiary = beneficiary
          // ..toAmtCur = beneficiary.currency
          ..update();
        if (t.fromAmountCtrl.text.isNotEmpty) {
          await t.updateToCurrency(s: t.fromAmountCtrl.text, type: 'L');
        }
      },
      child: Container(
        color: Get.find<TransferController>().selectedBeneficiary?.id == beneficiary.id
            ? (accountController.isDark ? const Color(0xFF333333) : AppConfigs.primaryColor.withOpacity(0.1))
            : Colors.transparent,
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppConfigs.g70.withOpacity(0.1),
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 49,
                height: 47,
                decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(9)), color: colors[i % 3]),
                alignment: Alignment.center,
                child:
                    Text(shortForm.substring(0, shortForm.length > 2 ? 2 : shortForm.length), style: TextStyles.font20, textAlign: TextAlign.start),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(beneficiary.firstName!..replaceAll('  ', ' '),
                          style: TextStyles.font14
                              .copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 5),
                      Visibility(
                        visible: beneficiary.fav == 'Y',
                        child: SvgPicture.asset(ImagePath.bi2),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          beneficiary.serviceType?.Code == ServiceType.BANK_TRANSFER
                              ? '${beneficiary.bank} | ${beneficiary.accountNumber}'
                              : "beneficiary.type",
                          style: TextStyles.font10
                              .copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.a9, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(beneficiary.serviceCurrency!.Desc,
                          style: TextStyles.font10.copyWith(
                            color: const Color(0xffa9a9a9),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center)
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  });
}
