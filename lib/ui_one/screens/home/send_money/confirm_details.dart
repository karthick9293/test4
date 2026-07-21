import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/exports/ui_one_pages.dart';
import '../../../../core/flavours/constants.dart';

class ConfirmDetailsPage extends StatelessWidget {
  const ConfirmDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // int? length = Box3.settings.currencyDecimalLength;
    final transferController = Get.find<TransferController>();
    transferController
      ..acceptTAndC = false
      ..tAndCError = '';

    String getFullName() {
      final benf = transferController.selectedBeneficiary;
      return [
        benf?.firstName,
        benf?.middleName,
        benf?.lastName,
      ].where((part) => part != null && part.isNotEmpty).join(' ');
    }

    return Scaffold(
      backgroundColor: AppConfigs.bodybg(transferController.isDark),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            controller: transferController.listScrollController,
            children: [
              benefDetails(
                transferController,
                name: getFullName(),
                serviceType:
                    transferController.selectedBeneficiary?.serviceType,
              ),
              rateChargeDetails(transferController),
            ],
          )),
          GetBuilder<TransferController>(
              id: 'RPD-TAndC',
              builder: (tf) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Checkbox(
                              value: tf.acceptTAndC,
                              activeColor: AppConfigs.rg,
                              isError: tf.tAndCError.isNotEmpty,
                              onChanged: (b) => tf
                                ..acceptTAndC = b ?? false
                                ..tAndCError = ''
                                ..update(['RPD-TAndC']),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.to(
                                () => const TermsAndConditionsPage(
                                    isPreLogin: true),
                              ),
                              child: Text.rich(
                                overflow: TextOverflow.ellipsis,
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        style: TS.f12.copyWith(
                                            color: tf.isDark
                                                ? AppConfigs.w
                                                : AppConfigs.g4),
                                        text:
                                            '${cms(Fields.ConfirmPaymentDetail_IhaveRead).textHeading!} '),
                                    TextSpan(
                                      style: TS.f14.copyWith(
                                          color: AppConfigs.primaryColor,
                                          decoration: TextDecoration.underline),
                                      text: cms(Fields
                                              .ConfirmPaymentDetail_TermsAndConditions)
                                          .textHeading!,
                                    )
                                  ],
                                ),
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    errorText(
                      tf.tAndCError,
                      alignment: Alignment.centerLeft,
                      marginBottom: 5,
                      marginTop: 0,
                    ),
                  ],
                );
              }),
          GetBuilder<TransferController>(
            id: 'RPD-ProceedButton',
            builder: (tf) => tf.buttonLoading
                ? loader(bottom: 20, top: 20)
                : roundButton(
                    cms(Fields.SendMoney_ProceedButton).textHeading!,
                    bottom: 30,
                    top: 10,
                    onTap: () async {
                      if (tf.acceptTAndC) {
                        tf.saveRemittence();
                      } else {
                        tf
                          ..tAndCError = 'Please accept terms and conditions'.tr
                          ..update(['RPD-TAndC']);
                      }
                    },
                  ),
          ),

          // : roundButton(
          //     '${cms(Fields.ConfirmPaymentDetail_PayNowButton).textHeading!} ${(transferController.gateWay?.type == 'C' && (F.appFlavor == Flavor.sharafexchange || F.appFlavor == Flavor.casmex) ? transferController.rateCharge?.netAmount ?? '' : transferController.rateCharge?.netAmount?.toStringWithOptionalFixed(length))} ${APIConstants.currency}',
          //     bottom: 30,
          //     top: 10,
          //     onTap: () async {
          //       if (transferController.acceptTAndC) {
          //         transferController.proceedTransaction();
          //       } else {
          //         transferController
          //           ..tAndCError =
          //               'Please accept terms and conditions'.tr
          //           ..update();
          //       }
          //     },
          //   )
        ],
      ),
    );
  }
}

class CustomClipPathTopContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, 0);
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
