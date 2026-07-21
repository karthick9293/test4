// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BeneficiaryFz _$BeneficiaryFzFromJson(Map<String, dynamic> json) =>
    _BeneficiaryFz(
      active: _readStatus(json, 'Active') as String?,
      archive: json['Archive'] as String?,
      customerCode: json['CustomerCode'] as String?,
      id: (json['BeneficiaryUID'] as num?)?.toInt(),
      coreBeneficiaryUid: json['CoreBeneficiaryUID'] as String?,
      name: _readName(json, 'name') as String?,
      firstName: json['FirstName'] as String?,
      middleName: json['MiddleName'] as String?,
      lastName: json['LastName'] as String?,
      nationality: json['NationalityCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['NationalityCode'] as Map<String, dynamic>),
      gender: json['GenderCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['GenderCode'] as Map<String, dynamic>),
      dateOfBirth: json['DateOfBirth'] as String?,
      phone: json['Phone'] as String?,
      email: json['Email'] as String?,
      address1: json['Address1'] as String?,
      address2: json['Address2'] as String?,
      relationship: json['RelationshipCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['RelationshipCode'] as Map<String, dynamic>),
      serviceType: json['ServiceCategoryCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['ServiceCategoryCode'] as Map<String, dynamic>),
      idNo: json['IdNo'] as String?,
      mobile: json['BeneficiaryMobile'] as String?,
      serviceCountry: json['ServiceCountryCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['ServiceCountryCode'] as Map<String, dynamic>),
      serviceCurrency: json['ServiceCurrencyCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['ServiceCurrencyCode'] as Map<String, dynamic>),
      country: json['CountryCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['CountryCode'] as Map<String, dynamic>),
      state: json['StateCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['StateCode'] as Map<String, dynamic>),
      city: json['CityCode'] == null
          ? null
          : MasterResponseFZ.fromJson(json['CityCode'] as Map<String, dynamic>),
      accountNumber: json['AccountNumber'] as String?,
      bank: json['BeneficiaryBankCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['BeneficiaryBankCode'] as Map<String, dynamic>),
      branch: json['BeneficiaryBranchCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['BeneficiaryBranchCode'] as Map<String, dynamic>),
      bicType: json['BicCode'] == null
          ? null
          : MasterResponseFZ.fromJson(json['BicCode'] as Map<String, dynamic>),
      bicValue: json['BicValue'] as String?,
      fav: json['Favourites'] as String?,
      sortOrder: (json['SortOrder'] as num?)?.toInt(),
      status: json['Status'] as String?,
      serviceProvider: json['ServiceProviderCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['ServiceProviderCode'] as Map<String, dynamic>),
      idType: json['IdTypeCode'] == null
          ? null
          : MasterResponseFZ.fromJson(
              json['IdTypeCode'] as Map<String, dynamic>),
      beneficiaryType: json['BeneficiaryTypeCode'] as String?,
      isCorrespondentActive: json['isCorrespondentActive'] as String?,
      createdOn: _parseDateTime(json['CreatedOn']),
    );

Map<String, dynamic> _$BeneficiaryFzToJson(_BeneficiaryFz instance) =>
    <String, dynamic>{
      'Active': instance.active,
      'Archive': instance.archive,
      'CustomerCode': instance.customerCode,
      'BeneficiaryUID': instance.id,
      'CoreBeneficiaryUID': instance.coreBeneficiaryUid,
      'name': instance.name,
      'FirstName': instance.firstName,
      'MiddleName': instance.middleName,
      'LastName': instance.lastName,
      'NationalityCode': instance.nationality,
      'GenderCode': instance.gender,
      'DateOfBirth': instance.dateOfBirth,
      'Phone': instance.phone,
      'Email': instance.email,
      'Address1': instance.address1,
      'Address2': instance.address2,
      'RelationshipCode': instance.relationship,
      'ServiceCategoryCode': instance.serviceType,
      'IdNo': instance.idNo,
      'BeneficiaryMobile': instance.mobile,
      'ServiceCountryCode': instance.serviceCountry,
      'ServiceCurrencyCode': instance.serviceCurrency,
      'CountryCode': instance.country,
      'StateCode': instance.state,
      'CityCode': instance.city,
      'AccountNumber': instance.accountNumber,
      'BeneficiaryBankCode': instance.bank,
      'BeneficiaryBranchCode': instance.branch,
      'BicCode': instance.bicType,
      'BicValue': instance.bicValue,
      'Favourites': instance.fav,
      'SortOrder': instance.sortOrder,
      'Status': instance.status,
      'ServiceProviderCode': instance.serviceProvider,
      'IdTypeCode': instance.idType,
      'BeneficiaryTypeCode': instance.beneficiaryType,
      'isCorrespondentActive': instance.isCorrespondentActive,
      'CreatedOn': _formatDateTime(instance.createdOn),
    };
