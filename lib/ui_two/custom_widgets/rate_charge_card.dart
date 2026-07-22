import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../core/controllers/transfer_controller.dart';
import '../../core/flavours/constants.dart';
import '../../core/models/formatter.dart';

Widget rateChargeCard({double top = 174, double bottom = 60}) {
  int? length = Box3.settings.currencyDecimalLength;
  return GetBuilder<TransferController>(builder: (transferController) {
    Widget tile(String label, String? value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TS.f12.copyWith(
                  color: transferController.isDark
                      ? AppConfigs.w
                      : AppConfigs.g77),
              textAlign: TextAlign.start),
          // 1
          Text(value ?? '--',
              style: TS.f14.copyWith(
                  color:
                      transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.start),
        ],
      );
    }

    return Stack(
      children: [
        Container(
          height: 147,
          margin: EdgeInsets.fromLTRB(20, top, 20, bottom),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              border: Border.all(color: AppConfigs.w, width: 2),
              color: transferController.isDark ? AppConfigs.b : AppConfigs.w),
        ),
        Container(
          height: 143,
          margin: EdgeInsets.fromLTRB(20, top, 20, bottom),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              border: Border.all(color: AppConfigs.primaryColor, width: 2),
              color: AppConfigs.primaryColor.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              children: [
                StaggeredGrid.count(
                  crossAxisCount: 3,
                  children: [
                    tile(
                        cms(Fields.MyTransaction_PayAmount).textHeading!,
                        transferController.rateCharge?.lcyAmount
                            ?.toStringWithOptionalFixed(length)),
                    tile(
                        cms(Fields.MyTransaction_Fees).textHeading!,
                        transferController.rateCharge?.bankChargesLcy
                            ?.toStringWithOptionalFixed(length)),
                    Box3.settings.enableVat == true
                        ? tile(
                            cms(Fields.MyTransaction_VAT).textHeading!,
                            transferController.rateCharge?.tax
                                ?.toStringWithOptionalFixed(length))
                        : const SizedBox(),
                    tile(
                        cms(Fields.MyTransaction_OtherCharges).textHeading!,
                        transferController.rateCharge != null
                            ? 0.toStringWithOptionalFixed(length)
                            : ''),

                    // Box3.settings.EnableVAT == true
                    //     ? tile('VAT'.tr,
                    //         transferController.rateCharge?.taxAmount?.toStringWithOptionalFixed(length))
                    //     : const SizedBox(),
                    // StaggeredGridTile.fit(
                    //   crossAxisCellCount: 2,
                    //   child: [
                    //
                    //   ]
                    // ),
                    // tile('Rate',
                    //     transferController.rateCharge?.dRate?.toStringAsFixed(rateLength) ?? ''),

                    tile(cms(Fields.MyTransaction_Rate).textHeading!,
                        transferController.rateCharge?.rate?.toString() ?? ''),

                    tile(
                        cms(Fields.MyTransaction_NetPayAmount).textHeading!,
                        transferController.rateCharge?.netAmount
                            ?.toStringWithOptionalFixed(length)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    // Expanded(
                    //   child: tile('Net Pay Amount',
                    //       transferController.rateCharge?.netAmount?.toStringWithOptionalFixed(length)),
                    // ),
                    Expanded(
                      child: tile(
                          cms(Fields.MyTransaction_NetReceiveAmount)
                              .textHeading!,
                          transferController.rateCharge?.fcyAmount
                              ?.toStringWithOptionalFixed(length)),
                    ),
                  ],
                )
              ],
            ),
            // child: Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         tile('Pay Amount',
            //             transferController.rateCharge?.lcyAmount.toStringWithOptionalFixed(length)),
            //         const Spacer(),
            //         tile('Rate', transferController.rateCharge?.dRate.toStringWithOptionalFixed(length)),
            //         tile('Other Charges',
            //             transferController.rateCharge?.taxAmount.toStringWithOptionalFixed(length))
            //       ],
            //     ),
            //     const SizedBox(width: 47),
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Row(
            //             children: [
            //               tile('Fees',
            //                   transferController.rateCharge?.charge.toStringWithOptionalFixed(length)),
            //               const Spacer(),
            //               tile('Net Pay Amount',
            //                   transferController.rateCharge?.netAmount.toStringWithOptionalFixed(length)),
            //             ],
            //           ),
            //           const SizedBox(height: 0),
            //           tile('Net Receive Amount',
            //               transferController.rateCharge?.fcyAmount.toStringWithOptionalFixed(length)),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ],
    );
  });
}
