// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_condition_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TermsAndConditionFZ _$TermsAndConditionFZFromJson(Map<String, dynamic> json) =>
    _TermsAndConditionFZ(
      StatusCode: json['StatusCode'] as String? ?? '',
      StatusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetails: json['customMessageDetails'] == null
          ? null
          : CustomMessageDetailsFZ.fromJson(
              json['customMessageDetails'] as Map<String, dynamic>),
      termsData: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TermsAndConditionFZToJson(
        _TermsAndConditionFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.StatusCode,
      'StatusMessage': instance.StatusMessage,
      'customMessageDetails': instance.customMessageDetails,
      'Data': instance.termsData,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      termsAndConditionDetails: (json['TermsAndConditionDetails']
                  as List<dynamic>?)
              ?.map((e) =>
                  TermsAndConditionDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      messageCode: json['MessageCode'] as String? ?? '',
      messageDetail: json['MessageDetail'] as String? ?? '',
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'TermsAndConditionDetails': instance.termsAndConditionDetails,
      'MessageCode': instance.messageCode,
      'MessageDetail': instance.messageDetail,
    };

_TermsAndConditionDetails _$TermsAndConditionDetailsFromJson(
        Map<String, dynamic> json) =>
    _TermsAndConditionDetails(
      description: json['Description'] as String? ?? '',
      languageCode: json['LanguageCode'] as String? ?? '',
    );

Map<String, dynamic> _$TermsAndConditionDetailsToJson(
        _TermsAndConditionDetails instance) =>
    <String, dynamic>{
      'Description': instance.description,
      'LanguageCode': instance.languageCode,
    };
