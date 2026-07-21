import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

Widget transactionFilterUI() {
  final customDateKey = GlobalKey();

  DateTime now = DateTime.now();

  List<String> statusInSheet =
      Get.find<TransactionController>().status.toList();
  List<bool> paymentInSheet =
      Get.find<TransactionController>().paymentInstrument.toList();
  bool isCustomDate = Get.find<TransactionController>().isCustomDate;
  DateTime? startDate = Get.find<TransactionController>().startDate,
      endDate = Get.find<TransactionController>().endDate;
  return GetBuilder<TransactionController>(builder: (transactionController) {
    Widget titleTile(String title) {
      return Container(
        height: 36,
        decoration:
            BoxDecoration(color: const Color(0xff05465b).withOpacity(0.05)),
        padding: const EdgeInsets.only(left: 30),
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: TS.f16.copyWith(
                color: transactionController.isDark
                    ? AppConfigs.w
                    : const Color(0xff2d2d2d)),
            textAlign: TextAlign.start),
      );
    }

    Widget contentTile(String content, {bool? value, void Function()? onTap}) {
      return Container(
        margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.transparent,
                  child: Text(content,
                      style: TS.f14.copyWith(
                          color: transactionController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g4,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start),
                ),
              ),
            ),
            SizedBox(
                height: 30,
                width: 30,
                child: Checkbox(
                  value: value ?? false,
                  onChanged: (v) {
                    if (onTap != null) {
                      onTap();
                    }
                  },
                  activeColor: const Color(0xff889703),
                ))
          ],
        ),
      );
    }

    return SafeArea(
      bottom: true,
      top: false,
      child: Container(
        padding: const EdgeInsets.only(top: 22),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x2e000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
            color: AppConfigs.bodybg(transactionController.isDark)),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 30),
                  child: Text(cms(Fields.MyTransaction_Filters).textHeading!,
                      style: TS.f16.copyWith(
                          color: transactionController.isDark
                              ? AppConfigs.w
                              : AppConfigs.bf0,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    transactionController
                      ..status.clear()
                      ..paymentInstrument.clear()
                      ..isCustomDate = false
                      ..startDate = null
                      ..endDate = null
                      ..update();
                    Get.back();
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(right: 30, bottom: 15),
                    child: Text(
                      cms(Fields.MyTransaction_Clear).textHeading!,
                      style: TextStyles.font12.copyWith(
                          color: transactionController.isDark
                              ? AppConfigs.w
                              : AppConfigs.primaryColor),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  titleTile(cms(Fields.MyTransaction_Status).textHeading!),
                  Column(
                    children: ['Failed', 'Success', 'Processing', 'Cancelled']
                        .map((e) => contentTile(e.tr,
                                value: statusInSheet.contains(e), onTap: () {
                              if (statusInSheet.contains(e)) {
                                statusInSheet.remove(e);
                              } else {
                                statusInSheet.add(e);
                              }
                              transactionController.update();
                            }))
                        .toList(),
                  ),
                  titleTile(
                    'payment_instrument'.tr,
                  ),
                  contentTile(
                    'bank'.tr,
                    value: paymentInSheet.contains(false),
                    onTap: () {
                      if (paymentInSheet.contains(false)) {
                        paymentInSheet.remove(false);
                      } else {
                        paymentInSheet.add(false);
                      }
                      transactionController.update();
                    },
                  ),
                  contentTile('cash_pickup'.tr,
                      value: paymentInSheet.contains(true), onTap: () {
                    if (paymentInSheet.contains(true)) {
                      paymentInSheet.remove(true);
                    } else {
                      paymentInSheet.add(true);
                    }
                    transactionController.update();
                  }),
                  titleTile(cms(Fields.Filter_Transaction).textHeading!),
                  contentTile(
                    cms(Fields.Filter_LastMonth).textHeading!,
                    value: startDate ==
                            DateTime(now.year, now.month - 1, now.day) &&
                        endDate ==
                            DateTime(now.year, now.month, now.day)
                                .add(const Duration(hours: 23, minutes: 59)),
                    onTap: () {
                      isCustomDate = false;
                      startDate = DateTime(now.year, now.month - 1, now.day);
                      endDate = DateTime(now.year, now.month, now.day)
                          .add(const Duration(hours: 23, minutes: 59));
                      transactionController.update();
                    },
                  ),
                  contentTile(
                    cms(Fields.Filter_Last3Months).textHeading!,
                    value: startDate ==
                            DateTime(now.year, now.month - 3, now.day) &&
                        endDate ==
                            DateTime(now.year, now.month, now.day)
                                .add(const Duration(hours: 23, minutes: 59)),
                    onTap: () {
                      isCustomDate = false;
                      startDate = DateTime(now.year, now.month - 3, now.day);
                      endDate = DateTime(now.year, now.month, now.day)
                          .add(const Duration(hours: 23, minutes: 59));
                      transactionController.update();
                    },
                  ),
                  contentTile(
                    cms(Fields.Filter_Last6Months).textHeading!,
                    value: startDate ==
                            DateTime(now.year, now.month - 6, now.day) &&
                        endDate ==
                            DateTime(now.year, now.month, now.day)
                                .add(const Duration(hours: 23, minutes: 59)),
                    onTap: () {
                      isCustomDate = false;
                      startDate = DateTime(now.year, now.month - 6, now.day);
                      endDate = DateTime(now.year, now.month, now.day)
                          .add(const Duration(hours: 23, minutes: 59));
                      transactionController.update();
                    },
                  ),
                  contentTile(
                    cms(Fields.Filter_CustomDate).textHeading!,
                    value: isCustomDate,
                    onTap: () {
                      isCustomDate = !isCustomDate;
                      startDate = null;
                      transactionController.update();
                      if (isCustomDate) {
                        Future.delayed(const Duration(milliseconds: 100), () {
                          Scrollable.ensureVisible(
                            customDateKey.currentContext!,
                            duration: const Duration(milliseconds: 300),
                            alignment: 0.2,
                          );
                        });
                      }
                    },
                  ),
                  Visibility(
                    key: customDateKey,
                    visible: isCustomDate,
                    child: Row(
                      children: [
                        Expanded(
                            child: dateTile(
                                startDate != null
                                    ? '${startDate!.day}/${startDate!.month}/${startDate!.year}'
                                    : cms(Fields.Filter_StartDate).textHeading!,
                                initialDate: startDate,
                                firstDate:
                                    DateTime(now.year - 1, now.month, now.day),
                                left: 30, setDate: (d) {
                          if (endDate != null && d != null) {
                            if (endDate!.isBefore(d)) {
                              endDate =
                                  d.add(const Duration(hours: 23, minutes: 59));
                            } else if (endDate!.isAfter(
                                DateTime(d.year, d.month + 6, d.day))) {
                              endDate = DateTime(d.year, d.month + 6, d.day)
                                  .add(const Duration(hours: 23, minutes: 59));
                            }
                          }
                          startDate = d;
                          transactionController.update();
                        }, isSelected: startDate != null)),
                        const SizedBox(width: 16),
                        Expanded(
                            child: dateTile(
                                endDate != null
                                    ? '${endDate!.day}/${endDate!.month}/${endDate!.year}'
                                    : cms(Fields.Filter_EndDate).textHeading!,
                                firstDate:
                                    DateTime(now.year - 1, now.month, now.day),
                                initialDate: endDate ??
                                    DateTime(now.year, now.month, now.day),
                                right: 30, setDate: (d) {
                          if (startDate != null && d != null) {
                            if (startDate!.isAfter(d)) {
                              startDate = d;
                            } else if (startDate!.isBefore(
                                DateTime(d.year, d.month - 6, d.day))) {
                              startDate = DateTime(d.year, d.month - 6, d.day);
                            }
                          }

                          endDate =
                              d?.add(const Duration(hours: 23, minutes: 50)) ??
                                  endDate;
                          transactionController.update();
                        }, isSelected: endDate != null)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            roundButton(cms(Fields.Filter_Apply).textHeading!, top: 20,
                onTap: () async {
              if (isCustomDate == true &&
                  startDate != null &&
                  endDate != null) {
                print("LAST");
                Get.back();
                transactionController.loading = true;
                transactionController.update();
                await Get.find<DataController>().getCustomData(
                    T: TransactionController,
                    startDate: startDate!,
                    endDate: endDate!);
                transactionController.loading = false;
                transactionController.update();

                transactionController
                  ..status = statusInSheet
                  ..paymentInstrument = paymentInSheet
                  ..isCustomDate = isCustomDate
                  ..startDate = startDate
                  ..endDate = endDate
                  ..update();

                // Get.find<DataController>().transactions.clear();
                // transactionController.update();
                // Get.find<DataController>().transactions = await ApiService()
                //     .transactions(
                //         startDate: startDate.toString(),
                //         endDate: endDate.toString());
                // transactionController
                //   ..status = statusInSheet
                //   ..paymentInstrument = paymentInSheet
                //   ..isCustomDate = isCustomDate
                //   ..startDate = startDate
                //   ..endDate = endDate
                //   ..update();
                // transactionController.update();
              } else if (startDate != null && endDate != null) {
                print("APPLY 2");
                Get.back();
                transactionController.loading = true;
                transactionController.update();
                await Get.find<DataController>().getCustomData(
                    T: TransactionController,
                    startDate: startDate!,
                    endDate: endDate!);
                transactionController.loading = false;
                transactionController.update();

                transactionController
                  ..startDate = startDate
                  ..endDate = endDate
                  ..update();
              } else {
                print("APPLY 3");
                transactionController
                  ..status = statusInSheet
                  ..paymentInstrument = paymentInSheet
                  ..isCustomDate = isCustomDate
                  ..startDate = startDate
                  ..endDate = endDate
                  ..update();
                Get.back();
              }
            })
          ],
        ),
      ),
    );
  });
}
