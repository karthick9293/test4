// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OffersFz _$OffersFzFromJson(Map<String, dynamic> json) => _OffersFz(
      statusCode: json['StatusCode'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      data: (json['Data'] as List<dynamic>?)
          ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageNumber: json['PageNumber'] as String?,
      pageSize: json['PageSize'] as String?,
      totalCount: json['TotalCount'] as String?,
    );

Map<String, dynamic> _$OffersFzToJson(_OffersFz instance) => <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'Data': instance.data,
      'PageNumber': instance.pageNumber,
      'PageSize': instance.pageSize,
      'TotalCount': instance.totalCount,
    };

_Offer _$OfferFromJson(Map<String, dynamic> json) => _Offer(
      id: json['Id'] as String?,
      companyCode: json['CompanyCode'] as String?,
      licensedCountryCode: json['LicensedCountryCode'] as String?,
      programCode: json['ProgramCode'] as String?,
      programType: json['ProgramType'] as String?,
      programDescription: json['ProgramDescription'] as String?,
      promoCode: json['PromoCode'] as String?,
      createdUserId: json['CreatedUserId'] as String?,
      rewardsAs: json['RewardsAs'] as String?,
      loyaltyType: json['LoyaltyType'] as String?,
      loyaltyValue: json['LoyaltyValue'] as String?,
      criteriaMap: json['CriteriaMap'] as String?,
      criteriaMapSplit: json['CriteriaMapSplit'] as String?,
      criteriaApplicationName: json['CriteriaApplicationName'] as String?,
      status: json['Status'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDateTime: json['CreatedDateTime'] as String?,
      updatedDateTime: json['UpdatedDateTime'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      programCodeId: json['ProgramCodeId'] as String?,
      criteriaID: json['CriteriaID'] as String?,
      userId: json['UserId'] as String?,
      promoCodeLength: json['PromoCodeLength'] as String?,
      linked: json['Linked'] as String?,
      linkedWith: json['LinkedWith'] as String?,
      dateFrom: json['DateFrom'] as String?,
      dateTo: json['DateTo'] as String?,
      discountAs: json['DiscountAs'] as String?,
      action: json['Action'] as String?,
      isActive: json['IsActive'] as String?,
      clientCode: json['ClientCode'] as String?,
      criteriaMapOrg: json['CriteriaMapOrg'] as String?,
      isNewCustomer: json['IsNewCustomer'] as String?,
      appliedOnApplications: json['AppliedOnApplications'] as String?,
      discountAsOption: json['DiscountAsOption'] as String?,
      rewardsAsOption: json['RewardsAsOption'] as String?,
      loyaltyTypeOption: json['LoyaltyTypeOption'] as String?,
      loyaltyPromoImages: (json['LoyaltyPromoImages'] as List<dynamic>?)
          ?.map((e) => LoyaltyPromoImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfferToJson(_Offer instance) => <String, dynamic>{
      'Id': instance.id,
      'CompanyCode': instance.companyCode,
      'LicensedCountryCode': instance.licensedCountryCode,
      'ProgramCode': instance.programCode,
      'ProgramType': instance.programType,
      'ProgramDescription': instance.programDescription,
      'PromoCode': instance.promoCode,
      'CreatedUserId': instance.createdUserId,
      'RewardsAs': instance.rewardsAs,
      'LoyaltyType': instance.loyaltyType,
      'LoyaltyValue': instance.loyaltyValue,
      'CriteriaMap': instance.criteriaMap,
      'CriteriaMapSplit': instance.criteriaMapSplit,
      'CriteriaApplicationName': instance.criteriaApplicationName,
      'Status': instance.status,
      'CreatedBy': instance.createdBy,
      'CreatedDateTime': instance.createdDateTime,
      'UpdatedDateTime': instance.updatedDateTime,
      'UpdatedBy': instance.updatedBy,
      'ProgramCodeId': instance.programCodeId,
      'CriteriaID': instance.criteriaID,
      'UserId': instance.userId,
      'PromoCodeLength': instance.promoCodeLength,
      'Linked': instance.linked,
      'LinkedWith': instance.linkedWith,
      'DateFrom': instance.dateFrom,
      'DateTo': instance.dateTo,
      'DiscountAs': instance.discountAs,
      'Action': instance.action,
      'IsActive': instance.isActive,
      'ClientCode': instance.clientCode,
      'CriteriaMapOrg': instance.criteriaMapOrg,
      'IsNewCustomer': instance.isNewCustomer,
      'AppliedOnApplications': instance.appliedOnApplications,
      'DiscountAsOption': instance.discountAsOption,
      'RewardsAsOption': instance.rewardsAsOption,
      'LoyaltyTypeOption': instance.loyaltyTypeOption,
      'LoyaltyPromoImages': instance.loyaltyPromoImages,
    };

_LoyaltyPromoImage _$LoyaltyPromoImageFromJson(Map<String, dynamic> json) =>
    _LoyaltyPromoImage(
      id: json['Id'] as String?,
      programCode: json['ProgramCode'] as String?,
      imageName: json['ImageName'] as String?,
      imageOriginalName: json['ImageOriginalName'] as String?,
      status: json['Status'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdDateTime: json['CreatedDateTime'] as String?,
      updatedBy: json['UpdatedBy'] as String?,
      updatedDateTime: json['UpdatedDateTime'] as String?,
      userId: json['UserId'] as String?,
      promoImage: json['PromoImage'] as String?,
      operation: json['Operation'] as String?,
    );

Map<String, dynamic> _$LoyaltyPromoImageToJson(_LoyaltyPromoImage instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ProgramCode': instance.programCode,
      'ImageName': instance.imageName,
      'ImageOriginalName': instance.imageOriginalName,
      'Status': instance.status,
      'CreatedBy': instance.createdBy,
      'CreatedDateTime': instance.createdDateTime,
      'UpdatedBy': instance.updatedBy,
      'UpdatedDateTime': instance.updatedDateTime,
      'UserId': instance.userId,
      'PromoImage': instance.promoImage,
      'Operation': instance.operation,
    };
