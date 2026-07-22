import 'package:freezed_annotation/freezed_annotation.dart';

import '../custom_message/custom_message_details_fz.dart';

// ignore_for_file: non_constant_identifier_names

part 'terms_and_condition_fz.freezed.dart';
part 'terms_and_condition_fz.g.dart';

@freezed
abstract class TermsAndConditionFZ with _$TermsAndConditionFZ {
  const factory TermsAndConditionFZ({
    @JsonKey(name: 'StatusCode') @Default('') String StatusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String StatusMessage,
    @JsonKey(name: 'customMessageDetails') CustomMessageDetailsFZ? customMessageDetails,
    @JsonKey(name: 'Data') Data? termsData,
  }) = _TermsAndConditionFZ;

  factory TermsAndConditionFZ.fromJson(Map<String, Object?> json) => _$TermsAndConditionFZFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'TermsAndConditionDetails') @Default([]) List<TermsAndConditionDetails> termsAndConditionDetails,
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageDetail') @Default('') String messageDetail,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class TermsAndConditionDetails with _$TermsAndConditionDetails {
  const factory TermsAndConditionDetails({
    @JsonKey(name: 'Description') @Default('') String description,
    @JsonKey(name: 'LanguageCode') @Default('') String languageCode,
  }) = _TermsAndConditionDetails;

  factory TermsAndConditionDetails.fromJson(Map<String, Object?> json) => _$TermsAndConditionDetailsFromJson(json);
}
