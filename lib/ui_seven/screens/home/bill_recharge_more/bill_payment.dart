import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class BillPayment extends StatelessWidget {
  const BillPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController purposeController =
        TextEditingController(text: 'family_support'.tr);
    final TextEditingController sourceController =
        TextEditingController(text: 'salary'.tr);
    final TextEditingController payController =
        TextEditingController(text: '10000');
    final TextEditingController addNoteController =
        TextEditingController(text: 'paying_for_three_months'.tr);

    var items = [
      'working_lot_harder'.tr,
      'being_lot_smarter'.tr,
      'being_self_starter'.tr,
      'placed_in_charge_of_trading_charter'.tr
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          appBar0('bill_payment'.tr),
          Expanded(
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 27, bottom: 5, top: 20),
                  child: Text('biller'.tr,
                      style: TextStyles.font12.copyWith(
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 27,
                    bottom: 20,
                    right: 33,
                  ),
                  child: TextField(
                    controller: purposeController,
                    style: TextStyles.font14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffd1d1d1),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffd1d1d1), width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: PopupMenuButton<String>(
                        icon: SvgPicture.asset(ImagePath.downArrow),
                        onSelected: (String value) {
                          purposeController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return items
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyles.font14.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff444444),
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 27, bottom: 5, right: 33),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('biller_id'.tr,
                          style: TextStyles.font12.copyWith(
                            color: const Color(0xff444444),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start),
                      Text("Bruce Lee | ${"Mob_No".tr}90353363782",
                          style: TextStyles.font10.copyWith(
                            color: const Color(0xff444444),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.start),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 27, bottom: 20, right: 33),
                  child: TextField(
                    controller: sourceController,
                    style: TextStyles.font14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffd1d1d1),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffd1d1d1), width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: PopupMenuButton<String>(
                        icon: SvgPicture.asset(ImagePath.downArrow),
                        onSelected: (String value) {
                          sourceController.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return items
                              .map<PopupMenuItem<String>>((String value) {
                            return PopupMenuItem(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyles.font14.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff444444),
                                ),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27, bottom: 5),
                  child: Text('pay'.tr,
                      style: TextStyles.font12.copyWith(
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 27, bottom: 20, right: 33),
                  child: TextField(
                    controller: payController,
                    style: TextStyles.font14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffd1d1d1),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffd1d1d1), width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      suffixIcon: Container(
                        width: 79,
                        height: 56,
                        margin:
                            const EdgeInsets.only(right: 1, bottom: 1, top: 1),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xffe8e8e8)),
                        child: PopupMenuButton<String>(
                          icon: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AED',
                                style: TextStyles.font14.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff444444),
                                ),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                          onSelected: (String value) {
                            // _payController.text = value;
                          },
                          itemBuilder: (BuildContext context) {
                            return items
                                .map<PopupMenuItem<String>>((String value) {
                              return PopupMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyles.font14.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff444444),
                                  ),
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27, bottom: 5),
                  child: Text('add_note'.tr,
                      style: TextStyles.font12.copyWith(
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 27, bottom: 20, right: 33),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    style: TextStyles.font14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffd1d1d1),
                    ),
                    controller: addNoteController,
                    decoration: InputDecoration(
                      hintStyle: TextStyles.font14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xffd1d1d1),
                      ),
                      hintText: addNoteController.text,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xffd9d7d7), width: 1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                roundButton('next'.tr, bottom: 30)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
