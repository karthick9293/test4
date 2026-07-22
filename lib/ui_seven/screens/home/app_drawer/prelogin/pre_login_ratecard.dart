import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../../core/exports/ui_seven_pages.dart';
import '../../../../../core/flavours/constants.dart';
import '../../../../../core/models/formatter.dart';

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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12)),
          margin: EdgeInsets.fromLTRB(14, top, 14, 0),
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppConfigs.primaryColor,
                  AppConfigs.accentColor.withAlpha(255),
                ],
                stops: [0.25, 0.99],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.mirror,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 48),
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(ImagePath.alzamanExchLogoOnly,width: 70,),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  cms(Fields.MyTransaction_SendingAmount)
                                      .textHeading!,
                                  style: TS.f14.copyWith(color: AppConfigs.w),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, bottom: 5),
                                child: TextFormField(
                                  cursorColor: AppConfigs.w,
                                  onChanged: (s) async {
                                    if (s.isNotEmpty) {
                                      if (mainController.debounce?.isActive ??
                                          false) {
                                        mainController.debounce?.cancel();
                                      }
                                      mainController.debounce = Timer(
                                          const Duration(milliseconds: 1000),
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
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true, signed: false),
                                  style: TextStyles.font20
                                      .copyWith(color: AppConfigs.w),
                                  controller: mainController.fromAmtCtrl,
                                  maxLength: 10,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      prefixStyle:
                                          TS.f28.copyWith(color: AppConfigs.w),
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
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 12),
                                  Image.asset(
                                    currencyFlag(Box3
                                            .companyDataFZ
                                            ?.companySettings
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
                                        color: AppConfigs.w,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.start,
                                  ),
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
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  cms(Fields.MyTransaction_ReceiverGets)
                                      .textHeading!,
                                  style: TS.f14.copyWith(color: AppConfigs.w),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: TextFormField(
                                  focusNode: mainController.toAmountNode,
                                  cursorColor: AppConfigs.w,
                                  controller: mainController.toAmtCtrl,
                                  style: TextStyles.font20
                                      .copyWith(color: AppConfigs.w),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true, signed: false),
                                  inputFormatters: [decimalFormatter()],
                                  textAlign: TextAlign.center,
                                  onChanged: (s) async {
                                    if (s.isNotEmpty) {
                                      if (mainController.debounce?.isActive ??
                                          false) {
                                        mainController.debounce?.cancel();
                                      }
                                      mainController.debounce = Timer(
                                          const Duration(milliseconds: 1000),
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
                                        visible:
                                            mainController.rateLoading.isTrue,
                                        child: tinyLoader(
                                            size: 14, color: AppConfigs.w),
                                      ),
                                    ),
                                    prefixIconConstraints: BoxConstraints(
                                        maxHeight: 15, maxWidth: 15),
                                    prefixStyle:
                                        TS.f28.copyWith(color: AppConfigs.w),
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
                              SizedBox(height: 10),
                              Get.find<AccountController>().toCur != null
                                  ? CurrencyDropdownDashboard(
                                      value:
                                          Get.find<AccountController>().toCur,
                                      crItems: Get.find<AccountController>()
                                          .dashboardCurrencies,
                                      textColor: AppConfigs.w,
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
                                      child: tinyLoader(
                                          size: 14, color: AppConfigs.w),
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                roundButton(
                  cms(Fields.PreLogin_SendMoneyButton).textHeading!,
                  height: 50,
                  top: 8,
                  bottom: 0,
                  fillColor:
                      mainController.isDark ? AppConfigs.g21 : AppConfigs.w,
                  textColor: mainController.isDark
                      ? AppConfigs.w
                      : AppConfigs.primaryColor,
                  fontSize: 18,
                  onTap: () {
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
                        var expDate = Box3.fetchUAEPassDoc?.visualizationExpiry
                            ?.toLocal();
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
                          Get.find<TransferController>()
                              .reset(t: TransferType.all);
                        } else {
                          Get.put(
                              TransferController(
                                  transferType: TransferType.all),
                              permanent: true);
                        }

                        Get.find<TransferController>()
                          ..fromAmountCtrl.text =
                              mainController.fromAmtCtrl.text
                          ..toAmountCtrl.text = mainController.toAmtCtrl.text
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
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Obx(() {
                    return Text.rich(
                      style: TS.f12.copyWith(
                          color: AppConfigs.gd7, fontStyle: FontStyle.italic),
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
                                  color: AppConfigs.gd7,
                                  textStyle: TS.f12.copyWith(
                                      color: AppConfigs.gd7,
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
                                color: AppConfigs.gd7,
                                textStyle: TS.f12.copyWith(
                                    color: AppConfigs.gd7,
                                    fontStyle: FontStyle.italic),
                              ),
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
                  child: Text(
                      cms(Fields.PreLogin_TodayExchangeRate).description!,
                      style: TS.f12.copyWith(
                          color: AppConfigs.gd7, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.start),
                ),
              ],
            ),
          ),
        );
      });
}
