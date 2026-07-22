import 'package:freezed_annotation/freezed_annotation.dart';

part 'offers_fz.freezed.dart';
part 'offers_fz.g.dart';

@freezed
abstract class OffersFz with _$OffersFz {
  const factory OffersFz({
    @JsonKey(name: "StatusCode") String? statusCode,
    @JsonKey(name: "StatusMessage") String? statusMessage,
    @JsonKey(name: "Data") List<Offer>? data,
    @JsonKey(name: "PageNumber") String? pageNumber,
    @JsonKey(name: "PageSize") String? pageSize,
    @JsonKey(name: "TotalCount") String? totalCount,
  }) = _OffersFz;

  factory OffersFz.fromJson(Map<String, dynamic> json) => _$OffersFzFromJson(json);
}

@freezed
abstract class Offer with _$Offer {
  const factory Offer({
    @JsonKey(name: "Id") String? id,
    @JsonKey(name: "CompanyCode") String? companyCode,
    @JsonKey(name: "LicensedCountryCode") String? licensedCountryCode,
    @JsonKey(name: "ProgramCode") String? programCode,
    @JsonKey(name: "ProgramType") String? programType,
    @JsonKey(name: "ProgramDescription") String? programDescription,
    @JsonKey(name: "PromoCode") String? promoCode,
    @JsonKey(name: "CreatedUserId") String? createdUserId,
    @JsonKey(name: "RewardsAs") String? rewardsAs,
    @JsonKey(name: "LoyaltyType") String? loyaltyType,
    @JsonKey(name: "LoyaltyValue") String? loyaltyValue,
    @JsonKey(name: "CriteriaMap") String? criteriaMap,
    @JsonKey(name: "CriteriaMapSplit") String? criteriaMapSplit,
    @JsonKey(name: "CriteriaApplicationName") String? criteriaApplicationName,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "CreatedBy") String? createdBy,
    @JsonKey(name: "CreatedDateTime") String? createdDateTime,
    @JsonKey(name: "UpdatedDateTime") String? updatedDateTime,
    @JsonKey(name: "UpdatedBy") String? updatedBy,
    @JsonKey(name: "ProgramCodeId") String? programCodeId,
    @JsonKey(name: "CriteriaID") String? criteriaID,
    @JsonKey(name: "UserId") String? userId,
    @JsonKey(name: "PromoCodeLength") String? promoCodeLength,
    @JsonKey(name: "Linked") String? linked,
    @JsonKey(name: "LinkedWith") String? linkedWith,
    @JsonKey(name: "DateFrom") String? dateFrom,
    @JsonKey(name: "DateTo") String? dateTo,
    @JsonKey(name: "DiscountAs") String? discountAs,
    @JsonKey(name: "Action") String? action,
    @JsonKey(name: "IsActive") String? isActive,
    @JsonKey(name: "ClientCode") String? clientCode,
    @JsonKey(name: "CriteriaMapOrg") String? criteriaMapOrg,
    @JsonKey(name: "IsNewCustomer") String? isNewCustomer,
    @JsonKey(name: "AppliedOnApplications") String? appliedOnApplications,
    @JsonKey(name: "DiscountAsOption") String? discountAsOption,
    @JsonKey(name: "RewardsAsOption") String? rewardsAsOption,
    @JsonKey(name: "LoyaltyTypeOption") String? loyaltyTypeOption,
    @JsonKey(name: "LoyaltyPromoImages") List<LoyaltyPromoImage>? loyaltyPromoImages,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}

@freezed
abstract class LoyaltyPromoImage with _$LoyaltyPromoImage {
  const factory LoyaltyPromoImage({
    @JsonKey(name: "Id") String? id,
    @JsonKey(name: "ProgramCode") String? programCode,
    @JsonKey(name: "ImageName") String? imageName,
    @JsonKey(name: "ImageOriginalName") String? imageOriginalName,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "CreatedBy") String? createdBy,
    @JsonKey(name: "CreatedDateTime") String? createdDateTime,
    @JsonKey(name: "UpdatedBy") String? updatedBy,
    @JsonKey(name: "UpdatedDateTime") String? updatedDateTime,
    @JsonKey(name: "UserId") String? userId,
    @JsonKey(name: "PromoImage") String? promoImage,
    @JsonKey(name: "Operation") String? operation,
  }) = _LoyaltyPromoImage;

  factory LoyaltyPromoImage.fromJson(Map<String, dynamic> json) => _$LoyaltyPromoImageFromJson(json);
}
