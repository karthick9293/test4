import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../models/beneficiary/beneficiary_fz.dart';
import '../../../../network/api_service_new.dart';

Widget beneficiaryTileTheme1(
    {required BeneficiaryFz b,
    required int index,
    bool isArchive = false,
    required bool moveToTransaction,
    void Function()? favChange}) {
  DropdownMenuItem<String> ddi(
    String s,
    String img,
    bool isDark, {
    double width = 15,
  }) {
    return DropdownMenuItem<String>(
      value: s,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
            child: SvgPicture.asset(
              img,
              width: width,
              colorFilter: ColorFilter.mode(
                isDark ? AppConfigs.g70 : AppConfigs.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            s,
            style: TS.f14.copyWith(
              color: isDark ? AppConfigs.w : ConstColors.grey4,
            ),
          ),
        ],
      ),
    );
  }

  String shortName = '';
  for (String e in (b.firstName!.replaceAll('  ', ' ').split(' '))) {
    if (e.isNotEmpty) {
      shortName = shortName + e[0].toUpperCase();
    }
  }

  onMenuEvent(String? v, BeneficiaryController beneficiaryController) async {
    if (v == 'edit'.tr) {
      Get.find<AddBeneficiaryController>()
        ..benefAttributes.isAddBeneficiary = false
        ..selectedBeneficiary = b
        ..update();
      Get.find<MainController>().push(
          AddBeneficiaryFormRules(
            data: b.toJson(),
          ),
          AppBars.editBeneficiary);
    } else if (v == 'enable'.tr || v == 'disable'.tr) {
      if (b.status == 'D') {
        // CBLimitCheckResult res =
        //     Get.find<AccountController>().checkBenefCreationLimitExeeded();
        // if (res.isLimitExceeded) {
        //   errorAlert(
        //     content: '${res.message} ${res.limit}',
        //     function: () {
        //       Get.back();
        //     },
        //   );
        //   return;
        // }
      }
      beneficiaryController
        ..statsChangingIndex = index
        // ..loading = true
        ..update();
      if (await ApiService().beneficiarytasks(
          b.id!.toString(), b.status == "A" ? "D" : "A",
          active: true)) {
        beneficiaryController.benefs[index] =
            b.copyWith(status: v == 'enable'.tr ? 'A' : 'N');
        int i = beneficiaryController.benefs.indexWhere((e) => e.id == b.id);
        beneficiaryController.benefs[i] =
            b.copyWith(status: v == 'enable'.tr ? 'A' : 'N');
      }
      await Get.find<DataController>().getData(BeneficiaryController);
      beneficiaryController
        ..statsChangingIndex = null
        ..update();
    } else if (v == 'Unfavorite'.tr || v == 'Add to favorite'.tr) {
      beneficiaryController
        ..favIndex = index
        ..update();
      await ApiService().beneficiarytasks(
          b.id!.toString(),
          b.fav == 'Y'
              ? BeneficiaryTasks.unfavourite
              : BeneficiaryTasks.favourite);
      await Get.find<DataController>().getBeneficiaries();
      beneficiaryController
        ..benefs = Get.find<DataController>().beneficiaries
        ..favIndex = null
        ..update();
    }
  }

  viewBeneficiary() {
    if (!Get.find<BeneficiaryController>().loading) {
      if (moveToTransaction) {
        Get.put(TransferController(transferType: TransferType.all))
          ..selectedBeneficiary = b
          // ..fromBeneficiary = b
          ..toAmtCur = b.serviceCurrency!.Code
          ..updateToCurrency(s: b.serviceCurrency!.Code, type: 'L');
        Get.find<MainController>().push(
            AppConfigs.sendMoney(
              key: UniqueKey(),
            ),
            AppBars.sendMoney);
      } else {
        if (index < Get.find<BeneficiaryController>().benefs.length) {
          Get.find<MainController>().push(
              ViewBeneficiaryPageTheme1(beneficiary: b),
              AppBars.viewBeneficiary);
        }
      }
    }
  }

  return GetBuilder<BeneficiaryController>(builder: (beneficiaryController) {
    List<DropdownMenuItem<String>> items() {
      List<DropdownMenuItem<String>> i = [];

      i.add(
        ddi('view'.tr, ImagePath.be3, beneficiaryController.isDark, width: 17),
      );

      if ((Box3.settings.enableEditBenf) &&
          b.active != 'A' &&
          b.active != 'D') {
        i.add(
          ddi('edit'.tr, ImagePath.be1, beneficiaryController.isDark),
        );
      }

      i.add(
        ddi(
          b.status == 'A' ? 'disable'.tr : 'enable'.tr,
          ImagePath.be2,
          beneficiaryController.isDark,
        ),
      );

      return i;
    }

    return Container(
      // height: 125,
      margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppConfigs.primaryColor.withAlpha(60)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: AppConfigs.primaryColor.withAlpha(30),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            getServiceTypeIcon(
                                b.serviceType?.Code.toUpperCase()),
                            colorFilter: ColorFilter.mode(
                                AppConfigs.primaryColor, BlendMode.srcIn),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          b.name!.removeExtraSpace(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TS.f16.copyWith(
                            color: beneficiaryController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g21,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        getServiceType(b.serviceType?.Code.toUpperCase()),
                        style: TS.f16.copyWith(
                          color: beneficiaryController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g21,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Visibility(
                        visible: !beneficiaryController.isSelecting,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              items: items(),
                              onChanged: (v) async {
                                if (v == 'view'.tr) {
                                  viewBeneficiary();
                                } else {
                                  onMenuEvent(v, beneficiaryController);
                                }
                              },
                              dropdownStyleData: DropdownStyleData(
                                width: 155,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: beneficiaryController.isDark
                                      ? AppConfigs.b141313
                                      : const Color(0xfff8f8f8),
                                ),
                              ),
                              buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.zero),
                              menuItemStyleData:
                                  const MenuItemStyleData(height: 40),
                              customButton: Icon(
                                CupertinoIcons.ellipsis_vertical,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: beneficiaryController.isSelecting,
                  child: SvgPicture.asset(
                      beneficiaryController.markedBeneficiary.contains(isArchive
                              ? beneficiaryController.archivedBenefs[index]
                              : beneficiaryController.benefs[index])
                          ? SvgIcons.tick
                          : SvgIcons.untick),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Wrap(
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        b.serviceType?.Code == 'C'
                            ? ('Cash Pickup | ${b.country!.Desc}')
                            : b.serviceType?.Code == 'B'
                                ? ('Bank Transfer | ${b.bank?.Desc ?? '-'}')
                                : ('Wallet Transfer | ${b.bank?.Desc ?? '-'}'),
                        maxLines: 1,
                        style: TS.f14.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        b.serviceType?.Code == 'C'
                            ? b.serviceProvider?.Desc ?? '-'
                            : b.serviceType?.Code == 'B'
                                ? 'A/c no. ${b.accountNumber ?? '-'}'
                                : b.serviceType?.Desc ?? '-',
                        style: TS.f14.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Visibility(
                  visible: (b.status == 'A' || b.active == 'N') && b.fav == 'Y',
                  child: SvgPicture.asset(
                    ImagePath.bi2,
                    height: 13,
                    width: 13,
                    colorFilter: ColorFilter.mode(
                      AppConfigs.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Visibility(
                  visible: !beneficiaryController.isSelecting,
                  child: beneficiaryController.statsChangingIndex == index
                      ? tinyLoader()
                      : (b.active == 'A')
                          ? StatusTiles.activeTile()
                          : (b.active == 'D')
                              ? StatusTiles.deactiveTile()
                              : StatusTiles.pendingForApprovalTile(),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Visibility(
                  visible:
                      !beneficiaryController.isSelecting && b.active == 'A',
                  child: InkWell(
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
                          ..updateToCurrency(
                              s: b.serviceCurrency!.Code, type: 'L');

                        await transferController.resetTransferForm();
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppConfigs.primaryColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        cms(Fields.MyBeneficiary_SendMoney).textHeading!,
                        style: TS.f16.copyWith(
                          color: AppConfigs.w,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: viewBeneficiary,
                  child: Row(
                    children: [
                      Text(
                        'See more ',
                        style: TS.f16.copyWith(color: AppConfigs.primaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Icon(
                          CupertinoIcons.arrow_right,
                          color: AppConfigs.primaryColor,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  });
}
