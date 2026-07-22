import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/exports/ui_seven_pages.dart';
import '../../../../core/exports/ui_seven_shimmer.dart';
import '../../../../core/flavours/constants.dart';

Widget recentTransactionsTab() {
  ScrollController s = ScrollController();

  return GetBuilder<TransferController>(
    builder: (transferController) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: textFormField(
                hintText:
                    cms(Fields.MyBeneficiary_SearchBeneficiary).textHeading!,
                controller: transferController.transactionController,
                top: 0,
                borderRadius: 28,
                onChanged: (v) {
                  if (!transferController.listLoading) {
                    transferController
                      ..filteredRecentTransactions = transferController
                          .recentTransactions
                          .where((e) => (v.isNotEmpty
                              ? e.beneficiaryName!
                                  .toLowerCase()
                                  .contains(v.toLowerCase())
                              : true))
                          .toList()
                      ..update();
                  }
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    ImagePath.search2,
                    height: 11.8,
                    width: 12,
                    colorFilter:
                        ColorFilter.mode(Color(0xffd1d1d1), BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: Box3.settings.enableAddBenf,
              child: GestureDetector(
                onTap: () {
                  transferController.addBeneficiary();

                  // Get.put(AddBeneficiaryController())
                  //   ..catalogueRetrieved = false
                  //   ..getCatalogs();
                  // Get.find<MainController>().push(const AddBeneficiaryFormRules(), AppBars.addBeneficiary);
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppConfigs.gd7),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      ImagePath.addBeneficiary,
                      colorFilter: ColorFilter.mode(
                          AppConfigs.primaryColor, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: transferController.getTabviewHeight() - 61,
          // constraints: BoxConstraints(maxHeight: 209),
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(19)),
              border: Border.all(color: AppConfigs.gd7)),
          child: transferController.listLoading ||
                  transferController.syncingBeneficiaries
              ? BeneficiaryShimmer(
                  profileHeight: 50,
                  itemLength: 5,
                )
              : transferController.filteredRecentTransactions.isEmpty
                  ? Center(
                      child: Text(
                        "No Transactions yet".tr,
                        style: TS.f18.copyWith(color: AppConfigs.accentColor),
                      ),
                    )
                  : Scrollbar(
                      controller: s,
                      thumbVisibility: true,
                      child: ListView.separated(
                        controller: s,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemCount: transferController
                                    .filteredRecentTransactions.length >
                                5
                            ? 5
                            : transferController
                                .filteredRecentTransactions.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 0,
                          color: AppConfigs.gd7,
                          indent: 8,
                          endIndent: 8,
                        ),
                        itemBuilder: (c, i) => transactionTile(
                          selected: transferController
                                  .filteredRecentTransactions[i]
                                  .transactionReference ==
                              transferController
                                  .selectedTransaction?.transactionReference,
                          transaction:
                              transferController.filteredRecentTransactions[i],
                          hide: true,
                          onTap: () {
                            transferController.setBenefFromTxn(
                                transferController
                                    .filteredRecentTransactions[i]);
                          },
                        ),
                      ),
                    ),
        ),
        // Visibility(
        //   visible: Box3.settings.enableAddBenf,
        //   child: GestureDetector(
        //     onTap: () {
        //       transferController.addBeneficiary();
        //     },
        //     child: Container(
        //       margin: const EdgeInsets.only(top: 10, bottom: 10),
        //       alignment: Alignment.center,
        //       color: Colors.transparent,
        //       child: Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           SvgPicture.asset(
        //             SvgIcons.addBeneficiary,
        //             height: 11,
        //             colorFilter: ColorFilter.mode(
        //                 AppConfigs.primaryColor, BlendMode.srcIn),
        //           ),
        //           const SizedBox(width: 3),
        //           Text(cms(Fields.MyBeneficiary_AddBeneficiary).textHeading!,
        //               style: TS.f14.copyWith(
        //                   color: AppConfigs.primaryColor,
        //                   fontWeight: FontWeight.w700),
        //               textAlign: TextAlign.start),
        //           const SizedBox(width: 8),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}
