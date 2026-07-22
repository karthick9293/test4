// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_details_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationDetailsFz _$PaginationDetailsFzFromJson(Map<String, dynamic> json) =>
    _PaginationDetailsFz(
      totalRecords: (json['TotalRecords'] as num?)?.toInt() ?? 0,
      totalPages: (json['TotalPages'] as num?)?.toInt() ?? 0,
      pageNumber: (json['PageNumber'] as num?)?.toInt() ?? 1,
      pageSize: (json['PageSize'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$PaginationDetailsFzToJson(
        _PaginationDetailsFz instance) =>
    <String, dynamic>{
      'TotalRecords': instance.totalRecords,
      'TotalPages': instance.totalPages,
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
    };
