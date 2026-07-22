import 'package:freezed_annotation/freezed_annotation.dart';

part 'query_type_fz.freezed.dart';
part 'query_type_fz.g.dart';

@freezed
abstract class QueryTypeFz with _$QueryTypeFz {
  const factory QueryTypeFz({
    @JsonKey(name: 'QueryTypeCode') String? queryTypeCode,
    @JsonKey(name: 'QueryTypeName') String? queryTypeName,
  }) = _QueryTypeFz;

  factory QueryTypeFz.fromJson(Map<String, dynamic> json) => _$QueryTypeFzFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: 'MessageCode') String? messageCode,
    @JsonKey(name: 'MessageType') String? messageType,
    @JsonKey(name: 'MessageHeader') String? messageHeader,
    @JsonKey(name: 'MessageDescription') String? messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, dynamic> json) => _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class QueryTypeResponse with _$QueryTypeResponse {
  const QueryTypeResponse._();

  const factory QueryTypeResponse({
    @JsonKey(name: 'StatusCode') String? statusCode,
    @JsonKey(name: 'StatusMessage') String? statusMessage,
    @JsonKey(name: 'QueryList') List<QueryTypeFz>? queryList,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetails? customMessageDetails,
  }) = _QueryTypeResponse;

  factory QueryTypeResponse.fromJson(Map<String, dynamic> json) => _$QueryTypeResponseFromJson(json);

  bool get isSuccess {
    if (statusCode == null) return false;
    return statusCode == '000';
  }
}
