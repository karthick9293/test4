import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/controllers/auth_controller.dart';
import '../../../core/exports/ui_four_custom_widgets.dart';
import '../../../core/flavours/constants.dart';

class ResetMpinPage extends StatelessWidget {
  final bool fromSettings;

  const ResetMpinPage({super.key, this.fromSettings = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(authController.isDark),
        body: Column(
          children: [
            Visibility(
                visible: !fromSettings,
                child: appBar0('Reset_MPIN'.tr, onTap2: Get.back)),
            textFormField(
              hintText: 'Current_MPIN'.tr,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
            textFormField(
              hintText: 'New_MPIN'.tr,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
            textFormField(
              hintText: 'Confirm_MPIN'.tr,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.number,
            ),
            roundButton(cms(Fields.PopUp_Submit).textHeading!, top: 20)
          ],
        ),
      );
    });
  }
}
