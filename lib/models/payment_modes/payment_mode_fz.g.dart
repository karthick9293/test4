// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_mode_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMode _$PaymentModeFromJson(Map<String, dynamic> json) => _PaymentMode(
      type: _readCode(json, 'Code') as String? ?? '',
      description: _readName(json, 'CodeName') as String? ?? '',
      paymentModeImage: json['PaymentModeImage'] as String? ?? '',
      paymentModeKey: json['PaymentModeKey'] as String? ?? '',
      status: json['Status'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentModeToJson(_PaymentMode instance) =>
    <String, dynamic>{
      'Code': instance.type,
      'CodeName': instance.description,
      'PaymentModeImage': instance.paymentModeImage,
      'PaymentModeKey': instance.paymentModeKey,
      'Status': instance.status,
    };
