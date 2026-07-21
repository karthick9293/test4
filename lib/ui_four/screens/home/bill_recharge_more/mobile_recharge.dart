import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/main_controller.dart';
import '../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class MobileRechargePage extends StatelessWidget {
  const MobileRechargePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (mainController) {
      Widget rechargeTile(int i) {
        return GestureDetector(
          onTap: () => mainController
            ..selectedAmount = i
            ..rechargeAmt.text = i.toString()
            ..update(),
          child: Container(
            width: 104,
            height: 86,
            decoration: BoxDecoration(
                border: Border.all(
                    color: mainController.selectedAmount == i
                        ? AppConfigs.primaryColor
                        : Colors.transparent),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: mainController.isDark ? AppConfigs.g21 : AppConfigs.gf1),
            child: Center(
              child: Text('$i',
                  style: TS.f22.copyWith(
                      color: mainController.selectedAmount == i
                          ? AppConfigs.primaryColor
                          : (mainController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g4),
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center),
            ),
          ),
        );
      }

      return Scaffold(
        backgroundColor: AppConfigs.bodybg(mainController.isDark),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 20),
                    child: Row(
                      children: [
                        radioTile(
                            mainController.rechargeType == RechargeType.prepaid,
                            'prepaid'.tr,
                            onTap: () => mainController
                              ..rechargeType = RechargeType.prepaid
                              ..update()),
                        const SizedBox(width: 15),
                        radioTile(
                            mainController.rechargeType ==
                                RechargeType.postpaid,
                            "postpaid".tr,
                            onTap: () => mainController
                              ..rechargeType = RechargeType.postpaid
                              ..update()),
                      ],
                    ),
                  ),
                  textFormField(
                      hintText: 'country_'.tr,
                      trailing: Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            ImagePath.search,
                            colorFilter: ColorFilter.mode(
                                mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.g4,
                                BlendMode.srcIn),
                          )),
                      top: 0,
                      bottom: 20),
                  customDropdown<String>(
                      items: ['Airtel', 'Vi', 'Jio', 'BSNL']
                          .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyles.font14.copyWith(
                                      color: mainController.isDark
                                          ? AppConfigs.w
                                          : ConstColors.grey70),
                                ),
                              ))
                          .toList(),
                      hintText: 'operator'.tr,
                      onChanged: (s) {}),
                  textFormField(
                      hintText: 'mobile_number'.tr,
                      trailing: Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            ImagePath.search,
                            colorFilter: ColorFilter.mode(
                                mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.g4,
                                BlendMode.srcIn),
                          )),
                      top: 20,
                      bottom: 20),
                  textFormField(
                      hintText: 'amount'.tr,
                      top: 0,
                      bottom: 20,
                      controller: mainController.rechargeAmt),
                  roundButton('recharge'.tr, bottom: 20),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, bottom: 25.6, right: 30),
                    child: Row(
                      children: [
                        Container(
                            width: 4,
                            height: 23.412109375,
                            decoration:
                                const BoxDecoration(color: Color(0xffff8800))),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.5),
                          child: Text("frequently_recharge".tr,
                              style: TS.f14.copyWith(color: AppConfigs.g4),
                              textAlign: TextAlign.start),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, bottom: 25.6, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        rechargeTile(399),
                        rechargeTile(499),
                        rechargeTile(299),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
