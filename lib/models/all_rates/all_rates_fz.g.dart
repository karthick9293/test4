// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_rates_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AllRateFz _$AllRateFzFromJson(Map<String, dynamic> json) => _AllRateFz(
      statusCode: json['StatusCode'] as String,
      statusMessage: json['StatusMessage'] as String,
      data: Data.fromJson(json['Data'] as Map<String, dynamic>),
      customMessageDetails: CustomMessageDetails.fromJson(
          json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllRateFzToJson(_AllRateFz instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'Data': instance.data,
      'CustomMessageDetails': instance.customMessageDetails,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['MessageCode'] as String,
      messageType: json['MessageType'] as String,
      messageHeader: json['MessageHeader'] as String,
      messageDescription: json['MessageDescription'] as String,
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageType': instance.messageType,
      'MessageHeader': instance.messageHeader,
      'MessageDescription': instance.messageDescription,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      currencyRateList: (json['CurrencyRateList'] as List<dynamic>)
          .map((e) => CurrencyRateList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'CurrencyRateList': instance.currencyRateList,
    };

_CurrencyRateList _$CurrencyRateListFromJson(Map<String, dynamic> json) =>
    _CurrencyRateList(
      currencyCode: json['CurrencyCode'] as String,
      currency: json['Currency'] as String,
      cashRateBuy: (json['CashRateBuy'] as num).toDouble(),
      cashRateSell: (json['CashRateSell'] as num).toDouble(),
      transferRateSell: (json['TransferRateSell'] as num).toDouble(),
      currencyFlagPath: json['CurrencyFlagPath'],
    );

Map<String, dynamic> _$CurrencyRateListToJson(_CurrencyRateList instance) =>
    <String, dynamic>{
      'CurrencyCode': instance.currencyCode,
      'Currency': instance.currency,
      'CashRateBuy': instance.cashRateBuy,
      'CashRateSell': instance.cashRateSell,
      'TransferRateSell': instance.transferRateSell,
      'CurrencyFlagPath': instance.currencyFlagPath,
    };
