import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/exports/ui_one_custom_widgets.dart';
import '../../../core/flavours/constants.dart';

class BranchLocatorPage extends StatelessWidget {
  final bool isPrelogin;

  const BranchLocatorPage({super.key, this.isPrelogin = false});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return GetBuilder<AccountController>(builder: (accountController) {
      accountController.getBranches();
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Visibility(
                  visible: isPrelogin,
                  child: appBar0('branch_locator'.tr, onTap2: Get.back)),
              textFormField(
                left: 34,
                top: 30,
                bottom: 10,
                right: 34,
                hintText: 'Search_Branch'.tr,
                controller: controller,
                onChanged: (s) => accountController.update(),
                trailing: Container(
                  width: 40,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(ImagePath.search,
                      colorFilter: ColorFilter.mode(
                          accountController.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.g4,
                          BlendMode.srcIn),
                      height: 20,
                      width: 20),
                ),
              ),
              Expanded(
                child: accountController.branches == null &&
                        !accountController.branchFailed
                    ? loader()
                    : accountController.branches == null
                        ? RefreshIndicator(
                            color: AppConfigs.primaryColor,
                            backgroundColor: accountController.isDark
                                ? AppConfigs.g21
                                : AppConfigs.w,
                            onRefresh: () async {
                              accountController
                                ..branchFailed = false
                                ..update();
                              await accountController.getBranches();
                            },
                            child: ListView(children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 200),
                                child: Text(
                                    'Something went wrong, please pull down to refresh or try after sometime'),
                              )
                            ]))
                        : controller.text.isNotEmpty &&
                                accountController.branches!
                                    .where((e) =>
                                        e.branchName!.toLowerCase().contains(
                                            controller.text.toLowerCase()) ||
                                        e.branchAddress!.toLowerCase().contains(
                                            controller.text.toLowerCase()) ||
                                        e.phone!.toLowerCase().contains(
                                            controller.text.toLowerCase()) ||
                                        e.landmark!.toLowerCase().contains(
                                            controller.text.toLowerCase()) ||
                                        e.longitude!.toLowerCase().contains(
                                            controller.text.toLowerCase()) ||
                                        e.longitude!.toLowerCase().contains(
                                            controller.text.toLowerCase()))
                                    .toList()
                                    .isEmpty
                            ? Center(
                                child: Text(
                                'No Records Found',
                                style: TS.f20.copyWith(
                                    color: accountController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.g4),
                              ))
                            : ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                padding: const EdgeInsets.only(top: 10),
                                itemCount: accountController.branches!.length,
                                itemBuilder: (c, i) => Visibility(
                                  visible: controller.text.isNotEmpty
                                      ? accountController
                                              .branches![i].branchName!
                                              .toLowerCase()
                                              .contains(controller.text
                                                  .toLowerCase()) ||
                                          accountController
                                              .branches![i].latitude
                                              .toString()
                                              .toLowerCase()
                                              .contains(
                                                  controller.text.toLowerCase())
                                      : true,
                                  child: branchTile(
                                      accountController.branches![i],
                                      accountController.isDark),
                                ),
                              ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
