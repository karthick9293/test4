import 'package:freezed_annotation/freezed_annotation.dart';

part 'enquiry_fz.freezed.dart';
part 'enquiry_fz.g.dart';

@freezed
abstract class EnquiryDataFz with _$EnquiryDataFz {
  const factory EnquiryDataFz({
    @JsonKey(name: 'EnquiryList') @Default([]) List<EnquiryFz> enquiryList,
  }) = _EnquiryDataFz;

  factory EnquiryDataFz.fromJson(Map<String, Object?> json) => _$EnquiryDataFzFromJson(json);
}

@freezed
abstract class EnquiryFz with _$EnquiryFz {
  const factory EnquiryFz({
    @JsonKey(name: 'EnquiryCode') @Default('') String enquiryCode,
    @JsonKey(name: 'TransactionRefNo') @Default('') String transactionRefNo,
    @JsonKey(name: 'CustomerCode') @Default('') String customerCode,
    @JsonKey(name: 'EmailId') @Default('') String emailId,
    @JsonKey(name: 'EnquiryStatus') @Default('') String enquiryStatus,
    @JsonKey(name: 'LanguageCode') @Default('') String languageCode,
    @JsonKey(name: 'EnquiryType') @Default('') String enquiryType,
    @JsonKey(name: 'EnquiryTypeCode') int? enquiryTypeCode,
    @JsonKey(name: 'EnquiryStatusCode') @Default('') String enquiryStatusCode,
    @JsonKey(name: 'PhoneNo') @Default('') String phoneNo,
    @JsonKey(name: 'QueryType') @Default('') String queryType,
    @JsonKey(name: 'QueryTypeCode') int? queryTypeCode,
    @JsonKey(name: 'BranchCode') @Default('') String branchCode,
    @JsonKey(name: 'Remarks') @Default('') String remarks,
    @JsonKey(name: 'TrackingDetails') @Default([]) List<TrackingDetailFz> trackingDetails,
  }) = _EnquiryFz;

  factory EnquiryFz.fromJson(Map<String, Object?> json) => _$EnquiryFzFromJson(json);
}

@freezed
abstract class TrackingDetailFz with _$TrackingDetailFz {
  const factory TrackingDetailFz({
    @JsonKey(name: 'SlNo') @Default('') String slNo,
    @JsonKey(name: 'BranchCode') @Default('') String branchCode,
    @JsonKey(name: 'Remarks') @Default('') String remarks,
    @JsonKey(name: 'EnquiryStatus') @Default('') String enquiryStatus,
    @JsonKey(name: 'LanguageCode') @Default('') String languageCode,
  }) = _TrackingDetailFz;

  factory TrackingDetailFz.fromJson(Map<String, Object?> json) => _$TrackingDetailFzFromJson(json);
}
