import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgotPassword.freezed.dart';
part 'forgotPassword.g.dart';

@freezed
abstract class ForgotPassword with _$ForgotPassword {
  const factory ForgotPassword({
    @JsonKey(name: "StatusCode") @Default("") String statusCode,
    @JsonKey(name: "StatusMessage") @Default("") String statusMessage,
    @JsonKey(name: "CustomMessageDetails") CustomMessageDetails? customMessageDetails,
    @JsonKey(name: "Data") Data? data,
  }) = _ForgotPassword;

  factory ForgotPassword.fromJson(Map<String, Object?> json) => _$ForgotPasswordFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: "MessageCode") @Default("") String messageCode,
    @JsonKey(name: "MessageType") @Default("") String messageType,
    @JsonKey(name: "MessageHeader") @Default("") String messageHeader,
    @JsonKey(name: "MessageDescription") @Default("") String messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) => _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: "MessageCode") @Default("") String messageCode,
    @JsonKey(name: "MessageDetails") @Default("") String messageDetails,
    @JsonKey(name: "StepOrderId") @Default("") String stepOrderId,
    @JsonKey(name: "CustomerCode") @Default("") String customerCode,
    @JsonKey(name: "IdNo") @Default("") String idNo,
    @JsonKey(name: "NotificationArray") List<NotificationArray>? notificationArray,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class NotificationArray with _$NotificationArray {
  const factory NotificationArray({
    @JsonKey(name: "MessageType") @Default("") String messageType,
    @JsonKey(name: "Recipient") @Default("") String recipient,
    @JsonKey(name: "OtpId") @Default("") String otpId,
    @JsonKey(name: "StatusCode") @Default("") String statusCode,
    @JsonKey(name: "StatusMessage") @Default("") String statusMessage,
  }) = _NotificationArray;

  factory NotificationArray.fromJson(Map<String, Object?> json) => _$NotificationArrayFromJson(json);
}
