// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqfz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FAQFZ _$FAQFZFromJson(Map<String, dynamic> json) => _FAQFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetailsFZ.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      faqData: json['Data'] == null
          ? null
          : FAQData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FAQFZToJson(_FAQFZ instance) => <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
      'Data': instance.faqData,
    };

_FAQData _$FAQDataFromJson(Map<String, dynamic> json) => _FAQData(
      faqResponselist: (json['FaqResponselist'] as List<dynamic>?)
              ?.map((e) => FaqResponselist.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      messageCode: json['MessageCode'] as String? ?? '',
      messageDetail: json['MessageDetail'] as String? ?? '',
    );

Map<String, dynamic> _$FAQDataToJson(_FAQData instance) => <String, dynamic>{
      'FaqResponselist': instance.faqResponselist,
      'MessageCode': instance.messageCode,
      'MessageDetail': instance.messageDetail,
    };

_FaqResponselist _$FaqResponselistFromJson(Map<String, dynamic> json) =>
    _FaqResponselist(
      Code: json['Code'] as String? ?? '',
      Question: json['Question'] as String? ?? '',
      Answer: json['Answer'] as String? ?? '',
      FileType: json['FileType'] as String? ?? '',
      FileUrl: json['FileUrl'] as String? ?? '',
      LanguageCode: json['LanguageCode'] as String? ?? '',
    );

Map<String, dynamic> _$FaqResponselistToJson(_FaqResponselist instance) =>
    <String, dynamic>{
      'Code': instance.Code,
      'Question': instance.Question,
      'Answer': instance.Answer,
      'FileType': instance.FileType,
      'FileUrl': instance.FileUrl,
      'LanguageCode': instance.LanguageCode,
    };
