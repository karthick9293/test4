import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_response_fz.freezed.dart';
part 'admin_response_fz.g.dart';

@freezed
abstract class TempSettings with _$TempSettings {
  const factory TempSettings({
    @JsonKey(name: 'ParameterKey') @Default('') String parameterKey,
    @JsonKey(name: 'ParameterValue') @Default('') String parameterValue,
    @JsonKey(name: 'ParameterDescription') @Default('') String parameterDescription,
    @JsonKey(name: 'Status') @Default('') String status,
    @JsonKey(name: 'DigitalApplicationCode') @Default(0) int digitalApplicationCode,
    @JsonKey(name: 'DisplayOrder') @Default(0) int displayOrder,
    @JsonKey(name: 'DefaultValue') @Default('') String defaultValue,
  }) = _TempSettings;

  factory TempSettings.fromJson(Map<String, Object?> json) => _$TempSettingsFromJson(json);
}
