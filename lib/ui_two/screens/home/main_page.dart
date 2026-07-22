import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/exports/ui_two_pages.dart';

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
                title: 'Session Timeout',
                body: 'Are you sure you want to app session timeout',
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
            drawer: appDrawer(),
            backgroundColor: m.isDark ? Colors.black : Colors.white,
            body: SafeArea(child: m.pages.last),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // GetBuilder<MainController>(builder: (mainController) {
                //   return fixedButton(mainController) ?? const SizedBox();
                // }),
                if (m.pages.last.runtimeType != ConfirmDetailsPage &&
                    m.pages.last.runtimeType != PaymentModeScreen)
                  bottomBar(mainController.isDark),
              ],
            ),
          ),
        );
      }),
    );
  }
}

// Map<Type, Widget> bottomButton = {
//   SendMoneyPage1: BottomButtons.sendMoneyNext,
//   CashPickUpServicePage: BottomButtons.sendMoneyNext2,
//   BankTransferServicePage: BottomButtons.sendMoneyNext2,
//   MyBeneficiaryPage: BottomButtons.addBeneficiary,
//   AddBeneficiaryFormRules: BottomButtons.addBeneficiarySubmit,
//   MyTransactionsPageUiTwo: BottomButtons.download,
//   // ForexRatesPage: BottomButtons.createAlert,
//   // CurrencyRatesPage: BottomButtons.createAlert
// };

// Widget? fixedButton(MainController mc) {
//   return bottomButton[mc.pages.last.runtimeType];
// }

// PersistentTabController _controller = PersistentTabController(initialIndex: 0);
//
// List<Widget> _buildScreens() {
//   return [
//     DashBoardPage(),
//     CurrencyRatesPage(),
//     AppConfigs.sendMoney(
//       key: UniqueKey(),
//     ),
//     AccountPage()
//   ];
// }
//
// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.home),
//       title: ("Home"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//       // scrollController: _scrollController1,
//       // routeAndNavigatorSettings: RouteAndNavigatorSettings(
//       //   initialRoute: "/",
//       //   routes: {
//       //     "/first": (final context) => const MainScreen2(),
//       //     "/second": (final context) => const MainScreen3(),
//       //   },
//       // ),
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.settings),
//       title: ("Settings"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//       // scrollController: _scrollController2,
//       // routeAndNavigatorSettings: RouteAndNavigatorSettings(
//       //   initialRoute: "/",
//       //   routes: {
//       //     "/first": (final context) => const MainScreen2(),
//       //     "/second": (final context) => const MainScreen3(),
//       //   },
//       // ),
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.settings),
//       title: ("Settings"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//       // scrollController: _scrollController2,
//       // routeAndNavigatorSettings: RouteAndNavigatorSettings(
//       //   initialRoute: "/",
//       //   routes: {
//       //     "/first": (final context) => const MainScreen2(),
//       //     "/second": (final context) => const MainScreen3(),
//       //   },
//       // ),
//     ),
//     PersistentBottomNavBarItem(
//       icon: Icon(CupertinoIcons.settings),
//       title: ("Settings"),
//       activeColorPrimary: CupertinoColors.activeBlue,
//       inactiveColorPrimary: CupertinoColors.systemGrey,
//       // scrollController: _scrollController2,
//       // routeAndNavigatorSettings: RouteAndNavigatorSettings(
//       //   initialRoute: "/",
//       //   routes: {
//       //     "/first": (final context) => const MainScreen2(),
//       //     "/second": (final context) => const MainScreen3(),
//       //   },
//       // ),
//     ),
//   ];
// }

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     MainController m = Get.isRegistered<MainController>()?Get.find<MainController>():Get.put(MainController());
//     return PersistentTabView(
//       context,
//       controller: _controller,
//       screens: _buildScreens(),
//       items: _navBarsItems(),
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset: false, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardAppears: true,
//       popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
//       padding: const EdgeInsets.only(top: 8),
//       // backgroundColor: Colors.grey.shade900,
//       decoration: NavBarDecoration(
//         colorBehindNavBar: Colors.grey.shade100,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20))
//       ),
//       isVisible: true,
//       animationSettings: const NavBarAnimationSettings(
//         navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
//           duration: Duration(milliseconds: 400),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
//           animateTabTransition: true,
//           duration: Duration(milliseconds: 200),
//           screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
//         ),
//       ),
//       confineToSafeArea: true,
//       navBarHeight: kBottomNavigationBarHeight,
//       navBarStyle: NavBarStyle.style2, // Choose the nav bar style with this property
//     );
//   }
// }
