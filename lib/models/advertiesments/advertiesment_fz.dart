import 'package:freezed_annotation/freezed_annotation.dart';

import '../custom_message/custom_message_details_fz.dart';

part 'advertiesment_fz.freezed.dart';
part 'advertiesment_fz.g.dart';

// ignore_for_file: non_constant_identifier_names

@freezed
abstract class AdvertiesmentFZ with _$AdvertiesmentFZ {
  const factory AdvertiesmentFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetailsFZ? customMessageDetails,
    @JsonKey(name: 'Data') AdvertiesmentData? advertiesmentData,
  }) = _AdvertiesmentFZ;

  factory AdvertiesmentFZ.fromJson(Map<String, Object?> json) => _$AdvertiesmentFZFromJson(json);
}

@freezed
abstract class AdvertiesmentData with _$AdvertiesmentData {
  const factory AdvertiesmentData({
    @JsonKey(name: 'AdvertisementList') @Default([]) List<AdvertisementList> advertisementList,
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageDetail') @Default('') String messageDetail,
  }) = _AdvertiesmentData;

  factory AdvertiesmentData.fromJson(Map<String, Object?> json) => _$AdvertiesmentDataFromJson(json);
}

@freezed
abstract class AdvertisementList with _$AdvertisementList {
  const factory AdvertisementList({
    @JsonKey(name: 'Code') @Default('') String code,
    @JsonKey(name: 'DisplayFormat') @Default('') String displayFormat,
    @JsonKey(name: 'FileContent') @Default('') String fileContent,
    @JsonKey(name: 'RedirectUrl') @Default('') String redirectUrl,
    @JsonKey(name: 'FileUrl') @Default('') String fileUrl,
    @JsonKey(name: 'Status') @Default('') String status,
  }) = _AdvertisementList;

  factory AdvertisementList.fromJson(Map<String, Object?> json) => _$AdvertisementListFromJson(json);
}
