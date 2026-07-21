import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/account_controller.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final bool isPrelogin;

  const PrivacyPolicyPage({super.key, this.isPrelogin = false});

  @override
  Widget build(BuildContext context) {
    Get.find<AccountController>().getPrivacyPolicy();
    return GetBuilder<AccountController>(builder: (accountController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        appBar: isPrelogin ? appBar0(cms(Fields.PrivacyPolicy_PageHeading).textHeading!, onTap2: Get.back) : null,
        body: Container(
          decoration: BoxDecoration(
              gradient: accountController.isDark?null:AppConfigs.linearGradientUiSix
          ),
          child: accountController.privacyPolicy == null && !accountController.privacyPolicyFailed
              ? Center(child: loader())
              : accountController.privacyPolicy == null
                  ? RefreshIndicator(
                      color: AppConfigs.primaryColor,
                      backgroundColor: accountController.isDark ? AppConfigs.g21 : AppConfigs.w,
                      onRefresh: () async {
                        accountController
                          ..privacyPolicyFailed = false
                          ..update();
                        await accountController.getPrivacyPolicy();
                      },
                      child: ListView(children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 200),
                          child: Text('Something went wrong, please pull down to refresh or try after sometime'),
                        )
                      ]))
                  : SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: accountController.privacyPolicy!.isEmpty
                            ? const Center(child: Text('Something went wrong'))
                            : SingleChildScrollView(
                                child: Html(
                                  data: accountController.privacyPolicy!,
                                  style: {
                                    'body': Style(
                                      fontSize: FontSize(14.0),
                                      color: accountController.isDark ? AppConfigs.w : AppConfigs.g77,
                                      textAlign: TextAlign.justify,
                                    )
                                  },
                                ),
                                // Text(
                                //   accountController.privacyPolicy!,
                                //   textAlign: TextAlign.justify,
                                //   style: TS.f14.copyWith(
                                //     color: accountController.isDark
                                //         ? AppConfigs.g8f
                                //         : AppConfigs.g77,
                                //   ),
                                // ),
                              ),

                        // : ListView.builder(
                        //     physics: const ClampingScrollPhysics(),
                        //     itemCount: texts.length,
                        //     itemBuilder: (c, i) => Text(
                        //           (int.tryParse(texts[i].trim()[0]) != null
                        //                   ? ''
                        //                   : '\n') +
                        //               (int.tryParse(texts[i].trim()[0]) != null
                        //                   ? texts[i].trim()
                        //                   : texts[i]),
                        //           textAlign: TextAlign.justify,
                        //           style: TS.f14.copyWith(
                        //             color:
                        //                 accountController.isDark ? AppConfigs.g8f : AppConfigs.g77,
                        //           ),
                        //         )),
                      ),
                    ),
        ),
      );
    });
  }
}
