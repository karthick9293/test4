// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_symbol_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrencySymbolFz _$CurrencySymbolFzFromJson(Map<String, dynamic> json) =>
    _CurrencySymbolFz(
      statusCode: json['StatusCode'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      currencySymbols: (json['CurrencySymbol'] as List<dynamic>?)
          ?.map((e) => CurrencySymbol.fromJson(e as Map<String, dynamic>))
          .toList(),
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrencySymbolFzToJson(_CurrencySymbolFz instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CurrencySymbol': instance.currencySymbols,
      'CustomMessageDetails': instance.customMessageDetails,
    };

_CurrencySymbol _$CurrencySymbolFromJson(Map<String, dynamic> json) =>
    _CurrencySymbol(
      currencyCode: json['CurrencyCode'] as String?,
      base64String: json['Base64String'] as String?,
      currencyImage: json['CurrencyImage'] as String?,
    );

Map<String, dynamic> _$CurrencySymbolToJson(_CurrencySymbol instance) =>
    <String, dynamic>{
      'CurrencyCode': instance.currencyCode,
      'Base64String': instance.base64String,
      'CurrencyImage': instance.currencyImage,
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
