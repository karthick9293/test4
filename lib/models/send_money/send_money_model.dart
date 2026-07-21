class SendMoneyModel {
  String languageCode;
  String primaryColor;
  String secondaryColor;
  String theme;
  CustomerDetails customerDetails;
  BeneficiaryDetails beneficiaryDetails;
  PaymentDetails paymentDetails;
  Offers offers;

  SendMoneyModel({
    this.languageCode = '',
    this.primaryColor = '',
    this.secondaryColor = '',
    this.theme = '',
    required this.customerDetails,
    required this.beneficiaryDetails,
    required this.paymentDetails,
    required this.offers,
  });

  factory SendMoneyModel.fromJson(Map<String, dynamic> json) => SendMoneyModel(
        languageCode: json['LanguageCode'] ?? '',
        primaryColor: json['PrimaryColor'] ?? '',
        secondaryColor: json['SecondaryColor'] ?? '',
        theme: json['Theme'] ?? '',
        customerDetails:
            CustomerDetails.fromJson(json['CustomerDetails'] ?? {}),
        beneficiaryDetails:
            BeneficiaryDetails.fromJson(json['BeneficiaryDetails'] ?? {}),
        paymentDetails: PaymentDetails.fromJson(json['PaymentDetails'] ?? {}),
        offers: Offers.fromJson(json['Offers'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        'LanguageCode': languageCode,
        'PrimaryColor': primaryColor,
        'SecondaryColor': secondaryColor,
        'Theme': theme,
        'CustomerDetails': customerDetails.toJson(),
        'BeneficiaryDetails': beneficiaryDetails.toJson(),
        'PaymentDetails': paymentDetails.toJson(),
        'Offers': offers.toJson(),
      };
}

class Offers {
  String promoCode;

  Offers({this.promoCode = ''});

  factory Offers.fromJson(Map<String, dynamic> json) =>
      Offers(promoCode: json['PromoCodeApplied'] ?? '');

  Map<String, dynamic> toJson() => {'PromoCodeApplied': promoCode};
}

class CustomerDetails {
  String customerCode;
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String dateOfBirth;
  String nationalityCode;
  String address1;
  String address2;
  String phone;
  String mobile;
  String email;
  String fax;
  String city;
  String district;
  String state;
  String stateCode;
  String countryCode;
  String zipcode;
  String areaCode;
  String nameArabic;
  String professionCode;
  String professionDesc;
  String employerName;
  String idTypeCode;
  String idType;
  String idNo;
  String idIssueDate;
  String idExpiryDate;

  CustomerDetails({
    this.customerCode = '',
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.gender = '',
    this.dateOfBirth = '',
    this.nationalityCode = '',
    this.address1 = '',
    this.address2 = '',
    this.phone = '',
    this.mobile = '',
    this.email = '',
    this.fax = '',
    this.city = '',
    this.district = '',
    this.state = '',
    this.stateCode = '',
    this.countryCode = '',
    this.zipcode = '',
    this.areaCode = '',
    this.nameArabic = '',
    this.professionCode = '',
    this.professionDesc = '',
    this.employerName = '',
    this.idTypeCode = '',
    this.idType = '',
    this.idNo = '',
    this.idIssueDate = '',
    this.idExpiryDate = '',
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      CustomerDetails(
        customerCode: json['CustomerCode'] ?? '',
        firstName: json['FirstName'] ?? '',
        middleName: json['MiddleName'] ?? '',
        lastName: json['LastName'] ?? '',
        gender: json['Gender'] ?? '',
        dateOfBirth: json['DateOfBirth'] ?? '',
        nationalityCode: json['NationalityCode'] ?? '',
        address1: json['Address1'] ?? '',
        address2: json['Address2'] ?? '',
        phone: json['Phone'] ?? '',
        mobile: json['Mobile'] ?? '',
        email: json['Email'] ?? '',
        fax: json['Fax'] ?? '',
        city: json['City'] ?? '',
        district: json['District'] ?? '',
        state: json['State'] ?? '',
        stateCode: json['StateCode'] ?? '',
        countryCode: json['CountryCode'] ?? '',
        zipcode: json['Zipcode'] ?? '',
        areaCode: json['AreaCode'] ?? '',
        nameArabic: json['NameArabic'] ?? '',
        professionCode: json['ProfessionCode'] ?? '',
        professionDesc: json['ProfessionDesc'] ?? '',
        employerName: json['EmployerName'] ?? '',
        idTypeCode: json['IdTypeCode'] ?? '',
        idType: json['IdType'] ?? '',
        idNo: json['IdNo'] ?? '',
        idIssueDate: json['IdIssueDate'] ?? '',
        idExpiryDate: json['IdExpiryDate'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'CustomerCode': customerCode,
        'FirstName': firstName,
        'MiddleName': middleName,
        'LastName': lastName,
        'Gender': gender,
        'DateOfBirth': dateOfBirth,
        'NationalityCode': nationalityCode,
        'Address1': address1,
        'Address2': address2,
        'Phone': phone,
        'Mobile': mobile,
        'Email': email,
        'Fax': fax,
        'City': city,
        'District': district,
        'State': state,
        'StateCode': stateCode,
        'CountryCode': countryCode,
        'Zipcode': zipcode,
        'AreaCode': areaCode,
        'NameArabic': nameArabic,
        'ProfessionCode': professionCode,
        'ProfessionDesc': professionDesc,
        'EmployerName': employerName,
        'IdTypeCode': idTypeCode,
        'IdType': idType,
        'IdNo': idNo,
        'IdIssueDate': idIssueDate,
        'IdExpiryDate': idExpiryDate,
      };
}

class BeneficiaryDetails {
  String beneficiaryUID;
  String coreBeneficiaryUID;
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String dateOfBirth;
  String nationalityCode;
  String address1;
  String address2;
  String email;
  String mobile;
  String phone;
  String city;
  String cityCode;
  String district;
  String state;
  String stateCode;
  String countryCode;
  String country;
  String zipcode;
  String areaCode;
  String idTypeCode;
  String idType;
  String idNo;
  String relationShipCode;
  String relationShip;
  String serviceCategoryCode;
  List<BicDetails> bicDetails;

  BeneficiaryDetails({
    this.beneficiaryUID = '',
    this.coreBeneficiaryUID = '',
    this.firstName = '',
    this.middleName = '',
    this.lastName = '',
    this.gender = '',
    this.dateOfBirth = '',
    this.nationalityCode = '',
    this.address1 = '',
    this.address2 = '',
    this.email = '',
    this.mobile = '',
    this.phone = '',
    this.city = '',
    this.cityCode = '',
    this.district = '',
    this.state = '',
    this.stateCode = '',
    this.countryCode = '',
    this.country = '',
    this.zipcode = '',
    this.areaCode = '',
    this.idTypeCode = '',
    this.idType = '',
    this.idNo = '',
    this.relationShipCode = '',
    this.relationShip = '',
    this.serviceCategoryCode = '',
    required this.bicDetails,
  });

  factory BeneficiaryDetails.fromJson(Map<String, dynamic> json) =>
      BeneficiaryDetails(
        beneficiaryUID: json['UIDNo'] ?? '',
        coreBeneficiaryUID: json['BeneficiaryCode'] ?? '',
        firstName: json['FirstName'] ?? '',
        middleName: json['MiddleName'] ?? '',
        lastName: json['LastName'] ?? '',
        gender: json['Gender'] ?? '',
        dateOfBirth: json['DateOfBirth'] ?? '',
        nationalityCode: json['NationalityCode'] ?? '',
        address1: json['Address1'] ?? '',
        address2: json['Address2'] ?? '',
        email: json['Email'] ?? '',
        mobile: json['Mobile'] ?? '',
        phone: json['Phone'] ?? '',
        city: json['City'] ?? '',
        cityCode: json['CityCode'] ?? '',
        district: json['District'] ?? '',
        state: json['State'] ?? '',
        stateCode: json['StateCode'] ?? '',
        countryCode: json['CountryCode'] ?? '',
        country: json['Country'] ?? '',
        zipcode: json['Zipcode'] ?? '',
        areaCode: json['AreaCode'] ?? '',
        idTypeCode: json['IdTypeCode'] ?? '',
        idType: json['IdType'] ?? '',
        idNo: json['IdNo'] ?? '',
        relationShipCode: json['RelationShipCode'] ?? '',
        relationShip: json['RelationShip'] ?? '',
        serviceCategoryCode: json['ServiceCategoryCode'] ?? '',
        bicDetails: (json['BicDetailsList'] as List<dynamic>? ?? [])
            .map((e) => BicDetails.fromJson(e))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'UIDNo': beneficiaryUID,
        'BeneficiaryCode': coreBeneficiaryUID,
        'FirstName': firstName,
        'MiddleName': middleName,
        'LastName': lastName,
        'Gender': gender,
        'DateOfBirth': dateOfBirth,
        'NationalityCode': nationalityCode,
        'Address1': address1,
        'Address2': address2,
        'Email': email,
        'Mobile': mobile,
        'Phone': phone,
        'City': city,
        'CityCode': cityCode,
        'District': district,
        'State': state,
        'StateCode': stateCode,
        'CountryCode': countryCode,
        'Country': country,
        'Zipcode': zipcode,
        'AreaCode': areaCode,
        'IdTypeCode': idTypeCode,
        'IdType': idType,
        'IdNo': idNo,
        'RelationShipCode': relationShipCode,
        'RelationShip': relationShip,
        'ServiceCategoryCode': serviceCategoryCode,
        'BicDetailsList': bicDetails.map((e) => e.toJson()).toList(),
      };
}

class BicDetails {
  String bicTypeCode;
  String bicTypeDescription;
  String bicTypeValue;

  BicDetails({
    this.bicTypeCode = '',
    this.bicTypeDescription = '',
    this.bicTypeValue = '',
  });

  factory BicDetails.fromJson(Map<String, dynamic> json) => BicDetails(
        bicTypeCode: json['BicTypeCode'] ?? '',
        bicTypeDescription: json['BicTypeDescription'] ?? '',
        bicTypeValue: json['BicTypeValue'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'BicTypeCode': bicTypeCode,
        'BicTypeDescription': bicTypeDescription,
        'BicTypeValue': bicTypeValue,
      };
}

class PaymentDetails {
  String sessionId;
  String routingBankCode;
  String serviceProviderCode;
  String serviceCurrencyCode;
  String serviceCountryCode;
  String serviceCountry;
  String serviceCode;
  String branchCode;
  String accountNumber;
  String beneficiaryBranchName;
  String beneficiaryBranchCode;
  String beneficiaryBankName;
  String beneficiaryBankCode;
  String purposeCode;
  String sourceCode;
  String charge;
  String bankChargesFcy;
  double commission;
  double fcyAmount;
  double lcyAmount;
  double netAmount;
  double rate;
  double branchCost;
  int currencyDecimal;
  String tax;
  String vat;
  String fzPaymentGatewayKey;
  String payType;
  String payAccountNumber;
  String payBankCode;

  PaymentDetails({
    this.sessionId = '',
    this.routingBankCode = '',
    this.serviceProviderCode = '',
    this.serviceCurrencyCode = '',
    this.serviceCountryCode = '',
    this.serviceCountry = '',
    this.serviceCode = '',
    this.branchCode = '',
    this.accountNumber = '',
    this.beneficiaryBranchName = '',
    this.beneficiaryBranchCode = '',
    this.beneficiaryBankName = '',
    this.beneficiaryBankCode = '',
    this.purposeCode = '',
    this.sourceCode = '',
    this.charge = '',
    this.bankChargesFcy = '',
    this.commission = 0.0,
    this.fcyAmount = 0.0,
    this.lcyAmount = 0.0,
    this.netAmount = 0.0,
    this.rate = 0.0,
    this.branchCost = 0.0,
    this.currencyDecimal = 0,
    this.tax = '',
    this.vat = '',
    this.fzPaymentGatewayKey = '',
    this.payType = '',
    this.payAccountNumber = '',
    this.payBankCode = '',
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
        sessionId: json['SessionId'] ?? '',
        routingBankCode: json['RoutingBankCode'] ?? '',
        serviceProviderCode: json['ServiceProviderCode'] ?? '',
        serviceCurrencyCode: json['ServiceCurrencyCode'] ?? '',
        serviceCountryCode: json['ServiceCountryCode'] ?? '',
        serviceCountry: json['ServiceCountry'] ?? '',
        serviceCode: json['ServiceCode'] ?? '',
        branchCode: json['BranchCode'] ?? '',
        accountNumber: json['AccountNumber'] ?? '',
        beneficiaryBranchName: json['BeneficiaryBranchName'] ?? '',
        beneficiaryBranchCode: json['BeneficiaryBranchCode'] ?? '',
        beneficiaryBankName: json['BeneficiaryBankName'] ?? '',
        beneficiaryBankCode: json['BeneficiaryBankCode'] ?? '',
        purposeCode: json['PurposeCode'] ?? '',
        sourceCode: json['SourceCode'] ?? '',
        charge: json['Charge'] ?? '',
        bankChargesFcy: json['BankChargesFcy'] ?? '',
        commission: (json['Commission'] ?? 0).toDouble(),
        fcyAmount: (json['FcyAmount'] ?? 0).toDouble(),
        lcyAmount: (json['LcyAmount'] ?? 0).toDouble(),
        netAmount: (json['NetAmount'] ?? 0).toDouble(),
        rate: (json['Rate'] ?? 0).toDouble(),
        branchCost: (json['BranchCost'] ?? 0).toDouble(),
        currencyDecimal: json['CurrencyDecimal'] ?? 0,
        tax: json['Tax'] ?? '',
        vat: json['Vat'] ?? '',
        fzPaymentGatewayKey: json['FzPaymentGatewayKey'] ?? '',
        payType: json['PayType'] ?? '',
        payAccountNumber: json['PayAccountNumber'] ?? '',
        payBankCode: json['PayBankCode'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'SessionId': sessionId,
        'RoutingBankCode': routingBankCode,
        'ServiceCountryCode': serviceCountryCode,
        'ServiceCountry': serviceCountry,
        'ServiceCode': serviceCode,
        'ServiceProviderCode': serviceProviderCode,
        'ServiceCurrencyCode': serviceCurrencyCode,
        'BranchCode': branchCode,
        'AccountNumber': accountNumber,
        'BeneficiaryBranchName': beneficiaryBranchName,
        'BeneficiaryBranchCode': beneficiaryBranchCode,
        'BeneficiaryBankName': beneficiaryBankName,
        'BeneficiaryBankCode': beneficiaryBankCode,
        'PurposeCode': purposeCode,
        'SourceCode': sourceCode,
        'Charge': charge,
        'BankChargesFcy': bankChargesFcy,
        'Commission': commission,
        'FcyAmount': fcyAmount,
        'LcyAmount': lcyAmount,
        'NetAmount': netAmount,
        'Rate': rate,
        'BranchCost': branchCost,
        'CurrencyDecimal': currencyDecimal,
        'Tax': tax,
        'Vat': vat,
        'FzPaymentGatewayKey': fzPaymentGatewayKey,
        'PayType': payType,
        'PayAccountNumber': payAccountNumber,
        'PayBankCode': payBankCode,
      };
}
