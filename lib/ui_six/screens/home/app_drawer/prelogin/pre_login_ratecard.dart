import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../../core/exports/ui_six_pages.dart';
import '../../../../../core/flavours/constants.dart';
import '../../../../../core/models/formatter.dart';

Widget preLoginRateCard(
    {double top = 100, double height = 229, required BuildContext myContext,bool isPreLogin=true}) {
  if (Get.find<MainController>().fromAmtCtrl.text == "") {
    Get.find<DataController>().oneUnitRate();
  }

  return GetBuilder<MainController>(
      id: 'Rate-Card',
      builder: (mainController) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: mainController.isDark ? AppConfigs.g14 : AppConfigs.w,
            borderRadius: isPreLogin?BorderRadius.vertical(top: Radius.circular(20)):BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              if(isPreLogin)...[Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "QUICK TRANSFER ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppConfigs.primaryColor),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: AppConfigs.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,)],
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      // height: 160,
                      padding: isPreLogin?const EdgeInsets.all(12):null,
                      decoration: isPreLogin?BoxDecoration(
                        color: const Color(0xffF3EFE8),
                        border: Border.all(color: AppConfigs.primaryColor,width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ):null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cms(Fields.MyTransaction_SendingAmount)
                                .textHeading!.toUpperCase(),
                            style: TS.f12.copyWith(
                                color: mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.primaryColor,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, bottom: 5),
                            child: TextFormField(
                              cursorColor: AppConfigs.primaryColor,
                              onChanged: (s) async {
                                if (s.isNotEmpty) {
                                  if (mainController.debounce?.isActive ??
                                      false) {
                                    mainController.debounce?.cancel();
                                  }
                                  mainController.debounce =
                                      Timer(const Duration(milliseconds: 1000),
                                          () async {
                                    await mainController.updateToCurrency(
                                        s: s, type: 'L');
                                  });
                                } else {
                                  mainController.toAmtCtrl.clear();
                                }
                              },
                              focusNode: mainController.fromAmountNode,
                              inputFormatters: [decimalFormatter()],
                              textInputAction: TextInputAction.done,
                              keyboardType: const TextInputType.numberWithOptions(
                                  decimal: true, signed: false),
                              style: TS.f28B
                                  .copyWith(color: AppConfigs.b,fontWeight: FontWeight.bold),
                              controller: mainController.fromAmtCtrl,
                              maxLength: 10,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                  prefixStyle: TS.f28B
                                      .copyWith(color: AppConfigs.primaryColor),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  counterText: ''),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppConfigs.primaryColor,width: 0.5),
                              color: AppConfigs.w,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  currencyFlag(Box3.companyDataFZ?.companySettings
                                          ?.primaryBaseCurrency ??
                                      ''),
                                  height: 20,
                                  width: 20,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                    Box3.companyDataFZ?.companySettings
                                            ?.primaryBaseCurrency ??
                                        '',
                                    style: TS.f16.copyWith(
                                        color: mainController.isDark
                                            ? AppConfigs.w
                                            : AppConfigs.bf0,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.start),
                                // Text(APIConstants.currency,
                                //     style: TS.f16.copyWith(
                                //         color: mainController.isDark
                                //             ? AppConfigs.w
                                //             : AppConfigs.bf0,
                                //         fontWeight: FontWeight.w600),
                                //     textAlign: TextAlign.start),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppConfigs.accentColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppConfigs.accentColor.withOpacity(0.3),
                          offset: Offset(2, 3),
                          blurRadius: 10
                        )
                      ]
                    ),
                    child: Icon(Icons.swap_vert,
                        color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: isPreLogin?const EdgeInsets.all(12):null,
                      decoration: isPreLogin?BoxDecoration(
                        color: const Color(0xffF3EFE8),
                        border: Border.all(color: AppConfigs.primaryColor,width: 1),
                        borderRadius: BorderRadius.circular(16),
                      ):null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            cms(Fields.MyTransaction_ReceiverGets).textHeading!.toUpperCase(),
                            style: TS.f12.copyWith(
                                color: mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.primaryColor),
                          ),
                          TextFormField(
                            focusNode: mainController.toAmountNode,
                            cursorColor: AppConfigs.primaryColor,
                            controller: mainController.toAmtCtrl,
                            style: TS.f28B
                                .copyWith(color: AppConfigs.primaryColor),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            inputFormatters: [decimalFormatter()],
                            textAlign: TextAlign.end,
                            onChanged: (s) async {
                              if (s.isNotEmpty) {
                                if (mainController.debounce?.isActive ??
                                    false) {
                                  mainController.debounce?.cancel();
                                }
                                mainController.debounce =
                                    Timer(const Duration(milliseconds: 1000),
                                        () async {
                                  await mainController.updateToCurrency(
                                      s: s, type: 'F');
                                });
                              } else {
                                mainController.fromAmtCtrl.clear();
                              }
                            },
                            maxLength: 10,
                            decoration: InputDecoration(
                              prefixIcon: Obx(
                                () => Visibility(
                                  visible: mainController.rateLoading.isTrue,
                                  child: tinyLoader(size: 14),
                                ),
                              ),
                              prefixIconConstraints:
                                  BoxConstraints(maxHeight: 15, maxWidth: 15),
                              prefixStyle: TS.f28
                                  .copyWith(color: AppConfigs.primaryColor),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent),
                              ),
                              counterText: '',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppConfigs.primaryColor,width: 0.5),
                                color: AppConfigs.w,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Get.find<AccountController>().toCur != null
                                ? CurrencyDropdownDashboard(
                                    value: Get.find<AccountController>().toCur,
                                    crItems: Get.find<AccountController>()
                                        .dashboardCurrencies,
                                    onChanged: (v) async {
                                      // mainController..toCur = v..update();
                                      Get.find<AccountController>()
                                        ..toCur = v
                                        ..update(['Rate-Card']);
                                      mainController.update(['Rate-Card']);
                                      await Get.find<DataController>().oneUnitRate(
                                          amount: mainController.fromAmtCtrl.text);
                                      // if (mainController
                                      //     .fromAmtCtrl.text.isNotEmpty) {
                                      //   await mainController.updateToCurrency(
                                      //     s: mainController.fromAmtCtrl.text,
                                      //     type: 'L',
                                      //   );
                                      // } else {
                                      //   mainController.toAmtCtrl.clear();
                                      // }
                                    },
                                  )
                                : Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    child: tinyLoader(size: 14),
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              if(!isPreLogin)Divider(color: AppConfigs.primaryColor.withAlpha(50),),
              Container(
                margin: const EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                child: Obx(() {
                  return Text.rich(
                    style: TS.f12.copyWith(
                        color: mainController.isDark
                            ? AppConfigs.g8f
                            : AppConfigs.g4,),
                    textAlign: TextAlign.start,
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "${cms(Fields.PreLogin_TodayExchangeRate).textHeading} ",
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: CurrencySymbolWithAmount(
                                mainAxisAlignment: MainAxisAlignment.start,
                                currencyCode: Box3
                                        .companyDataFZ
                                        ?.companySettings
                                        ?.primaryBaseCurrency ??
                                    mainController.fromCur ??
                                    'AED',
                                amount: 1.toStringWithOptionalFixed(
                                    Box3.settings.currencyDecimalLength),
                                color: mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.accentColor,
                                textStyle: TS.f14.copyWith(
                                    color: mainController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.accentColor,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        TextSpan(
                          text: " = ",
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: CurrencySymbolWithAmount(
                                mainAxisAlignment: MainAxisAlignment.start,
                                currencyCode:
                                    Get.find<AccountController>().toCur != null
                                        ? Get.find<AccountController>()
                                            .toCur!
                                            .Code
                                        : "",
                                amount: mainController.oneUnitValue.value,
                                color: mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.accentColor,
                                textStyle: TS.f14.copyWith(
                                    color: mainController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.accentColor,fontWeight: FontWeight.bold)),
                          ),
                        ),
                        TextSpan(
                          text: "*",
                        ),
                      ],
                    ),
                    // child: Text(
                    //   "${cms(Fields.PreLogin_TodayExchangeRate).textHeading} ${1.toStringAsFixed(Box3.settings.currencyDecimalLength)} ${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ?? mainController.fromCur} = ${mainController.oneUnitValue.value} ${Get.find<AccountController>().toCur != null ? getCurrencySymbol(Get.find<AccountController>().toCur!.Code) : ''}*",
                    //   style: TS.f12.copyWith(
                    //       color: mainController.isDark
                    //           ? AppConfigs.g8f
                    //           : AppConfigs.g4,
                    //       fontStyle: FontStyle.italic),
                    //   textAlign: TextAlign.start,
                    // ),
                  );
                }),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                margin: const EdgeInsets.only(bottom: 5),
                alignment: Alignment.center,
                child: Text(cms(Fields.PreLogin_TodayExchangeRate).description!,
                    style: TS.f12.copyWith(
                        color: mainController.isDark
                            ? AppConfigs.g8f
                            : AppConfigs.g4),
                    textAlign: TextAlign.start),
              ),
              roundButton(cms(Fields.PreLogin_SendMoneyButton).textHeading!,
                  child: buttonTitleWithIcons(cms(Fields.PreLogin_SendMoneyButton).textHeading!),
                  top: 8, bottom: 0, left: 0,right: 0, radius:18,height:50,onTap: () {
                    if (height == 238) {
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
                            .inHours;

                        Get.put(AccountController());

                        if (expiryDays <= 0) {
                          if (Get.currentRoute !=
                              AppRoutes.visualizationRetryRoutes) {
                            Get.to(RetryVisualization(), arguments: {
                              "msg":
                              'There was an error while fetching your documents from UAE PASS. Please retry'
                                  .tr,
                              "type": 'P',
                              "isFrom": 'Dash'
                            });
                          }
                        } else {
                          if (Get.isDialogOpen != true) {
                            Get.dialog(updateProfileBody(
                                msg:
                                'Your request/application is under process. We will get back to you within 24 hours'
                                    .tr,
                                type: 'P'));
                          }
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
                        Get.put(MainController());

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
                        if (Get.isRegistered<TransferController>()) {
                          Get.find<TransferController>().reset(t: TransferType.all);
                        } else {
                          Get.put(
                              TransferController(transferType: TransferType.all),
                              permanent: true);
                        }

                        Get.find<TransferController>()
                        // ..fromAmountCtrl.text = mainController.fromAmtCtrl.text
                        // ..toAmountCtrl.text = mainController.toAmtCtrl.text
                          ..fromAmtCur = mainController.fromCur!
                          ..toAmtCur = Get.find<AccountController>().toCur?.Code
                          ..update();
                        Get.find<MainController>().push(
                            AppConfigs.sendMoney(
                              key: UniqueKey(),
                            ),
                            AppBars.sendMoney);
                      }
                    } else {
                      Get.find<AccountController>().preLoginAlert();
                    }
                    mainController.update();
                  }),
            ],
          ),
        );
      });
}
