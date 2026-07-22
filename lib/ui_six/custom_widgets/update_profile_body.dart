import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:mobiremit/ui_six/custom_widgets/row_column_button.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_six_custom_widgets.dart';
import '../../core/flavours/constants.dart';
import '../screens/home/app_drawer/edit_profile.dart';

GetBuilder updateProfileBody({String? msg, required String type}) => GetBuilder<KycController>(builder: (kycController) {
      String? contact = Get.find<AccountController>().contactUs?.data?.phoneNo.toString();
      var data = contact != null ? contact.split(':') : [];
      String customerNumber = data.isNotEmpty == true && data.length > 1 ? data[1] : '';
      return Align(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(minWidth: 400, maxWidth: 400, minHeight: 270, maxHeight: 500),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
                color: kycController.isDark ? AppConfigs.bf0 : AppConfigs.w),
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          ImagePath.close,
                          height: 20,
                          width: 20,
                          colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Center(child: SvgPicture.asset(SvgIcons.deviceVerify)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${'Alert'.tr}!',
                  style: TS.f20.copyWith(color: kycController.isDark ? AppConfigs.w : AppConfigs.bf0),
                ),
                const SizedBox(height: 10),
                Text(
                  msg?.isNotEmpty == true
                      ? msg ?? ''
                      : type == 'N'
                          ? 'Dear Customer, Please note that your kyc information needs to be updated. please update your new kyc details.'.tr
                          : 'Dear customer, your EKYC update is currently under the authorization process. Please wait for approval or call us'.tr +
                              customerNumber,
                  style: TS.f14.copyWith(
                    color: kycController.isDark ? AppConfigs.w : AppConfigs.g4,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                (Box3.settings.allowUpdateKYC || Box3.settings.enableEditProfile) && type != 'P'
                    ? RowColumnButton(
                        isRow: Box3.settings.EnableSwipeButton == true ? false : true,
                        children: [
                          roundButton('Update Now'.tr, noMar: true, onTap: () {
                            Get.back();
                            if (Get.isRegistered<KycController>()) {
                              Get.delete<KycController>();
                            }
                            Get.put(KycController());
                            Get.to(() => const EditProfilePage());
                          }),
                          roundButton('Update Later'.tr, noMar: true, isCancelButton: true)
                        ],
                      )
                    : roundButton('Ok'.tr, noMar: true),
              ],
            ),
          ),
        ),
      );
    });
