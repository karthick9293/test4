import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/bill_pay_controller.dart';
import '../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class PayBillPage extends StatelessWidget {
  const PayBillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillPayController>(builder: (billPayController) {
      return Scaffold(
          backgroundColor: AppConfigs.bodybg(billPayController.isDark),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 33, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            utilityIcon(
                              ImagePath.uDTH,
                              'DTH'.tr,
                              billPayController.billType == BillType.dth,
                              onTap: () =>
                                  billPayController.setBillType(BillType.dth),
                            ),
                            utilityIcon(
                              ImagePath.uElectricity,
                              'Electricity'.tr,
                              billPayController.billType == BillType.elec,
                              onTap: () =>
                                  billPayController.setBillType(BillType.elec),
                            ),
                            utilityIcon(
                              ImagePath.uWifi,
                              'WiFi'.tr,
                              billPayController.billType == BillType.wifi,
                              onTap: () =>
                                  billPayController.setBillType(BillType.wifi),
                            ),
                            utilityIcon(
                              ImagePath.uGas,
                              'Gas'.tr,
                              billPayController.billType == BillType.gas,
                              onTap: () =>
                                  billPayController.setBillType(BillType.gas),
                            ),
                          ],
                        ),
                      ),
                      textFormField(hintText: 'subscriber_iD'.tr, top: 0),
                      textFormField(
                        hintText: 'country'.tr,
                        top: 20,
                        bottom: 20,
                        trailing: Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              ImagePath.search,
                              colorFilter: ColorFilter.mode(
                                  billPayController.isDark
                                      ? AppConfigs.g8f
                                      : AppConfigs.g4,
                                  BlendMode.srcIn),
                            )),
                      ),
                      customDropdown<String>(
                          items: ['Airtel', 'Vi', 'Jio', 'BSNL']
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: TextStyles.font14.copyWith(
                                          color: billPayController.isDark
                                              ? AppConfigs.w
                                              : AppConfigs.g77),
                                    ),
                                  ))
                              .toList(),
                          hintText: 'operator'.tr,
                          onChanged: (s) {}),
                      // Padding(
                      //   padding:
                      //       const EdgeInsets.only(left: 30, top: 20, right: 30),
                      //   child: Container(
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //       borderRadius:
                      //           const BorderRadius.all(Radius.circular(5)),
                      //       border: Border.all(
                      //           color: const Color(0xffd9d7d7), width: 1),
                      //     ),
                      //     child: TextField(
                      //       controller: operatorController,
                      //       style: TextStyles.font14.copyWith(
                      //         fontWeight: FontWeight.w400,
                      //         color: const Color(0xffd1d1d1),
                      //       ),
                      //       decoration: InputDecoration(
                      //         contentPadding: const EdgeInsets.only(
                      //             left: 10, top: 13, bottom: 13),
                      //         border: InputBorder.none,
                      //         suffixIcon: PopupMenuButton<String>(
                      //           icon: SvgPicture.asset(ImagePath.downArrow),
                      //           onSelected: (String value) {
                      //             operatorController.text = value;
                      //           },
                      //           itemBuilder: (BuildContext context) {
                      //             return items.map<PopupMenuItem<String>>(
                      //                 (String value) {
                      //               return PopupMenuItem(
                      //                 value: value,
                      //                 child: Text(
                      //                   value,
                      //                   style: TextStyles.font14.copyWith(
                      //                     fontWeight: FontWeight.w400,
                      //                     color: const Color(0xff444444),
                      //                   ),
                      //                 ),
                      //               );
                      //             }).toList();
                      //           },
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      textFormField(hintText: 'amount'.tr, top: 20),
                      roundButton('pay_bill'.tr, top: 20, bottom: 20),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
