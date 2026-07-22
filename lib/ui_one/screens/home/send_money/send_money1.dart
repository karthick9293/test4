import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/masters/master_response_fz.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/exports/ui_one_pages.dart';
import '../../../../core/exports/ui_one_shimmer.dart';
import '../../../../core/flavours/constants.dart';
import 'favourite_beneficiary_tab.dart';
import 'recent_transactions_tab.dart';
import 'select_beneficiary_tab.dart';

class SendMoneyPage1 extends StatelessWidget {
  const SendMoneyPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final tfContrl = Get.find<TransferController>();
    tfContrl.tabIdex.value = 0;
    tfContrl.reArrangeBeneficiaryList();
    tfContrl.isFormUpdating = false;

    final baseCurrencySymbol = currencySymbolImage(
      currencyWidth: 10,
      Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ??
          tfContrl.fromAmtCur,
      color: tfContrl.isDark ? AppConfigs.g8f : AppConfigs.g4,
      textStyle: TS.f12.copyWith(
        color: tfContrl.isDark ? AppConfigs.g8f : AppConfigs.g4,
      ),
    );

    return GetBuilder<TransferController>(builder: (transferController) {
      transferController.getData();
      if (transferController.selectedBeneficiary == null) {
        transferController.sendMoneyFormBV = null;
      }
      final isLcyEnabled = !(transferController.sendMoneyFormBV?.formFieldItem
              .any((field) => field.FieldId == 'disableLcyAmount') ??
          false);
      final isFcyEnabled = !(transferController.sendMoneyFormBV?.formFieldItem
              .any((field) => field.FieldId == 'disableFcyAmount') ??
          false);
      return Stack(
        children: [
          DefaultTabController(
            length: 3,
            child: Builder(builder: (context) {
          final TabController tabController = DefaultTabController.of(context);

          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              transferController.tabIdex.value = tabController.index;
            }
          });
          // tabController.animation?.addListener(() {
          //   final newIndex = tabController.animation!.value.round();
          //   if (transferController.tabIdex.value != newIndex) {
          //     transferController.tabIdex.value = newIndex;
          //   }
          // });

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: AppConfigs.primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width / 1.8,
                        child: Text(
                          cms(Fields.SendMoney_AllBeneficiary).textHeading!,
                          style: TS.f16.copyWith(
                              color: transferController.tabIdex.value == 0
                                  ? AppConfigs.primaryColor
                                  : AppConfigs.g85),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                        ImagePath.heart,
                        height: 21,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                            transferController.tabIdex.value == 1
                                ? AppConfigs.primaryColor
                                : AppConfigs.g85,
                            BlendMode.srcIn),
                      ),
                      // child: Text(
                      //   cms(Fields.SendMoney_RecentTransaction).textHeading!,
                      //   style: TS.f14.copyWith(color: AppConfigs.primaryColor),
                      //   textAlign: TextAlign.center,
                      //   maxLines: 2,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ),
                    Tab(
                      icon: SvgPicture.asset(
                        ImagePath.recent,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                            transferController.tabIdex.value == 2
                                ? AppConfigs.primaryColor
                                : AppConfigs.g85,
                            BlendMode.srcIn),
                      ),
                      // child: Text(
                      //   cms(Fields.SendMoney_FavouriteBeneficiary).textHeading!,
                      //   style: TS.f14.copyWith(color: AppConfigs.primaryColor),
                      //   textAlign: TextAlign.center,
                      //   maxLines: 2,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Obx(
                      () => ClipRect(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: transferController.getTabviewHeight(),
                          child: TabBarView(children: [
                            selectBeneficiaryTab(),
                            favouriteBeneficiaryTab(),
                            recentTransactionsTab(),
                          ]),
                        ),
                      ),
                    ),

                    /// send money form rules
                    Visibility(
                      visible: transferController.selectedBeneficiary != null,
                      // &&
                      //     (transferController.serviceType ==
                      //             ServiceType.CASH_PICKUP ||
                      //         transferController.serviceType ==
                      //             ServiceType.WALLET_TRANNSFER),

                      child: SendMoneyFormRule(controller: transferController),
                    ),
                    SizedBox(height: 15),

                    Container(
                      // width: 427,
                      width: double.infinity,
                      // height: 231,
                      // height: 190,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        color: transferController.isDark
                            ? AppConfigs.b
                            : const Color(0xfff0f0f0),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // child: KeyboardActions(
                      //   // isDialog: widget.isDialog,
                      //   config: transferController.keyboardConfig(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                                cms(Fields.SendMoney_SendAmount).textHeading!,
                                style: TS.f14.copyWith(
                                    color: transferController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4),
                                textAlign: TextAlign.start),
                          ),
                          textFormField(
                            // if disableLcyAmount is present in formrule, disable the field
                            enabled: isLcyEnabled,
                            top: 5,
                            focusNode: transferController.fromAmountNode,
                            bottom: 0,
                            hintText: isLcyEnabled ? 'enter_amount'.tr : null,
                            textAlign: TextAlign.right,
                            style: TS.f.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: transferController.isDark
                                  ? AppConfigs.gd7
                                  : AppConfigs.g4,
                            ),
                            filledColor:
                                transferController.isDark ? null : AppConfigs.w,
                            disableBorder: true,
                            borderRadius: 50,
                            controller: transferController.fromAmountCtrl,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            // keyboardType: TextInputType.number,
                            errorText: transferController.fromAmtErr,
                            maxLength: 10,
                            showCounter: false,
                            inputFormatters: [decimalFormatter()],
                            trailing: !isLcyEnabled
                                ? Icon(
                                    CupertinoIcons.lock,
                                    color: transferController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4,
                                    size: 16,
                                  )
                                : null,
                            onChanged: (s) async {
                              if (transferController.searchOnStoppedTyping !=
                                  null) {
                                transferController.searchOnStoppedTyping!
                                    .cancel(); // clear timer
                              }
                              if (s.isNotEmpty) {
                                if (double.parse(s) < 1) {
                                  transferController
                                    ..fromAmtErr = 'required minimum amount 1'
                                    ..toAmtErr = ''
                                    ..update();
                                  return;
                                }
                                transferController
                                  ..fromAmtErr = ''
                                  ..toAmtErr = ''
                                  ..update();

                                const duration = Duration(milliseconds: 1500);

                                transferController.searchOnStoppedTyping =
                                    Timer(
                                        duration,
                                        () => transferController
                                            .updateToCurrency(s: s, type: 'L'));
                              } else {
                                transferController
                                  ..toAmountCtrl.clear()
                                  ..rateCharge = null
                                  ..update();
                              }
                            },
                            prefixIcon: Container(
                              width: 105,
                              // color: transferController.isDark
                              //     ? AppConfigs.g43
                              //     : AppConfigs.gd1,
                              // const Color(0xFFF8F8F8),
                              margin: const EdgeInsets.all(0.1),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    // decoration: const BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: AppConfigs.gdc,
                                    //     blurRadius: 7,
                                    //     offset: Offset(
                                    //         0, 0), // Shadow position
                                    //   ),
                                    // ],
                                    // ),
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                      currencyFlag(Box3
                                              .companyDataFZ
                                              ?.companySettings
                                              ?.primaryBaseCurrency ??
                                          APIConstants.currency),
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                      Box3.companyDataFZ?.companySettings
                                              ?.primaryBaseCurrency ??
                                          APIConstants.currency,
                                      style: TS.f16.copyWith(
                                          color: transferController.isDark
                                              ? AppConfigs.w
                                              : AppConfigs.bf0,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.start),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 15, 50, 0),
                            child: Row(
                              spacing: 20,
                              children: [
                                Text(
                                    cms(Fields.SendMoney_ReceiverGets)
                                        .textHeading!,
                                    style: TS.f14.copyWith(
                                        color: transferController.isDark
                                            ? AppConfigs.g8f
                                            : AppConfigs.g4),
                                    textAlign: TextAlign.start),
                                Obx(() => Visibility(
                                      visible: transferController
                                          .rateLoader.value,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: tinyLoader(),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          //TODO: Add indicative rate
                          textFormField(
                            // if disableFcyAmount is present in formrule, disable the field
                            enabled: isFcyEnabled,
                            top: 5,
                            focusNode: transferController.toAmountNode,
                            hintText: isFcyEnabled ? 'enter_amount'.tr : null,
                            textAlign: TextAlign.right,
                            style: TS.f.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: transferController.isDark
                                  ? AppConfigs.gd7
                                  : AppConfigs.g4,
                            ),
                            filledColor:
                                transferController.isDark ? null : AppConfigs.w,
                            disableBorder: true,
                            borderRadius: 50,
                            controller: transferController.toAmountCtrl,
                            errorText: transferController.toAmtErr,
                            maxLength: 10,
                            showCounter: false,
                            inputFormatters: [decimalFormatter()],
                            trailing: !isFcyEnabled
                                ? Icon(
                                    CupertinoIcons.lock,
                                    color: transferController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g4,
                                    size: 16,
                                  )
                                : null,
                            onChanged: (s) {
                              if (transferController.searchOnStoppedTyping !=
                                  null) {
                                transferController.searchOnStoppedTyping!
                                    .cancel();
                              }

                              if (s.isNotEmpty) {
                                if (double.parse(s) < 1) {
                                  transferController
                                    ..fromAmtErr = ''
                                    ..toAmtErr = 'required minimum amount 1'
                                    ..update();
                                  return;
                                }
                                transferController
                                  ..fromAmtErr = ''
                                  ..toAmtErr = ''
                                  ..update();

                                const duration = Duration(milliseconds: 1500);
                                transferController.searchOnStoppedTyping =
                                    Timer(
                                  duration,
                                  () => transferController.updateToCurrency(
                                      s: s, type: 'F'),
                                );
                              } else {
                                transferController
                                  ..fromAmountCtrl.clear()
                                  ..rateCharge = null
                                  ..update();
                              }
                            },
                            // keyboardType: TextInputType.number,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true, signed: false),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                transferController.selectedBeneficiary != null
                                    ? Container(
                                        width: 105,
                                        // color: transferController.isDark
                                        //     ? AppConfigs.g43
                                        //     : AppConfigs.gd1,
                                        // const Color(0xFFF8F8F8),
                                        margin: const EdgeInsets.all(0.1),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  // boxShadow: [
                                                  //   BoxShadow(
                                                  //     color: AppConfigs.gdc,
                                                  //     blurRadius: 7,
                                                  //     offset: Offset(0,
                                                  //         0), // Shadow position
                                                  //   ),
                                                  // ],
                                                  ),
                                              height: 20,
                                              width: 20,
                                              child: Image.asset(
                                                currencyFlag(transferController
                                                    .selectedBeneficiary!
                                                    .serviceCurrency
                                                    ?.Code),
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                                transferController
                                                    .selectedBeneficiary!
                                                    .serviceCurrency!
                                                    .Code,
                                                style: TS.f16.copyWith(
                                                    color: transferController
                                                            .isDark
                                                        ? AppConfigs.w
                                                        : AppConfigs.bf0,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                textAlign: TextAlign.start),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        width: 105,
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        // color: transferController.isDark
                                        //     ? AppConfigs.g43
                                        //     : AppConfigs.gd1,
                                        child: CurrencyDropdownDashboard(
                                          value: Get.find<AccountController>()
                                              .toCur,
                                          crItems: Get.find<AccountController>()
                                              .dashboardCurrencies,
                                          onChanged: (v) async {
                                            Get.find<AccountController>()
                                              ..toCur = v
                                              ..update();
                                            transferController
                                              ..toAmtCur = v?.Code
                                              ..selectedBeneficiary = null
                                              ..update();
                                            if (transferController
                                                .fromAmountCtrl
                                                .text
                                                .isNotEmpty) {
                                              await transferController
                                                  .updateToCurrency(
                                                      s: transferController
                                                          .fromAmountCtrl.text,
                                                      currencyCode: v?.Code,
                                                      type: 'L');
                                            }
                                          },
                                        ),
                                      ),
                                // Obx(() => Visibility(
                                //       visible: transferController
                                //           .rateLoader.value,
                                //       child: Align(
                                //         alignment: Alignment.center,
                                //         child: tinyLoader(),
                                //       ),
                                //     )),
                              ],
                            ),
                          ),

                          Visibility(
                            visible: (transferController
                                        .rC?.chargeDetails?.divisionRate
                                        .toString() ??
                                    '')
                                .isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text.rich(
                                  style: TS.f12.copyWith(
                                      color: transferController.isDark
                                          ? AppConfigs.g8f
                                          : AppConfigs.g4,
                                      fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.center,
                                  TextSpan(
                                    children: [
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, right: 1),
                                          child: baseCurrencySymbol,
                                        ),
                                      ),
                                      TextSpan(text: "1 "),
                                      TextSpan(
                                        text:
                                            " = ${getCurrencySymbol(transferController.toAmtCur ?? 'INR')} ${transferController.rC?.chargeDetails?.divisionRate} *",
                                      ),
                                    ],
                                  ),
                                ),
                                // Text(
                                //   "1 ${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ?? transferController.fromAmtCur} = ${transferController.rC?.chargeDetails?.divisionRate} ${transferController.toAmtCur ?? 'INR'}*",
                                //   style: TS.f12.copyWith(
                                //       color: transferController.isDark
                                //           ? AppConfigs.g8f
                                //           : AppConfigs.g4,
                                //       fontStyle: FontStyle.italic),
                                //   textAlign: TextAlign.center,
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // ),
                    ),

                    Obx(
                      () => Visibility(
                        visible:
                            transferController.selectedBeneficiary != null &&
                                transferController.sourcePurposeVisibility,
                        child: transferController.loadingSourceNpurpose.isTrue
                            ? Padding(
                                padding: EdgeInsets.only(
                                    left: S.p, top: 20, right: S.p),
                                child: DropdownShimmers(),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: S.p, top: 20, right: S.p),
                                    child: Row(
                                      children: [
                                        // SvgPicture.asset(
                                        //   ImagePath.info,
                                        //   colorFilter: ColorFilter.mode(
                                        //     Get.find<TransferController>()
                                        //             .isDark
                                        //         ? AppConfigs.g8f
                                        //         : AppConfigs.g4,
                                        //     BlendMode.srcIn,
                                        //   ),
                                        // ),
                                        // SizedBox(width: 4),
                                        Text(
                                            '${'purpose_of_sending_money'.tr} *',
                                            style: TS.f14.copyWith(
                                                color: transferController.isDark
                                                    ? AppConfigs.g8f
                                                    : AppConfigs.g4),
                                            textAlign: TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  customDropdown<MasterResponseFZ>(
                                      key: transferController
                                          .purposeDropdownKey,
                                      top: 5,
                                      value: transferController.selectedPurpose,
                                      error: transferController.purposeError,
                                      borderRadius: 10,
                                      disableBorder:
                                          transferController.selectedPurpose !=
                                                  null
                                              ? true
                                              : false,
                                      fillColor:
                                          transferController.selectedPurpose !=
                                                  null
                                              ? AppConfigs.primaryColor
                                                  .withOpacity(0.1)
                                              : null,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: transferController
                                                    .selectedPurpose ==
                                                null
                                            ? null
                                            : AppConfigs.primaryColor,
                                      ),
                                      items: transferController.purposes
                                          .map((e) => DropdownMenuItem<
                                                  MasterResponseFZ>(
                                                value: e,
                                                child: Text(
                                                  e.Desc,
                                                  textAlign: TextAlign.start,
                                                  style: TS.f14.copyWith(
                                                      color: transferController
                                                                  .selectedPurpose
                                                                  ?.Desc ==
                                                              e.Desc
                                                          ? AppConfigs
                                                              .primaryColor
                                                          : transferController
                                                                  .isDark
                                                              ? AppConfigs.w
                                                              : AppConfigs.g4),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (s) {
                                        transferController
                                          ..selectedPurpose = s
                                          ..purposeError = false
                                          ..update();
                                      },
                                      hintText: 'Please Select Purpose'.tr),
                                  errorText(transferController.purposeError
                                      ? 'required'.tr
                                      : ''),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: S.p, top: 10, right: S.p),
                                    child: Row(
                                      children: [
                                        // SvgPicture.asset(
                                        //   ImagePath.info,
                                        //   colorFilter: ColorFilter.mode(
                                        //     Get.find<TransferController>()
                                        //             .isDark
                                        //         ? AppConfigs.g8f
                                        //         : AppConfigs.g4,
                                        //     BlendMode.srcIn,
                                        //   ),
                                        // ),
                                        // SizedBox(width: 4),
                                        Text('${'source_of_income'.tr} *',
                                            style: TS.f14.copyWith(
                                                color: transferController.isDark
                                                    ? AppConfigs.g8f
                                                    : AppConfigs.g4),
                                            textAlign: TextAlign.start),
                                      ],
                                    ),
                                  ),
                                  customDropdown<MasterResponseFZ>(
                                      key: transferController.sourceDropdownKey,
                                      top: 5,
                                      value: transferController.selectedSource,
                                      error: transferController.sourceError,
                                      borderRadius: 10,
                                      disableBorder:
                                          transferController.selectedSource !=
                                                  null
                                              ? true
                                              : false,
                                      fillColor:
                                          transferController.selectedSource !=
                                                  null
                                              ? AppConfigs.primaryColor
                                                  .withOpacity(0.1)
                                              : null,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color:
                                            transferController.selectedSource ==
                                                    null
                                                ? null
                                                : AppConfigs.primaryColor,
                                      ),
                                      items: transferController.sources
                                          .map((e) => DropdownMenuItem<
                                                  MasterResponseFZ>(
                                                value: e,
                                                child: Text(
                                                  e.Desc,
                                                  textAlign: TextAlign.start,
                                                  style: TS.f14.copyWith(
                                                      color: transferController
                                                                  .selectedSource
                                                                  ?.Desc ==
                                                              e.Desc
                                                          ? AppConfigs
                                                              .primaryColor
                                                          : transferController
                                                                  .isDark
                                                              ? AppConfigs.w
                                                              : AppConfigs.g4),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (e) {
                                        transferController
                                          ..selectedSource = e
                                          ..sourceError = false
                                          ..update();
                                      },
                                      hintText: 'Please Select Source'.tr),
                                  errorText(transferController.sourceError
                                      ? 'required'.tr
                                      : ''),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
      if (transferController.isFormUpdating ||
          transferController.formruleLoading) ...[
        ModalBarrier(
          color: Colors.black.withOpacity(0.1),
          dismissible: false,
        ),
        loader(),
      ],
    ],
  );
    });
  }
}
