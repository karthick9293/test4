import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/flavours/constants.dart';

class RemittanceTab extends StatelessWidget {
  const RemittanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<AccountController>()
      ..remittanceAttributes.clear()
      ..remittanceAttributes.toCurrency = Get.find<AccountController>().toCur
      ..getRateOnAlert(true, isFirst: true);
    return GetBuilder<AccountController>(builder: (accountController) {
      return Column(
        children: [
          Container(
            height: 308,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.fromLTRB(22, 40, 19, 26),
            color: accountController.isDark ? const Color(0xff00101d) : const Color(0xfff8f8f8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cms(Fields.ForexBooking_FromCurrency).textHeading!,
                        style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4), textAlign: TextAlign.start),
                    Text(cms(Fields.ForexBooking_ToCurrency).textHeading!,
                        style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4), textAlign: TextAlign.start),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7, bottom: 7),
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppConfigs.accentColor,
                        borderRadius: const BorderRadius.all(Radius.circular(28)),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        currencyFlag(
                                          accountController.remittanceAttributes.fromCurrency?.Code ??
                                              Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ??
                                              '',
                                        ),
                                        height: 20,
                                        width: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        accountController.remittanceAttributes.fromCurrency?.Code ??
                                            Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ??
                                            '',
                                        style: TS.f16.copyWith(color: AppConfigs.w),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 58),
                              Expanded(
                                child: Center(
                                  child: CurrencyDropdownDashboard(
                                    value: accountController.toCur,
                                    crItems: accountController.currencies
                                        .where((c) =>
                                            c.Code != accountController.remittanceAttributes.fromCurrency?.Code &&
                                            c.Desc != accountController.remittanceAttributes.fromCurrency?.Desc)
                                        .toList(),
                                    onChanged: (c) async {
                                      accountController
                                        ..remittanceAttributes.toCurrency = c
                                        ..toCur = c
                                        ..update();
                                      await accountController.getRateOnAlert(true);
                                    },
                                    textColor: AppConfigs.w,
                                    height: 50,
                                  ),
                                ),
                              ),
                              // Expanded(
                              //   child: customDropdown<MasterResponseFZ>(
                              //       icon: const Icon(Icons.arrow_drop_down,
                              //           color: AppConfigs.w),
                              //       noPad: true,
                              //       dropdownStyleData: DropdownStyleData(
                              //         maxHeight: 200,
                              //         decoration: BoxDecoration(
                              //             borderRadius: const BorderRadius.all(
                              //                 Radius.circular(5)),
                              //             color: AppConfigs.accentColor),
                              //       ),
                              //       inTextField: true,
                              //       buttonStyleData:
                              //           const ButtonStyleData(height: 48),
                              //       menuItemStyleData:
                              //           const MenuItemStyleData(),
                              //       items: accountController.currencies
                              //           .where((c) =>
                              //               c.Code !=
                              //                   accountController
                              //                       .remittanceAttributes
                              //                       .fromCurrency
                              //                       ?.Code &&
                              //               c.Desc !=
                              //                   accountController
                              //                       .remittanceAttributes
                              //                       .fromCurrency
                              //                       ?.Desc)
                              //           .map<
                              //                   DropdownMenuItem<
                              //                       MasterResponseFZ>>(
                              //               (MasterResponseFZ currency) {
                              //         return DropdownMenuItem<MasterResponseFZ>(
                              //           value: currency,
                              //           child: Text(currency.Code,
                              //               style: TS.f16
                              //                   .copyWith(color: AppConfigs.w),
                              //               textAlign: TextAlign.start),
                              //         );
                              //       }).toList(),
                              //       value: accountController.toCur,
                              //       onChanged: (c) async {
                              //         accountController
                              //           ..remittanceAttributes.toCurrency = c
                              //           ..toCur = c
                              //           ..update();
                              //         await accountController
                              //             .getRateOnAlert(true);
                              //       }),
                              // ),
                              const SizedBox(width: 0),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 58,
                      width: 58,
                      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(29))),
                      child: Center(
                          child: SvgPicture.asset(
                        ImagePath.exchange,
                        colorFilter: ColorFilter.mode(AppConfigs.accentColor, BlendMode.srcIn),
                        height: 25,
                      )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Text("alert_me_when_price_reaches".tr,
                      style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4), textAlign: TextAlign.start),
                ),
                GetBuilder<AccountController>(
                    id: "rate-text-field",
                    builder: (context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "1 ${accountController.remittanceAttributes.fromCurrency?.Code ?? Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ?? ''}",
                              style: TS.f20.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                              textAlign: TextAlign.start),
                          Container(
                            width: 119,
                            margin: const EdgeInsets.only(left: 17, right: 17),
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: textFormField(
                              disableBorder: false,
                              inputFormatters: [decimalFormatter()],
                              controller: accountController.remittanceAttributes.remAmount,
                              keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: true),
                              textAlign: TextAlign.center,
                              onChanged: (s) {
                                if (s.isNotEmpty) {
                                  accountController.remittanceAttributes.remAmountError = '';
                                }
                                accountController.update(["rate-text-field"]);
                              },
                              style: TS.f22.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4),
                              cHeight: 49,
                              noPad: true,
                            ),
                          ),
                          Text(
                            accountController.toCur?.Code ?? '',
                            style: TS.f20.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                            textAlign: TextAlign.start,
                          )
                        ],
                      );
                    }),
                accountController.remittanceAttributes.remAmountError.isNotEmpty
                    ? errorText(accountController.remittanceAttributes.remAmountError, alignment: Alignment.center)
                    : const SizedBox(
                        height: 5,
                      ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text("a_few_seconds_ago".tr,
                      style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : null), textAlign: TextAlign.start),
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: ConstColors.primary, width: 1), borderRadius: const BorderRadius.all(Radius.circular(20))),
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  alignment: Alignment.center,
                  child: Text(
                      "1 ${accountController.remittanceAttributes.fromCurrency?.Code ?? Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ?? ''} = ${accountController.oneRemRate} ${accountController.remittanceAttributes.toCurrency?.Code}",
                      style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                      textAlign: TextAlign.start),
                )
              ],
            ),
          ),
          accountController.buttonLoading
              ? loader(top: 20)
              : roundButton(cms(Fields.ForexBooking_SetAlertButton).textHeading!, top: 17, onTap: () async {
                  if (double.tryParse(accountController.remittanceAttributes.remAmount.text) == null) {
                    accountController
                      ..remittanceAttributes.remAmountError =
                          accountController.remittanceAttributes.remAmount.text.isEmpty ? 'required'.tr : 'invalid'.tr
                      ..update();
                  } else {
                    await accountController.createAlert(2);
                  }
                }),
        ],
      );
    });
  }
}
