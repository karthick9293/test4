import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/masters/master_response_fz.dart';
import 'package:mobiremit/core/models/formatter.dart';

class CashPickUpServicePage extends StatelessWidget {
  final c = Get.put(BeneficiaryController());

  CashPickUpServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferController>(builder: (transferController) {
      return Column(
        children: [
          lightBlueTile(
              name: transferController.selectedBeneficiary!.firstName,
              contents: [
                transferController.selectedBeneficiary!.serviceType?.Code == 'C' ? 'Cash Pickup' : 'Wallet Transfer',
                '${cms(Fields.MyBeneficiary_Country).textHeading!}:${transferController.selectedBeneficiary!.country?.Desc ?? '-'}',
                '${cms(Fields.MyTransaction_SendingAmount).textHeading!}:${(double.tryParse(transferController.fromAmountCtrl.text) ?? 0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ${transferController.fromAmtCur}'
              ],
              allowEdit: false,
              currency: transferController.fromAmtCur),
          Expanded(
              child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.only(left: S.p, top: 20, right: S.p),
                child: Text('${'purpose_of_sending_money'.tr} *',
                    style: TextStyles.font12.copyWith(color: transferController.isDark ? AppConfigs.g8f : AppConfigs.g4), textAlign: TextAlign.start),
              ),
              customDropdown<MasterResponseFZ>(
                  top: 5,
                  value: transferController.selectedPurpose,
                  error: transferController.purposeError,
                  items: transferController.purposes
                      .map((e) => DropdownMenuItem<MasterResponseFZ>(
                            value: e,
                            child: Text(
                              e.Desc,
                              textAlign: TextAlign.start,
                              style: TS.f16.copyWith(color: transferController.isDark ? AppConfigs.w : AppConfigs.g4),
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
              errorText(transferController.purposeError ? 'required'.tr : ''),
              Padding(
                padding: EdgeInsets.only(left: S.p, top: 10, right: S.p),
                child: Text('${'source_of_income'.tr} *',
                    style: TextStyles.font12.copyWith(color: transferController.isDark ? AppConfigs.g8f : AppConfigs.g4), textAlign: TextAlign.start),
              ),
              customDropdown<MasterResponseFZ>(
                  top: 5,
                  value: transferController.selectedSource,
                  error: transferController.sourceError,
                  items: transferController.sources
                      .map((e) => DropdownMenuItem<MasterResponseFZ>(
                            value: e,
                            child: Text(
                              e.Desc,
                              textAlign: TextAlign.start,
                              style: TS.f16.copyWith(color: transferController.isDark ? AppConfigs.w : AppConfigs.g4),
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
              errorText(transferController.sourceError ? 'required'.tr : ''),
              Padding(
                padding: EdgeInsets.only(left: S.p, top: 20, right: S.p),
                child: Text('add_note'.tr + 'optional'.tr,
                    style: TextStyles.font12.copyWith(color: transferController.isDark ? AppConfigs.g8f : AppConfigs.g4), textAlign: TextAlign.start),
              ),
              Container(
                height: 80,
                margin: EdgeInsets.fromLTRB(S.p, 5, S.p, 20),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: const Color(0xffd9d7d7)),
                    color: transferController.isDark ? AppConfigs.g21 : AppConfigs.w),
                child: TextField(
                    maxLines: null,
                    textAlign: TextAlign.start,
                    style: TS.f16.copyWith(color: transferController.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        // hintText: 'sending_for_family_expenses'.tr,
                        contentPadding: const EdgeInsets.all(15),
                        hintStyle: TextStyles.font14)),
              )
            ],
          )),
        ],
      );
    });
  }
}

