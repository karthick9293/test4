// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_data_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyDataFZ _$CompanyDataFZFromJson(Map<String, dynamic> json) =>
    _CompanyDataFZ(
      clientCode: json['ClientCode'] as String? ?? '',
      licenseCountry: json['LicenseCountry'] as String? ?? '',
      userId: json['UserId'] as String?,
      companySettings: json['CompanySettings'] == null
          ? null
          : CompanySettings.fromJson(
              json['CompanySettings'] as Map<String, dynamic>),
      accountsSettings: json['AccountsSettings'] == null
          ? null
          : AccountsSettings.fromJson(
              json['AccountsSettings'] as Map<String, dynamic>),
      forexSettings: json['ForexSettings'] == null
          ? null
          : ForexSettings.fromJson(
              json['ForexSettings'] as Map<String, dynamic>),
      incomingSettings: json['IncomingSettings'] == null
          ? null
          : IncomingSettings.fromJson(
              json['IncomingSettings'] as Map<String, dynamic>),
      mobileSettings: json['MobileSettings'] == null
          ? null
          : MobileSettings.fromJson(
              json['MobileSettings'] as Map<String, dynamic>),
      remittanceSettings: json['RemittanceSettings'] == null
          ? null
          : RemittanceSettings.fromJson(
              json['RemittanceSettings'] as Map<String, dynamic>),
      preciousMetalSettings: json['PreciousMetalSettings'] == null
          ? null
          : PreciousMetalSettings.fromJson(
              json['PreciousMetalSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyDataFZToJson(_CompanyDataFZ instance) =>
    <String, dynamic>{
      'ClientCode': instance.clientCode,
      'LicenseCountry': instance.licenseCountry,
      'UserId': instance.userId,
      'CompanySettings': instance.companySettings,
      'AccountsSettings': instance.accountsSettings,
      'ForexSettings': instance.forexSettings,
      'IncomingSettings': instance.incomingSettings,
      'MobileSettings': instance.mobileSettings,
      'RemittanceSettings': instance.remittanceSettings,
      'PreciousMetalSettings': instance.preciousMetalSettings,
    };

_PreciousMetalSettings _$PreciousMetalSettingsFromJson(
        Map<String, dynamic> json) =>
    _PreciousMetalSettings(
      clientCode: json['ClientCode'] as String? ?? '',
      prefixForPreciousMetalNumber:
          json['PrefixForPreciousMetalNumber'] as String? ?? '',
      ratePerOunce: json['RatePerOunce'] as String? ?? '',
      perOunceInGram: json['PerOunceInGram'] as String? ?? '',
      dualCounter: json['DualCounter'],
      updatedOn: json['UpdatedOn'] as String? ?? '',
    );

Map<String, dynamic> _$PreciousMetalSettingsToJson(
        _PreciousMetalSettings instance) =>
    <String, dynamic>{
      'ClientCode': instance.clientCode,
      'PrefixForPreciousMetalNumber': instance.prefixForPreciousMetalNumber,
      'RatePerOunce': instance.ratePerOunce,
      'PerOunceInGram': instance.perOunceInGram,
      'DualCounter': instance.dualCounter,
      'UpdatedOn': instance.updatedOn,
    };

_RemittanceSettings _$RemittanceSettingsFromJson(Map<String, dynamic> json) =>
    _RemittanceSettings(
      clientCode: json['ClientCode'] as String? ?? '',
      requiredDualCounter: json['RequiredDualCounter'] as String? ?? '',
      prefixForRemittanceRefNo:
          json['PrefixForRemittanceRefNo'] as String? ?? '',
      correspondentRouting: json['CorrespondentRouting'] as String? ?? '',
      autoRoutingTypeCode: json['AutoRoutingTypeCode'] as bool? ?? false,
      showRateViewInRemittance:
          json['ShowRateViewInRemittance'] as String? ?? '',
      allowNewCustomerAdditionFromRemittance:
          json['AllowNewCustomerAdditionFromRemittance'] as String? ?? '',
      allowCustomerProfileEditFromRemittance:
          json['AllowCustomerProfileEditFromRemittance'] as String? ?? '',
      allowBeneficiaryProfileEditFromRemittance:
          json['AllowBeneficiaryProfileEditFromRemittance'] as String? ?? '',
      allowSpecialRateRequestFromRemittance:
          json['AllowSpecialRateRequestFromRemittance'] as String? ?? '',
      allowBufferInRateToTeller:
          json['AllowBufferInRateToTeller'] as String? ?? '',
      allowOnAccountFacility: json['AllowOnAccountFacility'] as String? ?? '',
      allowSpecialDiscountRate:
          json['AllowSpecialDiscountRate'] as String? ?? '',
      allowCreditFacility: json['AllowCreditFacility'] as String? ?? '',
    );

Map<String, dynamic> _$RemittanceSettingsToJson(_RemittanceSettings instance) =>
    <String, dynamic>{
      'ClientCode': instance.clientCode,
      'RequiredDualCounter': instance.requiredDualCounter,
      'PrefixForRemittanceRefNo': instance.prefixForRemittanceRefNo,
      'CorrespondentRouting': instance.correspondentRouting,
      'AutoRoutingTypeCode': instance.autoRoutingTypeCode,
      'ShowRateViewInRemittance': instance.showRateViewInRemittance,
      'AllowNewCustomerAdditionFromRemittance':
          instance.allowNewCustomerAdditionFromRemittance,
      'AllowCustomerProfileEditFromRemittance':
          instance.allowCustomerProfileEditFromRemittance,
      'AllowBeneficiaryProfileEditFromRemittance':
          instance.allowBeneficiaryProfileEditFromRemittance,
      'AllowSpecialRateRequestFromRemittance':
          instance.allowSpecialRateRequestFromRemittance,
      'AllowBufferInRateToTeller': instance.allowBufferInRateToTeller,
      'AllowOnAccountFacility': instance.allowOnAccountFacility,
      'AllowSpecialDiscountRate': instance.allowSpecialDiscountRate,
      'AllowCreditFacility': instance.allowCreditFacility,
    };

_MobileSettings _$MobileSettingsFromJson(Map<String, dynamic> json) =>
    _MobileSettings(
      clientCode: json['ClientCode'] as String? ?? '',
    );

Map<String, dynamic> _$MobileSettingsToJson(_MobileSettings instance) =>
    <String, dynamic>{
      'ClientCode': instance.clientCode,
    };

_IncomingSettings _$IncomingSettingsFromJson(Map<String, dynamic> json) =>
    _IncomingSettings(
      prefixForIncomingRefNo: json['PrefixForIncomingRefNo'] as String? ?? '',
    );

Map<String, dynamic> _$IncomingSettingsToJson(_IncomingSettings instance) =>
    <String, dynamic>{
      'PrefixForIncomingRefNo': instance.prefixForIncomingRefNo,
    };

_ForexSettings _$ForexSettingsFromJson(Map<String, dynamic> json) =>
    _ForexSettings(
      prefixForForexRefNo: json['PrefixForForexRefNo'] as String? ?? '',
    );

Map<String, dynamic> _$ForexSettingsToJson(_ForexSettings instance) =>
    <String, dynamic>{
      'PrefixForForexRefNo': instance.prefixForForexRefNo,
    };

_AccountsSettings _$AccountsSettingsFromJson(Map<String, dynamic> json) =>
    _AccountsSettings(
      prefixForBankVoucherNumber:
          json['PrefixForBankVoucherNumber'] as String? ?? '',
      prefixForCashVoucherNumber:
          json['PrefixForCashVoucherNumber'] as String? ?? '',
      financialYear: json['FinancialYear'] as String? ?? '',
      accounting: json['Accounting'] as String? ?? '',
      taxPercentage: json['TaxPercentage'] as String? ?? '',
      clientCode: json['ClientCode'] as String? ?? '',
    );

Map<String, dynamic> _$AccountsSettingsToJson(_AccountsSettings instance) =>
    <String, dynamic>{
      'PrefixForBankVoucherNumber': instance.prefixForBankVoucherNumber,
      'PrefixForCashVoucherNumber': instance.prefixForCashVoucherNumber,
      'FinancialYear': instance.financialYear,
      'Accounting': instance.accounting,
      'TaxPercentage': instance.taxPercentage,
      'ClientCode': instance.clientCode,
    };

_CompanySettings _$CompanySettingsFromJson(Map<String, dynamic> json) =>
    _CompanySettings(
      companyName: json['CompanyName'] as String? ?? '',
      country: json['Country'] as String? ?? '',
      buildingNumber: json['BuildingNumber'] as String? ?? '',
      blockNumber: json['BlockNumber'] as String? ?? '',
      streetName: json['StreetName'] as String? ?? '',
      pinCode: json['PinCode'] as String? ?? '',
      timeZone: json['TimeZone'] as String? ?? '',
      emailId: json['EmailId'] as String? ?? '',
      mobileNumber: json['MobileNumber'] as String? ?? '',
      phoneNumber: json['PhoneNumber'] as String? ?? '',
      companyLogo: json['CompanyLogo'] as String? ?? '',
      baseCurrency: json['BaseCurrency'] as String? ?? '',
      primaryBaseCurrency: json['PrimaryBaseCurrency'] as String? ?? '',
      crossCurrency: json['CrossCurrency'] as String? ?? '',
      numberFormat: json['NumberFormat'] as String? ?? '',
      dateFormat: json['DateFormat'] as String? ?? '',
      primaryLanguage: json['PrimaryLanguage'] as String? ?? '',
      themes: (json['Themes'] as num?)?.toInt() ?? 0,
      companyLogoName: json['CompanyLogoName'] as String? ?? '',
      crossCurrencyRate: json['CrossCurrencyRate'] as String? ?? '',
      trnNo: json['TrnNo'] as String? ?? '',
      status: json['Status'] as String? ?? '',
      createdByUser: json['CreatedByUser'] as String? ?? '',
      createdDateTime: json['CreatedDateTime'] as String? ?? '',
      updatedByUser: json['UpdatedByUser'] as String? ?? '',
      updatedDateTime: json['UpdatedDateTime'] as String? ?? '',
    );

Map<String, dynamic> _$CompanySettingsToJson(_CompanySettings instance) =>
    <String, dynamic>{
      'CompanyName': instance.companyName,
      'Country': instance.country,
      'BuildingNumber': instance.buildingNumber,
      'BlockNumber': instance.blockNumber,
      'StreetName': instance.streetName,
      'PinCode': instance.pinCode,
      'TimeZone': instance.timeZone,
      'EmailId': instance.emailId,
      'MobileNumber': instance.mobileNumber,
      'PhoneNumber': instance.phoneNumber,
      'CompanyLogo': instance.companyLogo,
      'BaseCurrency': instance.baseCurrency,
      'PrimaryBaseCurrency': instance.primaryBaseCurrency,
      'CrossCurrency': instance.crossCurrency,
      'NumberFormat': instance.numberFormat,
      'DateFormat': instance.dateFormat,
      'PrimaryLanguage': instance.primaryLanguage,
      'Themes': instance.themes,
      'CompanyLogoName': instance.companyLogoName,
      'CrossCurrencyRate': instance.crossCurrencyRate,
      'TrnNo': instance.trnNo,
      'Status': instance.status,
      'CreatedByUser': instance.createdByUser,
      'CreatedDateTime': instance.createdDateTime,
      'UpdatedByUser': instance.updatedByUser,
      'UpdatedDateTime': instance.updatedDateTime,
    };
