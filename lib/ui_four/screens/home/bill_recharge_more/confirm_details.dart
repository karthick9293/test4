import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/transfer_controller.dart';
import '../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class ConfirmDetails extends StatelessWidget {
  const ConfirmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferController>(builder: (transferController) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            appBar0('confirm_details'.tr),
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 30, bottom: 6, right: 29),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("sending_to".tr,
                            style: TextStyles.font12.copyWith(
                                color: const Color(0xff444444),
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start),
                        Text("17 Aug, 2022",
                            style: TextStyles.font12.copyWith(
                                color: const Color(0xff444444),
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start),
                      ],
                    ),
                  ),
                  Container(
                    width: 428,
                    height: 118,
                    decoration: const BoxDecoration(color: Color(0xffe8f7fc)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 23.8, top: 12, bottom: 16),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 11),
                              child: circularNameShape('JB'),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: Text("Jhon Bruse (Brother)",
                                        style: TextStyles.font14.copyWith(
                                            color: const Color(0xff444444),
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.start),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text("cash_pickup".tr,
                                        style: TextStyles.font12.copyWith(
                                            color: const Color(0xff444444),
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.start),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                        "${'location'.tr} Trivandrum,Kerala  ",
                                        style: TextStyles.font12.copyWith(
                                            color: const Color(0xff444444),
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.start),
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        style: TextStyles.font12.copyWith(
                                            color: const Color(0xff444444),
                                            fontWeight: FontWeight.w400),
                                        text: 'sending_amount'.tr),
                                    TextSpan(
                                        style: TextStyles.font14.copyWith(
                                            color: const Color(0xff444444),
                                            fontWeight: FontWeight.w700),
                                        text: "39607.000 INR")
                                  ])),
                                ],
                              ),
                            ),
                            SvgPicture.asset(
                              ImagePath.edit,
                              colorFilter: ColorFilter.mode(
                                  AppConfigs.primaryColor, BlendMode.srcIn),
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 9, bottom: 1),
                    child: Text("you_send".tr,
                        style: TextStyles.font10.copyWith(
                            color: const Color(0xffa29c9c),
                            fontWeight: FontWeight.w600,
                            fontSize: 10.0),
                        textAlign: TextAlign.start),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 7.8),
                      child: Text("500 AED",
                          style: TextStyles.font18.copyWith(
                            color: const Color(0xff444444),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start)),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 58.5, bottom: 1),
                          child: Opacity(
                            opacity: 0.4399999976158142,
                            child: Container(
                                width: 1,
                                height: 11.6658935546875,
                                decoration: const BoxDecoration(
                                    color: Color(0xffb5b5b5))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 53.2, bottom: 1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Opacity(
                                opacity: 0.5299999713897705,
                                child: Container(
                                  width: 11.66650390625,
                                  height: 11.6666259765625,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffb5b5b5),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.2,
                                ),
                                child: Text("transfer_fee".tr,
                                    style: TextStyles.font10.copyWith(
                                      color: const Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 33),
                                  child: Text("1.000 AED",
                                      style: TextStyles.font10.copyWith(
                                        color: const Color(0xff444444),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.end),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 58.5, bottom: 1),
                          child: Opacity(
                            opacity: 0.4399999976158142,
                            child: Container(
                                width: 1,
                                height: 11.6658935546875,
                                decoration: const BoxDecoration(
                                    color: Color(0xffb5b5b5))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 53.2, bottom: 1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Opacity(
                                opacity: 0.5299999713897705,
                                child: Container(
                                  width: 11.66650390625,
                                  height: 11.6666259765625,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffb5b5b5),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.2,
                                ),
                                child: Text("other_charge".tr,
                                    style: TextStyles.font10.copyWith(
                                      color: const Color(0xff757575),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.start),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 33),
                                  child: Text("0.000 AED",
                                      style: TextStyles.font10.copyWith(
                                        color: const Color(0xff444444),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      textAlign: TextAlign.end),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 58.5, bottom: 7.3),
                          child: Opacity(
                            opacity: 0.4399999976158142,
                            child: Container(
                                width: 1,
                                height: 11.6658935546875,
                                decoration: const BoxDecoration(
                                    color: Color(0xffb5b5b5))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 31, right: 33, bottom: 7.3),
                    child: Divider(
                      color: Color(0xff707070),
                      height: 1,
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 31, right: 33, bottom: 1),
                      child: Text("they_receive".tr,
                          style: TextStyles.font10.copyWith(
                            color: const Color(0xffa29c9c),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start)),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 31, right: 33, bottom: 5.3),
                    child: Text("39607.88 INR",
                        style: TextStyles.font22.copyWith(
                          color: const Color(0xff05a6dd),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30, right: 33, bottom: 14.7),
                    child: Divider(
                      color: Color(0xff707070),
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 31, right: 33, bottom: 14.7),
                    child: Text("select_payment_type".tr,
                        style: TextStyles.font12.copyWith(
                          color: const Color(0xff444444),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.start),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: transferController.payments
                          .map((e) => Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    transferController
                                      ..gateWay = e
                                      ..update();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.black.withOpacity(
                                          transferController.gateWay?.type ==
                                                  e.type
                                              ? 0.2
                                              : 0),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SvgPicture.network(
                                          // e.imagePath,
                                          '',
                                          height: 50,
                                        ),
                                        Visibility(
                                          visible: transferController
                                                  .gateWay?.type ==
                                              e.type,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                color: AppConfigs.primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color:
                                                        AppConfigs.primaryColor,
                                                    width: 5)),
                                          ),
                                        ),
                                        Visibility(
                                          visible: transferController
                                                  .gateWay?.type ==
                                              e.type,
                                          child: const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 31,
                        right: 33,
                        bottom: 8,
                      ),
                      child: Center(
                        child: Container(
                          width: 174,
                          height: 23,
                          decoration:
                              const BoxDecoration(color: Color(0xfffffdb9)),
                          child: Text("${'total_payment'.tr} 501.000 AED",
                              style: TextStyles.font12.copyWith(
                                color: const Color(0xff444444),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      )),
                  roundButton('send'.tr, bottom: 30)
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
