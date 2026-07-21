import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/exports/ui_one_shimmer.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../network/api_service_new.dart';
import 'beneficiary_tile3.dart';

class MyBeneficiaryPage extends StatelessWidget {
  const MyBeneficiaryPage({super.key});

  Future<void> loadTransactions(DataController d) async {
    Get.find<TransactionController>().loading = true;
    await d.getData(TransferController);
    Get.find<TransactionController>().loading = false;
    Get.find<BeneficiaryController>().update();
    Get.find<TransferController>().update();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    ScrollController s = ScrollController();
    if (!Get.isRegistered<TransferController>()) {
      Get.put(TransferController(transferType: TransferType.all));
    }
    DataController d = Get.find<DataController>();
    if (d.transactions.isEmpty) {
      loadTransactions(d);
    }
    return GetBuilder<BeneficiaryController>(builder: (beneficiaryController) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Visibility(
                  visible: beneficiaryController.benefs
                      .where((e) => e.fav == 'Y')
                      .toList()
                      .isNotEmpty,
                  child: Expanded(
                    child: Row(
                      children: [
                        Text(
                          "favorites".tr,
                          style: TS.f12.copyWith(
                              color: beneficiaryController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.g4),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: beneficiaryController.benefs
                                  .where((b) => b.fav == 'Y')
                                  .isNotEmpty
                              ? Text(
                                  beneficiaryController.benefs
                                      .where((b) => b.fav == 'Y')
                                      .toList()
                                      .map((e) => '${e.name}')
                                      .join(' | '),
                                  style: TS.f12.copyWith(
                                    color: beneficiaryController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.primaryColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                )
                              : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                //TODO: Enable archiving after bulk archiving is enabled.
                // GestureDetector(
                //   onTap: () async {
                //     for (BeneficiaryBV b in beneficiaryController.markedBeneficiary) {
                //       int i = beneficiaryController.benefs.indexOf(b),
                //           j = beneficiaryController.filteredBenefs.indexOf(b);
                //       beneficiaryController
                //         ..benefs[i] = b.rebuild((p) => p.archive = 'A')
                //         ..filteredBenefs.removeAt(j)
                //         //  [j] = b.rebuild((p) => p.archive = true)
                //         ..archivedBenefs =
                //             beneficiaryController.benefs.where((e) => e.archive == 'A').toList()
                //         ..isSelecting = false
                //         ..update();
                //       await Box3.storeBenef(beneficiaryController.benefs);
                //     }
                //     beneficiaryController.markedBeneficiary.clear();
                //     Get.find<MainController>().push(
                //         const ArchivedBeneficiariespage(),
                //         AppBars.archivedBeneficiaries);
                //   },
                //   child: Row(
                //     children: [
                //       Text('Archive Beneficiary',
                //           style: TS.f12.copyWith(
                //               color: beneficiaryController.isDark
                //                   ? (beneficiaryController.markedBeneficiary.isNotEmpty
                //                       ? AppConfigs.w
                //                       : AppConfigs.g8f)
                //                   : (beneficiaryController.markedBeneficiary.isEmpty
                //                       ? AppConfigs.g4
                //                       : AppConfigs.primaryColor),
                //               decoration: TextDecoration.underline,
                //               decorationColor: beneficiaryController.isDark
                //                   ? (beneficiaryController.markedBeneficiary.isNotEmpty
                //                       ? AppConfigs.w
                //                       : AppConfigs.g8f)
                //                   : (beneficiaryController.markedBeneficiary.isEmpty
                //                       ? AppConfigs.g4
                //                       : AppConfigs.primaryColor))),
                //       const SizedBox(width: 6),
                //       SvgPicture.asset(
                //         HomeSvgs.archive,
                //         colorFilter: ColorFilter.mode(
                //             beneficiaryController.isDark
                //                 ? (beneficiaryController.markedBeneficiary.isNotEmpty
                //                     ? AppConfigs.w
                //                     : AppConfigs.g8f)
                //                 : (beneficiaryController.markedBeneficiary.isEmpty
                //                     ? AppConfigs.g4
                //                     : AppConfigs.primaryColor),
                //             BlendMode.srcIn),
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
          textFormField(
              hintText: 'search'.tr,
              controller: searchController,
              trailing: Container(
                width: 40,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  ImagePath.search,
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                      beneficiaryController.isDark
                          ? AppConfigs.w
                          : AppConfigs.g4,
                      BlendMode.srcIn),
                ),
              ),
              onChanged: (v) {
                beneficiaryController.update();
              },
              top: 5,
              bottom: 20),
          Expanded(
              child: beneficiaryController.loading
                  ? BeneficiaryShimmer(
                      itemLength: 10,
                    )
                  : beneficiaryController.benefs.isEmpty ||
                          !beneficiaryController.benefs
                              .map((b) => searchController.text.isEmpty
                                  ? true
                                  : b.name!.toLowerCase().contains(
                                          searchController.text
                                              .toLowerCase()) ||
                                      b.accountNumber?.contains(
                                              searchController.text) ==
                                          true)
                              .contains(true)
                      ? Center(
                          child: Text(
                          'No Records Found',
                          style: TS.f20.copyWith(
                              color: beneficiaryController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.g4),
                        ))
                      : RefreshIndicator(
                          color: AppConfigs.primaryColor,
                          backgroundColor: beneficiaryController.isDark
                              ? AppConfigs.g21
                              : AppConfigs.w,
                          onRefresh: () async {
                            DataController d = Get.find<DataController>();
                            beneficiaryController
                              ..loading = true
                              ..update();
                            await d.getData(BeneficiaryController);
                          },
                          child: Scrollbar(
                            controller: s,
                            thumbVisibility: true,
                            interactive: true,
                            child: ListView.builder(
                              controller: s,
                              itemCount: beneficiaryController.benefs.length,
                              shrinkWrap: true,
                              itemBuilder: (c, i) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: searchController.text.isEmpty
                                        ? true
                                        : beneficiaryController
                                                .benefs[i].firstName!
                                                .toLowerCase()
                                                .contains(searchController.text
                                                    .toLowerCase()) ||
                                            beneficiaryController
                                                    .benefs[i].accountNumber
                                                    ?.contains(searchController
                                                        .text) ==
                                                true,
                                    child: beneficiaryTile3(
                                        b: beneficiaryController.benefs[i],
                                        index: i,
                                        moveToTransaction: false,
                                        favChange: () async {
                                          beneficiaryController
                                            ..favIndex = i
                                            ..update();
                                          if (await ApiService()
                                              .beneficiarytasks(
                                                  beneficiaryController
                                                      .benefs[i].id!
                                                      .toString(),
                                                  beneficiaryController
                                                              .benefs[i].fav ==
                                                          'Y'
                                                      ? "N"
                                                      : "Y")) {
                                            beneficiaryController.benefs[i] =
                                                beneficiaryController.benefs[i]
                                                    .copyWith(
                                                        fav:
                                                            beneficiaryController
                                                                        .benefs[
                                                                            i]
                                                                        .fav ==
                                                                    'Y'
                                                                ? 'N'
                                                                : 'Y');
                                            Get.find<DataController>()
                                              ..beneficiaries =
                                                  beneficiaryController.benefs
                                                      .toList()
                                              ..restoreBeneficiaries()
                                              ..update();
                                          }
                                          beneficiaryController
                                            ..favIndex = null
                                            ..update();
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
          // roundButton(
          //   'add_beneficiary'.tr,
          //   top: 20,
          //   onTap: () {
          //     beneficiaryController.benefAttributes = AddBenefAttributes();
          //     Get
          //       ..put(SignUpController())
          //       ..find<MainController>().push(const AddBeneficiaryPage());
          //   },
          // )
        ],
      );
    });
  }
}
