// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AboutUsFZ _$AboutUsFZFromJson(Map<String, dynamic> json) => _AboutUsFZ(
      StatusCode: json['StatusCode'] as String? ?? '',
      StatusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetailsFZ: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetailsFZ.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      aboutUsData: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AboutUsFZToJson(_AboutUsFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.StatusCode,
      'StatusMessage': instance.StatusMessage,
      'CustomMessageDetails': instance.customMessageDetailsFZ,
      'Data': instance.aboutUsData,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      aboutUsList: (json['AboutUsList'] as List<dynamic>?)
              ?.map((e) => AboutUsList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      messageCode: json['MessageCode'] as String? ?? '',
      messageDetail: json['MessageDetail'] as String? ?? '',
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'AboutUsList': instance.aboutUsList,
      'MessageCode': instance.messageCode,
      'MessageDetail': instance.messageDetail,
    };

_AboutUsList _$AboutUsListFromJson(Map<String, dynamic> json) => _AboutUsList(
      description: json['Description'] as String? ?? '',
      languageCode: json['LanguageCode'] as String? ?? '',
    );

Map<String, dynamic> _$AboutUsListToJson(_AboutUsList instance) =>
    <String, dynamic>{
      'Description': instance.description,
      'LanguageCode': instance.languageCode,
    };
