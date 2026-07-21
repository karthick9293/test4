import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/beneficiary/beneficiary_fz.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../core/exports/ui_four_pages.dart';
import '../../../../core/exports/ui_four_shimmer.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/transaction_details/transaction_details_fz.dart';

class ViewBeneficiaryPage extends StatelessWidget {
  final int index;

  const ViewBeneficiaryPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeneficiaryController>(builder: (beneficiaryController) {
      DataController d = Get.find<DataController>();
      BeneficiaryFz b = beneficiaryController.benefs[index];
      /* => CoreBeneficiaryUID will be available only after the first txn of the beneficiary.
          otherwise it remains empty. */
      List<TransactionDetailsFz> transactions = d.transactions
          .where((tx) =>
              b.coreBeneficiaryUid?.isNotEmpty == true &&
              tx.bneficiaryId == b.coreBeneficiaryUid)
          .toList();

      return Column(
        children: [
          lightBlueTile(
            name: b.name!.removeExtraSpace(),
            isFav: b.fav == 'Y' && b.isCorrespondentActive == 'Y',
            isActive: b.active == 'A' && b.isCorrespondentActive == 'Y',
            loading: beneficiaryController.favIndex == index,
            contents: b.serviceType?.Code == 'B'
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
                      ],
            // contents: b.type == 'BANK TRANSFER'
            //     ? [
            //         '${'account_no'.tr}${b.maskedAccNo}',
            //         '${'bank_name'.tr}${b.bankName}',
            //         // '${'DOB'.tr}: ${DateFormatter.format(b.dateOfBirth, 'dd/mm/yyyy') ?? '-'}',//Removed as per RMA -316
            //         '${'Branch'.tr}: ${b.benfBranch ?? '-'}',
            //         '${'Relationship'.tr}: ${b.relationship ?? '-'}',
            //       ]
            //     : [
            //         'CASH TRANSFER',
            //         // '${'DOB'.tr}: ${DateFormatter.format(b.dateOfBirth, 'dd/mm/yyyy')}',
            //         '${'Country'.tr}: ${b.benfCountry ?? '-'}',
            //         '${'Relationship'.tr}: ${b.relationship ?? '-'}',
            //       ],
            index: index,
            switchValue:
                ((b.serviceType?.Code == 'C' || b.serviceType?.Code == 'W') &&
                        b.isCorrespondentActive == 'Y')
                    ? (b.active == 'A')
                    : b.serviceType?.Code == 'B'
                        ? (b.active == 'A')
                        : (b.active == 'A'),
            // switchValue: b.active == 'A' && b.isCorrespondentActive == 'Y',
            allowEdit: b.active == 'C' && (Box3.settings.enableEditBenf),
            onEdit: () {
              // if (!AppConfigs.formRules) {
              //   beneficiaryController.getCatalogs();
              // } else {
              //   Get.find<AddBeneficiaryController>().getBeneficiaryForm();
              // }

              Get.find<AddBeneficiaryController>().getBeneficiaryForm();
              Get.find<EditBeneficiaryController>()
                ..benefAttributes.editBeneficiary(b)
                ..benefAttributes.isFresh = false
                ..update();
              Get.find<MainController>().push(
                  const AddBeneficiaryFormRules(), AppBars.editBeneficiary);
            },
            onSend: () {
              if (Get.isRegistered<TransferController>()) {
                Get.find<TransferController>().reset(t: TransferType.all);
              } else {
                Get.put(TransferController(transferType: TransferType.all),
                    permanent: true);
              }
              Get.find<TransferController>().selectedBeneficiary = b;
              Get.find<MainController>().push(
                  AppConfigs.sendMoney(
                    key: UniqueKey(),
                  ),
                  AppBars.sendMoney);
            },
          ),
          GestureDetector(
            onTap: () async {
              if (b.serviceType?.Code == 'B') {
                await Share.share('${'Name : '} ${b.name!.removeExtraSpace()}, '
                    '${'\n ${'Service : '}${b.serviceType?.Desc}'}'
                    // '${b.nationality != null ? '\n ${'Country : '}${b.nationality}' : ''}'
                    '${b.accountNumber != null ? '\n ${'AccNo : '}${b.accountNumber}' : ''}'
                    '${b.bank?.Desc != null ? '\n ${'Bank : '}${b.bank?.Desc}' : ''}'
                    '${b.branch?.Desc != null ? '\n ${'Branch : '}${b.branch?.Desc}' : ''}'
                    '${b.branch?.Code != null ? '\n ${'Branch Code: '}${b.branch?.Code}' : ''}');
              } else if (b.serviceType?.Code == 'C') {
                await Share.share('${'Name : '} ${b.name!.removeExtraSpace()}, '
                    '${'\n ${'Service : '}${b.serviceType?.Desc}'}'
                    // '${b.nationality != null ? '\n ${'Country : '}${b.serviceCountry}' : ''}'
                    );
              } else {
                await Share.share('${'Name : '} ${b.name!.removeExtraSpace()}, '
                    '${'\n ${'Service : '}${b.serviceType?.Desc}'}'
                    // '${b.nationality != null ? '\n ${'Country : '}${b.nationality}' : ''}'
                    '${b.bank != null ? '\n ${'Agent : '}${b.bank?.Desc}' : ''}'
                    '${b.branch != null ? '\n ${'Branch : '}${b.branch?.Desc}' : ''}');
              }
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImagePath.shareTransactionDetail,
                    height: 20,
                    width: 20,
                    colorFilter: ColorFilter.mode(
                        beneficiaryController.isDark
                            ? AppConfigs.w
                            : AppConfigs.g4,
                        BlendMode.srcIn),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'share_account_details'.tr,
                    style: TS.f12.copyWith(
                        color: beneficiaryController.isDark
                            ? AppConfigs.w
                            : AppConfigs.g4),
                  ),
                ],
              ),
            ),
          ),
          moreBeneficiaryDetails(b),
          // GestureDetector(
          //   onTap: () => beneficiaryController
          //     ..viewMoreDeails = !beneficiaryController.viewMoreDeails
          //     ..update(),
          //   // child: DottedBorder(
          //   //   dashPattern: const [3, 3],
          //   //   padding: EdgeInsets.zero,
          //   //   color: ConstColors.grey70,
          //   //   child: Container(
          //   //     width: 428,
          //   //     height: 30,
          //   //     color: const Color(0xffeeeeee).withOpacity(0.36),
          //   //     child: Row(
          //   //       mainAxisAlignment: MainAxisAlignment.center,
          //   //       children: [
          //   //         Text(
          //   //           beneficiaryController.viewMoreDeails
          //   //               ? 'hide_more_details'.tr
          //   //               : 'view_more'.tr,
          //   //           style: TS.f12.copyWith(
          //   //               color: beneficiaryController.isDark ? AppConfigs.w : AppConfigs.g4),
          //   //         ),
          //   //         const SizedBox(width: 4),
          //   //         RotatedBox(
          //   //           quarterTurns: beneficiaryController.viewMoreDeails ? 0 : 2,
          //   //           child: SvgPicture.asset(
          //   //             ImagePath.downArrow,
          //   //             width: 10,
          //   //             height: 6,
          //   //             colorFilter: ColorFilter.mode(
          //   //                 beneficiaryController.isDark ? AppConfigs.w : AppConfigs.g4,
          //   //                 BlendMode.srcIn),
          //   //           ),
          //   //         )
          //   //       ],
          //   //     ),
          //   //   ),
          //   // ),
          // ),
          Expanded(
            child: GetBuilder<TransactionController>(builder: (txController) {
              return txController.loading
                  ? BeneficiaryShimmer(itemLength: 6)
                  : ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: transactions.length,
                      itemBuilder: (c, i) => benefTransTile(
                          transactions[i], beneficiaryController.isDark),
                    );
            }),
          ),
        ],
      );
    });
  }
}
