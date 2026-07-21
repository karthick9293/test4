import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../network/api_service_new.dart';
import '../../../shimmers/beneficiary_simmer.dart';
import '../../form_rules_form/add_beneficiary_form_rules.dart';
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
    if (!Get.isRegistered<BeneficiaryController>()) {
      Get.put(BeneficiaryController());
    }
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
          AppbarUiTwo(
            title: cms(Fields.MyBeneficiary_PageHeading).textHeading!,
            actions: [
              InkWell(
                onTap: () => Get.find<MainController>().push(
                    const AddBeneficiaryFormRules(), AppBars.addBeneficiary),
                child: SvgPicture.asset(
                  SvgIcons.addBeneficiary2,
                  colorFilter: ColorFilter.mode(
                    AppConfigs.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 15),
            ],
          ),
          SizedBox(height: 10),

          textFormField(
            hintText: 'search'.tr,
            controller: searchController,
            borderRadius: 50,
            prefixIcon: Container(
              width: 40,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                ImagePath.search2,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  beneficiaryController.isDark ? AppConfigs.w : AppConfigs.g4,
                  BlendMode.srcIn,
                ),
              ),
            ),
            onChanged: (v) {
              beneficiaryController.update();
            },
            top: 5,
            bottom: 15,
          ),

          Expanded(
            child: beneficiaryController.loading
                ? BeneficiaryShimmer(itemLength: 10)
                : beneficiaryController.benefs.isEmpty ||
                        !beneficiaryController.benefs
                            .map((b) => searchController.text.isEmpty
                                ? true
                                : b.name!.toLowerCase().contains(
                                        searchController.text.toLowerCase()) ||
                                    b.accountNumber
                                            ?.contains(searchController.text) ==
                                        true)
                            .contains(true)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(SvgIcons.searching),
                            SizedBox(height: 30),
                            Text(
                              'No beneficiaries found',
                              style: TS.f20.copyWith(
                                color: beneficiaryController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.b,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Add a new beneficiary to get started.',
                              style: TS.f18.copyWith(
                                color: beneficiaryController.isDark
                                    ? AppConfigs.w
                                    : AppConfigs.g70,
                              ),
                            ),
                            SizedBox(height: 80),
                          ],
                        ),
                      )
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
                          child: SingleChildScrollView(
                            controller: s,
                            child: Column(
                              children: [
                                Visibility(
                                  visible: searchController.text.isEmpty,
                                  child: Image.asset(
                                    ImagePath.myBenefImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                ListView.builder(
                                  // controller: s,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      beneficiaryController.benefs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (c, i) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Visibility(
                                        visible: searchController.text.isEmpty
                                            ? true
                                            : beneficiaryController
                                                    .benefs[i].firstName!
                                                    .toLowerCase()
                                                    .contains(searchController
                                                        .text
                                                        .toLowerCase()) ||
                                                beneficiaryController
                                                        .benefs[i].accountNumber
                                                        ?.contains(
                                                            searchController
                                                                .text) ==
                                                    true,
                                        child: beneficiaryTileTheme1(
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
                                                                  .benefs[i]
                                                                  .fav ==
                                                              'Y'
                                                          ? "N"
                                                          : "Y")) {
                                                beneficiaryController
                                                        .benefs[i] =
                                                    beneficiaryController
                                                        .benefs[i]
                                                        .copyWith(
                                                            fav: beneficiaryController
                                                                        .benefs[
                                                                            i]
                                                                        .fav ==
                                                                    'Y'
                                                                ? 'N'
                                                                : 'Y');
                                                Get.find<DataController>()
                                                  ..beneficiaries =
                                                      beneficiaryController
                                                          .benefs
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
                              ],
                            ),
                          ),
                        ),
                      ),
          ),
          // roundButton(
          //   'add_beneficiary'.tr,
          //   top: 20,
          //   onTap: () {
          //     // beneficiaryController.benefAttributes = AddBenefAttributes();
          //     // Get
          //     //   ..put(SignUpController())
          //     //   ..find<MainController>().push(const AddBeneficiaryPage());
          //   },
          // )
        ],
      );
    });
  }
}
