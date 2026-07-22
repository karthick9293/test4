// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deregister_device_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeregisterDeviceFZ _$DeregisterDeviceFZFromJson(Map<String, dynamic> json) =>
    _DeregisterDeviceFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetailsFZ.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      deregisterData: json['Data'] == null
          ? null
          : DeregisterData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeregisterDeviceFZToJson(_DeregisterDeviceFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
      'Data': instance.deregisterData,
    };

_DeregisterData _$DeregisterDataFromJson(Map<String, dynamic> json) =>
    _DeregisterData(
      MessageCode: json['MessageCode'] as String? ?? '',
      MessageDetail: json['MessageDetail'] as String? ?? '',
    );

Map<String, dynamic> _$DeregisterDataToJson(_DeregisterData instance) =>
    <String, dynamic>{
      'MessageCode': instance.MessageCode,
      'MessageDetail': instance.MessageDetail,
    };
