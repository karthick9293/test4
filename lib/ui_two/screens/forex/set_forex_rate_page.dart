import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/editing_controllers.dart/attributes.dart';
import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/exports/ui_two_pages.dart';
import '../../../core/flavours/constants.dart';
import '../../../models/custom_message/custom_message_details_fz.dart';
import '../../../network/api_service_new.dart';
import '../../../ui_one/custom_widgets/error_alert.dart';

class SetForexRatePage extends GetView {
  SetForexRatePage({super.key});

  DateTime now = DateTime.now();

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    final AccountController acContrl = Get.find<AccountController>();
    acContrl.fBA = ForexBookingAttributes();

    acContrl
      ..fBA?.clear()
      ..getRateOnAlert(false, isFirst: true);

    acContrl.getRates();
    return GetBuilder<AccountController>(builder: (accountController) {
      return SafeArea(
          child: Material(
        color: accountController.isDark ? AppConfigs.b : AppConfigs.w,
        child: ListView(
          children: [
            Column(
              children: [
                // Container(
                //   margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                //   child: Text(
                //       cms(Fields.ForexBooking_ForexBookingHeader).textHeading!,
                //       style: TS.f12.copyWith(
                //         color: accountController.isDark
                //             ? AppConfigs.w
                //             : AppConfigs.bf0,
                //       ),
                //       textAlign: TextAlign.start),
                // ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  padding: const EdgeInsets.fromLTRB(0, 13, 0, 20),
                  // height: 89,
                  decoration: BoxDecoration(
                    boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 6, spreadRadius: 0)],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: accountController.isDark ? const Color(0xff00101d) : const Color(0xfff8f8f8),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(cms(Fields.ForexBooking_CurrencyYouHave).textHeading!,
                                    style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4),
                                    textAlign: TextAlign.start),
                                Text(cms(Fields.ForexBooking_ForexBookingCurrency).textHeading!,
                                    style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4),
                                    textAlign: TextAlign.start),
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
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Center(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    currencyFlag(accountController.remittanceAttributes.fromCurrency?.Code ??
                                                        Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ??
                                                        ''),
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      accountController.remittanceAttributes.fromCurrency?.Code ??
                                                          Box3.companyDataFZ?.companySettings?.primaryBaseCurrency ??
                                                          '',
                                                      style: TS.f13.copyWith(color: AppConfigs.w),
                                                      textAlign: TextAlign.center),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 58),
                                          Expanded(
                                              child: CurrencyDropdownDashboard(
                                            value: accountController.remittanceAttributes.toCurrency,
                                            crItems: accountController.currencies
                                                .where((c) => (c.Code != Box3.companyDataFZ?.companySettings?.primaryBaseCurrency))
                                                .toList(),
                                            onChanged: (c) async {
                                              accountController
                                                ..remittanceAttributes.toCurrency = c
                                                ..update();
                                              await accountController.getRateOnAlert(true);
                                            },
                                            textColor: AppConfigs.w,
                                            height: 50,
                                          )),
                                          const SizedBox(width: 8),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 58,
                                  width: 58,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: AppConfigs.accentColor, width: 3),
                                      borderRadius: BorderRadius.all(Radius.circular(29))),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    ImagePath.exchange,
                                    colorFilter: ColorFilter.mode(AppConfigs.accentColor, BlendMode.srcIn),
                                    height: 20,
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      textFormField(
                          labelText: 'forex_amount'.tr,
                          controller: accountController.fBA!.amount,
                          errorText: accountController.fBA!.amountError,
                          inputFormatters: [decimalFormatter()],
                          textInputAction: TextInputAction.done,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
                          onChanged: (v) {
                            if (accountController.fBA!.amountError.isNotEmpty && v.isNotEmpty) {
                              accountController
                                ..fBA!.amountError = ''
                                ..update();
                            }
                          }),
                      dateField(
                          ctrls: accountController.fBA!.forexDateCtrls,
                          nodes: accountController.fBA!.forexDateNodes,
                          error: accountController.fBA!.forexDateError,
                          update: accountController.update,
                          topMargin: 0,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 1)),
                          erfc: (b, {DateTime? date}) {
                            //TODO: Handle age limit here
                            accountController.fBA!.forexDateError = b ? '' : 'Invalid_date'.tr;
                            accountController.update();
                          },
                          onComplete: () {},
                          context: context,
                          title: cms(Fields.ForexBooking_WhenYouWishToExecuteTransaction).textHeading!),
                      textFormField(
                          cHeight: 60,
                          left: 20,
                          right: 20,
                          controller: accountController.fBA!.remarks,
                          hintText: cms(Fields.ForexBooking_Remarks).textHeading!,
                          textInputAction: TextInputAction.done,
                          onChanged: (s) {},
                          errorText: ''),
                    ],
                  ),
                ),
                if (cms(Fields.ForexBooking_RateMessage).status?.toLowerCase() == "a")
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(color: AppConfigs.accentColor.withAlpha(30), borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        cms(Fields.ForexBooking_RateMessage).textHeading!,
                        style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                      ),
                    ),
                    // child: Text("Content to reflect that exchange rates will fluctuate, and the booking duration should be for five hours instead of two days"),
                  ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Checkbox(
                                value: accountController.fBA!.acceptTAndC,
                                activeColor: AppConfigs.rg,
                                onChanged: (b) => accountController
                                  ..fBA!.acceptTAndC = b ?? false
                                  ..fBA!.tAndCError = ''
                                  ..fBA
                                  ..update()),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.to(
                                () => Scaffold(
                                    backgroundColor: AppConfigs.bodybg(accountController.isDark),
                                    body: const TermsAndConditionsPage(isPreLogin: true)),
                              ),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        style: TS.f14.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                                        text: '${cms(Fields.ForexBooking_IHaveRead).textHeading!} '),
                                    TextSpan(
                                      style: TS.f14.copyWith(color: AppConfigs.primaryColor),
                                      text: cms(Fields.ForexBooking_TermsAndConditions).textHeading!,
                                    )
                                  ],
                                ),
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ],
                      ),
                      errorText(accountController.fBA!.tAndCError),
                    ],
                  ),
                ),
              ],
            ),
            accountController.fBA!.isLoading
                ? loader()
                : roundButton(cms(Fields.ForexBooking_CreateBookingButton).textHeading!, bottom: 20, onTap: () async {
                    bool status = accountController.validateForexBooking();
                    accountController.update();
                    if (status) {
                      accountController
                        ..fBA!.isLoading = true
                        ..update();
                      CustomMessageDetailsFZ? customMsgDetails = await ApiService().setForexRate(
                          currencyCode: accountController.remittanceAttributes.toCurrency?.Code ?? "INR",
                          amount: accountController.fBA!.amount.text,
                          date: DateFormat("dd/MMM/yyyy")
                              .format(DateTime(int.parse(accountController.fBA!.forexDateCtrls[2].text),
                                  int.parse(accountController.fBA!.forexDateCtrls[1].text), int.parse(accountController.fBA!.forexDateCtrls[0].text)))
                              .toString(),
                          remarks: accountController.fBA!.remarks.text,
                          createdBy: Box3.customerDetailsFZ?.data?.userName ?? '');
                      accountController
                        ..fBA!.isLoading = false
                        ..update();

                      accountController.fBA!.amount.text = '';
                      accountController.fBA!.remarks.text = '';
                      accountController.fBA!.forexDateCtrls[2].text = '';
                      accountController.fBA!.forexDateCtrls[1].text = '';
                      accountController.fBA!.forexDateCtrls[0].text = '';
                      accountController.fBA!.acceptTAndC = false;
                      accountController.update();

                      if (customMsgDetails != null) {
                        customMsgDetails.MessageType == 'SUCCESS'
                            ? showSuccessAlert(
                                title: customMsgDetails.MessageHeader,
                                content: customMsgDetails.MessageDescription,
                                function: () {
                                  Get.back();
                                },
                              )
                            : errorAlert(
                                title: customMsgDetails.MessageHeader,
                                content: customMsgDetails.MessageDescription,
                                function: () {
                                  Get.back();
                                },
                              );
                      }
                    } else {
                      accountController
                        ..fBA!.isLoading = false
                        ..update();
                    }
                  }),
          ],
        ),
      ));
    });
  }
}
