import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/network/api_endpoints.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_three_custom_widgets.dart';
import '../../../../core/exports/ui_three_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../models/beneficiary/beneficiary_fz.dart';
import '../../../../network/api_service_new.dart';

Widget beneficiaryTile2(
    {required BeneficiaryFz b,
    required int index,
    bool isArchive = false,
    bool moveToTransaction = false,
    void Function()? favChange}) {
  // List<Color> tileColors = [
  //   const Color(0xffee9e4e),
  //   const Color(0xff4e89ee),
  //   const Color(0xffee5e4e),
  //   const Color(0xff884eee),
  //   const Color(0xff05975c),
  //   const Color(0xffaf0699)
  // ];

  DropdownMenuItem<String> ddi(String s, String img, bool isDark) {
    return DropdownMenuItem<String>(
      value: s,
      child: Row(
        children: [
          SvgPicture.asset(
            img,
            colorFilter: ColorFilter.mode(
                isDark ? AppConfigs.g70 : AppConfigs.primaryColor,
                BlendMode.srcIn),
          ),
          const SizedBox(width: 8),
          Text(
            s,
            style: TextStyles.font12.copyWith(
                color: ConstColors.grey4, fontWeight: FontWeight.w600),
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
  viewBeneficiary() => Get.find<MainController>()
      .push(ViewBeneficiaryPage(index: index), AppBars.viewBeneficiary);
  return GetBuilder<BeneficiaryController>(builder: (beneficiaryController) {
    return GestureDetector(
      onLongPress: () {
        beneficiaryController
          ..isSelecting = true
          ..markedBeneficiary.add(isArchive
              ? beneficiaryController.archivedBenefs[index]
              : beneficiaryController.benefs[index])
          ..update();
      },
      onTap: () {
        if (moveToTransaction) {
          if (Get.isRegistered<TransferController>()) {
            Get.find<TransferController>().reset(t: TransferType.all);
          } else {
            Get.put(TransferController(transferType: TransferType.all),
                permanent: true);
          }
          Get.find<TransferController>()
            ..selectedBeneficiary = b
            // ..fromBeneficiary = b
            // ..toAmtCur = b.currency
            ..updateToCurrency(
                s: b.serviceCurrency!.Code,
                type: 'L'); //TODO: Check to currency update
          Get.find<MainController>().push(
              AppConfigs.sendMoney(
                key: UniqueKey(),
              ),
              AppBars.sendMoney);
        } else {
          if (beneficiaryController.isSelecting) {
            if (beneficiaryController.markedBeneficiary.contains(isArchive
                ? beneficiaryController.archivedBenefs[index]
                : beneficiaryController.benefs[index])) {
              beneficiaryController.markedBeneficiary.remove(isArchive
                  ? beneficiaryController.archivedBenefs[index]
                  : beneficiaryController.benefs[index]);
            } else {
              beneficiaryController.markedBeneficiary.add(isArchive
                  ? beneficiaryController.archivedBenefs[index]
                  : beneficiaryController.benefs[index]);
            }
            beneficiaryController.update();
          }
        }
      },
      child: Container(
        height: 85,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: ConstColors.grey70.withOpacity(0.1))),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  b.serviceType?.Code == 'C'
                      ? SvgPicture.asset(SvgIcons.cashTransfer, height: 60)
                      : b.serviceType?.Code == 'B'
                          ? SvgPicture.asset(SvgIcons.bankTransfer, height: 60)
                          : SvgPicture.asset(SvgIcons.mobileWallet, height: 60),
                  // SvgPicture.asset(!(b.isCash) ? SvgIcons.bankTransfer : SvgIcons.cashTransfer, height: 60),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: viewBeneficiary,
                            child: SizedBox(
                              width: 95,
                              child: Text(
                                b.firstName!,
                                maxLines: 2,
                                style: TS.f14.copyWith(
                                    color: beneficiaryController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.g4,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                              onTap: favChange,
                              child: Container(
                                color: Colors.transparent,
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: beneficiaryController.favIndex == index
                                    ? tinyLoader()
                                    : SvgPicture.asset(b.fav == 'Y'
                                        ? ImagePath.bi2
                                        : ImagePath.bi3),
                              )),
                          const Spacer(),
                          Visibility(
                            visible: !beneficiaryController.isSelecting,
                            child: b.active == 'A' &&
                                    b.isCorrespondentActive == 'Y'
                                ? StatusTiles.activeTile()
                                : b.active == 'N' &&
                                        b.isCorrespondentActive == 'N'
                                    ? StatusTiles.deactiveTile()
                                    : StatusTiles.pendingForApprovalTile(),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: viewBeneficiary,
                              child: Text(
                                b.serviceType?.Code == ServiceType.BANK_TRANSFER
                                    ? '${b.bank} | ${b.accountNumber}'
                                    : b.serviceType!.Code,
                                style: TS.f12.copyWith(
                                    color: beneficiaryController.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g77,
                                    overflow: TextOverflow.fade,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: !beneficiaryController.isSelecting,
                            child: GestureDetector(
                              onTap: () {
                                if (!Get.isRegistered<KycController>()) {
                                  Get.put(KycController());
                                }

                                if (b.active == 'A' &&
                                    b.isCorrespondentActive == 'Y') {
                                  if (Get.isRegistered<TransferController>()) {
                                    Get.find<TransferController>()
                                        .reset(t: TransferType.all);
                                  } else {
                                    Get.put(
                                        TransferController(
                                            transferType: TransferType.all),
                                        permanent: true);
                                  }
                                  Get.find<TransferController>()
                                    ..selectedBeneficiary = b
                                    // ..fromBeneficiary = b
                                    // ..toAmtCur = b.currency
                                    ..updateToCurrency(
                                        s: b.serviceCurrency!.Code,
                                        type:
                                            'L'); //TODO: Check to currency update
                                  Get.find<MainController>().push(
                                      AppConfigs.sendMoney(
                                        key: UniqueKey(),
                                      ),
                                      AppBars.sendMoney);
                                }
                              },
                              child: SvgPicture.asset(
                                ImagePath.sendMoneyOnList,
                                colorFilter: ColorFilter.mode(
                                    beneficiaryController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.g4.withOpacity(b.active ==
                                                    'A' &&
                                                b.isCorrespondentActive == 'Y'
                                            ? 1
                                            : 0.5),
                                    BlendMode.srcIn),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
                  Visibility(
                    visible: !beneficiaryController.isSelecting,
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                      items: (Box3.settings.enableEditBenf) && b.active != 'C'
                          ? [
                              ddi(
                                  b.active == 'A' &&
                                          b.isCorrespondentActive == 'Y'
                                      ? 'disable'.tr
                                      : 'enable'.tr,
                                  ImagePath.be2,
                                  beneficiaryController.isDark),
                              ddi('view'.tr, ImagePath.be3,
                                  beneficiaryController.isDark),
                              // ddi('hide'.tr, ImagePath.be4, beneficiaryController.isDark)
                            ]
                          : [
                              ddi('edit'.tr, ImagePath.be1,
                                  beneficiaryController.isDark),
                              ddi(
                                  b.active == 'A' &&
                                          b.isCorrespondentActive == 'Y'
                                      ? 'disable'.tr
                                      : 'enable'.tr,
                                  ImagePath.be2,
                                  beneficiaryController.isDark),
                              ddi('view'.tr, ImagePath.be3,
                                  beneficiaryController.isDark),

                              // ddi('hide'.tr, ImagePath.be4, beneficiaryController.isDark)
                            ],
                      onChanged: (v) async {
                        if (v == 'view'.tr) {
                          viewBeneficiary();
                        } else if (v == 'edit'.tr) {
                          Get.find<EditBeneficiaryController>()
                            ..benefAttributes.editBeneficiary(b)
                            ..update();
                          Get.find<MainController>().push(
                              const AddBeneficiaryFormRules(),
                              AppBars.editBeneficiary);
                        } else if (v == 'enable'.tr || v == 'disable'.tr) {
                          await ApiService().beneficiarytasks(
                              b.id!.toString(),
                              v == 'enable'.tr
                                  ? BeneficiaryTasks.enable
                                  : BeneficiaryTasks.disable);
                          DataController d = Get.find<DataController>();

                          await d.getBeneficiaries();
                          beneficiaryController
                            ..benefs = d.beneficiaries
                            ..update();
                          // beneficiaryController.benefStatusChange();
                        }
                      },
                      dropdownStyleData: const DropdownStyleData(
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(1)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x29000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 6,
                                  spreadRadius: 0)
                            ],
                            color: Colors.white,
                          )),
                      buttonStyleData:
                          const ButtonStyleData(padding: EdgeInsets.zero),
                      menuItemStyleData: const MenuItemStyleData(height: 30),
                      customButton: Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: SvgPicture.asset(
                            ImagePath.editDots,
                            colorFilter: beneficiaryController.isDark
                                ? const ColorFilter.mode(
                                    AppConfigs.w, BlendMode.srcIn)
                                : null,
                          )),
                    )),
                  )
                ],
              ),
            ),
            Visibility(
              visible: beneficiaryController.isSelecting,
              child: SvgPicture.asset(beneficiaryController.markedBeneficiary
                      .contains(isArchive
                          ? beneficiaryController.archivedBenefs[index]
                          : beneficiaryController.benefs[index])
                  ? SvgIcons.tick
                  : SvgIcons.untick),
            )
          ],
        ),
      ),
    );
  });
}
