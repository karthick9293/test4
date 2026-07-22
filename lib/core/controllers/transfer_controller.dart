import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/models/banks/drawing_bank_fz.dart';
import 'package:mobiremit/models/custom_message/custom_message_details_fz.dart';
import 'package:mobiremit/models/customer_details/customer_data_fz.dart';
import 'package:mobiremit/models/payment_modes/payment_mode_fz.dart';
import 'package:mobiremit/models/send_money/send_money_model.dart';
import 'package:mobiremit/models/send_money/send_money_p_gateway.dart';
import 'package:mobiremit/models/send_money/send_money_resp_model.dart';
import 'package:mobiremit/models/transaction_details/transaction_details_fz.dart';
import '../../ui_common/screens/payment_web_page.dart';

import '../../models/beneficiary/beneficiary_fz.dart';
import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../../models/offers/offers_fz.dart';
import '../../models/rate_calculator/rate_calculator_fz.dart';
import '../../models/rate_charge/rate_charge_fz.dart';
import '../../models/reg_device/register_device_fz.dart';
import '../../network/api_endpoints.dart';
import '../../network/api_service_new.dart';
import '../../ui_common/app_routes.dart';
import '../../ui_one/custom_widgets/mpin_alert.dart';
import '../../ui_one/custom_widgets/otp_alert.dart';
import '../../ui_one/screens/home/my_transactions/payment_exception_alert.dart';
import '../../ui_one/screens/home/my_transactions/payment_fail_alert.dart';
import '../../ui_one/screens/home/my_transactions/transaction_receipt_alert.dart';
import '../editing_controllers.dart/add_beneficiary_attributes.dart';
import '../editing_controllers.dart/attributes.dart';
import '../exports/built_values.dart';
import '../exports/controllers.dart';
import '../exports/ui_one_custom_widgets.dart';
import '../flavours/constants.dart';
import '../../models/application_settings/settings_fz.dart' show AppUI;
import '../../ui_one/custom_widgets/app_bars.dart' as ui1appbars;
import '../../ui_two/custom_widgets/app_bars.dart' as ui2appbars;
import '../../ui_three/custom_widgets/app_bars.dart' as ui3appbars;
import 'package:mobiremit/core/models/formatter.dart';

class TransferController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TransferType transferType;

  FormRulesData? sendMoneyFormBV;
  FormParameters form = FormParameters(type: FormType.sendMoney);
  bool catalogueRetrieved = false;
  bool isFormUpdating = false;
  bool _isAutoPrefilling = false;

  TransferController({required this.transferType});

  ScrollController listScrollController = ScrollController();
  RxInt tabIdex = 0.obs;

  XFile? bill;
  int? promoIndex;

  bool showFavBenefOnly = false;
  bool isBenef = false,
      listLoading =
          !Get.find<DataController>().transactionAndBeneficiaryRetrieved,
      syncingBeneficiaries = false,
      viewMoreDeails = false;
  List<PaymentMode> payments = [];
  List<PaymentMode> paymentGateways = [];
  PaymentMode? gateWay;
  List<MasterResponseFZ> sources = [], purposes = [];
  MasterResponseFZ? selectedSource, selectedPurpose;
  final GlobalKey purposeDropdownKey = GlobalKey();
  final GlobalKey sourceDropdownKey = GlobalKey();
  bool webLoading = false;

  List<Offer> offersList = [];
  Offer? selectedOffer;

  SendMoneyResp? sendMoneyResp;
  String? serviceType;
  RateChargeFz? rC;
  ChargeDetails? rateCharge;
  bool isDark = Get.find<AccountController>().isDark,
      buttonLoading = false,
      loadingPage = false;
  RxBool loadingPaymentGateway = false.obs;
  List<DrawingBankFz> banksList = [];
  List<PayAccountNumberFZ> accountNumbers = [];
  GatewayDetailsBV? gatewayDetails;
  Timer? searchOnStoppedTyping;
  bool loading = !Get.find<DataController>().transactionAndBeneficiaryRetrieved,
      purposeError = false,
      sourceError = false,
      serviceProviderError = false,
      formruleLoading = false;
  RxBool rateLoader = false.obs;
  RxBool loadingSourceNpurpose = false.obs;
  bool sourcePurposeVisibility = false;

  bool get hasVisibleFormFields {
    if (sendMoneyFormBV == null) return false;
    return sendMoneyFormBV!.formFieldItem.any((f) =>
        f.IsVisible.toLowerCase() == 'true' ||
        f.IsMandatory.toLowerCase() == 'true');
  }

  TextEditingController fromAmountCtrl = TextEditingController(text: ''),
      toAmountCtrl = TextEditingController(),
      searchBenefController = TextEditingController(),
      selectBeneficiaryController = TextEditingController(),
      favBeneficiaryController = TextEditingController(),
      transactionController = TextEditingController();
  String fromAmtCur = Box3.companyDataFZ!.companySettings!.primaryBaseCurrency,
      gatewayError = '';

  String? toAmtCur;
  List<MasterResponseFZ> serviceProviders = [];
  MasterResponseFZ? serviceProvider;

  String fromAmtErr = '', toAmtErr = '';
  BeneficiaryFz? selectedBeneficiary; // fromBeneficiary;
  List<BeneficiaryFz> benefs = Get.find<DataController>().beneficiaries,
      filteredBenefs = Get.find<DataController>()
          .beneficiaries
          .where(
            (b) => b.serviceType?.Code == 'C'
                ? (b.active == 'A')
                : b.serviceType?.Code == 'B'
                    ? b.active == 'A'
                    : (b.active == 'A'),
          )
          .toList(),
      favBenefs = Get.find<DataController>()
          .beneficiaries
          .where(
            (b) => b.serviceType?.Code == 'C'
                ? (b.active == 'A' && b.fav == 'Y')
                : b.serviceType?.Code == 'B'
                    ? (b.active == 'A' && b.fav == 'Y')
                    : (b.active == 'A' && b.fav == 'Y'),
          )
          .toList(),
      filteredFavBenefs = Get.find<DataController>()
          .beneficiaries
          .where((b) => (b.serviceType?.Code == 'C'
              ? (b.active == 'A' && b.fav == 'Y')
              : b.serviceType?.Code == 'B'
                  ? (b.active == 'A' && b.fav == 'Y')
                  : (b.active == 'A' && b.fav == 'Y')))
          .toList();

  TransactionDetailsFz? selectedTransaction;
  List<TransactionDetailsFz> transactions =
      Get.find<DataController>().transactions;
  List<TransactionDetailsFz> recentTransactions = [];
  List<TransactionDetailsFz> filteredRecentTransactions = [];
  List<DebitBankBV> debitBanks = [];
  DebitBankBV? selectedDebitBank;
  String debitBankError = '';

  double getTabviewHeight() {
    switch (tabIdex.value) {
      case 0:
        if (filteredBenefs.length == 1) {
          return 137;
        } else if (filteredBenefs.length == 2) {
          return 205;
        } else {
          return 270;
        }
      case 1:
        if (filteredFavBenefs.length == 1) {
          return 137;
        } else if (filteredFavBenefs.length == 2) {
          return 205;
        } else {
          return 270;
        }
      case 2:
        if (filteredRecentTransactions.length == 1) {
          return 150;
        } else if (filteredRecentTransactions.length == 2) {
          return 219;
        } else {
          return 270;
        }
      default:
        return 270;
    }
  }

  Future<void> resetTransferForm() async {
    Box3.sendMoneyFormBV = null;

    sendMoneyFormBV = null;
    serviceProvider = null;
    form.clear();

    if (selectedBeneficiary != null) {
      getSendMoneyForm();
    }

    final serviceCode = selectedBeneficiary?.serviceType?.Code;

    if (serviceCode == ServiceType.CASH_PICKUP ||
        serviceCode == ServiceType.WALLET_TRANNSFER) {
      serviceType = serviceCode;
      await getServiceProviders(
        countryCode: selectedBeneficiary?.serviceCountry?.Code,
        currencyCode: selectedBeneficiary?.serviceCurrency?.Code,
        serviceCategoryCode: serviceCode,
      );
    } else {
      serviceType = null;
      getSourceAndPurposes(
        beneficiaryBankCode: selectedBeneficiary?.bank?.Code,
        serviceCategoryCode: selectedBeneficiary?.serviceType?.Code ?? '',
        serviceCountryCode: selectedBeneficiary?.country?.Code ?? '',
        serviceCurrencyCode: selectedBeneficiary?.serviceCurrency?.Code ?? '',
      );
    }

    update();
  }

  Future<List<MasterResponseFZ>> getServiceProviders(
      {String? countryCode,
      String? currencyCode,
      String? serviceCategoryCode}) async {
    late SignUpController signUpController;
    if (Get.isRegistered<SignUpController>()) {
      signUpController = Get.find<SignUpController>();
    } else {
      signUpController = Get.put(SignUpController());
    }
    signUpController.loadingSources.add('ServiceProviderCode');
    try {
      serviceProviders = await ApiService().getServiceProvider(
          countryCode: countryCode,
          currencyCode: currencyCode,
          serviceCategoryCode: serviceCategoryCode);
    } finally {
      signUpController.loadingSources.remove('ServiceProviderCode');
      update();
    }
    return serviceProviders;
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

  Future<void> getCityData(FormFieldItem f) async {
    final stateObj = form.selectedSources['StateCode'];
    final stateCode = (stateObj?.Code.isNotEmpty ?? false)
        ? stateObj!.Code
        : (stateObj?.stateCode ?? '');

    if (stateCode.isNotEmpty) {
      form.sources[f.ApiKey] = await ApiService().getCity(typeData: {
        "BaseCurrencyCode": Box3.companyDataFZ?.companySettings?.baseCurrency,
        "ServiceCategoryCode": selectedBeneficiary?.serviceType?.Code,
        "ServiceCountryCode": selectedBeneficiary?.country?.Code,
        "ServiceCurrencyCode": selectedBeneficiary?.serviceCurrency?.Code,
        "StateCode": stateCode
      });
    }
  }

  /// Send Money forms
  Future<void> getSendMoneyForm(
      {Map<String, dynamic>? data, String? criteriaMap}) async {
    formruleLoading = true;
    // update(); // Removed premature update to prevent flickering
    FormRulesData? f = Box3.sendMoneyFormBV;
    if (f == null) {
      await Box3.getSendMoneyForm(criteriaMap: criteriaMap);
      f = Box3.sendMoneyFormBV;
      loading = false;
    }
    if (f != null) {
      form.initialiseForm(f.formFieldItem, data: data);
      // await Future.wait(f.formFieldItem
      //     .where((f) => (f.FieldType == FieldType.dropDownSingle || f.FieldType == FieldType.dropDownMulti))
      //     .map((f1) => getSourcesNew(f1, data: data) as Future<void>)
      //     .toList());
      sendMoneyFormBV = f;
      catalogueRetrieved = true;
      await loadSourcesData(sendMoneyFormBV);
    }
    formruleLoading = false;
    update();
  }

  Future<void> loadSourcesData(FormRulesData? formBV,
      {Map<String, dynamic>? data}) async {
    await Future.wait(formBV!.formFieldItem
        .where((f0) =>
            f0.FieldType == FieldType.dropDownSingle ||
            f0.FieldType == FieldType.dropDownMulti ||
            f0.FieldType == FieldType.radio)
        .map((f1) => getSourcesNew(f1, preventUpdate: true))
        .toList());
    await _autoPrefillDropdowns();
    applyFieldLocks();
    update();
  }

  void applyFieldLocks() {
    if (sendMoneyFormBV == null) return;

    final items = [...sendMoneyFormBV!.formFieldItem];
    bool changed = false;

    for (int i = 0; i < items.length; i++) {
      var f = items[i];
      bool shouldDisable = false;

      // Logic for Bank, Branch, Agent, Agent Location
      if ([
        "BeneficiaryBankCode",
        "BankCode",
        "BeneficiaryBranchCode",
        "AgentLocation"
      ].contains(f.FzParamName)) {
        bool isMatchedFromBeneficiary = false;
        if (selectedBeneficiary != null) {
          if (["BeneficiaryBankCode", "BankCode"].contains(f.FzParamName) &&
              selectedBeneficiary?.bank?.Code != null &&
              form.selectedSources[f.FzParamName]?.Code ==
                  selectedBeneficiary?.bank?.Code) {
            isMatchedFromBeneficiary = true;
          } else if (["BeneficiaryBranchCode", "AgentLocation"]
                  .contains(f.FzParamName) &&
              selectedBeneficiary?.branch?.Code != null &&
              (form.selectedSources[f.FzParamName]?.Code ==
                      selectedBeneficiary?.branch?.Code ||
                  form.selectedSources[f.FzParamName]?.BranchCode ==
                      selectedBeneficiary?.branch?.Code)) {
            isMatchedFromBeneficiary = true;
          }
        }

        if ((form.sources[f.ApiKey]?.length == 1 || isMatchedFromBeneficiary) &&
            form.selectedSources[f.FzParamName] != null) {
          shouldDisable = true;
        }
      }

      // Logic for State/City
      if (f.FzParamName == 'StateCode' || f.FzParamName == 'CityCode') {
        bool isBankMatchedFromBeneficiary = false;
        if (selectedBeneficiary != null &&
            selectedBeneficiary?.bank?.Code != null) {
          final selectedBank = form.selectedSources["BeneficiaryBankCode"] ??
              form.selectedSources["BankCode"];
          if (selectedBank?.Code == selectedBeneficiary?.bank?.Code) {
            isBankMatchedFromBeneficiary = true;
          }
        }

        bool isBankAutoSelected = (form.sources['listbank']?.length == 1 ||
                isBankMatchedFromBeneficiary) &&
            (form.selectedSources["BeneficiaryBankCode"] != null ||
                form.selectedSources["BankCode"] != null);

        bool hasState = selectedBeneficiary?.state != null &&
            (selectedBeneficiary!.state!.Code.isNotEmpty ||
                selectedBeneficiary!.state!.stateCode.isNotEmpty) &&
            selectedBeneficiary!.state!.Desc.isNotEmpty;

        bool hasCity = selectedBeneficiary?.city != null &&
            (selectedBeneficiary!.city!.Code.isNotEmpty ||
                selectedBeneficiary!.city!.cityCode.isNotEmpty) &&
            selectedBeneficiary!.city!.Desc.isNotEmpty;

        bool alreadyHasValue = (f.FzParamName == 'StateCode' && hasState) ||
            (f.FzParamName == 'CityCode' && hasCity);

        if ((isBankAutoSelected || alreadyHasValue) &&
            form.selectedSources[f.FzParamName] != null) {
          shouldDisable = true;
        }
      }

      if (shouldDisable && f.enabled) {
        items[i] = f.copyWith(IsEnable: 'false', IsVisible: 'false');
        changed = true;
      }
    }

    if (changed) {
      sendMoneyFormBV = sendMoneyFormBV!.copyWith(formFieldItem: items);
    }
  }

  Future<void> _autoPrefillDropdowns() async {
    if (_isAutoPrefilling || sendMoneyFormBV == null) return;
    _isAutoPrefilling = true;
    try {
      bool anyPrefilled = false;

      final items = sendMoneyFormBV!.formFieldItem.toList();
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

            await dropdownOnTapHandlers(f, preventUpdate: true);
          }
        }
      }

      if (fieldsChanged) {
        sendMoneyFormBV = sendMoneyFormBV!.copyWith(formFieldItem: items);
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
    if (!f.enabled) {
      return;
    }

    // bool isStateCityVisible = sendMoneyFormBV!.formFieldItem
    //         .any((e) => e.FzParamName == 'StateCode') &&
    //     sendMoneyFormBV!.formFieldItem.any((e) => e.FzParamName == 'CityCode');
    if (f.ApiKey == "listbank") {
      form.sources.remove(f.ApiKey);
      if (f.FormName == "Send_Money_Form Rules" &&
          selectedBeneficiary?.serviceType?.Code != 'C' &&
          selectedBeneficiary?.serviceType?.Code != 'W') {
        form.sources[f.ApiKey] = await getBanks2(
          f,
          stateCode: selectedBeneficiary?.state?.Code,
          cityCode: selectedBeneficiary?.city?.Code,
        );

        if (form.sources[f.ApiKey] != null &&
            selectedBeneficiary?.bank?.Code != null) {
          final matchedBank = form.sources[f.ApiKey]!.firstWhereOrNull(
              (e) => e.Code == selectedBeneficiary?.bank?.Code);
          if (matchedBank != null) {
            form.selectedSources[f.FzParamName] = matchedBank;
          }
        }
        if (!preventUpdate) update();
        return;
      } else {
        return;
      }
    }

    if (f.ApiKey == "listbranch") {
      form.sources.remove(f.ApiKey);
      if (f.FormName == "Send_Money_Form Rules" &&
          selectedBeneficiary?.serviceType?.Code != 'C' &&
          selectedBeneficiary?.serviceType?.Code != 'W') {
        try {
          form.sources[f.ApiKey] = await (Get.isRegistered<SignUpController>()
                  ? Get.find<SignUpController>()
                  : Get.put(SignUpController()))
              .reFetchSources(f, currentForm: form);

          if (form.sources[f.ApiKey] != null &&
              selectedBeneficiary?.branch?.Code != null) {
            final matchedBranch = form.sources[f.ApiKey]!.firstWhereOrNull(
                (e) =>
                    e.Code == selectedBeneficiary?.branch?.Code ||
                    e.BranchCode == selectedBeneficiary?.branch?.Code);
            if (matchedBranch != null) {
              form.selectedSources[f.FzParamName] = matchedBranch;
            }
          }
        } catch (e) {
          logger.e('Error fetching branches: $e');
        }
        return;
      } else {
        return;
      }
    }

    if (f.ApiKey == "listserviceprovider") {
      form.sources[f.ApiKey] = await getServiceProviders(
        countryCode: selectedBeneficiary?.serviceCountry?.Code ?? '',
        currencyCode: selectedBeneficiary?.serviceCurrency?.Code ?? '',
        serviceCategoryCode: selectedBeneficiary?.serviceType?.Code ?? '',
      );
      return;
    }

    /// State and city data
    if (f.ApiKey == "beneficiaryState") {
      form.sources.remove(f.ApiKey);
      if (f.FormName == "Send_Money_Form Rules") {
        if (selectedBeneficiary?.state != null &&
            (selectedBeneficiary!.state!.Code.isNotEmpty ||
                selectedBeneficiary!.state!.stateCode.isNotEmpty) &&
            selectedBeneficiary!.state!.Desc.isNotEmpty) {
          form.selectedSources[f.FzParamName] = selectedBeneficiary!.state!;
          if (!preventUpdate) update();
          return;
        }

        form.sources[f.ApiKey] = await ApiService().getState(typeData: {
          "BaseCurrencyCode": Box3.companyDataFZ?.companySettings?.baseCurrency,
          "ServiceCategoryCode": selectedBeneficiary?.serviceType?.Code,
          "ServiceCountryCode": selectedBeneficiary?.country?.Code,
          "ServiceCurrencyCode": selectedBeneficiary?.serviceCurrency?.Code
        });

        if (!preventUpdate) update();
        return;
      } else {
        return;
      }
    }

    if (f.ApiKey == "beneficiaryCity") {
      form.sources.remove(f.ApiKey);
      if (f.FormName == "Send_Money_Form Rules" &&
          (form.selectedSources['StateCode'] != null ||
              selectedBeneficiary?.state != null)) {
        if (selectedBeneficiary?.city != null &&
            (selectedBeneficiary!.city!.Code.isNotEmpty ||
                selectedBeneficiary!.city!.cityCode.isNotEmpty) &&
            selectedBeneficiary!.city!.Desc.isNotEmpty) {
          form.selectedSources[f.FzParamName] = selectedBeneficiary!.city!;
          if (!preventUpdate) update();
          return;
        }

        final stateObj =
            form.selectedSources['StateCode'] ?? selectedBeneficiary?.state;
        final stateCode = (stateObj?.Code.isNotEmpty ?? false)
            ? stateObj!.Code
            : (stateObj?.stateCode ?? '');

        if (stateCode.isEmpty) {
          return;
        }

        form.sources[f.ApiKey] = await ApiService().getCity(typeData: {
          "BaseCurrencyCode": Box3.companyDataFZ?.companySettings?.baseCurrency,
          "ServiceCategoryCode": selectedBeneficiary?.serviceType?.Code,
          "ServiceCountryCode": selectedBeneficiary?.country?.Code,
          "ServiceCurrencyCode": selectedBeneficiary?.serviceCurrency?.Code,
          "StateCode": stateCode
        });

        if (!preventUpdate) update();
        return;
      } else {
        return;
      }
    }

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
  }

  Future<List<MasterResponseFZ>> getBanks2(FormFieldItem f,
      {String? stateCode, String? cityCode}) async {
    return await ApiService().getBanks2(typeData: {
      "ServiceCountryCode": selectedBeneficiary?.country?.Code,
      "ServiceCurrencyCode": selectedBeneficiary?.serviceCurrency?.Code,
      "ServiceCategoryCode": selectedBeneficiary?.serviceType?.Code,
      "FilterBy": {
        "IsAgentOrBank": f.FieldId == 'agent' ? 'AG' : 'BK',
        "BankCode": selectedBeneficiary?.bank?.Code,
        "BankName": selectedBeneficiary?.bank?.Desc,
        "BaseCountryCode": Box3.companyDataFZ?.companySettings?.country,
        "BaseCurrencyCode": Box3.companyDataFZ?.companySettings?.baseCurrency,
        "StateCode": stateCode ??
            form.selectedSources['StateCode']?.Code ??
            form.selectedSources['StateCode']?.stateCode ??
            '',
        "CityCode": cityCode ??
            form.selectedSources['CityCode']?.Code ??
            form.selectedSources['CityCode']?.cityCode ??
            '',
        "ApiCallFrom": 'T',
      },
    });
  }

  Future<void> dropdownOnTapHandlers(FormFieldItem f,
      {bool preventUpdate = false}) async {
    debugPrint("selected_sources:-${form.selectedSources}");
    debugPrint("sources:-${form.sources}");
    String id = f.FzParamName;
    switch (id) {
      case 'ServiceCategoryCode':
        if (form.selectedSources[id] != null) {
          form.selectedSources.removeWhere((key, value) => [
                'CountryCode',
                'ServiceCurrencyCode',
                'listserviceprovider',
                'BeneficiaryBankCode',
                'BeneficiaryBranchCode',
                'StateCode',
                'CityCode'
              ].contains(key));
          ['AccountNumber', 'BicValue', 'SwiftCode']
              .map((e) => form.textFieldControllers[e]?.clear());
          if (!preventUpdate) update();
          form.sources['COUNTRY'] = [];
          form.sources['COUNTRY'] =
              await ApiService().getServiceCountry(typeData: {
            "Type": "SERVICECOUNTRY",
            "ServiceCategoryCode":
                form.selectedSources['ServiceCategoryCode']?.Code,
            "LanguageCode": "EN"
          });
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
          // form.sources['SERVICECURRENCY'] =
          //     await ApiService().getServiceCurrency(typeData: {
          //   "Type": "SERVICECURRENCY",
          //   "ServiceCategoryCode":
          //       form.selectedSources['ServiceCategoryCode']?.Code,
          //   "ServiceCountryCode": form.selectedSources['CountryCode']?.Code,
          //   "LanguageCode": "EN"
          // });
          // form.sources['SERVICECURRENCY'] = bankRouting!.data!.currencyList!
          //     .where((e) =>
          //         e.categoryCode ==
          //         form.selectedSources['ServiceCategoryCode']?.Code)
          //     .toList();
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
            form.sources
                .removeWhere((key, value) => key == 'MoneyServiceProvider');
            form.sources['listserviceprovider'] = [];

            form.sources['listserviceprovider'] =
                await ApiService().getMoneyServiceProvider(typeData: {
              "Type": "SERVICECOUNTRY",
              "ServiceCategoryCode":
                  form.selectedSources['ServiceCategoryCode']?.Code,
              "ServiceCountryCode": form.selectedSources['CountryCode']?.Code,
              "ServiceCurrencyCode":
                  form.selectedSources['ServiceCurrencyCode']?.Code,
              "LanguageCode": "EN"
            });

            form.selectedSources.removeWhere((key, value) => [
                  'MoneyServiceProvider',
                  'BeneficiaryBankCode',
                  'BeneficiaryBranchCode'
                ].contains(key));
            ['AccountNumber', 'BicCode', 'SwiftCode']
                .map((e) => form.textFieldControllers[e]?.clear());
            if (!preventUpdate) update();
          } else if (form.selectedSources['ServiceCategoryCode']?.Code == 'B') {
            form.sources
                .removeWhere((key, value) => key == 'MoneyServiceProvider');
            form.sources['listserviceprovider'] = [];

            form.sources['listserviceprovider'] =
                await ApiService().getMoneyServiceProvider(typeData: {
              "Type": "SERVICECOUNTRY",
              "ServiceCategoryCode":
                  form.selectedSources['ServiceCategoryCode']?.Code,
              "ServiceCountryCode": form.selectedSources['CountryCode']?.Code,
              "ServiceCurrencyCode":
                  form.selectedSources['ServiceCurrencyCode']?.Code,
            });
            form.selectedSources.removeWhere((key, value) => [
                  'MoneyServiceProvider',
                  'BeneficiaryBankCode',
                  'BeneficiaryBranchCode'
                ].contains(key));
            ['AccountNumber', 'BicValue', 'SwiftCode']
                .map((e) => form.textFieldControllers[e]?.clear());

            form.sources['listbank'] = [];
            form.sources['listbank'] = await ApiService().getBanks2(typeData: {
              "ServiceCountryCode":
                  form.selectedSources['CountryCode']?.countryCode,
              "ServiceCurrencyCode":
                  form.selectedSources['ServiceCurrencyCode']?.currencyCode,
              "ServiceCategoryCode":
                  form.selectedSources['ServiceCategoryCode']?.categoryCode,
              "FilterBy": {
                "ApiCallFrom": 'T',
              },
            });
            if (!preventUpdate) update();
          }
          if (!preventUpdate) Get.find<SignUpController>().update();
        }
        break;
      case 'ServiceProviderCode':
        // clear rates
        fromAmountCtrl.clear();
        toAmountCtrl.clear();
        isFormUpdating = true;
        if (!preventUpdate) update();
        try {
          if (form.selectedSources['ServiceProviderCode'] != null) {
            BeneficiaryFz? sBenef = selectedBeneficiary;
            await getSourceAndPurposes(
              serviceProviderCode:
                  form.selectedSources['ServiceProviderCode']?.Code,
              serviceCategoryCode: sBenef?.serviceType?.Code ?? '',
              serviceCountryCode: sBenef?.country?.Code ?? '',
              serviceCurrencyCode: sBenef?.serviceCurrency?.Code ?? '',
            );
          }

          Map<String, dynamic> currentFormData = getCurrentFormData();
          Box3.sendMoneyFormBV = null;
          await getSendMoneyForm(
            data: currentFormData,
            criteriaMap:
                "Correspondent Country = ${selectedBeneficiary?.country?.Code};Correspondent Currency = ${selectedBeneficiary?.serviceCurrency?.Code};Correspondent Service Category = ${selectedBeneficiary?.serviceType?.Code};Correspondent = ${form.selectedSources['ServiceProviderCode']?.Code}",
          );
        } catch (e) {
          logger.e('Error refetching send money form rules: $e');
        } finally {
          isFormUpdating = false;
          form.sources['listbank'] = [];
          if (!preventUpdate) {
            update();
            Get.find<SignUpController>().update();
          }
        }
        break;
      case 'StateCode':
        form.sources.remove('CityCode');
        form.selectedSources.remove('CityCode');
        if (f.FormName == "Send_Money_Form Rules") {
          final stateObj = form.selectedSources['StateCode'];
          final stateCode = (stateObj?.Code.isNotEmpty ?? false)
              ? stateObj!.Code
              : (stateObj?.stateCode ?? '');
          if (stateCode.isNotEmpty) {
            form.sources['CityCode'] = await ApiService().getCity(typeData: {
              "BaseCurrencyCode":
                  Box3.companyDataFZ?.companySettings?.baseCurrency,
              "ServiceCategoryCode": selectedBeneficiary?.serviceType?.Code,
              "ServiceCountryCode": selectedBeneficiary?.country?.Code,
              "ServiceCurrencyCode": selectedBeneficiary?.serviceCurrency?.Code,
              "StateCode": stateCode
            });
          }
        }
        break;
      case 'BeneficiaryBankCode' || 'BankCode':
        // form.sources.remove('listbranch');
        // form.selectedSources.remove('BeneficiaryBranchCode');
        // if (form.selectedSources[id] != null) {
        //   if (form.searchControllers['BeneficiaryBranchCode'] != null) {
        //     // Get.find<AddBeneficiaryController>()
        //     //     .getAllBranches(f: f, currentForm: form);
        //     Get.find<SignUpController>()
        //         .loadingSources
        //         .add('BeneficiaryBranchCode');
        //     MasterResponseFZ? benefBankCode =
        //         form.selectedSources['BeneficiaryBankCode'] ??
        //             form.selectedSources['BankCode'] ??
        //             selectedBeneficiary?.bank;

        //     try {
        //       final resp = await ApiService().getBankBranches2(typeData: {
        //         "PageNumber": "",
        //         "PageSize": "",
        //         "BankCode": benefBankCode?.Code,
        //         "ServiceCountryCode": selectedBeneficiary?.country?.Code,
        //         "ServiceCurrencyCode":
        //             selectedBeneficiary?.serviceCurrency?.Code,
        //         "ServiceCategoryCode": selectedBeneficiary?.serviceType?.Code,
        //         "FilterBy": {
        //           "BankCode": benefBankCode?.Code,
        //           "BankName": benefBankCode?.Desc,
        //           "BranchCode": selectedBeneficiary?.branch?.Code ?? "",
        //           "BranchName": selectedBeneficiary?.branch?.Desc ?? "",
        //           "BaseCountryCode":
        //               Box3.companyDataFZ?.companySettings?.country,
        //           "BaseCurrencyCode":
        //               Box3.companyDataFZ?.companySettings?.baseCurrency,
        //           "StateCode":
        //               form.selectedSources['StateCode']?.stateCode ?? '',
        //           "CityCode":
        //               form.selectedSources['CityCode']?.cityCode ?? '',
        //         }
        //       });
        //       form.sources['listbranch'] = resp['branchList'];
        //     } finally {
        //       Get.find<SignUpController>()
        //           .loadingSources
        //           .remove('BeneficiaryBranchCode');
        //     }
        //   }
        // } else {
        //   Get.find<SignUpController>()
        //       .loadingSources
        //       .add('BeneficiaryBranchCode');
        //   MasterResponseFZ? benefBankCode =
        //       form.selectedSources['BeneficiaryBankCode'] ??
        //           selectedBeneficiary?.bank;
        //   try {
        //     final resp = await ApiService().getBankBranches2(typeData: {
        //       "PageNumber": "",
        //       "PageSize": "",
        //       "BankCode": benefBankCode?.Code,
        //       "ServiceCountryCode": selectedBeneficiary?.country?.Code,
        //       "ServiceCurrencyCode": selectedBeneficiary?.serviceCurrency?.Code,
        //       "ServiceCategoryCode": selectedBeneficiary?.serviceType?.Code,
        //       "FilterBy": {
        //         "BankCode": benefBankCode?.Code,
        //         "BankName": benefBankCode?.Desc,
        //         "BranchCode": selectedBeneficiary?.branch?.Code ?? "",
        //         "BranchName": selectedBeneficiary?.branch?.Desc ?? "",
        //         "BaseCountryCode": Box3.companyDataFZ?.companySettings?.country,
        //         "BaseCurrencyCode":
        //             Box3.companyDataFZ?.companySettings?.baseCurrency,
        //         "StateCode":
        //             form.selectedSources['StateCode']?.stateCode ?? '',
        //         "CityCode": form.selectedSources['CityCode']?.cityCode ?? '',
        //       }
        //     });
        //     form.sources['listbranch'] = resp['branchList'];
        //   } finally {
        //     Get.find<SignUpController>()
        //         .loadingSources
        //         .remove('BeneficiaryBranchCode');
        //   }
        // }
        // update();
        // Get.find<SignUpController>().update();
        break;
    }

    if (!_isAutoPrefilling) {
      await _autoPrefillDropdowns();
    }
  }

  // Future<void> getAllBranches() async {
  //   late SignUpController signUpController;
  //   if (Get.isRegistered<SignUpController>()) {
  //     signUpController = Get.find<SignUpController>();
  //   } else {
  //     signUpController = Get.put(SignUpController());
  //   }

  //   // if (signUpController.loadingSources.contains('BeneficiaryBranchCode')) {
  //   //   return;
  //   // }

  //   bool allBranchesLoaded = false;
  //   int pageNumber = 1;
  //   int pageSize = 500;

  //   try {
  //     Get.find<SignUpController>().loadingSources.add('BeneficiaryBranchCode');
  //     while (!allBranchesLoaded) {
  //       if (selectedBeneficiary == null) break;

  //       MasterResponseFZ? benefBankCode =
  //           form.selectedSources['BeneficiaryBankCode'] ??
  //               selectedBeneficiary?.bank;

  //       final res = await ApiService().getBankBranches2(typeData: {
  //         "PageNumber": pageNumber,
  //         "PageSize": pageSize,
  //         "BankCode": benefBankCode?.Code,
  //         "ServiceCountryCode": selectedBeneficiary?.country?.Code,
  //         "ServiceCurrencyCode": selectedBeneficiary?.serviceCurrency?.Code,
  //         "ServiceCategoryCode": selectedBeneficiary?.serviceType?.Code,
  //         "FilterBy": {
  //           "BankCode": benefBankCode?.Code,
  //           "BankName": benefBankCode?.Desc,
  //           "BranchCode": selectedBeneficiary?.branch?.Code ?? "",
  //           "BranchName": selectedBeneficiary?.branch?.Desc ?? "",
  //         }
  //       });

  //       final branches = res['branchList'] as List<MasterResponseFZ>;
  //       PaginationDetailsFz? pageDetails = res['paginationDetails'];

  //       if (pageNumber == 1) {
  //         form.sources['listbranch'] = branches;
  //       } else if (branches.isNotEmpty) {
  //         form.sources['listbranch']?.addAll(branches);
  //       }

  //       signUpController.update(['dropdown-list']);

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

  void getRecentTransaction() {
    recentTransactions.clear();

    for (int i = 0; i < transactions.length; i++) {
      if (checkVisibility(i) == true) {
        recentTransactions.add(transactions[i]);
      }
    }

    recentTransactions = recentTransactions
        .where((transaction) => transferType == TransferType.bank
            ? (transaction.serviceType != 'C' && transaction.serviceType != 'W')
            : transferType == TransferType.cash
                ? (transaction.serviceType != 'B' &&
                    transaction.serviceType != 'W')
                : transferType == TransferType.wallet
                    ? (transaction.serviceType != 'C' &&
                        transaction.serviceType != 'B')
                    : true)
        .toList();
    filteredRecentTransactions = recentTransactions;

    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) => update());
  }

  @override
  void onReady() {
    recentTransactions.clear();
    super.onReady();
  }

  bool checkVisibility(int i) {
    String temp = (Box3.settings.currenciesForBeneficiaries).trim();
    List<String> currencies =
        temp.isNotEmpty ? temp.toLowerCase().split(',') : [];
    TransactionDetailsFz t = transactions[i];
    return (currencies.isNotEmpty == true
        ? currencies.contains(t.fromCurrencyCode?.toLowerCase())
        : true);
  }

  void reset({required TransferType t}) {
    transferType = t;
    promoIndex = null;
    // Get.find<TabBarController>().tabController = null;
    isBenef = false;
    listLoading =
        !Get.find<DataController>().transactionAndBeneficiaryRetrieved;
    viewMoreDeails = false;
    gateWay = null;
    sources.clear();
    purposes.clear();
    selectedSource = null;
    selectedPurpose = null;
    rateCharge = null;
    isDark = Get.find<AccountController>().isDark;
    buttonLoading = false;
    banksList = [];
    accountNumbers = [];
    gatewayDetails = null;
    searchOnStoppedTyping = null;
    loading = !Get.find<DataController>().transactionAndBeneficiaryRetrieved;
    purposeError = false;
    sourceError = false;
    serviceProviderError = false;
    fromAmountCtrl = TextEditingController(text: '');
    toAmountCtrl = TextEditingController();
    searchBenefController = TextEditingController();
    selectBeneficiaryController = TextEditingController();
    favBeneficiaryController = TextEditingController();
    transactionController = TextEditingController();
    fromAmtCur = APIConstants.currency;
    gatewayError = '';
    // String? toAmtCur = 'INR'; //TODO: Based on user nationality
    serviceProvider = null;
    fromAmtErr = '';
    toAmtErr = '';
    selectedBeneficiary = null; // fromBeneficiary;
    benefs = Get.find<DataController>().beneficiaries;
    filteredBenefs = benefs
        .where((b) =>
            //  b.serviceType?.Code == 'C'
            //     ? (b.active == 'A')
            // ? (b.active == 'A' && b.isCorrespondentActive == 'Y')
            // :
            b.active == 'A' &&
            // b.active == 'A' && b.isCorrespondentActive == 'Y' &&
            (transferType == TransferType.cash
                ? b.serviceType?.Code == 'C'
                : transferType == TransferType.wallet
                    ? b.serviceType?.Code == 'W'
                    : transferType == TransferType.bank
                        ? b.serviceType?.Code == 'B'
                        : true))
        .toList();
    favBenefs = benefs
        .where((b) => b.fav == 'Y' && b.active == 'A')
        // b.fav == 'Y' && b.active == 'A' && b.isCorrespondentActive == 'Y')
        .toList();
    filteredFavBenefs = favBenefs
        .where((b) => (
            // b.fav == 'Y' && b.serviceType?.Code == 'C'
            //   ? (b.active == 'A')
            // ? (b.active == 'A' && b.isCorrespondentActive == 'Y')
            // :
            b.active == 'A' &&
                (transferType == TransferType.cash
                    ? b.serviceType?.Code == 'C'
                    : transferType == TransferType.wallet
                        ? b.serviceType?.Code == 'W'
                        : transferType == TransferType.bank
                            ? b.serviceType?.Code == 'B'
                            : true)))
        .toList();
    serviceProviders = Get.find<DataController>().serviceProviders;
    selectedTransaction = null;
    payments.clear();
    transactions = Get.find<DataController>().transactions;
    bill = null;
    debitBanks = [];
    selectedDebitBank = null;
    update();
    getRecentTransaction();
  }

  void selectPaymentMode() {
    if (payments.isNotEmpty) {
      if (!(banksList.length == 1 &&
          banksList.firstOrNull?.payAccountNumbers.length == 1)) {
        BankAttributes.clear();
      }

      bill = null;
      gateWay = payments[2];
      gatewayError = '';
      update();

      if (gateWay?.type == 'A') {
        final position = listScrollController.position.maxScrollExtent + 250;
        listScrollController.animateTo(
          position,
          duration: const Duration(milliseconds: 10),
          curve: Curves.linear,
        );
        update();
      } else if (gateWay?.type == 'D' &&
          gateWay?.description != 'Instant Bank Transfer') {
        // else if (gateWay?.type == 'D' && gateWay?.description != 'DAPI') {
        final position = listScrollController.position.maxScrollExtent + 70;
        listScrollController.jumpTo(position);
        update();
      } else {
        final position = listScrollController.position.maxScrollExtent + 70;
        listScrollController.jumpTo(position);
        update();
      }
    }
  }

  void reArrangeBeneficiaryList({bool sortFav = false}) {
    if (selectedBeneficiary == null) return;

    final selectedId = selectedBeneficiary!.id;

    // if (sortFav) {
    // ------ rearranging fav beneficiary list ------
    final favBenfIndex = filteredFavBenefs.indexWhere(
      (b) => b.id == selectedId,
    );

    if (favBenfIndex > 0) {
      final item = filteredFavBenefs.removeAt(favBenfIndex);
      filteredFavBenefs.insert(0, item);
    } else if (favBenfIndex == -1) {
      filteredFavBenefs.insert(0, selectedBeneficiary!);
    }
    // } else {
    // ------ rearranging beneficiary list ------
    final benefIndex = filteredBenefs.indexWhere(
      (b) => b.id == selectedId,
    );

    if (benefIndex > 0) {
      final item = filteredBenefs.removeAt(benefIndex);
      filteredBenefs.insert(0, item);
    } else if (benefIndex == -1) {
      filteredBenefs.insert(0, selectedBeneficiary!);
    }
  }

  Future<void> setBenef(BeneficiaryFz b) async {
    form.clear();
    selectedBeneficiary = selectedBeneficiary == b ? null : b;
    sourcePurposeVisibility = false;
    selectedTransaction = null;
    reArrangeBeneficiaryList();
    sendMoneyFormBV = null;
    form.sources.remove('listserviceprovider');
    update();

    if (selectedBeneficiary == null) {
      fromAmountCtrl.clear();
      toAmountCtrl.clear();
      return;
    }

    toAmtCur = b.serviceCurrency!.Code;
    await resetTransferForm();

    /* => clearing the amount fields intead of calling updateToCurrency()
     because in some cases rate & charges api will work only related to send money formrules */
    fromAmountCtrl.clear();
    toAmountCtrl.clear();
    // if (fromAmountCtrl.text.isNotEmpty) {
    //   await updateToCurrency(s: fromAmountCtrl.text, type: 'L');
    // }
  }

  Future<void> setBenefFromTxn(TransactionDetailsFz transaction) async {
    form.clear();
    selectedTransaction = transaction;

    /* => CoreBeneficiaryUID will be available only after the first txn of the beneficiary.
          otherwise it remains empty. */
    selectedBeneficiary = Get.find<DataController>()
        .beneficiaries
        .firstWhereOrNull((e) =>
            e.coreBeneficiaryUid?.isNotEmpty == true &&
            e.coreBeneficiaryUid == transaction.bneficiaryId);
    toAmtCur = selectedBeneficiary?.serviceCurrency?.Code ??
        transaction.toCurrencyCode;
    /* => not assigning the amount to amount fields, (Will not call UpdateCurrency also)
     because in some cases rate & charges api will work only related to send money formrules */
    // fromAmountCtrl.text = transaction.receivedAmount.toString(); // <----------
    fromAmtErr = '';
    toAmtErr = '';

    sourcePurposeVisibility = false;
    Box3.sendMoneyFormBV = null;
    sendMoneyFormBV = null;
    serviceProvider = null;
    form.selectedSources.remove('ServiceProviderCode');
    if (selectedBeneficiary != null) {
      getSendMoneyForm();
    }
    if (selectedBeneficiary?.serviceType?.Code == ServiceType.CASH_PICKUP ||
        selectedBeneficiary?.serviceType?.Code ==
            ServiceType.WALLET_TRANNSFER) {
      serviceType = selectedBeneficiary?.serviceType?.Code;

      await getServiceProviders(
        countryCode: selectedBeneficiary?.country?.Code,
        currencyCode: selectedBeneficiary?.serviceCurrency?.Code,
        serviceCategoryCode: selectedBeneficiary?.serviceType?.Code,
      );
      getSourceAndPurposes(
        serviceProviderCode: selectedBeneficiary?.serviceType?.Code,
        beneficiaryBankCode: selectedBeneficiary?.bank?.Code,
        serviceCategoryCode: selectedBeneficiary?.serviceType?.Code ?? '',
        serviceCountryCode: selectedBeneficiary?.country?.Code ?? '',
        serviceCurrencyCode: selectedBeneficiary?.serviceCurrency?.Code ?? '',
      );
      update();
    } else {
      this
        ..serviceType = null
        ..update();

      getSourceAndPurposes(
        beneficiaryBankCode: selectedBeneficiary?.bank?.Code,
        serviceCategoryCode: selectedBeneficiary?.serviceType?.Code ?? '',
        serviceCountryCode: selectedBeneficiary?.country?.Code ?? '',
        serviceCurrencyCode: selectedBeneficiary?.serviceCurrency?.Code ?? '',
      );
    }

    /* => NOT calling updateToCurrency() here, because rate & charges api will work only related to send money formrules */
    // updateToCurrency(s: transaction.receivedAmount.toString(), type: 'L'); // <----------
    update();
  }

  // Future<void> getData({bool forceUpdateTxnsAndBenefs = false}) async {
  //   if (loading || forceUpdateTxnsAndBenefs) {
  //     await Get.find<DataController>().getData(TransferController,
  //         forceUpdateTxnsAndBenefs: forceUpdateTxnsAndBenefs);
  //     update();
  //   }
  // }

  List<Map<String,dynamic>> profileTotalData=[];

  Future<void> getProfileData()async{
    await getData(forceUpdateTxnsAndBenefs: true);
    profileTotalData.clear();
    profileTotalData.add({"Total Transfer":transactions.length});
    profileTotalData.add({"Beneficiaries":benefs.length});
    profileTotalData.add({"Transfer Pending":transactions.where((e) => e.paymentStatus?.toLowerCase() == 'pending').length});
    print(profileTotalData);
    update();

  }

  Future<void> getData({bool forceUpdateTxnsAndBenefs = false}) async {
    if (loading || forceUpdateTxnsAndBenefs) {
      await Get.find<DataController>().getData(TransferController,
          forceUpdateTxnsAndBenefs: forceUpdateTxnsAndBenefs);

      // Refresh local lists after DataController gets data
      benefs = Get.find<DataController>().beneficiaries;
      filteredBenefs = benefs.where((b) =>
      b.active == 'A' &&
          (transferType == TransferType.cash
              ? b.serviceType?.Code == 'C'
              : transferType == TransferType.wallet
              ? b.serviceType?.Code == 'W'
              : transferType == TransferType.bank
              ? b.serviceType?.Code == 'B'
              : true)
      ).toList();

      update();
    }
  }

  Future<void> getSourceAndPurposes(
      {String? serviceProviderCode,
      String? beneficiaryBankCode,
      required String serviceCategoryCode,
      required String serviceCountryCode,
      required String serviceCurrencyCode}) async {
    sourcePurposeVisibility = true;
    loadingSourceNpurpose.value = true;

    await getSources(
      serviceProviderCode: serviceProviderCode,
      beneficiaryBankCode: beneficiaryBankCode,
      serviceCategoryCode: serviceCategoryCode,
      serviceCountryCode: serviceCountryCode,
      serviceCurrencyCode: serviceCurrencyCode,
    );
    await getPurposes(
      serviceProviderCode: serviceProviderCode,
      beneficiaryBankCode: beneficiaryBankCode,
      serviceCategoryCode: serviceCategoryCode,
      serviceCountryCode: serviceCountryCode,
      serviceCurrencyCode: serviceCurrencyCode,
    );

    loadingSourceNpurpose.value = false;
    update();
  }

  Future getSources(
      {String? serviceProviderCode,
      String? beneficiaryBankCode,
      required String serviceCategoryCode,
      required String serviceCountryCode,
      required String serviceCurrencyCode}) async {
    sources.clear();
    sourceError = false;
    selectedSource = null;

    sources = await ApiService().sources(
      beneficiaryBankCode: beneficiaryBankCode,
      serviceProviderCode: serviceProviderCode,
      serviceCategoryCode: serviceCategoryCode,
      serviceCountryCode: serviceCountryCode,
      serviceCurrencyCode: serviceCurrencyCode,
    );
  }

  Future getPurposes(
      {String? serviceProviderCode,
      String? beneficiaryBankCode,
      required String serviceCategoryCode,
      required String serviceCountryCode,
      required String serviceCurrencyCode}) async {
    purposes.clear();
    purposeError = false;
    selectedPurpose = null;

    purposes = await ApiService().purposes(
      beneficiaryBankCode: beneficiaryBankCode,
      serviceProviderCode: serviceProviderCode,
      serviceCategoryCode: serviceCategoryCode,
      serviceCountryCode: serviceCountryCode,
      serviceCurrencyCode: serviceCurrencyCode,
    );
  }

  Future<void> getOffersList() async {
    if (offersList.isNotEmpty) return;

    loading = true;
    update(['Offers-list']);
    offersList = await ApiService().getOffersList();
    loading = false;
    update(['Offers-list']);
  }

  Future showCancelTxnAlert() async {
    alertDialog(
      title: 'Alert',
      isOKButton: false,
      body: Column(
        children: [
          SelectableText(
            cms(Fields.PaymentConfirmation_CancelAlertMsg).textHeading!,
            style: TextStyle(
                color: Get.find<AccountController>().isDark
                    ? AppConfigs.w
                    : AppConfigs.g4),
          ),
          const SizedBox(height: 10),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: roundButton('Yes', noMar: true, onTap: () async {
                  Get.back();
                  Get.find<MainController>().pop();
                }),
              ),
              Expanded(
                child: roundButton('No', borderOnly: true, noMar: true,
                    onTap: () async {
                  Get.back();
                }),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> authorize({bool saveRemittance = false}) async {
    switch ((AppConfigs.fetchNewConfig
        ? Box3.settings.authRemittance
        : Box3.settings.authRemittance)) {
      case AuthMode.mPin:
        Get.find<AuthController>().dialogAuthAttributes =
            DialogMpinAuthAttributes();
        validateMPIN(
            onCompleted: () async {
              await sendMoney(saveRemittance: saveRemittance);
            },
            enableBiometric: false);
        break;
      case AuthMode.mPinWithBiometric:
        validateMPIN(
            onCompleted: () async {
              await sendMoney(saveRemittance: saveRemittance);
            },
            enableBiometric: true);
        break;
      case AuthMode.otpPhone:
        buttonLoading = true;
        update();
        RegisterDeviceFZ? reg =
            await ApiService().createOTP(OtpType.CREATE_TRANSACTION_OTP);

        if (reg != null) {
          buttonLoading = false;
          update();
          TimerContoller t = Get.put(TimerContoller());
          t.startTimer1();
          t
            ..isResend = false
            ..update();
          // t.startTimer();
          validateOTP(
              controller: t.dialogOtpAuthAttributes.mobOTP,
              errorText: '',
              validationValue: OtpType.CREATE_TRANSACTION_OTP,
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
                if (t.dialogOtpAuthAttributes.mobOTP.text.isEmpty) {
                  t
                    ..errorText = 'otp_required'.tr
                    ..update();
                } else if (t.dialogOtpAuthAttributes.mobOTP.text.length < 6) {
                  t
                    ..errorText = '${'Enter'.tr}${6} digit OTP'
                    ..update();
                } else {
                  t
                    ..buttonLoading = true
                    ..update();
                  Map<String, dynamic> validateOtpRes = await ApiService()
                      .validateOtpRequest(
                          otpID: reg!.data!.notificationArray!.first.otpId!,
                          otp: t.dialogOtpAuthAttributes.mobOTP.text);
                  CustomMessageDetailsFZ? customMessageDetails =
                      validateOtpRes['message'];
                  String messageCode = validateOtpRes['MessageCode'];
                  bool isVerified = validateOtpRes['IsValid'];
                  if (isVerified) {
                    // String msg = 'OTP Verified';
                    // if (msg == "OTP Verified") {
                    Get.back();
                    t
                      ..errorText = ''
                      ..buttonLoading = false
                      ..dialogOtpAuthAttributes.mobOTP.clear()
                      ..update();
                    await sendMoney(saveRemittance: saveRemittance);
                  } else {
                    t
                      ..errorText = customMessageDetails?.MessageDescription ??
                          'Invalid OTP'
                      ..buttonLoading = false
                      ..dialogOtpAuthAttributes.mobOTP.clear()
                      ..update();
                    if (messageCode == '603') {
                      Get.find<AccountController>().onUserBlocked(
                          title: customMessageDetails?.MessageHeader,
                          content: customMessageDetails?.MessageDescription);
                    }
                  }
                }
              });
        }
        buttonLoading = false;
        update();
        break;
      default:
        await sendMoney(saveRemittance: saveRemittance);
        break;
    }

    if (!_isAutoPrefilling) {
      await _autoPrefillDropdowns();
    }
  }

  Future<void> getDataForPaymentMode() async {
    this
      ..bill = null
      ..gateWay = null
      ..gatewayError = '';
    BankAttributes.clear();

    if (payments.isNotEmpty) return;

    loadingPage = true;
    try {
      final results = await Future.wait([
        ApiService().getPaymentModes(),
        ApiService().getPaymentModeBanks(),
        ApiService().getPaymentGateways(),
      ]);

      this
        ..payments.clear()
        ..banksList.clear()
        ..paymentGateways.clear();

      List<PaymentMode> modes = results[0] as List<PaymentMode>;
      banksList = results[1] as List<DrawingBankFz>;
      List<PaymentMode> gateways = results[2] as List<PaymentMode>;
      paymentGateways = gateways;

      // Remove the generic gateway option (Type 'G') and add individual gateways
      payments = modes.where((e) => e.type != 'G').toList();
      payments.addAll(gateways);

      gateWay = payments.length == 1 ? payments.first : null;

      BankAttributes.drawingBank =
          banksList.length == 1 ? banksList.first : null;

      if (banksList.length == 1) {
        accountNumbers = banksList.first.payAccountNumbers
            .where((element) => element.accountNumber.isNotEmpty)
            .toList();
        if (banksList.firstOrNull?.payAccountNumbers.length == 1 &&
            banksList.first.payAccountNumbers.first.accountNumber.isNotEmpty) {
          BankAttributes.payAccountNumber =
              banksList.first.payAccountNumbers.first;
        }
      }
    } finally {
      loadingPage = false;
      update();
    }
  }

  Future<void> fetchPaymentGateways() async {
    // This method is now handled within getDataForPaymentMode for concurrent fetching.
    // Keeping it here for compatibility if called elsewhere, but it will return early if already populated.
    if (payments.any((e) => e.type == 'P')) return;

    loadingPaymentGateway.value = true;
    try {
      final gateways = await ApiService().getPaymentGateways();
      paymentGateways = gateways;
      // Ideally we shouldn't need to add them here if getDataForPaymentMode is the entry point,
      // but for robustness:
      for (var g in gateways) {
        if (!payments.any((p) => p.paymentModeKey == g.paymentModeKey)) {
          payments.add(g);
        }
      }
    } finally {
      loadingPaymentGateway.value = false;
      update();
    }
  }

  Future<bool> saveRemittence({bool avoidNavigation = false}) async {
    sendMoneyResp = null;
    BankAttributes.referenceNumber = "";
    buttonLoading = true;
    update(['RPD-ProceedButton']);

    ProfileData? customer = Box3.customerDetailsFZ?.data;
    var dd = {};
    if (sendMoneyFormBV != null) {
      dd = form.buildJsonNew(sendMoneyFormBV!.formFieldItem);
    }

    SendMoneyModel sendMoneyData = SendMoneyModel(
      languageCode: Box3.lang?.Code ?? 'EN',
      primaryColor: AppConfigs.primaryColor
          .toARGB32()
          .toRadixString(16)
          .padLeft(8, '0')
          .toUpperCase(),
      secondaryColor: AppConfigs.accentColor
          .toARGB32()
          .toRadixString(16)
          .padLeft(8, '0')
          .toUpperCase(),
      theme: isDark ? "dark" : "light",
      customerDetails: CustomerDetails(
        customerCode: customer?.customerCode ?? '',
        firstName: customer?.firstName ?? '',
        middleName: customer?.middleName ?? '',
        lastName: customer?.lastName ?? '',
        gender: customer?.personalInfo?.gender ?? '',
        dateOfBirth: customer?.dateOfBirth ?? '',
        nationalityCode: customer?.nationalityCode ?? '',
        address1: customer?.address1 ?? '',
        address2: customer?.address2 ?? '',
        phone: "",
        mobile: customer?.mobileNo ?? '',
        email: customer?.email ?? '',
        fax: customer?.personalInfo?.contact?.fax ?? '',
        city: customer?.city ?? '',
        district: customer?.personalInfo?.address?.district ?? '',
        state: customer?.state ?? '',
        stateCode: customer?.personalInfo?.address?.stateCode ?? '',
        countryCode: customer?.countryCode ?? '',
        zipcode: customer?.postalCode ?? '',
        areaCode: customer?.personalInfo?.address?.areaCode ?? '',
        nameArabic: customer?.personalInfo?.nameArabic ?? '',
        professionCode: customer?.professionCode ?? '',
        professionDesc: customer?.profession ?? '',
        employerName: customer?.employerName ?? '',
        idTypeCode: customer?.idTypeCode ?? '',
        idType: customer?.idType ?? '',
        idNo: customer?.idNo ?? '',
        idIssueDate: customer?.idIssueDate ?? '',
        idExpiryDate: customer?.idExpiryDate ?? '',
      ),
      beneficiaryDetails: BeneficiaryDetails(
        beneficiaryUID: selectedBeneficiary?.id.toString() ?? '',
        coreBeneficiaryUID: selectedBeneficiary?.coreBeneficiaryUid ?? '',
        firstName: selectedBeneficiary?.firstName ?? '',
        middleName: selectedBeneficiary?.middleName ?? '',
        lastName: selectedBeneficiary?.lastName ?? '',
        gender: selectedBeneficiary?.gender?.Code ?? '',
        dateOfBirth: selectedBeneficiary?.dateOfBirth ?? '',
        nationalityCode: selectedBeneficiary?.nationality?.Code ?? '',
        address1: selectedBeneficiary?.address1 ?? '',
        address2: selectedBeneficiary?.address2 ?? '',
        email: selectedBeneficiary?.email ?? '',
        mobile: selectedBeneficiary?.mobile ?? '',
        phone: selectedBeneficiary?.phone ?? '',
        cityCode: form.selectedSources['CityCode']?.Code ??
            selectedBeneficiary?.city?.Code ??
            "",
        city: form.selectedSources['CityCode']?.Desc ??
            selectedBeneficiary?.city?.Desc ??
            "",
        district: "",
        stateCode: form.selectedSources['StateCode']?.Code ??
            selectedBeneficiary?.state?.Code ??
            "",
        state: form.selectedSources['StateCode']?.Desc ??
            selectedBeneficiary?.state?.Desc ??
            "",
        countryCode: selectedBeneficiary?.country?.Code ?? '',
        country: selectedBeneficiary?.country?.Desc ?? '',
        zipcode: "",
        areaCode: "",
        idTypeCode: selectedBeneficiary?.idType?.Code ?? '',
        idType: selectedBeneficiary?.idType?.Desc ?? '',
        idNo: form.textFieldControllers['IdNo']?.text ??
            selectedBeneficiary?.idNo ??
            '',
        relationShipCode: selectedBeneficiary?.relationship?.Code ?? '',
        relationShip: selectedBeneficiary?.relationship?.Desc ?? '',
        serviceCategoryCode: selectedBeneficiary?.serviceType?.Code ?? '',
        bicDetails: [
          BicDetails(
            bicTypeCode: selectedBeneficiary?.bicType?.Code ?? '',
            bicTypeDescription: selectedBeneficiary?.bicType?.Desc ?? '',
            bicTypeValue: selectedBeneficiary?.bicValue ?? '',
          ),
        ],
      ),
      paymentDetails: PaymentDetails(
        sessionId: rC?.sessionId ?? '',
        routingBankCode: rC?.routingBankCode ?? '',
        serviceCode: rC?.serviceCode ?? '',
        serviceCountryCode: selectedBeneficiary?.serviceCountry?.Code ?? '',
        serviceCountry: selectedBeneficiary?.serviceCountry?.Desc ?? '',
        serviceProviderCode:
            form.selectedSources['ServiceProviderCode']?.Code ?? '',
        serviceCurrencyCode: rC?.currencyCode ?? '',
        branchCode: selectedBeneficiary?.branch?.Code ?? '',
        accountNumber: selectedBeneficiary?.accountNumber ?? '',
        beneficiaryBranchCode:
            form.selectedSources['BeneficiaryBranchCode']?.Code ??
                form.selectedSources['AgentLocation']?.Code ??
                selectedBeneficiary?.branch?.Code ??
                '',
        beneficiaryBranchName:
            form.selectedSources['BeneficiaryBranchCode']?.Desc ??
                form.selectedSources['AgentLocation']?.Desc ??
                selectedBeneficiary?.branch?.Desc ??
                '',
        beneficiaryBankName:
            form.selectedSources['BeneficiaryBankCode']?.Desc ??
                form.selectedSources['BankCode']?.Desc ??
                selectedBeneficiary?.bank?.Desc ??
                '',
        beneficiaryBankCode:
            form.selectedSources['BeneficiaryBankCode']?.Code ??
                form.selectedSources['BankCode']?.Code ??
                selectedBeneficiary?.bank?.Code ??
                '',
        purposeCode: selectedPurpose?.Code ?? '',
        sourceCode: selectedSource?.Code ?? '',
        charge: rC?.chargeDetails?.bankChargesLcy.toString() ?? '0.00',
        bankChargesFcy: rC?.chargeDetails?.bankChargesFcy.toString() ?? '0.00',
        commission: rC?.chargeDetails?.commission?.toDouble() ?? 0.0,
        fcyAmount: rC?.chargeDetails?.fcyAmount ?? 0.0,
        lcyAmount: rC?.chargeDetails?.lcyAmount ?? 0.0,
        netAmount: rC?.chargeDetails?.netAmount?.toDouble() ?? 0.0,
        rate: rC?.chargeDetails?.rate ?? 0.0,
        branchCost: rC?.chargeDetails?.branchCost ?? 0.0,
        currencyDecimal: rC?.chargeDetails?.currencyDecimal ?? 0,
        tax: rC?.chargeDetails?.tax?.toString() ?? '',
        vat: rC?.chargeDetails?.tax?.toString() ?? '',
        fzPaymentGatewayKey: "",
        payType: '',
        payAccountNumber: "",
        payBankCode: BankAttributes.drawingBank?.bankCode ?? '',
      ),
      offers: Offers(
        promoCode: selectedOffer?.promoCode ?? '',
      ),
    );

    Map<String, dynamic> finalData = sendMoneyData.toJson();
    if (dd.isNotEmpty) {
      finalData['PaymentDetails'].addAll(dd);
      if (dd['BeneficiaryBankCode'] != null) {
        finalData['PaymentDetails']
            .addAll({"BankCode": dd['BeneficiaryBankCode']});
      }
      if (dd['BeneficiaryBankName'] != null) {
        finalData['PaymentDetails']
            .addAll({"BankName": dd['BeneficiaryBankName']});
      }
      if (dd['BeneficiaryBranchCode'] != null) {
        finalData['PaymentDetails']
            .addAll({"BranchCode": dd['BeneficiaryBranchCode']});
      }
      if (dd['BeneficiaryBranchName'] != null) {
        finalData['PaymentDetails']
            .addAll({"BranchName": dd['BeneficiaryBranchName']});
      }
      if (dd['ServiceProviderName'] != null) {
        finalData['PaymentDetails']
            .addAll({"ServiceProviderName": dd['ServiceProviderName']});
      }
    }
    // print(dd);
    // print(finalData['CustomerDetails']);
    // buttonLoading = false;
    // update();
    // return false;

    try {
      sendMoneyResp = await ApiService().saveRemittance(finalData);
    } finally {
      buttonLoading = false;
      update(['RPD-ProceedButton']);
    }

    if (sendMoneyResp != null) {
      BankAttributes.referenceNumber = sendMoneyResp!.transactionReference;
      if (!avoidNavigation) {
        final PreferredSizeWidget appBar;
        switch (Box3.primaryUI) {
          case AppUI.uiTwo:
            appBar = ui2appbars.AppBars.paymentConfirmation;
            break;
          case AppUI.uiThree:
            appBar = ui3appbars.AppBars.paymentConfirmation;
            break;
          default:
            appBar = ui1appbars.AppBars.paymentConfirmation;
        }
        Get.find<MainController>()
            .push(AppRoutes.getPage(AppRoutes.paymentMode), appBar);
      }
      return true;
    }
    return false;
  }

  void scrollToBottom(ScrollController cntroller) {
    if (cntroller.hasClients) {
      cntroller.animateTo(
        cntroller.position.maxScrollExtent,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    }
  }

  Future<void> proceedTransaction({bool saveRemittance = false}) async {
    if (gateWay == null) {
      // gatewayError = 'required'.tr;
      apiAlertDialog(
        title: 'Alert',
        message: 'Please select payment type',
      );
      update();
    } else if (gateWay?.type == 'C' || gateWay?.type == 'W') {
      await apiAlertDialog(
          title: 'Alert',
          message:
              'Your request for the transaction will be automatically cancelled if you fail to visit your branch on the same day.',
          function: () async {
            Get.back();
            await authorize(saveRemittance: saveRemittance);
          });
    } else if (gateWay?.type == 'A') {
      if (BankAttributes.isValid()) {
        await apiAlertDialog(
            title: 'Alert',
            message:
                'Please make sure you deposited the exact amount mentioned here as there will be no refund available on any discrepancies in the amount',
            function: () async {
              Get.back();
              await authorize(saveRemittance: saveRemittance);
            });
      } else {
        update();
        scrollToBottom(listScrollController);
      }
    } else if (gateWay?.type == 'D') {
      // if (gateWay?.type == 'D' && gateWay?.description == 'DAPI') {
      if (gateWay?.type == 'D' &&
          gateWay?.description == 'Instant Bank Transfer') {
        await authorize(saveRemittance: saveRemittance);
      } else {
        if (selectedDebitBank == null) {
          debitBankError = 'Required';
          update();
          scrollToBottom(listScrollController);
        } else {
          await authorize(saveRemittance: saveRemittance);
        }
      }
    } else if (gateWay?.type == 'G') {
      scrollToBottom(listScrollController);
      return;
    } else {
      await authorize(saveRemittance: saveRemittance);
    }
  }

  Future<void> syncAndFetchBeneficiariesAndTransactions() async {
    // Sync Beneficiaries to update CoreBeneficiaryUID and then fetch latest beneficiary and transactions data
    syncingBeneficiaries = true;
    if (selectedBeneficiary?.coreBeneficiaryUid?.isEmpty == true &&
        Box3.customerDetailsFZ?.data?.customerCode.isNotEmpty == true) {
      await (Get.isRegistered<SignUpController>()
              ? Get.find<SignUpController>()
              : Get.put(SignUpController()))
          .syncBeneficiaries(Box3.customerDetailsFZ!.data!.customerCode);
    }

    await getData(forceUpdateTxnsAndBenefs: true);
    syncingBeneficiaries = false;
    update();
  }

  DateTime n = DateTime.now();

  Future<void> paymentSound() async {
    final AudioPlayer player = AudioPlayer();
    await player.play(AssetSource('sounds/apple_pay_ding.mp3'));
  }

  Future<void> sendMoney({bool saveRemittance = false}) async {
    if (saveRemittance) {
      /* --> call save remittance before confirm transaction,
       only if the 'REVIEW PAYMENT DETAILS' & 'PAYMENT MODE' is in a single screen. <-- */
      final isSucc = await saveRemittence(avoidNavigation: true);
      if (!isSucc) return;
    }
    loading = true;
    buttonLoading = true;
    update();

    try {
      dynamic res;

      if (gateWay?.type == 'C') {
        await ApiService().makeAvailableTransaction(
            referenceNo: BankAttributes.referenceNumber,
            paymentMode: gateWay!.type!);

        final transactionRef = await ApiService()
            .trackByRefNo(referenceNo: BankAttributes.referenceNumber);
        if (Box3.settings.EnablePaymentSound == true) {
          paymentSound();
        }
        Get.find<MainController>()
          ..pages.clear()
          ..push(AppRoutes.getPage(AppRoutes.dashboard), dashBoardAppbar());
        if (transactionRef.isSuccess) {
          Get.dialog(transactionReceiptAlert(transactionRef.data!),
              barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null);

          syncAndFetchBeneficiariesAndTransactions();
        }
      } else if (gateWay?.type == 'P') {
        PaymentGatewayRequest paymentGatewayRequest = PaymentGatewayRequest(
            sessionId: rC?.sessionId ?? '',
            amount: sendMoneyResp!.balanceAmount.toString(),
            refNo: sendMoneyResp!.transactionReference,
            clientUrl: AppConfigs.userUrl,
            customerCode: sendMoneyResp!.customerCode,
            payMode: gateWay!.type ?? 'P',
            language: Box3.lang?.Code ?? 'EN',
            customerName: sendMoneyResp!.userName,
            primaryColor: AppConfigs.primaryColor
                .toARGB32()
                .toRadixString(16)
                .padLeft(8, '0')
                .toUpperCase(),
            secondaryColor: AppConfigs.accentColor
                .toARGB32()
                .toRadixString(16)
                .padLeft(8, '0')
                .toUpperCase(),
            theme: isDark ? 'dark' : 'light',
            paymentGatewayKey: gateWay!.paymentModeKey ?? '',
            clientId: Box3.companyDataFZ?.clientCode ?? "CASM161123",
            token: Box3.appKeyToken ?? '',
            currencyCode: Box3.companyDataFZ!.companySettings!
                .primaryBaseCurrency //sendMoneyResp!.localCurrencyCode
            );

        res = await ApiService().sendMoneyPaymentGateway(
            sendMoneyData: paymentGatewayRequest.toJson());

        if (res?.data['StatusCode'] == 'RMA-SUCC' &&
            res?.data['Data'] != null) {
          var webres = await Get.to(
            () => PaymentWebPage(
              pageTitle: gateWay!.description ?? '',
              htmlData: res?.data['Data']['WebView'],
              baseUrl: gateWay!.paymentModeKey == 'QPAY' ||
                      gateWay!.paymentModeKey == 'LEAN'
                  ? Box3.getWebViewBaseUrl(AppConfigs.userUrl)
                  : null,
            ),
          );
          if (webres == 'canceled') {
            Get.find<MainController>().pop();
          }
          update();
        } else {
          CustomMessageDetailsFZ msg = CustomMessageDetailsFZ.fromJson(
              res?.data['CustomMessageDetails']);
          errorAlert(title: msg.MessageHeader, content: msg.MessageDescription);
          update();
        }
      } else {
        if (gateWay?.type == 'A' && bill != null) {
          await ApiService().uploadMediaDocumentNew(
            isAfterSignUp: true,
            validationValue: Box3.customerDetailsFZ?.data?.idNo ?? '',
            customerCode:
                BankAttributes.paymentReferenceNumberController.text.trim(),
            file: XFile(bill!.path),
            documentUploadType: 'BILL_RECIEPT',
          );
        }
        sendMoneyResp!.paymentModeCode = gateWay?.type ?? "";
        sendMoneyResp!.posBankCode = BankAttributes.drawingBank?.bankCode ?? '';
        sendMoneyResp!.bankName = BankAttributes.drawingBank?.bankName ?? '';
        Map<String, dynamic> sendMoneyRequestData = sendMoneyResp!.toJson();
        sendMoneyRequestData['DigitalData']['PaymentRefNo'] =
            BankAttributes.paymentReferenceNumberController.text.trim();
        sendMoneyRequestData['DigitalData']['CardChequeNo'] =
            BankAttributes.payAccountNumber?.accountNumber ?? '';

        res = await ApiService()
            .confirmTransaction(sendMoneyData: sendMoneyRequestData);

        if (res != null) {
          if (res.data['StatusCode'] == 'RMA-SUCC' ||
              res.data['StatusCode'] == 'CC-SUCC') {
            final transactionRef = await ApiService()
                .trackByRefNo(referenceNo: BankAttributes.referenceNumber);
            if (Box3.settings.EnablePaymentSound == true) {
              paymentSound();
            }
            Get.find<MainController>()
              ..pages.clear()
              ..push(AppRoutes.getPage(AppRoutes.dashboard), dashBoardAppbar());
            if (transactionRef.isSuccess) {
              Get.dialog(transactionReceiptAlert(transactionRef.data!),
                  barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null);

              syncAndFetchBeneficiariesAndTransactions();
            }
          } else {
            CustomMessageDetailsFZ msg = CustomMessageDetailsFZ.fromJson(
                res.data['CustomMessageDetails']);
            errorAlert(
                title: msg.MessageHeader, content: msg.MessageDescription);
          }
        }
      }
    } finally {
      loading = false;
      buttonLoading = false;
      update();
    }
  }

  Future<void> goBack() async {
    Get.back();
    Get.find<MainController>()
      ..pages.clear()
      ..push(AppRoutes.getPage(AppRoutes.dashboard), dashBoardAppbar());
    DataController d = Get.find<DataController>();
    await d.getTransactions(
        startDate: DateTime.now().subtract(
            Duration(days: AppConfigs.env != Environment.prod ? 60 : 180)),
        endDate: DateTime.now());
  }

  Future<void> getSuccessData(
      {required String paymentStatus,
      required String transactionStatus,
      required String title,
      required bool isStatus}) async {
    Get.back();
    Get.find<MainController>()
      ..pages.clear()
      ..push(AppRoutes.getPage(AppRoutes.dashboard), dashBoardAppbar());
    transactionDetailsFz = await ApiService()
        .transactionDetailsByRefNo(referenceNo: BankAttributes.referenceNumber);
    if (bill != null) {
      await ApiService().uploadMediaDocument(
          validationValue: Box3.customerDetailsFZ?.data!.idNo,
          file: bill!,
          documentUploadType: 'bankref',
          referenceNumber: BankAttributes.referenceNumber);
    }
    Get.dialog(transactionReceiptAlert(transactionDetailsFz!),
        barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null);

    syncAndFetchBeneficiariesAndTransactions();
  }

  Future<void> getFailedData(
      {required String paymentStatus,
      required InAppWebViewController webViewController,
      required String url,
      String? heading,
      String? message}) async {
    await Get.dialog(paymentFailAlert(
        paymentStatus: paymentStatus,
        webViewController: webViewController,
        url: url,
        heading: heading,
        message: message));
  }

  Future<void> getExceptionData(
      {required String paymentStatus,
      required InAppWebViewController webViewController,
      required String url,
      String? heading,
      String? message}) async {
    Get.back();
    Get.find<MainController>()
      ..pages.clear()
      ..push(AppRoutes.getPage(AppRoutes.dashboard), dashBoardAppbar());

    await Get.dialog(paymentExceptionAlert(
        paymentStatus: paymentStatus,
        webViewController: webViewController,
        url: url,
        heading: heading,
        message: message));
  }

  Future<void> updateToCurrency(
      {required String s,
      required String type,
      String? serviceType,
      String? currencyCode}) async {
    if (selectedBeneficiary != null) {
      if (s.isNotEmpty && (double.tryParse(s) ?? 0) > 0 && s.isNotEmpty) {
        rateLoader.value = true;

        try {
          rC = await ApiService().getRateCharge(
            amount: s,
            amountType: type,
            currencyCode:
                currencyCode ?? selectedBeneficiary!.serviceCurrency!.Code,
            countryCode: selectedBeneficiary!.country!.Code,
            serviceType: selectedBeneficiary!.serviceType!.Code,
            beneficiaryCode: selectedBeneficiary!.id != null
                ? selectedBeneficiary!.id.toString()
                : "",
            beneficiaryBankCode: selectedBeneficiary!.bank!.Code,
            stateCode: form.selectedSources['StateCode']?.Code ??
                form.selectedSources['StateCode']?.stateCode,
            cityCode: form.selectedSources['CityCode']?.Code ??
                form.selectedSources['CityCode']?.cityCode,
            agentCode: form.selectedSources['BeneficiaryBankCode']?.BankCode ??
                form.selectedSources['BankCode']?.BankCode,
            agentBranchCode:
                form.selectedSources['BeneficiaryBranchCode']?.Code ??
                    form.selectedSources['AgentLocation']?.Code,
            offer: selectedOffer,
          );
          rateCharge = rC?.chargeDetails;
          // update();
          if (rateCharge != null && s.isNotEmpty) {
            final int? lcyDecimal = rateCharge!.currencyDecimal;
            final int? fcyDecimal = rateCharge!.fxCurrencyDecimal;

            final bool isLcyMatch = type == 'L' &&
                fromAmountCtrl.text.isNotEmpty &&
                (rateCharge!.netAmount?.toStringWithOptionalFixed(lcyDecimal) ==
                    double.parse(fromAmountCtrl.text)
                        .toStringWithOptionalFixed(lcyDecimal));

            final bool isFcyMatch = type == 'F' &&
                toAmountCtrl.text.isNotEmpty &&
                (rateCharge!.fcyAmount?.toStringWithOptionalFixed(fcyDecimal) ==
                    double.parse(toAmountCtrl.text)
                        .toStringWithOptionalFixed(fcyDecimal));

            if (isLcyMatch) {
              toAmountCtrl.text = rateCharge!.fcyAmount!.toString();
              fromAmountCtrl.text = rateCharge!.netAmount!.toString();
            }
            if (isFcyMatch) {
              fromAmountCtrl.text = rateCharge!.lcyAmount!.toString();
              toAmountCtrl.text = rateCharge!.fcyAmount!.toString();
            } else if (!isLcyMatch && !isFcyMatch) {}

            // update();

            // CBLimitCheckResult res = Get.find<AccountController>()
            //     .checkRateLimitExceeded(
            //         fromAmountCtrl.text.isEmpty ? '0' : fromAmountCtrl.text,
            //         selectedBeneficiary: selectedBeneficiary!);
            // if (res.isLimitExceeded) {
            //   cbLimitErrorAlert(
            //       content:
            //           '${res.message} ${Box3.companyDataFZ?.companySettings?.primaryBaseCurrency != "AED" ? res.limit : ''} ${(res.limit.isNotEmpty && res.limitType == CBLimitType.amount && Box3.companyDataFZ?.companySettings?.primaryBaseCurrency != "AED") ? Box3.companyDataFZ?.companySettings?.primaryBaseCurrency : ''}',
            //       amount: (res.limit.isNotEmpty &&
            //               res.limitType == CBLimitType.amount)
            //           ? res.limit
            //           : null,
            //       currencySymbol: (res.limit.isNotEmpty &&
            //               res.limitType == CBLimitType.amount)
            //           ? (Box3.companyDataFZ?.companySettings
            //                       ?.primaryBaseCurrency ==
            //                   "AED"
            //               ? Box3.companyDataFZ?.companySettings
            //                   ?.primaryBaseCurrency
            //               : null)
            //           : null);
            //   fromAmountCtrl.clear();
            //   toAmountCtrl.clear();
            //   rateLoader = false;
            //   update();

            //   return;
            // }
          } else {
            if (type == "F") {
              fromAmountCtrl.clear();
            } else {
              toAmountCtrl.clear();
            }
          }
        } finally {
          rateLoader.value = false;
          fromAmtErr = '';
          toAmtErr = '';
        }
      } else {
        rateCharge = null;
        fromAmountCtrl.clear();
        toAmountCtrl.clear();
        rateLoader.value = false;
      }
    } else {
      if (s.isNotEmpty && double.parse(s) > 0) {
        rateLoader.value = true;
        RateCalculatorFz? g;
        try {
          if (toAmtCur != null) {
            g = await ApiService()
                .guestRate(amount: s, currency: toAmtCur, type: type);
          }
        } catch (e) {
          g = null;
        }

        if (g != null) {
          if (type == 'L' &&
              fromAmountCtrl.text.isNotEmpty &&
              (g.lcyAmount?.toString() ==
                  double.parse(fromAmountCtrl.text).toString())) {
            toAmountCtrl.text = g.fcyAmount!
                .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength);
            fromAmountCtrl.text = g.lcyAmount!
                .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength);
          }
          if (type == 'F' &&
              toAmountCtrl.text.isNotEmpty &&
              (g.fcyAmount?.toString() ==
                  double.parse(toAmountCtrl.text).toString())) {
            fromAmountCtrl.text = g.lcyAmount!
                .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength);
            toAmountCtrl.text = g.fcyAmount!
                .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength);
          }
        }
        rateLoader.value = false;
      } else {
        rateCharge = null;
        fromAmountCtrl.clear();
        toAmountCtrl.clear();
        rateLoader.value = false;
      }
    }
    // }
    update();
  }

  bool acceptTAndC = false;
  String tAndCError = '';

  final FocusNode fromAmountNode = FocusNode();
  final FocusNode toAmountNode = FocusNode();

  KeyboardActionsConfig keyboardConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: fromAmountNode,
          ),
          KeyboardActionsItem(
            focusNode: toAmountNode,
          ),
        ]);
  }

  TransactionDetailsFz? transactionDetailsFz;

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

  void addBeneficiary() {
    AddBeneficiaryController addBeneficiaryController =
        Get.put(AddBeneficiaryController());
    if (Get.isRegistered<AddBeneficiaryController>()) {
      addBeneficiaryController = Get.find<AddBeneficiaryController>();
    }
    addBeneficiaryController
      ..benefAttributes = AddBeneficiaryAttributes()
      ..catalogueRetrieved = false;
    if (!AppConfigs.formRules) {
      addBeneficiaryController.getCatalogs();
    } else {
      // addBeneficiaryController.getBeneficiaryForm();
    }
    final PreferredSizeWidget appBar;
    switch (Box3.primaryUI) {
      case AppUI.uiTwo:
        appBar = ui2appbars.AppBars.addBeneficiary;
        break;
      case AppUI.uiThree:
        appBar = ui3appbars.AppBars.addBeneficiary;
        break;
      default:
        appBar = ui1appbars.AppBars.addBeneficiary;
    }
    Get
      ..put(SignUpController())
      ..find<MainController>()
          .push(AppRoutes.getPage(AppRoutes.addBeneficiaryFormRules), appBar);
  }
}
