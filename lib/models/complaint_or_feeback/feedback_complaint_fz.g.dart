// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_complaint_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackComplaintFz _$FeedbackComplaintFzFromJson(Map<String, dynamic> json) =>
    _FeedbackComplaintFz(
      statusCode: json['StatusCode'] as String,
      statusMessage: json['StatusMessage'] as String,
      customMessageDetails: CustomMessageDetails.fromJson(
          json['CustomMessageDetails'] as Map<String, dynamic>),
      data: json['Data'] == null
          ? null
          : EnquiryData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackComplaintFzToJson(
        _FeedbackComplaintFz instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
      'Data': instance.data,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['MessageCode'] as String,
      messageType: json['MessageType'] as String,
      messageHeader: json['MessageHeader'] as String,
      messageDescription: json['MessageDescription'] as String,
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageType': instance.messageType,
      'MessageHeader': instance.messageHeader,
      'MessageDescription': instance.messageDescription,
    };

_EnquiryData _$EnquiryDataFromJson(Map<String, dynamic> json) => _EnquiryData(
      enquiryCode: json['EnquiryCode'] as String,
    );

Map<String, dynamic> _$EnquiryDataToJson(_EnquiryData instance) =>
    <String, dynamic>{
      'EnquiryCode': instance.enquiryCode,
    };
