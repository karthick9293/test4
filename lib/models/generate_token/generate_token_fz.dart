import 'package:freezed_annotation/freezed_annotation.dart';

import '../custom_message/custom_message_details_fz.dart';

part 'generate_token_fz.freezed.dart';
part 'generate_token_fz.g.dart';
// ignore_for_file: non_constant_identifier_names

@freezed
abstract class GenerateTokenFZ with _$GenerateTokenFZ {
  const factory GenerateTokenFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetailsFZ? customMessageDetailsFZ,
    @JsonKey(name: 'Data') Data? tokenData,
  }) = _GenerateTokenFZ;

  factory GenerateTokenFZ.fromJson(Map<String, Object?> json) => _$GenerateTokenFZFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'Token') @Default('') String Token,
    @JsonKey(name: 'ClientCode') @Default('') String clientCode,
    @JsonKey(name: 'EnvironmentCode') @Default('1') String environmentCode,
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageDetail') @Default('') String messageDetail,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}
