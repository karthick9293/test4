import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/ui_six/shimmers/beneficiary_simmer.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
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
      return SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: AppConfigs.primaryColor.withOpacity(0.3)))
              ),
              child: Row(
                children: [
                  if(!beneficiaryController.showSearch)...[Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          color: AppConfigs.primaryColor.withAlpha(20),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppConfigs.primaryColor.withAlpha(50))),
                      child: const BackButton()),
                  const SizedBox(width: 8)],
                  Expanded(
                    child: beneficiaryController.showSearch
                        ? SizedBox(
                          height: 45,
                          child: TextField(
                              controller: searchController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText:
                                    cms(Fields.MyBeneficiary_SearchBeneficiary)
                                        .textHeading!,
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: GestureDetector(
                                    onTap: (){
                                      beneficiaryController.showSearch =
                                      !beneficiaryController.showSearch;
                                      if (!beneficiaryController.showSearch) searchController.clear();
                                      beneficiaryController.update();
                                    },
                                    child: Icon(Icons.arrow_back),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    beneficiaryController.showSearch = !beneficiaryController.showSearch;
                                    if (!beneficiaryController.showSearch) searchController.clear();
                                    beneficiaryController.update();
                                  },
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color(0xffDCE5F5),width: 0.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: const Color(0xffDCE5F5),width: 0.5),
                                ),
                              ),
                              onChanged: (_) => beneficiaryController.update(),
                            ),
                        )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  cms(Fields.MyBeneficiary_PageHeading)
                                      .textHeading!,
                                  style: TS.f24.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  '${beneficiaryController.benefs.length} Saved recipients',style: TS.f12,),
                            ],
                          ),
                  ),
                  if(!beneficiaryController.showSearch)GestureDetector(
                    child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            color: AppConfigs.primaryColor.withOpacity(0.1),
                            border: Border.all(color: AppConfigs.primaryColor.withOpacity(0.4))
                        ),child: Icon(Icons.search)),
                    onTap: () {
                      beneficiaryController.showSearch =
                          !beneficiaryController.showSearch;
                      if (!beneficiaryController.showSearch)
                        searchController.clear();
                      beneficiaryController.update();
                    },
                  )
                ],
              ),
            ),
            _buildCountryTabs(beneficiaryController),
            Visibility(
              visible: beneficiaryController.benefs
                  .where((e) => e.fav == 'Y')
                  .toList()
                  .isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: beneficiaryController.isDark
                        ? null:AppConfigs.linearGradientUiSix,
                  ),
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
                                                    .contains(searchController
                                                        .text
                                                        .toLowerCase()) ||
                                                beneficiaryController
                                                        .benefs[i].accountNumber
                                                        ?.contains(
                                                            searchController
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
                                                                  .benefs[i]
                                                                  .fav ==
                                                              'Y'
                                                          ? "N"
                                                          : "Y")) {
                                                beneficiaryController.benefs[i] =
                                                    beneficiaryController
                                                        .benefs[i]
                                                        .copyWith(
                                                            fav: beneficiaryController
                                                                        .benefs[i]
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
        ),
      );
    });
  }

  Widget _beneficiaryCard(Map<String, dynamic> b) => Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Row(
          children: [
            CircleAvatar(
                radius: 34,
                backgroundColor: const Color(0xffEEF3FC),
                child: Text(b['name'][0],
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold))),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(b['name'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(b['bank'],
                        style: const TextStyle(color: Color(0xff7C8DB5))),
                    Text('XXXX ${b['code']}',
                        style: const TextStyle(color: Color(0xff7C8DB5))),
                  ]),
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Send →'))
          ],
        ),
      );

  Widget _buildCountryTabs(controller) => GetBuilder<DataController>(
    builder: (dc) {
      if(dc.countries.isEmpty){
        return SizedBox();
      }
      return Container(
            height: 62,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppConfigs.primaryColor.withOpacity(0.2)))
        ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                GestureDetector(
                  onTap: () {
                    controller.selectedCountry = "All";
                    controller.update();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: controller.selectedCountry=="All" ? AppConfigs.primaryColor : AppConfigs.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppConfigs.primaryColor.withOpacity(0.4)),
                    ),
                    alignment: Alignment.center,
                    child: Text("All",
                        style: TS.f12.copyWith(
                            color:
                            controller.selectedCountry=="All" ? Colors.white : AppConfigs.primaryColor,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
                ...List.generate(dc.countries.length, (i){
                  final selected = controller.selectedCountry == dc.countries[i].Desc;
                  return GestureDetector(
                    onTap: () {
                      controller.selectedCountry = dc.countries[i].Desc;
                      controller.update();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: BoxDecoration(
                        color: selected ? AppConfigs.primaryColor : AppConfigs.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppConfigs.primaryColor.withOpacity(0.4)),
                      ),
                      alignment: Alignment.center,
                      child: Text(dc.countries[i].Desc,
                          style: TS.f12.copyWith(
                              color:
                              selected ? Colors.white : AppConfigs.primaryColor,
                              fontWeight: FontWeight.w700)),
                    ),
                  );
                })
              ],
            ),
          );
    }
  );
}
