// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_data_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerDataFZ _$CustomerDataFZFromJson(Map<String, dynamic> json) =>
    _CustomerDataFZ(
      data: json['Data'] == null
          ? null
          : ProfileData.fromJson(json['Data'] as Map<String, dynamic>),
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerDataFZToJson(_CustomerDataFZ instance) =>
    <String, dynamic>{
      'Data': instance.data,
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['messageCode'] as String? ?? '',
      messageType: json['messageType'] as String? ?? '',
      messageHeader: json['messageHeader'] as String? ?? '',
      messageDescription: json['messageDescription'] as String? ?? '',
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'messageCode': instance.messageCode,
      'messageType': instance.messageType,
      'messageHeader': instance.messageHeader,
      'messageDescription': instance.messageDescription,
    };

_ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => _ProfileData(
      customerCode: json['CustomerCode'] as String? ?? '',
      customerType: json['CustomerType'] as String? ?? '',
      personalInfo: json['PersonalInfo'] == null
          ? null
          : PersonalInfo.fromJson(json['PersonalInfo'] as Map<String, dynamic>),
      documents: json['Documents'],
      languageCode: json['LanguageCode'] as String? ?? '',
      status: json['Status'] as String? ?? '',
      userId: json['UserId'] as String? ?? '',
      name: _readName(json, 'Name') as String? ?? '',
      firstName: json['FirstName'] as String? ?? '',
      middleName: json['MiddleName'] as String? ?? '',
      lastName: json['LastName'] as String? ?? '',
      gender: json['Gender'] as String? ?? '',
      genderCode: json['GenderCode'] as String? ?? '',
      dateOfBirth: json['DateOfBirth'] as String? ?? '',
      address1: json['Address1'] as String? ?? '',
      address2: json['Address2'] as String? ?? '',
      postalCode: json['PostalCode'] as String? ?? '',
      mobileNo: json['MobileNo'] as String? ?? '',
      mobile: json['Mobile'] as String? ?? '',
      email: json['Email'] as String? ?? '',
      nationality: json['Nationality'] as String? ?? '',
      nationalityCode: json['NationalityCode'] as String? ?? '',
      countryCode: json['CountryCode'] as String? ?? '',
      country: json['Country'] as String? ?? '',
      state: json['State'] as String? ?? '',
      city: json['City'] as String? ?? '',
      idTypeCode: json['IdTypeCode'] as String? ?? '',
      idType: json['IdType'] as String? ?? '',
      idNo: json['IdNo'] as String? ?? '',
      idIssueDate: json['IdIssueDate'] as String? ?? '',
      idExpiryDate: json['IdExpiryDate'] as String? ?? '',
      professionCode: json['ProfessionCode'] as String? ?? '',
      profession: json['Profession'] as String? ?? '',
      employerName: json['EmployerName'] as String? ?? '',
      expectedMonthlyIncome: json['ExpectedMonthlyIncome'] ?? '',
      expectedMonthlyTransactionCount:
          json['ExpectedMonthlyTransactionCount'] ?? '',
      mPIN: json['mPIN'] as String? ?? '',
      password: json['password'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      appSession: json['appSession'] as String? ?? '',
      enableSaveCred: json['enableSaveCred'] as String? ?? '',
      profilePic: json['profilePic'] as String? ?? null,
      imageFront: json['ImageFront'] as String? ?? '',
      imageBack: json['ImageBack'] as String? ?? '',
      zone: json['Zone'] as String? ?? '',
      secondNationality: json['SecondNationality'] as String? ?? '',
      secondNationalityCode: json['SecondNationalityCode'] as String? ?? '',
    );

Map<String, dynamic> _$ProfileDataToJson(_ProfileData instance) =>
    <String, dynamic>{
      'CustomerCode': instance.customerCode,
      'CustomerType': instance.customerType,
      'PersonalInfo': instance.personalInfo,
      'Documents': instance.documents,
      'LanguageCode': instance.languageCode,
      'Status': instance.status,
      'UserId': instance.userId,
      'Name': instance.name,
      'FirstName': instance.firstName,
      'MiddleName': instance.middleName,
      'LastName': instance.lastName,
      'Gender': instance.gender,
      'GenderCode': instance.genderCode,
      'DateOfBirth': instance.dateOfBirth,
      'Address1': instance.address1,
      'Address2': instance.address2,
      'PostalCode': instance.postalCode,
      'MobileNo': instance.mobileNo,
      'Mobile': instance.mobile,
      'Email': instance.email,
      'Nationality': instance.nationality,
      'NationalityCode': instance.nationalityCode,
      'CountryCode': instance.countryCode,
      'Country': instance.country,
      'State': instance.state,
      'City': instance.city,
      'IdTypeCode': instance.idTypeCode,
      'IdType': instance.idType,
      'IdNo': instance.idNo,
      'IdIssueDate': instance.idIssueDate,
      'IdExpiryDate': instance.idExpiryDate,
      'ProfessionCode': instance.professionCode,
      'Profession': instance.profession,
      'EmployerName': instance.employerName,
      'ExpectedMonthlyIncome': instance.expectedMonthlyIncome,
      'ExpectedMonthlyTransactionCount':
          instance.expectedMonthlyTransactionCount,
      'mPIN': instance.mPIN,
      'password': instance.password,
      'userName': instance.userName,
      'appSession': instance.appSession,
      'enableSaveCred': instance.enableSaveCred,
      'profilePic': instance.profilePic,
      'ImageFront': instance.imageFront,
      'ImageBack': instance.imageBack,
      'Zone': instance.zone,
      'SecondNationality': instance.secondNationality,
      'SecondNationalityCode': instance.secondNationalityCode,
    };

_PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) =>
    _PersonalInfo(
      name1: json['name1'] as String? ?? '',
      name2: json['name2'] as String? ?? '',
      name3: json['name3'] as String? ?? '',
      name4: json['name4'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      dob: json['dob'] as String? ?? '',
      nationalityCode: json['nationalityCode'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      placeOfBirth: json['placeOfBirth'] as String? ?? '',
      region: json['region'] as String? ?? '',
      nameArabic: json['nameArabic'] as String? ?? '',
      professionCode: json['professionCode'] as String? ?? '',
      professionDesc: json['professionDesc'] as String? ?? '',
      employerName: json['employerName'] as String? ?? '',
      designationCode: json['designationCode'] as String? ?? '',
      visaType: json['visaType'] as String? ?? '',
      ispep: json['ispep'] as bool? ?? false,
      salary: json['salary'] as String? ?? '',
      status: json['status'] as String? ?? '',
      idDetailsData: json['idDetailsData'] == null
          ? null
          : IdDetailsData.fromJson(
              json['idDetailsData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonalInfoToJson(_PersonalInfo instance) =>
    <String, dynamic>{
      'name1': instance.name1,
      'name2': instance.name2,
      'name3': instance.name3,
      'name4': instance.name4,
      'gender': instance.gender,
      'dob': instance.dob,
      'nationalityCode': instance.nationalityCode,
      'nationality': instance.nationality,
      'address': instance.address,
      'contact': instance.contact,
      'placeOfBirth': instance.placeOfBirth,
      'region': instance.region,
      'nameArabic': instance.nameArabic,
      'professionCode': instance.professionCode,
      'professionDesc': instance.professionDesc,
      'employerName': instance.employerName,
      'designationCode': instance.designationCode,
      'visaType': instance.visaType,
      'ispep': instance.ispep,
      'salary': instance.salary,
      'status': instance.status,
      'idDetailsData': instance.idDetailsData,
    };

_IdDetailsData _$IdDetailsDataFromJson(Map<String, dynamic> json) =>
    _IdDetailsData(
      idTypeCode: json['idTypeCode'] as String? ?? '',
      idType: json['idType'] as String? ?? '',
      idNo: json['idNo'] as String? ?? '',
      issueDate: json['issueDate'] as String? ?? '',
      expDate: json['expDate'] as String? ?? '',
      issuePlace: json['issuePlace'] as String? ?? '',
      imageFront: json['imageFront'] as String? ?? '',
      imageBack: json['imageBack'] as String? ?? '',
      issueCountryCode: json['issueCountryCode'] as String? ?? '',
      issueState: json['issueState'] as String? ?? '',
      idCollected: json['idCollected'] as String? ?? '',
      eidCardNo: json['eidCardNo'] as String? ?? '',
      isEidReadFlag: json['isEidReadFlag'] as String? ?? '',
    );

Map<String, dynamic> _$IdDetailsDataToJson(_IdDetailsData instance) =>
    <String, dynamic>{
      'idTypeCode': instance.idTypeCode,
      'idType': instance.idType,
      'idNo': instance.idNo,
      'issueDate': instance.issueDate,
      'expDate': instance.expDate,
      'issuePlace': instance.issuePlace,
      'imageFront': instance.imageFront,
      'imageBack': instance.imageBack,
      'issueCountryCode': instance.issueCountryCode,
      'issueState': instance.issueState,
      'idCollected': instance.idCollected,
      'eidCardNo': instance.eidCardNo,
      'isEidReadFlag': instance.isEidReadFlag,
    };

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
      dialCode: json['dialCode'] as String? ?? '',
      phone1: json['phone1'] as String? ?? '',
      phone2: json['phone2'] as String? ?? '',
      phone3: json['phone3'] as String? ?? '',
      mobile1: json['mobile1'] as String? ?? '',
      mobile2: json['mobile2'] as String? ?? '',
      mobile3: json['mobile3'] as String? ?? '',
      email: json['email'] as String? ?? '',
      fax: json['fax'] as String? ?? '',
    );

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
      'dialCode': instance.dialCode,
      'phone1': instance.phone1,
      'phone2': instance.phone2,
      'phone3': instance.phone3,
      'mobile1': instance.mobile1,
      'mobile2': instance.mobile2,
      'mobile3': instance.mobile3,
      'email': instance.email,
      'fax': instance.fax,
    };

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
      address1: json['address1'] as String? ?? '',
      address2: json['address2'] as String? ?? '',
      address3: json['address3'] as String? ?? '',
      city: json['city'] as String? ?? '',
      district: json['district'] as String? ?? '',
      state: json['state'] as String? ?? '',
      stateCode: json['stateCode'] as String? ?? '',
      airportCode: json['airportCode'] as String? ?? '',
      country: json['country'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      areaCode: json['areaCode'] as String? ?? '',
    );

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'city': instance.city,
      'district': instance.district,
      'state': instance.state,
      'stateCode': instance.stateCode,
      'airportCode': instance.airportCode,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'zipcode': instance.zipcode,
      'areaCode': instance.areaCode,
    };
