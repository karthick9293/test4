import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/controllers/sign_up_controller.dart';
import '../../core/flavours/constants.dart';

List<Widget> radioTiles(List<String> items, {required String? groupValue}) {
  return items
      .map(
        (e) => GestureDetector(
          onTap: () {
            Get.find<SignUpController>()
              ..signUpAttributes.gender = e
              ..update();
          },
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: Directionality.of(Get.context!) == TextDirection.rtl ? (e == 'male'.tr ? 20 : 15) : 6, left: e == 'male'.tr ? 20 : 15),
                height: 20,
                width: 20,
                child: Radio<String>(
                    value: e,
                    groupValue: groupValue,
                    onChanged: (s) {
                      Get.find<SignUpController>()
                        ..signUpAttributes.gender = e
                        ..update();
                    }),
              ),
              Text(e, style: TextStyles.font14)
            ],
          ),
        ),
      )
      .toList();
}
