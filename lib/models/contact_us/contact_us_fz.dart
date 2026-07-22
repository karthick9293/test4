import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_us_fz.freezed.dart';
part 'contact_us_fz.g.dart';

@freezed
abstract class ContactUsFz with _$ContactUsFz {
  const factory ContactUsFz({
    @JsonKey(name: "StatusCode") String? statusCode,
    @JsonKey(name: "StatusMessage") String? statusMessage,
    @JsonKey(name: "Data") Data? data,
    @JsonKey(name: "CustomMessageDetails") CustomMessageDetails? customMessageDetails,
  }) = _ContactUsFz;

  factory ContactUsFz.fromJson(Map<String, Object?> json) => _$ContactUsFzFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: "MessageCode") String? messageCode,
    @JsonKey(name: "MessageType") String? messageType,
    @JsonKey(name: "MessageHeader") String? messageHeader,
    @JsonKey(name: "MessageDescription") String? messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) => _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: "PhoneNo") String? phoneNo,
    @JsonKey(name: "CompanyName") String? companyName,
    @JsonKey(name: "Email") String? email,
    @JsonKey(name: "Address") String? address,
    @JsonKey(name: "BranchDetails") List<BranchDetail>? branchDetails,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class BranchDetail with _$BranchDetail {
  const factory BranchDetail({
    @JsonKey(name: "BranchName") String? branchName,
    @JsonKey(name: "Latitudes") String? latitude,
    @JsonKey(name: "Longitudes") String? longitude,
    @JsonKey(name: "BranchCode") String? branchCode,
    @JsonKey(name: "ZoneName") String? zoneName,
    @JsonKey(name: "LocationMap") String? locationMap,
    @JsonKey(name: "Landmark") String? landmark,
    @JsonKey(name: "Phone") String? phone,
    @JsonKey(name: "BranchAddress") String? branchAddress,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "LanguageCode") String? languageCode,
  }) = _BranchDetail;

  factory BranchDetail.fromJson(Map<String, Object?> json) => _$BranchDetailFromJson(json);
}
