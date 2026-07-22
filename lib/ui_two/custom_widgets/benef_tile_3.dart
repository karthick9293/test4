import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/beneficiary/beneficiary_fz.dart';

import '../../core/exports/controllers.dart';
import '../../core/extensions/app_extensions.dart';
import '../../core/flavours/constants.dart';

Widget benefTile3(int i, BeneficiaryFz b, {void Function()? onTap}) {
  List<Color> colors = [const Color(0xffee9e4e), const Color(0xff4e89ee), const Color(0xffee5e4e)];
  String shortForm = '';

  return GetBuilder<TransferController>(builder: (transferController) {
    for (String e in (b.firstName!.replaceAll('  ', ' ').split(' '))) {
      if (e.isNotEmpty) {
        shortForm = shortForm + e[0].toUpperCase();
      }
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: 74,
        padding: EdgeInsets.fromLTRB(15, i != 0 ? 10 : 0, 15, 10),
        color: Colors.transparent,
        // decoration: BoxDecoration(
        // color: transferController.selectedBeneficiary == b
        //     ? AppConfigs.primaryColor.withOpacity(0.3)
        //     : null,
        // borderRadius: const BorderRadius.all(Radius.circular(19)),
        // border: Border(bottom: BorderSide(color: AppConfigs.gd7)),
        // ),
        child: Center(
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppConfigs.gd7), color: colors[i % 3]),
                alignment: Alignment.center,
                child:
                    Text(shortForm.substring(0, shortForm.length > 2 ? 2 : shortForm.length), style: TextStyles.font20, textAlign: TextAlign.start),
              ),
              SizedBox(width: 10),
              // Stack(
              //   alignment: Alignment.center,
              //   children: [
              //     Container(
              //       width: 44,
              //       height: 44,
              //       decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           border: Border.all(color: AppConfigs.gd7),
              //           color: colors[i % 3]),
              //       alignment: Alignment.center,
              //       child: Text(
              //           shortForm.substring(
              //               0, shortForm.length > 2 ? 2 : shortForm.length),
              //           style: TextStyles.font20,
              //           textAlign: TextAlign.start),
              //     ),
              //     Container(
              //         height: 60,
              //         width: 60,
              //         alignment: Alignment.topRight,
              //         child: SvgPicture.asset(
              //             transferController.selectedBeneficiary?.id == b.id
              //                 ? ImagePath.selected
              //                 : ImagePath.unSelected)),
              //   ],
              // ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(b.name!.removeExtraSpace(),
                        style: TS.f16.copyWith(color: transferController.isDark ? AppConfigs.w : AppConfigs.g4),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.start),
                    Text(
                        b.serviceType?.Code == 'B'
                            ? (b.bank != null ? '${b.bank?.Desc} | ${b.accountNumber ?? ''}'.trim() : '')
                            : '${b.serviceType?.Desc} | ${b.country?.Desc}',
                        style: TS.f14.copyWith(color: transferController.isDark ? AppConfigs.g8f : AppConfigs.g77),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // overflow: TextOverflow.clip,
                        textAlign: TextAlign.start)
                  ],
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppConfigs.gd7),
                ),
                child: Container(
                  height: transferController.selectedBeneficiary?.id == b.id ? 14 : 12,
                  width: transferController.selectedBeneficiary?.id == b.id ? 14 : 12,
                  decoration: transferController.selectedBeneficiary?.id == b.id
                      ? BoxDecoration(
                          color: AppConfigs.primaryColor,
                          shape: BoxShape.circle,
                        )
                      : null,
                ),
              )
            ],
          ),
        ),
      ),
    );
  });
}
