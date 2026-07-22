import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/editing_controllers.dart/attributes.dart';
import 'package:mobiremit/models/payment_modes/payment_mode_fz.dart';
import 'package:mobiremit/ui_common/base64_to_image.dart';

import '../../core/exports/controllers.dart';
import '../../core/flavours/constants.dart';

Widget paymentModeTile(PaymentMode e) {
  return GetBuilder<TransferController>(
    builder: (transferController) => GestureDetector(
      onTap: () {
        if (!(transferController.banksList.length == 1 && transferController.banksList.firstOrNull?.payAccountNumbers.length == 1)) {
          BankAttributes.clear();
        }

        transferController
          ..bill = null
          ..gateWay = e
          ..gatewayError = ''
          ..update();

        if (e.type == 'G') {
          transferController.fetchPaymentGateways();
        } else if (e.type == 'A') {
          BankAttributes.drawingBank = transferController.banksList.length == 1 ? transferController.banksList.first : null;
          if (transferController.banksList.length == 1 && transferController.banksList.firstOrNull?.payAccountNumbers.length == 1) {
            BankAttributes.payAccountNumber = transferController.banksList.first.payAccountNumbers.first;
            transferController.accountNumbers = transferController.banksList.first.payAccountNumbers.toList();
          }
          WidgetsBinding.instance.addPostFrameCallback(
                (timeStamp) {
              transferController.scrollToBottom(transferController.listScrollController);
            },
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: transferController.gateWay?.description == e.description || (transferController.gateWay?.type == 'P' && e.type == 'G')
              ? AppConfigs.primaryColor.withAlpha(30)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10
            )
          ]
        ),
        child: Row(
          spacing: 20,
          children: [
            Container(
              width: 48,
              height: 48,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConfigs.primaryColor.withAlpha(30),
              ),
              child: Base64Image(
                image: e.paymentModeImage ?? '',
                height: 40,
                colorFilter: transferController.isDark ? const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn) : null,
              ),
            ),
            Expanded(
              child: Text(
                e.description ?? '',
                style: TS.f18B.copyWith(
                  color: transferController.isDark ? AppConfigs.w : AppConfigs.g4,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
