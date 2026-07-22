import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_device_fz.freezed.dart';
part 'register_device_fz.g.dart';

@freezed
abstract class RegisterDeviceFZ with _$RegisterDeviceFZ {
  const factory RegisterDeviceFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'CustomMessageDetails')
    CustomMessageDetails? customMessageDetails,
    @JsonKey(name: 'Data') Data? data,
  }) = _RegisterDeviceFZ;

  factory RegisterDeviceFZ.fromJson(Map<String, Object?> json) =>
      _$RegisterDeviceFZFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'StepOrderId') @Default('') String stepOrderId,
    @JsonKey(name: 'CustomerCode') @Default('') String customerCode,
    @JsonKey(name: 'Token') @Default('') String appUserToken,
    @JsonKey(name: 'Otp') @Default('') String otp,
    @JsonKey(name: 'OtpId') @Default('') String otpId,
    @JsonKey(name: 'EMAILOTPID') @Default('') String emailOtpId,
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageDetails') @Default('') String messageDetails,
    @JsonKey(name: "NotificationArray")
    @Default([])
    List<NotificationArray>? notificationArray,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageType') @Default('') String messageType,
    @JsonKey(name: 'MessageHeader') @Default('') String messageHeader,
    @JsonKey(name: 'MessageDescription') @Default('') String messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) =>
      _$CustomMessageDetailsFromJson(
          json.map((key, value) => MapEntry(key.trim(), value)));

  Map<String, dynamic> toJson();
}

@freezed
abstract class NotificationArray with _$NotificationArray {
  const factory NotificationArray({
    @JsonKey(name: "MessageType") String? messageType,
    @JsonKey(name: "Recipient") String? recipient,
    @JsonKey(name: "OtpId") String? otpId,
    @JsonKey(name: "StatusCode") String? statusCode,
    @JsonKey(name: "StatusMessage") String? statusMessage,
  }) = _NotificationArray;

  factory NotificationArray.fromJson(Map<String, Object?> json) =>
      _$NotificationArrayFromJson(json);
}
