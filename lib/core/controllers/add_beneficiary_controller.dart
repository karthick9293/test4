import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/core/controllers/bottomSheet_controller.dart';
import 'package:mobiremit/models/bank_routing/bank_routing_fz.dart';
import 'package:mobiremit/models/custom_message/custom_message_details_fz.dart';
import 'package:mobiremit/models/masters/master_response_fz.dart';

import '../../models/beneficiary/beneficiary_fz.dart';
import '../../models/form_rules/form_rules_response_fz.dart';
import '../../network/api_service_new.dart';
import '../../ui_one/custom_widgets/custom_loader.dart';
import '../editing_controllers.dart/add_beneficiary_attributes.dart';
import '../editing_controllers.dart/attributes.dart';
import '../exports/built_values.dart';
import '../exports/controllers.dart';
import '../exports/ui_one_custom_widgets.dart';
import '../exports/ui_one_pages.dart';
import '../flavours/constants.dart';

class AddBeneficiaryController extends GetxController {
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

  BeneficiaryFz? selectedBeneficiary; // use for edit beneficiary
  bool catalogueRetrieved = false;
  bool isFormUpdating = false;
  bool _isAutoPrefilling = false;
  SignUpAttributes signUpAttributes = SignUpAttributes();
  AddBeneficiaryAttributes benefAttributes = AddBeneficiaryAttributes();
  DialogMpinAuthAttributes dialogAuthAttributes = DialogMpinAuthAttributes();

  TextEditingController archiveSearchController = TextEditingController();

  BankRoutingFz? bankRouting;

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
  Future<void> getBeneficiaryForm(
      {Map<String, dynamic>? data, String? criteriaMap}) async {
    FormRulesData? f = Box3.addBeneficiaryFormBV;
    // if (f == null || f.formFieldItem.isEmpty == true) {
    await Box3.getAddBeneficiaryForm(criteriaMap: criteriaMap);
    f = Box3.addBeneficiaryFormBV;
    loading == false;
    // update(); // Removed premature update to prevent flickering
    // }
    if (f != null) {
      form.initialiseForm(f.formFieldItem, data: data);
      beneficiaryFormBV = f;
      catalogueRetrieved = true;
      await loadSourcesData(f);
      if (data != null) {
        await loadOtherSources(f);
      }

      form.initDefaultValue(f.formFieldItem);
      update();
    }
  }

  Map<String, dynamic> getCurrentFormData() {
    Map<String, dynamic> currentData = {};

    // Collect text field data
    form.textFieldControllers.forEach((key, controller) {
      if (controller.text.isNotEmpty) {
        currentData[key] = controller.text;
      }
    });

    // Collect selected dropdown data
    form.selectedSources.forEach((key, value) {
      currentData[key] = value;
    });

    // Collect date field data
    form.dates.forEach((key, value) {
      currentData[key] = value;
    });

    return currentData;
  }

  Future<void> loadOtherSources(FormRulesData f) async {
    late SignUpController signUpController;
    if (Get.isRegistered<SignUpController>()) {
      signUpController = Get.find<SignUpController>();
    } else {
      signUpController = Get.put(SignUpController());
    }
    for (FormFieldItem item in f.formFieldItem) {
      if ((item.FieldType == FieldType.dropDownSingle ||
              item.FieldType == FieldType.dropDownMulti) &&
          (form.sources[item.ApiKey] == null ||
              form.sources[item.ApiKey]!.isEmpty) &&
          !signUpController.loadingSources.contains(item.FzParamName)) {
        if (excludeFromLoadSources(item)) {
          continue;
        }
        form.sources[item.ApiKey] =
            await signUpController.reFetchSources(item, currentForm: form);
      }
    }
  }

  bool excludeFromLoadSources(FormFieldItem item) {
    return item.FzParamName == "BeneficiaryBankCode" ||
        item.FzParamName == "BankCode" ||
        item.FzParamName == "BeneficiaryBranchCode" ||
        item.FzParamName == "AgentLocation" ||
        item.ApiKey == "listserviceprovider" ||
        item.FzParamName == "CityCode";
  }

  Future<void> loadSourcesData(FormRulesData f,
      {Map<String, dynamic>? data}) async {
    await Future.wait(f.formFieldItem
        .where((f) => (f.FieldType == FieldType.dropDownSingle ||
            f.FieldType == FieldType.dropDownMulti ||
            f.FieldType == FieldType.radio))
        .map((f1) => getSourcesNew(f1, data: data, preventUpdate: true))
        .toList());
    await _autoPrefillDropdowns();
    update();
  }

  Future<void> _autoPrefillDropdowns() async {
    if (_isAutoPrefilling || beneficiaryFormBV == null) return;
    _isAutoPrefilling = true;
    try {
      bool anyPrefilled = false;

      final items = beneficiaryFormBV!.formFieldItem.toList();
      bool fieldsChanged = false;

      for (int i = 0; i < items.length; i++) {
        var f = items[i];
        if ((f.FieldType == FieldType.dropDownSingle ||
                f.FieldType == FieldType.radio) &&
            f.enabled &&
            form.selectedSources[f.FzParamName] == null) {
          var options = form.sources[f.ApiKey];
          if (options != null && options.length == 1) {
            form.selectedSources[f.FzParamName] = options.first;
            form.errorTexts[f.FzParamName] = '';
            anyPrefilled = true;

            // Hide the field ONLY if it's the Service Provider
            if (f.FzParamName == 'ServiceProviderCode') {
              items[i] = f.copyWith(IsVisible: 'false', IsEnable: 'false');
              fieldsChanged = true;
            }

            await dropdownOnTapHandlers(f.FzParamName, f, preventUpdate: true);
          }
        }
      }

      if (fieldsChanged) {
        beneficiaryFormBV = beneficiaryFormBV!.copyWith(formFieldItem: items);
      }

      if (anyPrefilled) {
        _isAutoPrefilling = false;
        await _autoPrefillDropdowns();
      }
    } finally {
      _isAutoPrefilling = false;
    }
  }

  Future<void> getSourcesNew(FormFieldItem f,
      {Map<String, dynamic>? data, bool preventUpdate = false}) async {
    if (f.FzParamName == "BeneficiaryBankCode" ||
        f.FzParamName == "BankCode" ||
        f.FzParamName == "BeneficiaryBranchCode" ||
        f.FzParamName == "AgentLocation" ||
        f.ApiKey == "listserviceprovider" ||
        f.ApiKey == "SERVICECURRENCY" ||
        f.ApiKey == "COUNTRY" ||
        f.ApiKey == "BENEFICIARYCITY" ||
        f.ApiKey == "BENEFICIARYSTATE" ||
        f.ApiKey == "BICTYPE") {
      return;
    }

    late SignUpController signUpController;
    if (Get.isRegistered<SignUpController>()) {
      signUpController = Get.find<SignUpController>();
    } else {
      signUpController = Get.put(SignUpController());
    }

    if (f.ApiKey == "SERVICECATEGORY") {
      signUpController.loadingSources.add(f.FzParamName);
      bankRouting = await ApiService().bankRoutingList();
      if (bankRouting != null) {
        form.sources[f.ApiKey] = bankRouting?.data?.categoryList ?? [];
      } else {
        form.sources[f.ApiKey] = [];
      }
      signUpController.loadingSources.remove(f.FzParamName);
      return;
    }
    signUpController.loadingSources.add(f.FzParamName);

    form.sources[f.ApiKey] = await ApiService().getCatalogue(
        typeData: {"Type": f.ApiKey, "LanguageCode": Box3.lang?.Code ?? "EN"},
        type: f.ApiKey);

    if (data != null) {
      if (form.sources[f.ApiKey] != null) {
        if (form.sources[f.ApiKey]!
            .where((e) => e.Code == data[f.FzParamName])
            .toList()
            .isNotEmpty) {
          form.selectedSources[f.FzParamName] = form.sources[f.ApiKey]!
              .where((e) => e.Code == data[f.FzParamName])
              .toList()
              .first;
          form.errorTexts[f.FzParamName] = "";
        }
      }
    }
    signUpController.loadingSources.remove(f.FzParamName);
    if (!preventUpdate) update();
  }

  Future<List<MasterResponseFZ>> refetchSources(FormFieldItem f,
      {FormParameters? currentForm, String searchText = ''}) async {
    List<MasterResponseFZ> newData = [];
    switch (f.FzParamName) {
      case 'CountryCode':
        // newData = await ApiService().getServiceCountry(typeData: {
        //   "Type": "SERVICECOUNTRY",
        //   "ServiceCategoryCode":
        //       form.selectedSources['ServiceCategoryCode']?.Code,
        //   "LanguageCode": "EN"
        // });
        bankRouting ??= await ApiService().bankRoutingList();
        newData = bankRouting!.data!.countryList!
            .where((e) =>
                e.categoryCode ==
                form.selectedSources['ServiceCategoryCode']?.Code)
            .toList();

        break;
      case 'ServiceCategoryCode':
        bankRouting ??= await ApiService().bankRoutingList();
        if (bankRouting != null) {
          form.sources[f.ApiKey] = bankRouting?.data?.categoryList ?? [];
        }
        newData = bankRouting?.data?.categoryList ?? [];
        break;
      case 'ServiceCurrencyCode':
        // newData = await ApiService().getServiceCurrency(typeData: {
        //   "Type": "SERVICECURRENCY",
        //   "ServiceCategoryCode":
        //       form.selectedSources['ServiceCategoryCode']?.Code,
        //   "ServiceCountryCode": form.selectedSources['CountryCode']?.Code,
        //   "LanguageCode": "EN"
        // });
        bankRouting ??= await ApiService().bankRoutingList();
        newData = bankRouting!.data!.currencyList!
            .where((e) =>
                e.categoryCode ==
                    form.selectedSources['ServiceCategoryCode']?.Code &&
                (e.countryCode ==
                        form.selectedSources['CountryCode']?.countryCode ||
                    e.countryCode ==
                        form.selectedSources['CountryCode']?.countryCode))
            .toList();
        break;
      case 'ServiceProviderCode':
        // TransferController tfContrl = Get.find<TransferController>();
        // newData = await ApiService().getMoneyServiceProvider(typeData: {
        //   "ServiceCategoryCode":
        //       form.selectedSources['ServiceCategoryCode']?.Code ??
        //           tfContrl.selectedBeneficiary?.serviceType?.Code ??
        //           '',
        //   "ServiceCountryCode":
        //       form.selectedSources['CountryCode']?.countryCode ??
        //           tfContrl.selectedBeneficiary?.serviceCountry?.Code ??
        //           '',
        //   "ServiceCurrencyCode":
        //       form.selectedSources['ServiceCurrencyCode']?.Code ??
        //           tfContrl.selectedBeneficiary?.serviceCurrency?.Code ??
        //           '',
        //   "LanguageCode": Box3.lang?.Code ?? "EN"
        // });

        if (f.FormName == "Send_Money_Form Rules") {
          TransferController trans = Get.find<TransferController>();
          newData = await trans.getServiceProviders(
            countryCode: trans.selectedBeneficiary?.serviceCountry?.Code ?? '',
            currencyCode:
                trans.selectedBeneficiary?.serviceCurrency?.Code ?? '',
            serviceCategoryCode:
                trans.selectedBeneficiary?.serviceType?.Code ?? '',
          );
        } else {
          newData = await ApiService().getMoneyServiceProvider(typeData: {
            "ServiceCategoryCode":
                form.selectedSources['ServiceCategoryCode']?.Code,
            "ServiceCountryCode":
                form.selectedSources['CountryCode']?.countryCode,
            "ServiceCurrencyCode":
                form.selectedSources['ServiceCurrencyCode']?.currencyCode,
            "LanguageCode": Box3.lang?.Code ?? "EN"
          });
        }
        break;
      case 'BeneficiaryBankCode' || 'BankCode':
        if (f.FormName == "Send_Money_Form Rules") {
          TransferController trans = Get.find<TransferController>();
          newData = await trans.getBanks2(f);
        } else {
          newData = await ApiService().getBanks2(typeData: {
            "ServiceCountryCode":
                form.selectedSources['CountryCode']?.countryCode,
            "ServiceCurrencyCode":
                form.selectedSources['ServiceCurrencyCode']?.currencyCode,
            "ServiceCategoryCode":
                form.selectedSources['ServiceCategoryCode']?.categoryCode,
            "FilterBy": {
              "IsAgentOrBank": f.FieldId == 'agent' ? 'AG' : 'BK',
              "BaseCountryCode": Box3.companyDataFZ?.companySettings?.country,
              "BaseCurrencyCode":
                  Box3.companyDataFZ?.companySettings?.baseCurrency,
              "StateCode": form.selectedSources['StateCode']?.stateCode ?? '',
              "CityCode": form.selectedSources['CityCode']?.cityCode ?? '',
              "ApiCallFrom": 'B',
            },
          });
        }
        break;
      case 'BeneficiaryBranchCode' || 'AgentLocation':
        // newData = await ApiService().getBankBranches2(typeData: {
        //   "BankCode": form.selectedSources['BeneficiaryBankCode']?.Code,
        // });
        // getAllBranches(
        //     f: f, currentForm: currentForm ?? form, isRefetching: true);
        final formA = currentForm ?? form;
        if (f.FormName == 'Send_Money_Form Rules') {
          TransferController trans = Get.find<TransferController>();
          MasterResponseFZ? benefBankCode =
              trans.form.selectedSources['BeneficiaryBankCode'] ??
                  trans.form.selectedSources['BankCode'] ??
                  trans.selectedBeneficiary?.bank;
          final benefStateCode = formA.selectedSources['StateCode']?.Code ??
              formA.selectedSources['StateCode']?.stateCode ??
              trans.selectedBeneficiary?.state?.Code;
          final benefCityCode = formA.selectedSources['CityCode']?.Code ??
              formA.selectedSources['CityCode']?.cityCode ??
              trans.selectedBeneficiary?.city?.Code;

          final resp = await ApiService().getBankBranches2(typeData: {
            "PageNumber": "",
            "PageSize": "",
            "BankCode": benefBankCode?.Code,
            "ServiceCountryCode": trans.selectedBeneficiary?.country?.Code,
            "ServiceCurrencyCode":
                trans.selectedBeneficiary?.serviceCurrency?.Code,
            "ServiceCategoryCode": trans.selectedBeneficiary?.serviceType?.Code,
            "FilterBy": {
              "IsLocationOrBranch": f.FieldId == 'agentLocation' ? 'AL' : 'BR',
              "BankCode": benefBankCode?.Code,
              "BankName": benefBankCode?.Desc,
              "BranchCode": trans.selectedBeneficiary?.branch?.Code ?? "",
              "BranchName": searchText.isNotEmpty
                  ? searchText
                  : trans.selectedBeneficiary?.branch?.Desc ?? "",
              "BaseCountryCode": Box3.companyDataFZ?.companySettings?.country,
              "BaseCurrencyCode":
                  Box3.companyDataFZ?.companySettings?.baseCurrency,
              "StateCode": benefStateCode ?? '',
              "CityCode": benefCityCode ?? '',
            }
          });
          newData = resp['branchList'];
        } else {
          final resp = await ApiService().getBankBranches2(typeData: {
            "PageNumber": "",
            "PageSize": "",
            "BankCode": formA.selectedSources['BeneficiaryBankCode']?.Code ??
                formA.selectedSources['BankCode']?.Code,
            "ServiceCountryCode":
                formA.selectedSources['CountryCode']?.countryCode,
            "ServiceCurrencyCode":
                formA.selectedSources['ServiceCurrencyCode']?.currencyCode,
            "ServiceCategoryCode":
                formA.selectedSources['ServiceCategoryCode']?.categoryCode,
            "FilterBy": {
              "IsLocationOrBranch": f.FieldId == 'agentLocation' ? 'AL' : 'BR',
              "BankCode": formA.selectedSources['BeneficiaryBankCode']?.Code ??
                  formA.selectedSources['BankCode']?.Code,
              "BankName": formA.selectedSources['BeneficiaryBankCode']?.Desc ??
                  formA.selectedSources['BankCode']?.Desc,
              "BranchName": searchText,
              "BaseCountryCode": Box3.companyDataFZ?.companySettings?.country,
              "BaseCurrencyCode":
                  Box3.companyDataFZ?.companySettings?.baseCurrency,
              "StateCode": formA.selectedSources['StateCode']?.stateCode ?? '',
              "CityCode": formA.selectedSources['CityCode']?.cityCode ?? '',
            }
          });
          newData = resp['branchList'];
        }
        break;
      case 'BicCode':
        newData = await ApiService().getCatalogue(
          typeData: {
            "Type": "BICTYPE",
            "ServiceCountryCode":
                form.selectedSources['CountryCode']?.countryCode ?? '',
            "ServiceCurrencyCode":
                form.selectedSources['ServiceCurrencyCode']?.currencyCode ?? '',
          },
          type: 'BICTYPE',
        );
        break;
      case 'StateCode':
        if (f.FormName == "Send_Money_Form Rules") {
          TransferController trans = Get.find<TransferController>();
          newData = await ApiService().getState(typeData: {
            "BaseCurrencyCode":
                Box3.companyDataFZ?.companySettings?.baseCurrency,
            "ServiceCategoryCode": trans.selectedBeneficiary?.serviceType?.Code,
            "ServiceCountryCode": trans.selectedBeneficiary?.country?.Code,
            "ServiceCurrencyCode":
                trans.selectedBeneficiary?.serviceCurrency?.Code
          });
        } else {
          newData = await ApiService().getState(typeData: {
            "BaseCurrencyCode":
                Box3.companyDataFZ?.companySettings?.baseCurrency,
            "ServiceCategoryCode":
                form.selectedSources['ServiceCategoryCode']?.Code,
            "ServiceCountryCode":
                form.selectedSources['CountryCode']?.countryCode,
            "ServiceCurrencyCode":
                form.selectedSources['ServiceCurrencyCode']?.currencyCode
          });
        }
        break;
      case 'CityCode':
        if (f.FormName == "Send_Money_Form Rules") {
          TransferController trans = Get.find<TransferController>();
          newData = await ApiService().getCity(typeData: {
            "BaseCurrencyCode":
                Box3.companyDataFZ?.companySettings?.baseCurrency,
            "ServiceCategoryCode": trans.selectedBeneficiary?.serviceType?.Code,
            "ServiceCountryCode": trans.selectedBeneficiary?.country?.Code,
            "ServiceCurrencyCode":
                trans.selectedBeneficiary?.serviceCurrency?.Code,
            "StateCode": trans.form.selectedSources['StateCode']?.Code ??
                trans.form.selectedSources['StateCode']?.stateCode ??
                ''
          });
        } else {
          newData = await ApiService().getCity(typeData: {
            "BaseCurrencyCode":
                Box3.companyDataFZ?.companySettings?.baseCurrency,
            "ServiceCategoryCode":
                form.selectedSources['ServiceCategoryCode']?.Code,
            "ServiceCountryCode":
                form.selectedSources['CountryCode']?.countryCode,
            "ServiceCurrencyCode":
                form.selectedSources['ServiceCurrencyCode']?.currencyCode,
            "StateCode": form.selectedSources['StateCode']?.Code ??
                form.selectedSources['StateCode']?.stateCode ??
                ''
          });
        }
        break;
      default:
        newData = await Get.put(BottomSheetController()).getSource(f.ApiKey);
        break;
    }
    return newData;
  }

  Future<void> dropdownOnTapHandlers(String id, FormFieldItem f,
      {bool preventUpdate = false}) async {
    debugPrint("selected_sources:-${form.selectedSources}");
    debugPrint("sources:-${form.sources}");
    switch (id) {
      case 'ServiceCategoryCode':
        if (form.selectedSources[id] != null) {
          form.selectedSources.removeWhere((key, value) => [
                'CountryCode',
                'ServiceCurrencyCode',
                'listserviceprovider',
                'BeneficiaryBankCode',
                'BeneficiaryBranchCode',
                'BicType',
                'BicValue',
              ].contains(key));
          ['AccountNumber', 'BicValue', 'BicType', 'SwiftCode']
              .map((e) => form.textFieldControllers[e]?.clear());
          form.sources['COUNTRY'] = [];
          form.sources['SERVICECURRENCY'] = [];
          form.selectedSources.remove("CountryCode");
          form.selectedSources.remove("ServiceCurrencyCode");
          form.textFieldControllers["CountryCode"]?.clear();
          form.textFieldControllers["ServiceCurrencyCode"]?.clear();
          if (!preventUpdate) update();
          // form.sources['COUNTRY'] = await ApiService().getServiceCountry(
          //     typeData: {"Type": "SERVICECOUNTRY", "ServiceCategoryCode": form.selectedSources['ServiceCategoryCode']?.Code, "LanguageCode": "EN"});
          form.sources['COUNTRY'] = bankRouting!.data!.countryList!
              .where((e) =>
                  e.categoryCode ==
                  form.selectedSources['ServiceCategoryCode']?.Code)
              .toList();
          if (!preventUpdate) {
            update();
            Get.find<SignUpController>().update();
          }
        }
        break;
      case 'CountryCode':
        if (form.selectedSources[id] != null) {
          form.sources['SERVICECURRENCY'] = [];
          form.selectedSources.removeWhere((key, value) => [
                'ServiceCurrencyCode',
                'listserviceprovider',
                'BeneficiaryBankCode',
                'BeneficiaryBranchCode'
              ].contains(key));
          ['AccountNumber', 'BicValue', 'SwiftCode']
              .map((e) => form.textFieldControllers[e]?.clear());
          form.sources['SERVICECURRENCY'] = bankRouting!.data!.currencyList!
              .where((e) =>
                  e.categoryCode ==
                      form.selectedSources['ServiceCategoryCode']?.Code &&
                  e.countryCode ==
                      form.selectedSources['CountryCode']?.countryCode)
              .toList();
          form.sources['BeneficiaryBankCode'] = [];
          form.sources['BeneficiaryBranchCode'] = [];
          form.selectedSources.remove('BeneficiaryBankCode');
          form.selectedSources.remove('BeneficiaryBranchCode');
          if (!preventUpdate) {
            update();
            Get.find<SignUpController>().update();
          }
          // Get.find<BottomSheetController>().update();
        }
        break;
      case 'BeneficiaryBranchCode' || 'AgentLocation':
        if (form.selectedSources[id] != null && beneficiaryFormBV != null) {
          final branchData = form.selectedSources[id]!;
          final formFields = beneficiaryFormBV!.formFieldItem;

          // Prefill BicCode (dropdown) from branchBicDetails if field exists in form rules
          final hasBicCodeField =
              formFields.any((f) => f.FzParamName == 'BicCode');
          if (hasBicCodeField && branchData.branchBicDetails.isNotEmpty) {
            final firstBic = branchData.branchBicDetails.first;
            form.selectedSources['BicCode'] = MasterResponseFZ(
              Code: firstBic.BicTypeCode,
              Desc: firstBic.BicTypeDescription,
            );
          } else if (hasBicCodeField && branchData.bicType.isNotEmpty) {
            form.selectedSources['BicCode'] = MasterResponseFZ(
              Code: branchData.bicType,
              Desc: branchData.bicType,
            );
          }

          // Prefill BicValue (text field) from branchBicDetails if field exists in form rules
          final hasBicValueField =
              formFields.any((f) => f.FzParamName == 'BicValue');
          if (hasBicValueField) {
            final bicValueFromDetails = branchData.branchBicDetails.isNotEmpty
                ? branchData.branchBicDetails.first.BicTypeValue
                : '';
            final bicValue = bicValueFromDetails.isNotEmpty
                ? bicValueFromDetails
                : branchData.bicValue;
            if (bicValue.isNotEmpty) {
              form.textFieldControllers['BicValue']?.text = bicValue;
            }
          }

          if (!preventUpdate) {
            update();
            Get.find<SignUpController>().update();
          }
        }
        break;
      case 'ServiceCurrencyCode':
        if (form.selectedSources[id] != null) {
          if (form.selectedSources['ServiceCategoryCode']?.Code == 'C' ||
              form.selectedSources['ServiceCategoryCode']?.Code == 'W') {
            form.sources.removeWhere((key, value) => [
                  'MoneyServiceProvider',
                  'BENEFICIARYSTATE',
                  'BENEFICIARYCITY'
                ].contains(key));
            form.sources['listserviceprovider'] = [];
            form.selectedSources.removeWhere((key, value) => [
                  'MoneyServiceProvider',
                  'BeneficiaryBankCode',
                  'BeneficiaryBranchCode',
                  'AgentLocation',
                  'BankCode',
                  'StateCode',
                  'CityCode'
                ].contains(key));
            ['AccountNumber', 'BicCode', 'SwiftCode']
                .map((e) => form.textFieldControllers[e]?.clear());
            if (!preventUpdate) update();
          } else if (form.selectedSources['ServiceCategoryCode']?.Code == 'B') {
            form.sources.removeWhere((key, value) => [
                  'MoneyServiceProvider',
                  'BENEFICIARYSTATE',
                  'BENEFICIARYCITY'
                ].contains(key));
            form.sources['listserviceprovider'] = [];
            form.selectedSources.removeWhere((key, value) => [
                  'MoneyServiceProvider',
                  'BeneficiaryBankCode',
                  'BeneficiaryBranchCode'
                      'AgentLocation',
                  'BankCode',
                  'StateCode',
                  'CityCode'
                ].contains(key));
            ['AccountNumber', 'BicValue', 'SwiftCode']
                .map((e) => form.textFieldControllers[e]?.clear());

            form.sources['BeneficiaryBankCode'] = [];
            // form.sources['BeneficiaryBankCode'] =
            //     await ApiService().getBanks2(typeData: {
            //   "ServiceCountryCode":
            //       form.selectedSources['CountryCode']?.countryCode,
            //   "ServiceCurrencyCode":
            //       form.selectedSources['ServiceCurrencyCode']?.currencyCode,
            //   "ServiceCategoryCode":
            //       form.selectedSources['ServiceCategoryCode']?.categoryCode
            // });

            form.selectedSources.remove('BicCode');
            form.sources['BICTYPE'] = [];
            // form.sources['BICTYPE'] = await ApiService().getCatalogue(
            //   typeData: {
            //     "Type": "BICTYPE",
            //     "ServiceCountryCode":
            //         form.selectedSources['CountryCode']?.countryCode ?? '',
            //     "ServiceCurrencyCode":
            //         form.selectedSources['ServiceCurrencyCode']?.currencyCode ??
            //             '',
            //   },
            //   type: 'BICTYPE',
            // );
            if (!preventUpdate) update();
          }
          if (!preventUpdate) Get.find<SignUpController>().update();
        }
        break;
      case 'ServiceProviderCode':
        isFormUpdating = true;
        if (!preventUpdate) update();
        try {
          Map<String, dynamic> currentFormData = getCurrentFormData();
          Box3.addBeneficiaryFormBV = null;
          await getBeneficiaryForm(
            data: currentFormData,
            criteriaMap:
                "Correspondent Country = ${form.selectedSources['CountryCode']?.Code};Correspondent Currency = ${form.selectedSources['ServiceCurrencyCode']?.Code};Correspondent Service Category = ${form.selectedSources['ServiceCategoryCode']?.Code};Correspondent = ${form.selectedSources['ServiceProviderCode']?.Code}",
          );
        } catch (e) {
          logger.e('Error refetching beneficiary form rules: $e');
        } finally {
          isFormUpdating = false;
          if (!preventUpdate) {
            update();
            Get.find<SignUpController>().update();
          }
        }
        break;
      case 'BeneficiaryBankCode' || 'BankCode':
        form.sources.remove('BeneficiaryBranchCode');
        form.selectedSources.remove('BeneficiaryBranchCode');
        // Get.find<SignUpController>().loadingSources.add('BeneficiaryBranchCode');
        if (form.selectedSources[id] != null) {
          Map<String, dynamic> res = await ApiService().validateAccountNoLength(
              benfBankCode: form.selectedSources[id]!.Code,
              currencyCode:
                  form.selectedSources['ServiceCurrencyCode']?.currencyCode ??
                      '');
          List<BankAccountLength> accLength = res["AccountLength"];
          CustomMessageDetailsFZ? messageDetails = res["Message"];
          form.selectedSources[id] = form.selectedSources[id]!.copyWith(
            accountLengthList: accLength,
          );
          form.accNoLengthValidationMsg[id] =
              messageDetails?.MessageDescription ?? "";

          // if (beneficiaryFormBV != null &&
          //     beneficiaryFormBV!.formFieldItem.any(
          //       (field) => field.FzParamName == 'BeneficiaryBranchCode',
          //     )) {
          //   Get.find<SignUpController>()
          //       .loadingSources
          //       .add('BeneficiaryBranchCode');

          //   try {
          //     final resp = await ApiService().getBankBranches2(typeData: {
          //       "PageNumber": "",
          //       "PageSize": "",
          //       "BankCode": form.selectedSources['BeneficiaryBankCode']?.Code,
          //       "ServiceCountryCode":
          //           form.selectedSources['CountryCode']?.countryCode,
          //       "ServiceCurrencyCode":
          //           form.selectedSources['ServiceCurrencyCode']?.currencyCode,
          //       "ServiceCategoryCode":
          //           form.selectedSources['ServiceCategoryCode']?.categoryCode
          //     });
          //     form.sources['BeneficiaryBranchCode'] = resp['branchList'];
          //   } finally {
          //     Get.find<SignUpController>()
          //         .loadingSources
          //         .remove('BeneficiaryBranchCode');
          //   }
          // }
        }
        if (!preventUpdate) {
          update();
          Get.find<SignUpController>().update();
        }
        break;
      case 'StateCode':
        form.sources
            .removeWhere((key, value) => ['BENEFICIARYCITY'].contains(key));

        form.selectedSources
            .removeWhere((key, value) => ['CityCode'].contains(key));
        break;
    }

    // if (!_isAutoPrefilling) {
    //   await _autoPrefillDropdowns();
    // }
  }

  // Future<void> getAllBranches(
  //     {bool isRefetching = false,
  //     required FormFieldItem f,
  //     required FormParameters currentForm}) async {
  //   late SignUpController signUpController;
  //   if (Get.isRegistered<SignUpController>()) {
  //     signUpController = Get.find<SignUpController>();
  //   } else {
  //     signUpController = Get.put(SignUpController());
  //   }

  //   if (!isRefetching &&
  //       signUpController.loadingSources.contains('BeneficiaryBranchCode')) {
  //     return;
  //   }

  //   bool allBranchesLoaded = false;
  //   int pageNumber = 1;
  //   int pageSize = 500;

  //   try {
  //     Get.find<SignUpController>().loadingSources.add('BeneficiaryBranchCode');
  //     while (!allBranchesLoaded) {
  //       Map<String, dynamic> res = {};
  //       if (f.FormName == "Send_Money_Form Rules") {
  //         TransferController trans = Get.find<TransferController>();

  //         if (trans.selectedBeneficiary == null) break;

  // MasterResponseFZ? benefBankCode =
  //     trans.form.selectedSources['BeneficiaryBankCode'] ??
  //         trans.selectedBeneficiary?.bank;
  //         res = await ApiService().getBankBranches2(typeData: {
  //           "PageNumber": pageNumber,
  //           "PageSize": pageSize,
  //           "BankCode": benefBankCode?.Code,
  //           "ServiceCountryCode": trans.selectedBeneficiary?.country?.Code,
  //           "ServiceCurrencyCode":
  //               trans.selectedBeneficiary?.serviceCurrency?.Code,
  //           "ServiceCategoryCode": trans.selectedBeneficiary?.serviceType?.Code,
  //           "FilterBy": {
  //             "BankCode": benefBankCode?.Code,
  //             "BankName": benefBankCode?.Desc,
  //             "BranchCode": trans.selectedBeneficiary?.branch?.Code ?? "",
  //             "BranchName": trans.selectedBeneficiary?.branch?.Desc ?? "",
  //           }
  //         });
  //       } else {
  // res = await ApiService().getBankBranches2(typeData: {
  //   "BankCode":
  //       currentForm.selectedSources['BeneficiaryBankCode']?.Code,
  //   "PageNumber": pageNumber,
  //   "PageSize": pageSize,
  //   "ServiceCountryCode":
  //       currentForm.selectedSources['CountryCode']?.countryCode,
  //   "ServiceCurrencyCode": currentForm
  //       .selectedSources['ServiceCurrencyCode']?.currencyCode,
  //   "ServiceCategoryCode":
  //       currentForm.selectedSources['ServiceCategoryCode']?.categoryCode
  // });
  //       }

  //       final branches = res['branchList'] as List<MasterResponseFZ>;
  //       PaginationDetailsFz? pageDetails = res['paginationDetails'];

  //       if (pageNumber == 1) {
  //         currentForm.sources['listbranch'] = branches;
  //         if (isRefetching) {
  //           signUpController.list[f.FzParamName] = branches;
  //           signUpController.filteredList[f.FzParamName] = branches;
  //         }
  //       } else if (branches.isNotEmpty) {
  //         currentForm.sources['listbranch']?.addAll(branches);
  //         if (isRefetching) {
  //           signUpController.list[f.FzParamName]?.addAll(branches);
  //           signUpController.filteredList[f.FzParamName]?.addAll(branches);
  //         }
  //       }

  //       if (!isRefetching) {
  //         signUpController.update(['dropdown-list']);
  //       }

  //       if (pageDetails != null &&
  //           pageDetails.pageNumber >= pageDetails.totalPages) {
  //         allBranchesLoaded = true;
  //         break;
  //       }

  //       pageNumber++;
  //     }
  //   } catch (e) {
  //     logger.e('Error loading branch data: $e');
  //   } finally {
  //     Get.find<SignUpController>()
  //         .loadingSources
  //         .remove('BeneficiaryBranchCode');
  //   }
  // }

  Future<void> getData() async {
    if (loading) {
      await Get.find<DataController>().getData(BeneficiaryController);
      update();
    }
  }

  List<String> customVisibilityFields = [
    // 'ServiceProviderCode',
    // 'BeneficiaryBankCode',
    // 'BeneficiaryBranchCode',
    // 'AccountNumber',
    // 'dummy_confirmaccountNumber',
    // 'BicCode',
    // 'BicValue',
    // 'dummy_swiftCode',
    // 'IdTypeCode',
    // 'IdNo',
    // 'CountryCode',
    // 'ServiceCurrencyCode'
  ];

  bool visibilityChecker(String id) =>
      {
        // 'ServiceProviderCode':
        //     (form.selectedSources['ServiceCategoryCode']?.Code == 'C' ||
        //         form.selectedSources['ServiceCategoryCode']?.Code == 'W'),
        // 'BeneficiaryBankCode':
        //     form.selectedSources['ServiceCategoryCode']?.Code == 'B' ||
        //         form.selectedSources['ServiceCategoryCode']?.Code == 'W',
        // 'BeneficiaryBranchCode':
        //     form.selectedSources['ServiceCategoryCode']?.Code == 'B' ||
        //         form.selectedSources['ServiceCategoryCode']?.Code == 'W',
        // 'AccountNumber':
        //     form.selectedSources['ServiceCategoryCode']?.Code == 'B' ||
        //         form.selectedSources['ServiceCategoryCode']?.Code == 'W',
        // 'dummy_confirmaccountNumber':
        //     form.selectedSources['ServiceCategoryCode']?.Code == 'B' ||
        //         form.selectedSources['ServiceCategoryCode']?.Code == 'W',
        // 'BicCode': form.selectedSources['ServiceCategoryCode']?.Code == 'B' ||
        //     form.selectedSources['ServiceCategoryCode']?.Code == 'W',
        // 'BicValue': form.selectedSources['ServiceCategoryCode']?.Code == 'B' ||
        //     form.selectedSources['ServiceCategoryCode']?.Code == 'W',
        // 'dummy_swiftCode':
        //     form.selectedSources['ServiceCategoryCode']?.Code == 'B' ||
        //         form.selectedSources['ServiceCategoryCode']?.Code == 'W',
        // 'IdTypeCode': form.selectedSources['ServiceCategoryCode'] != null,
        // 'IdNo': form.selectedSources['ServiceCategoryCode'] != null,
        // 'CountryCode': form.selectedSources['ServiceCategoryCode'] != null,
        // 'ServiceCurrencyCode':
        //     form.selectedSources['ServiceCategoryCode'] != null,
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

  List<String> selectedGender = [];
  List<String> genderList = ['male'.tr, 'female'.tr, 'other'.tr];

  Future<void> getCatalogs() async {
    await Future.wait([
      ApiService()
          .getCatalogue(typeData: {"Type": "NATIONALITY"}, type: 'NATIONALITY'),
      ApiService().getCatalogue(
          typeData: {"Type": "RELATIONSHIP"}, type: 'RELATIONSHIP'),
      ApiService().getCatalogue(
          typeData: {"Type": "SERVICECATEGORY"}, type: 'SERVICECATEGORY'),
      ApiService().getCatalogue(typeData: {"Type": "IDTYPE"}, type: 'IDTYPE'),
    ]);

    catalogueRetrieved = true;
    update();
  }

  Future<void> addBeneficiary() async {
    if (AppConfigs.formRules) {
      late BeneficiaryController beneficiaryController;
      if (Get.isRegistered<BeneficiaryController>()) {
        beneficiaryController = Get.find<BeneficiaryController>();
      } else {
        beneficiaryController = Get.put(BeneficiaryController());
      }

      addBeneficiaryButtonLoading = true;
      update();
      CustomMessageDetailsFZ? customMsgDetail = await ApiService()
          .addBeneficiary2(form.buildJsonNew(beneficiaryFormBV!.formFieldItem));
      if (customMsgDetail != null) {
        await showSuccessAlert(
          title: customMsgDetail.MessageHeader,
          content: customMsgDetail.MessageDescription,
          function: () {
            Get.back();
            Get.find<MainController>()
              ..pages.clear()
              ..push(const DashBoardPage(), dashBoardAppbar())
              ..update();
          },
        );
        loading = true;

        beneficiaryController
          ..loading = true
          ..update();
        update();
        final tContrlReg = Get.isRegistered<TransferController>();
        if (tContrlReg) {
          Get.find<TransferController>()
            ..syncingBeneficiaries = true
            ..update();
        }
        await Get.find<DataController>().getData(BeneficiaryController);
        if (tContrlReg) {
          Get.find<TransferController>()
            ..syncingBeneficiaries = false
            ..update();
        }
      } else {
        loading = false;
        addBeneficiaryButtonLoading = false;
        beneficiaryController
          ..loading = false
          ..update();
        update();
      }
    }
  }

  Future<void> updateBeneficiary() async {
    if (AppConfigs.formRules) {
      addBeneficiaryButtonLoading = true;
      update();
      try {
        CustomMessageDetailsFZ? customMsgDetail =
            await ApiService().updateBeneficiary(
          form.buildJsonNew(beneficiaryFormBV!.formFieldItem),
          benef: selectedBeneficiary,
        );
        if (customMsgDetail != null) {
          await showSuccessAlert(
            title: customMsgDetail.MessageHeader,
            content: customMsgDetail.MessageDescription,
            function: () {
              Get.back();
              Get.find<MainController>()
                ..pop()
                ..update();
            },
          );
          loading = true;
          Get.find<BeneficiaryController>()
            ..loading = true
            ..update();
          update();
          await Get.find<DataController>().getData(BeneficiaryController);
        }
      } finally {
        loading = false;
        addBeneficiaryButtonLoading = false;
        Get.find<BeneficiaryController>()
          ..loading = false
          ..update();
        update();
      }
    }
  }

  List<BeneficiaryFz> beneficiaries = [];

  void removeFocus() {
    Get.focusScope?.unfocus();
    update();
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
