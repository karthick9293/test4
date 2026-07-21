import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/inactivity_controller.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/controllers/main_controller.dart';
import '../../../core/exports/ui_three_custom_widgets.dart';
import '../../../core/exports/ui_three_pages.dart';
import '../../../core/flavours/constants.dart';
import '../../custom_widgets/bottom_tagged_butons.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    MainController m = Get.isRegistered<MainController>()
        ? Get.find<MainController>()
        : Get.put(MainController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (c, t) async {
        if (m.pages.last.runtimeType == FAQPage) {
          if (Get.find<AccountController>().faqNode.hasFocus) {
            Get.find<AccountController>().faqNode.unfocus();
          } else {
            m.pop();
          }
        } else {
          if (m.pages.length > 1) {
            m.pop();
          } else {
            // Show dialog for logout
            Get.dialog(
              yesOrNoAlert(
                title: 'logout'.tr,
                body: 'are_you_sure_you_want_to_log_out'.tr,
                yesText: cms(Fields.PopUp_Confirm).textHeading ?? 'logout'.tr,
                noText: cms(Fields.PopUp_Cancel).textHeading ?? 'cancel'.tr,
                hideIcon: true,
                onTap: () async {
                  Get.find<InactivityController>().gotoPreLoginPage();
                },
              ),
              barrierColor: Get.find<AccountController>().isDark
                  ? AppConfigs.w.withOpacity(0.2)
                  : null,
            );
          }
        }
        return Future.value(false); // Prevent the default pop behavior
      },
      child: GetBuilder<MainController>(builder: (mainController) {
        return SafeArea(
          top: false,
          child: Scaffold(
            key: mainController.key,
            endDrawer: appDrawer(),
            backgroundColor: m.isDark ? Colors.black : Colors.white,
            extendBodyBehindAppBar: true,
            appBar: null,
            body: SafeArea(
              top: false,
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: cms(Fields.Dashboard_HeaderBgImage).image != ""
                        ? Base64Image(
                            image:
                                cms(Fields.Dashboard_HeaderBgImage).image ?? "",
                            fit: BoxFit.fitHeight,
                            errorWidget: SizedBox(),
                          )
                        : SizedBox(),
                  ),
                  Column(
                    children: [
                      mainController.appBars.last,
                      Expanded(child: m.pages.last),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GetBuilder<MainController>(builder: (mainController) {
                  return fixedButton(mainController) ?? const SizedBox();
                }),
                if (mainController.pages.last.runtimeType !=
                        ConfirmDetailsPage &&
                    mainController.pages.last.runtimeType != PaymentModeScreen)
                  CurvedBottomNavBar(
                    selectedIndex: mainController.index,
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

Map<Type, Widget> bottomButton = {
  SendMoneyPage0: BottomButtons.sendMoneyNext,
  SendMoneyPage1: BottomButtons.sendMoneyNext,
  CashPickUpServicePage: BottomButtons.sendMoneyNext2,
  BankTransferServicePage: BottomButtons.sendMoneyNext2,
  MyBeneficiaryPage: BottomButtons.addBeneficiary,
  AddBeneficiaryFormRules: BottomButtons.addBeneficiarySubmit,
  MyTransactionsPage: BottomButtons.download,
  // ForexRatesPage: BottomButtons.createAlert,
  // CurrencyRatesPage: BottomButtons.createAlert
};

Widget? fixedButton(MainController mc) {
  return bottomButton[mc.pages.last.runtimeType];
}
