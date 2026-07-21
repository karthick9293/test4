import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/exports/controllers.dart';
import 'package:mobiremit/core/exports/ui_five_custom_widgets.dart';
import 'package:mobiremit/core/exports/ui_five_pages.dart';
import 'package:mobiremit/core/flavours/constants.dart';
import 'package:mobiremit/core/my_scroll_behavior.dart';

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
                onTap: () {
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
            drawer: appDrawer(),
            backgroundColor: m.isDark ? Colors.black : Colors.white,
            appBar: mainController.appBars.last,
            body: ScrollConfiguration(
              behavior: MyBehavior(),
              child: Column(
                children: [
                  Expanded(child: m.pages.last),
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
