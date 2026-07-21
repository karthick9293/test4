import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../../core/flavours/constants.dart';

Widget preLoginRateCard(
    {double top = 0, double height = 229, required BuildContext myContext}) {
  if (Get.find<MainController>().fromAmtCtrl.text == "") {
    Get.find<DataController>().oneUnitRate();
  }

  return GetBuilder<MainController>(
      id: 'Rate-Card',
      builder: (mainController) {
        return Container(
          margin: EdgeInsets.fromLTRB(16, top, 16, 0),
          decoration: BoxDecoration(
            color: mainController.isDark ? AppConfigs.g21 : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: mainController.isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Horizontal Inputs Row
                Row(
                  children: [
                    // From Section
                    Expanded(
                      child: _buildCompactInput(
                        label: cms(Fields.MyTransaction_SendingAmount)
                            .textHeading!,
                        controller: mainController.fromAmtCtrl,
                        focusNode: mainController.fromAmountNode,
                        prefix: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              currencyFlag(Box3.companyDataFZ?.companySettings
                                      ?.primaryBaseCurrency ??
                                  'AED'),
                              height: 18,
                              width: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              Box3.companyDataFZ?.companySettings
                                      ?.primaryBaseCurrency ??
                                  'AED',
                              style: TS.f16.copyWith(
                                fontWeight: FontWeight.w600,
                                color: mainController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.bf0,
                              ),
                            ),
                          ],
                        ),
                        onChanged: (s) {
                          if (s.isNotEmpty) {
                            mainController.debounce?.cancel();
                            mainController.debounce =
                                Timer(const Duration(milliseconds: 500), () {
                              mainController.updateToCurrency(s: s, type: 'L');
                            });
                          } else {
                            mainController.toAmtCtrl.clear();
                          }
                        },
                        isDark: mainController.isDark,
                      ),
                    ),

                    // Animation / Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(Icons.swap_horiz_rounded,
                          color: AppConfigs.primaryColor, size: 20),
                    ),

                    // To Section
                    Expanded(
                      child: _buildCompactInput(
                        label:
                            cms(Fields.MyTransaction_ReceiverGets).textHeading!,
                        controller: mainController.toAmtCtrl,
                        focusNode: mainController.toAmountNode,
                        prefix: Get.find<AccountController>().toCur != null
                            ? CurrencyDropdownDashboard(
                                value: Get.find<AccountController>().toCur,
                                textColor: mainController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.bf0,
                                crItems: Get.find<AccountController>()
                                    .dashboardCurrencies,
                                onChanged: (v) async {
                                  Get.find<AccountController>().toCur = v;
                                  Get.find<AccountController>()
                                      .update(['Rate-Card']);
                                  mainController.update(['Rate-Card']);
                                  await Get.find<DataController>().oneUnitRate(
                                      amount: mainController.fromAmtCtrl.text);
                                },
                              )
                            : tinyLoader(
                                size: 10, color: AppConfigs.primaryColor),
                        onChanged: (s) {
                          if (s.isNotEmpty) {
                            mainController.debounce?.cancel();
                            mainController.debounce =
                                Timer(const Duration(milliseconds: 500), () {
                              mainController.updateToCurrency(s: s, type: 'F');
                            });
                          } else {
                            mainController.fromAmtCtrl.clear();
                          }
                        },
                        isDark: mainController.isDark,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Exchange Rate Info
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: mainController.isDark
                        ? AppConfigs.primaryColor.withValues(alpha: 0.1)
                        : AppConfigs.g77.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "1 ${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ?? 'AED'} = ",
                            style: TS.f12.copyWith(color: AppConfigs.g77),
                          ),
                          Text(
                            "${mainController.oneUnitValue.value} ${Get.find<AccountController>().toCur?.Code ?? ''}",
                            style: TS.f12.copyWith(
                                color: AppConfigs.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                ),

                const SizedBox(height: 16),

                // Send Money Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      mainController.handleRateCardSendMoneyTap(
                          preLogin: height != 238,
                          height: height,
                          updateProfileBodyBuilder: updateProfileBody,
                          sendMoneyAppBar: AppBars.sendMoney);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppConfigs.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: Text(
                      cms(Fields.PreLogin_SendMoneyButton).textHeading!,
                      style: TS.f18.copyWith(
                          fontWeight: FontWeight.bold, color: AppConfigs.w),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}

Widget _buildCompactInput({
  required String label,
  required TextEditingController controller,
  required FocusNode focusNode,
  required Widget prefix,
  required Function(String) onChanged,
  required bool isDark,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: TS.f16.copyWith(
              color: isDark
                  ? AppConfigs.w.withValues(alpha: 0.6)
                  : AppConfigs.g77)),
      const SizedBox(height: 6),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isDark
              ? AppConfigs.primaryColor.withValues(alpha: 0.1)
              : AppConfigs.g77.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark
                ? AppConfigs.primaryColor.withValues(alpha: 0.2)
                : AppConfigs.g77.withOpacity(0.1),
          ),
        ),
        child: Row(
          children: [
            prefix,
            const SizedBox(width: 4),
            Expanded(
              child: TextFormField(
                controller: controller,
                focusNode: focusNode,
                onChanged: onChanged,
                cursorColor: AppConfigs.primaryColor,
                inputFormatters: [decimalFormatter()],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                style: TS.f14.copyWith(
                    color: isDark ? AppConfigs.w : AppConfigs.bf0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 4),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
