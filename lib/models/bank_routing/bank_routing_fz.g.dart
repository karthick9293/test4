// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_routing_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankRoutingFz _$BankRoutingFzFromJson(Map<String, dynamic> json) =>
    _BankRoutingFz(
      statusCode: json['StatusCode'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      data: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BankRoutingFzToJson(_BankRoutingFz instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'Data': instance.data,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      categoryList: (json['CategoryList'] as List<dynamic>?)
              ?.map((e) => MasterResponseFZ.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      countryList: (json['CountryList'] as List<dynamic>?)
              ?.map((e) => MasterResponseFZ.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currencyList: (json['CurrencyList'] as List<dynamic>?)
              ?.map((e) => MasterResponseFZ.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'CategoryList': instance.categoryList,
      'CountryList': instance.countryList,
      'CurrencyList': instance.currencyList,
    };
