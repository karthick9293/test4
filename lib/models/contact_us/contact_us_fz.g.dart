// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactUsFz _$ContactUsFzFromJson(Map<String, dynamic> json) => _ContactUsFz(
      statusCode: json['StatusCode'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      data: json['Data'] == null
          ? null
          : Data.fromJson(json['Data'] as Map<String, dynamic>),
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactUsFzToJson(_ContactUsFz instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'Data': instance.data,
      'CustomMessageDetails': instance.customMessageDetails,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['MessageCode'] as String?,
      messageType: json['MessageType'] as String?,
      messageHeader: json['MessageHeader'] as String?,
      messageDescription: json['MessageDescription'] as String?,
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
      phoneNo: json['PhoneNo'] as String?,
      companyName: json['CompanyName'] as String?,
      email: json['Email'] as String?,
      address: json['Address'] as String?,
      branchDetails: (json['BranchDetails'] as List<dynamic>?)
          ?.map((e) => BranchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'PhoneNo': instance.phoneNo,
      'CompanyName': instance.companyName,
      'Email': instance.email,
      'Address': instance.address,
      'BranchDetails': instance.branchDetails,
    };

_BranchDetail _$BranchDetailFromJson(Map<String, dynamic> json) =>
    _BranchDetail(
      branchName: json['BranchName'] as String?,
      latitude: json['Latitudes'] as String?,
      longitude: json['Longitudes'] as String?,
      branchCode: json['BranchCode'] as String?,
      zoneName: json['ZoneName'] as String?,
      locationMap: json['LocationMap'] as String?,
      landmark: json['Landmark'] as String?,
      phone: json['Phone'] as String?,
      branchAddress: json['BranchAddress'] as String?,
      status: json['Status'] as String?,
      languageCode: json['LanguageCode'] as String?,
    );

Map<String, dynamic> _$BranchDetailToJson(_BranchDetail instance) =>
    <String, dynamic>{
      'BranchName': instance.branchName,
      'Latitudes': instance.latitude,
      'Longitudes': instance.longitude,
      'BranchCode': instance.branchCode,
      'ZoneName': instance.zoneName,
      'LocationMap': instance.locationMap,
      'Landmark': instance.landmark,
      'Phone': instance.phone,
      'BranchAddress': instance.branchAddress,
      'Status': instance.status,
      'LanguageCode': instance.languageCode,
    };
