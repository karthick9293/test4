import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_seven_custom_widgets.dart';
import '../../core/flavours/constants.dart';
import '../../network/api_service_new.dart';

Widget lightBlueTile(
    {List<String>? contents,
    bool isFav = false,
    bool allowEdit = true,
    bool isSpaces = true,
    // bool isContent = true,
    bool isProfile = false,
    String? currency,
    int? index,
    bool? switchValue,
    String? name,
    String? title,
    bool isActive = false,
    bool loading = false,
    void Function()? onSend,
    void Function()? onEdit,
    Widget? more}) {
  String shortForm = '';
  for (String e in (name?.replaceAll('  ', ' ').split(' ') ?? [])) {
    if (e.isNotEmpty) {
      shortForm = shortForm + e[0].toUpperCase();
    }
  }

  return GetBuilder<AccountController>(builder: (accountController) {
    List<TableRow> tableChildren() {
      return contents!
          .where((c) => c.contains(':'))
          .map((e) => TableRow(children: [
                Text(
                  e.contains(':') ? e.split(':')[0] : e,
                  style: TS.f12.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.g8f
                          : AppConfigs.g77,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  e.contains(':') ? ':' : '',
                  style: TS.f12.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.g8f
                          : AppConfigs.g77,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2.7),
                  child: Text(
                    e.contains(':') ? e.split(':')[1].trim() : '',
                    style: TS.f12.copyWith(
                        fontSize: 11,
                        color: accountController.isDark
                            ? AppConfigs.g8f
                            : AppConfigs.g4,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ]))
          .toList();
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(30, 12, 20, 16),
      margin: const EdgeInsets.only(bottom: 10),
      color: accountController.isDark
          ? AppConfigs.b000f14
          : AppConfigs.geb.withOpacity(0.1), //Rahul changes
      child: Column(
        children: [
          Visibility(
            visible: title != null,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(title ?? '',
                  style: TS.f14.copyWith(
                      color: accountController.isDark
                          ? AppConfigs.w
                          : AppConfigs.g4),
                  textAlign: TextAlign.start),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 33,
                height: 33,
                decoration: BoxDecoration(
                  border: Border.all(color: AppConfigs.primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: accountController.isDark
                      ? AppConfigs.b01222d
                      : AppConfigs.w,
                ),
                child: Center(
                  child: Text(
                    shortForm.isNotEmpty
                        ? shortForm.substring(
                            0, shortForm.length > 2 ? 2 : shortForm.length)
                        : 'JB',
                    style: TextStyles.font14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppConfigs.primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          name ?? Box3.customerDetailsFZ?.data?.userName ?? '',
                          style: TS.f16.copyWith(
                              color: accountController.isDark
                                  ? AppConfigs.w
                                  : AppConfigs.g4),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Visibility(
                        visible: isFav,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 10),
                          child: SvgPicture.asset(ImagePath.bi2, height: 21),
                        ),
                      ),
                      // isSpaces ? const Spacer() : const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          children: contents!
                              .where((c) => !c.contains(':'))
                              .toList()
                              .map((e) => Text(
                                    e.contains(':') ? '${e.split(':')[0]}:' : e,
                                    style: TS.f12.copyWith(
                                        color: accountController.isDark
                                            ? AppConfigs.g8f
                                            : AppConfigs.g77,
                                        fontWeight: FontWeight.w600),
                                  ))
                              .toList()),
                      Table(
                        columnWidths: {
                          0: FixedColumnWidth(contents
                                  .any((c) => c.contains("sending_amount".tr))
                              ? 100
                              : 80),
                          1: const FixedColumnWidth(10),
                          2: const FixedColumnWidth(150),
                        },
                        children: tableChildren(),
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: contents
                      //       .map((e) => Padding(
                      //             padding:
                      //                 const EdgeInsets.only(bottom: 4),
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   e.contains(':')
                      //                       ? '${e.split(':')[0]}:'
                      //                       : e,
                      //                   style: TS.f12.copyWith(
                      //                       color: accountController.isDark
                      //                           ? AppConfigs.g8f
                      //                           : AppConfigs.g77,
                      //                       fontWeight: FontWeight.w600),
                      //                 ),
                      //                 Text(
                      //                   e.contains(':')
                      //                       ? e.split(':')[1]
                      //                       : '',
                      //                   style: TS.f12.copyWith(
                      //                       fontSize: 11,
                      //                       color: accountController.isDark
                      //                           ? AppConfigs.g8f
                      //                           : AppConfigs.g4,
                      //                       fontWeight: FontWeight.w700),
                      //                 )
                      //               ],
                      //             ),
                      //           ))
                      //       .toList(),
                      // ),
                    ],
                  ),
                  // amount != null
                  //     ? RichText(
                  //         text: TextSpan(children: [
                  //         TextSpan(
                  //             style: TS.f12.copyWith(
                  //                 color: accountController.isDark
                  //                     ? AppConfigs.g8f
                  //                     : AppConfigs.g77,
                  //                 fontWeight: FontWeight.w600),
                  //             text: "sending_amount".tr),
                  //         TextSpan(
                  //             style: TS.f12.copyWith(
                  //                 fontSize: 11,
                  //                 color:
                  //                     accountController.isDark ? AppConfigs.g8f : AppConfigs.g4,
                  //                 fontWeight: FontWeight.w700),
                  //             text: "${amount.toStringAsFixed(3)} $currency")
                  //       ]))
                  //     : const SizedBox()
                ],
              )),
              Container(
                constraints: BoxConstraints(
                    maxHeight: isProfile ? 30 : 80, minHeight: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    allowEdit
                        ? GestureDetector(
                            onTap: onEdit,
                            child: SvgPicture.asset(
                              ImagePath.edit,
                              colorFilter: ColorFilter.mode(
                                  accountController.isDark
                                      ? AppConfigs.w
                                      : AppConfigs.g4,
                                  BlendMode.srcIn),
                              height: 25,
                              width: 25,
                            ),
                          )
                        : index != null &&
                                (Get.find<BeneficiaryController>()
                                            .benefs[index]
                                            .serviceType ==
                                        'C' &&
                                    Get.find<BeneficiaryController>()
                                            .benefs[index]
                                            .isCorrespondentActive ==
                                        'Y')
                            ? Visibility(
                                visible: (Get.find<BeneficiaryController>()
                                            .benefs[index]
                                            .active ==
                                        'A' ||
                                    Get.find<BeneficiaryController>()
                                            .benefs[index]
                                            .active ==
                                        'N'),
                                child: (loading
                                    ? tinyLoader()
                                    : Padding(
                                        padding: const EdgeInsets.only(top: 0),
                                        child: FlutterSwitch(
                                          height: 23,
                                          width: 40,
                                          // padding: 2.5,
                                          toggleSize: 18,
                                          value: switchValue == true,
                                          activeColor:
                                              ConstColors.toggleActiveGreen,
                                          onToggle: (v) async {
                                            BeneficiaryController bc = Get.find<
                                                BeneficiaryController>();
                                            DataController d =
                                                Get.find<DataController>();
                                            if (v == false) {
                                              Get.dialog(yesOrNoAlert(
                                                  title:
                                                      'deactivate_beneficiary'
                                                          .tr,
                                                  body:
                                                      'are_you_sure_you_want_to_deactivate_beneficiary'
                                                          .tr,
                                                  onTap: () async {
                                                    bc
                                                      ..favIndex = index
                                                      ..update();
                                                    if (await ApiService()
                                                        .beneficiarytasks(
                                                            bc.benefs[index].id!
                                                                .toString(),
                                                            BeneficiaryTasks
                                                                .disable)) {
                                                      bc.benefs[index] = bc
                                                          .benefs[index]
                                                          .copyWith(
                                                              active: 'N');
                                                    }
                                                    await d.getBeneficiaries();
                                                    Get.back();
                                                    bc
                                                      ..benefs = d.beneficiaries
                                                      ..favIndex = null
                                                      ..update();
                                                    Get.find<
                                                            AccountController>()
                                                        .update();
                                                  }));
                                            } else {
                                              if (bc.benefs[index]
                                                          .serviceType ==
                                                      'C' &&
                                                  bc.benefs[index]
                                                          .isCorrespondentActive ==
                                                      'Y') {
                                                bc
                                                  ..favIndex = index
                                                  ..update();
                                                if (await ApiService()
                                                    .beneficiarytasks(
                                                        bc.benefs[index].id!
                                                            .toString(),
                                                        BeneficiaryTasks
                                                            .enable)) {
                                                  bc.benefs[index] = bc
                                                      .benefs[index]
                                                      .copyWith(active: 'Y');
                                                }
                                                await d.getBeneficiaries();
                                                bc
                                                  ..benefs = d.beneficiaries
                                                  ..favIndex = null
                                                  ..update();
                                                Get.find<AccountController>()
                                                    .update();
                                              } else if (bc.benefs[index]
                                                      .serviceType ==
                                                  'B') {
                                                bc
                                                  ..favIndex = index
                                                  ..update();
                                                if (await ApiService()
                                                    .beneficiarytasks(
                                                        bc.benefs[index].id!
                                                            .toString(),
                                                        BeneficiaryTasks
                                                            .enable)) {
                                                  bc.benefs[index] = bc
                                                      .benefs[index]
                                                      .copyWith(active: 'Y');
                                                }
                                                await d.getBeneficiaries();
                                                bc
                                                  ..benefs = d.beneficiaries
                                                  ..favIndex = null
                                                  ..update();
                                                Get.find<AccountController>()
                                                    .update();
                                              }
                                            }
                                          },
                                        ),
                                      )),
                              )
                            : index != null &&
                                    (Get.find<BeneficiaryController>()
                                            .benefs[index]
                                            .serviceType ==
                                        'B')
                                ? Visibility(
                                    visible: (Get.find<BeneficiaryController>()
                                                .benefs[index]
                                                .active ==
                                            'A' ||
                                        Get.find<BeneficiaryController>()
                                                .benefs[index]
                                                .active ==
                                            'N'),
                                    child: (loading
                                        ? tinyLoader()
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0),
                                            child: FlutterSwitch(
                                              height: 23,
                                              width: 40,
                                              // padding: 2.5,
                                              toggleSize: 18,
                                              value: switchValue == true,
                                              activeColor:
                                                  ConstColors.toggleActiveGreen,
                                              onToggle: (v) async {
                                                BeneficiaryController bc =
                                                    Get.find<
                                                        BeneficiaryController>();
                                                DataController d =
                                                    Get.find<DataController>();
                                                if (v == false) {
                                                  Get.dialog(yesOrNoAlert(
                                                      title:
                                                          'deactivate_beneficiary'
                                                              .tr,
                                                      body:
                                                          'are_you_sure_you_want_to_deactivate_beneficiary'
                                                              .tr,
                                                      onTap: () async {
                                                        bc
                                                          ..favIndex = index
                                                          ..update();
                                                        if (await ApiService()
                                                            .beneficiarytasks(
                                                                bc.benefs[index]
                                                                    .id!
                                                                    .toString(),
                                                                BeneficiaryTasks
                                                                    .disable)) {
                                                          bc.benefs[index] = bc
                                                              .benefs[index]
                                                              .copyWith(
                                                                  active: 'N');
                                                        }
                                                        await d
                                                            .getBeneficiaries();
                                                        Get.back();
                                                        bc
                                                          ..benefs =
                                                              d.beneficiaries
                                                          ..favIndex = null
                                                          ..update();
                                                        Get.find<
                                                                AccountController>()
                                                            .update();
                                                      }));
                                                } else {
                                                  if (bc.benefs[index]
                                                              .serviceType ==
                                                          'C' &&
                                                      bc.benefs[index]
                                                              .isCorrespondentActive ==
                                                          'Y') {
                                                    bc
                                                      ..favIndex = index
                                                      ..update();
                                                    if (await ApiService()
                                                        .beneficiarytasks(
                                                            bc.benefs[index].id!
                                                                .toString(),
                                                            BeneficiaryTasks
                                                                .enable)) {
                                                      bc.benefs[index] = bc
                                                          .benefs[index]
                                                          .copyWith(
                                                              active: 'Y');
                                                    }
                                                    await d.getBeneficiaries();
                                                    bc
                                                      ..benefs = d.beneficiaries
                                                      ..favIndex = null
                                                      ..update();
                                                    Get.find<
                                                            AccountController>()
                                                        .update();
                                                  } else if (bc.benefs[index]
                                                          .serviceType ==
                                                      'B') {
                                                    bc
                                                      ..favIndex = index
                                                      ..update();
                                                    if (await ApiService()
                                                        .beneficiarytasks(
                                                            bc.benefs[index].id!
                                                                .toString(),
                                                            BeneficiaryTasks
                                                                .enable)) {
                                                      bc.benefs[index] = bc
                                                          .benefs[index]
                                                          .copyWith(
                                                              active: 'Y');
                                                    }
                                                    await d.getBeneficiaries();
                                                    bc
                                                      ..benefs = d.beneficiaries
                                                      ..favIndex = null
                                                      ..update();
                                                    Get.find<
                                                            AccountController>()
                                                        .update();
                                                  }
                                                }
                                              },
                                            ),
                                          )),
                                  )
                                : const SizedBox(),

                    // : Visibility(
                    //     visible:  index != null && (Get.find<BeneficiaryController>().benefs[index].active == 'A' || Get.find<BeneficiaryController>().benefs[index].active == 'N'),
                    //     child: (loading
                    //         ? tinyLoader()
                    //         : Padding(
                    //             padding: const EdgeInsets.only(top: 0),
                    //             child: FlutterSwitch(
                    //               height: 23,
                    //               width: 40,
                    //               // padding: 2.5,
                    //               toggleSize: 18,
                    //               value: switchValue == true,
                    //               activeColor: ConstColors.toggleActiveGreen,
                    //               onToggle: (v) async {
                    //                 BeneficiaryController bc = Get.find<BeneficiaryController>();
                    //                 DataController d = Get.find<DataController>();
                    //                 if (v == false) {
                    //                   Get.dialog(yesOrNoAlert(
                    //                       title: 'deactivate_beneficiary'.tr,
                    //                       body: 'are_you_sure_you_want_to_deactivate_beneficiary'.tr,
                    //                       onTap: () async {
                    //                         bc
                    //                           ..favIndex = index
                    //                           ..update();
                    //                         if (await ApiService().beneficiarytasks(bc.benefs[index!].id, BeneficiaryTasks.disable)) {
                    //                           bc.benefs[index] = bc.benefs[index].rebuild((p0) => p0.active == 'N');
                    //                         }
                    //                         await d.getBeneficiaries();
                    //                         Get.back();
                    //                         bc
                    //                           ..benefs = d.beneficiaries
                    //                           ..favIndex = null
                    //                           ..update();
                    //                         Get.find<AccountController>().update();
                    //                       }));
                    //                 } else {
                    //
                    //                   if(bc.benefs[index!].isCash && bc.benefs[index!].isCorrespondentActive == 'Y'){
                    //                     bc
                    //                       ..favIndex = index
                    //                       ..update();
                    //                     if (await ApiService().beneficiarytasks(bc.benefs[index!].id, BeneficiaryTasks.enable)) {
                    //                       bc.benefs[index] = bc.benefs[index].rebuild((p0) => p0.active == 'A');
                    //                     }
                    //                     await d.getBeneficiaries();
                    //                     bc
                    //                       ..benefs = d.beneficiaries
                    //                       ..favIndex = null
                    //                       ..update();
                    //                     Get.find<AccountController>().update();
                    //                   }else if(bc.benefs[index!].isCash == false){
                    //                     bc
                    //                       ..favIndex = index
                    //                       ..update();
                    //                     if (await ApiService().beneficiarytasks(bc.benefs[index!].id, BeneficiaryTasks.enable)) {
                    //                       bc.benefs[index] = bc.benefs[index].rebuild((p0) => p0.active == 'A');
                    //                     }
                    //                     await d.getBeneficiaries();
                    //                     bc
                    //                       ..benefs = d.beneficiaries
                    //                       ..favIndex = null
                    //                       ..update();
                    //                     Get.find<AccountController>().update();
                    //                   }
                    //
                    //
                    //                 }
                    //               },
                    //             ),
                    //           )),
                    //   ),
                    index != null && isActive
                        ? GestureDetector(
                            onTap: isActive ? onSend : null,
                            child: SvgPicture.asset(
                              ImagePath.sendMoneyOnList,
                              colorFilter: ColorFilter.mode(
                                  accountController.isDark
                                      ? AppConfigs.w
                                      : AppConfigs.g4,
                                  BlendMode.srcIn),
                              height: 20,
                              width: 20,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            ],
          ),
          more ?? const SizedBox()
        ],
      ),
    );
  });
}
