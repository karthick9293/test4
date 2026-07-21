import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../masters/master_response_fz.dart';

part 'beneficiary_fz.freezed.dart';
part 'beneficiary_fz.g.dart';

Object? _readName(Map json, String key) {
  String name = "";
  if (json['FirstName'] != null && json['FirstName'] != "") {
    name += json['FirstName'];
  }
  if (json['MiddleName'] != null && json['MiddleName'] != "") {
    name += " ${json['MiddleName']}";
  }
  if (json['LastName'] != null && json['LastName'] != "") {
    name += " ${json['LastName']}";
  }
  if (name != "") {
    return name;
  }
  return json[key];
}

dynamic _readStatus(Map json, String key) {
  if (json['Status'] != null && json['Status'] != "") {
    return json['Status'];
  } else {
    return json[key];
  }
}

DateTime? _parseDateTime(dynamic value) {
  if (value is String && value.isNotEmpty) {
    try {
      // Matches "27/06/2025 12:08:08"
      return DateFormat("dd/MM/yyyy HH:mm:ss").parse(value);
    } catch (_) {
      return null;
    }
  }
  return null;
}

String? _formatDateTime(DateTime? date) {
  if (date == null) return null;
  return DateFormat("dd/MM/yyyy HH:mm:ss").format(date);
}

@freezed
abstract class BeneficiaryFz with _$BeneficiaryFz {
  const factory BeneficiaryFz({
    @JsonKey(name: "Active", readValue: _readStatus) String? active,
    @JsonKey(name: "Archive") String? archive,
    @JsonKey(name: "CustomerCode") String? customerCode,
    @JsonKey(name: "BeneficiaryUID") int? id,
    @JsonKey(name: "CoreBeneficiaryUID") String? coreBeneficiaryUid,
    @JsonKey(name: "name", readValue: _readName) String? name,
    @JsonKey(name: "FirstName") String? firstName,
    @JsonKey(name: "MiddleName") String? middleName,
    @JsonKey(name: "LastName") String? lastName,
    @JsonKey(name: "NationalityCode") MasterResponseFZ? nationality,
    @JsonKey(name: "GenderCode") MasterResponseFZ? gender,
    @JsonKey(name: "DateOfBirth") String? dateOfBirth,
    @JsonKey(name: "Phone") String? phone,
    @JsonKey(name: "Email") String? email,
    @JsonKey(name: "Address1") String? address1,
    @JsonKey(name: "Address2") String? address2,
    @JsonKey(name: "RelationshipCode") MasterResponseFZ? relationship,
    @JsonKey(name: "ServiceCategoryCode") MasterResponseFZ? serviceType,
    @JsonKey(name: "IdNo") String? idNo,
    @JsonKey(name: "BeneficiaryMobile") String? mobile,
    @JsonKey(name: "ServiceCountryCode") MasterResponseFZ? serviceCountry,
    @JsonKey(name: "ServiceCurrencyCode") MasterResponseFZ? serviceCurrency,
    @JsonKey(name: "CountryCode") MasterResponseFZ? country,
    @JsonKey(name: "StateCode") MasterResponseFZ? state,
    @JsonKey(name: "CityCode") MasterResponseFZ? city,
    @JsonKey(name: "AccountNumber") String? accountNumber,
    @JsonKey(name: "BeneficiaryBankCode") MasterResponseFZ? bank,
    @JsonKey(name: "BeneficiaryBranchCode") MasterResponseFZ? branch,
    @JsonKey(name: "BicCode") MasterResponseFZ? bicType,
    @JsonKey(name: "BicValue") String? bicValue,
    @JsonKey(name: "Favourites") String? fav,
    @JsonKey(name: "SortOrder") int? sortOrder,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "ServiceProviderCode") MasterResponseFZ? serviceProvider,
    @JsonKey(name: "IdTypeCode") MasterResponseFZ? idType,
    @JsonKey(name: "BeneficiaryTypeCode") String? beneficiaryType,
    @JsonKey(name: "isCorrespondentActive") String? isCorrespondentActive,
    @JsonKey(
        name: "CreatedOn", fromJson: _parseDateTime, toJson: _formatDateTime)
    DateTime? createdOn,
  }) = _BeneficiaryFz;

  factory BeneficiaryFz.fromJson(Map<String, Object?> json) =>
      _$BeneficiaryFzFromJson(json);
}
