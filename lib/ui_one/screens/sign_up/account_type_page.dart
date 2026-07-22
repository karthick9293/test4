import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/exports/ui_one_custom_widgets.dart';
import '../../../core/exports/ui_one_pages.dart';
import '../../../core/flavours/constants.dart';

class AccountTypePage extends StatelessWidget {
  const AccountTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    RxString accountType = ''.obs;
    return GetBuilder<AccountController>(builder: (accountController) {
      return Scaffold(
        appBar: appBar0('account_type'.tr, onTap2: Get.back),
        backgroundColor: accountController.isDark ? AppConfigs.b : AppConfigs.w,
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 12, left: 30, right: 30, top: 30),
                    child: Container(
                      width: double.infinity,
                      height: 77,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              color: const Color(0xffe1e1e1), width: 1),
                          color: accountController.isDark
                              ? AppConfigs.g21
                              : AppConfigs.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15.8, left: 0),
                            height: 20,
                            child: Row(
                              children: [
                                Obx(
                                  () => Radio(
                                      value: 'Individual',
                                      groupValue: accountType.value,
                                      onChanged: (value) {
                                        accountType.value = value.toString();
                                      }),
                                ),
                                Text(
                                  'individual_account'.tr,
                                  style: TextStyles.font14.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: accountController.isDark
                                          ? AppConfigs.w
                                          : null),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Text(
                              'suitable_for_individuals_to_send_and_receive'.tr,
                              style: TextStyles.font10.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: accountController.isDark
                                      ? AppConfigs.g8f
                                      : null),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 21, left: 30, right: 30, top: 0),
                    child: Container(
                      width: double.infinity,
                      height: 77,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                              color: const Color(0xffe1e1e1), width: 1),
                          color: accountController.isDark
                              ? AppConfigs.g21
                              : AppConfigs.w),
                      // margin: const EdgeInsets.only(left: 16.8, top: 15.8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 15.8, left: 0),
                            height: 20,
                            child: Row(
                              children: [
                                Obx(
                                  () => Radio(
                                      value: 'Business',
                                      groupValue: accountType.value,
                                      onChanged: (value) {
                                        accountType.value = value.toString();
                                      }),
                                ),
                                Text(
                                  'business_account'.tr,
                                  style: TextStyles.font14.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: accountController.isDark
                                          ? AppConfigs.w
                                          : null),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Text(
                              'suitable_for_business_and_freelancer_to_send_and_receive'
                                  .tr,
                              style: TextStyles.font10.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: accountController.isDark
                                      ? AppConfigs.g8f
                                      : null),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          bottom: 14, left: 30, right: 30),
                      child: RowColumnButton(
                        isRow: Box3.settings.EnableSwipeButton == true
                            ? false
                            : true,
                        children: [
                          roundButton('save'.tr, noMar: true),
                          roundButton('next'.tr,
                              borderOnly: true,
                              noMar: true,
                              onTap: () => Get.toNamed(AppRoutes.signUp)),
                        ],
                      )),
                  Text(
                      textAlign: TextAlign.center,
                      'skip'.tr,
                      style: TextStyles.font12.copyWith(
                        fontWeight: FontWeight.w600,
                        color: accountController.isDark
                            ? AppConfigs.g8f
                            : AppConfigs.g4,
                        decoration: TextDecoration.underline,
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
