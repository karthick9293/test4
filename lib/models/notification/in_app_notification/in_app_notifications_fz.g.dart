// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_app_notifications_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InAppNotificationsFZ _$InAppNotificationsFZFromJson(
        Map<String, dynamic> json) =>
    _InAppNotificationsFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      notificationsList: (json['NotificationsList'] as List<dynamic>?)
              ?.map((e) => NotificationFz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InAppNotificationsFZToJson(
        _InAppNotificationsFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'NotificationsList': instance.notificationsList,
      'CustomMessageDetails': instance.customMessageDetails,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['MessageCode'] as String? ?? '',
      messageType: json['MessageType'] as String? ?? '',
      messageHeader: json['MessageHeader'] as String? ?? '',
      messageDescription: json['MessageDescription'] as String? ?? '',
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageType': instance.messageType,
      'MessageHeader': instance.messageHeader,
      'MessageDescription': instance.messageDescription,
    };

_NotificationFz _$NotificationFzFromJson(Map<String, dynamic> json) =>
    _NotificationFz(
      notificationId: (json['NotificationId'] as num?)?.toInt() ?? 0,
      createdOn: json['CreatedOn'] as String? ?? '',
      subject: json['Subject'] as String? ?? '',
      messageContent: json['MessageContent'] as String? ?? '',
      customerCode: json['CustomerCode'] as String? ?? '',
      deviceId: json['DeviceId'] as String? ?? '',
      status: json['Status'] as String? ?? '',
    );

Map<String, dynamic> _$NotificationFzToJson(_NotificationFz instance) =>
    <String, dynamic>{
      'NotificationId': instance.notificationId,
      'CreatedOn': instance.createdOn,
      'Subject': instance.subject,
      'MessageContent': instance.messageContent,
      'CustomerCode': instance.customerCode,
      'DeviceId': instance.deviceId,
      'Status': instance.status,
    };
