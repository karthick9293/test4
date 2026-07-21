import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/exports/ui_seven_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../network/api_service_new.dart';
import '../nid_alerts.dart';

void deviceExistsWithAnotherCivilId() {
  bool buttonLoading = false;
  String buttonText = 'Deregister'.tr;
  if (!Get.isRegistered<SignUpController>()) {}
  {
    Get.put(SignUpController());
  }
  Get.dialog(
    GetBuilder<SignUpController>(builder: (signUpController) {
      return userExistsAlert(
        signUpController.isDark,
        svgIcon: SvgIcons.deviceVerify,
        title: 'Deregister this device',
        body: GetBuilder<SignUpController>(builder: (signUpController) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () async {},
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            style: TS.f14.copyWith(
                                color: signUpController.isDark
                                    ? AppConfigs.gb5
                                    : null),
                            text: 'This device is currently registered with '),
                        TextSpan(
                            style: TS.f14.copyWith(
                                color: signUpController.isDark
                                    ? AppConfigs.gb5
                                    : AppConfigs.primaryColor),
                            text: '"${APIConstants.clientName}."'),
                        TextSpan(
                            style: TS.f14.copyWith(
                                color: signUpController.isDark
                                    ? AppConfigs.gb5
                                    : null),
                            text:
                                ' Deregister the device only if not used by you. On reregistration you may require to sign up again in this device.')
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: buttonLoading
                    ? Center(child: loader(top: 15, bottom: 15))
                    : RowColumnButton(
                        reverseOrder: Box3.settings.EnableSwipeButton == true
                            ? false
                            : true,
                        isRow: Box3.settings.EnableSwipeButton == true
                            ? false
                            : true,
                        children: [
                          roundButton(buttonText, noMar: true, onTap: () async {
                            buttonLoading = true;
                            signUpController.update();
                            await Future.delayed(const Duration(seconds: 2));
                            bool result = await ApiService().deRegister();
                            if (result) {
                              buttonText = 'Unregistered_Successfully'.tr;

                              await Box3.setStatus(AppStatus.onBoarded);
                              Box3.customerDetailsFZ = null;
                              Box3.customerDetailsFZ = null;
                              await Box3.auth1.erase();
                              await Box3.data.erase();
                              Box3.fetchUAEPassDoc = null;
                              Get.find<AccountController>()
                                ..customerDetails = null
                                ..selfieImage.value = null
                                ..frontImage = null
                                ..backImage = null
                                ..docIds.clear()
                                ..customerEKYC = null
                                ..update();
                              // Get.reloadAll(force: true);
                              await Get.find<DataController>().clear();
                              final TransferController transferController;
                              if (Get.isRegistered<TransferController>()) {
                                transferController =
                                    Get.find<TransferController>();
                              } else {
                                transferController = Get.put(TransferController(
                                    transferType: TransferType.all));
                              }
                              transferController.reset(t: TransferType.all);
                              await Box3.setStatus(AppStatus.onBoarded);
                              Get.offAllNamed(AppRoutes.preLogin);
                              Get.put(MainController());
                              Get.put(AccountController());
                              Get.find<MainController>()
                                ..pages.clear()
                                ..appBars.clear()
                                ..push(AppRoutes.getPage(AppRoutes.dashboard),
                                    dashBoardAppbar())
                                ..update();
                              Get.find<AccountController>()
                                ..appStatus = AppStatus.onBoarded
                                ..update();
                            }

                            buttonLoading = false;
                            signUpController.update();
                            if (result) {
                              await Future.delayed(
                                  const Duration(milliseconds: 100));
                              if (Get.isDialogOpen == true) {
                                Get.back();
                              }
                              errorAlert(
                                  title: 'Deregister this device',
                                  content: buttonText);
                            }
                          }),
                          roundButton(
                              cms(Fields.PopUp_Cancel).textHeading ??
                                  "Cancel".tr,
                              noMar: true,
                              isCancelButton: true,
                              borderOnly: true),
                        ],
                      ),
              ),
              // roundButton('ok'.tr, top: 10)
            ],
          );
        }),
      );
    }),
  );
}
