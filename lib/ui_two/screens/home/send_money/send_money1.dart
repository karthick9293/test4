import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../models/masters/master_response_fz.dart';
import '../../../shimmers/dropdown_shimmers.dart';
import '../../form_rules_form/send_money_form_rule.dart';

class SendMoneyPage1 extends StatefulWidget {
  const SendMoneyPage1({super.key});

  @override
  State<SendMoneyPage1> createState() => _SendMoneyPage1State();
}

class _SendMoneyPage1State extends State<SendMoneyPage1> {
  @override
  void initState() {
    super.initState();
    Get.find<DataController>().getData(TransferController);
  }

  @override
  Widget build(BuildContext context) {
    int? length = Box3.settings.currencyDecimalLength;
    final tfContrl = Get.find<TransferController>();
    tfContrl.tabIdex.value = 0;
    tfContrl.reArrangeBeneficiaryList();
    tfContrl.isFormUpdating = false;

    return GetBuilder<TransferController>(builder: (transferController) {
      // transferController.getData();
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
          Column(
            children: [
              AppbarUiTwo(
                title: cms(Fields.SendMoney_PageHeading).textHeading!,
              ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(
                    cms(Fields.SendMoney_AllBeneficiary).textHeading!,
                    style: TS.f20.copyWith(
                      color: transferController.isDark
                          ? AppConfigs.g8f
                          : AppConfigs.g4,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    // if (!Get.isRegistered<BeneficiaryController>()) {
                    //   Get.put(BeneficiaryController(), permanent: true);
                    // }
                    // // if (!Get.isRegistered<TransferController>()) {
                    // //   Get.put(TransferController(transferType: TransferType.all));
                    // // }
                    // if (!Get.isRegistered<TransactionController>()) {
                    //   Get.put(TransactionController(), permanent: true);
                    // }
                    // if (!Get.isRegistered<DataController>()) {
                    //   Get.put(DataController());
                    // }
                    // await Get.find<DataController>().getData(TransferController);
                    Get.put(BeneficiaryController(), permanent: true);
                    Get.put(TransactionController(), permanent: true);
                    Get.put(TransferController(transferType: TransferType.all),
                        permanent: true);
                    Get.find<MainController>().push(
                      SelectBeneficiaryUiTwo(),
                      AppBars.myBeneficiary,
                    );
                  },
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppConfigs.gdc),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppConfigs.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: FittedBox(
                            child: Center(
                              child: Text(
                                transferController.selectedBeneficiary != null
                                    ? getShortName(transferController
                                            .selectedBeneficiary!.name ??
                                        '')
                                    : 'B',
                                style: TS.f16.copyWith(color: AppConfigs.w),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 2,
                            children: [
                              Text(
                                transferController.selectedBeneficiary != null
                                    ? transferController
                                            .selectedBeneficiary!.name ??
                                        ''
                                    : cms(Fields.SendMoney_SelectBeneficiary)
                                        .textHeading!,
                                style: TS.f16.copyWith(
                                  color:
                                      transferController.selectedBeneficiary !=
                                              null
                                          ? AppConfigs.primaryColor
                                          : transferController.isDark
                                              ? AppConfigs.g8f
                                              : AppConfigs.g70,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              if (transferController.selectedBeneficiary !=
                                  null)
                                Row(
                                  children: [
                                    Text(
                                      '${(transferController.selectedBeneficiary!.serviceType?.Desc ?? '')} | ',
                                      style: TS.f14.copyWith(
                                        color: transferController.isDark
                                            ? AppConfigs.w
                                            : AppConfigs.g70,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        transferController.selectedBeneficiary!
                                                    .serviceType?.Code ==
                                                'C'
                                            ? transferController
                                                .selectedBeneficiary!
                                                .country!
                                                .Desc
                                            : transferController
                                                        .selectedBeneficiary!
                                                        .serviceType
                                                        ?.Code ==
                                                    'B'
                                                ? (transferController
                                                        .selectedBeneficiary!
                                                        .bank
                                                        ?.Desc ??
                                                    '')
                                                : (transferController
                                                        .selectedBeneficiary!
                                                        .bank
                                                        ?.Desc ??
                                                    ''),
                                        style: TS.f14.copyWith(
                                          color: transferController.isDark
                                              ? AppConfigs.w
                                              : AppConfigs.g70,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          ImagePath.arrowNext,
                          colorFilter: ColorFilter.mode(
                            AppConfigs.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
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

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                      child: Text(
                        cms(Fields.SendMoney_SendAmount).textHeading!,
                        style: TS.f16.copyWith(
                          color: transferController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g70,
                        ),
                      ),
                    ),
                    textFormField(
                      // if disableLcyAmount is present in formrule, disable the field
                      enabled: isLcyEnabled,
                      cHeight: 60,
                      top: 0,
                      bottom: 0,
                      controller: transferController.fromAmountCtrl,
                      focusNode: transferController.fromAmountNode,
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
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xFFE2EAFF),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                      disableBorder: true,
                      borderRadius: 50,
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
                      contentPadding: EdgeInsets.fromLTRB(
                          20, (60 - 24) / 2, 20, (60 - 24) / 2),
                      onChanged: (s) async {
                        if (transferController.searchOnStoppedTyping != null) {
                          transferController.searchOnStoppedTyping!
                              .cancel(); // clear timer
                        }
                        if (s.isNotEmpty) {
                          transferController
                            ..fromAmtErr = ''
                            ..toAmtErr = ''
                            ..update();

                          const duration = Duration(milliseconds: 1500);

                          transferController.searchOnStoppedTyping = Timer(
                              duration,
                              () => transferController.updateToCurrency(
                                  s: s, type: 'L'));
                        } else {
                          transferController
                            ..toAmountCtrl.clear()
                            ..rateCharge = null
                            ..update();
                        }
                      },
                      prefixIcon: Container(
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
                                    currencyFlag(
                                      Box3.companyDataFZ?.companySettings
                                              ?.primaryBaseCurrency ??
                                          APIConstants.currency,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
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
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Divider(color: AppConfigs.gdc),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 7),
                            decoration: BoxDecoration(
                              color:
                                  AppConfigs.bodybg(transferController.isDark),
                              border: Border.all(color: AppConfigs.gdc),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(ImagePath.starZ),
                                SizedBox(width: 10),
                                Text(
                                  cms(Fields.ConfirmPaymentDetail_TransferFee)
                                      .textHeading!,
                                  style: TS.f14.copyWith(
                                    color: transferController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.bf0,
                                  ),
                                ),
                                SizedBox(width: 10),
                                CurrencySymbolWithAmount(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  currencyCode:
                                      transferController.toAmtCur ?? '',
                                  amount: (transferController
                                          .rC?.chargeDetails?.commission
                                          ?.toStringWithOptionalFixed(length) ??
                                      '--'),
                                  color: transferController.isDark
                                      ? AppConfigs.w
                                      : AppConfigs.bf0,
                                  textStyle: TS.f20.copyWith(
                                    color: transferController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.bf0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Row(
                        spacing: 20,
                        children: [
                          Text(
                            cms(Fields.SendMoney_ReceiverGets).textHeading!,
                            style: TS.f16.copyWith(
                              color: transferController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.g70,
                            ),
                          ),
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
                    textFormField(
                      // if disableFcyAmount is present in formrule, disable the field
                      enabled: isFcyEnabled,
                      cHeight: 60,
                      top: 0,
                      bottom: 0,
                      controller: transferController.toAmountCtrl,
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
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xFFE2EAFF),
                          blurRadius: 6,
                          spreadRadius: 2,
                        ),
                      ],
                      disableBorder: true,
                      borderRadius: 50,
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
                      contentPadding: EdgeInsets.fromLTRB(
                          20, (60 - 24) / 2, 20, (60 - 24) / 2),
                      onChanged: (s) {
                        if (transferController.searchOnStoppedTyping != null) {
                          transferController.searchOnStoppedTyping!.cancel();
                        }

                        if (s.isNotEmpty) {
                          transferController
                            ..fromAmtErr = ''
                            ..toAmtErr = ''
                            ..update();

                          const duration = Duration(milliseconds: 1500);
                          transferController.searchOnStoppedTyping = Timer(
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
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: false),
                      prefixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          transferController.selectedBeneficiary != null
                              ? Container(
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
                                              currencyFlag(transferController
                                                  .selectedBeneficiary!
                                                  .serviceCurrency
                                                  ?.Code),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        transferController.selectedBeneficiary!
                                            .serviceCurrency!.Code,
                                        style: TS.f16.copyWith(
                                            color: transferController.isDark
                                                ? AppConfigs.w
                                                : AppConfigs.bf0,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  width: 108,
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CurrencyDropdownDashboard(
                                    value: Get.find<AccountController>().toCur,
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
                                          .fromAmountCtrl.text.isNotEmpty) {
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
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exchange rate',
                              style: TS.f18.copyWith(
                                color: AppConfigs.primaryColor,
                              ),
                            ),
                            Text.rich(
                              style: TS.f18.copyWith(
                                color: AppConfigs.primaryColor,
                              ),
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2.5, right: 1),
                                      child: CurrencySymbolWithAmount(
                                        currencyWidth: 13,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        currencyCode: Box3
                                                .companyDataFZ
                                                ?.companySettings
                                                ?.primaryBaseCurrency ??
                                            tfContrl.fromAmtCur,
                                        amount: "1",
                                        color: AppConfigs.primaryColor,
                                        textStyle: TS.f18.copyWith(
                                          color: AppConfigs.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        " = ${getCurrencySymbol(transferController.toAmtCur ?? 'INR')}${transferController.rC?.chargeDetails?.divisionRate}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // ),
                SizedBox(height: 10),

                Obx(
                  () => Visibility(
                    visible: transferController.selectedBeneficiary != null &&
                        transferController.sourcePurposeVisibility,
                    child: transferController.loadingSourceNpurpose.isTrue
                        ? Padding(
                            padding:
                                EdgeInsets.only(left: S.p, top: 20, right: S.p),
                            child: DropdownShimmers(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: S.p, top: 20, right: S.p),
                                child: Text(
                                  '${'purpose_of_sending_money'.tr} *',
                                  style: TS.f16.copyWith(
                                      color: transferController.isDark
                                          ? AppConfigs.g8f
                                          : AppConfigs.g4),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              customDropdown<MasterResponseFZ>(
                                  key: transferController.purposeDropdownKey,
                                  // buttonHeight: 46,
                                  top: 5,
                                  value: transferController.selectedPurpose,
                                  error: transferController.purposeError,
                                  borderRadius: 10,
                                  disableBorder: true,
                                  fillColor: AppConfigs.primaryColor
                                      .withValues(alpha: 0.1),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: transferController.selectedPurpose ==
                                            null
                                        ? null
                                        : AppConfigs.primaryColor,
                                  ),
                                  items: transferController.purposes
                                      .map((e) =>
                                          DropdownMenuItem<MasterResponseFZ>(
                                            value: e,
                                            child: Text(
                                              e.Desc,
                                              textAlign: TextAlign.start,
                                              style: TS.f14.copyWith(
                                                  color: transferController
                                                              .selectedPurpose
                                                              ?.Desc ==
                                                          e.Desc
                                                      ? AppConfigs.primaryColor
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
                                child: Text(
                                  '${'source_of_income'.tr} *',
                                  style: TS.f16.copyWith(
                                      color: transferController.isDark
                                          ? AppConfigs.g8f
                                          : AppConfigs.g4),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              customDropdown<MasterResponseFZ>(
                                  key: transferController.sourceDropdownKey,
                                  // buttonHeight: 46,
                                  top: 5,
                                  value: transferController.selectedSource,
                                  error: transferController.sourceError,
                                  borderRadius: 10,
                                  disableBorder: true,
                                  fillColor: AppConfigs.primaryColor
                                      .withValues(alpha: 0.1),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: transferController.selectedSource ==
                                            null
                                        ? null
                                        : AppConfigs.primaryColor,
                                  ),
                                  items: transferController.sources
                                      .map((e) =>
                                          DropdownMenuItem<MasterResponseFZ>(
                                            value: e,
                                            child: Text(
                                              e.Desc,
                                              textAlign: TextAlign.start,
                                              style: TS.f14.copyWith(
                                                  color: transferController
                                                              .selectedSource
                                                              ?.Desc ==
                                                          e.Desc
                                                      ? AppConfigs.primaryColor
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
              BottomButtons.sendMoneyNext,
            ],
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
