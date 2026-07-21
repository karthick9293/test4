// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_upload_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentUploadFZ _$DocumentUploadFZFromJson(Map<String, dynamic> json) =>
    _DocumentUploadFZ(
      statusCode: json['statusCode'] as String? ?? '',
      statusMessage: json['statusMessage'] as String? ?? '',
      customMessageDetails: json['customMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['customMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocumentUploadFZToJson(_DocumentUploadFZ instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'customMessageDetails': instance.customMessageDetails,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['messageCode'] as String? ?? '',
      messageType: json['messageType'] as String? ?? '',
      messageHeader: json['messageHeader'] as String? ?? '',
      messageDescription: json['messageDescription'] as String? ?? '',
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'messageCode': instance.messageCode,
      'messageType': instance.messageType,
      'messageHeader': instance.messageHeader,
      'messageDescription': instance.messageDescription,
    };
