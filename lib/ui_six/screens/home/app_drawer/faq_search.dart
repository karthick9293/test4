import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../network/api_service_new.dart';

void faqSearch() {
  FAQControllers.clear();
  Get.dialog(Align(
    alignment: Alignment.center,
    child: GetBuilder<AccountController>(builder: (accountController) {
      return Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
              color: Colors.white),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // accountController
                  // ..feedbackStatus = "Submit"
                  // ..update();
                  // accountController
                  //   ..isFeedbackError = false
                  //   ..update();
                  Get.back();
                },
                child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      ImagePath.close,
                      height: 20,
                      width: 20,
                      colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),
                    )),
              ),
              // Enter your own question below box and submit.
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child:
                    Text("Enter_your_own_question_below_box_and_submit".tr, style: TS.f14.copyWith(color: AppConfigs.g4), textAlign: TextAlign.start),
              ),

              textFormField(
                  cHeight: 100,
                  left: 10,
                  right: 10,
                  controller: FAQControllers.faq,
                  hintText: 'Enter_your_text_here'.tr,
                  textInputAction: TextInputAction.done,
                  onChanged: (s) {
                    if (s.isNotEmpty) {
                      FAQControllers.feedbackError = '';
                      accountController.update();
                    }
                  },
                  errorText: FAQControllers.feedbackError),
              Visibility(
                visible: accountController.appStatus != AppStatus.loggedIn,
                child: textFormField(
                    labelText: 'Phone'.tr,
                    left: 10,
                    right: 10,
                    prefixText: '',
                    keyboardType: TextInputType.phone,
                    controller: FAQControllers.phone,
                    maxLength: 8,
                    onChanged: (s) {
                      if (s.isNotEmpty) {
                        FAQControllers.mobileError = '';
                        accountController.update();
                      }
                    },
                    errorText: FAQControllers.mobileError),
              ),
              Visibility(
                visible: accountController.appStatus != AppStatus.loggedIn,
                child: textFormField(
                    labelText: 'Email'.tr,
                    left: 10,
                    right: 10,
                    keyboardType: TextInputType.emailAddress,
                    controller: FAQControllers.email,
                    onChanged: (s) {
                      if (s.isNotEmpty) {
                        FAQControllers.emailError = '';
                        accountController.update();
                      }
                    },
                    errorText: FAQControllers.emailError),
              ),
              // !accountController.isFeedbackError ? const SizedBox() : errorText('failed'.tr),
              accountController.feedbackStatus.isFalse
                  ? roundButton(
                      cms(Fields.PopUp_Submit).textHeading!,
                      top: 15,
                      left: 10,
                      right: 10,
                      bottom: 15,
                      onTap: () async {
                        if (FAQControllers.faq.text.trim().isNotEmpty) {
                          if (accountController.appStatus == AppStatus.loggedIn) {
                            accountController
                              ..feedbackStatus.value = true
                              ..update();
                            bool data = await ApiService().sendFeedback(FAQControllers.faq.text,
                                email: accountController.appStatus == AppStatus.loggedIn
                                    ? Box3.customerDetailsFZ?.data!.email
                                    : FAQControllers.email.text,
                                phone:
                                    '${accountController.appStatus == AppStatus.loggedIn ? Box3.customerDetailsFZ?.data!.mobileNo : FAQControllers.phone.text}',
                                feedbackType: 'faq');

                            if (data == true) {
                              await Future.delayed(const Duration(seconds: 2));
                              TCControllers.clear();
                              if (Get.isDialogOpen == true) {
                                Get.back();
                                showSuccessAlert(content: "Success");
                              }

                              accountController
                                ..feedbackStatus.value = false
                                ..update();
                            } else {
                              await Future.delayed(const Duration(seconds: 2));
                              TCControllers.clear();
                              if (Get.isDialogOpen == true) {
                                Get.back();
                                showFailAlert(content: 'Failed');
                              }
                              accountController
                                ..feedbackStatus.value = false
                                ..update();
                            }
                          } else {
                            if (!FAQControllers.validateFAQ()) {
                              accountController.update();
                            } else {
                              accountController
                                ..feedbackStatus.value = true
                                ..update();

                              bool data = await ApiService().sendFeedback(FAQControllers.faq.text,
                                  email: accountController.appStatus == AppStatus.loggedIn
                                      ? Box3.customerDetailsFZ?.data!.mobileNo
                                      : FAQControllers.email.text,
                                  phone:
                                      '974${accountController.appStatus == AppStatus.loggedIn ? Box3.customerDetailsFZ?.data!.mobileNo : FAQControllers.phone.text}',
                                  feedbackType: 'faq');

                              if (data == true) {
                                await Future.delayed(const Duration(seconds: 2));
                                TCControllers.clear();
                                if (Get.isDialogOpen == true) {
                                  Get.back();
                                  showSuccessAlert(content: "Success");
                                }

                                accountController
                                  ..feedbackStatus.value = false
                                  ..update();
                              } else {
                                await Future.delayed(const Duration(seconds: 2));
                                TCControllers.clear();
                                if (Get.isDialogOpen == true) {
                                  Get.back();
                                  showFailAlert(content: 'Failed');
                                }
                                accountController
                                  ..feedbackStatus.value = false
                                  ..update();
                              }
                            }
                          }
                        } else {
                          FAQControllers.feedbackError = "required".tr;
                          accountController.update();
                        }
                      },
                    )
                  : loader(top: 20),
            ],
          ),
        ),
      );
    }),
  ));
}
