import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';

class TrackTransactionsPage extends StatelessWidget {
  TrackTransactionsPage({super.key, this.fromPrelogin = false});

  final bool fromPrelogin;
  final int? length = Box3.settings.currencyDecimalLength;

  Widget contentTile(String t1, String t2, {bool isIcon = false}) {
    return GetBuilder<AccountController>(builder: (accountController) {
      return SizedBox(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t1, style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.gd7 : AppConfigs.g4)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: t1 == "Txn Reference number: ".tr,
                    child: GestureDetector(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(text: t2));
                          Get.snackbar('Alert', 'Txn Reference number copied to clipboard', duration: const Duration(seconds: 1));
                        },
                        child: const Icon(Icons.copy, size: 14)),
                  ),
                  Visibility(
                    visible: isIcon,
                    child: SvgPicture.asset(
                      ImagePath.transactionDone,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Expanded(
                    flex: t1 == "Txn Reference number: ".tr || isIcon ? 0 : 1,
                    child: SelectableText(
                      t2,
                      textAlign: TextAlign.end,
                      maxLines: 2,
                      style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.gd7 : AppConfigs.bf0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.find<AccountController>().clearTrackData();
    // accountController.clearTrackData();
    return GetBuilder<AccountController>(builder: (accountController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        appBar: fromPrelogin ? appBar0('Track Remittance'.tr, onTap2: Get.back) : null,
        body: Container(
          decoration: BoxDecoration(
              gradient: accountController.isDark?null:AppConfigs.linearGradientUiSix
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: ConstColors.grey70.withOpacity(0.1)))),
                child: Row(
                  children: [
                    Expanded(
                      child: textFormField(
                        // inputFormatters: InputFormatter.phoneNumber,
                        keyboardType: TextInputType.text,
                        right: 6,
                        left: 0,
                        top: 0,
                        hintText: 'Search Ref No'.tr,
                        controller: accountController.refSearchController,
                        onChanged: (s) async {
                          if (s.isNotEmpty == true) {
                            accountController
                              ..refErrorText = ''
                              ..update();
                          }
                        },
                        trailing: GestureDetector(
                          onTap: () {
                            if (accountController.refSearchController.text.isNotEmpty == true) {
                              accountController.trackRemittanceByRef(accountController.refSearchController.text);
                            } else {
                              accountController.refErrorText = 'required'.tr;
                              accountController.update();
                            }
                          },
                          child: Container(
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4)),
                              color: AppConfigs.primaryColor,
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              ImagePath.search,
                              height: 20,
                              width: 20,
                              colorFilter: ColorFilter.mode(accountController.isDark ? AppConfigs.w : AppConfigs.w, BlendMode.srcIn),
                            ),
                          ),
                        ),
                        errorText: accountController.refErrorText.isNotEmpty == true ? accountController.refErrorText : '',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: accountController.trackLoader == true
                    ? Center(child: loader())
                    : accountController.trackRemResult != null && !accountController.trackRemResult!.isSuccess
                        ? Center(
                            child: Text(
                              accountController.trackRemResult!.error?.MessageDescription ?? 'No data Found.',
                              style: TS.f18.copyWith(color: AppConfigs.accentColor),
                            ),
                          )
                        : Visibility(
                            visible: accountController.trackRemittanceData != null,
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 25,
                                right: 25,
                              ),
                              child: ListView(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                children: [
                                  // ----------- Transaction details --------------
                                  SizedBox(height: 12),
                                  Text(
                                    'transaction_details'.tr,
                                    style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.primaryColor),
                                    textAlign: TextAlign.start,
                                  ),

                                  const SizedBox(height: 15),
                                  contentTile('Payment Status'.tr, accountController.trackRemittanceData?.transactionStatus ?? '',
                                      isIcon: accountController.trackRemittanceData?.transactionStatus?.toLowerCase().contains('success') == true),
                                  contentTile(
                                    'date_time'.tr,
                                    DateFormatter.newFormat(accountController.trackRemittanceData?.transactionDate?.toLocal(), 'dd/MM/yyyy hh:mm a'),
                                  ),

                                  // ------------ Enquiry Details -----------
                                  if (accountController.enquiryData != null) ...[
                                    SizedBox(height: 50),
                                    Text(
                                      'Enquiry Status Details:'.tr,
                                      style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.primaryColor),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 15),
                                    contentTile(
                                      'Current Status'.tr,
                                      accountController.enquiryData!.enquiryStatus,
                                    ),
                                    contentTile(
                                      'Remarks'.tr,
                                      accountController.enquiryData!.remarks,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
