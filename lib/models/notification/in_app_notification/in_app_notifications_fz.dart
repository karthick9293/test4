import 'package:freezed_annotation/freezed_annotation.dart';

part 'in_app_notifications_fz.freezed.dart';
part 'in_app_notifications_fz.g.dart';

@freezed
abstract class InAppNotificationsFZ with _$InAppNotificationsFZ {
  const factory InAppNotificationsFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'NotificationsList')
    @Default([])
    List<NotificationFz> notificationsList,
    @JsonKey(name: 'CustomMessageDetails')
    CustomMessageDetails? customMessageDetails,
  }) = _InAppNotificationsFZ;

  factory InAppNotificationsFZ.fromJson(Map<String, Object?> json) =>
      _$InAppNotificationsFZFromJson(json);
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
      _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class NotificationFz with _$NotificationFz {
  const factory NotificationFz({
    @JsonKey(name: 'NotificationId') @Default(0) int notificationId,
    @JsonKey(name: 'CreatedOn') @Default('') String createdOn,
    @JsonKey(name: 'Subject') @Default('') String subject,
    @JsonKey(name: 'MessageContent') @Default('') String messageContent,
    @JsonKey(name: 'CustomerCode') @Default('') String customerCode,
    @JsonKey(name: 'DeviceId') @Default('') String deviceId,
    @JsonKey(name: 'Status') @Default('') String status,
  }) = _NotificationFz;

  factory NotificationFz.fromJson(Map<String, Object?> json) =>
      _$NotificationFzFromJson(json);
}
