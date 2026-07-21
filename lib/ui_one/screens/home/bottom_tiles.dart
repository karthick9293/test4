import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_one_custom_widgets.dart';
import '../../../core/exports/ui_one_pages.dart';
import '../../../core/flavours/constants.dart';

Widget bottomTile(String image, String text,
    {void Function()? onTap,
    double? iconHeight,
    double? iconWidth,
    bool? isSelected = true}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(image,
            colorFilter: ColorFilter.mode(
                isSelected == true ? Colors.white : Colors.white54,
                BlendMode.srcIn),
            height: iconHeight ?? 27),
        const SizedBox(height: 5),
        Text(
          text,
          style: TS.f12.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected == true ? Colors.white : Colors.white54),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}

Widget bottomBar(bool isDark) {
  return Container(
    height: 95,
    padding: const EdgeInsets.only(top: 14, bottom: 14),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                    color: isDark ? Color(0xffdedede) : Colors.grey,
                    offset: Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 0)
              ],
        color: isDark ? AppConfigs.g21 : AppConfigs.accentColor),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bottomTile(ImagePath.homeBottom,
            cms(Fields.Dashboard_HomeIconAndText).textHeading!,
            isSelected: Get.find<MainController>().index == 0, onTap: () {
          Get.find<MainController>()
            ..pages.clear()
            ..appBars.clear()
            ..index = 0
            ..push(const DashBoardPage(), dashBoardAppbar())
            ..update();
        }),
        bottomTile(
            ImagePath.myTransactionBottom,
            cms(Fields.Dashboard_RateCalculatorIconAndText)
                .textHeading!
                .split(' ')
                .join('\n'),
            isSelected: Get.find<MainController>().index == 1, onTap: () {
          Get.find<AccountController>()
            // ..fromAmtCtrl.clear()
            // ..toAmtCtrl.clear()
            ..fromAmtCtrl.text = "1"
            ..updateToCurency(s: '1', type: 'L')
            // ..toAmtCtrl.clear()
            ..currencyRatesType = 'rates'
            ..update();
          Get.find<MainController>()
            ..pages.clear()
            ..appBars.clear()
            ..index = 1
            ..push(const DashBoardPage(), dashBoardAppbar())
            ..push(const CurrencyRatesPage(), AppBars.currencyRates)
            ..update();
        }),
        bottomTile(
            ImagePath.bankTransfer,
            cms(Fields.Dashboard_BankTransferIconAndText)
                .textHeading!
                .split(' ')
                .join('\n'),
            isSelected: Get.find<MainController>().index == 2, onTap: () async {
          late final SignUpController signupController;
          if (Get.isRegistered<SignUpController>()) {
            signupController = Get.find<SignUpController>();
          } else {
            signupController = Get.put(SignUpController());
          }
          if (Box3.idExpired) {
            signupController.showIDExpiredAlert();
          } else if (Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal() !=
                  null &&
              Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
            AccountController a = Get.find<AccountController>();
            if (a.contactUs == null) {
              a.getContactUs();
            }
            if (!Get.isRegistered<KycController>()) {
              Get.put(KycController());
            }
            var expDate = Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal();
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
              Get.dialog(updateProfileBody(
                  msg:
                      'Your request/application is under process. We will get back to you within 24 hours'
                          .tr,
                  type: 'P'));
            }
          } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry == null) &&
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
            Get.find<MainController>()
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
        }),
        bottomTile(
            ImagePath.cashTransfer,
            cms(Fields.Dashboard_CashTransferIconAndText)
                .textHeading!
                .split(' ')
                .join('\n'),
            isSelected: Get.find<MainController>().index == 3, onTap: () async {
          late final SignUpController signupController;
          if (Get.isRegistered<SignUpController>()) {
            signupController = Get.find<SignUpController>();
          } else {
            signupController = Get.put(SignUpController());
          }
          if (Box3.idExpired) {
            signupController.showIDExpiredAlert();
          } else if (Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal() !=
                  null &&
              Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
            AccountController a = Get.find<AccountController>();
            if (a.contactUs == null) {
              a.getContactUs();
            }
            if (!Get.isRegistered<KycController>()) {
              Get.put(KycController());
            }
            var expDate = Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal();
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
              if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
                Get.to(const RetryVisualization(), arguments: {
                  "msg":
                      'There was an error while fetching your documents from UAE PASS. Please retry'
                          .tr,
                  "type": 'P',
                  "isFrom": 'Dash'
                });
              }
              // Get.dialog(retryAlert(msg: 'There was an error while fetching your documents from UAE PASS. Please retry'.tr, type: 'P', isFrom: 'Dash'));
            } else {
              Get.dialog(updateProfileBody(
                  msg:
                      'Your request/application is under process. We will get back to you within 24 hours'
                          .tr,
                  type: 'P'));
            }
          } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry == null) &&
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
            Get.find<MainController>()
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
        })
      ],
    ),
  );
}
