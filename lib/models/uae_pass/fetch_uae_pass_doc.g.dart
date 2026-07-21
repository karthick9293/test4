// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_uae_pass_doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FetchUAEPassDoc _$FetchUAEPassDocFromJson(Map<String, dynamic> json) =>
    _FetchUAEPassDoc(
      uUID: json['UUID'] as String?,
      emiratesID: json['EmiratesID'] as String?,
      documentID1: json['DocumentID1'] as String?,
      documentCode1: json['DocumentCode1'] as String?,
      documentID2: json['DocumentID2'] as String?,
      documentCode2: json['DocumentCode2'] as String?,
      reqAuthorized: json['ReqAuthorized'] as String?,
      dateOfBirth: json['DateOfBirth'] == null
          ? null
          : DateTime.parse(json['DateOfBirth'] as String),
      placeOfBirth: json['PlaceOfBirth'] as String?,
      expiryDate1: json['ExpiryDate1'] == null
          ? null
          : DateTime.parse(json['ExpiryDate1'] as String),
      employerName: json['EmployerName'] as String?,
      notificationExpiry: json['NotificationExpiry'] == null
          ? null
          : DateTime.parse(json['NotificationExpiry'] as String),
      visualizationExpiry: json['VisualizationExpiry'] == null
          ? null
          : DateTime.parse(json['VisualizationExpiry'] as String),
    );

Map<String, dynamic> _$FetchUAEPassDocToJson(_FetchUAEPassDoc instance) =>
    <String, dynamic>{
      'UUID': instance.uUID,
      'EmiratesID': instance.emiratesID,
      'DocumentID1': instance.documentID1,
      'DocumentCode1': instance.documentCode1,
      'DocumentID2': instance.documentID2,
      'DocumentCode2': instance.documentCode2,
      'ReqAuthorized': instance.reqAuthorized,
      'DateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'PlaceOfBirth': instance.placeOfBirth,
      'ExpiryDate1': instance.expiryDate1?.toIso8601String(),
      'EmployerName': instance.employerName,
      'NotificationExpiry': instance.notificationExpiry?.toIso8601String(),
      'VisualizationExpiry': instance.visualizationExpiry?.toIso8601String(),
    };
