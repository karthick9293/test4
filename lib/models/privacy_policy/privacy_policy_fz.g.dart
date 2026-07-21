// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrivacyPolicyFZ _$PrivacyPolicyFZFromJson(Map<String, dynamic> json) =>
    _PrivacyPolicyFZ(
      StatusCode: json['StatusCode'] as String? ?? '',
      StatusMessage: json['StatusMessage'] as String? ?? '',
      CustomMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetailsFZ.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      privacyData: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrivacyPolicyFZToJson(_PrivacyPolicyFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.StatusCode,
      'StatusMessage': instance.StatusMessage,
      'CustomMessageDetails': instance.CustomMessageDetails,
      'Data': instance.privacyData,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      messageCode: json['MessageCode'] as String? ?? '',
      messageDetail: json['MessageDetail'] as String? ?? '',
      privacyPolicyDetails: (json['PrivacyPolicyDetails'] as List<dynamic>?)
              ?.map((e) =>
                  PrivacyPolicyDetails.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageDetail': instance.messageDetail,
      'PrivacyPolicyDetails': instance.privacyPolicyDetails,
    };

_PrivacyPolicyDetails _$PrivacyPolicyDetailsFromJson(
        Map<String, dynamic> json) =>
    _PrivacyPolicyDetails(
      description: json['Description'] as String? ?? '',
      languageCode: json['LanguageCode'] as String? ?? '',
    );

Map<String, dynamic> _$PrivacyPolicyDetailsToJson(
        _PrivacyPolicyDetails instance) =>
    <String, dynamic>{
      'Description': instance.description,
      'LanguageCode': instance.languageCode,
    };
