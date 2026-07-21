import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_four_custom_widgets.dart';
import '../../../core/exports/ui_four_pages.dart';
import '../../../core/flavours/constants.dart';

Widget bottomTile(String image, String text,
    {void Function()? onTap,
    double? iconHeight,
    double? iconWidth,
    bool isSelected = false}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedScale(
            scale: isSelected ? 1.15 : 1.0,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutBack,
            child: SvgPicture.asset(
              image,
              colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : Colors.white.withOpacity(0.5),
                  BlendMode.srcIn),
              height: iconHeight ?? 24,
            ),
          ),
          const SizedBox(height: 6),
          // Using AnimatedScale and AnimatedOpacity for the label
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isSelected ? 12 : 0,
            child: AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Text(
                text.replaceAll('\n', ' '),
                style: TS.f12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.2,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget bottomBar(bool isDark) {
  final MainController mainController = Get.find<MainController>();
  final double screenWidth = Get.width;
  final double barWidth = screenWidth - 32;
  final double itemWidth = barWidth / 4;

  return Container(
    margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
    height: 75,
    child: Stack(
      children: [
        // Modern Floating Background
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? [const Color(0xFF2C2C2C), const Color(0xFF1A1A1A)]
                  : [AppConfigs.accentColor, AppConfigs.primaryColor],
            ),
            boxShadow: [
              BoxShadow(
                color: (isDark ? Colors.black : AppConfigs.primaryColor)
                    .withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 2,
                offset: const Offset(0, 8),
              ),
              // Inner highlights for premium look
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(-2, -2),
              ),
            ],
          ),
        ),

        // Sliding Glow Indicator
        AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          left: (mainController.index * itemWidth) + (itemWidth * 0.04),
          top: 10,
          child: Container(
            width: itemWidth * 0.92,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
        ),

        // Bottom Navigation Items
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            bottomTile(
              ImagePath.homeBottom,
              cms(Fields.Dashboard_HomeIconAndText).textHeading!,
              isSelected: mainController.index == 0,
              onTap: () {
                mainController
                  ..pages.clear()
                  ..appBars.clear()
                  ..index = 0
                  ..push(const DashBoardPage(), dashBoardAppbar())
                  ..update();
              },
            ),
            bottomTile(
              ImagePath.myTransactionBottom,
              cms(Fields.Dashboard_RateCalculatorIconAndText).textHeading!,
              isSelected: mainController.index == 1,
              onTap: () {
                Get.find<AccountController>()
                  ..fromAmtCtrl.text = "1"
                  ..updateToCurency(s: '1', type: 'L')
                  ..currencyRatesType = 'rates'
                  ..update();
                mainController
                  ..pages.clear()
                  ..appBars.clear()
                  ..index = 1
                  ..push(const DashBoardPage(), dashBoardAppbar())
                  ..push(const CurrencyRatesPage(), AppBars.currencyRates)
                  ..update();
              },
            ),
            bottomTile(
              ImagePath.bankTransfer,
              cms(Fields.Dashboard_BankTransferIconAndText).textHeading!,
              isSelected: mainController.index == 2,
              onTap: () async {
                late final SignUpController signupController;
                if (Get.isRegistered<SignUpController>()) {
                  signupController = Get.find<SignUpController>();
                } else {
                  signupController = Get.put(SignUpController());
                }
                if (Box3.idExpired) {
                  signupController.showIDExpiredAlert();
                } else if (Box3.fetchUAEPassDoc?.visualizationExpiry
                            ?.toLocal() !=
                        null &&
                    Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
                  AccountController a = Get.find<AccountController>();
                  if (a.contactUs == null) {
                    a.getContactUs();
                  }
                  if (!Get.isRegistered<KycController>()) {
                    Get.put(KycController());
                  }
                  var expDate =
                      Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal();
                  int expiryDays = (DateTime(expDate!.year, expDate.month,
                              expDate.day, expDate.hour, expDate.minute)
                          .toLocal())
                      .difference(DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              DateTime.now().hour,
                              DateTime.now().minute)
                          .toLocal())
                      .inMinutes;

                  Get.put(AccountController());

                  if (expiryDays <= 0) {
                    if (Get.currentRoute !=
                        AppRoutes.visualizationRetryRoutes) {
                      Get.to(const RetryVisualization(), arguments: {
                        "msg":
                            'There was an error while fetching your documents from UAE PASS. Please retry'
                                .tr,
                        "type": 'P',
                        "isFrom": 'Dash'
                      });
                    }
                  } else {
                    Get.dialog(updateProfileBody(
                        msg:
                            'Your request/application is under process. We will get back to you within 24 hours'
                                .tr,
                        type: 'P'));
                  }
                } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry ==
                        null) &&
                    Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
                  AccountController a = Get.find<AccountController>();
                  if (a.contactUs == null) {
                    a.getContactUs();
                  }
                  if (!Get.isRegistered<KycController>()) {
                    Get.put(KycController());
                  }

                  Get.put(AccountController());

                  if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
                    Get.to(const RetryVisualization(), arguments: {
                      "msg":
                          'There was an error while fetching your documents from UAE PASS. Please retry'
                              .tr,
                      "type": 'P',
                      "isFrom": 'Dash'
                    });
                  }
                } else {
                  if (Get.isRegistered<TransferController>()) {
                    Get.find<TransferController>().reset(t: TransferType.bank);
                  } else {
                    Get.put(TransferController(transferType: TransferType.bank),
                        permanent: true);
                  }
                  Get.find<DataController>().getData(TransferController);
                  mainController
                    ..pages.clear()
                    ..appBars.clear()
                    ..index = 2
                    ..push(const DashBoardPage(), dashBoardAppbar())
                    ..push(
                        AppConfigs.sendMoney(
                          key: UniqueKey(),
                        ),
                        AppBars.bankTransfer)
                    ..update();
                }
              },
            ),
            bottomTile(
              ImagePath.cashTransfer,
              cms(Fields.Dashboard_CashTransferIconAndText).textHeading!,
              isSelected: mainController.index == 3,
              onTap: () async {
                late final SignUpController signupController;
                if (Get.isRegistered<SignUpController>()) {
                  signupController = Get.find<SignUpController>();
                } else {
                  signupController = Get.put(SignUpController());
                }
                if (Box3.idExpired) {
                  signupController.showIDExpiredAlert();
                } else if (Box3.fetchUAEPassDoc?.visualizationExpiry
                            ?.toLocal() !=
                        null &&
                    Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
                  AccountController a = Get.find<AccountController>();
                  if (a.contactUs == null) {
                    a.getContactUs();
                  }
                  if (!Get.isRegistered<KycController>()) {
                    Get.put(KycController());
                  }
                  var expDate =
                      Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal();
                  int expiryDays = (DateTime(expDate!.year, expDate.month,
                              expDate.day, expDate.hour, expDate.minute)
                          .toLocal())
                      .difference(DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              DateTime.now().hour,
                              DateTime.now().minute)
                          .toLocal())
                      .inMinutes;

                  Get.put(AccountController());

                  if (expiryDays <= 0) {
                    if (Get.currentRoute !=
                        AppRoutes.visualizationRetryRoutes) {
                      Get.to(const RetryVisualization(), arguments: {
                        "msg":
                            'There was an error while fetching your documents from UAE PASS. Please retry'
                                .tr,
                        "type": 'P',
                        "isFrom": 'Dash'
                      });
                    }
                  } else {
                    Get.dialog(updateProfileBody(
                        msg:
                            'Your request/application is under process. We will get back to you within 24 hours'
                                .tr,
                        type: 'P'));
                  }
                } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry ==
                        null) &&
                    Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
                  AccountController a = Get.find<AccountController>();
                  if (a.contactUs == null) {
                    a.getContactUs();
                  }
                  if (!Get.isRegistered<KycController>()) {
                    Get.put(KycController());
                  }

                  Get.put(AccountController());

                  if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
                    Get.to(const RetryVisualization(), arguments: {
                      "msg":
                          'There was an error while fetching your documents from UAE PASS. Please retry'
                              .tr,
                      "type": 'P',
                      "isFrom": 'Dash'
                    });
                  }
                } else {
                  if (Get.isRegistered<TransferController>()) {
                    Get.find<TransferController>().reset(t: TransferType.cash);
                  } else {
                    Get.put(TransferController(transferType: TransferType.cash),
                        permanent: true);
                  }
                  Get.find<DataController>().getData(TransferController);
                  mainController
                    ..pages.clear()
                    ..appBars.clear()
                    ..index = 3
                    ..push(const DashBoardPage(), dashBoardAppbar())
                    ..push(
                        AppConfigs.sendMoney(
                          key: UniqueKey(),
                        ),
                        AppBars.cashTransfer)
                    ..update();
                }
              },
            ),
          ],
        ),
      ],
    ),
  );
}
