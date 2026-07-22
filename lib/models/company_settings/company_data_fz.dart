import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_data_fz.freezed.dart';
part 'company_data_fz.g.dart';

@freezed
abstract class CompanyDataFZ with _$CompanyDataFZ {
  const factory CompanyDataFZ({
    @JsonKey(name: 'ClientCode') @Default('') String clientCode,
    @JsonKey(name: 'LicenseCountry') @Default('') String licenseCountry,
    @JsonKey(name: 'UserId') String? userId,
    @JsonKey(name: 'CompanySettings') CompanySettings? companySettings,
    @JsonKey(name: 'AccountsSettings') AccountsSettings? accountsSettings,
    @JsonKey(name: 'ForexSettings') ForexSettings? forexSettings,
    @JsonKey(name: 'IncomingSettings') IncomingSettings? incomingSettings,
    @JsonKey(name: 'MobileSettings') MobileSettings? mobileSettings,
    @JsonKey(name: 'RemittanceSettings') RemittanceSettings? remittanceSettings,
    @JsonKey(name: 'PreciousMetalSettings') PreciousMetalSettings? preciousMetalSettings,
  }) = _CompanyDataFZ;

  factory CompanyDataFZ.fromJson(Map<String, Object?> json) => _$CompanyDataFZFromJson(json);
}

@freezed
abstract class PreciousMetalSettings with _$PreciousMetalSettings {
  const factory PreciousMetalSettings({
    @JsonKey(name: 'ClientCode') @Default('') String clientCode,
    @JsonKey(name: 'PrefixForPreciousMetalNumber') @Default('') String prefixForPreciousMetalNumber,
    @JsonKey(name: 'RatePerOunce') @Default('') String ratePerOunce,
    @JsonKey(name: 'PerOunceInGram') @Default('') String perOunceInGram,
    @JsonKey(name: 'DualCounter') dynamic dualCounter,
    @JsonKey(name: 'UpdatedOn') @Default('') String updatedOn,
  }) = _PreciousMetalSettings;

  factory PreciousMetalSettings.fromJson(Map<String, Object?> json) => _$PreciousMetalSettingsFromJson(json);
}

@freezed
abstract class RemittanceSettings with _$RemittanceSettings {
  const factory RemittanceSettings({
    @JsonKey(name: 'ClientCode') @Default('') String clientCode,
    @JsonKey(name: 'RequiredDualCounter') @Default('') String requiredDualCounter,
    @JsonKey(name: 'PrefixForRemittanceRefNo') @Default('') String prefixForRemittanceRefNo,
    @JsonKey(name: 'CorrespondentRouting') @Default('') String correspondentRouting,
    @JsonKey(name: 'AutoRoutingTypeCode') @Default(false) bool autoRoutingTypeCode,
    @JsonKey(name: 'ShowRateViewInRemittance') @Default('') String showRateViewInRemittance,
    @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance') @Default('') String allowNewCustomerAdditionFromRemittance,
    @JsonKey(name: 'AllowCustomerProfileEditFromRemittance') @Default('') String allowCustomerProfileEditFromRemittance,
    @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance') @Default('') String allowBeneficiaryProfileEditFromRemittance,
    @JsonKey(name: 'AllowSpecialRateRequestFromRemittance') @Default('') String allowSpecialRateRequestFromRemittance,
    @JsonKey(name: 'AllowBufferInRateToTeller') @Default('') String allowBufferInRateToTeller,
    @JsonKey(name: 'AllowOnAccountFacility') @Default('') String allowOnAccountFacility,
    @JsonKey(name: 'AllowSpecialDiscountRate') @Default('') String allowSpecialDiscountRate,
    @JsonKey(name: 'AllowCreditFacility') @Default('') String allowCreditFacility,
  }) = _RemittanceSettings;

  factory RemittanceSettings.fromJson(Map<String, Object?> json) => _$RemittanceSettingsFromJson(json);
}

@freezed
abstract class MobileSettings with _$MobileSettings {
  const factory MobileSettings({
    @JsonKey(name: 'ClientCode') @Default('') String clientCode,
  }) = _MobileSettings;

  factory MobileSettings.fromJson(Map<String, Object?> json) => _$MobileSettingsFromJson(json);
}

@freezed
abstract class IncomingSettings with _$IncomingSettings {
  const factory IncomingSettings({
    @JsonKey(name: 'PrefixForIncomingRefNo') @Default('') String prefixForIncomingRefNo,
  }) = _IncomingSettings;

  factory IncomingSettings.fromJson(Map<String, Object?> json) => _$IncomingSettingsFromJson(json);
}

@freezed
abstract class ForexSettings with _$ForexSettings {
  const factory ForexSettings({
    @JsonKey(name: 'PrefixForForexRefNo') @Default('') String prefixForForexRefNo,
  }) = _ForexSettings;

  factory ForexSettings.fromJson(Map<String, Object?> json) => _$ForexSettingsFromJson(json);
}

@freezed
abstract class AccountsSettings with _$AccountsSettings {
  const factory AccountsSettings({
    @JsonKey(name: 'PrefixForBankVoucherNumber') @Default('') String prefixForBankVoucherNumber,
    @JsonKey(name: 'PrefixForCashVoucherNumber') @Default('') String prefixForCashVoucherNumber,
    @JsonKey(name: 'FinancialYear') @Default('') String financialYear,
    @JsonKey(name: 'Accounting') @Default('') String accounting,
    @JsonKey(name: 'TaxPercentage') @Default('') String taxPercentage,
    @JsonKey(name: 'ClientCode') @Default('') String clientCode,
  }) = _AccountsSettings;

  factory AccountsSettings.fromJson(Map<String, Object?> json) => _$AccountsSettingsFromJson(json);
}

@freezed
abstract class CompanySettings with _$CompanySettings {
  const factory CompanySettings({
    @JsonKey(name: 'CompanyName') @Default('') String companyName,
    @JsonKey(name: 'Country') @Default('') String country,
    @JsonKey(name: 'BuildingNumber') @Default('') String buildingNumber,
    @JsonKey(name: 'BlockNumber') @Default('') String blockNumber,
    @JsonKey(name: 'StreetName') @Default('') String streetName,
    @JsonKey(name: 'PinCode') @Default('') String pinCode,
    @JsonKey(name: 'TimeZone') @Default('') String timeZone,
    @JsonKey(name: 'EmailId') @Default('') String emailId,
    @JsonKey(name: 'MobileNumber') @Default('') String mobileNumber,
    @JsonKey(name: 'PhoneNumber') @Default('') String phoneNumber,
    @JsonKey(name: 'CompanyLogo') @Default('') String companyLogo,
    @JsonKey(name: 'BaseCurrency') @Default('') String baseCurrency,
    @JsonKey(name: 'PrimaryBaseCurrency') @Default('') String primaryBaseCurrency,
    @JsonKey(name: 'CrossCurrency') @Default('') String crossCurrency,
    @JsonKey(name: 'NumberFormat') @Default('') String numberFormat,
    @JsonKey(name: 'DateFormat') @Default('') String dateFormat,
    @JsonKey(name: 'PrimaryLanguage') @Default('') String primaryLanguage,
    @JsonKey(name: 'Themes') @Default(0) int themes,
    @JsonKey(name: 'CompanyLogoName') @Default('') String companyLogoName,
    @JsonKey(name: 'CrossCurrencyRate') @Default('') String crossCurrencyRate,
    @JsonKey(name: 'TrnNo') @Default('') String trnNo,
    @JsonKey(name: 'Status') @Default('') String status,
    @JsonKey(name: 'CreatedByUser') @Default('') String createdByUser,
    @JsonKey(name: 'CreatedDateTime') @Default('') String createdDateTime,
    @JsonKey(name: 'UpdatedByUser') @Default('') String updatedByUser,
    @JsonKey(name: 'UpdatedDateTime') @Default('') String updatedDateTime,
  }) = _CompanySettings;

  factory CompanySettings.fromJson(Map<String, Object?> json) => _$CompanySettingsFromJson(json);
}
