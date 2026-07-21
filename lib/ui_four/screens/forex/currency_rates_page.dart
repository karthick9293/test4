import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_four_custom_widgets.dart';
import '../../../core/flavours/constants.dart';

class CurrencyRatesPage extends GetView<AccountController> {
  final bool isPreLogin;

  const CurrencyRatesPage({super.key, this.isPreLogin = false});

  //method for getting header Text
  Widget _getHeaderText(String header) {
    return Text(
      header,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    int forexDecLen = int.parse(Box3.settings.forexDecimalLength);
    Get.find<AccountController>().getRates();
    return GetBuilder<AccountController>(
        id: 'all-rates',
        builder: (accountController) {
          return Material(
            color: accountController.isDark ? AppConfigs.b : AppConfigs.w,
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  Visibility(
                    visible: isPreLogin,
                    child: appBar0(
                        cms(Fields.ForexRates_CurrencyRate).textHeading!,
                        onTap2: Get.back),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppConfigs.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => accountController
                                ..currencyRatesType = 'rates'
                                ..update(['all-rates']),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:
                                        accountController.currencyRatesType ==
                                                'rates'
                                            ? AppConfigs.primaryColor
                                            : AppConfigs.bodybg(
                                                accountController.isDark),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  cms(Fields.CurrencyRates_Rates).textHeading!,
                                  style: TS.f14.copyWith(
                                      color:
                                          accountController.currencyRatesType ==
                                                  'rates'
                                              ? AppConfigs.w
                                              : AppConfigs.primaryColor),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                accountController
                                  ..currencyRatesType = 'converter'
                                  ..update(['all-rates'])
                                  ..update(['Unit-rate']);
                                accountController.updateToCurrencyCalc(
                                    s: accountController.fromAmtCtrl.text,
                                    type: 'L',
                                    currency:
                                        accountController.calculatorToCur !=
                                                null
                                            ? accountController
                                                .calculatorToCur!.Code
                                            : accountController.toCur!.Code);
                                accountController.updateOneUnit(
                                    accountController.calculatorToCur);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:
                                        accountController.currencyRatesType ==
                                                'converter'
                                            ? AppConfigs.primaryColor
                                            : AppConfigs.bodybg(
                                                accountController.isDark),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  cms(Fields.CurrencyRates_Converter)
                                      .textHeading!,
                                  style: TS.f14.copyWith(
                                      color:
                                          accountController.currencyRatesType ==
                                                  'converter'
                                              ? AppConfigs.w
                                              : AppConfigs.primaryColor),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  accountController.rates == null
                      ? Expanded(child: Center(child: loader()))
                      : accountController.currencyRatesType == 'rates'
                          ? Expanded(
                              child: Column(
                                children: [
                                  textFormField(
                                      labelText:
                                          cms(Fields.CurrencyRates_Search)
                                              .textHeading,
                                      controller: controller,
                                      onChanged: (v) => accountController
                                          .update(['all-rates']),
                                      bottom: 10,
                                      top: 20,
                                      borderRadius: 50,
                                      trailing: Container(
                                        width: 40,
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                          ImagePath.search,
                                          height: 20,
                                          width: 20,
                                          colorFilter: ColorFilter.mode(
                                              accountController.isDark
                                                  ? AppConfigs.w
                                                  : AppConfigs.g4,
                                              BlendMode.srcIn),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: (AppConfigs.primaryColor),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(00),
                                        ),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(15, 20, 15, 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            flex: 267,
                                            fit: FlexFit.tight,
                                            child: _getHeaderText("Currency"),
                                          ),
                                          Flexible(
                                            flex: 300,
                                            fit: FlexFit.tight,
                                            child:
                                                _getHeaderText("Transfer Rate"),
                                          ),
                                          Flexible(
                                            flex: 200,
                                            fit: FlexFit.tight,
                                            child: _getHeaderText("Cash Buy"),
                                          ),
                                          Flexible(
                                            flex: 233,
                                            fit: FlexFit.tight,
                                            child: _getHeaderText("Cash Sell"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      physics: const ClampingScrollPhysics(),
                                      itemCount:
                                          accountController.rates!.length,
                                      itemBuilder: (c, i) {
                                        return Visibility(
                                          visible: (controller.text.isNotEmpty
                                              ? accountController
                                                      .rates![i].currencyCode
                                                      .toLowerCase()
                                                      .contains(controller.text
                                                          .toLowerCase()) ||
                                                  accountController
                                                      .rates![i].currency
                                                      .toLowerCase()
                                                      .contains(controller.text
                                                          .toLowerCase())
                                              : true),
                                          child: Container(
                                            // margin: const EdgeInsets.only(),
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 10, right: 10),
                                            height: 53,
                                            decoration: BoxDecoration(
                                              color: i % 2 == 0
                                                  ? AppConfigs.g70
                                                      .withOpacity(0.1)
                                                  : AppConfigs.g70
                                                      .withOpacity(0.0),
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: AppConfigs.g70
                                                          .withOpacity(0))),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  flex: 267,
                                                  fit: FlexFit.tight,
                                                  child: Center(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 0),
                                                          child: Base64Image(
                                                            image: accountController
                                                                    .rates![i]
                                                                    .currencyFlagPath ??
                                                                "",
                                                            width: 30,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // if (accountController
                                                              //             .rates![i]
                                                              //             .currency !=
                                                              //         null &&
                                                              //     accountController
                                                              //             .rates![i]
                                                              //             .currency !=
                                                              //         "") ...[
                                                              //   Text(
                                                              //     accountController
                                                              //             .rates![i]
                                                              //             .currency ??
                                                              //         "",
                                                              //     style:
                                                              //         TS.f14.copyWith(
                                                              //       color:
                                                              //           accountController
                                                              //                   .isDark
                                                              //               ? AppConfigs
                                                              //                   .w
                                                              //               : AppConfigs
                                                              //                   .g4,
                                                              //       fontWeight:
                                                              //           FontWeight.w600,
                                                              //     ),
                                                              //     textAlign:
                                                              //         TextAlign.start,
                                                              //     maxLines: 1,
                                                              //     overflow: TextOverflow
                                                              //         .ellipsis,
                                                              //   ),
                                                              // ],
                                                              Text(
                                                                '${accountController.rates![i].currencyCode} ',
                                                                //|${'Transfer_Fee_'.tr}
                                                                style: TS.f14
                                                                    .copyWith(
                                                                  color: accountController
                                                                          .isDark
                                                                      ? AppConfigs
                                                                          .w
                                                                      : AppConfigs
                                                                          .g4,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 300,
                                                  fit: FlexFit.tight,
                                                  child: Center(
                                                    child: Text(
                                                      '${accountController.rates![i].transferRateSell.toStringAsFixed(forexDecLen)} ',
                                                      style: TS.f14.copyWith(
                                                        color: accountController
                                                                .isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs.g4,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 200,
                                                  fit: FlexFit.tight,
                                                  child: Center(
                                                    child: Text(
                                                      '${accountController.rates![i].cashRateBuy.toStringAsFixed(forexDecLen)} ',
                                                      style: TS.f14.copyWith(
                                                        color: accountController
                                                                .isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs.g4,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                    flex: 233,
                                                    fit: FlexFit.tight,
                                                    child: Center(
                                                      child: Text(
                                                          accountController
                                                              .rates![i]
                                                              .cashRateSell
                                                              .toStringAsFixed(
                                                                  forexDecLen),
                                                          style:
                                                              TS.f14.copyWith(
                                                            color:
                                                                accountController
                                                                        .isDark
                                                                    ? AppConfigs
                                                                        .w
                                                                    : AppConfigs
                                                                        .g4,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          )),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              child: GetBuilder<AccountController>(
                                  id: "Unit-rate",
                                  builder: (context) {
                                    return Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              20, 20, 20, 10),
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 13, 13, 13),
                                          height: 168,
                                          decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Color(0x29000000),
                                                    offset: Offset(0, 0),
                                                    blurRadius: 6,
                                                    spreadRadius: 0)
                                              ],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              color: AppConfigs.primaryColor),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 13),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      cms(Fields
                                                              .CurrencyRates_FromCurrency)
                                                          .textHeading!,
                                                      style: TS.f12.copyWith(
                                                          color: AppConfigs
                                                              .w //const Color(0xFFAcA6A6),
                                                          ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 90,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(1),
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.asset(
                                                                currencyFlag(Box3
                                                                        .companyDataFZ
                                                                        ?.companySettings
                                                                        ?.primaryBaseCurrency ??
                                                                    APIConstants
                                                                        .currency),
                                                                height: 20,
                                                                width: 20,
                                                              ),
                                                              const SizedBox(
                                                                  width: 10),
                                                              Text(
                                                                  Box3
                                                                          .companyDataFZ
                                                                          ?.companySettings
                                                                          ?.primaryBaseCurrency ??
                                                                      APIConstants
                                                                          .currency,
                                                                  style: TS.f16.copyWith(
                                                                      color:
                                                                          AppConfigs
                                                                              .w,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start),
                                                            ],
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        GetBuilder<
                                                                AccountController>(
                                                            id: 'calc_rate',
                                                            builder: (context) {
                                                              return Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF4F4F4),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            5),
                                                                  ),
                                                                ),
                                                                width: 150,
                                                                child:
                                                                    textFormField(
                                                                        noPad:
                                                                            true,
                                                                        keyboardType: TextInputType
                                                                            .number,
                                                                        inputFormatters: [
                                                                          decimalFormatter()
                                                                        ],
                                                                        contentPadding: const EdgeInsets
                                                                            .fromLTRB(
                                                                            15,
                                                                            0,
                                                                            15,
                                                                            5),
                                                                        disableBorder:
                                                                            true,
                                                                        controller:
                                                                            accountController
                                                                                .fromAmtCtrl,
                                                                        onChanged:
                                                                            (s) async {
                                                                          if (s.isNotEmpty ||
                                                                              (double.tryParse(s) ?? 0) > 0) {
                                                                            await accountController.updateToCurrencyCalc(
                                                                                s: s,
                                                                                type: 'L');
                                                                          } else {
                                                                            accountController.toAmtCtrl.clear();
                                                                          }
                                                                        }),
                                                              );
                                                            })
                                                      ],
                                                    ),
                                                    Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 18),
                                                        height: 1,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            color: AppConfigs
                                                                .gd7
                                                                .withOpacity(
                                                                    0.33))),
                                                    Text(
                                                      cms(Fields
                                                              .CurrencyRates_ToCurrency)
                                                          .textHeading!,
                                                      style: TS.f12.copyWith(
                                                        color: AppConfigs
                                                            .w, // const Color(0xFFAcA6A6),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  GetBuilder<AccountController>(
                                                      id: 'Unit-rate-Curr',
                                                      builder: (ac) {
                                                        return CurrencyDropdownDashboard(
                                                          buttonWidth: 100,
                                                          value: accountController
                                                                  .calculatorToCur ??
                                                              accountController
                                                                  .toCur,
                                                          crItems: Get.find<
                                                                  AccountController>()
                                                              .dashboardCurrencies,
                                                          flagSize: 20,
                                                          btnPadding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          offset: const Offset(
                                                              13, 0),
                                                          textColor:
                                                              AppConfigs.w,
                                                          onChanged: (v) async {
                                                            accountController
                                                              ..calculatorToCur =
                                                                  v
                                                              ..update([
                                                                "Unit-rate-Curr"
                                                              ]);
                                                            if (accountController
                                                                .fromAmtCtrl
                                                                .text
                                                                .isNotEmpty) {
                                                              await accountController
                                                                  .updateToCurrencyCalc(
                                                                      s: accountController
                                                                          .fromAmtCtrl
                                                                          .text,
                                                                      type: 'L',
                                                                      currency:
                                                                          v!.Code);
                                                            } else if (accountController
                                                                .toAmtCtrl
                                                                .text
                                                                .isNotEmpty) {
                                                              await accountController
                                                                  .updateToCurrencyCalc(
                                                                      s: accountController
                                                                          .toAmtCtrl
                                                                          .text,
                                                                      type: 'F',
                                                                      currency:
                                                                          v!.Code);
                                                            }
                                                            await accountController
                                                                .updateOneUnit(
                                                                    v);
                                                          },
                                                        );
                                                      }),
                                                  const Spacer(),
                                                  GetBuilder<AccountController>(
                                                      id: 'calc_rate',
                                                      builder: (context) {
                                                        return Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFFF4F4F4),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  5),
                                                            ),
                                                          ),
                                                          width: 150,
                                                          child: textFormField(
                                                              noPad: true,
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              inputFormatters: [
                                                                decimalFormatter()
                                                              ],
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      15, 0, 15, 5),
                                                              disableBorder:
                                                                  true,
                                                              controller:
                                                                  accountController
                                                                      .toAmtCtrl,
                                                              onChanged:
                                                                  (s) async {
                                                                if (s.isNotEmpty ||
                                                                    (double.tryParse(s) ??
                                                                            0) >
                                                                        0) {
                                                                  await accountController
                                                                      .updateToCurrencyCalc(
                                                                          s: s,
                                                                          type:
                                                                              'F');
                                                                } else {
                                                                  accountController
                                                                      .fromAmtCtrl
                                                                      .clear();
                                                                }
                                                              }),
                                                        );
                                                      })
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        GetBuilder<AccountController>(
                                            id: 'calc_rate',
                                            builder: (context) {
                                              return Text.rich(
                                                style: TS.f12.copyWith(
                                                  color: accountController
                                                          .isDark
                                                      ? AppConfigs.geb
                                                      : const Color(0xff181717),
                                                ),
                                                textAlign: TextAlign.start,
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "${cms(Fields.PreLogin_TodayExchangeRate).textHeading} ",
                                                    ),
                                                    WidgetSpan(
                                                      alignment:
                                                          PlaceholderAlignment
                                                              .middle,
                                                      child:
                                                          CurrencySymbolWithAmount(
                                                        currencyCode: Box3
                                                                .companyDataFZ
                                                                ?.companySettings
                                                                ?.primaryBaseCurrency ??
                                                            '',
                                                        amount: '1',
                                                        color: accountController
                                                                .isDark
                                                            ? AppConfigs.geb
                                                            : const Color(
                                                                0xff181717),
                                                        textStyle:
                                                            TS.f12.copyWith(
                                                          color: accountController
                                                                  .isDark
                                                              ? AppConfigs.geb
                                                              : const Color(
                                                                  0xff181717),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: " = ",
                                                    ),
                                                    WidgetSpan(
                                                      alignment:
                                                          PlaceholderAlignment
                                                              .middle,
                                                      child:
                                                          CurrencySymbolWithAmount(
                                                        currencyCode: accountController
                                                                    .calculatorToCur !=
                                                                null
                                                            ? accountController
                                                                .calculatorToCur!
                                                                .Code
                                                            : accountController
                                                                .toCur!.Code,
                                                        amount:
                                                            accountController
                                                                .oneUnitRate,
                                                        color: accountController
                                                                .isDark
                                                            ? AppConfigs.geb
                                                            : const Color(
                                                                0xff181717),
                                                        textStyle:
                                                            TS.f12.copyWith(
                                                          color: accountController
                                                                  .isDark
                                                              ? AppConfigs.geb
                                                              : const Color(
                                                                  0xff181717),
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                        // Text(
                                        //   "${cms(Fields.PreLogin_TodayExchangeRate).textHeading!} 1 ${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ?? APIConstants.currency} = ${accountController.oneUnitRate} ${accountController.toCur?.Code}",
                                        //   style: TS.f10.copyWith(
                                        //     color: accountController.isDark
                                        //         ? AppConfigs.geb
                                        //         : const Color(0xff181717),
                                        //   ),
                                        //   textAlign: TextAlign.start,
                                        // )
                                      ],
                                    );
                                  }),
                            ),
                  SizedBox(height: 10),
                  if (isPreLogin != true)
                    Visibility(
                      visible: true,
                      child: BottomButtons.createAlert,
                    )
                ],
              ),
            ),
          );
        });
  }
}
