import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/transaction_query_type/query_type_fz.dart';

import '../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/complaint_or_feeback/feedback_complaint_fz.dart';
import '../../../../network/api_service_new.dart';

Future<void> transactionComplaint(
  String transactionRefNo,
  String type, {
  QueryTypeFz? selectedQueryType,
}) async {
  TCControllers.clear();

  if (!Get.isRegistered<TransactionController>()) {
    Get.put(TransactionController());
  }

  Get.find<TransactionController>()
    ..isError = false
    ..update();

  await Get.dialog(
    GetBuilder<AccountController>(builder: (accountController) {
      return Center(
        child: Container(
          // width: Get.width * 0.92,
          constraints: const BoxConstraints(maxWidth: 420),
          margin: const EdgeInsets.only(left: 30, right: 30),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: accountController.isDark ? AppConfigs.b : AppConfigs.w,
            boxShadow: const [
              BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 2),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: GetBuilder<TransactionController>(builder: (tc) {
              final bool isComplaint = type ==
                  cms(Fields.TransactionComplaint_PageHeading).textHeading!;

              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Close button
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: SvgPicture.asset(
                          ImagePath.close,
                          height: 22,
                          width: 22,
                          colorFilter: ColorFilter.mode(
                              AppConfigs.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Title
                    Text(
                      type,
                      textAlign: TextAlign.center,
                      style: TS.f22.copyWith(
                        fontWeight: FontWeight.w700,
                        color: accountController.isDark
                            ? AppConfigs.w
                            : AppConfigs.g4,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Subtitle (customized message)
                    Text(
                      isComplaint
                          ? cms(Fields.TransactionComplaint_SubHeading)
                                  .textHeading ??
                              "Report any issue you faced with your transaction."
                          : cms(Fields.SendTransactionEnquiry_SubHeading)
                                  .textHeading ??
                              "Submit an enquiry regarding your transaction details.",
                      textAlign: TextAlign.center,
                      style: TS.f14.copyWith(
                        color: const Color(0xFF757575),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Label
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        cms(Fields.SendTransactionEnquiry_Type).textHeading!,
                        style: TS.f16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: accountController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Dropdown
                    customDropdown<QueryTypeFz>(
                      items: tc.queryTypes
                          .map((query) => DropdownMenuItem<QueryTypeFz>(
                                value: query,
                                child: Text(
                                  query.queryTypeName ?? '',
                                  style: TS.f16.copyWith(
                                    color: tc.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.g4,
                                  ),
                                ),
                              ))
                          .toList(),
                      hintText: isComplaint
                          ? cms(Fields.TransactionComplaint_SelectType)
                              .textHeading!
                          : cms(Fields.SendTransactionEnquiry_SelectType)
                              .textHeading!,
                      // hintText: cms(Fields.SendTransactionEnquiry_SelectType)
                      //     .textHeading!,
                      onChanged: (queryType) {
                        selectedQueryType = queryType;
                        tc
                          ..isError = false
                          ..update();
                      },
                      noPad: true,
                    ),

                    if (tc.isError)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: errorText(
                          cms(Fields.SendTransactionEnquiry_SelectType)
                              .textHeading!,
                        ),
                      ),

                    const SizedBox(height: 18),

                    // Description Field
                    textFormField(
                      cHeight: 110,
                      left: 0,
                      right: 0,
                      controller: TCControllers.notes,
                      hintText: isComplaint
                          ? cms(Fields.TransactionComplaint_InputText)
                              .textHeading!
                          : cms(Fields.SendTransactionEnquiry_InputText)
                              .textHeading!,
                      textInputAction: TextInputAction.done,
                      onChanged: (s) {
                        if (s.isNotEmpty) {
                          TCControllers.notesError = '';
                          accountController.update();
                        }
                      },
                      errorText: TCControllers.notesError,
                    ),

                    const SizedBox(height: 28),

                    // Buttons or Loader
                    tc.complaintStatus
                        ? loader(top: 10)
                        : Row(
                            children: [
                              Expanded(
                                child: roundButton(
                                  cms(Fields.TransactionComplaint_Cancel)
                                      .textHeading!,
                                  borderOnly: true,
                                  noMar: true,
                                  isCancelButton: true,
                                  onTap: () => Get.back(),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: roundButton(
                                  cms(Fields.TransactionComplaint_Submit)
                                      .textHeading!,
                                  noMar: true,
                                  onTap: () async {
                                    if (TCControllers.notes.text
                                            .trim()
                                            .isNotEmpty &&
                                        selectedQueryType != null) {
                                      tc
                                        ..complaintStatus = true
                                        ..update();

                                      try {
                                        FeedbackComplaintFz? data =
                                            await ApiService()
                                                .sendTransactionEnquiry(
                                          TCControllers.notes.text,
                                          email: Box3.customerDetailsFZ?.data
                                                  ?.email ??
                                              '',
                                          phone: Box3.customerDetailsFZ?.data
                                                  ?.mobileNo ??
                                              '',
                                          transactionRefNo: transactionRefNo,
                                          queryType: selectedQueryType!
                                              .queryTypeCode!
                                              .toString(),
                                          enquiryType: isComplaint ? "1" : "2",
                                        );

                                        TCControllers.clear();

                                        if (Get.isDialogOpen == true) {
                                          Get.back();
                                          if (data?.statusCode == "RMA-SUCC" ||
                                              data?.statusCode == "CC-SUCC") {
                                            showSuccessAlert(
                                              title: data?.customMessageDetails
                                                  .messageHeader,
                                              content:
                                                  '${data?.customMessageDetails.messageDescription} TrackID: ${data?.data?.enquiryCode}',
                                            );
                                          } else {
                                            showFailAlert(
                                              header: data?.customMessageDetails
                                                      .messageHeader ??
                                                  '',
                                              content: data
                                                      ?.customMessageDetails
                                                      .messageDescription ??
                                                  '',
                                            );
                                          }
                                        }

                                        tc
                                          ..complaintStatus = false
                                          ..update();
                                      } catch (e) {
                                        tc
                                          ..complaintStatus = false
                                          ..update();
                                      }
                                    } else {
                                      if (selectedQueryType == null) {
                                        tc
                                          ..isError = true
                                          ..update();
                                      } else {
                                        TCControllers.notesError =
                                            'required'.tr;
                                        accountController.update();
                                      }
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              );
            }),
          ),
        ),
      );
    }),
    barrierColor: Get.find<AccountController>().isDark
        ? AppConfigs.w.withOpacity(0.2)
        : Colors.black.withOpacity(0.3),
  ).whenComplete(() => Get.delete<TransferController>());
}
