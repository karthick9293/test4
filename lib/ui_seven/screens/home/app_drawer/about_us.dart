// import 'package:mobiremit/core/controllers/main_controller.dart';
// import 'package:mobiremit/core/models/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class AboutUsPage extends GetView {
  final bool fromPrelogin;

  const AboutUsPage({super.key, this.fromPrelogin = false});

  @override
  Widget build(BuildContext context) {
    Get.find<AccountController>().getAboutus();
    return GetBuilder<AccountController>(builder: (accountController) {
      return GlobalScaffold(
        appBar: fromPrelogin
            ? appBar0(cms(Fields.AboutUs_PageHeading).textHeading!,
                onTap2: Get.back)
            : null,
        body: accountController.aboutUS == null &&
                !accountController.aboutUSFailed
            ? Center(child: loader())
            : accountController.aboutUS == null
                ? RefreshIndicator(
                    color: AppConfigs.primaryColor,
                    backgroundColor: accountController.isDark
                        ? AppConfigs.g21
                        : AppConfigs.w,
                    onRefresh: () async {
                      accountController
                        ..aboutUSFailed = false
                        ..update();
                      await accountController.getAboutus();
                    },
                    child: ListView(children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 200),
                        child: Text(
                            'Something went wrong, please pull down to refresh or try after sometime'),
                      )
                    ]))
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Html(
                        data: accountController.aboutUS!
                            .replaceAll("[", "<b>")
                            .replaceAll("]", "</b>"),
                        style: {
                          "body": Style(
                            fontSize: FontSize(14.0),
                            color: accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g77,
                            textAlign: TextAlign.justify,
                          ),
                        },
                      ),
                    ),
                  ),
      );
    });
  }
}
