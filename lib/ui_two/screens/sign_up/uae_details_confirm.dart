import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../ui_one/custom_widgets/date_field1.dart';

class UAEConfirmDetails extends StatelessWidget {
  final Map<String, String>? data;
  final Function()? onTap;
  final List<String>? urls;

  // final Map<String, List<String>> uaePassImages;

  const UAEConfirmDetails(this.data, this.onTap, this.urls, {super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return Scaffold(
        appBar: appBar0('Confirm Details', onTap2: Get.back),
        backgroundColor: AppConfigs.bodybg(signUpController.isDark),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  data != null
                      ? Column(
                          children: data!.keys
                              .map((e) => dummyTextField(
                                  data![e], signUpController.isDark,
                                  labelText: e))
                              .toList(),
                        )
                      : Column(
                          children: [
                            dateField1(
                                ctrls: signUpController
                                    .signUpAttributes.dobDateCtrls,
                                nodes: signUpController
                                    .signUpAttributes.dobDateNodes,
                                update: signUpController.update,
                                firstDate: DateTime(1900),
                                initialDate: DateTime(now.year - 18),
                                lastDate: DateTime(now.year - 18),
                                topMargin: 0,
                                erfc: (b, {DateTime? date}) {
                                  //TODO: Handle age limit here
                                  signUpController
                                    ..signUpAttributes.dobError =
                                        (!b ? 'Invalid_date'.tr : '')
                                    ..update();
                                },
                                onComplete: () {
                                  signUpController.getNext('dob', BottomSheet);
                                },
                                context: context,
                                title:
                                    '${'dob_as_per_passport'.tr} ${Box3.settings.primaryDocID})*',
                                error:
                                    signUpController.signUpAttributes.dobError),
                            dateField(
                                ctrls: signUpController
                                    .signUpAttributes.idIssueDateCtrls,
                                nodes: signUpController
                                    .signUpAttributes.idIssueDateNodes,
                                error: signUpController
                                    .signUpAttributes.idIssueDateError,
                                update: signUpController.update,
                                initialDate: DateTime(1900),
                                firstDate: DateTime(1900),
                                lastDate:
                                    DateTime(now.year, now.month, now.day),
                                topMargin: 0,
                                erfc: (b, {DateTime? date}) {
                                  //TODO: Handle age limit here
                                  signUpController
                                    ..signUpAttributes.idIssueDateError =
                                        b ? '' : 'Invalid_date'.tr
                                    ..update();
                                },
                                onComplete: () {
                                  signUpController.getNext(
                                      'id_issue_date', BottomSheet);
                                },
                                context: context,
                                title: 'ID_Issue_date_optional'.tr +
                                    'optional'.tr),
                            dateField(
                                ctrls: signUpController
                                    .signUpAttributes.idExpiryDateCtrls,
                                nodes: signUpController
                                    .signUpAttributes.idExpiryDateNodes,
                                error: signUpController
                                    .signUpAttributes.idExpiryDateError,
                                update: signUpController.update,
                                initialDate: DateTime.now(),
                                firstDate:
                                    DateTime(now.year, now.month, now.day),
                                lastDate: DateTime(now.year + 40),
                                topMargin: 0,
                                erfc: (b, {DateTime? date}) {
                                  //TODO: Handle age limit here
                                  signUpController
                                    ..signUpAttributes.idExpiryDateError =
                                        b ? '' : 'Invalid_date'.tr
                                    ..update();
                                },
                                onComplete: () {
                                  signUpController.getNext(
                                      'id_expiry_date', BottomSheet);
                                },
                                context: context,
                                title: 'ID_Expiry_date_required'.tr)
                          ],
                        ),
                  (urls != null && urls?.isNotEmpty == true)
                      ? Column(
                          children: urls!
                              .map(
                                (e) => Image.network(
                                  e,
                                  errorBuilder: (context, object, stacktrace) =>
                                      const SizedBox(),
                                ),
                              )
                              .toList(),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            roundButton(
              'Confirm and proceed',
              onTap: onTap,
            )
          ],
        ),
      );
    });
  }
}
