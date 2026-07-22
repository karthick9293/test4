import 'package:freezed_annotation/freezed_annotation.dart';

import '../custom_message/custom_message_details_fz.dart';

// ignore_for_file: non_constant_identifier_names

part 'privacy_policy_fz.freezed.dart';
part 'privacy_policy_fz.g.dart';

@freezed
abstract class PrivacyPolicyFZ with _$PrivacyPolicyFZ {
  const factory PrivacyPolicyFZ({
    @JsonKey(name: 'StatusCode') @Default('') String StatusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String StatusMessage,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetailsFZ? CustomMessageDetails,
    @JsonKey(name: 'Data') Data? privacyData,
  }) = _PrivacyPolicyFZ;

  factory PrivacyPolicyFZ.fromJson(Map<String, Object?> json) => _$PrivacyPolicyFZFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageDetail') @Default('') String messageDetail,
    @JsonKey(name: 'PrivacyPolicyDetails') @Default([]) List<PrivacyPolicyDetails> privacyPolicyDetails,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class PrivacyPolicyDetails with _$PrivacyPolicyDetails {
  const factory PrivacyPolicyDetails({
    @JsonKey(name: 'Description') @Default('') String description,
    @JsonKey(name: 'LanguageCode') @Default('') String languageCode,
  }) = _PrivacyPolicyDetails;

  factory PrivacyPolicyDetails.fromJson(Map<String, Object?> json) => _$PrivacyPolicyDetailsFromJson(json);
}
