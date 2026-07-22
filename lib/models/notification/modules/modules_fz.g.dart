// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modules_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModulesFZ _$ModulesFZFromJson(Map<String, dynamic> json) => _ModulesFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      moduleList: (json['ModuleList'] as List<dynamic>?)
              ?.map((e) => ModuleList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ModulesFZToJson(_ModulesFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
      'ModuleList': instance.moduleList,
    };

_ModuleList _$ModuleListFromJson(Map<String, dynamic> json) => _ModuleList(
      ModuleCode: json['ModuleCode'] as String? ?? '',
      ModuleName: json['ModuleName'] as String? ?? '',
      Status: json['Status'] as String? ?? '',
    );

Map<String, dynamic> _$ModuleListToJson(_ModuleList instance) =>
    <String, dynamic>{
      'ModuleCode': instance.ModuleCode,
      'ModuleName': instance.ModuleName,
      'Status': instance.Status,
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
