import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/account_controller.dart';
import '../../../../core/exports/ui_four_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class FAQPage extends StatelessWidget {
  final bool isPreLogin;

  const FAQPage({super.key, this.isPreLogin = false});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return GetBuilder<AccountController>(builder: (accountController) {
      accountController.getFAQ();
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              Visibility(
                visible: isPreLogin,
                child: appBar0(cms(Fields.FAQ_PageHeading).textHeading ?? "",
                    onTap2: () {
                  if (Get.find<AccountController>().faqNode.hasFocus) {
                    Get.find<AccountController>().faqNode.unfocus();
                  }
                  Get.back();
                }),
              ),
              Expanded(
                child: accountController.faqs == null &&
                        !accountController.faqFailed
                    ? Center(child: loader())
                    : accountController.faqs == null
                        ? RefreshIndicator(
                            color: AppConfigs.primaryColor,
                            backgroundColor: accountController.isDark
                                ? AppConfigs.g21
                                : AppConfigs.w,
                            onRefresh: () async {
                              accountController
                                ..faqFailed = false
                                ..update();
                              await accountController.getFAQ();
                            },
                            child: ListView(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, top: 200),
                                child: Text(cms(Fields.FAQ_PageErrorMessage)
                                        .textHeading ??
                                    ""),
                              )
                            ]))
                        : Column(
                            children: [
                              textFormField(
                                key: key,
                                top: 20,
                                focusNode: accountController.faqNode,
                                controller: controller,
                                labelText:
                                    cms(Fields.FAQ_SearchFaq).textHeading ?? "",
                                onChanged: (v) {
                                  accountController.update();
                                },
                                onFocusChange: (b) {},
                                trailing: Container(
                                  width: 40,
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(ImagePath.search,
                                      height: 20, width: 20),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: controller.text.isNotEmpty &&
                                          accountController.faqs!
                                              .where((e) =>
                                                  e.Question.toLowerCase()
                                                      .contains(controller.text
                                                          .toLowerCase()) ||
                                                  e.Answer.toLowerCase()
                                                      .contains(controller.text
                                                          .toLowerCase()))
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
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount:
                                              accountController.faqs!.length,
                                          itemBuilder: (c, i) {
                                            var e = accountController.faqs![i];
                                            return Visibility(
                                              visible: e.Question.toLowerCase()
                                                      .contains(controller.text
                                                          .toLowerCase()) ||
                                                  e.Answer.toLowerCase()
                                                      .contains(controller.text
                                                          .toLowerCase()),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    accountController
                                                        .faqs![i].Question,
                                                    style: TS.f14.copyWith(
                                                        color: accountController
                                                                .isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs.g4,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                      accountController
                                                          .faqs![i].Answer,
                                                      style: TS.f12.copyWith(
                                                          color:
                                                              accountController
                                                                      .isDark
                                                                  ? AppConfigs
                                                                      .g8f
                                                                  : AppConfigs
                                                                      .g4),
                                                      textAlign:
                                                          TextAlign.justify),
                                                  const SizedBox(height: 10),
                                                  // Visibility(
                                                  //   visible: (Box3.status == AppStatus.loggedIn && accountController.faqs!.length - 1 == i),
                                                  //   child: GestureDetector(
                                                  //     onTap: () {
                                                  //       faqSearch();
                                                  //     },
                                                  //     child: Padding(
                                                  //       padding:
                                                  //           const EdgeInsets.only(
                                                  //               bottom: 20),
                                                  //       child: Text(
                                                  //           "Can_find_what".tr,
                                                  //           style: TS.f12.copyWith(
                                                  //               decoration:
                                                  //                   TextDecoration
                                                  //                       .underline,
                                                  //               color: AppConfigs
                                                  //                   .primaryColor)),
                                                  //     ),
                                                  //   ),
                                                  // )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ),
                            ],
                          ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
