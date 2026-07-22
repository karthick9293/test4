import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/models/pagination_details/pagination_details_fz.dart';

import '../../models/beneficiary/beneficiary_fz.dart';
import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../../network/api_service_new.dart';
import '../../ui_one/custom_widgets/custom_loader.dart';
import '../editing_controllers.dart/add_beneficiary_attributes.dart';
import '../editing_controllers.dart/attributes.dart';
import '../exports/built_values.dart';
import '../exports/controllers.dart';
import '../exports/ui_one_custom_widgets.dart';
import '../exports/ui_one_pages.dart';
import '../flavours/constants.dart';

class EditBeneficiaryController extends GetxController {
  FormRulesData? beneficiaryFormBV;
  FormParameters form = FormParameters(type: FormType.addBeneficiary);
  bool loading = !Get.find<DataController>().transactionAndBeneficiaryRetrieved,
      addBeneficiaryButtonLoading = false;

  List<int> days = Iterable<int>.generate(
      DateTime(2022, DateTime.now().month + 1, 0).day, (i) => i + 1).toList();
  int? selectedYear, selectedDay, selectedMonth, favIndex, statsChangingIndex;
  bool isDark = Get.find<AccountController>().isDark,
      viewMoreDeails = false,
      isSelecting = false;

  List<BeneficiaryFz> benefs = Get.find<DataController>().beneficiaries,
      markedBeneficiary = [],
      archivedBenefs = Get.find<DataController>()
          .beneficiaries
          .where((e) => e.archive == 'A')
          .toList();

  bool catalogueRetrieved = false;
  SignUpAttributes signUpAttributes = SignUpAttributes();
  AddBeneficiaryAttributes benefAttributes = AddBeneficiaryAttributes();
  DialogMpinAuthAttributes dialogAuthAttributes = DialogMpinAuthAttributes();

  TextEditingController archiveSearchController = TextEditingController();
  bool beneficiaryEdit = false;

  void setMonth(int? i) {
    if (i != null) {
      selectedMonth = i;
      days = Iterable<int>.generate(
          DateTime(2022, selectedMonth! + 1, 0).day, (i) => i + 1).toList();
      if (DateTime(2022, selectedMonth! + 1, 0).day < (selectedDay ?? 0)) {
        selectedDay = 1;
      }
      update();
    }
  }

  /// Beneficiary forms
  Future<void> getBeneficiaryForm() async {
    FormRulesData? f = Box3.addBeneficiaryFormBV;
    if (f != null) {
      form.initialiseForm(f.formFieldItem);
      await Future.wait(f.formFieldItem
          .where((f) => (f.FieldType == FieldType.dropDownSingle ||
              f.FieldType == FieldType.dropDownMulti))
          .map((f1) => getSourcesNew(f1))
          .toList());
      beneficiaryFormBV = f;
      catalogueRetrieved = true;
      update();
    }
  }

  Future<void> getSourcesNew(FormFieldItem f) async {
    form.sources[f.ApiKey] = await ApiService()
        .getCatalogue(typeData: {"Type": f.ApiKey}, type: f.ApiKey);
  }

  Future<void> dropdownOnTapHandlers(String id) async {
    switch (id) {
      case 'serviceCode':
        if (form.selectedSources[id] != null) {
          form.selectedSources.removeWhere((key, value) => [
                'countryCode',
                'currencyCode',
                'moneyServiceProvider',
                'bank',
                'branch',
              ].contains(key));
          ['accountNumber', 'bicCode', 'swiftCode']
              .map((e) => form.textFieldControllers[e]?.clear());
          update();
          form.sources['countryCode'] = [];
          form.sources['CountryCode'] =
              await ApiService().getServiceCountry(typeData: {
            "Type": "SERVICECOUNTRY",
            "ServiceCategoryCode":
                form.selectedSources['ServiceCategoryCode']?.Code,
          });

          update();
          Get.find<SignUpController>().update();
        }
        break;
      case 'countryCode':
        if (form.selectedSources[id] != null) {
          form.sources['currencyCode'] = [];

          // form.sources['ServiceCurrencyCode'] =
          //     await ApiService().getServiceCurrency(typeData: {
          //   "Type": "SERVICECURRENCY",
          //   "ServiceCategoryCode":
          //       form.selectedSources['ServiceCategoryCode']?.Code,
          //   "ServiceCountryCode": form.selectedSources['CountryCode']?.Code,
          // });

          form.selectedSources.removeWhere((key, value) => [
                'currencyCode',
                'moneyServiceProvider',
                'bank',
                'branch'
              ].contains(key));
          ['accountNumber', 'bicCode', 'swiftCode']
              .map((e) => form.textFieldControllers[e]?.clear());
          update();
          Get.find<SignUpController>().update();
        }
        break;
      case 'currencyCode':
        if (form.selectedSources[id] != null) {
          if (form.selectedSources['serviceCode']?.id == '0001' ||
              form.selectedSources['serviceCode']?.id == '0003') {
            form.sources
                .removeWhere((key, value) => key == 'moneyServiceProvider');
            form.sources['moneyServiceProvider'] = [];

            form.sources['COUNTRY'] =
                await ApiService().getMoneyServiceProvider(typeData: {
              "Type": "SERVICECOUNTRY",
              "ServiceCategoryCode":
                  form.selectedSources['ServiceCategoryCode']?.Code,
              "ServiceCountryCode": form.selectedSources['CountryCode']?.Code,
              "ServiceCurrencyCode":
                  form.selectedSources['ServiceCurrencyCode']?.Code,
            });

            form.selectedSources.removeWhere((key, value) =>
                ['moneyServiceProvider', 'bank', 'branch'].contains(key));
            ['accountNumber', 'bicCode', 'swiftCode']
                .map((e) => form.textFieldControllers[e]?.clear());
            update();
          } else if (form.selectedSources['serviceCode']?.id == '0002') {
            form.sources
                .removeWhere((key, value) => key == 'moneyServiceProvider');
            form.sources['moneyServiceProvider'] = [];

            form.sources['COUNTRY'] =
                await ApiService().getMoneyServiceProvider(typeData: {
              "Type": "SERVICECOUNTRY",
              "ServiceCategoryCode":
                  form.selectedSources['ServiceCategoryCode']?.Code,
              "ServiceCountryCode": form.selectedSources['CountryCode']?.Code,
              "ServiceCurrencyCode":
                  form.selectedSources['ServiceCurrencyCode']?.Code,
            });

            form.selectedSources.removeWhere((key, value) =>
                ['moneyServiceProvider', 'bank', 'branch'].contains(key));
            ['accountNumber', 'bicCode', 'swiftCode']
                .map((e) => form.textFieldControllers[e]?.clear());

            form.sources['Bank'] = await ApiService().getBanks2(typeData: {
              "ServiceCountryCode":
                  form.selectedSources['CountryCode']?.countryCode,
              "ServiceCurrencyCode":
                  form.selectedSources['ServiceCurrencyCode']?.currencyCode,
              "ServiceCategoryCode":
                  form.selectedSources['ServiceCategoryCode']?.categoryCode
            });

            update();
          }
          Get.find<SignUpController>().update();
        }
        break;
      case 'bank':
        if (form.selectedSources[id] != null) {
          getAllBranches();

          Get.find<SignUpController>().update();
        }
        break;
    }
  }

  Future<void> getAllBranches() async {
    late SignUpController signUpController;
    if (Get.isRegistered<SignUpController>()) {
      signUpController = Get.find<SignUpController>();
    } else {
      signUpController = Get.put(SignUpController());
    }

    if (signUpController.loadingSources.contains('BeneficiaryBranchCode')) {
      return;
    }

    bool allBranchesLoaded = false;
    int pageNumber = 1;
    int pageSize = 500;

    try {
      Get.find<SignUpController>().loadingSources.add('BeneficiaryBranchCode');
      while (!allBranchesLoaded) {
        final res = await ApiService().getBankBranches2(typeData: {
          "BankCode": form.selectedSources['Bank']?.Code,
          "PageNumber": pageNumber,
          "PageSize": pageSize,
          "ServiceCountryCode":
              form.selectedSources['CountryCode']?.countryCode,
          "ServiceCurrencyCode":
              form.selectedSources['ServiceCurrencyCode']?.currencyCode,
          "ServiceCategoryCode":
              form.selectedSources['ServiceCategoryCode']?.categoryCode
        });

        final branches = res['branchList'] as List<MasterResponseFZ>;
        PaginationDetailsFz? pageDetails = res['paginationDetails'];

        if (pageNumber == 1) {
          form.sources['Branch'] = branches;
        } else if (branches.isNotEmpty) {
          form.sources['Branch']?.addAll(branches);
        }

        signUpController.update(['dropdown-list']);

        if (pageDetails != null &&
            pageDetails.pageNumber >= pageDetails.totalPages) {
          allBranchesLoaded = true;
          break;
        }

        pageNumber++;
      }
    } catch (e) {
      logger.e('Error loading branch data: $e');
    } finally {
      Get.find<SignUpController>()
          .loadingSources
          .remove('BeneficiaryBranchCode');
    }
  }

  Future<void> getData() async {
    if (loading) {
      await Get.find<DataController>().getData(BeneficiaryController);
      update();
    }
  }

  List<String> customVisibilityFields = [
    'listserviceprovider',
    'BeneficiaryBankCode',
    'BeneficiaryBranchCode',
    'AccountNumber',
    'dummy_confirmaccountNumber'
        'BicValue',
    'dummy_swiftCode'
  ];

  bool visibilityChecker(String id) =>
      {
        'ServiceProviderCode':
            (form.selectedSources['ServiceCategoryCode']?.Code == 'C' ||
                form.selectedSources['ServiceCategoryCode']?.Code == 'W'),
        'BeneficiaryBankCode':
            form.selectedSources['ServiceCategoryCode']?.Code == 'B',
        'BeneficiaryBranchCode':
            form.selectedSources['ServiceCategoryCode']?.Code == 'B',
        'AccountNumber':
            form.selectedSources['ServiceCategoryCode']?.Code == 'B',
        'dummy_confirmaccountNumber':
            form.selectedSources['ServiceCategoryCode']?.Code == 'B',
        'BicValue': form.selectedSources['ServiceCategoryCode']?.Code == 'B',
        'dummy_swiftCode':
            form.selectedSources['ServiceCategoryCode']?.Code == 'B',
      }[id] ??
      true;

  Future<void> updateCity() async {
    customLoader();
    benefAttributes.selectedBank = null;
    benefAttributes.selectedBankBranch = null;
    benefAttributes.accountNumberController.clear();
    benefAttributes.cnfAccountNumberController.clear();

    benefAttributes
      ..selectedOption.removeWhere((key, value) => key == 'City')
      ..fieldOptions['City'] = await ApiService().fieldOptions(
          benefAttributes.serviceProviderFields
              .firstWhere((f) => f.fieldName == 'City')
              .dataService,
          data: {
            "countryCode": benefAttributes.selectedReceivingCountry?.id,
            "currencyCode": benefAttributes.selectedCurrencyCode,
            "serviceCode": benefAttributes.selectedServiceType?.id,
            "serviceProviderCode": benefAttributes.selectedServiceProvider?.id,
            "stateCode": benefAttributes.selectedOption['State']?.id
          });
    Get.back();
    Get.find<SignUpController>().update();
    update();
  }

  Future<void> updateCityDynamic(String fieldKey) async {
    customLoader();
    benefAttributes.selectedBank = null;
    benefAttributes.selectedBankBranch = null;
    benefAttributes.accountNumberController.clear();
    benefAttributes.cnfAccountNumberController.clear();

    benefAttributes
      ..selectedOption.removeWhere((key, value) => key == fieldKey)
      ..fieldOptions[fieldKey] = await ApiService().fieldOptions(
          benefAttributes.serviceProviderFields
              .firstWhere((f) => f.fieldName == fieldKey)
              .dataService,
          data: {
            "countryCode": benefAttributes.selectedReceivingCountry?.id,
            "currencyCode": benefAttributes.selectedCurrencyCode,
            "serviceCode": benefAttributes.selectedServiceType?.id,
            "serviceProviderCode": benefAttributes.selectedServiceProvider?.id,
            "stateCode": benefAttributes.selectedOption['State']?.id
          });
    Get.back();
    Get.find<SignUpController>().update();
    update();
  }

  bool validateAdditionalFields() {
    for (ProviderFieldBV spf in benefAttributes.serviceProviderFields) {
      if (spf.dataType == 'DROPDOWN') {
        if (benefAttributes.selectedOption[spf.fieldName] == null) {
          benefAttributes.fieldOptionErrors[spf.fieldName] = 'required'.tr;
          return false;
        } else {
          benefAttributes.fieldOptionErrors
              .removeWhere((key, value) => key == spf.fieldName);
        }
      } else if (spf.dataType == 'TEXT' || spf.dataType == 'DATE') {
        if (benefAttributes.textControllers[spf.fieldName]!.text.isEmpty) {
          benefAttributes.fieldOptionErrors[spf.fieldName] = 'required'.tr;
          return false;
        } else {
          benefAttributes.fieldOptionErrors
              .removeWhere((key, value) => key == spf.fieldName);
        }
      }
    }
    return true;
  }

  List<String> ifscCountry = ['IN', 'BD'];

  List<MasterResponseFZ> selectedReceivingCountry = [];
  List<MasterResponseFZ> receivingCountryList = [];

  // nationality selection
  List<MasterResponseFZ> selectedNationality = [];
  List<MasterResponseFZ> nationalityList = [];

  // relationship selection
  List<MasterResponseFZ> selectedRelationship = [];
  List<MasterResponseFZ> relationshipList = [];

  // service type selection
  List<MasterResponseFZ> selectedServiceType = [];
  List<MasterResponseFZ> serviceTypeList = [];

  // service type selection
  List<MasterResponseFZ> selectedCashService = [];
  List<MasterResponseFZ> serviceCashList = [];

  // service provider selection
  List<MasterResponseFZ> selectedServiceProvider = [];

  // List<SourceBV> serviceProviderList = [];

  // currency selection
  List<MasterResponseFZ> selectedCurrency = [];
  List<MasterResponseFZ> currencyList = [];
  List<MasterResponseFZ> providerCountryValidation = [];

  // SourceBV? providerCountryValidation;
  // bool isProviderCountryValidation = false;
  // String providerCountryValidationLabel = '';

  // bank selection
  List<MasterResponseFZ> selectedBank = [];
  List<MasterResponseFZ> bankList = [];

  // bank branch selection
  List<MasterResponseFZ> selectedBankBranch = [];
  List<MasterResponseFZ> bankBranchList = [];

  // document section
  List<MasterResponseFZ> selectedDocument = [];
  List<MasterResponseFZ> documentList = [];

  // gender section
  List<String> selectedGender = [];
  List<String> genderList = ['male'.tr, 'female'.tr, 'other'.tr];

  Future<void> getCatalogs() async {
    List<dynamic> l = await Future.wait([
      ApiService()
          .getCatalogue(typeData: {"Type": "NATIONALITY"}, type: 'NATIONALITY'),
      ApiService().getCatalogue(
          typeData: {"Type": "RELATIONSHIP"}, type: 'RELATIONSHIP'),
      ApiService().getCatalogue(
          typeData: {"Type": "SERVICECATEGORY"}, type: 'SERVICECATEGORY'),
      ApiService().getCatalogue(typeData: {"Type": "IDTYPE"}, type: 'IDTYPE'),
    ]);
    nationalityList = l[0];
    relationshipList = l[1];
    serviceTypeList = l[2];
    documentList = l[3];
    catalogueRetrieved = true;
    update();
  }

  Future<void> addBeneficiary() async {
    if (AppConfigs.formRules) {
      addBeneficiaryButtonLoading = true;
      update();
      bool? result = await ApiService()
          .addBeneficiary2(form.buildJsonNew(beneficiaryFormBV!.formFieldItem));
      if (result == true) {
        await showSuccessAlert(
            content: 'Beneficiary added successfully',
            function: () {
              Get.back();
              Get.find<MainController>()
                ..pages.clear()
                ..push(const DashBoardPage(), dashBoardAppbar())
                ..update();
            });
        loading = true;
        update();
        await Get.find<DataController>().getData(BeneficiaryController);
      } else {
        loading = false;
        addBeneficiaryButtonLoading = false;
        update();
      }
    }
  }

  List<BeneficiaryFz> beneficiaries = [];

  void removeFocus() {
    Get.focusScope?.unfocus();
    update();
  }

  Future<void> onEditChange() async {
    if (benefAttributes.isBankTransfer &&
        Box3.settings.BankTransferMTO == true) {
      benefAttributes.serviceProviderList =
          await ApiService().getAddBeneficiaryService(
        countryCode: benefAttributes.selectedReceivingCountry?.id ?? '',
        currencyCode: benefAttributes.selectedCurrencyCode ?? '',
        serviceCode: benefAttributes.selectedServiceType?.id,
      );

      if (benefAttributes.selectedServiceProvider != null ||
          benefAttributes.selectedServiceProvider?.id.isNotEmpty == true) {
        bankList = await ApiService().getBanks3(
          countryCode: benefAttributes.selectedReceivingCountry?.id ?? '',
          serviceProviderCode:
              benefAttributes.selectedServiceProvider?.id ?? '',
          serviceTypeCode: benefAttributes.selectedServiceType?.id ?? '',
          currencyCode: benefAttributes.selectedCurrencyCode ?? '',
        );

        var pcvData = await ApiService().getProviderCountryValidation(
            countryCode: benefAttributes.selectedReceivingCountry?.id ?? '');

        if (pcvData != null) {
          providerCountryValidation = (pcvData.data['OutputBody']['RootNode']
                  ['response'] as List<dynamic>)
              .map((e) => MasterResponseFZ.fromJson(e))
              .toList();
          benefAttributes.providerCountryValidationLabel =
              providerCountryValidation[0].label;
          update();
        } else {
          benefAttributes.providerCountryValidationLabel = '';
          update();
        }

        bankBranchList = await ApiService().getBankBranches3(
          bankCode: benefAttributes.selectedBank?.id ?? '',
          countryCode: benefAttributes.selectedReceivingCountry?.id ?? '',
          serviceProviderCode:
              benefAttributes.selectedServiceProvider?.id ?? '',
          cityCode: benefAttributes.selectedOption['City']?.id ?? '',
          serviceTypeCode: benefAttributes.selectedServiceType?.id ?? '',
        );
      } else {
        form.sources['Bank'] = await ApiService().getBanks2(typeData: {
          "ServiceCountryCode":
              form.selectedSources['CountryCode']?.countryCode,
          "ServiceCurrencyCode":
              form.selectedSources['ServiceCurrencyCode']?.currencyCode,
          "ServiceCategoryCode":
              form.selectedSources['ServiceCategoryCode']?.categoryCode
        });

        // form.sources['Branch'] = await ApiService().getBankBranches2(typeData: {
        //   "BankCode": form.selectedSources['Bank']?.Code,
        // });
        getAllBranches();
      }
    } else if (benefAttributes.isBankTransfer) {
      form.sources['Bank'] = await ApiService().getBanks2(typeData: {
        "ServiceCountryCode": form.selectedSources['CountryCode']?.countryCode,
        "ServiceCurrencyCode":
            form.selectedSources['ServiceCurrencyCode']?.currencyCode,
        "ServiceCategoryCode":
            form.selectedSources['ServiceCategoryCode']?.categoryCode
      });

      // form.sources['Branch'] = await ApiService().getBankBranches2(typeData: {
      //   "BankCode": form.selectedSources['Bank']?.Code,
      // });
      getAllBranches();
    } else if (benefAttributes.isWalletTransfer) {
      benefAttributes.serviceProviderList =
          await ApiService().getAddBeneficiaryService(
        countryCode: benefAttributes.selectedReceivingCountry?.id ?? '',
        currencyCode: benefAttributes.selectedCurrencyCode ?? '',
        serviceCode: benefAttributes.selectedServiceType?.id,
      );
    }

    // currencyList = await ApiService().getServiceCurrency(typeData: {
    //   "Type": "SERVICECURRENCY",
    //   "ServiceCategoryCode": benefAttributes.selectedServiceType?.id ?? '',
    //   "ServiceCountryCode": benefAttributes.selectedReceivingCountry?.id ?? '',
    // });
  }

  KeyboardActionsConfig keyboardConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: benefAttributes.mobileNode,
          ),
        ]);
  }

  /// otp part
  TextEditingController mobOTP = TextEditingController();
  bool isResend = false;
  bool sending = false;
  int timeToResend = 60;
  Timer? otpTimer;
  String errorText = '';

  void startTimer1() {
    if (otpTimer != null) {
      otpTimer?.cancel();
    }
    timeToResend = 60;
    const oneSec = Duration(seconds: 1);
    otpTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timeToResend == 0) {
          otpTimer?.cancel();
          update();
        } else {
          timeToResend--;
          update();
        }
      },
    );
  }
}
