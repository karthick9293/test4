// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_type_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueryTypeFz _$QueryTypeFzFromJson(Map<String, dynamic> json) => _QueryTypeFz(
      queryTypeCode: json['QueryTypeCode'] as String?,
      queryTypeName: json['QueryTypeName'] as String?,
    );

Map<String, dynamic> _$QueryTypeFzToJson(_QueryTypeFz instance) =>
    <String, dynamic>{
      'QueryTypeCode': instance.queryTypeCode,
      'QueryTypeName': instance.queryTypeName,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['MessageCode'] as String?,
      messageType: json['MessageType'] as String?,
      messageHeader: json['MessageHeader'] as String?,
      messageDescription: json['MessageDescription'] as String?,
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageType': instance.messageType,
      'MessageHeader': instance.messageHeader,
      'MessageDescription': instance.messageDescription,
    };

_QueryTypeResponse _$QueryTypeResponseFromJson(Map<String, dynamic> json) =>
    _QueryTypeResponse(
      statusCode: json['StatusCode'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      queryList: (json['QueryList'] as List<dynamic>?)
          ?.map((e) => QueryTypeFz.fromJson(e as Map<String, dynamic>))
          .toList(),
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QueryTypeResponseToJson(_QueryTypeResponse instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'QueryList': instance.queryList,
      'CustomMessageDetails': instance.customMessageDetails,
    };
