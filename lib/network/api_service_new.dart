import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:appcheck/appcheck.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:mobiremit/models/Enquiry/enquiry_fz.dart';
import 'package:mobiremit/models/advertiesments/advertiesment_fz.dart';
import 'package:mobiremit/models/bank_routing/bank_routing_fz.dart';
import 'package:mobiremit/models/banks/drawing_bank_fz.dart';
import 'package:mobiremit/models/beneficiary/beneficiary_fz.dart';
import 'package:mobiremit/models/cblimit/cblimit_fz.dart';
import 'package:mobiremit/models/cms/cms_fz.dart';
import 'package:mobiremit/models/currency_symbol/currency_symbol_fz.dart';
import 'package:mobiremit/models/custom_message/custom_message_details_fz.dart';
import 'package:mobiremit/models/customer_ekyc/customer_ekyc.dart';
import 'package:mobiremit/models/forgot_password/forgotPassword.dart';
import 'package:mobiremit/models/offers/offers_fz.dart';
import 'package:mobiremit/models/pagination_details/pagination_details_fz.dart';
import 'package:mobiremit/models/payment_modes/payment_mode_fz.dart';
import 'package:mobiremit/models/send_money/send_money_resp_model.dart';
import 'package:mobiremit/models/transaction_details/transaction_details_fz.dart';
import 'package:mobiremit/models/txn_cancel/txn_cancel_fz.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/exports/built_values.dart';
import '../core/exports/controllers.dart';
import '../core/flavours/constants.dart';
import '../others/app_environments.dart';
import '../models/about_us/about_us_fz.dart';
import '../models/all_rates/all_rates_fz.dart';
import '../models/application_settings/admin_response_fz.dart';
import '../models/application_settings/settings_fz.dart';
import '../models/company_settings/company_data_fz.dart';
import '../models/complaint_or_feeback/feedback_complaint_fz.dart';
import '../models/contact_us/contact_us_fz.dart';
import '../models/faq/faqfz.dart';
import '../models/form_rules/form_rules_response_fz.dart';
import '../models/generate_token/generate_token_fz.dart';
import '../models/masters/master_response_fz.dart';
import '../models/news/news_fz.dart';
import '../models/notification/events/events_fz.dart';
import '../models/notification/in_app_notification/in_app_notifications_fz.dart';
import '../models/notification/modules/modules_fz.dart';
import '../models/privacy_policy/privacy_policy_fz.dart';
import '../models/rate_calculator/rate_calculator_fz.dart';
import '../models/rate_charge/rate_charge_fz.dart';
import '../models/reg_device/register_device_fz.dart';
import '../models/terms_and_condition/terms_and_condition_fz.dart';
import '../models/transaction_query_type/query_type_fz.dart';
import '../models/uae_pass/fetch_uae_pass_doc.dart';
import '../models/uae_pass/uae_pass_profile_fz.dart';
import '../others/image_compress.dart';
import '../others/network_constant.dart';
import '../others/video_compress.dart';
import '../ui_one/custom_widgets/alert_dialog.dart';
import '../ui_one/custom_widgets/error_alert.dart';
import 'api_client_new1.dart';
import 'api_endpoints.dart';

class ApiService {
  static final ApiService _i = ApiService._();

  factory ApiService() => _i;

  final ApiClient _client = ApiClient();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // Add deviceType property
  String get deviceType => Platform.isAndroid ? 'android' : 'ios';
  static String deviceId = Box3.deviceId ?? '';

  static String? get customerCode => Box3.customerDetailsFZ?.data?.customerCode;

  static String? get sessionId => Box3.customerDetailsFZ?.data?.appSession;

  ApiService._();

  Future<void> trackEvent(String eventName,
      {Map<String, Object>? params}) async {
    params?.addAll({'time': DateTime.now().toString()});
    await FirebaseAnalytics.instance.logEvent(
      name: eventName,
      parameters: params,
    );
  }

  Future<GenerateTokenFZ?> generateToken(
      {required Map<String, dynamic> tokenRequestBody}) async {
    Response? r = await _client.post(
        path: APIEndPoints.tokenGen, data: tokenRequestBody, exclude: true);
    return GenerateTokenFZ.fromJson(r?.data);
  }

  Future<AboutUsFZ?> getAboutUs({required String code}) async {
    Response? r = await _client.post(
        path: APIEndPoints.aboutUs,
        data: {
          'token': Box3.appKeyToken,
          "Code": code,
          "IPAddress": Box3.appIPAddress
        },
        exclude: true);
    return AboutUsFZ.fromJson(r?.data);
  }

  Future<PrivacyPolicyFZ?> getPrivacy({required String code}) async {
    Response? r = await _client.post(
        path: APIEndPoints.privacyPolicy,
        data: {
          'token': Box3.appKeyToken,
          "Code": code,
          "IPAddress": Box3.appIPAddress
        },
        exclude: true);
    return PrivacyPolicyFZ.fromJson(r?.data);
  }

  Future<TermsAndConditionFZ?> getTerms({required String code}) async {
    Response? r = await _client.post(
        path: APIEndPoints.termsAndConditions,
        data: {
          'token': Box3.appKeyToken,
          "Code": code,
          "IPAddress": Box3.appIPAddress
        },
        exclude: true);
    return TermsAndConditionFZ.fromJson(r?.data);
  }

  Future<List<NewsFZ>?> getNews({required String code}) async {
    Response? r = await _client.post(
        path: APIEndPoints.getNews,
        data: {
          'token': Box3.appKeyToken,
          "code": code,
          "IPAddress": Box3.appIPAddress
        },
        exclude: true);
    return (r!.data['statusCode'] == '000' && r.data["newsList"] != null)
        ? (r.data['newsList'] as List<dynamic>)
            .map((e) => NewsFZ.fromJson(e))
            .toList()
        : [];
  }

  Future<FAQFZ?> getFAQ() async {
    Response? r = await _client.post(
        path: APIEndPoints.faq,
        data: {
          'Token': Box3.appKeyToken,
          'faqCode': "",
          "LanguageCode": Box3.lang?.Code ?? '',
          "IPAddress": Box3.appIPAddress
        },
        exclude: true);
    return FAQFZ.fromJson(r?.data);
  }

  Future<List<BeneficiaryFz>> beneficiaries() async {
    var data = {
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress,
      "Data": {"CustomerCode": customerCode}
    };
    Response? r =
        await _client.post(path: APIEndPoints.beneficiaries, data: data);
    if (r?.data['StatusCode'] == 'RMA-SUCC') {
      if (r!.data['PreferencesList'] != null) {
        return (r.data['PreferencesList'] as List)
            .map((e) => BeneficiaryFz.fromJson(e))
            .toList();
      }
      return [];
    } else {
      return [];
    }
  }

  Future<TransactionFz?> transactions(
      {required String startDate,
      required String endDate,
      required bool enablePagination,
      required int? pageSize,
      required int? pageNumber}) async {
    Response? res = await _client
        .post(path: NetworkConstant.transactions, exclude: true, data: {
      'Token': Box3.appKeyToken,
      "Data": {
        "DateFrom": startDate,
        "DateTo": endDate,
        "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
        "enablePagination": enablePagination,
      },
      "IPAddress": Box3.appIPAddress
    });
    if (res?.data['StatusCode'] == 'RMA-SUCC') {
      return TransactionFz.fromJson(res?.data);
    } else {
      return null;
    }
  }

  Future<List<QueryTypeFz>> getQueryTypes() async {
    Response? res = await _client.post(
      path: NetworkConstant.getQueryTypes,
      data: {"Token": Box3.appKeyToken, "IPAddress": Box3.appIPAddress},
      exclude: true,
    );

    final queryTypeRes = QueryTypeResponse.fromJson(res?.data);

    if (queryTypeRes.isSuccess) {
      return queryTypeRes.queryList ?? [];
    } else {
      return [];
    }
  }

  Future<String?> getApiTransactionStatus(String transactionRefNo) async {
    Response? res =
        await _client.post(path: APIEndPoints.getApiTransactionStatus, data: {
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress,
      "Data": {"TransactionRefNo": transactionRefNo}
    });
    if (res?.data['StatusCode'] == "RMA-SUCC") {
      return res?.data['Data']['ApiStatus'];
    }
    return null;
  }

  Future<List<Offer>> getOffersList() async {
    Response? res = await _client.post(
      path: NetworkConstant.getpromotionlist,
      exclude: true,
      data: {
        "ClientCode": Box3.companyDataFZ?.clientCode,
        "Applications": "50",
        "ModuleNme": "58",
        "Form": "Loyalty Programs Manager",
        "CriterialMap": "NA",
        "PageNumber": "1",
        "PageSize": "5",
        "SortBy": "id",
        "OrderBy": "ASC"
      },
    );

    bool isSuccess = res?.data['StatusCode'] == "RMA-SUCC";
    if (isSuccess && res!.data['Data'] != null) {
      return (res.data['Data'] as List<dynamic>)
          .map((e) => Offer.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<bool> deRegister({String? mobile, String? idNo}) async {
    Map<String, dynamic> data = {
      "DeviceTypeDetails": [
        {"DeviceType": deviceType, "DeviceId": deviceId}
      ],
      "Mobile": Box3.customerDetailsFZ?.data!.mobileNo,
      "CustomerCode": Box3.customerDetailsFZ?.data!.customerCode,
      "IdNumber": Box3.customerDetailsFZ?.data!.idNo,
      "Token": Box3.appKeyToken,
      "DeregisterType": "SAMEDEVICE",
      "StepOrderId": "1",
      "LanguageCode": "EN",
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: NetworkConstant.deRegisterDevice, data: data);
    if (r?.data['StatusCode'] == 'RMA-SUCC') {
      return true;
    } else {
      alertDialog(
        body: r?.data["CustomMessageDetails"]["MessageDescription"] ?? "",
        title: '',
      );
      return false;
    }
  }

  Future<bool> validateClientPreference() async {
    Response? r = await _client.post(
        path: NetworkConstant.validateClientPreference,
        data: {"preferenceType": "AllowMultiDeviceRegistration"},
        exclude: true);
    return (r?.data['StatusCode'] == 'SCFG001' &&
        r?.data['OutputBody']['RootNode']['statusCode'] == '200');
  }

  Future<TransactionDetailsFz?> transactionDetailsByRefNo(
      {required String referenceNo}) async {
    Response? r = await _client
        .post(path: NetworkConstant.transactions, exclude: true, data: {
      'Token': Box3.appKeyToken,
      "Data": {"TransactionRefNo": referenceNo},
      "IPAddress": Box3.appIPAddress
    });

    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? TransactionDetailsFz.fromJson(r!.data['Data'][0])
        : null;
  }

  Future<TrackTxnResult> trackByRefNo({required String referenceNo}) async {
    Response? r = await _client
        .post(path: NetworkConstant.transactions, exclude: true, data: {
      'Token': Box3.appKeyToken,
      "Data": {"TransactionRefNo": referenceNo},
      "IPAddress": Box3.appIPAddress
    });

    if (r?.data['StatusCode'] == 'RMA-SUCC') {
      return TrackTxnResult.success(
        TransactionDetailsFz.fromJson(r!.data['Data'][0]),
      );
    } else {
      return TrackTxnResult.error(
          CustomMessageDetailsFZ.fromJson(r!.data['CustomMessageDetails']));
    }
  }

  Future<ForgotPassword?> forgotMPIN(Map<String, dynamic> data) async {
    Response? r = await _client.post(
        path: APIEndPoints.forgotPassword, data: data, exclude: true);
    return r?.data != null ? ForgotPassword.fromJson(r?.data) : null;
  }

  Future<String?> forgotUsername(
      {required String validationValue,
      required String type,
      required String? mobile}) async {
    Response? r = await _client.post(
        path: NetworkConstant.forgotUsername,
        data: {
          "validationType": type,
          "validationValue": validationValue,
          "deviceId": deviceId,
          "deviceType": deviceType,
          "mobile": mobile ?? ''
        },
        exclude: true);

    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200'
        ? r?.data['OutputBody']['RootNode']['message']
        : null;
  }

  Future<ComplaintBV?> resendForgotUsernameOTP(
      {required String validationType,
      required String validationValue,
      required String validationSource}) async {
    Response? r = await _client.post(path: NetworkConstant.resendOTP, data: {
      "validationType": "ID No",
      "validationValue": validationValue,
      "deviceId": deviceId,
      "deviceType": deviceType,
      "validationSource": validationSource
    });

    return r?.data['StatusCode'] == 'SCFG001'
        ? ComplaintBV.fromMap(r!.data['OutputBody']['RootNode'])
        : null;
  }

  Future<ComplaintBV?> validateOtpForgotUserName(
      {required String otp,
      required String type,
      required String validationValue,
      required String validationSource}) async {
    Response? r = await _client.post(
        path: NetworkConstant.validateOTP,
        data: {
          'otp': otp,
          'validationType': 'ID No',
          'validationValue': validationValue,
          'deviceId': deviceId,
          'deviceType': deviceType,
          'validationSource': validationSource
        },
        exclude: true);

    return r?.data['StatusCode'] == 'SCFG001'
        ? ComplaintBV.fromMap(r!.data['OutputBody']['RootNode'])
        : null;
  }

  Future<Map<String, dynamic>> validateOtpRequest(
      {required String otpID, required String otp}) async {
    Response? r = await _client.post(
      path: NetworkConstant.validateOTPRma,
      data: {
        "Token": Box3.appKeyToken,
        "IPAddress": Box3.appIPAddress,
        "Data": {"OtpId": otpID, "Otp": otp},
      },
    );
    if (r?.data['StatusCode'] == 'RMA-SUCC') {
      return {
        "IsValid": r!.data['Data']['IsValid'] ?? false,
        "MessageCode": r.data['Data']['MessageCode'] ?? '',
        "message":
            CustomMessageDetailsFZ.fromJson(r.data['CustomMessageDetails']),
      };
    } else {
      return {
        "IsValid": false,
        "MessageCode": r?.data['Data']['MessageCode'] ?? '',
        "message":
            CustomMessageDetailsFZ.fromJson(r?.data['CustomMessageDetails']),
      };
    }
  }

  Future<String?> changeMPINPassword(
      {required Map<String, dynamic> data}) async {
    final requestData = {
      "Token": Box3.appKeyToken?.trim(),
      "Data": data,
      "IPAddress": Box3.appIPAddress
    };

    print("Sending change login credential request:");
    print(requestData);

    try {
      final Response? r = await _client.post(
          path: NetworkConstant.changeLoginCredential, data: requestData);

      print(" Response: ${r?.data}");

      if (r?.data['StatusCode'] == 'RMA-SUCC' &&
          r?.data['Data']?['MessageCode'] == '000') {
        return "SUCCESS";
      } else {
        print("Failed response: ${r?.data}");
        return null;
      }
    } catch (e) {
      print(" Exception during API call: $e");
      return null;
    }
  }

  Future<String?> changelogincredential({
    required String oldCred,
    required String newCred,
    required String credentialType,
  }) async {
    final requestData = {
      "Token": Box3.appKeyToken?.trim(),
      "Data": {
        "CustomerCode": customerCode,
        "IdNo": Box3.customerDetailsFZ?.data?.idNo,
        "Mobile": Box3.customerDetailsFZ?.data?.mobileNo,
        "DeviceType": deviceType,
        "DeviceId": deviceId,
        "CredentialType": credentialType,
        "CurrentCredential": oldCred,
        "NewCredential": newCred,
      },
      "IPAddress": Box3.appIPAddress
    };

    print("Sending change login credential request:");
    print(requestData);

    try {
      final Response? r = await _client.post(
          path: NetworkConstant.changeLoginCredential, data: requestData);

      print(" Response: ${r?.data}");

      if (r?.data['StatusCode'] == 'RMA-SUCC' &&
          r?.data['Data']?['MessageDetails'] == 'SUCCESS') {
        return r?.data['Data']?['MessageDetails'];
      } else {
        print("Failed response: ${r?.data}");
        return null;
      }
    } catch (e) {
      print(" Exception during API call: $e");
      return null;
    }
  }

  Future<String?> resetCredencials(
      {required String newCred, required String credentialType}) async {
    Response? r = await _client.post(
        path: NetworkConstant.changeLoginCredential,
        data: {"newCredential": newCred, "credentialType": credentialType});
    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200'
        ? r?.data['OutputBody']['RootNode']['message']
        : null;
  }

  Future<ContactUsFz?> getOrganisationDetails() async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? '',
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(
        path: NetworkConstant.organisationDetails, exclude: true, data: data);
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? ContactUsFz.fromJson(r!.data)
        : null;
  }

  Future<RegisterDeviceFZ?> registerDeviceNew(String stepOrderId,
      {required String signInMethod,
      required Map<String, dynamic> authData}) async {
    Response? r = await _client.post(
        path: APIEndPoints.postValidateLogin,
        data: {
          "Version": AppEnvironments.appVersion,
          "DeviceTypeDetails": [
            {"DeviceType": deviceType, "DeviceId": deviceId}
          ],
          "EnvironmentCode": Box3.environmentCode ?? "1",
          "Token": Box3.appKeyToken,
          "StepOrderId": stepOrderId,
          "SignInMethod": signInMethod,
          "Authentication": authData,
          "IPAddress": Box3.appIPAddress
        },
        exclude: true);

    return r?.data != null ? RegisterDeviceFZ.fromJson(r?.data) : null;
  }

  Future<RegisterDeviceFZ?> generateOTP(
      {required String userIdentification, dynamic data}) async {
    Response? r = await _client.post(
      path: APIEndPoints.generateOTP,
      exclude: true,
      data: {
        "Token": Box3.appKeyToken,
        "Data": {
          "IdNo": Box3.customerDetailsFZ?.data?.idNo ?? data?['IdNo'],
          "Mobile": Box3.customerDetailsFZ?.data?.mobileNo ?? data?['Mobile'],
          "UserIdentification": userIdentification,
        },
        "IPAddress": Box3.appIPAddress
      },
    );
    if (r?.data['StatusCode'] == "RMA-SUCC") {
      return RegisterDeviceFZ.fromJson(r?.data);
    } else {
      return null;
    }
  }

  Future<bool> updateCustomerDetails(Map<String, dynamic> data) async {
    Response? r = await _client.post(
        path: APIEndPoints.updateCustomerDetails, data: data);
    return (r != null && r.data['StatusCode'] == 'CC-SUCC');
  }

  Future customerDetails(
      {required String customerCode,
      required String idNo,
      String? appSession}) async {
    if (customerCode == "") return null;
    Map<String, dynamic> data = {
      "Token": Box3.appKeyToken,
      "Data": {"CustomerCode": customerCode, "IdNumber": idNo},
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.getCustomer, data: data);
    return (r != null &&
            r.data['StatusCode'] == 'CC-SUCC' &&
            r.data["Data"] != null)
        ? r.data
        : null;
  }

  Future<Null> syncBeneficiaries({required String customerCode}) async {
    if (customerCode == "") return null;
    Map<String, dynamic> data = {
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "EnvironmentCode": Box3.environmentCode ?? '1',
      "ClientCode": Box3.companyDataFZ?.clientCode ?? '',
      "Data": {"CustomerCode": customerCode},
    };
    await _client.post(path: APIEndPoints.syncBeneficiaries, data: data);
  }

  Future<CurrencySymbolFz?> getCurrencySymbols() async {
    Map<String, dynamic> data = {
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress
    };
    var res =
        await _client.post(path: APIEndPoints.getCurrencySymbol, data: data);
    if (res != null &&
        res.data['StatusCode'] == 'RMA-SUCC' &&
        res.data["CurrencySymbol"] != null) {
      return CurrencySymbolFz.fromJson(res.data);
    }
    return null;
  }

  Future customerDoc({required String customerCode}) async {
    if (customerCode == "") return null;
    Map<String, dynamic> data = {
      "Token": Box3.appKeyToken,
      "CustomerCode": customerCode,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.getCustomer, data: data);
    return (r != null &&
            r.data['StatusCode'] == 'CC-SUCC' &&
            r.data["Data"] != null)
        ? r.data
        : null;
  }

  Future<List<CurrencyRateList>> getRate() async {
    var data = {"Token": Box3.appKeyToken, "IPAddress": Box3.appIPAddress};
    Response? r =
        await _client.post(path: APIEndPoints.getAllCurrencyRate, data: data);

    // Print the full response for debugging
    print('Rahul Rate Response: ${r?.data}');
    return r?.data['StatusCode'] == 'RMA-SUCC' && r?.data['Data'] != null
        ? (r!.data['Data']['CurrencyRateList'] as List<dynamic>)
            .map((e) => CurrencyRateList.fromJson(e))
            .toList()
        : [];
  }

  Future<dynamic> getRateAlert() async {
    Response? r = await _client.post(path: NetworkConstant.getRateAlert);
    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200'
        ? r
        : null;
  }

  Future<Response?> getProviderCountryValidation(
      {required String countryCode}) async {
    Response? r = await _client.post(
        path: NetworkConstant.providerCountryValidation,
        data: {"countryCode": countryCode});
    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200'
        ? r!
        : null;
  }

  Future<List<MasterResponseFZ>> fieldOptions(String path,
      {Map<String, dynamic>? data}) async {
    Response? r = await _client.post(path: path, data: data);
    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200'
        ? (r!.data['OutputBody']['RootNode']['response'] as List<dynamic>)
            .map((e) => MasterResponseFZ.fromJson(e))
            .toList()
        : [];
  }

  Future<TxnCancelFz?> cancelTransaction(
      {required String referenceNo, required String cancelRemarks}) async {
    Response? r =
        await _client.post(path: NetworkConstant.cancelTransaction, data: {
      "Token": Box3.appKeyToken,
      "Code": "0",
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "IpAddress": Box3.appIPAddress ?? "",
      "ReferenceNo": referenceNo,
      "CancelRemarks": cancelRemarks,
    });

    return r?.data['StatusCode'] == 'RMA-SUCCESS'
        ? TxnCancelFz.fromJson(r!.data)
        : null;
  }

  Future<List<NotificationFz>> notifications() async {
    var data = {
      "Token": Box3.appKeyToken,
      "ClientCode": Box3.companyDataFZ?.clientCode,
      "EnvironmentCode": Box3.environmentCode ?? "1",
      "LanguageCode": Box3.lang?.Code ?? "",
      "IpAddress": Box3.appIPAddress,
      "Data": {
        "CustomerCode": customerCode ?? "",
        "DeviceId": Box3.deviceId ?? ""
      }
    };
    Response? r =
        await _client.post(path: NetworkConstant.notifications, data: data);

    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? (r!.data['NotificationList'] as List<dynamic>)
            .map((e) => NotificationFz.fromJson(e))
            .toList()
        : [];
  }

  Future<bool> setNotificationStatus(
      {required NotificationFz notification}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "ClientCode": Box3.companyDataFZ?.clientCode,
      "EnvironmentCode": Box3.environmentCode ?? "1",
      "LanguageCode": Box3.lang?.Code ?? "",
      "IpAddress": Box3.appIPAddress,
      "Data": notification.copyWith(status: "R").toJson()
    };
    Response? r =
        await _client.post(path: NetworkConstant.setNotification, data: data);

    return r?.data['StatusCode'] == 'RMA-SUCC' ? true : false;
  }

  Future<dynamic> addBeneficiary2(Map<String, dynamic> data) async {
    data.addAll({"CustomerCode": Box3.customerDetailsFZ?.data?.customerCode});
    var req = {
      "Token": Box3.appKeyToken,
      "Data": data,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: NetworkConstant.addBeneficiary, data: req);
    return r?.data['StatusCode'] == 'CC-SUCC'
        ? CustomMessageDetailsFZ.fromJson(r?.data['CustomMessageDetails'])
        : null;
  }

  Future<dynamic> updateBeneficiary(Map<String, dynamic> data,
      {BeneficiaryFz? benef}) async {
    data.addAll({
      "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
      "BeneficiaryUniqueId": benef?.id.toString() ?? ""
    });
    var req = {
      "Token": Box3.appKeyToken,
      "Data": data,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: NetworkConstant.updateBeneficiary, data: req);
    return r?.data['StatusCode'] == 'CC-SUCC'
        ? CustomMessageDetailsFZ.fromJson(r?.data['CustomMessageDetails'])
        : null;
  }

  Future<bool> beneficiarytasks(String id, String type, {bool? active}) async {
    Map<String, dynamic> data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "Data": {
        "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
        "BeneficiaryUID": id,
      },
      "IPAddress": Box3.appIPAddress
    };

    if (active == true) {
      data["Data"].addAll({"Status": type, "Action": "UPDATESTATUS"});
    } else {
      data["Data"].addAll({"Action": "UPDATEFAVOURITES", "Favorites": type});
    }

    Response? r =
        await _client.post(path: APIEndPoints.beneficiaryTask, data: data);

    return r?.data['StatusCode'] == "RMA-SUCC";
  }

  Future<bool> activateToken(
      {required String uniqueToken, String? customerCode}) async {
    if (uniqueToken == "") {
      return false;
    }

    Map<String, dynamic> data = {
      "Token": Box3.appKeyToken,
      "Data": {
        "CustomerCode": (customerCode != null && customerCode.isNotEmpty)
            ? customerCode
            : Box3.customerDetailsFZ?.data?.customerCode ?? "",
        "UniqueToken": uniqueToken,
      },
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(path: APIEndPoints.storeToken, data: data);
    return r?.data['StatusCode'] == "RMA-SUCC";
  }

  Future<Map<String, dynamic>> registerDevice(
      {required String validationValue, String? mobile}) async {
    Response? r = await _client.post(
        path: NetworkConstant.registerDevice,
        data: {
          "validationType": 'ID No',
          "validationValue": validationValue,
          "deviceId": deviceId,
          "deviceType": deviceType,
          "mobile": mobile
        },
        exclude: true);
    return r?.data['StatusCode'] == 'SCFG001'
        ? r!.data['OutputBody']['RootNode']
        : {};
  }

  Future<bool> validateMandatory(String ref) async {
    Response? r = await _client
        .post(path: 'validatemandatory', data: {"referenceNumber": ref});
    return r?.data['StatusCode'] == 'SCFG001' &&
        r?.data['OutputBody']['RootNode']['statusCode'] == '200';
  }

  Future<bool> validateAML(TransactionDetailsFz td) async {
    try {
      Response? r =
          await _client.post(path: NetworkConstant.validateAML, data: {
        "loginId": "amltest",
        "password": "Infra@12345",
        "individualOrCorporateName": td.customer,
        "dateOfBirthOrIncorporation":
            td.customerDob.toString().replaceAll('Z', ''),
        "countryOrCountryOfRegistration": td.birthCountryCode,
        "nationalIdOrRegistrationNumber": td.customerIdNo,
        "amlScanType": "transaction",
        "transactionNumber": td.transactionReference,
        "customerNumber": td.customerCode,
        "branchCode": td.branchId,
        "customerType": td.customerType,
        "transactionAmount": td.paymentAmount ?? '',
        "transactionSubType": "OUTWARD",
        "beneficiaryCountry": td.benfCountry,
        "transactionDate": td.transactionDate.toString().replaceAll('Z', ''),
        "residenceType": td.visaType,
        "IdType": td.customerIdDescription,
        "paymentMode": td.paymentType,
        "beneficiaryBank": td.bankName,
        "beneficiaryType": td.beneficiaryType,
        "fcyAmount": td.receivedAmount.toString(),
        "occupation": td.profession,
        "arieEmployeeFlag": td.arieEmployeeFlag,
        "correspondentBank": td.correspondent,
        "relationship": td.relationship,
        "service": td.transactionService,
        "transactionTypeThirdParty": "N",
        "purposeOfTransactions": td.purpose,
        "destinationCountry": td.destinationCountry,
        "currencyCode": td.beneficiaryCountryCode ?? '',
        "fPEP": td.isPep,
        "designation": td.profession,
        "birthPlace": td.birthCountry,
        "documentTypes": td.idCode,
        "beneficiaryName": td.beneficiaryName ?? '',
        "accountNumber": td.accountNumber,
        "customerNationality": td.customerNationalityCode,
        "serialNumber": '1',
        "referenceNumber": td.transactionReference ?? '',
        "commission": td.charge,
        "profit": '0',
        "sourceOfFund": td.source,
        "beneficiaryNationality": td.beneficiaryNationality,
        "additionalField2": td.beneficiaryAddress,
        "additionalField3": td.beneficiaryCountryCode
      });
      Map<String, dynamic>? map = r?.data['OutputBody']['RootNode'];
      bool b = map != null
          ? !((map['screeningMessage'] == '200' ||
                  map['screeningMessage'] == '201') &&
              map['violatedMessage'] == "No match found")
          : false;
      return await updateTransaction(td.transactionReference ?? '', b);
    } catch (e) {
      logger.i(e);
      return false;
    }
  }

  Future<bool> updateTransaction(String refNo, bool hold) async {
    Response? r = await _client.post(
        path: 'updatetransaction',
        data: {"referenceNumber": refNo, "isHold": hold});
    return r?.data['OutputBody']['RootNode']['statusCode'] == "200" ||
        r?.data['OutputBody']['RootNode']['statusCode'] == "201";
  }

  Future<RegisterDeviceFZ?> signupNewCustomer2(Map<String, dynamic> data,
      {String? username}) async {
    Map<String, dynamic> map = data;

    map.addAll({
      "DeviceTypeDetails": [
        {"DeviceType": deviceType, "DeviceId": deviceId}
      ]
    });

    Response? r = await _client.post(
        path: APIEndPoints.postDigitalAddCustomer, data: map);
    return r?.data != null ? RegisterDeviceFZ.fromJson(r?.data) : null;
  }

  Future<BankRoutingFz?> bankRoutingList() async {
    var data = {
      "Token": Box3.appKeyToken,
      "EnvironmentCode": Box3.environmentCode ?? "1",
      "ClientCode": Box3.companyDataFZ?.clientCode,
      "LicenseCountry": Box3.companyDataFZ?.licenseCountry ?? "IN",
      "IpAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.getBankRouting, data: data);
    if (r != null) {
      return BankRoutingFz.fromJson(r.data);
    } else {
      return null;
    }
  }

  Future<List<MasterResponseFZ>> getCatalogue(
      {required Map<String, dynamic> typeData, required String type}) async {
    //'IDTYPE','NATIONALITY','SERVICECOUNTRY','SERVICECURRENCY','RELATIONSHIP','PROFESSION','EMPLOYER'
    if (type == "") return [];
    typeData.addAll({"LanguageCode": Box3.lang?.Code ?? "EN"});
    var data = {
      "Token": Box3.appKeyToken,
      "Data": typeData,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.masterDetails, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'CC-SUCC' &&
        r.data["Data"] != null) {
      return (r.data["Data"] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<MasterResponseFZ>> getServiceCountry(
      {required Map<String, dynamic> typeData}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "Data": typeData,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.masterDetails, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'CC-SUCC' &&
        r.data["Data"] != null) {
      return (r.data["Data"] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<MasterResponseFZ>> getServiceCurrency(
      {required Map<String, dynamic> typeData}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "Data": typeData,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.masterDetails, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'CC-SUCC' &&
        r.data["Data"] != null) {
      return (r.data["Data"] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<MasterResponseFZ>> getMoneyServiceProvider(
      {required Map<String, dynamic> typeData}) async {
    typeData["LanguageCode"] = Box3.lang?.Code ?? "EN";
    var data = {
      "Token": Box3.appKeyToken,
      "Data": typeData,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.moneyServiceProvider, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'CC-SUCC' &&
        r.data["Data"] != null &&
        r.data["Data"]["ServiceProvider"] != null) {
      return (r.data["Data"]["ServiceProvider"] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>> validateAccountNoLength(
      {required String benfBankCode, required String currencyCode}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "EnvironmentCode": "1",
      "ClientCode": Box3.companyDataFZ?.clientCode,
      "LanguageCode": Box3.lang?.Code ?? "",
      "IpAddress": Box3.appIPAddress,
      "Data": {"CurrencyCode": currencyCode, "BenfBankCode": benfBankCode}
    };
    Response? r = await _client.post(
        path: APIEndPoints.validateAccountNoLength, data: data);
    if (r != null &&
        (r.data['StatusCode'] == 'RMA-SUCC') &&
        r.data["Data"]["AccountLengthList"] != null &&
        r.data["CustomMessageDetails"] != null) {
      return {
        "AccountLength": (r.data["Data"]["AccountLengthList"] as List<dynamic>)
            .map((e) => BankAccountLength.fromJson(e))
            .toList(),
        "Message":
            CustomMessageDetailsFZ.fromJson(r.data["CustomMessageDetails"]),
      };
    } else {
      return {"AccountLength": <BankAccountLength>[], "Message": null};
    }
  }

  Future<List<MasterResponseFZ>> getBanks2(
      {required Map<String, dynamic> typeData}) async {
    print(typeData);
    typeData["LanguageCode"] = Box3.lang?.Code ?? "EN";
    var data = {
      "Token": Box3.appKeyToken,
      "Data": typeData,
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(path: APIEndPoints.getBanks, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'CC-SUCC' &&
        r.data["Data"] != null &&
        r.data["Data"]["BankList"] != null) {
      return (r.data["Data"]["BankList"] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<MasterResponseFZ>> getState(
      {required Map<String, dynamic> typeData}) async {
    print(typeData);
    typeData["LanguageCode"] = Box3.lang?.Code ?? "EN";
    var data = {
      "Token": Box3.appKeyToken,
      "Data": typeData,
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(path: APIEndPoints.listState, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'CC-SUCC' &&
        r.data["Data"] != null) {
      return (r.data["Data"] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<MasterResponseFZ>> getCity(
      {required Map<String, dynamic> typeData}) async {
    print(typeData);
    typeData["LanguageCode"] = Box3.lang?.Code ?? "EN";
    var data = {
      "Token": Box3.appKeyToken,
      "Data": typeData,
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(path: APIEndPoints.listCity, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'CC-SUCC' &&
        r.data["Data"] != null) {
      return (r.data["Data"] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>> getBankBranches2(
      {required Map<String, dynamic> typeData}) async {
    typeData["LanguageCode"] = Box3.lang?.Code ?? "EN";
    var data = {
      "Token": Box3.appKeyToken,
      "Data": typeData,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.getBranches, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'CC-SUCC' &&
        r.data["Data"] != null) {
      PaginationDetailsFz paginationDetails =
          PaginationDetailsFz.fromJson(r.data["Data"]);
      List<MasterResponseFZ> branchList =
          (r.data["Data"]["BranchList"] as List<dynamic>)
              .map((e) => MasterResponseFZ.fromJson(e))
              .toList();
      return {
        "branchList": branchList,
        "paginationDetails": paginationDetails,
      };
    } else {
      return {
        "branchList": <MasterResponseFZ>[],
        "paginationDetails": null,
      };
    }
  }

  Future<List<MasterResponseFZ>> getBanks3(
      {required String countryCode,
      required String serviceProviderCode,
      required String serviceTypeCode,
      required String currencyCode}) async {
    Response? r = await _client
        .post(path: NetworkConstant.getBanks3, exclude: true, data: {
      "countryCode": countryCode,
      "serviceProviderCode": serviceProviderCode,
      "serviceCode": serviceTypeCode,
      "currencyCode": currencyCode
    });
    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200'
        ? (r!.data['OutputBody']['RootNode']?['response'] as List<dynamic>? ??
                [])
            .map((e) => MasterResponseFZ.fromJson(e))
            .toList()
        : [];
  }

  Future<List<MasterResponseFZ>> getBankBranches3({
    required String countryCode,
    required String bankCode,
    required String serviceProviderCode,
    required String cityCode,
    required String serviceTypeCode,
  }) async {
    Response? r = await _client.post(
      path: NetworkConstant.getBeneficiaryBankBranches3,
      data: {
        "countryCode": countryCode,
        "bankCode": bankCode,
        "serviceProviderCode": serviceProviderCode,
        "cityCode": cityCode,
        "serviceCode": serviceTypeCode,
      },
    );
    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200'
        ? (r!.data['OutputBody']['RootNode']['response'] as List<dynamic>)
            .map((e) => MasterResponseFZ.fromJson(e))
            .toList()
        : [];
  }

  Future<List<MasterResponseFZ>> getAddBeneficiaryService(
      {required String countryCode,
      String? currencyCode,
      String? serviceCode}) async {
    Response? r =
        await _client.post(path: NetworkConstant.getServiceProvider, data: {
      "countryCode": countryCode,
      "currencyCode": currencyCode,
      "serviceCode": serviceCode
    });
    if (r?.data['StatusCode'] == 'SCFG001' &&
        r?.data['OutputBody']['RootNode']['statusCode'] == '200') {
      return (r!.data['OutputBody']['RootNode']['response'] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future createRemAlert(int alert) async {
    AccountController a = Get.find<AccountController>();
    Response? r = await _client.post(
      path: APIEndPoints.setratealerts,
      data: {
        "Token": Box3.appKeyToken,
        "Action": "INSERT",
        "Code": "11",
        "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
        "AlertType": "PushNotification",
        "Currency": a.remittanceAttributes.toCurrency?.Code,
        "PreferredRate": alert == 1
            ? a.forexAttributes.forAmount.text
            : a.remittanceAttributes.remAmount.text,
        "DeviceType": deviceType,
        "DeviceId": deviceId,
        "AlertByEmail": "N",
        "AlertBySms": "N",
        "Status": "A",
        "IPAddress": Box3.appIPAddress
      },
      exclude: true,
    );

    return r?.data;
  }

  Future<bool> createForAlert(int alert) async {
    AccountController a = Get.find<AccountController>();
    Response? r = await _client.post(
        path: NetworkConstant.createAlert,
        data: {
          "fromCurrency": a.forexAttributes.fromCurrency?.Code,
          "toCurrency": a.forexAttributes.toCurrency?.Code,
          "preferredRate": a.forexAttributes.forAmount.text,
          "deviceId": deviceId,
          "alertByEmail": "Y",
          "alertBySms": "N",
          "alertType": '$alert'
        },
        exclude: true);
    return r?.data['StatusCode'] == 'SCFG001' &&
        r?.data['OutputBody']['RootNode']['statusCode'] == '200';
  }

  Future<CustomMessageDetailsFZ?> getIDExpiry() async {
    final requestData = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "IpAddress": Box3.appIPAddress,
      "ClientCode": Box3.companyDataFZ?.clientCode ?? "CASM161123",
      "EnvironmentCode": Box3.environmentCode ?? "1",
      "Data": {
        "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
      },
    };
    Response? r = await _client.post(
        path: NetworkConstant.getIdExpiry, data: requestData);

    if (r?.data['StatusCode'] == 'RMA-SUCC' &&
        r?.data['Data']?['ShowAlert'] == 'B') {
      Box3.idExpired = true;
      return CustomMessageDetailsFZ.fromJson(r!.data['CustomMessageDetails']);
    } else if (r?.data['StatusCode'] == 'RMA-SUCC' &&
        r?.data['Data']?['ShowAlert'] == 'Y') {
      Box3.idExpired = false;
      return CustomMessageDetailsFZ.fromJson(r!.data['CustomMessageDetails']);
    } else {
      Box3.idExpired = false;
      return null;
    }
  }

  Future<CBLimitFz?> getCBLimit() async {
    final requestData = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "IpAddress": "",
      "Data": {
        "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
        "LicenceCountry": Box3.companyDataFZ?.licenseCountry ?? "IN",
        "ClientCode": Box3.companyDataFZ?.clientCode ?? "CASM161123"
      },
      "IPAddress": Box3.appIPAddress
    };

    Response? r =
        await _client.post(path: NetworkConstant.cblimits, data: requestData);
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? CBLimitFz.fromJson(r!.data['Data'])
        : null;
  }

  Future<List<PaymentMode>> getPaymentModes() async {
    Response? r = await _client
        .post(path: NetworkConstant.paymentModes, exclude: true, data: {
      "Token": Box3.appKeyToken,
      "ModuleName": "43",
      "Form": FormNames.paymentMethodsMobiRemitFormRules,
      "ClientCode": Box3.companyDataFZ?.clientCode,
      "LicenseCountry": Box3.companyDataFZ?.licenseCountry ?? "IN",
      "Applications": "4",
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "UserId": Box3.companyDataFZ?.userId ?? "vidya",
      "CriteriaMap": "licenceCountry = ${Box3.companyDataFZ?.licenseCountry};",
      "IPAddress": Box3.appIPAddress
    });
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? (r!.data['Data']['AvailablePaymentModeList'] as List<dynamic>)
            .map((e) => PaymentMode.fromJson(e))
            .toList()
        : [];
  }

  Future<List<PaymentMode>> getPaymentGateways() async {
    Response? r = await _client
        .post(path: NetworkConstant.paymentgateway, exclude: true, data: {
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress,
    });
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? (r!.data['Data']['PaymentMode'] as List<dynamic>)
            .map((e) => PaymentMode.fromJson(e))
            .toList()
        : [];
  }

  Future<List<DrawingBankFz>> getPaymentModeBanks() async {
    Response? r =
        await _client.post(path: NetworkConstant.paymentModeBanks, data: {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "IPAddress": Box3.appIPAddress,
    });
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? (r!.data['BankList'] as List<dynamic>)
            .map((e) => DrawingBankFz.fromJson(e))
            .toList()
        : [];
  }

  Future<SendMoneyResp?> saveRemittance(
      Map<String, dynamic> sendMoneyData) async {
    Response? res = await _client.post(
      path: NetworkConstant.sendMoney,
      data: {
        "Token": Box3.appKeyToken,
        "Data": sendMoneyData,
        "IPAddress": Box3.appIPAddress
      },
      exclude: true,
    );
    if (res?.data['StatusCode'] == 'RMA-SUCC' && res?.data['Data'] != null) {
      return SendMoneyResp.fromJson(res?.data['Data']);
    }
    return null;
  }

  Future<Response<dynamic>?> confirmTransaction(
      {required Map<String, dynamic> sendMoneyData}) async {
    Response? res = await _client.post(
      path: NetworkConstant.confirmTransaction,
      data: {
        "Token": Box3.appKeyToken,
        "Data": sendMoneyData,
        "IPAddress": Box3.appIPAddress
      },
      exclude: true,
    );
    return res;
  }

  Future<Response<dynamic>?> makeAvailableTransaction(
      {required String referenceNo, required String paymentMode}) async {
    Response? res = await _client.post(
      path: NetworkConstant.makeAvailableTransaction,
      data: {
        "Token": Box3.appKeyToken,
        "LanguageCode": Box3.lang?.Code ?? "EN",
        "IpAddress": "",
        "Data": {"TransactionRefNo": referenceNo, "PaymentMode": paymentMode},
        "IPAddress": Box3.appIPAddress
      },
      exclude: true,
    );
    return res;
  }

  Future<Response<dynamic>?> sendMoneyPaymentGateway(
      {required Map<String, dynamic> sendMoneyData}) async {
    Response? res = await _client.post(
        path:
            "${NetworkConstant.renderpaymentgateway}?prime=${Box3.settings.themePrimary}&sec=${Box3.settings.themeSecondary}&theme=${Get.find<MainController>().isDark ? 'dark' : 'light'}",
        data: sendMoneyData);
    return res;
  }

  Future<List<MasterResponseFZ>> sources(
      {String? serviceProviderCode,
      String? beneficiaryBankCode,
      required String serviceCategoryCode,
      required String serviceCountryCode,
      required String serviceCurrencyCode}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "Data": {
        "BeneficiaryBankCode": beneficiaryBankCode ?? "",
        "ServiceProviderCode": serviceProviderCode ?? "",
        "ServiceCountryCode": serviceCountryCode,
        "ServiceCurrencyCode": serviceCurrencyCode,
        "ServiceCategoryCode": serviceCategoryCode,
      },
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: NetworkConstant.getSource, data: data);
    if (r?.data['StatusCode'] == 'CC-SUCC' ||
        r?.data['StatusCode'] == 'RMA-SUCC') {
      return (r!.data['Data'] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> eSignature() async {}

  Future<void> videoKYC() async {}

  Future<bool> sendFeedback(
    String feedback, {
    String? email,
    String? phone,
    String? action,
    String? code,
    int? ratingStars,
    required String feedbackType,
  }) async {
    Response? r = await _client.post(path: NetworkConstant.sendFeedback, data: {
      "Feedback": feedback,
      "Email": email,
      "Phone": phone,
      "FeedbackType": feedbackType,
      "Action": action ?? "INSERT",
      "Code": code ?? "1",
      "CustomerCode": customerCode ?? "1677131",
      "RatingStars": ratingStars ?? "1",
      "LanguageCode": "EN",
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress
    });

    return r?.data['StatusCode'] == 'RMA-SUCC';
  }

  Future<bool> logoutApp() async {
    Box3.saveConfig(loadSetting: false);
    return true;
  }

  Future<ComplaintBV?> sendTransactionComplaint(String notes,
      {String? email,
      String? phone,
      required String transactionRefNo,
      required String type}) async {
    Response? r =
        await _client.post(path: NetworkConstant.transactionComplaint, data: {
      "customerCode": customerCode ?? '',
      "sessionId": sessionId ?? '',
      "notes": notes,
      "email": email,
      "phone": phone,
      'complaintType': type,
      "transactionRefNo": transactionRefNo
    });

    return r?.data['StatusCode'] == 'SCFG001'
        ? ComplaintBV.fromMap(r!.data['OutputBody']['RootNode'])
        : null;
  }

  Future<FeedbackComplaintFz?> sendTransactionFeedback(String notes,
      {String? email,
      String? phone,
      required String transactionRefNo,
      required String type}) async {
    Response? r = await _client
        .post(path: NetworkConstant.sendFeedback, exclude: true, data: {
      "Action": "INSERT",
      "CustomerCode": customerCode ?? '',
      "Feedback": notes,
      "Email": email,
      "Phone": phone,
      'FeedbackType': type,
      "RatingStars": "",
      "transactionRefNo": transactionRefNo,
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "IPAddress": Box3.appIPAddress
    });
    return r?.data['StatusCode'] == 'RMA-SUCC' ||
            r?.data['StatusCode'] == 'CC-SUCC'
        ? FeedbackComplaintFz.fromJson(r!.data)
        : null;
  }

  Future<FeedbackComplaintFz?> sendTransactionEnquiry(
    String notes, {
    String? email,
    String? phone,
    required String transactionRefNo,
    required String enquiryType,
    required String queryType,
  }) async {
    Response? r = await _client.post(
      path: NetworkConstant.transactionComplaint,
      exclude: true,
      data: {
        "Action": "INSERT",
        "Code": "0",
        "EnquiryTypeCode": enquiryType,
        "QueryTypeCode": queryType,
        "TransactionRefNo": transactionRefNo,
        "CustomerCode": customerCode ?? '',
        "Remarks": notes,
        "PhoneNo": phone,
        "Emailid": email,
        "LanguageCode": Box3.lang?.Code ?? "EN",
        "Token": Box3.appKeyToken,
        "IPAddress": Box3.appIPAddress
      },
    );
    return r?.data['StatusCode'] == 'RMA-SUCC' ||
            r?.data['StatusCode'] == 'CC-SUCC' ||
            r?.data['StatusCode'] == 'RMA-FAILED'
        ? FeedbackComplaintFz.fromJson(r!.data)
        : null;
  }

  Future<EnquiryDataFz?> getEnquiry({required String txnRefNo}) async {
    Response? res = await _client.post(
      path: NetworkConstant.getEnquiry,
      exclude: true,
      data: {
        "Token": Box3.appKeyToken,
        "LanguageCode": Box3.lang?.Code ?? "EN",
        "EnquiryCode": "",
        "TransactionRefNo": txnRefNo,
      },
    );
    return res?.data['StatusCode'] == 'RMA-SUCC'
        ? EnquiryDataFz.fromJson({
            "EnquiryList": res!.data['Data']?['EnquiryList'] ?? [],
          })
        : null;
  }

  Future<List<BranchDetail>?> branchLocator() async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": "",
      "IPAddress": Box3.appIPAddress
    };

    Response? r = await _client.post(
        path: NetworkConstant.branchLocator, exclude: true, data: data);
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? (r!.data['Data']['BranchLocatorList'] as List<dynamic>)
            .map((e) => BranchDetail.fromJson(e))
            .toList()
        : null;
  }

  Future<void> notificationAlert(
      {required bool notification,
      required bool forexAlert,
      required bool remitAlert}) async {
    Response? r = await _client.post(
        path: NetworkConstant.notificationAlert,
        data: {
          "notification": notification,
          "forexAlert": forexAlert,
          "remitAlert": remitAlert
        });
    debugPrint(r?.data);
  }

  Future<bool> mailStatement(
      {required String fileName,
      required String base64,
      required String documentUploadType}) async {
    Response? r =
        await _client.post(path: NetworkConstant.documentUpload, data: {
      "customerCode": customerCode ?? '',
      "validationType": "ID No",
      "validationValue": "1",
      "imageOrVideo": "image",
      "contentType": "image/pdf",
      "fileName": fileName,
      "fileExtension": "pdf",
      "documentUploadType": documentUploadType,
      "base64String": base64,
    });
    return r?.data?['OutputBody']?['RootNode']?['statusCode'] == '200';
  }

  Future<void> transactionEnquiry() async {}

  Future<bool> updateCustomerProfile(DateTime expiryDate) async {
    Response? r = await _client.post(
      path: NetworkConstant.updateCustomerProfile,
      data: {
        "idExpiryDate": expiryDate.toString(),
      },
    );
    return r?.data?['OutputBody']?['RootNode']?['statusCode'] == '200';
  }

  Future<CustomerEkyc?> getEKYCDocument() async {
    Response? r = await _client.post(
      path: APIEndPoints.rmaekycdocuments,
      data: {
        "Token": Box3.appKeyToken,
        /* currently customer documents table have no link with the customer code. getting by IDNo */
        // "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
        "IdNo": Box3.customerDetailsFZ?.data?.idNo,
        "IPAddress": Box3.appIPAddress
      },
    );
    return r?.data != null ? CustomerEkyc.fromJson(r?.data) : null;
  }

  Future<List<DebitBankBV>> getDebitbanks() async {
    Response? r = await _client.post(
      path: NetworkConstant.debitBanks,
      data: {"payMode": "D"},
    );
    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200' &&
            r!.data['OutputBody']['RootNode']['response'] is List<dynamic>
        ? (r.data['OutputBody']['RootNode']['response'] as List<dynamic>)
            .map((e) => DebitBankBV.fromMap(e)!)
            .toList()
        : [];
  }

  Future<bool> uploadMediaDocument({
    required String? validationValue,
    required XFile file,
    required String documentUploadType,
    String? referenceNumber,
  }) async {
    XFile? compressedFile;
    if (documentUploadType == 'IDVIDEO') {
      var compressed =
          await VideoCompressor.compressToMaxSize(file, maxSizeInKB: 1024);
      if (compressed != null) {
        compressedFile = compressed;
        if (kDebugMode) {
          print('compressed video path: ${compressed.path}');
        }
      } else {
        if (kDebugMode) {
          print('compression failed or video too large.');
        }
      }
    } else if (documentUploadType != 'EMAIL') {
      var compressed =
          await ImageCompress.compressToUnder100KB(File(file.path));
      if (compressed != null) {
        compressedFile = compressed;
        if (kDebugMode) {
          print('compressed image path: ${compressed.path}');
        }
      } else {
        if (kDebugMode) {
          print('compression failed or image too large.');
        }
      }
    }

    var requestData = <String, dynamic>{};
    if (customerCode != null && Box3.status == AppStatus.loggedIn) {
      requestData['CustomerCode'] = customerCode;
    }
    if (validationValue != null) {
      requestData['IDNO'] = validationValue;
    }
    requestData['DocType'] = documentUploadType;

    if (compressedFile != null) {
      requestData['Key'] = await MultipartFile.fromFile(compressedFile.path,
          filename: compressedFile.name);
    } else {
      requestData['Key'] =
          await MultipartFile.fromFile(file.path, filename: file.name);
    }
    if (referenceNumber != null) {
      requestData['REFNO'] = referenceNumber;
    }

    Response? response = await _client.postMedia(
      NetworkConstant.uploadMedia,
      formData: FormData.fromMap(requestData),
    );

    return response?.statusCode == 200;
  }

  Future<RegisterDeviceFZ?> sendStatementOnMail(
      String base64, String fileName) async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "ClientCode": Box3.companyDataFZ?.clientCode,
      "EnvironmentCode": Box3.environmentCode ?? "1",
      "IpAddress": Box3.appIPAddress,
      "Data": {
        "CustomerCode": customerCode ?? '',
        "CustomerName": Box3.customerDetailsFZ?.data?.name,
        "CustomerEmail": Box3.customerDetailsFZ?.data?.email,
        "ReceiptBase64String": base64,
        "ReceiptFileName": fileName
      }
    };
    Response? r = await _client.post(
      path: APIEndPoints.sendReceiptAsEmail,
      data: data,
    );
    return RegisterDeviceFZ.fromJson(r?.data);
  }

  Future<bool> uploadMediaDocumentNew(
      {required String? validationValue,
      required XFile file,
      required String documentUploadType,
      String? referenceNumber,
      String? documentType,
      String? customerCode,
      String? action,
      String? documentId,
      bool? isAfterSignUp}) async {
    var data = {
      'Token': '${Box3.appKeyToken}',
      "IPAddress": '${Box3.appIPAddress}',
      'IdNumber': validationValue ?? '34600056',
      'Documents[0].DocumentId': documentId ?? '',
      'Documents[0].DocumentName': documentUploadType,
      'Documents[0].Action': action ?? 'INSERT',
      'Documents[0].Status': 'A',
      'Documents[0].DocumentType': documentType ?? 'image'
    };

    XFile? compressedFile;

    if (documentUploadType == 'VIDEO_KYC') {
      var compressed =
          await VideoCompressor.compressToMaxSize(file, maxSizeInKB: 1024);
      if (compressed != null) {
        compressedFile = compressed;
        if (kDebugMode) {
          print('compressed video path: ${compressed.path}');
        }
      } else {
        if (kDebugMode) {
          Get.showSnackbar(GetSnackBar(
              message: 'compression failed or video too large.',
              duration: Duration(seconds: 4)));
          return false;
        }
      }
    } else if (documentUploadType != 'EMAIL') {
      var compressed =
          await ImageCompress.compressToUnder100KB(File(file.path));
      if (compressed != null) {
        compressedFile = compressed;
        if (kDebugMode) {
          print('compressed image path: ${compressed.path}');
        }
      } else {
        if (kDebugMode) {
          Get.showSnackbar(GetSnackBar(
            message: 'compression failed or image too large.',
            duration: Duration(seconds: 4),
          ));
          return false;
        }
      }
    }

    if (customerCode != null) {
      data['CustomerCode'] = customerCode;
    }
    if (validationValue != null) {
      data['IdNumber'] = validationValue;
    }
    if (compressedFile != null) {
      file = compressedFile;
    }
    debugPrint(data.toString());

    bool? response = await _client.postMediaNew(
        // isAfterSignUp == true
        //     ? APIEndPoints.uploadcustomerdocuments :
        APIEndPoints.postDocumentUpload,
        data: data,
        file: File(file.path));

    return response ?? false;
  }

  Future<List<MasterResponseFZ>> purposes(
      {String? serviceProviderCode,
      String? beneficiaryBankCode,
      required String serviceCategoryCode,
      required String serviceCountryCode,
      required String serviceCurrencyCode}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": "EN",
      "Data": {
        "BeneficiaryBankCode": beneficiaryBankCode ?? "",
        "ServiceProviderCode": serviceProviderCode ?? "",
        "ServiceCountryCode": serviceCountryCode,
        "ServiceCurrencyCode": serviceCurrencyCode,
        "ServiceCategoryCode": serviceCategoryCode,
      },
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(path: APIEndPoints.getPurpose, data: data);
    if (r?.data['StatusCode'] == 'CC-SUCC' ||
        r?.data['StatusCode'] == 'RMA-SUCC') {
      return (r!.data['Data'] as List<dynamic>)
          .map((e) => MasterResponseFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<MasterResponseFZ>> getServiceProvider(
      {required String? countryCode,
      required String? currencyCode,
      required String? serviceCategoryCode}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "Data": {
        "ServiceCountryCode": countryCode,
        "ServiceCurrencyCode": currencyCode,
        "ServiceCategoryCode": serviceCategoryCode
      },
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.listserviceprovider, data: data);
    if (r?.data['StatusCode'] == 'CC-SUCC') {
      if (r!.data['Data']['ServiceProvider'] != null) {
        return (r.data['Data']['ServiceProvider'] as List<dynamic>)
            .map((e) => MasterResponseFZ.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>?> rateCalculator(
      {required double amount, required String toCurrency}) async {
    var data = {
      "AmountType": "L",
      "Amount": "$amount",
      "ServiceCategoryCode": "B",
      "ServiceCurrencyCode": "INR",
      "ServiceCountryCode": "IN",
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(
        path: APIEndPoints.rateCalculator, data: data, exclude: true);
    if (r?.data['StatusCode'] == 'CC-SUCC') {
      debugPrint(r?.data);
      return r!.data['Data']['RateDetails'];
    } else {
      return null;
    }
  }

  Future<RateCalculatorFz?> guestRate(
      {required String type,
      required String amount,
      String? serviceCategoryCode,
      String? currency = "USD"}) async {
    var data = {
      "AmountType": type,
      "Amount": amount,
      "ServiceCategoryCode": serviceCategoryCode ?? "B",
      "ServiceCurrencyCode":
          (currency == "" || currency == null) ? "USD" : currency,
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(
        path: APIEndPoints.rateCalculator, exclude: true, data: data);
    if (r?.data['StatusCode'] == 'CC-SUCC') {
      Map<String, dynamic> m = r?.data['Data']['RateDetails'];
      m['curCode'] = m['CurrencyCode'] ?? currency;
      m['rcvCurrency'] = m['rcvCurrency'] ?? currency;
      return RateCalculatorFz.fromJson(m);
    } else if (r?.data['StatusCode'] == '401') {
      errorAlert(content: r?.data['StatusMessage']);
      return null;
    } else {
      return null;
    }
  }

  Future<RateChargeFz?> getRateCharge({
    required String amount,
    String amountType = 'F',
    required String currencyCode,
    required String countryCode,
    required String serviceType,
    required String beneficiaryCode,
    required String beneficiaryBankCode,
    String? stateCode = '',
    String? cityCode = '',
    String? agentCode = '',
    String? agentBranchCode = '',
    Offer? offer,
  }) async {
    Response? r = await _client.post(path: APIEndPoints.getratesCharges, data: {
      "Token": Box3.appKeyToken,
      "Data": {
        "CustomerCode": customerCode,
        "AmountType": amountType,
        "Amount": amount,
        "ServiceCurrencyCode": currencyCode,
        "ServiceCountryCode": countryCode,
        "ServiceCategoryCode": serviceType,
        "BeneficiaryCode": beneficiaryCode,
        "BeneficiaryBankCode": beneficiaryBankCode,
        "StateCode": stateCode,
        "CityCode": cityCode,
        "AgentCode": agentCode,
        "AgentBranchCode": agentBranchCode,
        if (offer != null)
          "Offer": {
            "PromoCode": offer.promoCode ?? "",
            "LoyaltyType": offer.loyaltyType ?? "",
            "LoyaltyValue": offer.loyaltyValue ?? "",
            "RewardAs": offer.rewardsAs ?? "",
            "DiscountAs": offer.discountAs ?? "",
          }
      },
      "IPAddress": Box3.appIPAddress
    });
    if (r?.data['StatusCode'] == 'CC-SUCC') {
      return RateChargeFz.fromJson(r?.data);
    } else if (r?.data['Data']?['MessageCode'] == '411') {
      errorAlert(content: r?.data['Data']['MessageDetails']);
      return null;
    } else {
      return null;
    }
  }

  Future<List<DrawingBankBV>> getOrganisationBanking() async {
    Response? r = await _client.post(
        path: NetworkConstant.getOrganisationBanking, exclude: true);
    return r?.data['StatusCode'] == 'SCFG001' &&
            r?.data['OutputBody']['RootNode']['statusCode'] == '200'
        ? (r!.data['OutputBody']['RootNode']['response'] as List<dynamic>)
            .map((e) => DrawingBankBV.fromMap(e)!)
            .toList()
        : [];
  }

  Future<bool> setlogincredentials({
    required String validationValue,
    required String password,
    required String mpin,
    required String email,
    required String userName,
    required String uuid,
  }) async {
    Response? r =
        await _client.post(path: NetworkConstant.setLoginCredentials, data: {
      "deviceType": deviceType,
      "deviceId": deviceId,
      "validationType": "ID No",
      "validationValue": validationValue,
      "password": password,
      "mPin": mpin,
      "email": email,
      "uuId": uuid,
      "username": userName,
      "setCredential": "Y"
    });
    return r?.data['StatusCode'] == 'SCFG001' &&
        r?.data['OutputBody']['RootNode']['statusCode'] == '200';
  }

  Future<bool> setLoginCredentialsUAEPass({
    required String validationValue,
    required String email,
    required String uuid,
    String? password,
    String? mpin,
    required String userName,
  }) async {
    Response? r =
        await _client.post(path: NetworkConstant.setLoginCredentials, data: {
      "deviceType": deviceType,
      "deviceId": deviceId,
      "validationType": "ID No",
      "validationValue": validationValue,
      "email": email,
      "uuId": uuid,
      "setCredential": "N",
      "password": password ?? '',
      "mPin": mpin ?? '',
      "username": userName,
    });
    return r?.data['StatusCode'] == 'SCFG001' &&
        r?.data['OutputBody']['RootNode']['statusCode'] == '200';
  }

  Future<String?> validateDevice() async {
    Response? r =
        await _client.post(path: NetworkConstant.validateDevice, data: {
      "deviceType": deviceType,
      "deviceId": deviceId,
    });
    return r?.data['StatusCode'] == 'SCFG001'
        ? r?.data['OutputBody']['RootNode']['statusCode'] as String
        : null;
  }

  Future<Map<String, dynamic>> validateCredentials(String mpin) async {
    Response? r = await _client.post(
      path: NetworkConstant.validateCredentials,
      data: {
        "Token": Box3.appKeyToken ?? '',
        "deviceId": deviceId,
        "Data": {"CredentialType": "MPIN", "CredentialValue": mpin},
        "DeviceTypeDetails": [
          {"DeviceType": deviceType, "DeviceId": deviceId}
        ],
        "IPAddress": Box3.appIPAddress
      },
    );
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? {
            "isSucc": true,
            "MessageCode": r?.data['Data']['MessageCode'] ?? '',
            "message": CustomMessageDetailsFZ.fromJson(
                r?.data['CustomMessageDetails']),
          }
        : {
            "isSucc": false,
            "MessageCode": r?.data['Data']['MessageCode'] ?? '',
            "message": CustomMessageDetailsFZ.fromJson(
                r?.data['CustomMessageDetails']),
          };
  }

  Future<String?> validateIdRegistration(
      String nationalId, bool validateInSameDevice) async {
    Response? r =
        await _client.post(path: NetworkConstant.validateIdRegistration, data: {
      "deviceType": deviceType,
      "deviceId": deviceId,
      "nationalId": nationalId,
      "validateInSameDevice": validateInSameDevice
    });
    return r?.data['StatusCode'] == 'SCFG001'
        ? r?.data['OutputBody']['RootNode']['statusCode'] as String
        : null;
  }

  Future<List<AdvertisementList>> promotions(
      {String advertisementCode = ""}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "AdvertisementCode": advertisementCode,
      "IPAddress": Box3.appIPAddress
    };

    Response? r = await _client.post(
        path: NetworkConstant.promotions, data: data, exclude: true);

    if (r?.data["Data"] != null &&
        r?.data["Data"]["AdvertisementList"] != null) {
      return (r?.data["Data"]["AdvertisementList"] as List)
          .map((e) => AdvertisementList.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<NewsFZ>> news({String newsCode = ""}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "Code": newsCode,
      "IPAddress": Box3.appIPAddress
    };
    Response? r = await _client.post(
        path: NetworkConstant.news, data: data, exclude: true);

    if (r!.data['StatusCode'] == 'RMA-SUCC' &&
        r.data["Data"]["NewsList"] != null) {
      return (r.data["Data"]["NewsList"] as List)
          .map((e) => NewsFZ.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<String?> privacypolicy() async {
    Response? r = await _client.post(
      path: NetworkConstant.privacyPolicy,
      exclude: true,
      data: {
        "Token": Box3.appKeyToken,
        "LanguageCode": Box3.lang?.Code ?? "EN",
        "IPAddress": Box3.appIPAddress
      },
    );
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? r?.data['Data']['PrivacyPolicyDetails'][0]["Description"] as String?
        : null;
  }

  Future<String?> termsAndConditions() async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "IPAddress": Box3.appIPAddress
    };

    Response? r = await _client.post(
        path: NetworkConstant.termsAndConditions, exclude: true, data: data);
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? r?.data['Data']['TermsAndConditionDetails'][0]["Description"]
        : null;
  }

  Future<String?> aboutUs() async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "Code": "",
      "IPAddress": Box3.appIPAddress
    };

    Response? r = await _client.post(
        path: NetworkConstant.aboutUs, exclude: true, data: data);
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? r?.data['Data']['AboutUsList'][0]["Description"]
        : null;
  }

  Future<bool> resetPassword(
      {required String validationValue, required String password}) async {
    Response? r = await _client
        .post(path: NetworkConstant.resetPassword, exclude: true, data: {
      "deviceType": deviceType,
      "deviceId": deviceId,
      "validationType": 'ID No',
      "validationValue": validationValue,
      "password": password,
      "mPin": "",
      "email": ""
    });
    return r?.data['StatusCode'] == 'SCFG001' &&
        r?.data['OutputBody']['RootNode']['statusCode'] == '200';
  }

  Future<bool> resetMpin(
      {required String validationValue, required String mpin}) async {
    Response? r = await _client
        .post(path: NetworkConstant.resetMPIN, exclude: true, data: {
      "validationType": 'ID No',
      "validationValue": validationValue,
      "deviceId": deviceId,
      "deviceType": deviceType,
      "mpin": mpin
    });
    return r?.data['StatusCode'] == 'SCFG001' &&
        r?.data['OutputBody']['RootNode']['statusCode'] == '200';
  }

  Future<RegisterDeviceFZ?> createOTP(String module,
      {String? mobile, String? email, String? nid}) async {
    Response? r = await _client.post(
      path: APIEndPoints.rmaCreateOtp,
      exclude: true,
      data: {
        "Token": Box3.appKeyToken,
        "LanguageCode": Box3.lang?.Code ?? 'EN',
        "Data": {
          if (email == null) "Mobile": Box3.customerDetailsFZ?.data?.mobileNo,
          if (email != null) "Email": email,
          "Type": module
        },
        "IPAddress": Box3.appIPAddress
      },
    );
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? RegisterDeviceFZ.fromJson(r!.data)
        : null;
  }

  Future<bool> createOTPIDVerification(String module,
      {String? mobile, String? nid}) async {
    Response? r = await _client.post(
      path: NetworkConstant.createOTP,
      exclude: true,
      data: {
        "module": module,
        "deviceId": deviceId,
        "mobile":
            '${Box3.countryCode}${mobile ?? Box3.customerDetailsFZ?.data!.mobileNo}',
        "nationalId": nid ?? Box3.customerDetailsFZ?.data!.mobileNo,
        "deviceType": deviceType
      },
    );
    return r?.data['OutputBody']['RootNode']['statusCode'] == '200';
  }

  Future<bool> checkUAEPASSInstalled() async {
    String? appPackage;
    bool? isInstalledUAEPass;
    if (Platform.isAndroid) {
      if (AppConfigs.env != Environment.prod) {
        appPackage = 'ae.uaepass.mainapp.stg';
      } else {
        appPackage = 'ae.uaepass.mainapp';
      }
    } else if (Platform.isIOS) {
      if (AppConfigs.env != Environment.prod) {
        appPackage = 'uaepassstg://';
      } else {
        appPackage = 'uaepass://';
      }
    }
    if (Platform.isAndroid) {
      isInstalledUAEPass = await AppCheck().isAppInstalled(appPackage ?? '');
    } else if (Platform.isIOS) {
      try {
        var appInfo = await AppCheck().checkAvailability(appPackage ?? '');
        if (appInfo != null) {
          if (AppConfigs.env != Environment.prod) {
            if (appInfo.packageName.contains("uaepassstg") == true) {
              appPackage = 'uaepassstg://';
              isInstalledUAEPass = true;
            } else {
              isInstalledUAEPass = false;
            }
          } else {
            if (appInfo.packageName.contains("uaepass") == true) {
              appPackage = 'uaepass://';
              isInstalledUAEPass = true;
            } else {
              isInstalledUAEPass = false;
            }
          }
        } else {
          isInstalledUAEPass = false;
        }
      } catch (e) {
        isInstalledUAEPass = false;
      }
    }
    return isInstalledUAEPass ?? false;
  }

  Future<List<FetchUAEPassDoc>?> openUAEPassDoc(
      {required String token,
      required String emiratesID,
      required String documentType,
      required String uuid}) async {
    String? appPackage;
    bool? isInstalledUAEPass;
    if (Platform.isAndroid) {
      if (AppConfigs.env != Environment.prod) {
        appPackage = 'ae.uaepass.mainapp.stg';
      } else {
        appPackage = 'ae.uaepass.mainapp';
      }
    } else if (Platform.isIOS) {
      if (AppConfigs.env != Environment.prod) {
        appPackage = 'uaepassstg://';
      } else {
        appPackage = 'uaepass://';
      }
    }
    if (Platform.isAndroid) {
      isInstalledUAEPass = await AppCheck().isAppInstalled(appPackage ?? '');
    } else if (Platform.isIOS) {
      try {
        var appInfo = await AppCheck().checkAvailability(appPackage ?? '');
        if (appInfo != null) {
          if (AppConfigs.env != Environment.prod) {
            if (appInfo.packageName.contains("uaepassstg") == true) {
              appPackage = 'uaepassstg://';
              isInstalledUAEPass = true;
            } else {
              isInstalledUAEPass = false;
            }
          } else {
            if (appInfo.packageName.contains("uaepass") == true) {
              appPackage = 'uaepass://';
              isInstalledUAEPass = true;
            } else {
              isInstalledUAEPass = false;
            }
          }
        } else {
          isInstalledUAEPass = false;
        }
      } catch (e) {
        isInstalledUAEPass = false;
      }
    }

    Map<String, dynamic> myData = {};
    documentType.isNotEmpty == true
        ? myData = {
            "authToken": token,
            "requestedDocuments": [
              {"documentType": "EmiratesId", "required": false},
              {"documentType": documentType, "required": false}
            ],
            "emiratesId": emiratesID,
            "uuId": uuid,
            "successUrl": "sharafExchangeDoc://success",
            "failureUrl": "sharafExchangeDoc://failure",
            "origin": isInstalledUAEPass == true ? "MOBILE" : "WEB"
          }
        : myData = {
            "authToken": token,
            "requestedDocuments": [
              {"documentType": "EmiratesId", "required": false}
            ],
            "emiratesId": emiratesID,
            "uuId": uuid,
            "successUrl": "sharafExchangeDoc://success",
            "failureUrl": "sharafExchangeDoc://failure",
            "origin": isInstalledUAEPass == true ? "MOBILE" : "WEB"
          };
    Response? r = await _client.post(
        path: NetworkConstant.getUserDocumentDetails,
        exclude: true,
        data: myData);
    String? pop =
        r?.data['OutputBody']?['RootNode']?['proofOfPresentationRequestId'];
    String? androidUrl =
        r?.data['OutputBody']?['RootNode']?['transitionUrlAndroid'];
    String? iOSUrl = r?.data['OutputBody']?['RootNode']?['transitionUrlIOS'];

    if (pop != null) {
      if (isInstalledUAEPass == true) {
        if (Platform.isAndroid) {
          if (kDebugMode) {
            print("$androidUrl");
          }
          if (await canLaunchUrl(Uri.parse(androidUrl!))) {
            launchUrl(Uri.parse(androidUrl),
                mode: LaunchMode.externalApplication);
          }
        }
        if (Platform.isIOS) {
          if (kDebugMode) {
            print("$iOSUrl");
          }
          if (await canLaunchUrl(Uri.parse(iOSUrl!))) {
            launchUrl(Uri.parse(iOSUrl), mode: LaunchMode.externalApplication);
          }
        }
      }
    }
    return null;
  }

  Future<List<FetchUAEPassDoc>?> getUserDocumentDetails(
      {required String token,
      required String emiratesID,
      required String documentType,
      required String uuid,
      bool isError = false}) async {
    String? appPackage;
    bool? isInstalledUAEPass;
    if (Platform.isAndroid) {
      if (AppConfigs.env != Environment.prod) {
        appPackage = 'ae.uaepass.mainapp.stg';
      } else {
        appPackage = 'ae.uaepass.mainapp';
      }
    } else if (Platform.isIOS) {
      if (AppConfigs.env != Environment.prod) {
        appPackage = 'uaepassstg://';
      } else {
        appPackage = 'uaepass://';
      }
    }
    if (Platform.isAndroid) {
      isInstalledUAEPass = await AppCheck().isAppInstalled(appPackage ?? '');
    } else if (Platform.isIOS) {
      try {
        var appInfo = await AppCheck().checkAvailability(appPackage ?? '');
        if (appInfo != null) {
          if (AppConfigs.env != Environment.prod) {
            if (appInfo.packageName.contains("uaepassstg") == true) {
              appPackage = 'uaepassstg://';
              isInstalledUAEPass = true;
            } else {
              isInstalledUAEPass = false;
            }
          } else {
            if (appInfo.packageName.contains("uaepass") == true) {
              appPackage = 'uaepass://';
              isInstalledUAEPass = true;
            } else {
              isInstalledUAEPass = false;
            }
          }
        } else {
          isInstalledUAEPass = false;
        }
      } catch (e) {
        isInstalledUAEPass = false;
      }
    }

    Map<String, dynamic> myData = {};
    documentType.isNotEmpty == true
        ? myData = {
            "authToken": token,
            "requestedDocuments": [
              {"documentType": "EmiratesId", "required": false},
              {"documentType": documentType, "required": false}
            ],
            "emiratesId": emiratesID,
            "uuId": uuid,
            "successUrl": "sharafExchangeDoc://success",
            "failureUrl": "sharafExchangeDoc://failure",
            "origin": isInstalledUAEPass == true ? "MOBILE" : "WEB"
          }
        : myData = {
            "authToken": token,
            "requestedDocuments": [
              {"documentType": "EmiratesId", "required": false}
            ],
            "emiratesId": emiratesID,
            "uuId": uuid,
            "successUrl": "sharafExchangeDoc://success",
            "failureUrl": "sharafExchangeDoc://failure",
            "origin": isInstalledUAEPass == true ? "MOBILE" : "WEB"
          };
    Response? r = await _client.post(
        path: NetworkConstant.getUserDocumentDetails,
        exclude: true,
        data: myData);
    String? pop =
        r?.data['OutputBody']?['RootNode']?['proofOfPresentationRequestId'];
    String? androidUrl =
        r?.data['OutputBody']?['RootNode']?['transitionUrlAndroid'];
    String? iOSUrl = r?.data['OutputBody']?['RootNode']?['transitionUrlIOS'];

    if (pop == null) {
      return null;
    } else {
      List<FetchUAEPassDoc>? map = [];
      int count = 0;
      String? fetched;

      if (isInstalledUAEPass == true) {
        if (Platform.isAndroid) {
          if (kDebugMode) {
            print("$androidUrl");
          }
          if (await canLaunchUrl(Uri.parse(androidUrl!))) {
            launchUrl(Uri.parse(androidUrl),
                mode: LaunchMode.externalApplication);
          }
        }
        if (Platform.isIOS) {
          if (kDebugMode) {
            print("$iOSUrl");
          }
          if (await canLaunchUrl(Uri.parse(iOSUrl!))) {
            launchUrl(Uri.parse(iOSUrl), mode: LaunchMode.externalApplication);
          }
        }
      }

      while (count < 60 && fetched != "Y" && fetched != "N" && fetched != "I") {
        count += 1;
        map = await fetchUAEPassDoc(pop);
        fetched = map?.firstOrNull?.reqAuthorized ?? '';
        var notificationTime = map?[0].notificationExpiry?.toLocal();
        var currentTime = DateTime.now().toLocal();
        if (map?[0].reqAuthorized == 'P' &&
            notificationTime!.isBefore(currentTime)) {
          count = 60;
        }
        await Future.delayed(const Duration(seconds: 10));
      }
      if (fetched == 'Y' || fetched == 'I' || fetched == 'N') {
        return map;
      } else if (fetched == 'P') {
        var notificationTime = map?[0].notificationExpiry?.toLocal();
        var currentTime = DateTime.now().toLocal();
        if (map?[0].reqAuthorized == 'P' &&
            notificationTime!.isBefore(currentTime)) {
          return map;
        }
      } else {
        return null;
      }
    }
    return null;
  }

  Future<bool> validateUUID(String emiratesID, String uuid) async {
    Response? r = await _client.post(
        path: NetworkConstant.validateUUID,
        data: {"emiratesId": emiratesID, "uuId": uuid});
    return r?.data['OutputBody']['RootNode'][0]['Result'] == 'Y';
  }

  Future<ComplaintBV?> resendOTP(
      {required String validationType, required String validationValue}) async {
    Response? r = await _client.post(path: NetworkConstant.resendOTP, data: {
      "validationType": "ID No",
      "validationValue": validationValue,
      "deviceId": deviceId,
      "deviceType": deviceType,
    });
    return r?.data['StatusCode'] == 'SCFG001'
        ? ComplaintBV.fromMap(r!.data['OutputBody']['RootNode'])
        : null;
  }

  Future<RegisterDeviceFZ?> resendOtpRequest(
      {required String idNo,
      String mobile = "",
      String userIdentification = ""}) async {
    Response? r = await _client.post(path: NetworkConstant.resendOTPRma, data: {
      "Token": Box3.appKeyToken,
      "Data": {
        "IdNo": idNo,
        "Mobile": mobile,
        "UserIdentification": userIdentification
      },
      "IPAddress": Box3.appIPAddress
    });
    return r?.data['StatusCode'] == 'RMA-SUCC'
        ? RegisterDeviceFZ.fromJson(r!.data)
        : null;
  }

  Future<ComplaintBV?> createMailOTP(
      {String? email, String? phone, String? nationalId}) async {
    Response? r =
        await _client.post(path: NetworkConstant.createMailOTP, data: {
      "mobileNo": phone,
      "email": email,
      "nationalId": nationalId,
      "module": 'CustInfo',
      'deviceType': deviceType,
      "deviceId": deviceId,
    });

    return r?.data['StatusCode'] == 'SCFG001'
        ? ComplaintBV.fromMap(r!.data['OutputBody']['RootNode'])
        : null;
  }

  Future<ComplaintBV?> validateCustomerInfo({
    String? idNo,
    String? idExpiry,
    String? dob,
  }) async {
    Response? r = await _client
        .post(path: NetworkConstant.validateCustomerInformation, data: {
      "validateFieldType1": 'IDNO',
      "validateFieldValue1": idNo,
      "validateFieldType2": 'IDEXPIRY',
      "validateFieldValue2": idExpiry,
      "validateFieldType3": 'DOB',
      'validateFieldValue3': dob,
      "deviceId": deviceId,
    });

    return r?.data['StatusCode'] == 'SCFG001'
        ? ComplaintBV.fromMap(r!.data['OutputBody']['RootNode'])
        : null;
  }

  Future<bool> checkUsername(String username) async {
    var data = {
      "Token": Box3.appKeyToken,
      "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
      "UserName": username,
      "IdNo": Box3.customerDetailsFZ?.data?.idNo,
      "DeviceTypeDetails": [
        {"DeviceType": deviceType, "DeviceId": deviceId}
      ],
      "IPAddress": Box3.appIPAddress
    };
    var r = await _client.post(path: APIEndPoints.validateUserName, data: data);
    print(r?.data.toString());
    if (r?.data['StatusCode'] == "636") {
      if (Get.isDialogOpen == true) Get.back();
      apiAlertDialog(message: r!.data['StatusMessage'].toString());
      return false;
    }
    return r?.data['StatusCode'] == 'RMA-NODATAFOUND';
  }

  Future<List<FetchUAEPassDoc>?> fetchUAEPassDoc(
      String proofOfPresentationRequestId) async {
    Response? r = await _client.post(
        path: NetworkConstant.fetchUAEPassDoc,
        data: {"proofOfPresentationRequestId": proofOfPresentationRequestId});

    return r?.data['StatusCode'] == 'SCFG001' &&
            r!.data['OutputBody']['RootNode']['Response'] is List<dynamic>
        ? (r.data['OutputBody']['RootNode']['Response'] as List<dynamic>)
            .map((e) => FetchUAEPassDoc.fromJson(e))
            .toList()
        : [];
  }

  Future<List<FetchUAEPassDoc>?> fetchUAEPassDocUUIDEID(
      {required String uuID, required String eID}) async {
    Response? r = await _client.post(
        path: NetworkConstant.fetchUAEPassDoc,
        data: {"emiratesId": eID, "uuId": uuID});

    return r?.data['StatusCode'] == 'SCFG001' &&
            r!.data['OutputBody']['RootNode']['Response'] is List<dynamic>
        ? (r.data['OutputBody']['RootNode']['Response'] as List<dynamic>)
            .map((e) => FetchUAEPassDoc.fromJson(e))
            .toList()
        : [];
  }

  String? checkDAPIOrDebitBank() {
    TransferController t = Get.find<TransferController>();
    if (t.gateWay?.type == 'D' &&
        t.gateWay?.description == 'Instant Bank Transfer') {
      return 'DAPI';
    } else if (t.gateWay?.type == 'D') {
      return (t.selectedDebitBank!.paymentModeKey);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> createUaePassToken(
      {required Map<String, String> data,
      required Map<String, String> header}) async {
    Response? r = await _client.postUAEPASS(
        data: data,
        header: header,
        url: NetworkConstant.createUaePassAccessToken,
        method: 'POST');
    return r?.data;
  }

  Future<UaePassProfileFz?> getUserInfoUaePass(
      {required Map<String, String> header}) async {
    Response? r = await _client.postUAEPASS(
        header: header, url: NetworkConstant.getUaePassUserInfo, method: 'GET');
    return UaePassProfileFz.fromJson(r?.data);
  }

  Future<dynamic> setForexRate(
      {required String currencyCode,
      required String amount,
      required String date,
      required String remarks,
      required String createdBy}) async {
    Response? r =
        await _client.post(path: APIEndPoints.postRateBookingRequest, data: {
      "Action": "INSERT",
      "RequestId": "1",
      "CustomerCode": customerCode,
      "CurrencyCode": currencyCode,
      "TransactionAmount": amount,
      "DateOfPurchase": date,
      "Status": "A",
      "Remarks": remarks,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "Token": Box3.appKeyToken,
      "IPAddress": Box3.appIPAddress
    });
    return r?.data['StatusCode'] == 'RMA-SUCC' ||
            r?.data['StatusCode'] == 'RMA-FAILED'
        ? CustomMessageDetailsFZ.fromJson(r?.data['CustomMessageDetails'])
        : null;
  }

  Future<FormRulesResponseFZ?> getFormRuleNew(
      {required String formName,
      String? moduleName = '41',
      String? criteriaMap}) async {
    Map<String, dynamic> formMap = {
      "MainToken": Box3.appKeyToken,
      "ModuleName": moduleName,
      "Form": formName,
      "ClientCode": Box3.companyDataFZ?.clientCode,
      "LicenseCountry": Box3.companyDataFZ?.licenseCountry ?? "Any",
      "Applications": "4",
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "UserId": Box3.companyDataFZ?.userId ?? "vidya",
      "CriteriaMap":
          "licenceCountry = ${Box3.companyDataFZ?.licenseCountry ?? 'Any'};${criteriaMap ?? ''}"
    };
    Response? res =
        await _client.post(path: APIEndPoints.getFormRules, data: formMap);
    if (res != null && res.data['StatusCode'] == "RMA-SUCC") {
      return FormRulesResponseFZ.fromJson(res.data);
    }
    return null;
  }

  Future<SettingsFZ?> getSettingsNew() async {
    try {
      Response? r;
      if (AppConfigs.fetchNewConfig) {
        r = await _client.admin
            .post(APIEndPoints.getApplicationSettings, data: {
          'Token': Box3.appKeyToken,
          'EnvironmentCode': Box3.environmentCode ?? "1",
          "IPAddress": Box3.appIPAddress
        });
      }
      var tempList = (r!.data['StatusCode'] == '000' &&
              r.data["Data"] != null &&
              r.data["Data"]["Settings"] != null)
          ? (r.data["Data"]["Settings"] as List<dynamic>)
              .map((e) => TempSettings.fromJson(e))
              .toList()
          : [];
      Map<dynamic, dynamic> temp = {};
      for (var f in tempList) {
        if (f.parameterValue == "TRUE" || f.parameterValue == "YES") {
          temp[f.parameterKey] = true;
        } else if (f.parameterValue == "FALSE" || f.parameterValue == "NO") {
          temp[f.parameterKey] = false;
        } else {
          temp[f.parameterKey] = f.parameterValue;
        }
      }
      if (kDebugMode) {
        print(temp);
      }
      String myTemp = json.encode(temp);
      SettingsFZ? settings = SettingsFZ.fromJson(json.decode(myTemp));
      return settings;
    } catch (e, s) {
      print("🔴 ERROR in getSettingsNew()");
      print("Exception: $e");
      print("StackTrace: $s");

      return null;
    }
  }

  Future<Cms?> getCMS({String? code}) async {
    try {
      var data = {
        "Token": Box3.appKeyToken,
        "Code": code ?? "",
        "LanguageCode": Box3.lang?.Code ?? "EN",
        "IPAddress": Box3.appIPAddress
      };
      var res = await _client.post(path: APIEndPoints.getCMS, data: data);
      Cms? cmsList =
          (res!.data['StatusCode'] == 'RMA-SUCC' && res.data["Data"] != null)
              ? Cms.fromJson(res.data['Data'])
              : null;
      return cmsList;
    } catch (e) {
      return null;
    }
  }

  Future<List<ModuleList>> getNotificationModules() async {
    var data = {"Token": Box3.appKeyToken, "IPAddress": Box3.appIPAddress};
    Response? r = await _client.post(
        path: APIEndPoints.notificationModuleType, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'RMA-SUCC' &&
        r.data["ModuleList"] != null) {
      return (r.data["ModuleList"] as List<dynamic>)
          .map((e) => ModuleList.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<EventType>> getNotificationEvent() async {
    var data = {"Token": Box3.appKeyToken, "IPAddress": Box3.appIPAddress};
    Response? r =
        await _client.post(path: APIEndPoints.inAppNotification, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'RMA-SUCC' &&
        r.data["EventType"] != null) {
      return (r.data["EventType"] as List<dynamic>)
          .map((e) => EventType.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<List<NotificationFz>> getNotificationAlert(
      {required String moduleCode,
      required String eventTypeCode,
      required String languageCode}) async {
    var data = {
      "Token": Box3.appKeyToken,
      "ModuleCode": moduleCode,
      "EventType": eventTypeCode,
      "LanguageCode": languageCode,
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.inAppNotification, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'RMA-SUCC' &&
        r.data["NotificationsList"] != null) {
      return (r.data["NotificationsList"] as List<dynamic>)
          .map((e) => NotificationFz.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> openUrl(String url) async {
    var uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<CompanyDataFZ?> getCompanySettings() async {
    var data = {
      "Token": Box3.appKeyToken,
      "LanguageCode": Box3.lang?.Code ?? "EN",
      "IPAddress": Box3.appIPAddress
    };
    Response? r =
        await _client.post(path: APIEndPoints.companySettings, data: data);
    if (r != null &&
        r.data['StatusCode'] == 'RMA-SUCC' &&
        r.data["Data"] != null) {
      return CompanyDataFZ.fromJson(r.data["Data"]);
    } else {
      return null;
    }
  }

  Future<String?> getPublicIpAddress() async {
    try {
      final response = await _client.dioIpAddress.get('https://api.ipify.org');
      if (response.statusCode == 200) {
        debugPrint("IP Address${response.data}");
        return response.data.toString();
      } else {
        return null;
      }
    } on DioException catch (e) {
      debugPrint(e.toString());
      return null;
    } catch (e) {
      debugPrint('Unexpected Error: $e');
      return null;
    }
  }
}
