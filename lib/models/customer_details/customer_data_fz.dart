import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_data_fz.freezed.dart';
part 'customer_data_fz.g.dart';

Object? _readName(Map json, String key) {
  List<String> name = [];
  if (json['FirstName'] != null && json['FirstName'] != "") {
    name.add(json['FirstName']);
  }
  if (json['MiddleName'] != null && json['MiddleName'] != "") {
    name.add(json['MiddleName']);
  }
  if (json['LastName'] != null && json['LastName'] != "") {
    name.add(json['LastName']);
  }
  return name.join(' ');
}

@freezed
abstract class CustomerDataFZ with _$CustomerDataFZ {
  const factory CustomerDataFZ({
    @JsonKey(name: 'Data') ProfileData? data,
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'CustomMessageDetails')
    CustomMessageDetails? customMessageDetails,
  }) = _CustomerDataFZ;

  factory CustomerDataFZ.fromJson(Map<String, Object?> json) =>
      _$CustomerDataFZFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: 'messageCode') @Default('') String messageCode,
    @JsonKey(name: 'messageType') @Default('') String messageType,
    @JsonKey(name: 'messageHeader') @Default('') String messageHeader,
    @JsonKey(name: 'messageDescription') @Default('') String messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) =>
      _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({
    @JsonKey(name: 'CustomerCode') @Default('') String customerCode,
    @JsonKey(name: 'CustomerType') @Default('') String customerType,
    @JsonKey(name: 'PersonalInfo') PersonalInfo? personalInfo,
    @JsonKey(name: 'Documents') dynamic documents,
    @JsonKey(name: 'LanguageCode') @Default('') String languageCode,
    @JsonKey(name: 'Status') @Default('') String status,
    @JsonKey(name: 'UserId') @Default('') String userId,
    @JsonKey(name: "Name", readValue: _readName) @Default('') String name,
    @JsonKey(name: "FirstName") @Default('') String firstName,
    @JsonKey(name: "MiddleName") @Default('') String? middleName,
    @JsonKey(name: "LastName") @Default('') String? lastName,
    @JsonKey(name: "Gender") @Default('') String? gender,
    @JsonKey(name: "GenderCode") @Default('') String? genderCode,
    @JsonKey(name: "DateOfBirth") @Default('') String? dateOfBirth,
    @JsonKey(name: "Address1") @Default('') String? address1,
    @JsonKey(name: "Address2") @Default('') String? address2,
    @JsonKey(name: "PostalCode") @Default('') String? postalCode,
    @JsonKey(name: "MobileNo") @Default('') String? mobileNo,
    @JsonKey(name: "Mobile") @Default('') String? mobile,
    @JsonKey(name: "Email") @Default('') String? email,
    @JsonKey(name: "Nationality") @Default('') String? nationality,
    @JsonKey(name: "NationalityCode") @Default('') String? nationalityCode,
    @JsonKey(name: "CountryCode") @Default('') String? countryCode,
    @JsonKey(name: "Country") @Default('') String? country,
    @JsonKey(name: "State") @Default('') String? state,
    @JsonKey(name: "City") @Default('') String? city,
    @JsonKey(name: "IdTypeCode") @Default('') String? idTypeCode,
    @JsonKey(name: "IdType") @Default('') String? idType,
    @JsonKey(name: "IdNo") @Default('') String? idNo,
    @JsonKey(name: "IdIssueDate") @Default('') String? idIssueDate,
    @JsonKey(name: "IdExpiryDate") @Default('') String? idExpiryDate,
    @JsonKey(name: "ProfessionCode") @Default('') String? professionCode,
    @JsonKey(name: "Profession") @Default('') String? profession,
    @JsonKey(name: "EmployerName") @Default('') String? employerName,
    @JsonKey(name: "ExpectedMonthlyIncome")
    @Default('')
    dynamic expectedMonthlyIncome,
    @JsonKey(name: "ExpectedMonthlyTransactionCount")
    @Default('')
    dynamic expectedMonthlyTransactionCount,
    @JsonKey(name: 'mPIN') @Default('') String mPIN,
    @JsonKey(name: 'password') @Default('') String password,
    @JsonKey(name: 'userName') @Default('') String userName,
    // @JsonKey(name: 'enableBiometric') bool enableBiometric,
    // @JsonKey(name: 'enableFaceId') bool enableFaceId,
    @JsonKey(name: 'appSession') @Default('') String appSession,
    @JsonKey(name: 'enableSaveCred') @Default('') String enableSaveCred,
    @JsonKey(name: 'profilePic') @Default(null) String? profilePic,
    @JsonKey(name: 'ImageFront') @Default('') String imageFront,
    @JsonKey(name: 'ImageBack') @Default('') String imageBack,
    @JsonKey(name: 'Zone') @Default('') String? zone,
    @JsonKey(name: 'SecondNationality') @Default('') String? secondNationality,
    @JsonKey(name: 'SecondNationalityCode')
    @Default('')
    String? secondNationalityCode,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, Object?> json) =>
      _$ProfileDataFromJson(json);
}

@freezed
abstract class PersonalInfo with _$PersonalInfo {
  const factory PersonalInfo({
    @JsonKey(name: 'name1') @Default('') String name1,
    @JsonKey(name: 'name2') @Default('') String name2,
    @JsonKey(name: 'name3') @Default('') String name3,
    @JsonKey(name: 'name4') @Default('') String name4,
    @JsonKey(name: 'gender') @Default('') String gender,
    @JsonKey(name: 'dob') @Default('') String dob,
    @JsonKey(name: 'nationalityCode') @Default('') String nationalityCode,
    @JsonKey(name: 'nationality') @Default('') String nationality,
    @JsonKey(name: 'address') Address? address,
    @JsonKey(name: 'contact') Contact? contact,
    @JsonKey(name: 'placeOfBirth') @Default('') String placeOfBirth,
    @JsonKey(name: 'region') @Default('') String region,
    @JsonKey(name: 'nameArabic') @Default('') String nameArabic,
    @JsonKey(name: 'professionCode') @Default('') String professionCode,
    @JsonKey(name: 'professionDesc') @Default('') String professionDesc,
    @JsonKey(name: 'employerName') @Default('') String employerName,
    @JsonKey(name: 'designationCode') @Default('') String designationCode,
    @JsonKey(name: 'visaType') @Default('') String visaType,
    @JsonKey(name: 'ispep') @Default(false) bool ispep,
    @JsonKey(name: 'salary') @Default('') String salary,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'idDetailsData') IdDetailsData? idDetailsData,
  }) = _PersonalInfo;

  factory PersonalInfo.fromJson(Map<String, Object?> json) =>
      _$PersonalInfoFromJson(json);
}

@freezed
abstract class IdDetailsData with _$IdDetailsData {
  const factory IdDetailsData({
    @JsonKey(name: 'idTypeCode') @Default('') String idTypeCode,
    @JsonKey(name: 'idType') @Default('') String idType,
    @JsonKey(name: 'idNo') @Default('') String idNo,
    @JsonKey(name: 'issueDate') @Default('') String issueDate,
    @JsonKey(name: 'expDate') @Default('') String expDate,
    @JsonKey(name: 'issuePlace') @Default('') String issuePlace,
    @JsonKey(name: 'imageFront') @Default('') String imageFront,
    @JsonKey(name: 'imageBack') @Default('') String imageBack,
    @JsonKey(name: 'issueCountryCode') @Default('') String issueCountryCode,
    @JsonKey(name: 'issueState') @Default('') String issueState,
    @JsonKey(name: 'idCollected') @Default('') String idCollected,
    @JsonKey(name: 'eidCardNo') @Default('') String eidCardNo,
    @JsonKey(name: 'isEidReadFlag') @Default('') String isEidReadFlag,
  }) = _IdDetailsData;

  factory IdDetailsData.fromJson(Map<String, Object?> json) =>
      _$IdDetailsDataFromJson(json);
}

@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    @JsonKey(name: 'dialCode') @Default('') String dialCode,
    @JsonKey(name: 'phone1') @Default('') String phone1,
    @JsonKey(name: 'phone2') @Default('') String phone2,
    @JsonKey(name: 'phone3') @Default('') String phone3,
    @JsonKey(name: 'mobile1') @Default('') String mobile1,
    @JsonKey(name: 'mobile2') @Default('') String mobile2,
    @JsonKey(name: 'mobile3') @Default('') String mobile3,
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'fax') @Default('') String fax,
  }) = _Contact;

  factory Contact.fromJson(Map<String, Object?> json) =>
      _$ContactFromJson(json);
}

@freezed
abstract class Address with _$Address {
  const factory Address({
    @JsonKey(name: 'address1') @Default('') String address1,
    @JsonKey(name: 'address2') @Default('') String address2,
    @JsonKey(name: 'address3') @Default('') String address3,
    @JsonKey(name: 'city') @Default('') String city,
    @JsonKey(name: 'district') @Default('') String district,
    @JsonKey(name: 'state') @Default('') String state,
    @JsonKey(name: 'stateCode') @Default('') String stateCode,
    @JsonKey(name: 'airportCode') @Default('') String airportCode,
    @JsonKey(name: 'country') @Default('') String country,
    @JsonKey(name: 'countryCode') @Default('') String countryCode,
    @JsonKey(name: 'zipcode') @Default('') String zipcode,
    @JsonKey(name: 'areaCode') @Default('') String areaCode,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}
