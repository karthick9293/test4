import 'package:freezed_annotation/freezed_annotation.dart';

import '../custom_message/custom_message_details_fz.dart';

part 'about_us_fz.freezed.dart';
part 'about_us_fz.g.dart';

@freezed
abstract class AboutUsFZ with _$AboutUsFZ {
  const factory AboutUsFZ({
    @JsonKey(name: 'StatusCode') @Default('') String StatusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String StatusMessage,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetailsFZ? customMessageDetailsFZ,
    @JsonKey(name: 'Data') Data? aboutUsData,
  }) = _AboutUsFZ;

  factory AboutUsFZ.fromJson(Map<String, Object?> json) => _$AboutUsFZFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'AboutUsList') @Default([]) List<AboutUsList> aboutUsList,
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageDetail') @Default('') String messageDetail,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class AboutUsList with _$AboutUsList {
  const factory AboutUsList({
    @JsonKey(name: 'Description') @Default('') String description,
    @JsonKey(name: 'LanguageCode') @Default('') String languageCode,
  }) = _AboutUsList;

  factory AboutUsList.fromJson(Map<String, Object?> json) => _$AboutUsListFromJson(json);
}
