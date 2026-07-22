// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enquiry_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EnquiryDataFz _$EnquiryDataFzFromJson(Map<String, dynamic> json) =>
    _EnquiryDataFz(
      enquiryList: (json['EnquiryList'] as List<dynamic>?)
              ?.map((e) => EnquiryFz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EnquiryDataFzToJson(_EnquiryDataFz instance) =>
    <String, dynamic>{
      'EnquiryList': instance.enquiryList,
    };

_EnquiryFz _$EnquiryFzFromJson(Map<String, dynamic> json) => _EnquiryFz(
      enquiryCode: json['EnquiryCode'] as String? ?? '',
      transactionRefNo: json['TransactionRefNo'] as String? ?? '',
      customerCode: json['CustomerCode'] as String? ?? '',
      emailId: json['EmailId'] as String? ?? '',
      enquiryStatus: json['EnquiryStatus'] as String? ?? '',
      languageCode: json['LanguageCode'] as String? ?? '',
      enquiryType: json['EnquiryType'] as String? ?? '',
      enquiryTypeCode: (json['EnquiryTypeCode'] as num?)?.toInt(),
      enquiryStatusCode: json['EnquiryStatusCode'] as String? ?? '',
      phoneNo: json['PhoneNo'] as String? ?? '',
      queryType: json['QueryType'] as String? ?? '',
      queryTypeCode: (json['QueryTypeCode'] as num?)?.toInt(),
      branchCode: json['BranchCode'] as String? ?? '',
      remarks: json['Remarks'] as String? ?? '',
      trackingDetails: (json['TrackingDetails'] as List<dynamic>?)
              ?.map((e) => TrackingDetailFz.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EnquiryFzToJson(_EnquiryFz instance) =>
    <String, dynamic>{
      'EnquiryCode': instance.enquiryCode,
      'TransactionRefNo': instance.transactionRefNo,
      'CustomerCode': instance.customerCode,
      'EmailId': instance.emailId,
      'EnquiryStatus': instance.enquiryStatus,
      'LanguageCode': instance.languageCode,
      'EnquiryType': instance.enquiryType,
      'EnquiryTypeCode': instance.enquiryTypeCode,
      'EnquiryStatusCode': instance.enquiryStatusCode,
      'PhoneNo': instance.phoneNo,
      'QueryType': instance.queryType,
      'QueryTypeCode': instance.queryTypeCode,
      'BranchCode': instance.branchCode,
      'Remarks': instance.remarks,
      'TrackingDetails': instance.trackingDetails,
    };

_TrackingDetailFz _$TrackingDetailFzFromJson(Map<String, dynamic> json) =>
    _TrackingDetailFz(
      slNo: json['SlNo'] as String? ?? '',
      branchCode: json['BranchCode'] as String? ?? '',
      remarks: json['Remarks'] as String? ?? '',
      enquiryStatus: json['EnquiryStatus'] as String? ?? '',
      languageCode: json['LanguageCode'] as String? ?? '',
    );

Map<String, dynamic> _$TrackingDetailFzToJson(_TrackingDetailFz instance) =>
    <String, dynamic>{
      'SlNo': instance.slNo,
      'BranchCode': instance.branchCode,
      'Remarks': instance.remarks,
      'EnquiryStatus': instance.enquiryStatus,
      'LanguageCode': instance.languageCode,
    };
