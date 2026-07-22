import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_five_custom_widgets.dart';
import '../../../../../core/flavours/constants.dart';

Widget preLoginRateCard(
    {double top = 0, double height = 229, required BuildContext myContext}) {
  if (Get.find<MainController>().fromAmtCtrl.text == "") {
    Get.find<DataController>().oneUnitRate();
  }

  return GetBuilder<MainController>(
      id: 'Rate-Card',
      builder: (mainController) {
        bool isDark = mainController.isDark;
        return Container(
          margin: EdgeInsets.fromLTRB(10, top, 10, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: isDark
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF0D2B3E),
                            Color(0xFF0A1929),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isDark ? null : Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isDark
                        ? AppConfigs.primaryColor.withOpacity(0.4)
                        : Colors.white.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? AppConfigs.primaryColor.withOpacity(0.15)
                          : Colors.black.withOpacity(0.1),
                      blurRadius: isDark ? 24 : 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Labels Row
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            cms(Fields.MyTransaction_SendingAmount)
                                .textHeading!,
                            style: TS.f16.copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(width: 42), // Width of swapper space
                        Expanded(
                          child: Text(
                            cms(Fields.MyTransaction_ReceiverGets).textHeading!,
                            style: TS.f16.copyWith(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Inputs Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // From Section
                        Expanded(
                          child: _buildInputBox(
                            controller: mainController.fromAmtCtrl,
                            focusNode: mainController.fromAmountNode,
                            prefix: SizedBox(
                              height: 30,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    currencyFlag(Box3
                                            .companyDataFZ
                                            ?.companySettings
                                            ?.primaryBaseCurrency ??
                                        'AED'),
                                    height: 25,
                                    width: 25,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    Box3.companyDataFZ?.companySettings
                                            ?.primaryBaseCurrency ??
                                        'AED',
                                    style: TS.f16.copyWith(
                                      color: AppConfigs.w,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onChanged: (s) {
                              if (s.isNotEmpty) {
                                mainController.debounce?.cancel();
                                mainController.debounce = Timer(
                                    const Duration(milliseconds: 500), () {
                                  mainController.updateToCurrency(
                                      s: s, type: 'L');
                                });
                              } else {
                                mainController.fromAmtCtrl.clear();
                                mainController.toAmtCtrl.clear();
                              }
                            },
                            isDark: isDark,
                          ),
                        ),

                        // Swapper Icon
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.2)),
                            ),
                            child: const Icon(Icons.swap_horiz_rounded,
                                color: Colors.white, size: 18),
                          ),
                        ),

                        // To Section
                        Expanded(
                          child: _buildInputBox(
                            controller: mainController.toAmtCtrl,
                            focusNode: mainController.toAmountNode,
                            prefix: Get.find<AccountController>().toCur != null
                                ? CurrencyDropdownDashboard(
                                    buttonWidth: 88,
                                    value: Get.find<AccountController>().toCur,
                                    flagSize: 25,
                                    textColor: Colors.white,
                                    crItems: Get.find<AccountController>()
                                        .dashboardCurrencies,
                                    onChanged: (val) async {
                                      Get.find<AccountController>().toCur = val;
                                      Get.find<AccountController>()
                                          .update(['Rate-Card']);
                                      mainController.update(['Rate-Card']);
                                      await Get.find<DataController>()
                                          .oneUnitRate(
                                              amount: mainController
                                                  .fromAmtCtrl.text);
                                    },
                                  )
                                : SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: tinyLoader(
                                          size: 10, color: Colors.white),
                                    ),
                                  ),
                            onChanged: (s) {
                              if (s.isNotEmpty) {
                                mainController.debounce?.cancel();
                                mainController.debounce = Timer(
                                    const Duration(milliseconds: 500), () {
                                  mainController.updateToCurrency(
                                      s: s, type: 'F');
                                });
                              } else {
                                mainController.toAmtCtrl.clear();
                                mainController.fromAmtCtrl.clear();
                              }
                            },
                            isDark: isDark,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Exchange Rate Info Pill
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color(0xFF4CAF50).withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.trending_up_rounded,
                                size: 16, color: Color(0xFF81C784)),
                            const SizedBox(width: 6),
                            Text(
                              "1 ${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ?? 'AED'} = ",
                              style: TS.f12.copyWith(color: Colors.white70),
                            ),
                            Text(
                              "${mainController.oneUnitValue.value} ${Get.find<AccountController>().toCur?.Code ?? ''}",
                              style: TS.f12.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Send Money Button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          mainController.handleRateCardSendMoneyTap(
                              preLogin: height != 238,
                              height: height,
                              updateProfileBodyBuilder: updateProfileBody,
                              sendMoneyAppBar: AppBars.sendMoney);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppConfigs.accentColor, // Secondary color
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.paperplane, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              cms(Fields.PreLogin_SendMoneyButton).textHeading!,
                              style: TS.f18.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Widget _buildInputBox({
  required TextEditingController controller,
  required FocusNode focusNode,
  required Widget prefix,
  required Function(String) onChanged,
  required bool isDark,
}) {
  final child = Container(
    height: 80,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: isDark
          ? Colors.white.withOpacity(0.07)
          : Colors.white.withOpacity(0.08),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: isDark
            ? Colors.white.withOpacity(0.18)
            : Colors.white.withOpacity(0.15),
        width: 1.2,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [prefix]),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          cursorColor: Colors.white,
          inputFormatters: [decimalFormatter()],
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style:
              TS.f18.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
            hintText: "0.00",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.3)),
          ),
        ),
      ],
    ),
  );

  if (isDark) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: child,
      ),
    );
  }

  return child;
}
