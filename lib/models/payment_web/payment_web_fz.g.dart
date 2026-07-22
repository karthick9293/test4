// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_web_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentWebFZ _$PaymentWebFZFromJson(Map<String, dynamic> json) =>
    _PaymentWebFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      data: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentWebFZToJson(_PaymentWebFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
      'Data': instance.data,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      webView: json['WebView'] as String? ?? '',
      customerCode: json['CustomerCode'] as String? ?? '',
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'WebView': instance.webView,
      'CustomerCode': instance.customerCode,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['MessageCode'] as String? ?? '',
      messageType: json['MessageType'] as String? ?? '',
      messageHeader: json['MessageHeader'] as String? ?? '',
      messageDescription: json['MessageDescription'] as String? ?? '',
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageType': instance.messageType,
      'MessageHeader': instance.messageHeader,
      'MessageDescription': instance.messageDescription,
    };
