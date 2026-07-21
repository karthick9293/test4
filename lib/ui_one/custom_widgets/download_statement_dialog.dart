import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/transaction_controller.dart';
import '../../core/exports/ui_one_custom_widgets.dart';
import '../../core/flavours/constants.dart';

Widget downloadStatementDialog() {
  List<String> formatList = ['PDF'];
  int formatIndex = 0;

  return GetBuilder<TransactionController>(builder: (transactionController) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,
                  spreadRadius: 0)
            ],
            color: transactionController.isDark ? AppConfigs.b : AppConfigs.w),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 11),
                    alignment: Alignment.center,
                    child: Text(
                      'account_statement'.tr,
                      style: TS.f18.copyWith(
                          color: transactionController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g4),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: Get.back,
                      child: SvgPicture.asset(
                        ImagePath.close,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                            AppConfigs.primaryColor, BlendMode.srcIn),
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(height: 15),
              Text(
                'Choose how you want to receive your account statement.'.tr,
                style: TS.f14.copyWith(
                  color: transactionController.isDark
                      ? AppConfigs.w
                      : AppConfigs.g4,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              GetBuilder<TransactionController>(
                  id: 'statement-types',
                  builder: (txnContrl) {
                    return Row(
                      children: [
                        Expanded(
                          child: _buildDownloadType(txnContrl,
                              typeIdx: 0, text: 'download'.tr),
                        ),
                        Expanded(
                          child: _buildDownloadType(txnContrl,
                              typeIdx: 1, text: 'email'.tr),
                        ),
                      ],
                    );
                  }),
              SizedBox(height: 25),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your statement will be generated in \n'.tr,
                      style: TS.f16.copyWith(
                        color: transactionController.isDark
                            ? AppConfigs.w
                            : AppConfigs.g70,
                      ),
                    ),
                    TextSpan(
                      text: 'PDF format.'.tr,
                      style: TS.f16.copyWith(
                        color: AppConfigs.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              // Container(
              //   height: 40,
              //   margin: const EdgeInsets.only(top: 20),
              //   decoration: BoxDecoration(
              //     borderRadius: const BorderRadius.all(Radius.circular(28)),
              //     border: Border.all(color: ConstColors.primary, width: 2),
              //   ),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: GestureDetector(
              //           onTap: () => transactionController
              //             ..type = 'download'.tr
              //             ..statementIndex = 0
              //             ..update(),
              //           child: Container(
              //             height: 40,
              //             decoration: BoxDecoration(
              //                 color: transactionController.statementIndex == 0
              //                     ? ConstColors.primary
              //                     : Colors.transparent,
              //                 borderRadius: const BorderRadius.only(
              //                   topLeft: Radius.circular(28),
              //                   bottomLeft: Radius.circular(28),
              //                   bottomRight: Radius.circular(28),
              //                   topRight: Radius.circular(28),
              //                 )),
              //             alignment: Alignment.center,
              //             child: Text(
              //               'download'.tr,
              //               style: TS.f18.copyWith(
              //                   fontWeight: FontWeight.w600,
              //                   color: transactionController.statementIndex == 0
              //                       ? Colors.white
              //                       : ConstColors.primary),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: GestureDetector(
              //           onTap: () => transactionController
              //             ..statementIndex = 1
              //             ..type = 'email'.tr
              //             ..update(),
              //           child: Container(
              //             height: 40,
              //             decoration: BoxDecoration(
              //                 color: transactionController.statementIndex != 0
              //                     ? ConstColors.primary
              //                     : Colors.transparent,
              //                 borderRadius: const BorderRadius.only(
              //                   topRight: Radius.circular(28),
              //                   bottomRight: Radius.circular(28),
              //                   bottomLeft: Radius.circular(28),
              //                   topLeft: Radius.circular(28),
              //                 )),
              //             alignment: Alignment.center,
              //             child: Text(
              //               'email'.tr,
              //               style: TS.f18.copyWith(
              //                   fontWeight: FontWeight.w600,
              //                   color: transactionController.statementIndex != 0
              //                       ? Colors.white
              //                       : ConstColors.primary),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.only(top: 5, bottom: 5),
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     'format'.tr,
              //     style: TS.f12.copyWith(
              //       color: transactionController.isDark
              //           ? AppConfigs.w
              //           : AppConfigs.g4,
              //     ),
              //   ),
              // ),
              // customDropdown<String>(
              //   items: formatList
              //       .map((e) => DropdownMenuItem<String>(
              //             value: e,
              //             child: Text(
              //               e,
              //               style: TS.f16.copyWith(
              //                 color: transactionController.isDark
              //                     ? AppConfigs.w
              //                     : AppConfigs.g4,
              //               ),
              //             ),
              //           ))
              //       .toList(),
              //   hintText: 'Select document Type'.tr,
              //   onChanged: (v) {
              //     formatIndex = formatList.indexOf(v!);
              //     transactionController
              //       ..isError = false
              //       ..update();
              //   },
              //   noPad: true,
              // ),
              transactionController.isError == true
                  ? errorText("Select_Format".tr)
                  : const SizedBox(),
              const SizedBox(height: 10),
              RowColumnButton(
                  isRow: Box3.settings.EnableSwipeButton == true ? false : true,
                  children: [
                    roundButton(
                      'cancel'.tr,
                      noMar: true,
                      borderOnly: true,
                      onTap: Get.back,
                      isCancelButton: true,
                    ),
                    roundButton(
                        cms(Fields.PopUp_Confirm).textHeading ?? 'confirm'.tr,
                        noMar: true, onTap: () async {
                      transactionController.downloadingStatement.value = true;
                      Get.back();
                      transactionController.generateStatement(formatIndex);
                    }),
                  ])
            ],
          ),
        ),
      ),
    );
  });
}

GestureDetector _buildDownloadType(TransactionController transactionController,
    {required String text, required int typeIdx}) {
  return GestureDetector(
    onTap: () {
      transactionController
        ..type = text
        ..statementIndex = typeIdx
        ..update(['statement-types']);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppConfigs.gd7),
          ),
          child: Container(
            height: transactionController.statementIndex == typeIdx ? 14 : 12,
            width: transactionController.statementIndex == typeIdx ? 14 : 12,
            decoration: transactionController.statementIndex == typeIdx
                ? BoxDecoration(
                    color: AppConfigs.primaryColor,
                    shape: BoxShape.circle,
                  )
                : null,
          ),
        ),
        SizedBox(width: 6),
        Text(
          text,
          style: TS.f16.copyWith(
            fontWeight: FontWeight.w600,
            color: transactionController.statementIndex == typeIdx
                ? AppConfigs.primaryColor
                : AppConfigs.g4,
          ),
        ),
      ],
    ),
  );
}
