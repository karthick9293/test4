import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/flavours/constants.dart';
import 'forex_tab.dart';
import 'remittance_tab.dart';

class CreateAlertPage extends GetView {
  const CreateAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GetBuilder<AccountController>(builder: (accountController) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppConfigs.primaryColor, width: 2),
                  color:
                      accountController.isDark ? AppConfigs.bf0 : AppConfigs.w),
              height: 46.0,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TS.f14.copyWith(color: AppConfigs.w),
                unselectedLabelStyle:
                    TS.f14.copyWith(color: AppConfigs.primaryColor),
                labelColor: AppConfigs.w,
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppConfigs.primaryColor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    // Creates border
                    color: AppConfigs.primaryColor),
                tabs: [
                  Tab(
                    text: cms(Fields.ForexBooking_Remmitance).textHeading,
                    iconMargin: EdgeInsets.zero,
                  ),
                  Tab(
                    text: cms(Fields.ForexBooking_Forex).textHeading,
                  ),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  RemittanceTab(),
                  ForexTab(),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
