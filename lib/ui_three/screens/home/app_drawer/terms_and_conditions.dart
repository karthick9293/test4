import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_three_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class TermsAndConditionsPage extends StatelessWidget {
  final bool isPreLogin;

  const TermsAndConditionsPage({super.key, this.isPreLogin = false});

  @override
  Widget build(BuildContext context) {
    Get.find<AccountController>().getTermsAndConditions();
    return GetBuilder<AccountController>(builder: (accountController) {
      return GlobalScaffold(
        appBar: isPreLogin
            ? appBar0(cms(Fields.TermsAndConditions_PageHeading).textHeading!,
                onTap2: Get.back)
            : null,
        body: accountController.termsAndConditions == null &&
                !accountController.termsAndConditionsFailed
            ? Center(child: loader())
            : accountController.termsAndConditions == null
                ? RefreshIndicator(
                    color: AppConfigs.primaryColor,
                    backgroundColor: accountController.isDark
                        ? AppConfigs.g21
                        : AppConfigs.w,
                    onRefresh: () async {
                      accountController
                        ..termsAndConditionsFailed = false
                        ..update();
                      await accountController.getTermsAndConditions();
                    },
                    child: ListView(children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 200),
                        child: Text(
                            'Something went wrong, please pull down to refresh or try after sometime'),
                      )
                    ]))
                : Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      child: Html(
                        data: accountController.termsAndConditions!,
                        style: {
                          'body': Style(
                            fontSize: FontSize(14.0),
                            color: accountController.isDark
                                ? AppConfigs.w
                                : AppConfigs.g77,
                            textAlign: TextAlign.justify,
                          )
                        },
                      ),
                      // Text(
                      //   accountController.termsAndConditions!,
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
      );
    });
  }
}
