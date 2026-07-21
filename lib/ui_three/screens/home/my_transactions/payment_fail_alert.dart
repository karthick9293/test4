import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_three_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

Widget paymentFailAlert(
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
                  const Icon(
                    Icons.error,
                    size: 60,
                    color: AppConfigs.der,
                  ),
                  // SvgPicture.asset(HomeSvgs.deviceVerify),
                ],
              ),
              const SizedBox(height: 10),
              Text(heading ?? paymentStatus,
                  style: TS.f20.copyWith(
                      color: AppConfigs.der, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 10),
                child: Text(
                  message ??
                      'We have encounter an unexpected error. Please try again and contact support if the problem continues.',
                  style: TS.f14.copyWith(
                      color: AppConfigs.g4, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              // roundButton('Try Again'.tr, bottom: 0, left: 0, right: 0, top: 19, onTap: (){
              //   Get.back();
              //   if (webViewController != null) {
              //     webViewController.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
              //     // webViewController.reload();
              //   }
              // }),
              // roundButton('Select Other Payment Method'.tr,
              //     bottom: 0, left: 0, right: 0, top: 19, onTap: (){
              //   Get.back();
              //   Get.back();
              //     }),

              roundButton(cms(Fields.PopUp_TryAgainButton).textHeading!,
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
