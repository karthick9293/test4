import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../models/beneficiary/beneficiary_fz.dart';
import '../../../../models/transaction_details/transaction_details_fz.dart';
import '../../../shimmers/beneficiary_simmer.dart';
import 'package:mobiremit/core/models/formatter.dart';

class SelectBeneficiaryUiTwo extends StatefulWidget {
  const SelectBeneficiaryUiTwo({super.key});

  @override
  State<SelectBeneficiaryUiTwo> createState() => _SelectBeneficiaryUiTwoState();
}

class _SelectBeneficiaryUiTwoState extends State<SelectBeneficiaryUiTwo> {
  final Map<String, String> serviceTypeIcons = {
    'C': ImagePath.cashPickup,
    'B': ImagePath.bankTransferIcon,
    'W': ImagePath.wallet,
  };

  TextStyle textStyle({double fontSize = 14}) => TS.f14.copyWith(
        color: (Get.isRegistered<BeneficiaryController>()
                    ? Get.find<BeneficiaryController>()
                    : Get.put(BeneficiaryController()))
                .isDark
            ? AppConfigs.w
            : AppConfigs.g70,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      );

  void switchToFavBeneficiary(TransferController tfc) {
    tfc.showFavBenefOnly = !tfc.showFavBenefOnly;
    Get.find<BeneficiaryController>().update();
  }

  TextEditingController searchController = TextEditingController();
  ScrollController s = ScrollController();

  @override
  void dispose() {
    searchController.dispose();
    s.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Get.find<DataController>().getData(TransferController);
    // Register controllers if not already present
    // if (!Get.isRegistered<BeneficiaryController>()) {
    //   Get.put(BeneficiaryController());
    // }
    // if (!Get.isRegistered<TransferController>()) {
    //   Get.put(TransferController(transferType: TransferType.all));
    // }
    // if (!Get.isRegistered<DataController>()) {
    //   Get.put(DataController());
    // }
    // if (!Get.isRegistered<TransactionController>()) {
    //   Get.put(TransactionController());
    // }
    //
    // // Now it's safe to find them
    Get.find<TransactionController>().loading = true;
    Get.find<DataController>().getData(TransferController);
    Get.find<TransactionController>().loading = false; // ⚠️ See note below
    Get.find<BeneficiaryController>().update();
    Get.find<TransferController>().update();

    // print('Is BeneficiaryController registered? ${Get.isRegistered<BeneficiaryController>()}');
    // print('Is TransferController registered? ${Get.isRegistered<TransferController>()}');
  }

  @override
  Widget build(BuildContext context) {
    print(
        'Is BeneficiaryController registered? ${Get.isRegistered<BeneficiaryController>()}');
    print(
        'Is TransferController registered? ${Get.isRegistered<TransferController>()}');
    print(
        'Is TransactionController registered? ${Get.isRegistered<TransactionController>()}');

    TransferController tfc = Get.find<TransferController>();
    tfc.showFavBenefOnly = false;

    return GetBuilder<BeneficiaryController>(
        init: Get.find<BeneficiaryController>(),
        builder: (beneficiaryController) {
          return Column(
            children: [
              AppbarUiTwo(
                title: cms(Fields.MyBeneficiary_PageHeading).textHeading ?? '',
                actions: [
                  IconButton(
                    onPressed: () => switchToFavBeneficiary(tfc),
                    icon: Icon(
                      tfc.showFavBenefOnly
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color:
                          tfc.showFavBenefOnly ? AppConfigs.primaryColor : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                      beneficiaryController.isDark
                          ? AppConfigs.w
                          : AppConfigs.g4,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                onChanged: (v) {
                  beneficiaryController.update();
                },
                top: 5,
                bottom: 20,
              ),
              Expanded(
                  child: tfc.loading
                      ? BeneficiaryShimmer(itemLength: 10)
                      : (tfc.showFavBenefOnly
                                      ? tfc.filteredFavBenefs
                                      : tfc.filteredBenefs)
                                  .isEmpty ||
                              !(tfc.showFavBenefOnly
                                      ? tfc.filteredFavBenefs
                                      : tfc.filteredBenefs)
                                  .map((b) => searchController.text.isEmpty
                                      ? true
                                      // 🛠️ FIXED: Removed b.name!
                                      : (b.name ?? '').toLowerCase().contains(
                                              searchController.text
                                                  .toLowerCase()) ||
                                          b.accountNumber?.contains(
                                                  searchController.text) ==
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
                                    style: textStyle(fontSize: 18),
                                  ),
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
                                tfc
                                  ..loading = true
                                  ..update();
                                beneficiaryController.update();
                                await d.getData(TransferController,
                                    forceUpdateTxnsAndBenefs: true);
                                beneficiaryController.update();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Scrollbar(
                                  controller: s,
                                  thumbVisibility: true,
                                  interactive: true,
                                  child: SingleChildScrollView(
                                    controller: s,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (!tfc.showFavBenefOnly) ...[
                                          Text(
                                            cms(Fields.SendMoney_RecentTransaction)
                                                    .textHeading ??
                                                '',
                                            style: TS.f18.copyWith(
                                              color:
                                                  beneficiaryController.isDark
                                                      ? AppConfigs.w
                                                      : AppConfigs.b,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          // ::::::::::: Recent Transactions List :::::::::::
                                          ListView.builder(
                                            itemCount: tfc
                                                        .filteredRecentTransactions
                                                        .length >
                                                    5
                                                ? 5
                                                : tfc.filteredRecentTransactions
                                                    .length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (c, i) {
                                              TransactionDetailsFz txn = tfc
                                                  .filteredRecentTransactions[i];
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Visibility(
                                                    visible: searchController
                                                            .text.isEmpty
                                                        ? true
                                                        // 🛠️ FIXED: Removed txn.beneficiaryName!
                                                        : (txn.beneficiaryName ??
                                                                    '')
                                                                .toLowerCase()
                                                                .contains(
                                                                    searchController
                                                                        .text
                                                                        .toLowerCase()) ||
                                                            txn.accountNumber?.contains(
                                                                    searchController
                                                                        .text) ==
                                                                true,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 25),
                                                      child:
                                                          _buildBeneficiaryTile(
                                                        beneficiaryController,
                                                        txn: txn,
                                                        onTap: () {
                                                          Get.find<
                                                                  MainController>()
                                                              .pop();
                                                          tfc.setBenefFromTxn(
                                                              txn);
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                        Text(
                                          tfc.showFavBenefOnly
                                              ? 'Favourite  Beneficiaries'.tr
                                              : cms(Fields.SendMoney_AllBeneficiary)
                                                      .textHeading ??
                                                  '',
                                          style: TS.f18.copyWith(
                                            color: beneficiaryController.isDark
                                                ? AppConfigs.w
                                                : AppConfigs.b,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        // ::::::::::: All/Fav Beneficiaries List view :::::::::::
                                        ListView.builder(
                                          itemCount: tfc.showFavBenefOnly
                                              ? tfc.filteredFavBenefs.length
                                              : tfc.filteredBenefs.length,
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder: (c, i) {
                                            BeneficiaryFz b;
                                            if (tfc.showFavBenefOnly) {
                                              b = tfc.filteredFavBenefs[i];
                                            } else {
                                              b = tfc.filteredBenefs[i];
                                            }
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Visibility(
                                                  visible: searchController
                                                          .text.isEmpty
                                                      ? true
                                                      // 🛠️ FIXED: Removed b.firstName!
                                                      : (b.firstName ?? '')
                                                              .toLowerCase()
                                                              .contains(
                                                                  searchController
                                                                      .text
                                                                      .toLowerCase()) ||
                                                          b.accountNumber?.contains(
                                                                  searchController
                                                                      .text) ==
                                                              true,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 25),
                                                    child:
                                                        _buildBeneficiaryTile(
                                                      beneficiaryController,
                                                      b: b,
                                                      onTap: () {
                                                        Get.find<
                                                                MainController>()
                                                            .pop();
                                                        tfc.setBenef(b);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
              Get.isRegistered<AddBeneficiaryController>() == true
                  ? BottomButtons.addBeneficiary
                  : SizedBox()
            ],
          );
        });
  }

  InkWell _buildBeneficiaryTile(BeneficiaryController beneficiaryController,
      {BeneficiaryFz? b, TransactionDetailsFz? txn, void Function()? onTap}) {
    bool fromTxn = b == null;

    // Safely resolve the service type code
    String? sTypeCode = fromTxn
        ? txn?.serviceType?.toUpperCase()
        : b.serviceType?.Code.toUpperCase();

    // Safely get the icon, providing a default if the code is unknown or null
    String iconPath = serviceTypeIcons[sTypeCode] ?? ImagePath.bankTransferIcon;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppConfigs.primaryColor.withAlpha(30),
              ),
              child: Center(
                child: Text(
                  getShortName(fromTxn
                      ? (txn?.benfFirstName ?? '')
                      : (b.firstName ?? '')),
                  style: TS.f16.copyWith(
                    color: AppConfigs.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          fromTxn
                              ? (txn?.beneficiaryName ?? '')
                              : (b.name ?? ''),
                          style: TS.f16.copyWith(
                            color: beneficiaryController.isDark
                                ? AppConfigs.w
                                : AppConfigs.b,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (fromTxn)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CurrencySymbolWithAmount(
                            currencyWidth: 11,
                            currencyCode: Box3.companyDataFZ?.companySettings
                                    ?.primaryBaseCurrency ??
                                'USD',
                            amount: (txn?.netAmount ?? 0.0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength),
                            color: beneficiaryController.isDark
                                ? AppConfigs.w
                                : AppConfigs.b,
                            textStyle: TS.f16.copyWith(
                              color: beneficiaryController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.b,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        height: 14,
                        width: 14,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '${(fromTxn ? getServiceType(txn?.serviceType ?? '') : b.serviceType?.Desc ?? '')} | ',
                        style: textStyle(),
                      ),
                      fromTxn
                          ? Expanded(
                              child: Text(
                                txn?.serviceType == 'C'
                                    ? (txn?.destinationCountry ?? '')
                                    : (txn?.bankName ?? ''),
                                style: textStyle(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : Expanded(
                              child: Text(
                                b.serviceType?.Code == 'C'
                                    ? (b.country?.Desc ?? '')
                                    : (b.bank?.Desc ?? ''),
                                style: textStyle(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


