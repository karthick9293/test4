import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/banks/drawing_bank_fz.dart';

import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../exports/controllers.dart';
import '../flavours/constants.dart';

class LoginAttributes {
  TextEditingController mobileNoCtrl = TextEditingController(),
      idNo = TextEditingController(),
      pwd = TextEditingController(),
      mpin = TextEditingController(),
      usernameCtrl = TextEditingController();
  String mobileNoError = '',
      passwordErrorText = '',
      userNameError = '',
      mpinErrorText = '';
  bool obscure = true;
  FocusNode pwdNode = FocusNode(), mpinNode = FocusNode();

  void clear() {
    mobileNoCtrl.clear();
    idNo.clear();
    pwd.clear();
    mpin.clear();
    usernameCtrl.clear();
    mobileNoError = '';
    passwordErrorText = '';
    userNameError = '';
    mpinErrorText = '';
    obscure = true;
  }
}

class ChangePasswordAttributes {
  FocusNode currentPasswordFocusNode = FocusNode(),
      newPasswordFocusNode = FocusNode(),
      confirmPasswordFocusNode = FocusNode();
  TextEditingController currentPasswordController = TextEditingController(),
      newPasswordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  double passwordStrength = 0.0;
  String confirmErrorText = '', newErrorText = '', currentErrorText = '';

  bool currentObscure = true;
  bool newObscure = true;
  bool confirmObscure = true;

  void clear() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    passwordStrength = 0.0;
  }

  bool validate(String authenticationMethod2) {
    currentErrorText = currentPasswordController.text.isEmpty
        ? 'required'.tr
        : currentPasswordController.text.length < 6
            ? 'incomplete'.tr
            : '';
    newErrorText = newPasswordController.text.isEmpty
        ? 'required'.tr
        : newPasswordController.text.length < 6
            ? 'incomplete'.tr
            : '';
    confirmErrorText = confirmPasswordController.text.isEmpty
        ? 'required'.tr
        : confirmPasswordController.text.length < 6
            ? 'incomplete'.tr
            : newPasswordController.text != confirmPasswordController.text
                ? 'mismatch'.tr
                : '';

    newErrorText = (newPasswordController.text.contains(RegExp(r'[A-Z]')) &&
            newPasswordController.text.contains(RegExp(r'[a-z]')) &&
            newPasswordController.text.contains(RegExp(r'[0-9]')) &&
            newPasswordController.text.contains(RegExp(r'[!@#\$&*~]')) &&
            newPasswordController.text.length > 7)
        ? ''
        : 'Please follow password pattern';
    return currentErrorText.isEmpty &&
        newErrorText.isEmpty &&
        confirmErrorText.isEmpty &&
        (authenticationMethod2 !=
                'MPIN' //Todo: Handle a per fixed string in lists of admin config
            ? passwordStrength == 1
            : true);
  }
}

class ResetCredencialsAttributes {
  FocusNode newPasswordFocusNode = FocusNode(),
      confirmPasswordFocusNode = FocusNode();
  TextEditingController newPasswordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  double passwordStrength = 0.0;
  String confirmErrorText = '', newErrorText = '';

  bool newObscure = true;
  bool confirmObscure = true;

  void clear() {
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  bool validate() {
    newErrorText = newPasswordController.text.isEmpty
        ? 'required'.tr
        : newPasswordController.text.length < 6
            ? 'incomplete'.tr
            : '';
    confirmErrorText = confirmPasswordController.text.isEmpty
        ? 'required'.tr
        : confirmPasswordController.text.length < 6
            ? 'incomplete'.tr
            : newPasswordController.text != confirmPasswordController.text
                ? 'mismatch'.tr
                : '';
    return newErrorText.isEmpty && confirmErrorText.isEmpty;
  }
}

class FeedbackControllers {
  static TextEditingController feedback = TextEditingController(),
      phone = TextEditingController(),
      email = TextEditingController();

  static void clear() {
    feedback.clear();
    phone.clear();
    email.clear();
  }
}

class TCControllers {
  static String notesError = '', emailError = '', mobileError = '';

  static TextEditingController notes = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController();

  static void clear() {
    notes.clear();
    email.clear();
    phone.clear();
    notesError = '';
    emailError = '';
    mobileError = '';
  }

  static bool validateFAQ() {
    mobileError = phone.text.isEmpty
        ? 'required'.tr
        : phone.text.length < 8
            ? 'Invalid_phone_number'.tr
            : '';
    emailError = email.text.isEmpty
        ? 'required'.tr
        : !email.text.isEmail
            ? 'invalid_email'.tr
            : '';
    notesError = notes.text.isEmpty ? 'required'.tr : '';

    return mobileError.isEmpty && emailError.isEmpty && notesError.isEmpty;
  }
}

class TCancelControllers {
  static String remarksError = '', referenceNoError = '';

  static TextEditingController remarksController = TextEditingController()

      // referenceController = TextEditingController()
      ;

  static void clear() {
    remarksController.clear();
    // referenceController.clear();
    remarksError = '';
    // referenceNoError = '';
  }

  static bool validateCancelTransaction() {
    // referenceNoError = remarksController.text.isEmpty
    //     ? 'required'.tr
    //     : '';
    remarksError = remarksController.text.isEmpty ? 'required'.tr : '';

    // return referenceNoError.isEmpty && remarksError.isEmpty;
    return remarksError.isEmpty;
  }
}

class FAQControllers {
  static String feedbackError = '', emailError = '', mobileError = '';

  static TextEditingController faq = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController();

  static void clear() {
    faq.clear();
    email.clear();
    phone.clear();
    feedbackError = '';
    emailError = '';
    mobileError = '';
  }

  static bool validateFAQ() {
    mobileError = phone.text.isEmpty
        ? 'required'.tr
        : phone.text.length < 8
            ? 'Invalid_phone_number'.tr
            : '';
    emailError = email.text.isEmpty
        ? 'required'.tr
        : !email.text.isEmail
            ? 'invalid_email'.tr
            : '';
    feedbackError = faq.text.isEmpty ? 'required'.tr : '';

    return mobileError.isEmpty && emailError.isEmpty && feedbackError.isEmpty;
  }
}

class BankAttributes {
  static DrawingBankFz? drawingBank;
  static PayAccountNumberFZ? payAccountNumber;
  static TextEditingController paymentReferenceNumberController =
      TextEditingController();
  static FocusNode paymentReferenceNumberFocusNode = FocusNode();
  static String drawingBankError = '',
      payAccountNumberError = '',
      paymentReferenceNumberError = '',
      referenceNumber = '',
      billError = '';

  static void clear() {
    drawingBank = null;
    payAccountNumber = null;
    paymentReferenceNumberController.clear();
    drawingBankError = '';
    payAccountNumberError = '';
    paymentReferenceNumberError = '';
  }

  static bool isValid() {
    drawingBankError = drawingBank == null ? 'required'.tr : '';
    if (drawingBankError.isNotEmpty) return false;

    payAccountNumberError = payAccountNumber == null ? 'required'.tr : '';
    if (payAccountNumberError.isNotEmpty) return false;
    paymentReferenceNumberError =
        paymentReferenceNumberController.text.isEmpty ? 'required'.tr : '';
    if (paymentReferenceNumberError.isNotEmpty) return false;
    return true;
  }
}

class CreateAlertAttributes {
  MasterResponseFZ? fromCurrency, toCurrency;

  TextEditingController amount = TextEditingController();
  TextEditingController remAmount = TextEditingController();
  TextEditingController forAmount = TextEditingController();

  // String amountError = '';
  String remAmountError = '';
  String forAmountError = '';

  void clear() {
    remAmount = TextEditingController();
    forAmount = TextEditingController();
    remAmountError = '';
    forAmountError = '';
  }
}

class ForexBookingAttributes {
  MasterResponseFZ? fromCurrency, toCurrency;
  bool isLoading = false;

  /// forex booking
  bool acceptTAndC = false;
  String tAndCError = '', forexDateError = '';
  List<TextEditingController> forexDateCtrls = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> forexDateNodes = [FocusNode(), FocusNode(), FocusNode()];

  TextEditingController amount = TextEditingController(),
      remarks = TextEditingController();

  String amountError = '';
  String remAmountError = '';
  String forAmountError = '';
  String remarkError = '';

  void clear() {
    // forexDateCtrls.clear();
    // forexDateNodes.clear();
    tAndCError = '';
    forexDateError = '';
    amount = TextEditingController();
    remAmountError = '';
    forAmountError = '';
    amountError = '';
    remarkError = '';
  }

  bool compareDate(List<TextEditingController> controllers,
      {bool checkEmpty = false, DateTime? firstDate, DateTime? lastDate}) {
    DateTime? d1;
    if (!checkEmpty) {
      d1 = DateTime(int.parse(controllers[2].text),
          int.parse(controllers[1].text), int.parse(controllers[0].text));
    }
    return checkEmpty
        ? (controllers[0].text.isEmpty ||
            controllers[1].text.isEmpty ||
            controllers[2].text.isEmpty)
        : (firstDate != null ? d1!.isAfter(firstDate) : true) &&
            (lastDate != null ? d1!.isBefore(lastDate) : true);
  }
}

class ForgotPasswordTextControllers {
  TextEditingController validationValue = TextEditingController(),
      otp = TextEditingController(),
      newPwd = TextEditingController(),
      nid = TextEditingController(),
      mobile = TextEditingController(),
      dobDate = TextEditingController(),
      expiryDate = TextEditingController(),
      confPwd = TextEditingController();

  FocusNode newPwdNode = FocusNode(), confPwdNode = FocusNode();

  List<TextEditingController> expiryDateCtrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> dobCtrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> expiryFocus = [FocusNode(), FocusNode(), FocusNode()];
  List<FocusNode> dobFocus = [FocusNode(), FocusNode(), FocusNode()];

  String otpErrorText = '',
      // errTxt = '',
      fieldErrorText = '',
      newPwddErrTxt = '',
      pinFieldErrorText = '',
      expiryErrorText = '',
      dobErrorText = '',
      mobileErrorText = '',
      nidErrorText = '',
      cnfPwdErrTxt = '';

  void clear() {
    validationValue.text = '';
    otp.text = '';
    newPwd.clear();
    clear();
    confPwd.clear();
    otpErrorText = '';
    dobDate.clear();
    expiryDate.clear();
    // errTxt = '',
    fieldErrorText = '';
    newPwddErrTxt = '';
    pinFieldErrorText = '';
    expiryErrorText = '';
    dobErrorText = '';
    mobileErrorText = '';
    nidErrorText = '';
    cnfPwdErrTxt = '';
  }

  bool validateNew(controller) {
    bool status = true;
    if (nid.text.isEmpty) {
      nidErrorText = '${Box3.settings.primaryDocID} ${'required'.tr}';
      status = false;
    }
    if (nid.text.length < (Box3.settings.nidMinLength)) {
      nidErrorText = 'incomplete'.tr;
      status = false;
    }
    if (mobile.text.isEmpty) {
      mobileErrorText = "required".tr;
      status = false;
    }
    if (dobDate.text.isEmpty) {
      dobErrorText = "required".tr;
      status = false;
    }
    if (expiryDate.text.isEmpty) {
      expiryErrorText = "required".tr;
      status = false;
    }
    controller.update();
    return status;
  }

  // bool validate(
  //     {required String authenticationMethod2, double forgotPwdStrength = 1}) {
  //   newPwddErrTxt =
  //       newPwd.text.length < (authenticationMethod2 == 'MPIN' ? 6 : 8)
  //           ? 'incomplete'.tr
  //           : '';
  //   cnfPwdErrTxt = newPwd.text != confPwd.text
  //       ? authenticationMethod2 == 'MPIN'
  //           ? 'MPIN mismatch'.tr
  //           : 'password_mismatch'.tr
  //       : newPwd.text.length < (authenticationMethod2 == 'MPIN' ? 6 : 8)
  //           ? 'incomplete'.tr
  //           : '';
  //
  //   if (authenticationMethod2 == "USERNAME") {
  //     // Simple validation for username: only check non-empty and pattern matches alpha-numeric
  //     if (newPwd.text.isEmpty ||
  //         !RegExp(r'^[A-Za-z0-9]+$').hasMatch(newPwd.text)) {
  //       newPwddErrTxt = 'Invalid username';
  //       //update();
  //       return false;
  //     }
  //   }
  //
  //   if (authenticationMethod2 == 'MPIN') {
  //     newPwddErrTxt = (newPwd.text.contains(RegExp(r'[A-Z]')) &&
  //             newPwd.text.contains(RegExp(r'[a-z]')) &&
  //             newPwd.text.contains(RegExp(r'[0-9]')) &&
  //             newPwd.text.contains(RegExp(r'[!@#\$&*~]')) &&
  //             newPwd.text.length > 7)
  //         ? ''
  //         : 'Please follow password pattern';
  //   }
  //
  //   return newPwddErrTxt.isEmpty &&
  //       cnfPwdErrTxt.isEmpty &&
  //       ((authenticationMethod2 != 'MPIN') ? forgotPwdStrength == 1 : true);
  // }
  bool validate({
    required String authenticationMethod2,
    double forgotPwdStrength = 1,
  }) {
    newPwddErrTxt = '';
    cnfPwdErrTxt = '';

    if (authenticationMethod2 == 'MPIN') {
// MPIN must be 6-digit numeric
      if (newPwd.text.length != 6 ||
          !RegExp(r'^\d{6}$').hasMatch(newPwd.text)) {
        newPwddErrTxt = 'incomplete'.tr;
      }
      if (confPwd.text != newPwd.text) {
        cnfPwdErrTxt = 'MPIN mismatch'.tr;
      }
    } else if (authenticationMethod2 == 'USERNAME') {
// Username: must be alphanumeric and match confirm
      if (newPwd.text.isEmpty ||
          !RegExp(r'^[A-Za-z0-9]{6,}$').hasMatch(newPwd.text)) {
        newPwddErrTxt = 'Username must be at least 6 alphanumeric characters';
      }
      if (confPwd.text != newPwd.text) {
        cnfPwdErrTxt = 'Username does not match';
      }
    } else if (authenticationMethod2 == 'PASSWORD') {
// Password: must meet all criteria
      if (!(newPwd.text.contains(RegExp(r'[A-Z]')) &&
          newPwd.text.contains(RegExp(r'[a-z]')) &&
          newPwd.text.contains(RegExp(r'[0-9]')) &&
          newPwd.text.contains(RegExp(r'[!@#$&*~]')) &&
          newPwd.text.length >= 8)) {
        newPwddErrTxt = 'Please follow password pattern';
      }
      if (confPwd.text != newPwd.text) {
        cnfPwdErrTxt = 'password_mismatch'.tr;
      }
      if (forgotPwdStrength < 1) {
        newPwddErrTxt = 'Weak password';
      }
    }

    // update();

    return newPwddErrTxt.isEmpty && cnfPwdErrTxt.isEmpty;
  }
}

class FormParameters {
  FormParameters({required this.type});

  final FormType type;

  bool initialised = false;

  void clear() {
    textFieldControllers.clear();
    searchControllers.clear();
    dateFieldControllers.clear();
    dateFieldNodes.clear();
    sources.clear();
    multiSelectedSources.clear();
    selectedSources.clear();
    dates.clear();
    checkBoxes.clear();
    accNoLengthValidationMsg.clear();
    errorTexts.clear();
    visibilities.clear();
    nodes.clear();
    keys.clear();
    initialised = false;
  }
  Map<String, TextEditingController> textFieldControllers =
          <String, TextEditingController>{},
      searchControllers = <String, TextEditingController>{};
  Map<String, List<TextEditingController>> dateFieldControllers =
      <String, List<TextEditingController>>{};
  Map<String, List<FocusNode>> dateFieldNodes = <String, List<FocusNode>>{};
  Map<String, List<MasterResponseFZ>> sources =
          <String, List<MasterResponseFZ>>{},
      multiSelectedSources = <String, List<MasterResponseFZ>>{};
  Map<String, MasterResponseFZ> selectedSources = <String, MasterResponseFZ>{};
  Map<String, String> dates = <String, String>{};
  Map<String, bool> checkBoxes = <String, bool>{};

  // Map<String, DateTime> dates = <String, DateTime>{};
  Map<String, String> accNoLengthValidationMsg = <String, String>{};
  Map<String, String> errorTexts = <String, String>{};
  Map<String, bool> visibilities = <String, bool>{};
  Map<String, FocusNode> nodes = <String, FocusNode>{};
  Map<String, GlobalKey> keys = <String, GlobalKey>{};

  void initialiseForm(List<FormFieldItem> list, {Map<String, dynamic>? data}) {
    //print(data);
    selectedSources = <String, MasterResponseFZ>{};
    if (type == FormType.signUpCustomerDetails) {
      errorTexts['t&c'] = '';
      keys['t&c'] = GlobalKey();
    }
    for (var e in list) {
      final String uniqueKey = e.Id.toString();
      errorTexts[e.FzParamName] = '';
      if (e.Masking != "") {
        visibilities[e.FzParamName] = true;
      }
      keys[uniqueKey] = GlobalKey();

      switch (e.FieldType) {
        case FieldType.text:
          final defValue = data?[e.FzParamName] ?? e.DefaultValue;
          final cleanValue = defValue?.replaceAll('"', '').trim();
          textFieldControllers[e.FzParamName] = TextEditingController(
            text:
                (cleanValue != null && cleanValue.isNotEmpty) ? defValue : null,
          );
          nodes[e.FzParamName] = FocusNode();
          break;
        case FieldType.dateTime:
          dates.clear();
          dateFieldControllers[e.FzParamName] = [
            TextEditingController(),
            TextEditingController(),
            TextEditingController()
          ];
          dateFieldNodes[e.FzParamName] = [
            FocusNode(),
            FocusNode(),
            FocusNode()
          ];
          break;
        case FieldType.date:
          dates.clear();
          List<String> splittedDate = [];
          if (data?[e.FzParamName] != null && data?[e.FzParamName] != '') {
            String formatedDate = formatDateString(data![e.FzParamName]);
            splittedDate = formatedDate.split('/');

            dateFieldControllers[e.FzParamName] = [
              TextEditingController(
                  text: splittedDate.length == 3 ? splittedDate.first : ''),
              TextEditingController(
                  text: splittedDate.length == 3 ? splittedDate[1] : ''),
              TextEditingController(
                  text: splittedDate.length == 3 ? splittedDate.last : '')
            ];
            dateFieldNodes[e.FzParamName] = [
              FocusNode(),
              FocusNode(),
              FocusNode()
            ];
            dates[e.FzParamName] = formatedDate;
          } else {
            dateFieldControllers[e.FzParamName] = [
              TextEditingController(),
              TextEditingController(),
              TextEditingController()
            ];
            dateFieldNodes[e.FzParamName] = [
              FocusNode(),
              FocusNode(),
              FocusNode()
            ];
          }
          break;
        case FieldType.username:
          textFieldControllers[e.FzParamName] =
              TextEditingController(text: data?[e.FzParamName]);
          nodes[e.FzParamName] = FocusNode();
          break;
        case FieldType.number:
          final defValue = data?[e.FzParamName] ?? e.DefaultValue;
          final cleanValue = defValue?.replaceAll('"', '').trim();
          textFieldControllers[e.FzParamName] = TextEditingController(
            text:
                (cleanValue != null && cleanValue.isNotEmpty) ? defValue : null,
          );
          if (e.FzParamName == 'dummy_confirmaccountNumber') {
            textFieldControllers[e.FzParamName]!.text =
                textFieldControllers['AccountNumber']?.text ?? '';
          }
          nodes[e.FzParamName] = FocusNode();
          break;
        case FieldType.dropDownSingle:
          searchControllers[e.FzParamName] = TextEditingController();
          if (data != null && data[e.FzParamName] != null) {
            if (data[e.FzParamName] is MasterResponseFZ) {
              selectedSources[e.FzParamName] = data[e.FzParamName];
            } else if (type == FormType.addBeneficiary) {
              selectedSources[e.FzParamName] = data[e.FzParamName];
            } else {
              selectedSources[e.FzParamName] = MasterResponseFZ().copyWith(
                Desc: (data[e.FzParamName2] ?? '').toString(),
                Code: data[e.FzParamName].toString(),
              );
            }
          }
          break;
        case FieldType.dropDownMulti:
          searchControllers[e.FzParamName] = TextEditingController();
          break;
        case FieldType.radio:
          if (data != null && data[e.FzParamName] != null) {
            if (data[e.FzParamName] is MasterResponseFZ) {
              selectedSources[e.FzParamName] = data[e.FzParamName];
            } else {
              selectedSources[e.FzParamName] = MasterResponseFZ().copyWith(
                Desc: (data[e.FzParamName2] ?? '').toString(),
                Code: data[e.FzParamName].toString(),
              );
            }
          }
          nodes[e.FzParamName] = FocusNode();
          break;
        case FieldType.checkBox:
          checkBoxes[e.FzParamName] = false;
          keys[uniqueKey] = GlobalKey();
          nodes[e.FzParamName] = FocusNode();
          break;
      }
    }
  }

  void initDefaultValue(List<FormFieldItem> list) {
    for (FormFieldItem f in list) {
      if (f.FieldType == FieldType.dropDownSingle &&
          f.DefaultValue.isNotEmpty &&
          f.DefaultValue.replaceAll('"', '').trim().isNotEmpty) {
        try {
          MasterResponseFZ defaultValue =
              MasterResponseFZ.fromJson(jsonDecode(f.DefaultValue));

          MasterResponseFZ? matchedDefaultValue = sources[f.ApiKey]
              ?.firstWhereOrNull((e) => e.Code == defaultValue.Code);
          matchedDefaultValue ??= sources[f.FzParamName]
              ?.firstWhereOrNull((e) => e.Code == defaultValue.Code);

          if (matchedDefaultValue != null) {
            selectedSources[f.FzParamName] = matchedDefaultValue;
          }
        } catch (e) {
          logger.e('Error parsing DefaultValue: $e');
        }
      }
    }
  }

  bool validateNew(List<FormFieldItem> list, {Function(String id)? validate}) {
    bool status = true;
    List<FormFieldItem> fields = list.toList()
      ..sort((a, b) => a.index.compareTo(b.index));
    try {
      outerLoop:
      for (FormFieldItem f in fields) {
        if (f.FieldId == 'disableLcyAmount' ||
            f.FieldId == 'disableFcyAmount') {
          continue;
        }
        switch (f.FieldType) {
          case FieldType.text:
            errorTexts[f.FzParamName] = !f.optional ||
                    (validate != null
                        ? Get.find<AddBeneficiaryController>()
                                .customVisibilityFields
                                .contains(f.FzParamName) &&
                            validate(f.FzParamName)
                        : false)
                ? validate != null && !validate(f.FzParamName)
                    ? ''
                    : (textFieldControllers[f.FzParamName]!.text.isEmpty
                        ? 'required'
                        : f.FzParamName.toLowerCase().contains('email') &&
                                !textFieldControllers[f.FzParamName]!
                                    .text
                                    .isEmail
                            ? 'invalid email'
                            : (textFieldControllers[f.FzParamName]!
                                        .text
                                        .length <
                                    (f.minLength ?? 0))
                                ? f.RegexMessage != ""
                                    ? f.RegexMessage
                                    : 'incomplete'
                                : type == FormType.signUpSetCredentials
                                    ? ('')
                                    : '')
                : '';
            if (f.FzParamName.toLowerCase().contains('email') &&
                textFieldControllers[f.FzParamName]!.text.isNotEmpty) {
              if (!textFieldControllers[f.FzParamName]!.text.isEmail) {
                errorTexts[f.FzParamName] = 'invalid email';
                status = false;
              } else {
                errorTexts[f.FzParamName] = '';
                status = true;
              }
            }
            status = status && errorTexts[f.FzParamName]!.isEmpty;
            if (!status && keys[f.Id.toString()]?.currentContext != null) {
              Scrollable.ensureVisible(
                keys[f.Id.toString()]!.currentContext!,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              break outerLoop;
            }
            break;
          case FieldType.number:
            errorTexts[f.FzParamName] = !f.optional ||
                    (validate != null
                        ? Get.find<AddBeneficiaryController>()
                                .customVisibilityFields
                                .contains(f.FzParamName) &&
                            validate(f.FzParamName)
                        : false)
                ? validate != null && !validate(f.FzParamName)
                    ? ''
                    : (textFieldControllers[f.FzParamName]!.text.isEmpty
                        ? 'required'
                        : (textFieldControllers[f.FzParamName]!.text.length <
                                (f.minLength ?? 0))
                            ? f.RegexMessage != ""
                                ? f.RegexMessage
                                : 'Minimum ${f.minLength} digits required'
                            : '')
                : '';
            status = status && errorTexts[f.FzParamName]!.isEmpty;
            if (!status && keys[f.Id.toString()]?.currentContext != null) {
              Scrollable.ensureVisible(
                keys[f.Id.toString()]!.currentContext!,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              break outerLoop;
            }
            break;
          case FieldType.dropDownSingle:

            ///
            errorTexts[f.FzParamName] = !f.optional ||
                    (validate != null
                        ? Get.find<AddBeneficiaryController>()
                                .customVisibilityFields
                                .contains(f.FzParamName) &&
                            validate(f.FzParamName)
                        : false)
                ? (validate != null
                            ? (validate(f.FzParamName) && !f.optional)
                            : true) &&
                        selectedSources[f.FzParamName] == null
                    ? 'required'
                    : ''
                : '';
            status = status && errorTexts[f.FzParamName]!.isEmpty;
            if (!status && keys[f.Id.toString()]?.currentContext != null) {
              Scrollable.ensureVisible(
                keys[f.Id.toString()]!.currentContext!,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              break outerLoop;
            }
            break;

          case FieldType.dropDownMulti:

            ///
            errorTexts[f.FzParamName] = !f.optional ||
                    (validate != null
                        ? Get.find<AddBeneficiaryController>()
                                .customVisibilityFields
                                .contains(f.FzParamName) &&
                            validate(f.FzParamName)
                        : false)
                ? (validate != null
                            ? (validate(f.FzParamName) && !f.optional)
                            : true) &&
                        selectedSources[f.FzParamName] == null
                    ? 'required'
                    : ''
                : '';
            status = status && errorTexts[f.FzParamName]!.isEmpty;
            if (!status && keys[f.Id.toString()]?.currentContext != null) {
              Scrollable.ensureVisible(
                keys[f.Id.toString()]!.currentContext!,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              break outerLoop;
            }
            break;
          case FieldType.date:
            errorTexts[f.FzParamName] = (!f.optional ||
                        (validate != null ? validate(f.FzParamName) : false)) &&
                    dates[f.FzParamName] == null
                ? 'required'
                : '';
            status = status && errorTexts[f.FzParamName]!.isEmpty;
            if (!status && keys[f.Id.toString()]?.currentContext != null) {
              Scrollable.ensureVisible(
                keys[f.Id.toString()]!.currentContext!,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              break outerLoop;
            }
            break;
          case FieldType.dateTime:
            errorTexts[f.FzParamName] = (!f.optional ||
                        (validate != null ? validate(f.FzParamName) : false)) &&
                    dates[f.FzParamName] == null
                ? 'required'
                : '';
            status = status && errorTexts[f.FzParamName]!.isEmpty;
            if (!status && keys[f.Id.toString()]?.currentContext != null) {
              Scrollable.ensureVisible(
                keys[f.Id.toString()]!.currentContext!,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              break outerLoop;
            }
            break;
          case FieldType.radio:
            errorTexts[f.FzParamName] = (!f.optional ||
                        (validate != null ? validate(f.FzParamName) : true)) &&
                    selectedSources[f.FzParamName] == null
                ? 'required'
                : '';
            status = status && errorTexts[f.FzParamName]!.isEmpty;
            if (!status && keys[f.Id.toString()]?.currentContext != null) {
              Scrollable.ensureVisible(
                keys[f.Id.toString()]!.currentContext!,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              break outerLoop;
            }
            break;
          case FieldType.checkBox:
            errorTexts[f.FzParamName] = (!f.optional ||
                        (validate != null ? validate(f.FzParamName) : true)) &&
                    (checkBoxes[f.FzParamName] == null ||
                        checkBoxes[f.FzParamName] == false)
                ? 'required'
                : '';
            status = status && errorTexts[f.FzParamName]!.isEmpty;
            if (!status && keys[f.Id.toString()]?.currentContext != null) {
              Scrollable.ensureVisible(
                keys[f.Id.toString()]!.currentContext!,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              break outerLoop;
            }
            break;
        }
      }
      if (status) {
        switchLoop:
        switch (type) {
          case FormType.signUpCustomerDetails:
            // if (errorTexts['dummy_salary_date']?.isEmpty == true) {
            //   if (isValidDate(dates['dummy_salary_date'] ?? '')) {
            //     errorTexts['dummy_salary_date'] = '';
            //   } else {
            //     errorTexts['dummy_salary_date'] =
            //         """Enter Current Month's Date""";
            //   }
            //   status = status && errorTexts['dummy_salary_date']!.isEmpty;
            //   if (!status && keys['dummy_salary_date']?.currentContext != null) {
            //     Scrollable.ensureVisible(
            //       keys['dummy_salary_date']!.currentContext!,
            //       duration: Duration(milliseconds: 300),
            //       curve: Curves.easeInOut,
            //     );
            //   }
            // }
            // errorTexts['t&c'] =
            //     Get.find<SignUpController>().signUpAttributes.acceptTAndC
            //         ? ''
            //         : 'required';
            // status = status &&
            //     Get.find<SignUpController>().signUpAttributes.acceptTAndC;
            // if (!status) {
            //   if (!status && keys['t&c']!.currentContext != null) {
            //     Scrollable.ensureVisible(
            //       keys['t&c']!.currentContext!,
            //       duration: Duration(milliseconds: 300),
            //       curve: Curves.easeInOut,
            //     );
            //   }
            //   // if (Get.find<SignUpController>().scrollController.hasClients) {
            //   //   Get.find<SignUpController>().scrollController.animateTo(
            //   //         Get.find<SignUpController>()
            //   //             .scrollController
            //   //             .position
            //   //             .maxScrollExtent,
            //   //         duration: const Duration(milliseconds: 500),
            //   //         curve: Curves.easeInOut,
            //   //       );
            //   // }
            // }

            break;
          case FormType.addBeneficiary:
            if (errorTexts['AccountNumber']?.isEmpty == true) {
              // do account Number length validation according to the bank
              if (selectedSources['BeneficiaryBankCode']
                      ?.accountLengthList
                      ?.isNotEmpty ==
                  true) {
                final String accLengthErrorMsg =
                    accNoLengthValidationMsg['BeneficiaryBankCode']
                                ?.isNotEmpty ==
                            true
                        ? accNoLengthValidationMsg['BeneficiaryBankCode']!
                        : 'Invalid Account No';
                final possibleAccNoLengths =
                    selectedSources['BeneficiaryBankCode']!
                        .accountLengthList!
                        .first
                        .lengthList;
                errorTexts['AccountNumber'] = !possibleAccNoLengths.contains(
                        textFieldControllers['AccountNumber']?.text.length)
                    ? accLengthErrorMsg
                    : '';

                status = status && errorTexts['AccountNumber']!.isEmpty;
                if (!status && keys['AccountNumber']?.currentContext != null) {
                  Scrollable.ensureVisible(
                    keys['AccountNumber']!.currentContext!,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              }

              // do account number prefix validation according to bank
              if (selectedSources['BeneficiaryBankCode']
                          ?.accountLengthList
                          ?.isNotEmpty ==
                      true &&
                  selectedSources['BeneficiaryBankCode']!
                      .accountLengthList!
                      .first
                      .prefix
                      .isNotEmpty) {
                String prefix = selectedSources['BeneficiaryBankCode']!
                    .accountLengthList!
                    .first
                    .prefix;
                errorTexts['AccountNumber'] =
                    textFieldControllers['AccountNumber']
                                ?.text
                                .startsWith(prefix) ==
                            false
                        ? 'Invalid Account Number'
                        : '';

                status = status && errorTexts['AccountNumber']!.isEmpty;
                if (!status && keys['AccountNumber']?.currentContext != null) {
                  Scrollable.ensureVisible(
                    keys['AccountNumber']!.currentContext!,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              }
            }
            if (errorTexts['dummy_confirmaccountNumber']?.isEmpty == true) {
              errorTexts['dummy_confirmaccountNumber'] =
                  textFieldControllers['dummy_confirmaccountNumber']?.text !=
                          textFieldControllers['AccountNumber']?.text
                      ? 'mismatch'
                      : '';
              status =
                  status && errorTexts['dummy_confirmaccountNumber']!.isEmpty;
              if (!status &&
                  keys['dummy_confirmaccountNumber']?.currentContext != null) {
                Scrollable.ensureVisible(
                  keys['dummy_confirmaccountNumber']!.currentContext!,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            } else {
              if (keys['dummy_confirmaccountNumber']?.currentContext != null) {
                Scrollable.ensureVisible(
                  keys['dummy_confirmaccountNumber']!.currentContext!,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            }
            break;
          case FormType.signUpSetCredentials:
            if (errorTexts['CONFIRMMPIN']?.isEmpty == true) {
              errorTexts['CONFIRMMPIN'] =
                  textFieldControllers['CONFIRMMPIN']?.text !=
                          textFieldControllers['Mpin']?.text
                      ? 'mismatch'
                      : '';
              status = status && errorTexts['CONFIRMMPIN']!.isEmpty;
            }
            if (validate != null && validate('Password')) {
              if (errorTexts['CONFIRMPASSWORD']?.isEmpty == true) {
                errorTexts['CONFIRMPASSWORD'] =
                    textFieldControllers['CONFIRMPASSWORD']?.text !=
                            textFieldControllers['Password']?.text
                        ? 'mismatch'
                        : '';
                status = status && errorTexts['CONFIRMPASSWORD']!.isEmpty;
              }
              if (status &&
                  Get.find<SignUpController>().signUpAttributes.pwdStrength !=
                      1) {
                errorTexts['CONFIRMPASSWORD'] =
                    Get.find<SignUpController>().signUpAttributes.pwdStrength <
                            0.34
                        ? 'weak'.tr
                        : Get.find<SignUpController>()
                                    .signUpAttributes
                                    .pwdStrength <
                                0.68
                            ? 'Medium'.tr
                            : 'Strong'.tr;
                status = status && errorTexts['CONFIRMPASSWORD']!.isEmpty;
                if (!status &&
                    keys['CONFIRMPASSWORD']?.currentContext != null) {
                  Scrollable.ensureVisible(
                    keys['CONFIRMPASSWORD']!.currentContext!,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              }
            }
            break;
          case FormType.nID:
            break;
          case FormType.identityVerification:
            break;
          case FormType.sendMoney:
            break;
          case FormType.myProfile:
            break;
          case FormType.forgotMpin:
            break;
          case FormType.changeMpin:
            if (errorTexts['CONFIRMMPIN']!.isEmpty) {
              errorTexts['CONFIRMMPIN'] =
                  textFieldControllers['CONFIRMMPIN']?.text !=
                          textFieldControllers['NewCredential']?.text
                      ? 'mismatch'
                      : '';
              status = status && errorTexts['CONFIRMMPIN']!.isEmpty;
            }
            break;
          case FormType.changeUserName:
            break;
          case FormType.changePassword:
            break;
          case FormType.forgotUsername:
            break;
          case FormType.forgotPassword:
            break;
          case FormType.resetMPINForm:
            if (errorTexts['CONFIRMMPIN']!.isEmpty) {
              if (textFieldControllers['NewCredential']?.text ==
                  textFieldControllers['CurrentCredential']?.text) {
                errorTexts['CONFIRMMPIN'] =
                    'You’ve already used this MPIN. Please choose a different one'
                        .tr;
              } else if (textFieldControllers['CONFIRMMPIN']?.text !=
                  textFieldControllers['NewCredential']?.text) {
                errorTexts['CONFIRMMPIN'] = 'mismatch';
              } else {
                errorTexts['CONFIRMMPIN'] = '';
              }
              status = status && errorTexts['CONFIRMMPIN']!.isEmpty;
            }

            break;
          case FormType.resetPasswordForm:
            break;
          case FormType.updateProfile:
            break;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      status = false;
    }
    return status;
  }

  void formClear(List<FormFieldItem> data) {
    initialiseForm(data);
  }

  Map<String, dynamic> buildJsonNew(List<FormFieldItem> list,
      {Map<String, dynamic>? additionalData}) {
    Map<String, dynamic> map = {};

    switch (type) {
      case FormType.signUpCustomerDetails:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                // if (f.FzParamName == "BeneficiaryBankCode") {
                //   map[f.FzParamName] = selectedSources[f.FzParamName]!.BankCode;
                // } else if (f.FzParamName == "BeneficiaryBranchCode") {
                //   map[f.FzParamName] = selectedSources[f.FzParamName]!.BranchCode;
                // } else {
                //   map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                // }
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] =
                      selectedSources[f.FzParamName]!.Desc.toString();
                }
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }

        break;

      case FormType.nID:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.id;
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.id)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.id.toString();
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        break;
      case FormType.identityVerification:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.id)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
              }
              break;
          }
        }
        break;
      case FormType.signUpSetCredentials:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.id;
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.id)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.id.toString();
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        break;
      case FormType.addBeneficiary:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]?.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]?.text}';
              break;
            case FieldType.number:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]?.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                switch (f.FzParamName) {
                  case 'BeneficiaryBranchCode':
                    map[f.FzParamName] = selectedSources[f.FzParamName]?.Code;
                    map[f.FzParamName2] = selectedSources[f.FzParamName]?.Desc;
                    map['BankIdentifier'] = selectedSources[f.FzParamName]
                        ?.branchBicDetails
                        .map((e) => e.toJson())
                        .toList();
                    break;
                  case 'CountryCode':
                    map[f.FzParamName] =
                        selectedSources[f.FzParamName]?.countryCode;
                    map[f.FzParamName2] =
                        selectedSources[f.FzParamName]?.countryName;
                    break;
                  case 'ServiceCurrencyCode':
                    map[f.FzParamName] =
                        selectedSources[f.FzParamName]?.currencyCode;
                    map[f.FzParamName2] =
                        selectedSources[f.FzParamName]?.currencyName;
                    break;
                  default:
                    map[f.FzParamName] = selectedSources[f.FzParamName]?.Code;
                    map[f.FzParamName2] = selectedSources[f.FzParamName]?.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                map[f.FzParamName2] =
                    selectedSources[f.FzParamName]!.Desc.toString();
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }
        break;
      case FormType.sendMoney:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]?.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]?.text}';
              break;
            case FieldType.number:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]?.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                switch (f.FzParamName) {
                  case 'BeneficiaryBranchCode':
                    map[f.FzParamName] = selectedSources[f.FzParamName]?.Code;
                    map[f.FzParamName2] = selectedSources[f.FzParamName]?.Desc;
                    map['BankIdentifier'] = selectedSources[f.FzParamName]
                        ?.branchBicDetails
                        .map((e) => e.toJson())
                        .toList();
                    break;
                  default:
                    map[f.FzParamName] = selectedSources[f.FzParamName]?.Code;
                    map[f.FzParamName2] = selectedSources[f.FzParamName]?.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                map[f.FzParamName2] =
                    selectedSources[f.FzParamName]!.Desc.toString();
              }
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        break;
      case FormType.myProfile:
        break;
      case FormType.forgotMpin:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }

        break;
      case FormType.changeMpin:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }

        break;
      case FormType.changeUserName:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }

        break;
      case FormType.changePassword:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }

        break;
      case FormType.forgotUsername:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }

        break;
      case FormType.forgotPassword:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.Code)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.dateTime:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.Code.toString();
                if (f.FzParamName2 != "") {
                  map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
                }
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }

        break;
      case FormType.resetMPINForm:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.id;
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.id)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.id.toString();
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }
        break;
      case FormType.resetPasswordForm:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.id;
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.id)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.id.toString();
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }
        break;
      case FormType.updateProfile:
        for (FormFieldItem f in list) {
          switch (f.FieldType) {
            case FieldType.text:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.username:
              map[f.FzParamName] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.number:
              map[f.FzParamName.trim()] =
                  '${f.Prefix.trim()}${textFieldControllers[f.FzParamName]!.text}';
              break;
            case FieldType.dropDownSingle:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] = selectedSources[f.FzParamName]!.Code;
                map[f.FzParamName2] = selectedSources[f.FzParamName]!.Desc;
              }
              break;
            case FieldType.dropDownMulti:
              map[f.FzParamName] = (multiSelectedSources[f.FzParamName] ?? [])
                  .map((e) => e.id)
                  .toList();
              break;
            case FieldType.date:
              if (dates[f.FzParamName] != null) {
                map[f.FzParamName] = dates[f.FzParamName].toString();
              }
              break;
            case FieldType.radio:
              if (selectedSources[f.FzParamName] != null) {
                map[f.FzParamName] =
                    selectedSources[f.FzParamName]!.id.toString();
              }
              break;
            case FieldType.checkBox:
              if (checkBoxes[f.FzParamName] != null) {
                map[f.FzParamName] = checkBoxes[f.FzParamName].toString();
              }
              break;
          }
        }
        if (additionalData != null) {
          map.addAll(additionalData);
        }
        break;
    }
    return map;
  }
}

class ProfileAttributes {
  TextEditingController customerName = TextEditingController(),
      bankName = TextEditingController(),
      accountNumber = TextEditingController(),
      email = TextEditingController(),
      idNo = TextEditingController(),
      phone = TextEditingController(),
      eid = TextEditingController();
  List<TextEditingController> expiryDateControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> expiryNodes = [FocusNode(), FocusNode(), FocusNode()];

  TextEditingController expiryDateController = TextEditingController();
  FocusNode expiryNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode idNoNode = FocusNode();

  String? gender, customerCode, currency;
  String expiryError = '',
      nationalityError = '',
      professionError = '',
      idTypeError = '',
      idNoError = '',
      emailError = '';
  DateTime? dob;
  List<MasterResponseFZ> nationality = [], profession = [], idType = [];
  MasterResponseFZ? selectedNationality, selectedProfession, selectedIdType;
}

class IdentityVerificationAttributes {
  TextEditingController idExpiryDateController = TextEditingController();
  String idExpiryError = '';

  TextEditingController dobExpiryDateController = TextEditingController();
  String dobExpiryError = '';

  TextEditingController idMailController = TextEditingController();
  String idMailError = '';

  FocusNode idExpiryNode = FocusNode();
  FocusNode dobExpiryNode = FocusNode();
  FocusNode idMailNode = FocusNode();

  String? updateEmail = '';
  bool mailVerificationSubmit = false;
}

class SignUpAttributes {
  double pwdStrength = 0;
  List<MasterResponseFZ> countryOfTransaction = [];
  bool acceptTAndC = false;
  String uuid = '';

  bool compareDate(List<TextEditingController> controllers,
      {bool checkEmpty = false, DateTime? firstDate, DateTime? lastDate}) {
    DateTime? d1;
    if (!checkEmpty) {
      d1 = DateTime(int.parse(controllers[2].text),
          int.parse(controllers[1].text), int.parse(controllers[0].text));
    }
    return checkEmpty
        ? (controllers[0].text.isEmpty ||
            controllers[1].text.isEmpty ||
            controllers[2].text.isEmpty)
        : (firstDate != null ? d1!.isAfter(firstDate) : true) &&
            (lastDate != null ? d1!.isBefore(lastDate) : true);
  }

  bool validateCredentials() {
    bool status = true;
    mPinErrText = newMpin.text.length < 6
        ? (newMpin.text.isEmpty ? 'required'.tr : 'incomplete'.tr)
        : '';
    status = status && mPinErrText.isEmpty;

    cnfMpinErrText = cnfMpin.text.length < 6
        ? (cnfMpin.text.isEmpty ? 'required'.tr : 'incomplete'.tr)
        : cnfMpin.text != newMpin.text
            ? 'mismatch'.tr
            : '';
    status = status && cnfMpinErrText.isEmpty;

    newPwdErrTxt = newPwd.text.length < 8
        ? (newPwd.text.isEmpty ? 'required'.tr : 'incomplete'.tr)
        : pwdStrength < 0.34
            ? 'weak'.tr
            : pwdStrength < 0.68
                ? 'Medium'.tr
                : '';
    newPwdErrTxt = (newPwd.text.contains(RegExp(r'[A-Z]')) &&
            newPwd.text.contains(RegExp(r'[a-z]')) &&
            newPwd.text.contains(RegExp(r'[0-9]')) &&
            newPwd.text.contains(RegExp(r'[!@#\$&*~]')) &&
            newPwd.text.length > 7)
        ? ''
        : 'Please follow password pattern';
    status = status && (newPwdErrTxt.isEmpty && pwdStrength == 1);

    cnfPwdErrTxt = cnfPwd.text.length < 8
        ? (cnfPwd.text.isEmpty ? 'required'.tr : 'incomplete'.tr)
        : (newPwd.text != cnfPwd.text ? 'mismatch'.tr : '');
    status = status && cnfPwdErrTxt.isEmpty;
    if ((Box3.settings.LOGINAUTHENTICATIONPRIMARY) == 'Username') {
      usernameError = username.text.isEmpty ? 'required' : '';
      status = status && usernameError.isEmpty;
    }
    return status;
  }

  TextEditingController
      // nidConroller = TextEditingController(text: enablePrefill ? accounts[F.appFlavor]['nid'] : null),
      //(text: '6584223348'),
      username = TextEditingController(),
      firstName = TextEditingController(),
      lastName = TextEditingController(),
      // mobile = TextEditingController(text: enablePrefill ? accounts[F.appFlavor]['mobile'] : null),
      //(text: '96834524888'),
      date = TextEditingController(),
      pinPOBox = TextEditingController(),
      noOfTransactions = TextEditingController(),
      placeOfBirth = TextEditingController(),
      monthlyIncome = TextEditingController(),
      employer = TextEditingController(),
      address1 = TextEditingController(),
      address2 = TextEditingController(),
      address3 = TextEditingController(),
      address4 = TextEditingController(),
      address5 = TextEditingController(),
      newMpin = TextEditingController(),
      cnfMpin = TextEditingController(),
      email = TextEditingController(),
      newPwdCNf = TextEditingController(),
      newPwd = TextEditingController(),
      cnfPwd = TextEditingController();
  bool usernameLoading = false, usernameAvailable = false;
  TextEditingController fullName = TextEditingController(),
      middleName = TextEditingController(),
      dob = TextEditingController(),
      cob = TextEditingController(),
      mobOTP = TextEditingController(),
      emailOTP = TextEditingController();
  MasterResponseFZ? birthCountry,
      idCountry,
      nationality,
      emirate,
      secondNationality,
      profession,
      id;
  String extractedNationalityText = '';

  // referBy;
  String firstNameError = '',
      middleNameError = '',
      lastNameError = '',
      mobileError = '',
      dobError = '',
      birthCountryError = '',
      idCountryError = '',
      nationalityError = '',
      secondNationalityError = '',
      pinPOBoxError = '',
      noOfTransactionsError = '',
      placeOfBirthError = '',
      monthlyIncomeError = '',
      address1Error = '',
      employerError = '',
      address2Error = '',
      address3Error = '',
      address4Error = '',
      address5Error = '',
      emailError = '',
      professionError = '',
      idError = '',
      countryOfTransactionsError = '',
      emirateError = '',
      idIssueDateError = '',
      idExpiryDateError = '',
      genderError = '',
      tAndCError = '',

      ///
      otpError = '',
      phoneErrText = '',
      pinFieldErrorText = '',
      dateErrText = '',
      mPinErrText = '',
      cnfMpinErrText = '',
      newPwdErrTxt = '',
      userNameStatus = '',
      cnfPwdErrTxt = '',
      usernameError = '',

      /// new param
      // referralError = '',
      salaryDateError = '';

  String? gender;
  List<TextEditingController> dobDateCtrls = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> idIssueDateCtrls = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> idExpiryDateCtrls = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<TextEditingController> salaryDateCtrls = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  List<FocusNode> dobDateNodes = [FocusNode(), FocusNode(), FocusNode()];
  List<FocusNode> idIssueDateNodes = [FocusNode(), FocusNode(), FocusNode()];
  List<FocusNode> idExpiryDateNodes = [FocusNode(), FocusNode(), FocusNode()];
  List<FocusNode> salaryDateNodes = [FocusNode(), FocusNode(), FocusNode()];
  Status mobOtpStatus = Status.pending, emailStatus = Status.pending;
  Widget mobOtpTrailer = const SizedBox(), emailTrailer = const SizedBox();

  FocusNode? getNode(String id) {
    Map<String, FocusNode> nodeMap = {
      'first_name': firstNameFN,
      'middle_name': middleNameFN,
      'last_name': lastNameFN,
      'dob': dobDateNodes.first,
      'pincode': pinPOBoxFN,
      'address1': address1FN,
      'address2': address2FN,
      'address3': address3FN,
      'address4': address4FN,
      'address5': address5FN,
      'email': emailFN,
      'monthly_income': monthlyIncomeFN,
      'no_of_transactions': noOfTransactionsFN,
      'place_of_birth': placeOfBirthFN,
      'id_issue_date': idIssueDateNodes.first,
      'id_expiry_date': idExpiryDateNodes.first
    };
    return nodeMap[id];
  }

  FocusNode firstNameFN = FocusNode(),
      lastNameFN = FocusNode(),
      pinPOBoxFN = FocusNode(),
      noOfTransactionsFN = FocusNode(),
      placeOfBirthFN = FocusNode(),
      monthlyIncomeFN = FocusNode(),
      address1FN = FocusNode(),
      employerFN = FocusNode(),
      address2FN = FocusNode(),
      address3FN = FocusNode(),
      address4FN = FocusNode(),
      address5FN = FocusNode(),
      mobNoFN = FocusNode(),
      nIDNoFn = FocusNode(),
      dateFN = FocusNode(),
      emailFN = FocusNode(),
      userNameFN = FocusNode(),
      newMpinFN = FocusNode(),
      cnfMpinFN = FocusNode(),
      newPwdFN = FocusNode(),
      cnfPwdFN = FocusNode(),
      fullNameFN = FocusNode(),
      middleNameFN = FocusNode(),
      cobFN = FocusNode(),
      mobOTPFN = FocusNode(),
      emailOTPFN = FocusNode();

  GlobalKey firstNameKey = GlobalKey(),
      lastNameKey = GlobalKey(),
      pinPOBoxKey = GlobalKey(),
      noOfTransactionsKey = GlobalKey(),
      placeOfBirthKey = GlobalKey(),
      monthlyIncomeKey = GlobalKey(),
      address1Key = GlobalKey(),
      employerKey = GlobalKey(),
      address2Key = GlobalKey(),
      address3Key = GlobalKey(),
      address4Key = GlobalKey(),
      address5Key = GlobalKey(),
      mobNoKey = GlobalKey(),
      nIDNoKey = GlobalKey(),
      dateKey = GlobalKey(),
      emailKey = GlobalKey(),
      newMpinKey = GlobalKey(),
      cnfMpinKey = GlobalKey(),
      newPwdKey = GlobalKey(),
      cnfPwdKey = GlobalKey(),
      fullNameKey = GlobalKey(),
      middleNameKey = GlobalKey(),
      cobKey = GlobalKey(),
      mobOTPKey = GlobalKey(),
      dobKey = GlobalKey(),
      birthCountryKey = GlobalKey(),
      idCountryKey = GlobalKey(),
      idTypeKey = GlobalKey(),
      nationalityKey = GlobalKey(),
      emirateKey = GlobalKey(),
      professionKey = GlobalKey(),
      idIssueDateKey = GlobalKey(),
      idExpiryDateKey = GlobalKey(),
      genderKey = GlobalKey(),
      emailOTPKey = GlobalKey();
}

class AuthAttributes {
  TextEditingController mPinController = TextEditingController();
  String mpinErrorText = '';
  Status mobOtpStatus = Status.pending;
  Widget mPinTrailer = const SizedBox();
  FocusNode mPinFocusNode = FocusNode();
}

class DialogMpinAuthAttributes {
  bool apiStatus = false;
  TextEditingController mPinController = TextEditingController();
  String mpinErrorText = '';
  Status mobOtpStatus = Status.pending;
  Widget mPinTrailer = const SizedBox();
  FocusNode mPinFocusNode = FocusNode();
}

class DialogOtpAuthAuthAttributes {
  bool buttonLoading = false;
  TextEditingController mobOTP = TextEditingController();
  TextEditingController emailOTP = TextEditingController();
  String otpErrorText = '';
// Status mobOtpStatus = Status.pending;
}
