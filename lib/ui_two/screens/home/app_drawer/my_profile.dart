import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/form_rules/form_rules_response_fz.dart';
import '../../../custom_widgets/flip_card.dart';
import '../../../shimmers/profile_shimmers.dart';
import 'edit_profile.dart';

class MyProfilePage extends StatefulWidget {
  final bool? fromDashboard;
  const MyProfilePage({super.key, this.fromDashboard = false});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<AccountController>();
    controller.idSideActiveIdx.value = 0;
    controller.getEKYCData();
    controller.getMyProfileForm();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      var customerData = Box3.customerDetailsFZ?.data?.toJson();
      // Function to handle loading state and returning the list
      List<List<String>> children() {
        List<List<String>> l = [];

        // Show loading indicator if myProfileFormBV is null (data is not available)
        if (accountController.myProfileFormBV == null) {
          return []; // Returning empty list for now, but we can return a widget for loading if needed
        }
        List<FormFieldItem> fields =
            accountController.myProfileFormBV!.formFieldItem.toList();
        fields.sort((a, b) => a.index.compareTo(b.index));

        for (FormFieldItem f in fields) {
          if (f.FieldDisplayName.contains("Profile Image") ||
              f.FieldDisplayName.contains("National ID Front Page") ||
              f.FieldDisplayName.contains("National ID Back Page") ||
              f.FieldDisplayName.contains("Name")) {
            continue;
          }
          switch (f.FieldType) {
            case FieldType.text:
              // print(f.FzParamName);
              // print(customerData?.keys.toList());

              String displayValue =
                  customerData?[f.FzParamName]?.toString() ?? '';
              if (f.FzParamName == "GenderCode") {
                displayValue =
                    customerData?['Gender'] ?? customerData?[f.FzParamName];
              }
              if (f.FzParamName == "Mobile") {
                displayValue = customerData?['MobileNo'];
              }
              if (f.FzParamName == "NationalityCode") {
                displayValue = customerData?['Nationality'];
              }
              l.add([
                '${f.FieldDisplayName} : ',
                displayValue,
              ]);

              break;
          }
        }
        return l;
      }

      // Return the ListView with profile data
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        body: Column(
          children: [
            AppbarUiTwo(
              title: "Personal Details",
              onTap: () {
                widget.fromDashboard == false
                    ? Get.back()
                    : Get.find<MainController>().pop();
              },
            ),
            Expanded(
              child: accountController.myProfileFormLoading
                  ? ProfileShimmers()
                  : accountController.myProfileFormBV == null
                      ? Center(
                          child: Text(
                              "My Profile formRule not loaded \nPlease go back and try again"),
                        ) // Show loading spinner if no data
                      : ListView(
                          physics: const ClampingScrollPhysics(),
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(34, 20, 0, 20),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (kDebugMode) {
                                        // Debug action
                                      }
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          height: 66,
                                          width: 66,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(33),
                                              color: ConstColors.greyd7),
                                          child: Box3.customerDetailsFZ?.data
                                                      ?.profilePic !=
                                                  null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(33),
                                                  child: Base64Image(
                                                    image: Box3
                                                        .customerDetailsFZ!
                                                        .data!
                                                        .profilePic!,
                                                    height: 250,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : const Icon(
                                                  Icons.person,
                                                  size: 50,
                                                  color: AppConfigs.g4,
                                                ),
                                        ),
                                        Visibility(
                                          visible: false, // Still hidden
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            height: 66,
                                            width: 66,
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppConfigs.accentColor,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                size: 20,
                                                grade: 40,
                                                color: AppConfigs.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${cms(Fields.MyProfile_Hi).textHeading!} ${Box3.customerDetailsFZ?.data?.name}",
                                          style: TS.f22.copyWith(
                                              color: accountController.isDark
                                                  ? AppConfigs.w
                                                  : AppConfigs.g14),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 5),
                                              child: Icon(
                                                Icons.call,
                                                size: 12,
                                                color: accountController.isDark
                                                    ? AppConfigs.w
                                                    : null,
                                              ),
                                            ),
                                            Text(
                                              Box3.customerDetailsFZ?.data
                                                      ?.mobileNo ??
                                                  '',
                                              style: TS.f12.copyWith(
                                                  color:
                                                      accountController.isDark
                                                          ? AppConfigs.g8f
                                                          : AppConfigs.g77),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            lightBlueTile(
                              name: "${Box3.customerDetailsFZ?.data?.name}",
                              allowEdit: (Box3.settings.enableEditProfile),
                              isSpaces: false,
                              isProfile: true,
                              contents: [],
                              onEdit: () {
                                if (Get.isRegistered<KycController>()) {
                                  Get.delete<KycController>();
                                }
                                Get.put(KycController()).profileAttributes =
                                    ProfileAttributes();
                                Get.to(() => const EditProfilePage());
                              },
                              title: cms(Fields.MyProfile_PersnalDetails)
                                  .textHeading!,
                              more: Container(
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: AppConfigs.g70.withOpacity(0.1)),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                child: singleHeadAndContentColumn(children(),
                                    c: CrossAxisAlignment.start),
                              ),
                            ),
                            // Section for EKYC details
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.fromLTRB(30, 16, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Documents",
                                    style: TS.f18.copyWith(
                                        color: accountController.isDark
                                            ? AppConfigs.g8f
                                            : AppConfigs.g4,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Center(
                                    child: Column(
                                      children: [
                                        FlipCardWidget(
                                          frontImage:
                                              accountController.frontImage,
                                          backImage:
                                              accountController.backImage,
                                        ),
                                        Obx(
                                          () => AnimatedSmoothIndicator(
                                            activeIndex: accountController
                                                .idSideActiveIdx.value,
                                            count: 2,
                                            effect: SwapEffect(
                                              type: SwapType.yRotation,
                                              dotHeight: 8,
                                              dotWidth: 8,
                                              dotColor: Color(0xffDBDBDB),
                                              activeDotColor:
                                                  AppConfigs.primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
            ),
          ],
        ),
      );
    });
  }

  Uint8List isValidBase64(String s) {
    return const Base64Decoder().convert(s);
  }
}
