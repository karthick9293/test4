import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/network/api_endpoints.dart';

import '../../core/editing_controllers.dart/add_beneficiary_attributes.dart';
import '../../core/editing_controllers.dart/attributes.dart';
import '../../core/exports/controllers.dart';
import '../../core/exports/ui_one_custom_widgets.dart';
import '../../core/exports/ui_one_pages.dart';
import '../../core/flavours/constants.dart';
import '../../models/custom_message/custom_message_details_fz.dart';
import '../../models/reg_device/register_device_fz.dart';
import '../../network/api_service_new.dart';
import 'mpin_alert.dart';
import 'otp_alert.dart';

class BottomButtons {
  static Widget addBeneficiary =
      GetBuilder<AddBeneficiaryController>(builder: (addBeneficiaryController) {
    return Visibility(
      visible: Box3.settings.enableAddBenf,
      child: roundButton(
        cms(Fields.MyBeneficiary_AddBeneficiary).textHeading!,
        top: 20,
        onTap: () async {
          addBeneficiaryController
            ..benefAttributes = AddBeneficiaryAttributes()
            ..catalogueRetrieved = false;
          if (!AppConfigs.formRules) {
            addBeneficiaryController.getCatalogs();
          } else {
            // addBeneficiaryController.getBeneficiaryForm();
          }
          Get
            ..put(SignUpController())
            ..find<MainController>()
                .push(const AddBeneficiaryFormRules(), AppBars.addBeneficiary);
        },
      ),
    );
  });

  static Widget addBeneficiarySubmit =
      GetBuilder<AddBeneficiaryController>(builder: (addBeneficiaryController) {
    return addBeneficiaryController.addBeneficiaryButtonLoading
        ? loader()
        : roundButton(cms(Fields.PopUp_Submit).textHeading!,
            left: 20, top: 20, right: 20, bottom: 20, onTap: () async {
            if (AppConfigs.formRules) {
              if (!addBeneficiaryController.form.validateNew(
                  addBeneficiaryController.beneficiaryFormBV!.formFieldItem,
                  validate: addBeneficiaryController.visibilityChecker)) {
                addBeneficiaryController.update();
              } else {
                addBeneficiaryController
                  ..addBeneficiaryButtonLoading = true
                  ..update();
                if (addBeneficiaryController.benefAttributes.isAddBeneficiary) {
                  switch (Box3.settings.authBenfAdd) {
                    case AuthMode.mPin:
                      Get.find<AuthController>().dialogAuthAttributes =
                          DialogMpinAuthAttributes();
                      validateMPIN(
                          onCompleted: addBeneficiaryController.addBeneficiary);
                      addBeneficiaryController
                        ..addBeneficiaryButtonLoading = false
                        ..loading = false
                        ..update();
                      break;
                    case AuthMode.otpPhone:
                      addBeneficiaryController
                        ..addBeneficiaryButtonLoading = true
                        ..update();
                      RegisterDeviceFZ? reg = await ApiService()
                          .createOTP(OtpType.CREATE_ADDBENEFICIARY_OTP);
                      if (reg != null && reg.data != null) {
                        addBeneficiaryController
                          ..addBeneficiaryButtonLoading = false
                          ..update();
                        TimerContoller t = Get.put(TimerContoller());
                        t.startTimer1();
                        t
                          ..isResend = false
                          ..update();
                        // t.startTimer();
                        validateOTP(
                            controller: t.dialogOtpAuthAttributes.mobOTP,
                            errorText: '',
                            validationValue: OtpType.CREATE_ADDBENEFICIARY_OTP,
                            resendOTP: (r) {
                              if (r != null) {
                                reg = r;
                              }
                            },
                            onChanged: (v) {
                              if (v.isNotEmpty && t.errorText.isNotEmpty) {
                                t.errorText = '';
                              }
                            },
                            onValidate: () async {
                              if (t.dialogOtpAuthAttributes.mobOTP.text.length <
                                  6) {
                                t
                                  ..errorText = 'Enter 6 digit OTP'
                                  ..buttonLoading = false
                                  // ..dialogOtpAuthAttributes.mobOTP.clear()
                                  ..update();
                              } else {
                                t
                                  ..buttonLoading = true
                                  ..update();

                                Map<String, dynamic> validateOtpRes =
                                    await ApiService().validateOtpRequest(
                                        otpID: reg!.data!.notificationArray!
                                            .first.otpId!,
                                        otp: t.dialogOtpAuthAttributes.mobOTP
                                            .text);
                                CustomMessageDetailsFZ? customMessageDetails =
                                    validateOtpRes['message'];
                                bool isVerified = validateOtpRes['IsValid'];
                                if (isVerified) {
                                  Get.back();
                                  t
                                    ..errorText = ''
                                    ..buttonLoading = false
                                    ..dialogOtpAuthAttributes.mobOTP.clear()
                                    ..update();
                                  await addBeneficiaryController
                                      .addBeneficiary();
                                } else {
                                  t
                                    ..errorText = customMessageDetails
                                            ?.MessageDescription ??
                                        'Invalid OTP'
                                    ..buttonLoading = false
                                    ..dialogOtpAuthAttributes.mobOTP.clear()
                                    ..update();
                                }

                                // String? msg = await ApiService().validateOtp(
                                //     otp: t.dialogOtpAuthAttributes.mobOTP.text,
                                //     validationValue:
                                //         Box3.customerDetailsFZ?.data?.idNo ??
                                //             '',
                                //     validationSource:
                                //         t.isResend ? "ResendOTP" : 'BenefOTP');
                                // if (msg == "OTP Verified") {
                                //   Get.back();
                                //   t
                                //     ..errorText = ''
                                //     ..buttonLoading = false
                                //     ..dialogOtpAuthAttributes.mobOTP.clear()
                                //     ..update();
                                //   await addBeneficiaryController
                                //       .addBeneficiary();
                                // } else if (msg == 'Invalid OTP') {
                                //   t
                                //     ..errorText = 'Invalid OTP'
                                //     ..buttonLoading = false
                                //     ..dialogOtpAuthAttributes.mobOTP.clear()
                                //     ..update();
                                // }
                              }
                            });
                      }
                      addBeneficiaryController
                        ..addBeneficiaryButtonLoading = false
                        ..loading = false
                        ..update();
                      break;
                    default:
                      await addBeneficiaryController.addBeneficiary();
                      break;
                  }
                } else {
                  switch (Box3.settings.authBenfEdit) {
                    case AuthMode.mPin:
                      Get.find<AuthController>().dialogAuthAttributes =
                          DialogMpinAuthAttributes();
                      validateMPIN(
                          onCompleted:
                              addBeneficiaryController.updateBeneficiary);
                      addBeneficiaryController
                        ..addBeneficiaryButtonLoading = true
                        ..loading = false
                        ..update();
                      break;
                    case AuthMode.otpPhone:
                      addBeneficiaryController
                        ..addBeneficiaryButtonLoading = true
                        ..update();
                      RegisterDeviceFZ? reg = await ApiService()
                          .createOTP(OtpType.CREATE_ADDBENEFICIARY_OTP);
                      if (reg != null && reg.data != null) {
                        addBeneficiaryController
                          ..addBeneficiaryButtonLoading = false
                          ..update();
                        TimerContoller t = Get.put(TimerContoller());
                        t.startTimer1();
                        t
                          ..isResend = false
                          ..update();
                        // t.startTimer();
                        validateOTP(
                            controller: t.dialogOtpAuthAttributes.mobOTP,
                            errorText: '',
                            validationValue: OtpType.CREATE_ADDBENEFICIARY_OTP,
                            resendOTP: (r) {
                              if (r != null) {
                                reg = r;
                              }
                            },
                            onChanged: (v) {
                              if (v.isNotEmpty && t.errorText.isNotEmpty) {
                                t.errorText = '';
                              }
                            },
                            onValidate: () async {
                              if (t.dialogOtpAuthAttributes.mobOTP.text.length <
                                  6) {
                                t
                                  ..errorText = 'Enter 6 digit OTP'
                                  ..buttonLoading = false
                                  // ..dialogOtpAuthAttributes.mobOTP.clear()
                                  ..update();
                              } else {
                                t
                                  ..buttonLoading = true
                                  ..update();

                                Map<String, dynamic> validateOtpRes =
                                    await ApiService().validateOtpRequest(
                                        otpID: reg!.data!.notificationArray!
                                            .first.otpId!,
                                        otp: t.dialogOtpAuthAttributes.mobOTP
                                            .text);
                                CustomMessageDetailsFZ? customMessageDetails =
                                    validateOtpRes['message'];
                                bool isVerified = validateOtpRes['IsValid'];
                                if (isVerified) {
                                  Get.back();
                                  t
                                    ..errorText = ''
                                    ..buttonLoading = false
                                    ..dialogOtpAuthAttributes.mobOTP.clear()
                                    ..update();
                                  await addBeneficiaryController
                                      .addBeneficiary();
                                } else {
                                  t
                                    ..errorText = customMessageDetails
                                            ?.MessageDescription ??
                                        'Invalid OTP'
                                    ..buttonLoading = false
                                    ..dialogOtpAuthAttributes.mobOTP.clear()
                                    ..update();
                                }

                                // String? msg = await ApiService().validateOtp(
                                //     otp: t.dialogOtpAuthAttributes.mobOTP.text,
                                //     validationValue:
                                //         Box3.customerDetailsFZ?.data?.idNo ??
                                //             '',
                                //     validationSource:
                                //         t.isResend ? "ResendOTP" : 'BenefOTP');
                                // if (msg == "OTP Verified") {
                                //   Get.back();
                                //   t
                                //     ..errorText = ''
                                //     ..buttonLoading = false
                                //     ..dialogOtpAuthAttributes.mobOTP.clear()
                                //     ..update();
                                //   await addBeneficiaryController
                                //       .addBeneficiary();
                                // } else if (msg == 'Invalid OTP') {
                                //   t
                                //     ..errorText = 'Invalid OTP'
                                //     ..buttonLoading = false
                                //     ..dialogOtpAuthAttributes.mobOTP.clear()
                                //     ..update();
                                // }
                              }
                            });
                      }
                      addBeneficiaryController
                        ..addBeneficiaryButtonLoading = false
                        ..loading = false
                        ..update();
                      break;
                    default:
                      await addBeneficiaryController.updateBeneficiary();
                      break;
                  }
                }
              }
            }
          });
  });

  static Widget createAlert = Visibility(
    visible: Box3.settings.enableCreateAlert,
    child: GetBuilder<MainController>(builder: (mainController) {
      return roundButton(
          cms(Fields.ForexBooking_CreateAlertButton).textHeading!,
          bottom: 20,
          onTap: () => mainController.push(
              const CreateAlertPage(), AppBars.createAlert));
    }),
  );

  static Widget download =
      GetBuilder<TransactionController>(builder: (transactionController) {
    return Obx(
      () => Visibility(
        visible: transactionController.transactions
            .where((t) =>
                (transactionController.name.isNotEmpty ? (t.beneficiaryName ?? '').toLowerCase().contains(transactionController.name.toLowerCase()) || (t.transactionReference ?? '').toLowerCase().contains(transactionController.name.toLowerCase()) : true) &&
                (transactionController.status.isNotEmpty && t.transactionStatus != null
                    ? (transactionController.status.contains('Processing') &&
                            t.transactionStatus!
                                .toLowerCase()
                                .contains('processing')) ||
                        (transactionController.status.contains('Success') &&
                            t.transactionStatus!
                                .toLowerCase()
                                .contains('success')) ||
                        (transactionController.status.contains('Failed') &&
                            t.transactionStatus!
                                .toLowerCase()
                                .contains('failed')) ||
                        (transactionController.status.contains('Cancelled') &&
                            t.transactionStatus!
                                .toLowerCase()
                                .contains('cancelled'))
                    : true) &&
                (transactionController.paymentInstrument.isNotEmpty
                    ? (transactionController.paymentInstrument.contains(true) && t.serviceType == 'C' ||
                        transactionController.paymentInstrument.contains(true) && t.serviceType == 'W' ||
                        transactionController.paymentInstrument.contains(false) && t.serviceType == 'B')
                    : true) &&
                (transactionController.startDate != null && t.transactionDate != null ? t.transactionDate!.toLocal().isAfter(transactionController.startDate!) : true) &&
                (transactionController.endDate != null && t.transactionDate != null ? t.transactionDate!.toLocal().isBefore(transactionController.endDate!) : true))
            .toList()
            .isNotEmpty,
        child: transactionController.downloadingStatement.isTrue
            ? loader(bottom: 20)
            : roundButton(cms(Fields.MyTransaction_DownloadButton).textHeading!,
                bottom: 20, top: 20, onTap: () {
                transactionController.downloadStatement();
              }),
      ),
    );
  });

  static Widget sendMoneyNext = GetBuilder<TransferController>(
    key: UniqueKey(),
    builder: (transferController) {
      return (transferController.buttonLoading)
          ? loader()
          : roundButton(
              cms(Fields.SendMoney_NextButton).textHeading!,
              top: 20,
              onTap: () async {
                double fAmt =
                    double.tryParse(transferController.fromAmountCtrl.text) ??
                        0;
                double tAmt =
                    double.tryParse(transferController.toAmountCtrl.text) ?? 0;
                if (fAmt == 0) {
                  transferController
                    ..fromAmtErr = 'Amount_Should_be_greater_than_0'.tr
                    ..update();
                } else if (tAmt == 0) {
                  transferController
                    ..toAmtErr = 'Amount_Should_be_greater_than_0'.tr
                    ..update();
                } else if (transferController.selectedBeneficiary == null &&
                    Get.context != null) {
                  ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
                    content: Text('Select_Beneficiary'.tr),
                    backgroundColor: Colors.redAccent,
                  ));
                } else if (transferController.sendMoneyFormBV != null &&
                    !transferController.form.validateNew(
                      transferController.sendMoneyFormBV!.formFieldItem,
                    )) {
                  transferController.update();
                } else if (transferController.selectedPurpose == null ||
                    transferController.selectedSource == null) {
                  transferController.sourceError =
                      transferController.selectedSource == null;
                  transferController.purposeError =
                      transferController.selectedPurpose == null;
                  transferController.update();
                  GlobalKey? targetKey;
                  if (transferController.purposeError) {
                    targetKey = transferController.purposeDropdownKey;
                  } else if (transferController.sourceError) {
                    targetKey = transferController.sourceDropdownKey;
                  }
                  if (targetKey?.currentContext != null) {
                    await Scrollable.ensureVisible(
                      targetKey!.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      alignment: 0.2,
                    );
                  }
                } else {
                  transferController
                    ..sourceError = false
                    ..purposeError = false
                    ..update();

                  if (transferController.rC?.statusCode == 'CC-SUCC') {
                    Get.find<MainController>().push(
                        AppRoutes.getPage(AppRoutes.confirmPaymentDetails),
                        AppBars.confirmPaymentDetails);
                  } else if (transferController.rC?.statusCode == '403') {
                    errorAlert(
                        content: transferController
                                .rC!.customMessageDetails?.messageDescription ??
                            "");
                  }
                }
              },
            );
    },
  );
  static Widget sendMoneyNext2 =
      GetBuilder<TransferController>(builder: (transferController) {
    return roundButton(cms(Fields.SendMoney_ProceedButton).textHeading!,
        top: 20, onTap: () {
      transferController
        ..purposeError = transferController.selectedPurpose == null
        ..sourceError = transferController.selectedSource == null
        ..update();
      if (((transferController.selectedBeneficiary?.serviceType?.Code
                          .toUpperCase() ==
                      'C' ||
                  transferController.selectedBeneficiary?.serviceType?.Code
                          .toUpperCase() ==
                      'W')
              ? !transferController.serviceProviderError
              : true) &&
          !transferController.sourceError &&
          !transferController.purposeError) {
        Get.find<MainController>()
            .push(PaymentModeScreen(), AppBars.confirmPaymentDetails);
      }
    });
  });
}
