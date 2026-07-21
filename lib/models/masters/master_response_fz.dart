import 'package:freezed_annotation/freezed_annotation.dart';

// ignore_for_file: non_constant_identifier_names

part 'master_response_fz.freezed.dart';
part 'master_response_fz.g.dart';

Object? _readCode(Map json, String key) {
  if (json['code'] != null && json['code'] != "") {
    return json['code'];
  } else if (json['BankCode'] != null && json['BankCode'] != "") {
    return json['BankCode'];
  } else if (json['BranchCode'] != null && json['BranchCode'] != "") {
    return json['BranchCode'];
  } else if (json['PurposeCode'] != null && json['PurposeCode'] != "") {
    return json['PurposeCode'];
  } else if (json['SourceCode'] != null && json['SourceCode'] != "") {
    return json['SourceCode'];
  } else if (json['CategoryCode'] != null && json['CategoryCode'] != "") {
    return json['CategoryCode'];
  } else if (json['CountryCode'] != null && json['CountryCode'] != "") {
    return json['CountryCode'];
  } else if (json['CurrencyCode'] != null && json['CurrencyCode'] != "") {
    return json['CurrencyCode'];
  } else if (json['StateCode'] != null && json['StateCode'] != "") {
    return json['StateCode'];
  }else if (json['CityCode'] != null && json['CityCode'] != "") {
    return json['CityCode'];
  }
  return json[key];
}

Object? _readName(Map json, String key) {
  if (json['codeName'] != null && json['codeName'] != "") {
    return json['codeName'];
  } else if (json['BankName'] != null && json['BankName'] != "") {
    return json['BankName'];
  } else if (json['BranchName'] != null && json['BranchName'] != "") {
    return json['BranchName'];
  } else if (json['Provider'] != null && json['Provider'] != "") {
    return json['Provider'];
  } else if (json['Purpose'] != null && json['Purpose'] != "") {
    return json['Purpose'];
  } else if (json['Sourcename'] != null && json['Sourcename'] != "") {
    return json['Sourcename'];
  } else if (json['CategoryName'] != null && json['CategoryName'] != "") {
    return json['CategoryName'];
  } else if (json['CountryName'] != null && json['CountryName'] != "") {
    return json['CountryName'];
  } else if (json['CurrencyName'] != null && json['CurrencyName'] != "") {
    return json['CurrencyName'];
  }else if (json['StateName'] != null && json['StateName'] != "") {
    return json['StateName'];
  }else if (json['CityName'] != null && json['CityName'] != "") {
    return json['CityName'];
  }
  return json[key];
}

@freezed
abstract class MasterResponseFZ with _$MasterResponseFZ {
  const factory MasterResponseFZ({
    @JsonKey(name: 'id') @Default('') String id,
    @JsonKey(name: 'Desc', readValue: _readName) @Default('') String Desc,
    @JsonKey(name: 'Code', readValue: _readCode) @Default('') String Code,
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'baseUrl') @Default('') String baseUrl,
    @JsonKey(name: 'address') @Default('') String address,
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'phone') @Default('') String phone,
    @JsonKey(name: 'bicType') @Default('') String bicType,
    @JsonKey(name: 'bicValue') @Default('') String bicValue,
    @JsonKey(name: 'CurrencyFlagPath') @Default('') String CurrencyFlagPath,
    @JsonKey(name: 'label') @Default('') String label,
    @JsonKey(name: 'BankCode') @Default('') String BankCode,
    @JsonKey(name: 'BankName') @Default('') String BankName,
    @JsonKey(name: 'BranchCode') @Default('') String BranchCode,
    @JsonKey(name: 'BranchName') @Default('') String BranchName,
    @JsonKey(name: 'BranchAddress1') @Default('') String BranchAddress1,
    @JsonKey(name: 'BranchAddress2') @Default('') String BranchAddress2,
    @JsonKey(name: 'BranchAddress3') @Default('') String BranchAddress3,
    @JsonKey(name: 'BranchBicDetails') @Default([]) List<BranchBicDetails> branchBicDetails,
    @JsonKey(name: 'Provider') @Default('') String provider,
    @JsonKey(name: 'MappingCode') @Default('') String mappingCode,
    @JsonKey(name: 'ImageContent') @Default('') String imageContent,
    @JsonKey(name: 'Status') @Default('') String providerStatus,
    @JsonKey(name: 'ServiceCategory') @Default('') String providerServiceCategory,
    @JsonKey(name: 'CategoryCode') @Default('') String categoryCode,
    @JsonKey(name: 'CategoryName') @Default('') String categoryName,
    @JsonKey(name: 'CountryCode') @Default('') String countryCode,
    @JsonKey(name: 'CountryName') @Default('') String countryName,
    @JsonKey(name: 'CurrencyCode') @Default('') String currencyCode,
    @JsonKey(name: 'CurrencyName') @Default('') String currencyName,
    @JsonKey(name: 'StateName') @Default('') String stateName,
    @JsonKey(name: 'StateCode') @Default('') String stateCode,
    @JsonKey(name: 'CityName') @Default('') String cityName,
    @JsonKey(name: 'CityCode') @Default('') String cityCode,
    @JsonKey(name: 'AccountLengthList') List<BankAccountLength>? accountLengthList,
  }) = _MasterResponseFZ;

  factory MasterResponseFZ.fromJson(Map<String, Object?> json) => _$MasterResponseFZFromJson(json);
}

@freezed
abstract class BranchBicDetails with _$BranchBicDetails {
  const factory BranchBicDetails({
    @JsonKey(name: 'BicTypeCode') @Default('') String BicTypeCode,
    @JsonKey(name: 'BicTypeDescription') @Default('') String BicTypeDescription,
    @JsonKey(name: 'BicTypeValue') @Default('') String BicTypeValue,
  }) = _BranchBicDetails;

  factory BranchBicDetails.fromJson(Map<String, Object?> json) => _$BranchBicDetailsFromJson(json);
}

@freezed
abstract class BankAccountLength with _$BankAccountLength {
  const factory BankAccountLength({
    @JsonKey(name: 'Length') @Default('') String length,
    @JsonKey(name: 'Prefix') @Default('') String prefix,
  }) = _BankAccountLength;

  factory BankAccountLength.fromJson(Map<String, Object?> json) => _$BankAccountLengthFromJson(json);
}

extension AccountLengthExtension on BankAccountLength {
  /// Parsing the comma-separated length string into a list of integers
  /// Example: "11,14,8" -> [11, 14, 8]
  List<int> get lengthList {
    if (length.isEmpty) return [];

    return length.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).map((e) => int.tryParse(e)).where((e) => e != null).cast<int>().toList();
  }
}
