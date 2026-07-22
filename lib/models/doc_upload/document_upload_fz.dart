import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_upload_fz.freezed.dart';
part 'document_upload_fz.g.dart';

@freezed
abstract class DocumentUploadFZ with _$DocumentUploadFZ {
  const factory DocumentUploadFZ({
    @JsonKey(name: 'statusCode') @Default('') String statusCode,
    @JsonKey(name: 'statusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'customMessageDetails') CustomMessageDetails? customMessageDetails,
  }) = _DocumentUploadFZ;

  factory DocumentUploadFZ.fromJson(Map<String, Object?> json) => _$DocumentUploadFZFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: 'messageCode') @Default('') String messageCode,
    @JsonKey(name: 'messageType') @Default('') String messageType,
    @JsonKey(name: 'messageHeader') @Default('') String messageHeader,
    @JsonKey(name: 'messageDescription') @Default('') String messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) => _$CustomMessageDetailsFromJson(json);
}
