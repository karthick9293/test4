// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgotPassword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForgotPassword _$ForgotPasswordFromJson(Map<String, dynamic> json) =>
    _ForgotPassword(
      statusCode: json['StatusCode'] as String? ?? "",
      statusMessage: json['StatusMessage'] as String? ?? "",
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      data: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForgotPasswordToJson(_ForgotPassword instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
      'Data': instance.data,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['MessageCode'] as String? ?? "",
      messageType: json['MessageType'] as String? ?? "",
      messageHeader: json['MessageHeader'] as String? ?? "",
      messageDescription: json['MessageDescription'] as String? ?? "",
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageType': instance.messageType,
      'MessageHeader': instance.messageHeader,
      'MessageDescription': instance.messageDescription,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      messageCode: json['MessageCode'] as String? ?? "",
      messageDetails: json['MessageDetails'] as String? ?? "",
      stepOrderId: json['StepOrderId'] as String? ?? "",
      customerCode: json['CustomerCode'] as String? ?? "",
      idNo: json['IdNo'] as String? ?? "",
      notificationArray: (json['NotificationArray'] as List<dynamic>?)
          ?.map((e) => NotificationArray.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageDetails': instance.messageDetails,
      'StepOrderId': instance.stepOrderId,
      'CustomerCode': instance.customerCode,
      'IdNo': instance.idNo,
      'NotificationArray': instance.notificationArray,
    };

_NotificationArray _$NotificationArrayFromJson(Map<String, dynamic> json) =>
    _NotificationArray(
      messageType: json['MessageType'] as String? ?? "",
      recipient: json['Recipient'] as String? ?? "",
      otpId: json['OtpId'] as String? ?? "",
      statusCode: json['StatusCode'] as String? ?? "",
      statusMessage: json['StatusMessage'] as String? ?? "",
    );

Map<String, dynamic> _$NotificationArrayToJson(_NotificationArray instance) =>
    <String, dynamic>{
      'MessageType': instance.messageType,
      'Recipient': instance.recipient,
      'OtpId': instance.otpId,
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
    };
