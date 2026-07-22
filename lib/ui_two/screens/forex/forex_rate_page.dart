import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../models/all_rates/all_rates_fz.dart';

class ForexRatesPage extends StatelessWidget {
  final bool isPrelogin;

  const ForexRatesPage({super.key, this.isPrelogin = false});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    int forexDecLen = int.parse(Box3.settings.forexDecimalLength);
    Get.find<AccountController>().getRates();
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) =>
          Get.find<AccountController>().getFilterRate(controller.text),
    );
    return Scaffold(
      body: Column(
        children: [
          AppbarUiTwo(
            title: cms(Fields.ForexRates_PageHeading).textHeading!,
            onTap: isPrelogin ? () => Get.back() : null,
          ),
          Expanded(
            child: GetBuilder<AccountController>(
                id: 'all-rates',
                builder: (accountController) {
                  Widget body = SizedBox(
                    height: Get.height - MediaQuery.of(context).padding.top,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            height: 46,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppConfigs.primaryColor, width: 2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => accountController
                                      ..forexType = 'buy'
                                      ..update(['all-rates']),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color:
                                            accountController.forexType == 'buy'
                                                ? AppConfigs.primaryColor
                                                : accountController.isDark
                                                    ? AppConfigs.b
                                                    : AppConfigs.w,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                          cms(Fields.ForexRates_BuyRate)
                                              .textHeading!,
                                          style: TS.f14.copyWith(
                                              color: accountController
                                                          .forexType ==
                                                      'buy'
                                                  ? AppConfigs.w
                                                  : AppConfigs.primaryColor)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => accountController
                                      ..forexType = 'sell'
                                      ..update(['all-rates']),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: accountController.forexType ==
                                                'sell'
                                            ? AppConfigs.primaryColor
                                            : accountController.isDark
                                                ? AppConfigs.b
                                                : AppConfigs.w,
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                          cms(Fields.ForexRates_SellRate)
                                              .textHeading!,
                                          style: TS.f14.copyWith(
                                              color: accountController
                                                          .forexType ==
                                                      'sell'
                                                  ? AppConfigs.w
                                                  : AppConfigs.primaryColor)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        textFormField(
                            hintText: cms(Fields.ForexRates_SearchCurrency)
                                .textHeading!,
                            labelText: cms(Fields.ForexRates_SearchCurrency)
                                .textHeading!,
                            controller: controller,
                            onChanged: (v) =>
                                accountController.getFilterRate(v),
                            trailing: Container(
                              width: 40,
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                ImagePath.search,
                                height: 20,
                                width: 20,
                                colorFilter: ColorFilter.mode(
                                    accountController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4,
                                    BlendMode.srcIn),
                              ),
                            ),
                            top: 20,
                            bottom: 20,
                            borderRadius: 50),
                        Expanded(
                            child: accountController.rates == null
                                ? loader()
                                : accountController.filterRates!.isEmpty
                                    ? Center(
                                        child: Text(
                                          "\"${controller.text}\"\nNo Data Found"
                                              .tr,
                                          style: TS.f20.copyWith(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : ListView.builder(
                                        padding: EdgeInsets.zero,
                                        physics: const ClampingScrollPhysics(),
                                        itemCount: accountController
                                            .filterRates!.length,
                                        itemBuilder: (c, i) {
                                          CurrencyRateList rate =
                                              accountController.filterRates![i];
                                          return Visibility(
                                            visible:
                                                (accountController.forexType ==
                                                        'buy'
                                                    ? rate.cashRateBuy > 0
                                                    : rate.cashRateSell > 0),
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 10, right: 10),
                                              height: 53,
                                              decoration: BoxDecoration(
                                                color: i % 2 == 1
                                                    ? Colors.grey.withAlpha(10)
                                                    : null,
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: AppConfigs.g70
                                                            .withOpacity(0.1))),
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Base64Image(
                                                            image:
                                                                rate.currencyFlagPath ??
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
                                                              // Expanded(
                                                              //   child: Text(accountController.rates![i].countryName!,
                                                              //       style: TS.f14.copyWith(
                                                              //         color: accountController.isDark ? AppConfigs.w : AppConfigs.g4,
                                                              //         fontWeight: FontWeight.w600,
                                                              //       ),
                                                              //       maxLines: 1,
                                                              //       overflow: TextOverflow.clip,
                                                              //       textAlign: TextAlign.start),
                                                              // ),
                                                              Text(
                                                                  rate
                                                                      .currencyCode,
                                                                  style: TextStyles
                                                                      .font10
                                                                      .copyWith(
                                                                    color: accountController
                                                                            .isDark
                                                                        ? AppConfigs
                                                                            .w
                                                                        : AppConfigs
                                                                            .g77,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Expanded(
                                                  //   child: Text(
                                                  //       "${g.accountController.rates![i].currencyCode} ${g.rates[i].cashBuy.toStringAsFixed(7)}",
                                                  //       style: TS.f14.copyWith(
                                                  //         color: accountController.isDark
                                                  //             ? AppConfigs.w
                                                  //             : AppConfigs.g4,
                                                  //         fontWeight: FontWeight.w600,
                                                  //       ),
                                                  //       textAlign: TextAlign.center),
                                                  // ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Text(
                                                        accountController
                                                                    .forexType ==
                                                                'buy'
                                                            ? rate.cashRateBuy
                                                                .toStringAsFixed(
                                                                    forexDecLen)
                                                            : rate.cashRateSell
                                                                .toStringAsFixed(
                                                                    forexDecLen),
                                                        style: TS.f14.copyWith(
                                                          color:
                                                              accountController
                                                                      .isDark
                                                                  ? AppConfigs.w
                                                                  : AppConfigs
                                                                      .g4,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        })),
                        Visibility(
                          visible: false,
                          child: roundButton(
                              cms(Fields.ForexBooking_CreateAlertButton)
                                  .textHeading!,
                              bottom: 20,
                              onTap: () => Get.find<AccountController>()
                                  .preLoginAlert()),
                        )
                      ],
                    ),
                  );

                  return Scaffold(
                      backgroundColor:
                          AppConfigs.bodybg(accountController.isDark),
                      body: isPrelogin
                          ? SingleChildScrollView(child: body)
                          : body);
                }),
          ),
        ],
      ),
    );
  }
}
