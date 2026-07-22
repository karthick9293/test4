import 'package:freezed_annotation/freezed_annotation.dart';

import '../custom_message/custom_message_details_fz.dart';

part 'faqfz.freezed.dart';
part 'faqfz.g.dart';
// ignore_for_file: non_constant_identifier_names

@freezed
abstract class FAQFZ with _$FAQFZ {
  const factory FAQFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetailsFZ? customMessageDetails,
    @JsonKey(name: 'Data') FAQData? faqData,
  }) = _FAQFZ;

  factory FAQFZ.fromJson(Map<String, Object?> json) => _$FAQFZFromJson(json);
}

@freezed
abstract class FAQData with _$FAQData {
  const factory FAQData({
    @JsonKey(name: 'FaqResponselist') @Default([]) List<FaqResponselist> faqResponselist,
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageDetail') @Default('') String messageDetail,
  }) = _FAQData;

  factory FAQData.fromJson(Map<String, Object?> json) => _$FAQDataFromJson(json);
}

@freezed
abstract class FaqResponselist with _$FaqResponselist {
  const factory FaqResponselist({
    @JsonKey(name: 'Code') @Default('') String Code,
    @JsonKey(name: 'Question') @Default('') String Question,
    @JsonKey(name: 'Answer') @Default('') String Answer,
    @JsonKey(name: 'FileType') @Default('') String FileType,
    @JsonKey(name: 'FileUrl') @Default('') String FileUrl,
    @JsonKey(name: 'LanguageCode') @Default('') String LanguageCode,
  }) = _FaqResponselist;

  factory FaqResponselist.fromJson(Map<String, Object?> json) => _$FaqResponselistFromJson(json);
}
