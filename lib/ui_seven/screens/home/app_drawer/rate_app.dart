import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/account_controller.dart';
import '../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../network/api_service_new.dart';

Future<void> rateApp() async {
  final accountController = Get.find<AccountController>();
  accountController.feedbackStatus.value = false;
  FeedbackControllers.feedback.clear();
  accountController.starCount = 0;
  bool isDark = Get.find<AccountController>().isDark;

  await Get.dialog(
    barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null,
    Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
            color: AppConfigs.bodybg(isDark),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('enjoying_the_app'.tr,
                      style:
                          TS.f20.copyWith(color: isDark ? AppConfigs.w : null)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      unratedColor: isDark ? Colors.grey.shade600 : null,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        accountController.starCount = rating.toInt();
                        print(rating);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'how_can_we_make_it_better'.tr,
                      style: TS.f16
                          .copyWith(color: isDark ? AppConfigs.g8f : null),
                    ),
                  ),
                  textFormField(
                    cHeight: 86,
                    noPad: true,
                    controller: FeedbackControllers.feedback,
                  ),
                  accountController.appStatus != AppStatus.loggedIn
                      ? const SizedBox()
                      : const SizedBox(height: 10),
                  Visibility(
                    visible: accountController.appStatus != AppStatus.loggedIn,
                    child: textFormField(
                      labelText: 'Email'.tr,
                      left: 16,
                      right: 16,
                      keyboardType: TextInputType.emailAddress,
                      controller: FeedbackControllers.email,
                    ),
                  ),
                  Visibility(
                    visible: accountController.appStatus != AppStatus.loggedIn,
                    child: textFormField(
                      labelText: 'Phone'.tr,
                      left: 16,
                      right: 16,
                      bottom: 0,
                      keyboardType: TextInputType.phone,
                      prefixText: '+${Box3.countryCode}',
                      controller: FeedbackControllers.phone,
                      maxLength: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => accountController.feedbackStatus.isTrue
                        ? Center(child: loader())
                        : RowColumnButton(
                            reverseOrder:
                                Box3.settings.EnableSwipeButton == true
                                    ? false
                                    : true,
                            isRow: Box3.settings.EnableSwipeButton == true
                                ? false
                                : true,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppConfigs.primaryColor,
                                    foregroundColor: Colors.white),
                                onPressed: () async {
                                  accountController
                                    ..feedbackStatus.value = true
                                    ..update();

                                  var data = await ApiService().sendFeedback(
                                    FeedbackControllers.feedback.text,
                                    email: accountController.appStatus ==
                                            AppStatus.loggedIn
                                        ? Box3.customerDetailsFZ?.data!.email
                                        : FeedbackControllers.email.text,
                                    phone:
                                        '${accountController.appStatus == AppStatus.loggedIn ? Box3.customerDetailsFZ?.data!.mobileNo : '${Box3.countryCode}${FeedbackControllers.phone.text}'}',
                                    feedbackType: 'feedback',
                                    ratingStars: accountController.starCount,
                                  );

                                  if (data == true) {
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    TCControllers.clear();
                                    FeedbackControllers.clear();
                                    if (Get.isDialogOpen == true) {
                                      Get.back();
                                      FeedbackControllers.feedback.clear();
                                      showSuccessAlert(content: "Success");
                                    }

                                    accountController
                                      ..feedbackStatus.value = false
                                      ..update();
                                  } else {
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    TCControllers.clear();
                                    FeedbackControllers.clear();
                                    if (Get.isDialogOpen == true) {
                                      Get.back();
                                      showFailAlert(content: "Failed");
                                    }
                                    accountController
                                      ..feedbackStatus.value = false
                                      ..update();
                                  }
                                },
                                child: Text("Submit"),
                              ),
                              roundButton(
                                cms(Fields.PopUp_Cancel).textHeading!,
                                borderOnly: true,
                                noMar: true,
                                isCancelButton: true,
                                onTap: () => Get.back(),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(height: 5)
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
