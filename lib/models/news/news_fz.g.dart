// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsFZ _$NewsFZFromJson(Map<String, dynamic> json) => _NewsFZ(
      code: json['Code'] as String?,
      newsTitle: json['NewsTitle'] as String?,
      newsContent: json['NewsContent'] as String?,
      languageCode: json['LanguageCode'] as String?,
    );

Map<String, dynamic> _$NewsFZToJson(_NewsFZ instance) => <String, dynamic>{
      'Code': instance.code,
      'NewsTitle': instance.newsTitle,
      'NewsContent': instance.newsContent,
      'LanguageCode': instance.languageCode,
    };
