import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../shimmers/beneficiary_simmer.dart';

Widget selectBeneficiaryTab() {
  ScrollController s = ScrollController();

  void scrollToTop() {
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      if (s.hasClients) {
        s.animateTo(
          0,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
      }
    });
  }

  return GetBuilder<TransferController>(
    builder: (transferController) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: textFormField(
                top: 0,
                borderRadius: 28,
                hintText:
                    cms(Fields.MyBeneficiary_SearchBeneficiary).textHeading!,
                controller: transferController.selectBeneficiaryController,
                onChanged: (v) {
                  if (!transferController.listLoading) {
                    transferController
                      ..filteredBenefs = transferController.benefs
                          .where((e) =>
                              (v.isNotEmpty
                                  ? e.name!
                                      .toLowerCase()
                                      .contains(v.toLowerCase())
                                  : true) &&
                              ((e.serviceType?.Code == 'C') ||
                                  (e.serviceType?.Code == 'B') ||
                                  (e.serviceType?.Code == 'W')) &&
                              e.active == 'A')
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
          child: transferController.listLoading
              ? BeneficiaryShimmer(
                  profileHeight: 50,
                  itemLength: 5,
                )
              : Column(
                  children: [
                    // transferController.selectedBeneficiary != null
                    //     ? benefTile3(
                    //         transferController.filteredBenefs.indexOf(
                    //             transferController.selectedBeneficiary!),
                    //         transferController.selectedBeneficiary!,
                    //         onTap: () async {
                    //         transferController.sourcePurposeVisibility = false;

                    //         transferController
                    //           ..selectedBeneficiary = null
                    //           ..serviceType = null
                    //           ..toAmtCur = null
                    //           ..update();
                    //       })
                    //     : const SizedBox(),
                    Expanded(
                      child: transferController.filteredBenefs.isEmpty
                          ? Center(
                              child: Text(
                                "No Beneficiary found".tr,
                                style: TS.f18
                                    .copyWith(color: AppConfigs.accentColor),
                              ),
                            )
                          : Scrollbar(
                              controller: s,
                              thumbVisibility: true,
                              child: ListView.separated(
                                controller: s,
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount:
                                    transferController.filteredBenefs.length,
                                itemBuilder: (c, i) {
                                  return Visibility(
                                    // visible:
                                    //     transferController.selectedBeneficiary?.id !=
                                    //         transferController.filteredBenefs[i].id,
                                    child: benefTile3(
                                        i, transferController.filteredBenefs[i],
                                        onTap: () async {
                                      scrollToTop();
                                      transferController.setBenef(
                                          transferController.filteredBenefs[i]);
                                    }),
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(
                                  height: 0,
                                  color: AppConfigs.gd7,
                                  indent: 8,
                                  endIndent: 8,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
        ),
        // Visibility(
        //   visible: Box3.settings.enableAddBenf,
        //   child: GestureDetector(
        //     onTap: () {
        //       transferController.addBeneficiary();

        //       // Get.put(AddBeneficiaryController())
        //       //   ..catalogueRetrieved = false
        //       //   ..getCatalogs();
        //       // Get.find<MainController>().push(const AddBeneficiaryFormRules(), AppBars.addBeneficiary);
        //     },
        //     child: Container(
        //       margin: const EdgeInsets.only(top: 15, bottom: 12),
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
        //               overflow: TextOverflow.ellipsis,
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
