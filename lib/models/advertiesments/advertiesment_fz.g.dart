// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertiesment_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdvertiesmentFZ _$AdvertiesmentFZFromJson(Map<String, dynamic> json) =>
    _AdvertiesmentFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetailsFZ.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      advertiesmentData: json['Data'] == null
          ? null
          : AdvertiesmentData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdvertiesmentFZToJson(_AdvertiesmentFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
      'Data': instance.advertiesmentData,
    };

_AdvertiesmentData _$AdvertiesmentDataFromJson(Map<String, dynamic> json) =>
    _AdvertiesmentData(
      advertisementList: (json['AdvertisementList'] as List<dynamic>?)
              ?.map(
                  (e) => AdvertisementList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      messageCode: json['MessageCode'] as String? ?? '',
      messageDetail: json['MessageDetail'] as String? ?? '',
    );

Map<String, dynamic> _$AdvertiesmentDataToJson(_AdvertiesmentData instance) =>
    <String, dynamic>{
      'AdvertisementList': instance.advertisementList,
      'MessageCode': instance.messageCode,
      'MessageDetail': instance.messageDetail,
    };

_AdvertisementList _$AdvertisementListFromJson(Map<String, dynamic> json) =>
    _AdvertisementList(
      code: json['Code'] as String? ?? '',
      displayFormat: json['DisplayFormat'] as String? ?? '',
      fileContent: json['FileContent'] as String? ?? '',
      redirectUrl: json['RedirectUrl'] as String? ?? '',
      fileUrl: json['FileUrl'] as String? ?? '',
      status: json['Status'] as String? ?? '',
    );

Map<String, dynamic> _$AdvertisementListToJson(_AdvertisementList instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'DisplayFormat': instance.displayFormat,
      'FileContent': instance.fileContent,
      'RedirectUrl': instance.redirectUrl,
      'FileUrl': instance.fileUrl,
      'Status': instance.status,
    };
