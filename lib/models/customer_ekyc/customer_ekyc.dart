import 'package:freezed_annotation/freezed_annotation.dart';

import '../contact_us/contact_us_fz.dart';

part 'customer_ekyc.freezed.dart';
part 'customer_ekyc.g.dart';

@freezed
abstract class CustomerEkyc with _$CustomerEkyc {
  const factory CustomerEkyc({
    @JsonKey(name: "StatusCode") String? statusCode,
    @JsonKey(name: "StatusMessage") String? statusMessage,
    @JsonKey(name: "CustomMessageDetails") CustomMessageDetails? customMessageDetails,
    @JsonKey(name: "CustomerCode") dynamic customerCode,
    @JsonKey(name: "DocumentDetails") List<DocumentDetail>? documentDetails,
  }) = _CustomerEkyc;

  factory CustomerEkyc.fromJson(Map<String, Object?> json) => _$CustomerEkycFromJson(json);
}

@freezed
abstract class DocumentDetail with _$DocumentDetail {
  const factory DocumentDetail({
    @JsonKey(name: "DocumentId") String? documentId,
    @JsonKey(name: "DocumentName") String? documentName,
    @JsonKey(name: "DocumentType") String? documentType,
    @JsonKey(name: "DocumentContent") String? documentContent,
    @JsonKey(name: "Status") String? status,
  }) = _DocumentDetail;

  factory DocumentDetail.fromJson(Map<String, Object?> json) => _$DocumentDetailFromJson(json);
}
