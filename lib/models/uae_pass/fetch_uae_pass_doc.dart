import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_uae_pass_doc.freezed.dart';
part 'fetch_uae_pass_doc.g.dart';

@freezed
abstract class FetchUAEPassDoc with _$FetchUAEPassDoc {
  factory FetchUAEPassDoc({
    @JsonKey(name: 'UUID') String? uUID,
    @JsonKey(name: 'EmiratesID') String? emiratesID,
    @JsonKey(name: 'DocumentID1') String? documentID1,
    @JsonKey(name: 'DocumentCode1') String? documentCode1,
    @JsonKey(name: 'DocumentID2') String? documentID2,
    @JsonKey(name: 'DocumentCode2') String? documentCode2,
    @JsonKey(name: 'ReqAuthorized') String? reqAuthorized,
    @JsonKey(name: 'DateOfBirth') DateTime? dateOfBirth,
    @JsonKey(name: 'PlaceOfBirth') String? placeOfBirth,
    @JsonKey(name: 'ExpiryDate1') DateTime? expiryDate1,
    @JsonKey(name: 'EmployerName') String? employerName,
    @JsonKey(name: 'NotificationExpiry') DateTime? notificationExpiry,
    @JsonKey(name: 'VisualizationExpiry') DateTime? visualizationExpiry,
  }) = _FetchUAEPassDoc;

  factory FetchUAEPassDoc.fromJson(Map<String, dynamic> json) => _$FetchUAEPassDocFromJson(json);
}
