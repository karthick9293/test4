// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_response_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TempSettings _$TempSettingsFromJson(Map<String, dynamic> json) =>
    _TempSettings(
      parameterKey: json['ParameterKey'] as String? ?? '',
      parameterValue: json['ParameterValue'] as String? ?? '',
      parameterDescription: json['ParameterDescription'] as String? ?? '',
      status: json['Status'] as String? ?? '',
      digitalApplicationCode:
          (json['DigitalApplicationCode'] as num?)?.toInt() ?? 0,
      displayOrder: (json['DisplayOrder'] as num?)?.toInt() ?? 0,
      defaultValue: json['DefaultValue'] as String? ?? '',
    );

Map<String, dynamic> _$TempSettingsToJson(_TempSettings instance) =>
    <String, dynamic>{
      'ParameterKey': instance.parameterKey,
      'ParameterValue': instance.parameterValue,
      'ParameterDescription': instance.parameterDescription,
      'Status': instance.status,
      'DigitalApplicationCode': instance.digitalApplicationCode,
      'DisplayOrder': instance.displayOrder,
      'DefaultValue': instance.defaultValue,
    };
