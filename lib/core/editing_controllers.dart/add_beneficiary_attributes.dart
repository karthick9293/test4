import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../flavors.dart';
import '../../models/beneficiary/beneficiary_fz.dart';
import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../exports/built_values.dart';
import '../exports/controllers.dart';
import '../flavours/constants.dart';

class AddBeneficiaryAttributes {
  bool isAddBeneficiary = true;
  bool obscure = true;
  List<ProviderFieldBV> serviceProviderFields = [];
  Map<String, List<MasterResponseFZ>> fieldOptions = {};
  Map<String, MasterResponseFZ?> selectedOption = {};
  Map<String, TextEditingController> textControllers = {};
  Map<String, DateTime> dates = {};

  Map<String, String?> fieldOptionErrors = {};

  bool compareDate(List<TextEditingController> controllers, {bool checkEmpty = false, DateTime? firstDate, DateTime? lastDate}) {
    DateTime? d1;
    if (!checkEmpty) {
      d1 = DateTime(int.parse(controllers[2].text), int.parse(controllers[1].text), int.parse(controllers[0].text));
    }
    return checkEmpty
        ? (controllers[0].text.isEmpty || controllers[1].text.isEmpty || controllers[2].text.isEmpty)
        : (firstDate != null ? d1!.isAfter(firstDate) : true) && (lastDate != null ? d1!.isBefore(lastDate) : true);
  }

  BeneficiaryFz? beneficiary;
  final GlobalKey<DropdownButton2State> genderKey = GlobalKey<DropdownButton2State>(),
      documentTypeKey = GlobalKey<DropdownButton2State>(),
      serviceTypeKey = GlobalKey<DropdownButton2State>();
  TextEditingController firstNameController = TextEditingController(),
      middleNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      nationalityTextController = TextEditingController(),
      relationshipCotroller = TextEditingController(),
      idNumberController = TextEditingController(),
      mobileController = TextEditingController(),
      emailController = TextEditingController(),
      address1Controller = TextEditingController(),
      address2Controller = TextEditingController(),
      bicController = TextEditingController(),
      swiftController = TextEditingController(),
      bankBranchCodeController = TextEditingController(),
      accountNumberController = TextEditingController(),
      cnfAccountNumberController = TextEditingController(),
      dd = TextEditingController(),
      mm = TextEditingController(),
      yyyy = TextEditingController();

  TextEditingController dobDateCtrls = TextEditingController();

  bool isFoc = false;

  bool isBankTransfer = false;
  bool isCashTransfer = false;
  bool isWalletTransfer = false;
  bool isDocumentType = false;

  String firstNameError = '',
      middleNameError = '',
      lastNameError = '',
      genderError = '',
      dateError = '',
      // countryError = '',
      receivingCountryError = '',
      nationalityError = '',
      relationshipError = '',
      documentTypeError = '',
      idNumberError = '',
      serviceTypeError = '',
      serviceProviderError = '',
      currencyError = '',
      bankNameError = '',
      branchNameError = '',
      accountNumberError = '',
      cnfAccountNumberError = '',
      mobileError = '',
      emailError = '',
      bicError = '',
      swiftError = '',
      bankBranchCodeError = '',
      address1Error = '',
      address2Error = '';

  // dateErrAddBeneficiaryText = '';
  FocusNode firstNameFocusNode = FocusNode(),
      middleNameFocusNode = FocusNode(),
      lastNameFocusNode = FocusNode(),
      mobileNode = FocusNode(),
      emailNode = FocusNode(),
      nationalityNode = FocusNode(),
      relationshipNode = FocusNode(),
      idNoNode = FocusNode(),
      address1FN = FocusNode(),
      bicFN = FocusNode(),
      swiftFN = FocusNode(),
      bankBranchCodeFN = FocusNode(),
      address2FN = FocusNode(),
      accountNumberFN = FocusNode(),
      cnfAccountNumberFN = FocusNode();

  FocusNode dobDateNodes = FocusNode();

  GlobalKey firstNameKey = GlobalKey(),
      lastNameKey = GlobalKey(),
      mobileKey = GlobalKey(),
      emailKey = GlobalKey(),
      nationalityKey = GlobalKey(),
      relationshipKey = GlobalKey(),
      idNoKey = GlobalKey(),
      address1Key = GlobalKey(),
      bicKey = GlobalKey(),
      swiftKey = GlobalKey(),
      bankBranchCodeKey = GlobalKey(),
      address2Key = GlobalKey(),
      accountNumberKey = GlobalKey(),
      cnfAccountNumberKey = GlobalKey(),
      dobDateKey = GlobalKey(),
      receivingCountryKey = GlobalKey(),
      bankNameKey = GlobalKey(),
      branchNameKey = GlobalKey(),
      dateKey = GlobalKey(),
      currencyKey = GlobalKey(),
      serviceProviderKey = GlobalKey();

  MasterResponseFZ? selectedNationality,
      selectedRelationship,
      selectedServiceType,
      selectedReceivingCountry,
      selectedBank,
      selectedBankBranch,
      selectedServiceProvider;
  List<MasterResponseFZ> serviceProviderList = [];
  String? selectedCurrencyCode, selectedDocument, selectedDocumentCode, selectedGender, type = 'Individual';

  bool isGender = false, isCountry = false;

  void editBeneficiary2(BeneficiaryFz b) {
    AddBeneficiaryController bCtrl = Get.find<AddBeneficiaryController>();
    Map<String, dynamic> ben = b.toJson();
    List<FormFieldItem> fields = bCtrl.beneficiaryFormBV!.formFieldItem.toList();
    for (FormFieldItem f in fields) {
      switch (f.FieldType) {
        case FieldType.dropDownSingle:
        //bCtrl.form.selectedSources[f.FzParamName]?.copyWith(Desc: "",Code: ben[f.FzParamName]??"");
        default:
          bCtrl.form.textFieldControllers[f.FzParamName]?.text = ben[f.FzParamName] ?? "";
      }
    }
  }

  void editBeneficiary(BeneficiaryFz b) {
    beneficiary = b;

    firstNameController.text = b.firstName ?? '';
    middleNameController.text = b.middleName ?? '';
    lastNameController.text = b.lastName ?? '';

    mobileController.text = b.mobile != null ? b.mobile! : '';
    // emailController.text = b. ?? '';

    selectedGender = b.gender == 'M'
        ? 'Male'
        : b.gender == 'F'
            ? 'Female'
            : b.gender == 'O'
                ? 'Other'
                : '';

    var dob = b.dateOfBirth ?? '';
    var splitData = dob.toString().split(" ");
    var splitData1 = splitData[0];

    var date = splitData1.split("-");

    if (date.isNotEmpty && date.length > 2) {
      dobDateCtrls.text = '${date[2]} / ${date[1]} / ${date[0]}';
    }

    address1Controller.text = b.address1 != null ? b.address1! : '';
    address2Controller.text = b.address2 != null ? b.address2! : '';

    beneficiaryId = b.id.toString();

    switch (b.serviceType?.Code) {
      case "B":
        isBankTransfer = true;
        isCashTransfer = false;
        isWalletTransfer = false;
        break;
      case "C":
        isBankTransfer = false;
        isCashTransfer = true;
        isWalletTransfer = false;
        break;
      case "W":
        isBankTransfer = false;
        isCashTransfer = false;
        isWalletTransfer = true;
        break;
    }

    Get.find<AddBeneficiaryController>().update();

    Get.find<EditBeneficiaryController>().onEditChange();
  }

  bool isProviderCountryValidation = false;
  String providerCountryValidationLabel = '';

  bool validate(bool isBank) {
    firstNameError = firstNameController.text.isEmpty ? 'required'.tr : '';
    if (firstNameError.isNotEmpty) {
      firstNameFocusNode.requestFocus();
      Scrollable.ensureVisible(firstNameKey.currentContext!);
      return false;
    }
    lastNameError = lastNameController.text.isEmpty ? 'required'.tr : '';
    if (lastNameError.isNotEmpty) {
      Scrollable.ensureVisible(lastNameKey.currentContext!);
      return false;
    }
    nationalityError = selectedNationality == null ? 'required'.tr : '';
    if (nationalityError.isNotEmpty) {
      Scrollable.ensureVisible(nationalityKey.currentContext!);
      return false;
    }
    genderError = selectedGender == null ? 'required'.tr : '';
    if (genderError.isNotEmpty) {
      Scrollable.ensureVisible(genderKey.currentContext!);
      return false;
    }

    dateError = dobDateCtrls.text.isEmpty ? 'required'.tr : '';
    if (dateError.isNotEmpty) {
      Scrollable.ensureVisible(dateKey.currentContext!);
      return false;
    }

    mobileError = mobileController.text.isNotEmpty ? (mobileController.text.length < 7 ? 'Invalid_phone_number'.tr : '') : 'required'.tr;
    if (mobileError.isNotEmpty) {
      Scrollable.ensureVisible(mobileKey.currentContext!);
      return false;
    }
    if (emailController.text.isNotEmpty) {
      emailError = !emailController.text.isEmail ? 'invalid_email'.tr : '';
    }
    if (emailError.isNotEmpty) {
      Scrollable.ensureVisible(emailKey.currentContext!);
      return false;
    }
    address1Error = address1Controller.text.isEmpty ? 'required'.tr : '';
    if (address1Error.isNotEmpty) {
      Scrollable.ensureVisible(address1Key.currentContext!);
      return false;
    }
    address2Error = address2Controller.text.isEmpty ? 'required'.tr : '';

    address2Error = address2Controller.text.isEmpty && (F.appFlavor == Flavor.casmex) ? 'required'.tr : '';
    if (address2Error.isNotEmpty) {
      Scrollable.ensureVisible(address2Key.currentContext!);
      return false;
    } else {
      address2Error = '';
    }

    relationshipError = selectedRelationship == null ? 'required'.tr : '';
    if (relationshipError.isNotEmpty) {
      Scrollable.ensureVisible(relationshipKey.currentContext!);
      return false;
    }
    serviceTypeError = selectedServiceType == null ? 'required'.tr : '';
    if (serviceTypeError.isNotEmpty) {
      Scrollable.ensureVisible(serviceTypeKey.currentContext!);
      return false;
    }
    receivingCountryError = selectedReceivingCountry == null ? 'required'.tr : '';
    if (receivingCountryError.isNotEmpty) {
      Scrollable.ensureVisible(receivingCountryKey.currentContext!);
      return false;
    }
    currencyError = selectedCurrencyCode == null ? 'required'.tr : '';
    if (currencyError.isNotEmpty) {
      Scrollable.ensureVisible(currencyKey.currentContext!);
      return false;
    }
    if (isBank) {
      if (Box3.settings.BankTransferMTO == true && serviceProviderList.length > 1) {
        serviceProviderError = selectedServiceProvider == null ? 'required'.tr : '';
        if (serviceProviderError.isNotEmpty) {
          Scrollable.ensureVisible(serviceProviderKey.currentContext!);
          return false;
        }
      }

      bankNameError = selectedBank == null ? 'required'.tr : '';
      if (bankNameError.isNotEmpty) {
        Scrollable.ensureVisible(bankNameKey.currentContext!);
        return false;
      }
      branchNameError = selectedBankBranch == null ? 'required'.tr : '';
      if (branchNameError.isNotEmpty) {
        Scrollable.ensureVisible(branchNameKey.currentContext!);
        return false;
      }

      if (isProviderCountryValidation == true && providerCountryValidationLabel.isNotEmpty == true) {
        bankBranchCodeError = bankBranchCodeController.text.isEmpty ? 'required'.tr : '';
        if (bankBranchCodeError.isNotEmpty) {
          Scrollable.ensureVisible(bankBranchCodeKey.currentContext!);
          return false;
        }
      } else {
        bankBranchCodeError = '';
      }

      accountNumberError = accountNumberController.text.isEmpty ? 'required'.tr : '';
      if (accountNumberError.isNotEmpty) {
        Scrollable.ensureVisible(accountNumberKey.currentContext!);
        return false;
      }
      cnfAccountNumberError = cnfAccountNumberController.text.isEmpty
          ? 'required'.tr
          : cnfAccountNumberController.text != accountNumberController.text
              ? 'mismatch'
              : '';
      if (cnfAccountNumberError.isNotEmpty) {
        return false;
      }
    } else {
      serviceProviderError = selectedServiceProvider == null ? 'required'.tr : '';
      if (serviceProviderError.isNotEmpty) {
        Scrollable.ensureVisible(serviceProviderKey.currentContext!);
        return false;
      }
    }
    return true;
  }

  bool isFresh = true;
  String? beneficiaryId;
}
