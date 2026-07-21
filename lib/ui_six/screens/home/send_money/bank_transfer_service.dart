import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/masters/master_response_fz.dart';
import '../../../../core/models/formatter.dart';
import '../../form_rules_form/add_beneficiary_form_rules.dart';

class BankTransferServicePage extends StatelessWidget {
  BankTransferServicePage({super.key});

  final c = Get.put(BeneficiaryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransferController>(builder: (transferController) {
      return Column(
        children: [
          Expanded(
              child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(left: 30, top: 30, bottom: 6),
              //   child: Text('you_send'.tr,
              //       style: TextStyles.font12.copyWith(
              //           color: transferController.isDark ? AppConfigs.g8f : AppConfigs.g4),
              //       textAlign: TextAlign.start),
              // ),
              lightBlueTile(
                  name: transferController.selectedBeneficiary!.name,
                  onEdit: () {
                    Get.put(EditBeneficiaryController())
                      ..benefAttributes.editBeneficiary(transferController.selectedBeneficiary!)
                      ..update();
                    Get.find<MainController>().push(const AddBeneficiaryFormRules(), AppBars.editBeneficiary);
                  },
                  allowEdit: false,
                  contents: [
                    '${'account_no'.tr}${transferController.selectedBeneficiary!.accountNumber}',
                    '${'bank_name'.tr}${transferController.selectedBeneficiary!.bank?.Desc}',
                    '${'Branch: '.tr}${transferController.selectedBeneficiary!.branch?.Desc ?? '-'}',
                    '${"sending_amount".tr}${(double.tryParse(transferController.fromAmountCtrl.text) ?? 0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ${transferController.fromAmtCur}'
                    // 'Branch: Mallapuram, kerala'
                  ],
                  currency: transferController.fromAmtCur),
              Padding(
                padding: EdgeInsets.only(left: S.p, top: 20, right: S.p),
                child: Text('${'purpose_of_sending_money'.tr} *',
                    style: TextStyles.font12.copyWith(color: transferController.isDark ? AppConfigs.g8f : AppConfigs.g4), textAlign: TextAlign.start),
              ),
              customDropdown<MasterResponseFZ>(
                  top: 5,
                  items: transferController.purposes
                      .map(
                        (e) => DropdownMenuItem<MasterResponseFZ>(
                          value: e,
                          child: Text(
                            e.Desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TS.f14.copyWith(color: transferController.isDark ? AppConfigs.w : AppConfigs.g4),
                          ),
                        ),
                      )
                      .toList(),
                  value: transferController.selectedPurpose,
                  error: transferController.purposeError,
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
                  items: transferController.sources
                      .map((e) => DropdownMenuItem<MasterResponseFZ>(
                            value: e,
                            child: Text(
                              e.Desc,
                              style: TS.f16.copyWith(color: transferController.isDark ? AppConfigs.w : AppConfigs.g4),
                            ),
                          ))
                      .toList(),
                  value: transferController.selectedSource,
                  error: transferController.sourceError,
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
                  style: TS.f16.copyWith(color: transferController.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      // hintText: 'sending_for_family_expenses'.tr,
                      contentPadding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                      hintStyle: TextStyles.font14),
                  textInputAction: TextInputAction.done,
                ),
              )
            ],
          )),
        ],
      );
    });
  }
}
