// import 'package:mobiremit/core/controllers/transfer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

Widget paymentExceptionAlert(
    {required String paymentStatus,
    String? heading,
    String? message,
    required InAppWebViewController webViewController,
    required String url}) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.fromLTRB(17, 12, 17, 15),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
            color: accountController.isDark ? AppConfigs.bf0 : AppConfigs.w),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.find<TransferController>().goBack();
                      },
                      child: SvgPicture.asset(
                        ImagePath.close,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                            AppConfigs.primaryColor, BlendMode.srcIn),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 62,
                    height: 62,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x29000000),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                            spreadRadius: 0)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                    ),
                  ),
                  Image.asset(ImagePath.warning, height: 50),
                  // SvgPicture.asset(HomeSvgs.deviceVerify),
                ],
              ),
              const SizedBox(height: 10),
              Text(heading ?? paymentStatus,
                  style: TS.f16.copyWith(
                      color: AppConfigs.der, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 10),
                child: Text(
                  message ??
                      """Please wait while we verify your payment with your bank. You can check your payment status on the 'My Transactions' screen. Once the payment is received, the payment status will change to Success.""",
                  style: TS.f14.copyWith(
                      color: AppConfigs.g4, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              roundButton(cms(Fields.PopUp_OkButton).textHeading!,
                  bottom: 0, left: 0, right: 0, top: 19, onTap: () {
                Get.back();
              }),
            ],
          ),
        ),
      ),
    );
  });
}
