// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EventsFZ _$EventsFZFromJson(Map<String, dynamic> json) => _EventsFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      eventType: (json['EventType'] as List<dynamic>?)
              ?.map((e) => EventType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EventsFZToJson(_EventsFZ instance) => <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'EventType': instance.eventType,
      'CustomMessageDetails': instance.customMessageDetails,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      MessageCode: json['MessageCode'] as String? ?? '',
      MessageType: json['MessageType'] as String? ?? '',
      MessageHeader: json['MessageHeader'] as String? ?? '',
      MessageDescription: json['MessageDescription'] as String? ?? '',
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'MessageCode': instance.MessageCode,
      'MessageType': instance.MessageType,
      'MessageHeader': instance.MessageHeader,
      'MessageDescription': instance.MessageDescription,
    };

_EventType _$EventTypeFromJson(Map<String, dynamic> json) => _EventType(
      Code: json['Code'] as String? ?? '',
      Description: json['Description'] as String? ?? '',
    );

Map<String, dynamic> _$EventTypeToJson(_EventType instance) =>
    <String, dynamic>{
      'Code': instance.Code,
      'Description': instance.Description,
    };
