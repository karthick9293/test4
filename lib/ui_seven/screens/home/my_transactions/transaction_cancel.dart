import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/txn_cancel/txn_cancel_fz.dart';

import '../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../network/api_service_new.dart';

Future<void> transactionCancel(
    {required String transactionRefNo, required String type}) async {
  TCancelControllers.clear();
  if (!Get.isRegistered<TransactionController>()) {
    Get.put(TransactionController());
  }
  await Get.dialog(
    GetBuilder<AccountController>(builder: (accountController) {
      return Container(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                    spreadRadius: 0)
              ],
              color: accountController.isDark ? AppConfigs.b : AppConfigs.w),
          child: Material(
            color: AppConfigs.t,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(top: 16, right: 0),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          ImagePath.close,
                          height: 20,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                              AppConfigs.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    GetBuilder<TransactionController>(
                      builder: (tc) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              alignment: Alignment.center,
                              child: Text(
                                type,
                                style: TS.f20.copyWith(
                                    color: accountController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.g4),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 15, left: 10, right: 10),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              height: 40,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(color: AppConfigs.gd7)),
                              child: Text(
                                "${'Payment_reference_number'.tr} : $transactionRefNo",
                                style: TS.f12.copyWith(
                                    color: accountController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.g4),
                              ),
                            ),
                            // textFormField(
                            //     left: 10,
                            //     right: 10,
                            //     controller: TCancelControllers.referenceController,
                            //     hintText: 'Payment_reference_number'.tr,
                            //     textInputAction: TextInputAction.next,
                            //     onChanged: (s) {
                            //       if (s.isNotEmpty) {
                            //         TCancelControllers.referenceNoError = '';
                            //         accountController.update();
                            //       }
                            //     },
                            //     errorText: TCancelControllers.referenceNoError),
                            textFormField(
                                cHeight: 100,
                                left: 10,
                                right: 10,
                                controller:
                                    TCancelControllers.remarksController,
                                hintText: 'Remarks'.tr,
                                textInputAction: TextInputAction.done,
                                onChanged: (s) {
                                  if (s.isNotEmpty) {
                                    TCancelControllers.remarksError = '';
                                    accountController.update();
                                  }
                                },
                                errorText: TCancelControllers.remarksError),
                            tc.transactionCancelStatus == false
                                ? roundButton(
                                    'submit'.tr,
                                    top: 15,
                                    left: 10,
                                    right: 10,
                                    bottom: 8,
                                    onTap: () async {
                                      // if(TCancelControllers.referenceController.text.isEmpty){
                                      //   TCancelControllers.referenceNoError = 'required'.tr;
                                      //   accountController.update();
                                      // }else
                                      if (TCancelControllers
                                          .remarksController.text
                                          .trim()
                                          .isEmpty) {
                                        TCancelControllers.remarksError =
                                            'required'.tr;
                                        accountController.update();
                                      } else {
                                        tc
                                          ..transactionCancelStatus = true
                                          ..update();

                                        TxnCancelFz? data = await ApiService()
                                            .cancelTransaction(
                                                // referenceNo: TCancelControllers.referenceController.text,
                                                referenceNo: transactionRefNo,
                                                cancelRemarks:
                                                    TCancelControllers
                                                        .remarksController
                                                        .text);

                                        if (data?.statusCode == "RMA-SUCCESS") {
                                          TCancelControllers.clear();
                                          if (Get.isDialogOpen == true) {
                                            Get.back();
                                            var headerMsg = data
                                                ?.customMessageDetails
                                                .messageHeader;
                                            var descMsg = data
                                                ?.customMessageDetails
                                                .messageDescription;
                                            showSuccessAlert(
                                              title: headerMsg,
                                              content: descMsg,
                                              function: () {
                                                Get.back();
                                              },
                                            );
                                          }
                                          tc
                                            ..transactionCancelStatus = false
                                            ..update();
                                          tc.getData(refresh: true);
                                        } else {
                                          TCancelControllers.clear();
                                          if (Get.isDialogOpen == true) {
                                            Get.back();
                                            showFailAlert(
                                                content:
                                                    data?.statusMessage ?? '');
                                          }
                                          tc
                                            ..transactionCancelStatus = false
                                            ..update();
                                        }
                                      }
                                    },
                                  )
                                : loader(top: 20)
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }),
    barrierColor: Get.find<AccountController>().isDark
        ? AppConfigs.w.withOpacity(0.2)
        : null,
  ).whenComplete(() => Get.delete<TransferController>());
}
