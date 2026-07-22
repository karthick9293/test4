// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'txn_cancel_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TxnCancelFz _$TxnCancelFzFromJson(Map<String, dynamic> json) => _TxnCancelFz(
      statusCode: json['StatusCode'] as String,
      statusMessage: json['StatusMessage'] as String,
      customMessageDetails: CustomMessageDetails.fromJson(
          json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TxnCancelFzToJson(_TxnCancelFz instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
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
