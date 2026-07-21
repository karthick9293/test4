// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_message_details_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomMessageDetailsFZ _$CustomMessageDetailsFZFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetailsFZ(
      MessageCode: json['MessageCode'] as String? ?? '',
      MessageType: json['MessageType'] as String? ?? '',
      MessageHeader: json['MessageHeader'] as String? ?? '',
      MessageDescription: json['MessageDescription'] as String? ?? '',
    );

Map<String, dynamic> _$CustomMessageDetailsFZToJson(
        _CustomMessageDetailsFZ instance) =>
    <String, dynamic>{
      'MessageCode': instance.MessageCode,
      'MessageType': instance.MessageType,
      'MessageHeader': instance.MessageHeader,
      'MessageDescription': instance.MessageDescription,
    };
