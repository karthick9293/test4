import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:get/get.dart';

import '../../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../../core/exports/controllers.dart';
import '../../../../../core/flavours/constants.dart';
import 'package:mobiremit/core/models/formatter.dart';

Widget preLoginRateCardTheme1(
    {double top = 100,
    double height = 229,
    required BuildContext myContext,
    bool preLogin = true}) {
  if (Get.find<MainController>().fromAmtCtrl.text == "") {
    Get.find<DataController>().oneUnitRate();
  }

  return DraggableScrollableSheet(
    initialChildSize: 0.2, // 40% of screen
    minChildSize: 0.2,
    maxChildSize: 0.7,
    builder: (context, scrollController) {
      return GetBuilder<MainController>(
          id: 'Rate-Card',
          builder: (mainController) {
            return Container(
              decoration: BoxDecoration(
                  color: AppConfigs.bodybg(mainController.isDark),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withAlpha(80), blurRadius: 20)
                  ]),
              child: ListView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // VERY IMPORTANT
                children: [
                  Center(
                    child: SizedBox(
                      width: 60,
                      child: Divider(
                        height: 10,
                        thickness: 3,
                        color: AppConfigs.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Send with confidence",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          cms(Fields.MyTransaction_SendingAmount).textHeading!,
                          style: TS.f16.copyWith(
                              color: mainController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.g77),
                        ),
                      ),
                      textFormField(
                        cHeight: 60,
                        top: 0,
                        bottom: 0,
                        noPad: true,
                        controller: mainController.fromAmtCtrl,
                        focusNode: mainController.fromAmountNode,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        style: TextStyles.font20.copyWith(color: AppConfigs.b),
                        filledColor:
                            mainController.isDark ? null : AppConfigs.w,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0xFFE2EAFF),
                            blurRadius: 6,
                            spreadRadius: 2,
                          ),
                        ],
                        disableBorder: true,
                        borderRadius: 50,
                        maxLength: 10,
                        showCounter: false,
                        inputFormatters: [decimalFormatter()],
                        contentPadding: EdgeInsets.fromLTRB(
                            20, (60 - 24) / 2, 20, (60 - 24) / 2),
                        onChanged: (s) async {
                          if (s.isNotEmpty) {
                            if (mainController.debounce?.isActive ?? false) {
                              mainController.debounce?.cancel();
                            }
                            mainController.debounce = Timer(
                                const Duration(milliseconds: 1000), () async {
                              await mainController.updateToCurrency(
                                  s: s, type: 'L');
                            });
                          } else {
                            mainController.toAmtCtrl.clear();
                          }
                        },
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: 105,
                              margin: const EdgeInsets.all(0.1),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          currencyFlag(Box3
                                                  .companyDataFZ
                                                  ?.companySettings
                                                  ?.primaryBaseCurrency ??
                                              ''),
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
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
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            )

                            // Visibility(
                            //   visible: mainController.rateLoader,
                            //   child: Align(
                            //     alignment: Alignment.center,
                            //     child: tinyLoader(),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: Get.width,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Divider(
                              color: Colors.grey.withAlpha(90),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                  color: AppConfigs.w,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.grey.withAlpha(90))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(ImagePath.starZ),
                                  SizedBox(width: 10),
                                  Text("Transfer Fee"),
                                  SizedBox(width: 10),
                                  CurrencySymbolWithAmount(
                                    currencyWidth: 13,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    currencyCode: Box3
                                            .companyDataFZ
                                            ?.companySettings
                                            ?.primaryBaseCurrency ??
                                        '',
                                    amount: '0.23',
                                    color: mainController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.bf0,
                                    textStyle: TS.f20.copyWith(
                                      color: mainController.isDark
                                          ? AppConfigs.w
                                          : AppConfigs.bf0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          cms(Fields.MyTransaction_ReceiverGets).textHeading!,
                          style: TS.f16.copyWith(
                              color: mainController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.g77),
                        ),
                      ),
                      textFormField(
                        cHeight: 60,
                        top: 0,
                        bottom: 0,
                        noPad: true,
                        controller: mainController.toAmtCtrl,
                        focusNode: mainController.toAmountNode,
                        textAlign: TextAlign.right,
                        keyboardType: TextInputType.number,
                        style: TextStyles.font20.copyWith(color: AppConfigs.b),
                        filledColor:
                            mainController.isDark ? null : AppConfigs.w,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0xFFE2EAFF),
                            blurRadius: 6,
                            spreadRadius: 2,
                          ),
                        ],
                        disableBorder: true,
                        borderRadius: 50,
                        maxLength: 10,
                        showCounter: false,
                        inputFormatters: [decimalFormatter()],
                        contentPadding: EdgeInsets.fromLTRB(
                            20, (60 - 24) / 2, 20, (60 - 24) / 2),
                        onChanged: (s) async {
                          if (s.isNotEmpty) {
                            if (mainController.debounce?.isActive ?? false) {
                              mainController.debounce?.cancel();
                            }
                            mainController.debounce = Timer(
                                const Duration(milliseconds: 1000), () async {
                              await mainController.updateToCurrency(
                                  s: s, type: 'F');
                            });
                          } else {
                            mainController.fromAmtCtrl.clear();
                          }
                        },
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12),
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
                                    await Get.find<DataController>()
                                        .oneUnitRate(
                                            amount: mainController
                                                .fromAmtCtrl.text);
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
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        alignment: Alignment.center,
                        child: Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${cms(Fields.PreLogin_TodayExchangeRate).textHeading} ",
                                style: TS.f18.copyWith(
                                  color: AppConfigs.primaryColor,
                                ),
                              ),
                              Text.rich(
                                style: TS.f18.copyWith(
                                  color: AppConfigs.primaryColor,
                                ),
                                textAlign: TextAlign.start,
                                TextSpan(
                                  children: [
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                        child: CurrencySymbolWithAmount(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          currencyWidth: 13,
                                          currencyCode: Box3
                                                  .companyDataFZ
                                                  ?.companySettings
                                                  ?.primaryBaseCurrency ??
                                              mainController.fromCur ??
                                              'AED',
                                          amount: 1.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength),
                                          color: AppConfigs.primaryColor,
                                          textStyle: TS.f18.copyWith(
                                            color: AppConfigs.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: " = ",
                                    ),
                                    WidgetSpan(
                                      alignment: PlaceholderAlignment.middle,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 2.0),
                                        child: CurrencySymbolWithAmount(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          currencyCode:
                                              Get.find<AccountController>()
                                                  .toCur
                                                  ?.Code,
                                          amount:
                                              mainController.oneUnitValue.value,
                                          color: AppConfigs.primaryColor,
                                          textStyle: TS.f18.copyWith(
                                            color: AppConfigs.primaryColor,
                                          ),
                                        ),
                                      ),
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
                              ),
                            ],
                          );
                        }),
                      ),
                      SizedBox(height: 30),
                      roundButton(
                          cms(Fields.PreLogin_SendMoneyButton).textHeading!,
                          top: 8,
                          bottom: 0, onTap: () {
                        mainController.handleRateCardSendMoneyTap(
                            preLogin: preLogin,
                            height: height,
                            updateProfileBodyBuilder: updateProfileBody,
                            sendMoneyAppBar: AppBars.sendMoney);
                      }),
                    ],
                  )
                ],
              ),
            );
          });
    },
  );
}


