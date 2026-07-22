import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/editing_controllers.dart/attributes.dart';
import 'package:mobiremit/models/payment_modes/payment_mode_fz.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_three_custom_widgets.dart';
import '../../core/flavours/constants.dart';

Widget paymentIcon(PaymentMode e) {
  return GetBuilder<TransferController>(
    builder: (transferController) => GestureDetector(
      onTap: () {
        if (!(transferController.banksList.length == 1 &&
            transferController
                    .banksList.firstOrNull?.payAccountNumbers.length ==
                1)) {
          BankAttributes.clear();
        }

        transferController
          ..bill = null
          ..gateWay = e
          ..gatewayError = ''
          ..update();

        if (e.type == 'A') {
          BankAttributes.drawingBank = transferController.banksList.length == 1
              ? transferController.banksList.first
              : null;
          if (transferController.banksList.length == 1 &&
              transferController
                      .banksList.firstOrNull?.payAccountNumbers.length ==
                  1) {
            BankAttributes.payAccountNumber =
                transferController.banksList.first.payAccountNumbers.first;
            transferController.accountNumbers =
                transferController.banksList.first.payAccountNumbers.toList();
          }
        }

        // if (transferController.gateWay?.type == 'A') {
        //   final position =
        //       transferController.listScrollController.position.maxScrollExtent +
        //           250;
        //   transferController
        //     ..listScrollController.animateTo(
        //       position,
        //       duration: const Duration(milliseconds: 10),
        //       curve: Curves.linear,
        //     )
        //     ..update();
        // } else if (transferController.gateWay?.type == 'D' &&
        //     transferController.gateWay?.description !=
        //         'Instant Bank Transfer') {
        //   // else if (transferController.gateWay?.type == 'D' && transferController.gateWay?.description != 'DAPI') {
        //   final position =
        //       transferController.listScrollController.position.maxScrollExtent +
        //           70;
        //   transferController
        //     ..listScrollController.jumpTo(position)
        //     ..update();
        // } else {
        //   final position =
        //       transferController.listScrollController.position.maxScrollExtent +
        //           70;
        //   transferController
        //     ..listScrollController.jumpTo(position)
        //     ..update();
        // }
      },
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // (e.recommended != null && e.recommended?.isNotEmpty == true)
          //     ? SizedBox(
          //         child: Row(
          //           // mainAxisAlignment: MainAxisAlignment.center,
          //           // crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             // const SizedBox(
          //             //   width: 6,
          //             // ),
          //             Text(e.recommended ?? '',
          //                 style: TS.f12.copyWith(
          //                   color: transferController.isDark
          //                       ? AppConfigs.rg.withOpacity(0.8)
          //                       : AppConfigs.rg.withOpacity(0.8),
          //                   fontWeight: FontWeight.w600,
          //                 ),
          //                 textAlign: TextAlign.center),
          //             // const SizedBox(
          //             //   width: 1,
          //             // ),
          //             // SvgPicture.asset(
          //             //   ImagePath.transactionDone,
          //             //   height: 16,
          //             //   width: 16,
          //             //   colorFilter: const ColorFilter.linearToSrgbGamma(),
          //             // ),
          //           ],
          //         ),
          //       )
          //     : const SizedBox(
          //         height: 16,
          //       ),
          Container(
            // margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              // color: (transferController.isDark ? AppConfigs.w : AppConfigs.b)
              //     .withOpacity(transferController.isDark
              //         ? 1
              //         : transferController.gateWay?.description == e.description
              //             ? 0.4
              //             : 0),
            ),
            padding: const EdgeInsets.all(8),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          // (e.recommended != null &&
                          //         e.recommended?.isNotEmpty == true)
                          //     ? AppConfigs.rg.withOpacity(0.8) :
                          AppConfigs.w.withOpacity(0.8),
                      width: 1.8,
                    ),
                    color: transferController.isDark
                        ? (transferController.gateWay?.description ==
                                    e.description ||
                                (transferController.gateWay?.paymentModeKey
                                            ?.isNotEmpty ==
                                        true &&
                                    transferController.gateWay?.paymentModeKey ==
                                        e.paymentModeKey)
                            ? AppConfigs.accentColor
                            : AppConfigs.g21)
                        : AppConfigs.w,
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    boxShadow: [
                      BoxShadow(
                        color: (transferController.isDark
                                ? AppConfigs.w
                                : AppConfigs.b)
                            .withOpacity(0.36),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  // decoration: (e.recommended != null && e.recommended?.isNotEmpty == true) ? BoxDecoration(
                  //     color: transferController.isDark ? AppConfigs.rg.withOpacity(0.8) : AppConfigs.rg.withOpacity(0.8),
                  //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //
                  //     boxShadow: [BoxShadow(color: (transferController.isDark ? AppConfigs.w : AppConfigs.b).withOpacity(0.5), blurRadius: 10)])
                  //
                  //
                  //     : BoxDecoration(
                  //     color: transferController.isDark ? (transferController.gateWay?.id == e.id ? AppConfigs.accentColor : AppConfigs.g21) : AppConfigs.w,
                  //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                  //     boxShadow: [BoxShadow(color: (transferController.isDark ? AppConfigs.w : AppConfigs.b).withOpacity(0.5), blurRadius: 10)]),
                  child: Base64Image(
                    image: e.paymentModeImage ?? '',
                    height: 40,
                    colorFilter: transferController.isDark
                        ? const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn)
                        : null,
                  ),
                ),
                Visibility(
                  visible: transferController.gateWay?.description ==
                          e.description ||
                      (transferController.gateWay?.paymentModeKey?.isNotEmpty ==
                              true &&
                          transferController.gateWay?.paymentModeKey ==
                              e.paymentModeKey),
                  child:
                      SvgPicture.asset(ImagePath.transactionDone, height: 40),
                )
              ],
            ),
          ),
          SizedBox(
            width: 95,
            child: Text(e.description ?? '',
                style: TS.f14.copyWith(
                  color:
                      transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center),
          )
        ],
      ),
    ),
  );
}
