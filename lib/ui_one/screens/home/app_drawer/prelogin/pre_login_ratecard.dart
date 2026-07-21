import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../../core/flavours/constants.dart';
import 'package:mobiremit/core/models/formatter.dart';

Widget preLoginRateCard(
    {double top = 100, double height = 229, required BuildContext myContext}) {
  if (Get.find<MainController>().fromAmtCtrl.text == "") {
    Get.find<DataController>().oneUnitRate();
  }

  return GetBuilder<MainController>(
      id: 'Rate-Card',
      builder: (mainController) {
        return Card(
          elevation: 1.5,
          margin: EdgeInsets.fromLTRB(14, top, 14, 0),
          color: mainController.isDark ? AppConfigs.g14 : AppConfigs.w,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            cms(Fields.MyTransaction_SendingAmount)
                                .textHeading!,
                            style: TS.f14.copyWith(
                                color: mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.g77),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 5),
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
                            style: TextStyles.font20
                                .copyWith(color: AppConfigs.primaryColor),
                            controller: mainController.fromAmtCtrl,
                            maxLength: 10,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                prefixStyle: TS.f28
                                    .copyWith(color: AppConfigs.primaryColor),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: mainController.isDark
                                          ? AppConfigs.w.withOpacity(0.3)
                                          : const Color(0xFFDCDCDC)
                                              .withOpacity(0.32)),
                                ),
                                counterText: ''),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 12),
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
                      ],
                    ),
                  ),
                  Container(
                    color: AppConfigs.gdc.withOpacity(0.3),
                    margin: const EdgeInsets.only(top: 23, bottom: 15),
                    width: 1,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            cms(Fields.MyTransaction_ReceiverGets).textHeading!,
                            style: TS.f14.copyWith(
                                color: mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.g77),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: TextFormField(
                            focusNode: mainController.toAmountNode,
                            cursorColor: AppConfigs.primaryColor,
                            controller: mainController.toAmtCtrl,
                            style: TextStyles.font20
                                .copyWith(color: AppConfigs.primaryColor),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            inputFormatters: [decimalFormatter()],
                            textAlign: TextAlign.center,
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
                                    color: mainController.isDark
                                        ? AppConfigs.w.withOpacity(0.3)
                                        : const Color(0xFFDCDCDC)
                                            .withOpacity(0.32)),
                              ),
                              counterText: '',
                            ),
                          ),
                        ),
                        Get.find<AccountController>().toCur != null
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
                              )
                      ],
                    ),
                  ),
                ],
              ),
              roundButton(cms(Fields.PreLogin_SendMoneyButton).textHeading!,
                  top: 8, bottom: 0, onTap: () {
                mainController.handleRateCardSendMoneyTap(
                    preLogin: true,
                    height: height,
                    updateProfileBodyBuilder: updateProfileBody,
                    sendMoneyAppBar: AppBars.sendMoney);
              }),
              Container(
                margin: const EdgeInsets.only(top: 5),
                alignment: Alignment.center,
                child: Obx(() {
                  return Text.rich(
                    style: TS.f12.copyWith(
                        color: mainController.isDark
                            ? AppConfigs.g8f
                            : AppConfigs.g4,
                        fontStyle: FontStyle.italic),
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
                                amount: 1.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength),
                                color: mainController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.g4,
                                textStyle: TS.f12.copyWith(
                                    color: mainController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4,
                                    fontStyle: FontStyle.italic)),
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
                                    : AppConfigs.g4,
                                textStyle: TS.f12.copyWith(
                                    color: mainController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4,
                                    fontStyle: FontStyle.italic)),
                          ),
                        ),
                        TextSpan(
                          text: "*",
                        ),
                      ],
                    ),
                    // child: Text(
                    //   "${cms(Fields.PreLogin_TodayExchangeRate).textHeading} ${1.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ?? mainController.fromCur} = ${mainController.oneUnitValue.value} ${Get.find<AccountController>().toCur != null ? getCurrencySymbol(Get.find<AccountController>().toCur!.Code) : ''}*",
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
                            : AppConfigs.g4,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.start),
              ),
            ],
          ),
        );
      });
}


