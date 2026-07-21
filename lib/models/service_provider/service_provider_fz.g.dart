// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceProviderFz _$ServiceProviderFzFromJson(Map<String, dynamic> json) =>
    _ServiceProviderFz(
      statusCode: json['StatusCode'] as String?,
      statusMessaage: json['StatusMessaage'] as String?,
      data: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceProviderFzToJson(_ServiceProviderFz instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessaage': instance.statusMessaage,
      'Data': instance.data,
      'CustomMessageDetails': instance.customMessageDetails,
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

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      serviceProvider: (json['ServiceProvider'] as List<dynamic>?)
          ?.map((e) => ServiceProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      messageCode: json['MessageCode'] as String?,
      messageDetail: json['MessageDetail'] as String?,
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'ServiceProvider': instance.serviceProvider,
      'MessageCode': instance.messageCode,
      'MessageDetail': instance.messageDetail,
    };

_ServiceProvider _$ServiceProviderFromJson(Map<String, dynamic> json) =>
    _ServiceProvider(
      code: json['Code'] as String?,
      provider: json['Provider'] as String?,
      mappingCode: json['MappingCode'] as String?,
      imageContent: json['ImageContent'] as String?,
      status: json['Status'] as String?,
      serviceCategory: json['ServiceCategory'] as String?,
    );

Map<String, dynamic> _$ServiceProviderToJson(_ServiceProvider instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Provider': instance.provider,
      'MappingCode': instance.mappingCode,
      'ImageContent': instance.imageContent,
      'Status': instance.status,
      'ServiceCategory': instance.serviceCategory,
    };
