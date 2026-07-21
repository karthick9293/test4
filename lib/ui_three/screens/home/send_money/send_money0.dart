import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:mobiremit/network/api_endpoints.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_three_custom_widgets.dart';
import '../../../../core/exports/ui_three_pages.dart';
import '../../../../core/flavours/constants.dart';

class SendMoneyPage0 extends StatelessWidget {
  const SendMoneyPage0({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferController>(builder: (transferController) {
      return KeyboardActions(
        // isDialog: widget.isDialog,
        config: transferController.keyboardConfig(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  // transferController.fromBeneficiary != null
                  //     ? Column(
                  //         children: [
                  //           lightBlueTile(
                  //               name: transferController.fromBeneficiary!.name,
                  //               visible: false,
                  //               contents: [
                  //                 transferController.selectedBeneficiary!.type == 'BANK TRANSFER'
                  //                     ? transferController.selectedBeneficiary!.bankName!
                  //                     : 'Cash Transfer',
                  //                 transferController.selectedBeneficiary!.maskedAccNo ??
                  //                     'XXXX XXXX 2334',
                  //                 //TODO: Get beneficiary location from API if available
                  //               ]),
                  //           Visibility(
                  //               visible: transferController.viewMoreDeails,
                  //               child: moreBeneficiaryDetails(
                  //                   transferController.selectedBeneficiary!)),
                  //           GestureDetector(
                  //             onTap: () => transferController
                  //               ..viewMoreDeails = !transferController.viewMoreDeails
                  //               ..update(),
                  //             child: DottedBorder(
                  //               dashPattern: const [3, 3],
                  //               padding: EdgeInsets.zero,
                  //               color: ConstColors.grey70,
                  //               child: Container(
                  //                 width: 428,
                  //                 height: 30,
                  //                 color:
                  //                     const Color(0xffeeeeee).withOpacity(0.36),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   children: [
                  //                     Text(
                  //                       transferController.viewMoreDeails
                  //                           ? 'Hide More Details'
                  //                           : 'view_more'.tr,
                  //                       style: TS.f12.copyWith(
                  //                           color: transferController.isDark
                  //                               ? AppConfigs.w
                  //                               : AppConfigs.g4),
                  //                     ),
                  //                     const SizedBox(width: 4),
                  //                     RotatedBox(
                  //                       quarterTurns: transferController.viewMoreDeails ? 0 : 2,
                  //                       child: SvgPicture.asset(
                  //                         ImagePath.downArrow,
                  //                         width: 10,
                  //                         height: 6,
                  //                         colorFilter: ColorFilter.mode(
                  //                             transferController.isDark
                  //                                 ? AppConfigs.w
                  //                                 : AppConfigs.g4,
                  //                             BlendMode.srcIn),
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       )
                  //     : const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: Text(cms(Fields.SendMoney_SendAmount).textHeading!,
                        style: TS.f14.copyWith(
                            color: transferController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.g4),
                        textAlign: TextAlign.start),
                  ),
                  textFormField(
                    top: 5,
                    hintText: 'enter_amount'.tr,
                    controller: transferController.fromAmountCtrl,
                    keyboardType: TextInputType.number,
                    focusNode: transferController.fromAmountNode,
                    errorText: transferController.fromAmtErr,
                    inputFormatters: [decimalFormatter()],
                    onChanged: (s) async {
                      if (s.isNotEmpty) {
                        transferController
                          ..fromAmtErr = ''
                          ..update();
                        await transferController.updateToCurrency(
                            s: s, type: 'L');
                      } else {
                        transferController.toAmountCtrl.clear();
                      }
                    },
                    trailing: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        color: const Color(0xFFF8F8F8),
                        margin: const EdgeInsets.all(1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 12),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                currencyFlag(APIConstants.currency),
                                height: 20,
                                width: 20,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(APIConstants.currency,
                                style: TS.f16.copyWith(
                                    color: transferController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.bf0,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(cms(Fields.SendMoney_ReceiverGets).textHeading!,
                        style: TS.f14.copyWith(
                            color: transferController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.g4),
                        textAlign: TextAlign.start),
                  ),
                  //TODO: Add indicative rate
                  textFormField(
                    top: 5,
                    focusNode: transferController.toAmountNode,
                    hintText: 'enter_amount'.tr,
                    controller: transferController.toAmountCtrl,
                    inputFormatters: [decimalFormatter()],
                    onChanged: (s) async {
                      if (s.isNotEmpty) {
                        transferController
                          ..fromAmtErr = ''
                          ..update();
                        await transferController.updateToCurrency(
                            s: s, type: 'F');
                      } else {
                        transferController.fromAmountCtrl.clear();
                      }
                    },
                    keyboardType: TextInputType.number,
                    trailing: transferController.selectedBeneficiary != null
                        ? SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              color: const Color(0xFFF8F8F8),
                              margin: const EdgeInsets.all(0.1),
                              child: Row(
                                children: [
                                  const SizedBox(width: 12),
                                  SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                      currencyFlag(transferController
                                          .selectedBeneficiary!
                                          .serviceCurrency!
                                          .Code),
                                      height: 20,
                                      width: 20,
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
                                      textAlign: TextAlign.start),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            color: const Color(0xffe8e8e8).withOpacity(0.47),
                            child: CurrencyDropdownDashboard(
                              value: Get.find<AccountController>().toCur,
                              crItems: Get.find<AccountController>()
                                  .dashboardCurrencies,
                              onChanged: (v) async {
                                transferController
                                  ..toAmtCur = v?.id
                                  ..selectedBeneficiary = null
                                  ..update();
                                if (transferController
                                    .fromAmountCtrl.text.isNotEmpty) {
                                  await transferController.updateToCurrency(
                                      s: transferController.fromAmountCtrl.text,
                                      type: 'L');
                                }
                              },
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: Text('Note_This_is_an_indicative_rates_only'.tr,
                        style: TS.f12.copyWith(
                            color: transferController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.g4.withOpacity(0.5)),
                        textAlign: TextAlign.start),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('send_to'.tr,
                            style: TextStyles.font12.copyWith(
                                color: transferController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.g4),
                            textAlign: TextAlign.start),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => transferController
                                ..isBenef = false
                                ..update(),
                              child: Container(
                                width: 145,
                                height: 33,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x29000000),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                          spreadRadius: 0)
                                    ],
                                    color: !transferController.isBenef
                                        ? AppConfigs.primaryColor
                                        : transferController.isDark
                                            ? const Color(0xFF232222)
                                            : const Color(0xFFf4f4f4)),
                                alignment: Alignment.center,
                                child: Text("Recent_Transactions".tr,
                                    style: TS.f12.copyWith(
                                        color: !transferController.isBenef ||
                                                transferController.isDark
                                            ? AppConfigs.w
                                            : AppConfigs.g4),
                                    textAlign: TextAlign.start),
                              ),
                            ),
                            Visibility(
                              // visible: transferController.fromBeneficiary == null,
                              visible: true,
                              child: GestureDetector(
                                onTap: () => transferController
                                  ..isBenef = true
                                  ..update(),
                                child: Container(
                                  width: 145,
                                  height: 33,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(10)),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color(0x29000000),
                                            offset: Offset(0, 3),
                                            blurRadius: 6,
                                            spreadRadius: 0)
                                      ],
                                      color: transferController.isBenef
                                          ? AppConfigs.primaryColor
                                          : transferController.isDark
                                              ? const Color(0xFF232222)
                                              : const Color(0xFFF4F4F4)),
                                  alignment: Alignment.center,
                                  child: Text("Favourite_beneficiaries".tr,
                                      style: TS.f12.copyWith(
                                          color: transferController.isBenef ||
                                                  transferController.isDark
                                              ? AppConfigs.w
                                              : AppConfigs.g4),
                                      textAlign: TextAlign.start),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: transferController.isDark
                                      ? AppConfigs.b14
                                      : const Color(0xffeeeeee),
                                  width: 1),
                              color: transferController.isDark
                                  ? AppConfigs.b14
                                  : Colors.white),
                          child: transferController.listLoading
                              ? loader(top: 80, bottom: 80)
                              : Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 10),
                                      child: Row(
                                        children: [
                                          Visibility(
                                            visible: transferController.isBenef,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: SvgPicture.asset(
                                                    ImagePath.bi2)),
                                          ),
                                          Text(
                                              transferController.isBenef
                                                  ? 'Select_Your_favourite_Beneficiary'
                                                      .tr
                                                  : 'Select_recent_beneficiaries'
                                                      .tr,
                                              style: TS.f12.copyWith(
                                                  color:
                                                      transferController.isDark
                                                          ? AppConfigs.g8f
                                                          : AppConfigs.g4),
                                              textAlign: TextAlign.start),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              Get.put(
                                                  AddBeneficiaryController());
                                              Get.find<MainController>().push(
                                                  const AddBeneficiaryFormRules(),
                                                  AppBars.addBeneficiary);
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    SvgIcons.addBeneficiary,
                                                    height: 11,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                            AppConfigs
                                                                .primaryColor,
                                                            BlendMode.srcIn),
                                                  ),
                                                  const SizedBox(width: 3),
                                                  Text('add_beneficiary'.tr,
                                                      style: TextStyles.font12
                                                          .copyWith(
                                                              color: AppConfigs
                                                                  .primaryColor),
                                                      textAlign:
                                                          TextAlign.start),
                                                  const SizedBox(width: 8),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 203,
                                      child: (transferController.isBenef &&
                                                  transferController
                                                      .filteredBenefs
                                                      .isEmpty) ||
                                              ((!transferController.isBenef) &&
                                                  transferController
                                                      .transactions.isEmpty)
                                          ? Center(
                                              child:
                                                  Text('No_records_found'.tr))
                                          : ListView.builder(
                                              physics:
                                                  const ClampingScrollPhysics(),
                                              itemCount:
                                                  transferController.isBenef
                                                      ? transferController
                                                          .filteredBenefs.length
                                                      : transferController
                                                                  .transactions
                                                                  .length >
                                                              5
                                                          ? 5
                                                          : transferController
                                                              .transactions
                                                              .length,
                                              itemBuilder: (c, i) {
                                                return transferController
                                                        .isBenef
                                                    ? beneficiaryTile1(i,
                                                        beneficiary:
                                                            transferController
                                                                .filteredBenefs[i])
                                                    : Visibility(
                                                        visible:
                                                            // (transferController.fromBeneficiary !=
                                                            //             null
                                                            //         ?
                                                            //          transferController
                                                            //                 .transactions[
                                                            //                     i]
                                                            //                 .beneficiaryId ==
                                                            //             transferController.fromBeneficiary!
                                                            //                 .id
                                                            //         : true) &&
                                                            (transferController
                                                                    .searchBenefController
                                                                    .text
                                                                    .isNotEmpty
                                                                ? transferController
                                                                    .transactions[
                                                                        i]
                                                                    .beneficiaryName!
                                                                    .toLowerCase()
                                                                    .contains(transferController
                                                                        .searchBenefController
                                                                        .text
                                                                        .toLowerCase())
                                                                : true),
                                                        child: transactionTile(
                                                            selected: transferController
                                                                    .transactions[
                                                                        i]
                                                                    .transactionReference ==
                                                                transferController
                                                                    .selectedTransaction
                                                                    ?.transactionReference,
                                                            transaction:
                                                                transferController
                                                                        .transactions[
                                                                    i],
                                                            hide: true,
                                                            onTap: () =>
                                                                transferController
                                                                    .setBenefFromTxn(
                                                                        transferController
                                                                            .transactions[i])),
                                                      );
                                              }),
                                    ),
                                  ],
                                ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          alignment: Alignment.center,
                          child: Text('or'.tr,
                              style: TS.f12.copyWith(
                                color: AppConfigs.g4,
                              )),
                        ),
                      ],
                    ),
                  ),
                  textFormField(
                    hintText: 'search_beneficiary_name'.tr,
                    controller: transferController.searchBenefController,
                    bottom: 20,
                    onChanged: (v) {
                      transferController
                        ..filteredBenefs = transferController.benefs
                            .where((e) =>
                                (transferController
                                        .searchBenefController.text.isNotEmpty
                                    ? e.firstName!.toLowerCase().contains(
                                        transferController
                                            .searchBenefController.text
                                            .toLowerCase())
                                    : true) &&
                                ((e.serviceType?.Code ==
                                        ServiceType.CASH_PICKUP) ||
                                    (e.serviceType?.Code ==
                                        ServiceType.BANK_TRANSFER)))
                            .toList()
                        ..update();
                    },
                    trailing: const Icon(
                      Icons.search,
                      color: Color(0xffd1d1d1),
                    ),
                  ),
                  // roundButton(
                  //   'next'.tr,
                  //   onTap: () {
                  //     double d = double.tryParse(transferController.fromAmountCtrl.text) ?? 0;
                  //     if (d == 0) {
                  //       transferController
                  //         ..fromAmtErr = 'Amount Should be greater than 0'
                  //         ..update();
                  //     } else if (transferController.selectedBeneficiary == null) {
                  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //         content: Text('Select Beneficiary'),
                  //         backgroundColor: Colors.redAccent,
                  //       ));
                  //     } else {
                  //       Get.find<MainController>().push(
                  //           transferController.selectedBeneficiary?.type == 'Cash Transfer'
                  //               ? const CashPickUpServicePage()
                  //               : const BankTransferServicePage());
                  //     }
                  //   },
                  // )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
