import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/exports/ui_two_pages.dart';
import '../../../core/flavours/constants.dart';

class CreateAlertPage extends GetView {
  const CreateAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppbarUiTwo(
            title: cms(Fields.ForexBooking_CreateAlertButton).textHeading!,
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: GetBuilder<AccountController>(builder: (accountController) {
                return ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppConfigs.primaryColor, width: 2),
                          color: accountController.isDark ? AppConfigs.bf0 : AppConfigs.w),
                      height: 46.0,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TS.f14.copyWith(color: AppConfigs.w),
                        unselectedLabelStyle: TS.f14.copyWith(color: AppConfigs.primaryColor),
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
                    const SizedBox(
                      height: 400,
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
            ),
          ),
        ],
      ),
    );
  }
}
