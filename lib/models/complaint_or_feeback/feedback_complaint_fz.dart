import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_complaint_fz.freezed.dart';
part 'feedback_complaint_fz.g.dart';

@freezed
abstract class FeedbackComplaintFz with _$FeedbackComplaintFz {
  const factory FeedbackComplaintFz({
    @JsonKey(name: 'StatusCode') required String statusCode,
    @JsonKey(name: 'StatusMessage') required String statusMessage,
    @JsonKey(name: 'CustomMessageDetails') required CustomMessageDetails customMessageDetails,
    @JsonKey(name: 'Data') EnquiryData? data,
  }) = _FeedbackComplaintFz;

  factory FeedbackComplaintFz.fromJson(Map<String, dynamic> json) => _$FeedbackComplaintFzFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: 'MessageCode') required String messageCode,
    @JsonKey(name: 'MessageType') required String messageType,
    @JsonKey(name: 'MessageHeader') required String messageHeader,
    @JsonKey(name: 'MessageDescription') required String messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, dynamic> json) => _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class EnquiryData with _$EnquiryData {
  const factory EnquiryData({
    @JsonKey(name: 'EnquiryCode') required String enquiryCode,
  }) = _EnquiryData;

  factory EnquiryData.fromJson(Map<String, dynamic> json) => _$EnquiryDataFromJson(json);
}
