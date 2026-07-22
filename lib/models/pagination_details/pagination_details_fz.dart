import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_details_fz.freezed.dart';
part 'pagination_details_fz.g.dart';

@freezed
abstract class PaginationDetailsFz with _$PaginationDetailsFz {
  const factory PaginationDetailsFz({
    @JsonKey(name: 'TotalRecords') @Default(0) int totalRecords,
    @JsonKey(name: 'TotalPages') @Default(0) int totalPages,
    @JsonKey(name: 'PageNumber') @Default(1) int pageNumber,
    @JsonKey(name: 'PageSize') @Default(10) int pageSize,
  }) = _PaginationDetailsFz;

  factory PaginationDetailsFz.fromJson(Map<String, Object?> json) => _$PaginationDetailsFzFromJson(json);
}
