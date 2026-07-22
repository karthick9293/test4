import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../models/beneficiary/beneficiary_fz.dart';
import '../../../../network/api_service_new.dart';

class ViewBeneficiaryPageTheme1 extends StatelessWidget {
  final BeneficiaryFz beneficiary;
  final bool fromSendMoney;

  const ViewBeneficiaryPageTheme1(
      {super.key, required this.beneficiary, this.fromSendMoney = false});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return GetBuilder<BeneficiaryController>(builder: (beneficiaryController) {
      late BeneficiaryFz b;
      late int index;
      if (fromSendMoney) {
        b = Get.find<TransferController>().selectedBeneficiary!;
      } else {
        index = beneficiaryController.benefs.indexWhere(
          (e) => e.id == beneficiary.id,
        );
        b = beneficiaryController.benefs[index];
      }

      bool isFav = b.fav == 'Y';

      return Column(
        children: [
          AppbarUiTwo(
            title: cms(Fields.ViewBeneficary_PageHeading).textHeading!,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border:
                    Border.all(color: AppConfigs.primaryColor.withAlpha(30)),
                borderRadius: BorderRadius.circular(14),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppConfigs.primaryColor.withAlpha(30),
                            ),
                            child: Center(
                              child: Text(
                                getShortName(b.name ?? ''),
                                style: TS.f16.copyWith(
                                  color: AppConfigs.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            b.name ?? '',
                            style: TS.f18B,
                          ),
                          Spacer(),
                          Visibility(
                            visible: isFav,
                            child: SvgPicture.asset(
                              ImagePath.bi2,
                              height: 14,
                              width: 16,
                              colorFilter: ColorFilter.mode(
                                AppConfigs.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...tableChildren(b, beneficiaryController),
                    moreBeneficiaryDetails(b),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: b.active == 'A' && !fromSendMoney,
            child: roundButton(
              cms(Fields.MyBeneficiary_SendMoney).textHeading!,
              onTap: () async {
                if (b.active == 'A') {
                  Get.find<MainController>().push(
                      AppConfigs.sendMoney(key: UniqueKey()),
                      AppBars.sendMoney);
                  TransferController transferController = Get.put(
                      TransferController(transferType: TransferType.all))
                    ..selectedBeneficiary = b
                    ..sourcePurposeVisibility = false
                    ..toAmtCur = b.serviceCurrency!.Code
                    ..updateToCurrency(s: b.serviceCurrency!.Code, type: 'L');

                  await transferController.resetTransferForm();
                }
              },
            ),
          ),
          roundButton(
            '',
            borderOnly: true,
            isLoading: isLoading,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isFav ? 'Remove From' : 'Add to',
                  style: TS.f16.copyWith(color: ConstColors.primary),
                ),
                SizedBox(width: 5),
                SvgPicture.asset(
                  ImagePath.bi2,
                  height: 16,
                  width: 18,
                  colorFilter: ColorFilter.mode(
                    AppConfigs.primaryColor,
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
            onTap: () async {
              isLoading = true;
              beneficiaryController.update();
              if (await ApiService()
                  .beneficiarytasks(b.id!.toString(), isFav ? "N" : "Y")) {
                if (fromSendMoney) {
                  Get.find<TransferController>().selectedBeneficiary =
                      Get.find<TransferController>()
                          .selectedBeneficiary!
                          .copyWith(fav: isFav ? 'N' : 'Y');
                } else {
                  beneficiaryController.benefs[index] = beneficiaryController
                      .benefs[index]
                      .copyWith(fav: isFav ? 'N' : 'Y');
                  Get.find<DataController>()
                    ..beneficiaries = beneficiaryController.benefs.toList()
                    ..restoreBeneficiaries()
                    ..update();
                }
                b = b.copyWith(fav: isFav ? 'N' : 'Y');
              }
              isLoading = false;
              beneficiaryController.update();
            },
          ),
        ],
      );
    });
  }

  List<Widget> tableChildren(
      BeneficiaryFz b, BeneficiaryController benfContrl) {
    final contents = b.serviceType?.Code == 'B'
        ? [
            '${cms(Fields.MyTransaction_AccountNo).textHeading!}:${(b.accountNumber?.isNotEmpty ?? false) ? b.accountNumber : '-'}',
            '${cms(Fields.MyTransaction_BankName).textHeading!}:${(b.bank?.Desc.isNotEmpty ?? false) ? b.bank?.Desc : '-'}',
            // '${'DOB'.tr}: ${DateFormatter.format(b.dateOfBirth, 'dd/mm/yyyy') ?? '-'}',//Removed as per RMA -316
            '${cms(Fields.MyTransaction_BranchName).textHeading!}: ${(b.branch?.Desc.isNotEmpty ?? false) ? b.branch!.Desc : '-'}',
            '${cms(Fields.MyTransaction_RelationShip).textHeading!}: ${(b.relationship?.Desc.isNotEmpty ?? false) ? b.relationship?.Desc : '-'}',
          ]
        : b.serviceType?.Code == 'C'
            ? [
                'CASH TRANSFER',
                // '${'DOB'.tr}: ${DateFormatter.format(b.dateOfBirth, 'dd/mm/yyyy')}',
                '${cms(Fields.MyBeneficiary_Country).textHeading!}: ${(b.country?.Desc.isNotEmpty ?? false) ? b.country?.Desc : '-'}',
                '${cms(Fields.MyTransaction_RelationShip).textHeading!}: ${(b.relationship?.Desc.isNotEmpty ?? false) ? b.relationship?.Desc : '-'}',
              ]
            : [
                'WALLET TRANSFER',
                '${cms(Fields.MyTransaction_BankName).textHeading!}: ${(b.bank?.Desc.isNotEmpty ?? false) ? b.bank?.Desc : '-'}',
                '${cms(Fields.MyTransaction_BranchName).textHeading!}: ${(b.branch?.Desc.isNotEmpty ?? false) ? b.branch?.Desc : '-'}',
                '${cms(Fields.MyBeneficiary_Country).textHeading!}: ${(b.country?.Desc.isNotEmpty ?? false) ? b.country?.Desc : '-'}',
                '${cms(Fields.MyTransaction_RelationShip).textHeading!}: ${(b.relationship?.Desc.isNotEmpty ?? false) ? b.relationship?.Desc : '-'}',
              ];
    return contents
        .where((c) => c.contains(':'))
        .map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(children: [
              Expanded(
                child: Text(
                  e.contains(':') ? e.split(':')[0] : e,
                  style: TS.f16.copyWith(
                    color: benfContrl.isDark ? AppConfigs.g8f : AppConfigs.g4,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 2.7),
                child: Text(
                  e.contains(':') ? e.split(':')[1].trim() : '',
                  style: TS.f16.copyWith(
                    color: benfContrl.isDark ? AppConfigs.g8f : AppConfigs.g4,
                  ),
                ),
              )
            ]),
          ),
        )
        .toList();
  }
}
