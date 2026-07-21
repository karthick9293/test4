// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_token_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GenerateTokenFZ _$GenerateTokenFZFromJson(Map<String, dynamic> json) =>
    _GenerateTokenFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetailsFZ: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetailsFZ.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      tokenData: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenerateTokenFZToJson(_GenerateTokenFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetailsFZ,
      'Data': instance.tokenData,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      Token: json['Token'] as String? ?? '',
      clientCode: json['ClientCode'] as String? ?? '',
      environmentCode: json['EnvironmentCode'] as String? ?? '1',
      messageCode: json['MessageCode'] as String? ?? '',
      messageDetail: json['MessageDetail'] as String? ?? '',
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'Token': instance.Token,
      'ClientCode': instance.clientCode,
      'EnvironmentCode': instance.environmentCode,
      'MessageCode': instance.messageCode,
      'MessageDetail': instance.messageDetail,
    };
