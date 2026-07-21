import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../core/exports/ui_four_pages.dart';
import '../../../../core/exports/ui_four_shimmer.dart';
import '../../../../core/flavours/constants.dart';

class MyTransactionsPage extends StatefulWidget {
  const MyTransactionsPage({super.key});

  @override
  State<MyTransactionsPage> createState() => _MyTransactionsPageState();
}

class _MyTransactionsPageState extends State<MyTransactionsPage> {
  TextEditingController controller = TextEditingController();
  ScrollController s = ScrollController();
  DateTime now = DateTime.now();

  Widget filterTile(String text,
          {bool visible = true, void Function()? onTap}) =>
      Visibility(
        visible: visible,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 3, right: 3),
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              color: AppConfigs.primaryColor.withOpacity(0.2),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(text == 'Rejected' ? 'Failed' : text,
                    style: TS.f12.copyWith(color: AppConfigs.accentColor)),
                Visibility(
                  visible: text != 'Reset_Filter'.tr,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: SvgPicture.asset(
                      ImagePath.close,
                      height: 12,
                      width: 12,
                      colorFilter: ColorFilter.mode(
                          AppConfigs.primaryColor, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // @override
  // initState() {
  //   super.initState();
  // s.addListener(() {
  //   if (s.position.pixels >= s.position.maxScrollExtent) {
  // fetchData();
  //   }
  // });
  // }

  // void fetchData() {
  //   print("FETCH");
  //   Get.find<TransactionController>().getDataPageWise();
  // }

  @override
  Widget build(BuildContext context) {
    Get.find<TransactionController>().getData();

    return GetBuilder<TransactionController>(builder: (transactionController) {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: ConstColors.grey70.withOpacity(0.1)))),
            child: Row(
              children: [
                Expanded(
                  child: textFormField(
                    right: 6,
                    left: 0,
                    top: 0,
                    hintText: cms(Fields.MyTransaction_SearchTransactions)
                        .textHeading,
                    controller: controller,
                    onChanged: (s) async {
                      transactionController
                        ..name = s
                        ..update();
                    },
                    trailing: Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        ImagePath.search,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                            transactionController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4,
                            BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: transactionController.showFilter,
                  child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: transactionController.isDark
                              ? AppConfigs.g21
                              : const Color(0xffe8e8e8)),
                      child: SvgPicture.asset(
                        SvgIcons.filter,
                        colorFilter: ColorFilter.mode(
                            transactionController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.g77,
                            BlendMode.srcIn),
                      )),
                )
              ],
            ),
          ),
          Visibility(
            visible: transactionController.status.isNotEmpty ||
                transactionController.paymentInstrument.isNotEmpty ||
                (transactionController.startDate != null &&
                    transactionController.endDate != null),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: Row(
                children: [
                  filterTile('Reset_Filter'.tr,
                      onTap: () => transactionController
                        ..status.clear()
                        ..paymentInstrument.clear()
                        ..startDate = null
                        ..endDate = null
                        ..update()),

                  // filterTile('Reset_Filter'.tr, onTap: () {}),

                  Expanded(
                      child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Row(
                            children: transactionController.status
                                .map((e) => filterTile(e,
                                    onTap: () => transactionController
                                      ..status.remove(e)
                                      ..update()))
                                .toList()),
                        Row(
                            children: transactionController.paymentInstrument
                                .map((e) =>
                                    filterTile(e ? 'Cash Pickup' : 'Bank',
                                        onTap: () => transactionController
                                          ..paymentInstrument.remove(e)
                                          ..update()))
                                .toList()),
                        Row(
                          children: [
                            filterTile(
                                cms(Fields.Filter_LastMonth).textHeading!,
                                visible: transactionController.startDate ==
                                    DateTime(now.year, now.month - 1, now.day),
                                onTap: () => transactionController
                                  ..startDate = null
                                  ..endDate = null
                                  ..update()),
                            filterTile(
                                cms(Fields.Filter_Last3Months).textHeading!,
                                visible: transactionController.startDate ==
                                    DateTime(now.year, now.month - 3, now.day),
                                onTap: () => transactionController
                                  ..startDate = null
                                  ..endDate = null
                                  ..update()),
                            filterTile(
                                cms(Fields.Filter_Last6Months).textHeading!,
                                visible: transactionController.startDate ==
                                    DateTime(now.year, now.month - 6, now.day),
                                onTap: () => transactionController
                                  ..startDate = null
                                  ..endDate = null
                                  ..update()),
                            filterTile(
                                cms(Fields.Filter_CustomDate).textHeading!,
                                visible: transactionController.startDate !=
                                        null &&
                                    transactionController.endDate != null &&
                                    transactionController.startDate?.month !=
                                        now.month - 1 &&
                                    transactionController.startDate?.month !=
                                        now.month - 3 &&
                                    transactionController.startDate?.month !=
                                        now.month - 6,
                                onTap: () => transactionController
                                  ..startDate = null
                                  ..endDate = null
                                  ..update())
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          Expanded(
            child: transactionController.loading
                ? BeneficiaryShimmer()
                : transactionController.transactions.isEmpty ||
                        transactionController.noRecordFound
                    ? Center(
                        child: Text(
                        'No Records Found',
                        style: TS.f20.copyWith(
                            color: transactionController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4),
                      ))
                    : RefreshIndicator(
                        color: AppConfigs.primaryColor,
                        backgroundColor: transactionController.isDark
                            ? AppConfigs.g21
                            : AppConfigs.w,
                        onRefresh: () =>
                            transactionController.getData(refresh: true),
                        child: Scrollbar(
                          controller: s,
                          thumbVisibility: true,
                          interactive: true,
                          child: ListView(
                            controller: s,
                            children: [
                              ListView.builder(
                                itemCount:
                                    transactionController.transactions.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (c, i) => Visibility(
                                  visible:
                                      transactionController.checkVisibility(i),
                                  child: transactionTile(
                                      transaction: transactionController
                                          .transactions[i]),
                                ),
                              ),
                              SizedBox(height: 20),
                              Obx(() =>
                                  Get.find<DataController>().pageLoader.value
                                      ? Center(
                                          child: CupertinoActivityIndicator(
                                            color: transactionController.isDark
                                                ? AppConfigs.w
                                                : null,
                                          ),
                                        )
                                      : SizedBox()),
                              SizedBox(height: 10)
                            ],
                          ),
                        ),
                      ),
          ),
        ],
      );
    });
  }
}
