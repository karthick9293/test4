// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_response_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MasterResponseFZ _$MasterResponseFZFromJson(Map<String, dynamic> json) =>
    _MasterResponseFZ(
      id: json['id'] as String? ?? '',
      Desc: _readName(json, 'Desc') as String? ?? '',
      Code: _readCode(json, 'Code') as String? ?? '',
      type: json['type'] as String? ?? '',
      baseUrl: json['baseUrl'] as String? ?? '',
      address: json['address'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      bicType: json['bicType'] as String? ?? '',
      bicValue: json['bicValue'] as String? ?? '',
      CurrencyFlagPath: json['CurrencyFlagPath'] as String? ?? '',
      label: json['label'] as String? ?? '',
      BankCode: json['BankCode'] as String? ?? '',
      BankName: json['BankName'] as String? ?? '',
      BranchCode: json['BranchCode'] as String? ?? '',
      BranchName: json['BranchName'] as String? ?? '',
      BranchAddress1: json['BranchAddress1'] as String? ?? '',
      BranchAddress2: json['BranchAddress2'] as String? ?? '',
      BranchAddress3: json['BranchAddress3'] as String? ?? '',
      branchBicDetails: (json['BranchBicDetails'] as List<dynamic>?)
              ?.map((e) => BranchBicDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      provider: json['Provider'] as String? ?? '',
      mappingCode: json['MappingCode'] as String? ?? '',
      imageContent: json['ImageContent'] as String? ?? '',
      providerStatus: json['Status'] as String? ?? '',
      providerServiceCategory: json['ServiceCategory'] as String? ?? '',
      categoryCode: json['CategoryCode'] as String? ?? '',
      categoryName: json['CategoryName'] as String? ?? '',
      countryCode: json['CountryCode'] as String? ?? '',
      countryName: json['CountryName'] as String? ?? '',
      currencyCode: json['CurrencyCode'] as String? ?? '',
      currencyName: json['CurrencyName'] as String? ?? '',
      stateName: json['StateName'] as String? ?? '',
      stateCode: json['StateCode'] as String? ?? '',
      cityName: json['CityName'] as String? ?? '',
      cityCode: json['CityCode'] as String? ?? '',
      accountLengthList: (json['AccountLengthList'] as List<dynamic>?)
          ?.map((e) => BankAccountLength.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MasterResponseFZToJson(_MasterResponseFZ instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Desc': instance.Desc,
      'Code': instance.Code,
      'type': instance.type,
      'baseUrl': instance.baseUrl,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'bicType': instance.bicType,
      'bicValue': instance.bicValue,
      'CurrencyFlagPath': instance.CurrencyFlagPath,
      'label': instance.label,
      'BankCode': instance.BankCode,
      'BankName': instance.BankName,
      'BranchCode': instance.BranchCode,
      'BranchName': instance.BranchName,
      'BranchAddress1': instance.BranchAddress1,
      'BranchAddress2': instance.BranchAddress2,
      'BranchAddress3': instance.BranchAddress3,
      'BranchBicDetails': instance.branchBicDetails,
      'Provider': instance.provider,
      'MappingCode': instance.mappingCode,
      'ImageContent': instance.imageContent,
      'Status': instance.providerStatus,
      'ServiceCategory': instance.providerServiceCategory,
      'CategoryCode': instance.categoryCode,
      'CategoryName': instance.categoryName,
      'CountryCode': instance.countryCode,
      'CountryName': instance.countryName,
      'CurrencyCode': instance.currencyCode,
      'CurrencyName': instance.currencyName,
      'StateName': instance.stateName,
      'StateCode': instance.stateCode,
      'CityName': instance.cityName,
      'CityCode': instance.cityCode,
      'AccountLengthList': instance.accountLengthList,
    };

_BranchBicDetails _$BranchBicDetailsFromJson(Map<String, dynamic> json) =>
    _BranchBicDetails(
      BicTypeCode: json['BicTypeCode'] as String? ?? '',
      BicTypeDescription: json['BicTypeDescription'] as String? ?? '',
      BicTypeValue: json['BicTypeValue'] as String? ?? '',
    );

Map<String, dynamic> _$BranchBicDetailsToJson(_BranchBicDetails instance) =>
    <String, dynamic>{
      'BicTypeCode': instance.BicTypeCode,
      'BicTypeDescription': instance.BicTypeDescription,
      'BicTypeValue': instance.BicTypeValue,
    };

_BankAccountLength _$BankAccountLengthFromJson(Map<String, dynamic> json) =>
    _BankAccountLength(
      length: json['Length'] as String? ?? '',
      prefix: json['Prefix'] as String? ?? '',
    );

Map<String, dynamic> _$BankAccountLengthToJson(_BankAccountLength instance) =>
    <String, dynamic>{
      'Length': instance.length,
      'Prefix': instance.prefix,
    };
