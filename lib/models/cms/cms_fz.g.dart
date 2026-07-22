// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cms_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cms _$CmsFromJson(Map<String, dynamic> json) => _Cms(
      messageCode: json['MessageCode'] as String?,
      messageDetails: json['MessageDetails'] as String?,
      cmsList: (json['CMSList'] as List<dynamic>?)
          ?.map((e) => CmsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CmsToJson(_Cms instance) => <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageDetails': instance.messageDetails,
      'CMSList': instance.cmsList,
    };

_CmsList _$CmsListFromJson(Map<String, dynamic> json) => _CmsList(
      code: (json['Code'] as num?)?.toInt(),
      screenName: json['ScreenName'] as String?,
      image: json['Image'] as String?,
      fileUrl: json['FileUrl'] as String?,
      parameterName: json['ParameterName'] as String?,
      textHeading: json['TextHeading'] as String?,
      description: json['Description'] as String?,
      note: json['Note'] as String?,
      status: json['Status'] as String?,
      languageCode: json['LanguageCode'] as String?,
      userId: json['UserId'] as String?,
    );

Map<String, dynamic> _$CmsListToJson(_CmsList instance) => <String, dynamic>{
      'Code': instance.code,
      'ScreenName': instance.screenName,
      'Image': instance.image,
      'FileUrl': instance.fileUrl,
      'ParameterName': instance.parameterName,
      'TextHeading': instance.textHeading,
      'Description': instance.description,
      'Note': instance.note,
      'Status': instance.status,
      'LanguageCode': instance.languageCode,
      'UserId': instance.userId,
    };
