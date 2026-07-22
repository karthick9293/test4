// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_ekyc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerEkyc _$CustomerEkycFromJson(Map<String, dynamic> json) =>
    _CustomerEkyc(
      statusCode: json['StatusCode'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
      customerCode: json['CustomerCode'],
      documentDetails: (json['DocumentDetails'] as List<dynamic>?)
          ?.map((e) => DocumentDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerEkycToJson(_CustomerEkyc instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
      'CustomerCode': instance.customerCode,
      'DocumentDetails': instance.documentDetails,
    };

_DocumentDetail _$DocumentDetailFromJson(Map<String, dynamic> json) =>
    _DocumentDetail(
      documentId: json['DocumentId'] as String?,
      documentName: json['DocumentName'] as String?,
      documentType: json['DocumentType'] as String?,
      documentContent: json['DocumentContent'] as String?,
      status: json['Status'] as String?,
    );

Map<String, dynamic> _$DocumentDetailToJson(_DocumentDetail instance) =>
    <String, dynamic>{
      'DocumentId': instance.documentId,
      'DocumentName': instance.documentName,
      'DocumentType': instance.documentType,
      'DocumentContent': instance.documentContent,
      'Status': instance.status,
    };
