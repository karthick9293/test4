// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OffersFz {
  @JsonKey(name: "StatusCode")
  String? get statusCode;
  @JsonKey(name: "StatusMessage")
  String? get statusMessage;
  @JsonKey(name: "Data")
  List<Offer>? get data;
  @JsonKey(name: "PageNumber")
  String? get pageNumber;
  @JsonKey(name: "PageSize")
  String? get pageSize;
  @JsonKey(name: "TotalCount")
  String? get totalCount;

  /// Create a copy of OffersFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OffersFzCopyWith<OffersFz> get copyWith =>
      _$OffersFzCopyWithImpl<OffersFz>(this as OffersFz, _$identity);

  /// Serializes this OffersFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OffersFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      const DeepCollectionEquality().hash(data),
      pageNumber,
      pageSize,
      totalCount);

  @override
  String toString() {
    return 'OffersFz(statusCode: $statusCode, statusMessage: $statusMessage, data: $data, pageNumber: $pageNumber, pageSize: $pageSize, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class $OffersFzCopyWith<$Res> {
  factory $OffersFzCopyWith(OffersFz value, $Res Function(OffersFz) _then) =
      _$OffersFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "Data") List<Offer>? data,
      @JsonKey(name: "PageNumber") String? pageNumber,
      @JsonKey(name: "PageSize") String? pageSize,
      @JsonKey(name: "TotalCount") String? totalCount});
}

/// @nodoc
class _$OffersFzCopyWithImpl<$Res> implements $OffersFzCopyWith<$Res> {
  _$OffersFzCopyWithImpl(this._self, this._then);

  final OffersFz _self;
  final $Res Function(OffersFz) _then;

  /// Create a copy of OffersFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? data = freezed,
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_self.copyWith(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Offer>?,
      pageNumber: freezed == pageNumber
          ? _self.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: freezed == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [OffersFz].
extension OffersFzPatterns on OffersFz {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OffersFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OffersFz() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OffersFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OffersFz():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OffersFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OffersFz() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") List<Offer>? data,
            @JsonKey(name: "PageNumber") String? pageNumber,
            @JsonKey(name: "PageSize") String? pageSize,
            @JsonKey(name: "TotalCount") String? totalCount)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OffersFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.data,
            _that.pageNumber, _that.pageSize, _that.totalCount);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") List<Offer>? data,
            @JsonKey(name: "PageNumber") String? pageNumber,
            @JsonKey(name: "PageSize") String? pageSize,
            @JsonKey(name: "TotalCount") String? totalCount)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OffersFz():
        return $default(_that.statusCode, _that.statusMessage, _that.data,
            _that.pageNumber, _that.pageSize, _that.totalCount);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") List<Offer>? data,
            @JsonKey(name: "PageNumber") String? pageNumber,
            @JsonKey(name: "PageSize") String? pageSize,
            @JsonKey(name: "TotalCount") String? totalCount)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OffersFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.data,
            _that.pageNumber, _that.pageSize, _that.totalCount);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OffersFz implements OffersFz {
  const _OffersFz(
      {@JsonKey(name: "StatusCode") this.statusCode,
      @JsonKey(name: "StatusMessage") this.statusMessage,
      @JsonKey(name: "Data") final List<Offer>? data,
      @JsonKey(name: "PageNumber") this.pageNumber,
      @JsonKey(name: "PageSize") this.pageSize,
      @JsonKey(name: "TotalCount") this.totalCount})
      : _data = data;
  factory _OffersFz.fromJson(Map<String, dynamic> json) =>
      _$OffersFzFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String? statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String? statusMessage;
  final List<Offer>? _data;
  @override
  @JsonKey(name: "Data")
  List<Offer>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "PageNumber")
  final String? pageNumber;
  @override
  @JsonKey(name: "PageSize")
  final String? pageSize;
  @override
  @JsonKey(name: "TotalCount")
  final String? totalCount;

  /// Create a copy of OffersFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OffersFzCopyWith<_OffersFz> get copyWith =>
      __$OffersFzCopyWithImpl<_OffersFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OffersFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OffersFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      const DeepCollectionEquality().hash(_data),
      pageNumber,
      pageSize,
      totalCount);

  @override
  String toString() {
    return 'OffersFz(statusCode: $statusCode, statusMessage: $statusMessage, data: $data, pageNumber: $pageNumber, pageSize: $pageSize, totalCount: $totalCount)';
  }
}

/// @nodoc
abstract mixin class _$OffersFzCopyWith<$Res>
    implements $OffersFzCopyWith<$Res> {
  factory _$OffersFzCopyWith(_OffersFz value, $Res Function(_OffersFz) _then) =
      __$OffersFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "Data") List<Offer>? data,
      @JsonKey(name: "PageNumber") String? pageNumber,
      @JsonKey(name: "PageSize") String? pageSize,
      @JsonKey(name: "TotalCount") String? totalCount});
}

/// @nodoc
class __$OffersFzCopyWithImpl<$Res> implements _$OffersFzCopyWith<$Res> {
  __$OffersFzCopyWithImpl(this._self, this._then);

  final _OffersFz _self;
  final $Res Function(_OffersFz) _then;

  /// Create a copy of OffersFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? data = freezed,
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_OffersFz(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Offer>?,
      pageNumber: freezed == pageNumber
          ? _self.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pageSize: freezed == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCount: freezed == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Offer {
  @JsonKey(name: "Id")
  String? get id;
  @JsonKey(name: "CompanyCode")
  String? get companyCode;
  @JsonKey(name: "LicensedCountryCode")
  String? get licensedCountryCode;
  @JsonKey(name: "ProgramCode")
  String? get programCode;
  @JsonKey(name: "ProgramType")
  String? get programType;
  @JsonKey(name: "ProgramDescription")
  String? get programDescription;
  @JsonKey(name: "PromoCode")
  String? get promoCode;
  @JsonKey(name: "CreatedUserId")
  String? get createdUserId;
  @JsonKey(name: "RewardsAs")
  String? get rewardsAs;
  @JsonKey(name: "LoyaltyType")
  String? get loyaltyType;
  @JsonKey(name: "LoyaltyValue")
  String? get loyaltyValue;
  @JsonKey(name: "CriteriaMap")
  String? get criteriaMap;
  @JsonKey(name: "CriteriaMapSplit")
  String? get criteriaMapSplit;
  @JsonKey(name: "CriteriaApplicationName")
  String? get criteriaApplicationName;
  @JsonKey(name: "Status")
  String? get status;
  @JsonKey(name: "CreatedBy")
  String? get createdBy;
  @JsonKey(name: "CreatedDateTime")
  String? get createdDateTime;
  @JsonKey(name: "UpdatedDateTime")
  String? get updatedDateTime;
  @JsonKey(name: "UpdatedBy")
  String? get updatedBy;
  @JsonKey(name: "ProgramCodeId")
  String? get programCodeId;
  @JsonKey(name: "CriteriaID")
  String? get criteriaID;
  @JsonKey(name: "UserId")
  String? get userId;
  @JsonKey(name: "PromoCodeLength")
  String? get promoCodeLength;
  @JsonKey(name: "Linked")
  String? get linked;
  @JsonKey(name: "LinkedWith")
  String? get linkedWith;
  @JsonKey(name: "DateFrom")
  String? get dateFrom;
  @JsonKey(name: "DateTo")
  String? get dateTo;
  @JsonKey(name: "DiscountAs")
  String? get discountAs;
  @JsonKey(name: "Action")
  String? get action;
  @JsonKey(name: "IsActive")
  String? get isActive;
  @JsonKey(name: "ClientCode")
  String? get clientCode;
  @JsonKey(name: "CriteriaMapOrg")
  String? get criteriaMapOrg;
  @JsonKey(name: "IsNewCustomer")
  String? get isNewCustomer;
  @JsonKey(name: "AppliedOnApplications")
  String? get appliedOnApplications;
  @JsonKey(name: "DiscountAsOption")
  String? get discountAsOption;
  @JsonKey(name: "RewardsAsOption")
  String? get rewardsAsOption;
  @JsonKey(name: "LoyaltyTypeOption")
  String? get loyaltyTypeOption;
  @JsonKey(name: "LoyaltyPromoImages")
  List<LoyaltyPromoImage>? get loyaltyPromoImages;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OfferCopyWith<Offer> get copyWith =>
      _$OfferCopyWithImpl<Offer>(this as Offer, _$identity);

  /// Serializes this Offer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Offer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
            (identical(other.licensedCountryCode, licensedCountryCode) ||
                other.licensedCountryCode == licensedCountryCode) &&
            (identical(other.programCode, programCode) ||
                other.programCode == programCode) &&
            (identical(other.programType, programType) ||
                other.programType == programType) &&
            (identical(other.programDescription, programDescription) ||
                other.programDescription == programDescription) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.createdUserId, createdUserId) ||
                other.createdUserId == createdUserId) &&
            (identical(other.rewardsAs, rewardsAs) ||
                other.rewardsAs == rewardsAs) &&
            (identical(other.loyaltyType, loyaltyType) ||
                other.loyaltyType == loyaltyType) &&
            (identical(other.loyaltyValue, loyaltyValue) ||
                other.loyaltyValue == loyaltyValue) &&
            (identical(other.criteriaMap, criteriaMap) ||
                other.criteriaMap == criteriaMap) &&
            (identical(other.criteriaMapSplit, criteriaMapSplit) ||
                other.criteriaMapSplit == criteriaMapSplit) &&
            (identical(
                    other.criteriaApplicationName, criteriaApplicationName) ||
                other.criteriaApplicationName == criteriaApplicationName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.programCodeId, programCodeId) ||
                other.programCodeId == programCodeId) &&
            (identical(other.criteriaID, criteriaID) ||
                other.criteriaID == criteriaID) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.promoCodeLength, promoCodeLength) ||
                other.promoCodeLength == promoCodeLength) &&
            (identical(other.linked, linked) || other.linked == linked) &&
            (identical(other.linkedWith, linkedWith) ||
                other.linkedWith == linkedWith) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.discountAs, discountAs) ||
                other.discountAs == discountAs) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.criteriaMapOrg, criteriaMapOrg) ||
                other.criteriaMapOrg == criteriaMapOrg) &&
            (identical(other.isNewCustomer, isNewCustomer) ||
                other.isNewCustomer == isNewCustomer) &&
            (identical(other.appliedOnApplications, appliedOnApplications) ||
                other.appliedOnApplications == appliedOnApplications) &&
            (identical(other.discountAsOption, discountAsOption) ||
                other.discountAsOption == discountAsOption) &&
            (identical(other.rewardsAsOption, rewardsAsOption) ||
                other.rewardsAsOption == rewardsAsOption) &&
            (identical(other.loyaltyTypeOption, loyaltyTypeOption) ||
                other.loyaltyTypeOption == loyaltyTypeOption) &&
            const DeepCollectionEquality()
                .equals(other.loyaltyPromoImages, loyaltyPromoImages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        companyCode,
        licensedCountryCode,
        programCode,
        programType,
        programDescription,
        promoCode,
        createdUserId,
        rewardsAs,
        loyaltyType,
        loyaltyValue,
        criteriaMap,
        criteriaMapSplit,
        criteriaApplicationName,
        status,
        createdBy,
        createdDateTime,
        updatedDateTime,
        updatedBy,
        programCodeId,
        criteriaID,
        userId,
        promoCodeLength,
        linked,
        linkedWith,
        dateFrom,
        dateTo,
        discountAs,
        action,
        isActive,
        clientCode,
        criteriaMapOrg,
        isNewCustomer,
        appliedOnApplications,
        discountAsOption,
        rewardsAsOption,
        loyaltyTypeOption,
        const DeepCollectionEquality().hash(loyaltyPromoImages)
      ]);

  @override
  String toString() {
    return 'Offer(id: $id, companyCode: $companyCode, licensedCountryCode: $licensedCountryCode, programCode: $programCode, programType: $programType, programDescription: $programDescription, promoCode: $promoCode, createdUserId: $createdUserId, rewardsAs: $rewardsAs, loyaltyType: $loyaltyType, loyaltyValue: $loyaltyValue, criteriaMap: $criteriaMap, criteriaMapSplit: $criteriaMapSplit, criteriaApplicationName: $criteriaApplicationName, status: $status, createdBy: $createdBy, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, updatedBy: $updatedBy, programCodeId: $programCodeId, criteriaID: $criteriaID, userId: $userId, promoCodeLength: $promoCodeLength, linked: $linked, linkedWith: $linkedWith, dateFrom: $dateFrom, dateTo: $dateTo, discountAs: $discountAs, action: $action, isActive: $isActive, clientCode: $clientCode, criteriaMapOrg: $criteriaMapOrg, isNewCustomer: $isNewCustomer, appliedOnApplications: $appliedOnApplications, discountAsOption: $discountAsOption, rewardsAsOption: $rewardsAsOption, loyaltyTypeOption: $loyaltyTypeOption, loyaltyPromoImages: $loyaltyPromoImages)';
  }
}

/// @nodoc
abstract mixin class $OfferCopyWith<$Res> {
  factory $OfferCopyWith(Offer value, $Res Function(Offer) _then) =
      _$OfferCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") String? id,
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
      @JsonKey(name: "LoyaltyPromoImages")
      List<LoyaltyPromoImage>? loyaltyPromoImages});
}

/// @nodoc
class _$OfferCopyWithImpl<$Res> implements $OfferCopyWith<$Res> {
  _$OfferCopyWithImpl(this._self, this._then);

  final Offer _self;
  final $Res Function(Offer) _then;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? companyCode = freezed,
    Object? licensedCountryCode = freezed,
    Object? programCode = freezed,
    Object? programType = freezed,
    Object? programDescription = freezed,
    Object? promoCode = freezed,
    Object? createdUserId = freezed,
    Object? rewardsAs = freezed,
    Object? loyaltyType = freezed,
    Object? loyaltyValue = freezed,
    Object? criteriaMap = freezed,
    Object? criteriaMapSplit = freezed,
    Object? criteriaApplicationName = freezed,
    Object? status = freezed,
    Object? createdBy = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? updatedBy = freezed,
    Object? programCodeId = freezed,
    Object? criteriaID = freezed,
    Object? userId = freezed,
    Object? promoCodeLength = freezed,
    Object? linked = freezed,
    Object? linkedWith = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? discountAs = freezed,
    Object? action = freezed,
    Object? isActive = freezed,
    Object? clientCode = freezed,
    Object? criteriaMapOrg = freezed,
    Object? isNewCustomer = freezed,
    Object? appliedOnApplications = freezed,
    Object? discountAsOption = freezed,
    Object? rewardsAsOption = freezed,
    Object? loyaltyTypeOption = freezed,
    Object? loyaltyPromoImages = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _self.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      licensedCountryCode: freezed == licensedCountryCode
          ? _self.licensedCountryCode
          : licensedCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      programCode: freezed == programCode
          ? _self.programCode
          : programCode // ignore: cast_nullable_to_non_nullable
              as String?,
      programType: freezed == programType
          ? _self.programType
          : programType // ignore: cast_nullable_to_non_nullable
              as String?,
      programDescription: freezed == programDescription
          ? _self.programDescription
          : programDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      promoCode: freezed == promoCode
          ? _self.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdUserId: freezed == createdUserId
          ? _self.createdUserId
          : createdUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardsAs: freezed == rewardsAs
          ? _self.rewardsAs
          : rewardsAs // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyType: freezed == loyaltyType
          ? _self.loyaltyType
          : loyaltyType // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyValue: freezed == loyaltyValue
          ? _self.loyaltyValue
          : loyaltyValue // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaMap: freezed == criteriaMap
          ? _self.criteriaMap
          : criteriaMap // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaMapSplit: freezed == criteriaMapSplit
          ? _self.criteriaMapSplit
          : criteriaMapSplit // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaApplicationName: freezed == criteriaApplicationName
          ? _self.criteriaApplicationName
          : criteriaApplicationName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _self.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDateTime: freezed == updatedDateTime
          ? _self.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _self.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      programCodeId: freezed == programCodeId
          ? _self.programCodeId
          : programCodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaID: freezed == criteriaID
          ? _self.criteriaID
          : criteriaID // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      promoCodeLength: freezed == promoCodeLength
          ? _self.promoCodeLength
          : promoCodeLength // ignore: cast_nullable_to_non_nullable
              as String?,
      linked: freezed == linked
          ? _self.linked
          : linked // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedWith: freezed == linkedWith
          ? _self.linkedWith
          : linkedWith // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _self.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTo: freezed == dateTo
          ? _self.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAs: freezed == discountAs
          ? _self.discountAs
          : discountAs // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCode: freezed == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaMapOrg: freezed == criteriaMapOrg
          ? _self.criteriaMapOrg
          : criteriaMapOrg // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewCustomer: freezed == isNewCustomer
          ? _self.isNewCustomer
          : isNewCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedOnApplications: freezed == appliedOnApplications
          ? _self.appliedOnApplications
          : appliedOnApplications // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAsOption: freezed == discountAsOption
          ? _self.discountAsOption
          : discountAsOption // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardsAsOption: freezed == rewardsAsOption
          ? _self.rewardsAsOption
          : rewardsAsOption // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyTypeOption: freezed == loyaltyTypeOption
          ? _self.loyaltyTypeOption
          : loyaltyTypeOption // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyPromoImages: freezed == loyaltyPromoImages
          ? _self.loyaltyPromoImages
          : loyaltyPromoImages // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyPromoImage>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Offer].
extension OfferPatterns on Offer {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Offer value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Offer() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Offer value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Offer():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Offer value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Offer() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
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
            @JsonKey(name: "CriteriaApplicationName")
            String? criteriaApplicationName,
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
            @JsonKey(name: "AppliedOnApplications")
            String? appliedOnApplications,
            @JsonKey(name: "DiscountAsOption") String? discountAsOption,
            @JsonKey(name: "RewardsAsOption") String? rewardsAsOption,
            @JsonKey(name: "LoyaltyTypeOption") String? loyaltyTypeOption,
            @JsonKey(name: "LoyaltyPromoImages")
            List<LoyaltyPromoImage>? loyaltyPromoImages)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Offer() when $default != null:
        return $default(
            _that.id,
            _that.companyCode,
            _that.licensedCountryCode,
            _that.programCode,
            _that.programType,
            _that.programDescription,
            _that.promoCode,
            _that.createdUserId,
            _that.rewardsAs,
            _that.loyaltyType,
            _that.loyaltyValue,
            _that.criteriaMap,
            _that.criteriaMapSplit,
            _that.criteriaApplicationName,
            _that.status,
            _that.createdBy,
            _that.createdDateTime,
            _that.updatedDateTime,
            _that.updatedBy,
            _that.programCodeId,
            _that.criteriaID,
            _that.userId,
            _that.promoCodeLength,
            _that.linked,
            _that.linkedWith,
            _that.dateFrom,
            _that.dateTo,
            _that.discountAs,
            _that.action,
            _that.isActive,
            _that.clientCode,
            _that.criteriaMapOrg,
            _that.isNewCustomer,
            _that.appliedOnApplications,
            _that.discountAsOption,
            _that.rewardsAsOption,
            _that.loyaltyTypeOption,
            _that.loyaltyPromoImages);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
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
            @JsonKey(name: "CriteriaApplicationName")
            String? criteriaApplicationName,
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
            @JsonKey(name: "AppliedOnApplications")
            String? appliedOnApplications,
            @JsonKey(name: "DiscountAsOption") String? discountAsOption,
            @JsonKey(name: "RewardsAsOption") String? rewardsAsOption,
            @JsonKey(name: "LoyaltyTypeOption") String? loyaltyTypeOption,
            @JsonKey(name: "LoyaltyPromoImages")
            List<LoyaltyPromoImage>? loyaltyPromoImages)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Offer():
        return $default(
            _that.id,
            _that.companyCode,
            _that.licensedCountryCode,
            _that.programCode,
            _that.programType,
            _that.programDescription,
            _that.promoCode,
            _that.createdUserId,
            _that.rewardsAs,
            _that.loyaltyType,
            _that.loyaltyValue,
            _that.criteriaMap,
            _that.criteriaMapSplit,
            _that.criteriaApplicationName,
            _that.status,
            _that.createdBy,
            _that.createdDateTime,
            _that.updatedDateTime,
            _that.updatedBy,
            _that.programCodeId,
            _that.criteriaID,
            _that.userId,
            _that.promoCodeLength,
            _that.linked,
            _that.linkedWith,
            _that.dateFrom,
            _that.dateTo,
            _that.discountAs,
            _that.action,
            _that.isActive,
            _that.clientCode,
            _that.criteriaMapOrg,
            _that.isNewCustomer,
            _that.appliedOnApplications,
            _that.discountAsOption,
            _that.rewardsAsOption,
            _that.loyaltyTypeOption,
            _that.loyaltyPromoImages);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
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
            @JsonKey(name: "CriteriaApplicationName")
            String? criteriaApplicationName,
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
            @JsonKey(name: "AppliedOnApplications")
            String? appliedOnApplications,
            @JsonKey(name: "DiscountAsOption") String? discountAsOption,
            @JsonKey(name: "RewardsAsOption") String? rewardsAsOption,
            @JsonKey(name: "LoyaltyTypeOption") String? loyaltyTypeOption,
            @JsonKey(name: "LoyaltyPromoImages")
            List<LoyaltyPromoImage>? loyaltyPromoImages)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Offer() when $default != null:
        return $default(
            _that.id,
            _that.companyCode,
            _that.licensedCountryCode,
            _that.programCode,
            _that.programType,
            _that.programDescription,
            _that.promoCode,
            _that.createdUserId,
            _that.rewardsAs,
            _that.loyaltyType,
            _that.loyaltyValue,
            _that.criteriaMap,
            _that.criteriaMapSplit,
            _that.criteriaApplicationName,
            _that.status,
            _that.createdBy,
            _that.createdDateTime,
            _that.updatedDateTime,
            _that.updatedBy,
            _that.programCodeId,
            _that.criteriaID,
            _that.userId,
            _that.promoCodeLength,
            _that.linked,
            _that.linkedWith,
            _that.dateFrom,
            _that.dateTo,
            _that.discountAs,
            _that.action,
            _that.isActive,
            _that.clientCode,
            _that.criteriaMapOrg,
            _that.isNewCustomer,
            _that.appliedOnApplications,
            _that.discountAsOption,
            _that.rewardsAsOption,
            _that.loyaltyTypeOption,
            _that.loyaltyPromoImages);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Offer implements Offer {
  const _Offer(
      {@JsonKey(name: "Id") this.id,
      @JsonKey(name: "CompanyCode") this.companyCode,
      @JsonKey(name: "LicensedCountryCode") this.licensedCountryCode,
      @JsonKey(name: "ProgramCode") this.programCode,
      @JsonKey(name: "ProgramType") this.programType,
      @JsonKey(name: "ProgramDescription") this.programDescription,
      @JsonKey(name: "PromoCode") this.promoCode,
      @JsonKey(name: "CreatedUserId") this.createdUserId,
      @JsonKey(name: "RewardsAs") this.rewardsAs,
      @JsonKey(name: "LoyaltyType") this.loyaltyType,
      @JsonKey(name: "LoyaltyValue") this.loyaltyValue,
      @JsonKey(name: "CriteriaMap") this.criteriaMap,
      @JsonKey(name: "CriteriaMapSplit") this.criteriaMapSplit,
      @JsonKey(name: "CriteriaApplicationName") this.criteriaApplicationName,
      @JsonKey(name: "Status") this.status,
      @JsonKey(name: "CreatedBy") this.createdBy,
      @JsonKey(name: "CreatedDateTime") this.createdDateTime,
      @JsonKey(name: "UpdatedDateTime") this.updatedDateTime,
      @JsonKey(name: "UpdatedBy") this.updatedBy,
      @JsonKey(name: "ProgramCodeId") this.programCodeId,
      @JsonKey(name: "CriteriaID") this.criteriaID,
      @JsonKey(name: "UserId") this.userId,
      @JsonKey(name: "PromoCodeLength") this.promoCodeLength,
      @JsonKey(name: "Linked") this.linked,
      @JsonKey(name: "LinkedWith") this.linkedWith,
      @JsonKey(name: "DateFrom") this.dateFrom,
      @JsonKey(name: "DateTo") this.dateTo,
      @JsonKey(name: "DiscountAs") this.discountAs,
      @JsonKey(name: "Action") this.action,
      @JsonKey(name: "IsActive") this.isActive,
      @JsonKey(name: "ClientCode") this.clientCode,
      @JsonKey(name: "CriteriaMapOrg") this.criteriaMapOrg,
      @JsonKey(name: "IsNewCustomer") this.isNewCustomer,
      @JsonKey(name: "AppliedOnApplications") this.appliedOnApplications,
      @JsonKey(name: "DiscountAsOption") this.discountAsOption,
      @JsonKey(name: "RewardsAsOption") this.rewardsAsOption,
      @JsonKey(name: "LoyaltyTypeOption") this.loyaltyTypeOption,
      @JsonKey(name: "LoyaltyPromoImages")
      final List<LoyaltyPromoImage>? loyaltyPromoImages})
      : _loyaltyPromoImages = loyaltyPromoImages;
  factory _Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  @override
  @JsonKey(name: "Id")
  final String? id;
  @override
  @JsonKey(name: "CompanyCode")
  final String? companyCode;
  @override
  @JsonKey(name: "LicensedCountryCode")
  final String? licensedCountryCode;
  @override
  @JsonKey(name: "ProgramCode")
  final String? programCode;
  @override
  @JsonKey(name: "ProgramType")
  final String? programType;
  @override
  @JsonKey(name: "ProgramDescription")
  final String? programDescription;
  @override
  @JsonKey(name: "PromoCode")
  final String? promoCode;
  @override
  @JsonKey(name: "CreatedUserId")
  final String? createdUserId;
  @override
  @JsonKey(name: "RewardsAs")
  final String? rewardsAs;
  @override
  @JsonKey(name: "LoyaltyType")
  final String? loyaltyType;
  @override
  @JsonKey(name: "LoyaltyValue")
  final String? loyaltyValue;
  @override
  @JsonKey(name: "CriteriaMap")
  final String? criteriaMap;
  @override
  @JsonKey(name: "CriteriaMapSplit")
  final String? criteriaMapSplit;
  @override
  @JsonKey(name: "CriteriaApplicationName")
  final String? criteriaApplicationName;
  @override
  @JsonKey(name: "Status")
  final String? status;
  @override
  @JsonKey(name: "CreatedBy")
  final String? createdBy;
  @override
  @JsonKey(name: "CreatedDateTime")
  final String? createdDateTime;
  @override
  @JsonKey(name: "UpdatedDateTime")
  final String? updatedDateTime;
  @override
  @JsonKey(name: "UpdatedBy")
  final String? updatedBy;
  @override
  @JsonKey(name: "ProgramCodeId")
  final String? programCodeId;
  @override
  @JsonKey(name: "CriteriaID")
  final String? criteriaID;
  @override
  @JsonKey(name: "UserId")
  final String? userId;
  @override
  @JsonKey(name: "PromoCodeLength")
  final String? promoCodeLength;
  @override
  @JsonKey(name: "Linked")
  final String? linked;
  @override
  @JsonKey(name: "LinkedWith")
  final String? linkedWith;
  @override
  @JsonKey(name: "DateFrom")
  final String? dateFrom;
  @override
  @JsonKey(name: "DateTo")
  final String? dateTo;
  @override
  @JsonKey(name: "DiscountAs")
  final String? discountAs;
  @override
  @JsonKey(name: "Action")
  final String? action;
  @override
  @JsonKey(name: "IsActive")
  final String? isActive;
  @override
  @JsonKey(name: "ClientCode")
  final String? clientCode;
  @override
  @JsonKey(name: "CriteriaMapOrg")
  final String? criteriaMapOrg;
  @override
  @JsonKey(name: "IsNewCustomer")
  final String? isNewCustomer;
  @override
  @JsonKey(name: "AppliedOnApplications")
  final String? appliedOnApplications;
  @override
  @JsonKey(name: "DiscountAsOption")
  final String? discountAsOption;
  @override
  @JsonKey(name: "RewardsAsOption")
  final String? rewardsAsOption;
  @override
  @JsonKey(name: "LoyaltyTypeOption")
  final String? loyaltyTypeOption;
  final List<LoyaltyPromoImage>? _loyaltyPromoImages;
  @override
  @JsonKey(name: "LoyaltyPromoImages")
  List<LoyaltyPromoImage>? get loyaltyPromoImages {
    final value = _loyaltyPromoImages;
    if (value == null) return null;
    if (_loyaltyPromoImages is EqualUnmodifiableListView)
      return _loyaltyPromoImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OfferCopyWith<_Offer> get copyWith =>
      __$OfferCopyWithImpl<_Offer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OfferToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Offer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyCode, companyCode) ||
                other.companyCode == companyCode) &&
            (identical(other.licensedCountryCode, licensedCountryCode) ||
                other.licensedCountryCode == licensedCountryCode) &&
            (identical(other.programCode, programCode) ||
                other.programCode == programCode) &&
            (identical(other.programType, programType) ||
                other.programType == programType) &&
            (identical(other.programDescription, programDescription) ||
                other.programDescription == programDescription) &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode) &&
            (identical(other.createdUserId, createdUserId) ||
                other.createdUserId == createdUserId) &&
            (identical(other.rewardsAs, rewardsAs) ||
                other.rewardsAs == rewardsAs) &&
            (identical(other.loyaltyType, loyaltyType) ||
                other.loyaltyType == loyaltyType) &&
            (identical(other.loyaltyValue, loyaltyValue) ||
                other.loyaltyValue == loyaltyValue) &&
            (identical(other.criteriaMap, criteriaMap) ||
                other.criteriaMap == criteriaMap) &&
            (identical(other.criteriaMapSplit, criteriaMapSplit) ||
                other.criteriaMapSplit == criteriaMapSplit) &&
            (identical(
                    other.criteriaApplicationName, criteriaApplicationName) ||
                other.criteriaApplicationName == criteriaApplicationName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.programCodeId, programCodeId) ||
                other.programCodeId == programCodeId) &&
            (identical(other.criteriaID, criteriaID) ||
                other.criteriaID == criteriaID) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.promoCodeLength, promoCodeLength) ||
                other.promoCodeLength == promoCodeLength) &&
            (identical(other.linked, linked) || other.linked == linked) &&
            (identical(other.linkedWith, linkedWith) ||
                other.linkedWith == linkedWith) &&
            (identical(other.dateFrom, dateFrom) ||
                other.dateFrom == dateFrom) &&
            (identical(other.dateTo, dateTo) || other.dateTo == dateTo) &&
            (identical(other.discountAs, discountAs) ||
                other.discountAs == discountAs) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.criteriaMapOrg, criteriaMapOrg) ||
                other.criteriaMapOrg == criteriaMapOrg) &&
            (identical(other.isNewCustomer, isNewCustomer) ||
                other.isNewCustomer == isNewCustomer) &&
            (identical(other.appliedOnApplications, appliedOnApplications) ||
                other.appliedOnApplications == appliedOnApplications) &&
            (identical(other.discountAsOption, discountAsOption) ||
                other.discountAsOption == discountAsOption) &&
            (identical(other.rewardsAsOption, rewardsAsOption) ||
                other.rewardsAsOption == rewardsAsOption) &&
            (identical(other.loyaltyTypeOption, loyaltyTypeOption) ||
                other.loyaltyTypeOption == loyaltyTypeOption) &&
            const DeepCollectionEquality()
                .equals(other._loyaltyPromoImages, _loyaltyPromoImages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        companyCode,
        licensedCountryCode,
        programCode,
        programType,
        programDescription,
        promoCode,
        createdUserId,
        rewardsAs,
        loyaltyType,
        loyaltyValue,
        criteriaMap,
        criteriaMapSplit,
        criteriaApplicationName,
        status,
        createdBy,
        createdDateTime,
        updatedDateTime,
        updatedBy,
        programCodeId,
        criteriaID,
        userId,
        promoCodeLength,
        linked,
        linkedWith,
        dateFrom,
        dateTo,
        discountAs,
        action,
        isActive,
        clientCode,
        criteriaMapOrg,
        isNewCustomer,
        appliedOnApplications,
        discountAsOption,
        rewardsAsOption,
        loyaltyTypeOption,
        const DeepCollectionEquality().hash(_loyaltyPromoImages)
      ]);

  @override
  String toString() {
    return 'Offer(id: $id, companyCode: $companyCode, licensedCountryCode: $licensedCountryCode, programCode: $programCode, programType: $programType, programDescription: $programDescription, promoCode: $promoCode, createdUserId: $createdUserId, rewardsAs: $rewardsAs, loyaltyType: $loyaltyType, loyaltyValue: $loyaltyValue, criteriaMap: $criteriaMap, criteriaMapSplit: $criteriaMapSplit, criteriaApplicationName: $criteriaApplicationName, status: $status, createdBy: $createdBy, createdDateTime: $createdDateTime, updatedDateTime: $updatedDateTime, updatedBy: $updatedBy, programCodeId: $programCodeId, criteriaID: $criteriaID, userId: $userId, promoCodeLength: $promoCodeLength, linked: $linked, linkedWith: $linkedWith, dateFrom: $dateFrom, dateTo: $dateTo, discountAs: $discountAs, action: $action, isActive: $isActive, clientCode: $clientCode, criteriaMapOrg: $criteriaMapOrg, isNewCustomer: $isNewCustomer, appliedOnApplications: $appliedOnApplications, discountAsOption: $discountAsOption, rewardsAsOption: $rewardsAsOption, loyaltyTypeOption: $loyaltyTypeOption, loyaltyPromoImages: $loyaltyPromoImages)';
  }
}

/// @nodoc
abstract mixin class _$OfferCopyWith<$Res> implements $OfferCopyWith<$Res> {
  factory _$OfferCopyWith(_Offer value, $Res Function(_Offer) _then) =
      __$OfferCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") String? id,
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
      @JsonKey(name: "LoyaltyPromoImages")
      List<LoyaltyPromoImage>? loyaltyPromoImages});
}

/// @nodoc
class __$OfferCopyWithImpl<$Res> implements _$OfferCopyWith<$Res> {
  __$OfferCopyWithImpl(this._self, this._then);

  final _Offer _self;
  final $Res Function(_Offer) _then;

  /// Create a copy of Offer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? companyCode = freezed,
    Object? licensedCountryCode = freezed,
    Object? programCode = freezed,
    Object? programType = freezed,
    Object? programDescription = freezed,
    Object? promoCode = freezed,
    Object? createdUserId = freezed,
    Object? rewardsAs = freezed,
    Object? loyaltyType = freezed,
    Object? loyaltyValue = freezed,
    Object? criteriaMap = freezed,
    Object? criteriaMapSplit = freezed,
    Object? criteriaApplicationName = freezed,
    Object? status = freezed,
    Object? createdBy = freezed,
    Object? createdDateTime = freezed,
    Object? updatedDateTime = freezed,
    Object? updatedBy = freezed,
    Object? programCodeId = freezed,
    Object? criteriaID = freezed,
    Object? userId = freezed,
    Object? promoCodeLength = freezed,
    Object? linked = freezed,
    Object? linkedWith = freezed,
    Object? dateFrom = freezed,
    Object? dateTo = freezed,
    Object? discountAs = freezed,
    Object? action = freezed,
    Object? isActive = freezed,
    Object? clientCode = freezed,
    Object? criteriaMapOrg = freezed,
    Object? isNewCustomer = freezed,
    Object? appliedOnApplications = freezed,
    Object? discountAsOption = freezed,
    Object? rewardsAsOption = freezed,
    Object? loyaltyTypeOption = freezed,
    Object? loyaltyPromoImages = freezed,
  }) {
    return _then(_Offer(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      companyCode: freezed == companyCode
          ? _self.companyCode
          : companyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      licensedCountryCode: freezed == licensedCountryCode
          ? _self.licensedCountryCode
          : licensedCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      programCode: freezed == programCode
          ? _self.programCode
          : programCode // ignore: cast_nullable_to_non_nullable
              as String?,
      programType: freezed == programType
          ? _self.programType
          : programType // ignore: cast_nullable_to_non_nullable
              as String?,
      programDescription: freezed == programDescription
          ? _self.programDescription
          : programDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      promoCode: freezed == promoCode
          ? _self.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String?,
      createdUserId: freezed == createdUserId
          ? _self.createdUserId
          : createdUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardsAs: freezed == rewardsAs
          ? _self.rewardsAs
          : rewardsAs // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyType: freezed == loyaltyType
          ? _self.loyaltyType
          : loyaltyType // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyValue: freezed == loyaltyValue
          ? _self.loyaltyValue
          : loyaltyValue // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaMap: freezed == criteriaMap
          ? _self.criteriaMap
          : criteriaMap // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaMapSplit: freezed == criteriaMapSplit
          ? _self.criteriaMapSplit
          : criteriaMapSplit // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaApplicationName: freezed == criteriaApplicationName
          ? _self.criteriaApplicationName
          : criteriaApplicationName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _self.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDateTime: freezed == updatedDateTime
          ? _self.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _self.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      programCodeId: freezed == programCodeId
          ? _self.programCodeId
          : programCodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaID: freezed == criteriaID
          ? _self.criteriaID
          : criteriaID // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      promoCodeLength: freezed == promoCodeLength
          ? _self.promoCodeLength
          : promoCodeLength // ignore: cast_nullable_to_non_nullable
              as String?,
      linked: freezed == linked
          ? _self.linked
          : linked // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedWith: freezed == linkedWith
          ? _self.linkedWith
          : linkedWith // ignore: cast_nullable_to_non_nullable
              as String?,
      dateFrom: freezed == dateFrom
          ? _self.dateFrom
          : dateFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTo: freezed == dateTo
          ? _self.dateTo
          : dateTo // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAs: freezed == discountAs
          ? _self.discountAs
          : discountAs // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCode: freezed == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String?,
      criteriaMapOrg: freezed == criteriaMapOrg
          ? _self.criteriaMapOrg
          : criteriaMapOrg // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewCustomer: freezed == isNewCustomer
          ? _self.isNewCustomer
          : isNewCustomer // ignore: cast_nullable_to_non_nullable
              as String?,
      appliedOnApplications: freezed == appliedOnApplications
          ? _self.appliedOnApplications
          : appliedOnApplications // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAsOption: freezed == discountAsOption
          ? _self.discountAsOption
          : discountAsOption // ignore: cast_nullable_to_non_nullable
              as String?,
      rewardsAsOption: freezed == rewardsAsOption
          ? _self.rewardsAsOption
          : rewardsAsOption // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyTypeOption: freezed == loyaltyTypeOption
          ? _self.loyaltyTypeOption
          : loyaltyTypeOption // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyPromoImages: freezed == loyaltyPromoImages
          ? _self._loyaltyPromoImages
          : loyaltyPromoImages // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyPromoImage>?,
    ));
  }
}

/// @nodoc
mixin _$LoyaltyPromoImage {
  @JsonKey(name: "Id")
  String? get id;
  @JsonKey(name: "ProgramCode")
  String? get programCode;
  @JsonKey(name: "ImageName")
  String? get imageName;
  @JsonKey(name: "ImageOriginalName")
  String? get imageOriginalName;
  @JsonKey(name: "Status")
  String? get status;
  @JsonKey(name: "CreatedBy")
  String? get createdBy;
  @JsonKey(name: "CreatedDateTime")
  String? get createdDateTime;
  @JsonKey(name: "UpdatedBy")
  String? get updatedBy;
  @JsonKey(name: "UpdatedDateTime")
  String? get updatedDateTime;
  @JsonKey(name: "UserId")
  String? get userId;
  @JsonKey(name: "PromoImage")
  String? get promoImage;
  @JsonKey(name: "Operation")
  String? get operation;

  /// Create a copy of LoyaltyPromoImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoyaltyPromoImageCopyWith<LoyaltyPromoImage> get copyWith =>
      _$LoyaltyPromoImageCopyWithImpl<LoyaltyPromoImage>(
          this as LoyaltyPromoImage, _$identity);

  /// Serializes this LoyaltyPromoImage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoyaltyPromoImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.programCode, programCode) ||
                other.programCode == programCode) &&
            (identical(other.imageName, imageName) ||
                other.imageName == imageName) &&
            (identical(other.imageOriginalName, imageOriginalName) ||
                other.imageOriginalName == imageOriginalName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.promoImage, promoImage) ||
                other.promoImage == promoImage) &&
            (identical(other.operation, operation) ||
                other.operation == operation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      programCode,
      imageName,
      imageOriginalName,
      status,
      createdBy,
      createdDateTime,
      updatedBy,
      updatedDateTime,
      userId,
      promoImage,
      operation);

  @override
  String toString() {
    return 'LoyaltyPromoImage(id: $id, programCode: $programCode, imageName: $imageName, imageOriginalName: $imageOriginalName, status: $status, createdBy: $createdBy, createdDateTime: $createdDateTime, updatedBy: $updatedBy, updatedDateTime: $updatedDateTime, userId: $userId, promoImage: $promoImage, operation: $operation)';
  }
}

/// @nodoc
abstract mixin class $LoyaltyPromoImageCopyWith<$Res> {
  factory $LoyaltyPromoImageCopyWith(
          LoyaltyPromoImage value, $Res Function(LoyaltyPromoImage) _then) =
      _$LoyaltyPromoImageCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Id") String? id,
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
      @JsonKey(name: "Operation") String? operation});
}

/// @nodoc
class _$LoyaltyPromoImageCopyWithImpl<$Res>
    implements $LoyaltyPromoImageCopyWith<$Res> {
  _$LoyaltyPromoImageCopyWithImpl(this._self, this._then);

  final LoyaltyPromoImage _self;
  final $Res Function(LoyaltyPromoImage) _then;

  /// Create a copy of LoyaltyPromoImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? programCode = freezed,
    Object? imageName = freezed,
    Object? imageOriginalName = freezed,
    Object? status = freezed,
    Object? createdBy = freezed,
    Object? createdDateTime = freezed,
    Object? updatedBy = freezed,
    Object? updatedDateTime = freezed,
    Object? userId = freezed,
    Object? promoImage = freezed,
    Object? operation = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      programCode: freezed == programCode
          ? _self.programCode
          : programCode // ignore: cast_nullable_to_non_nullable
              as String?,
      imageName: freezed == imageName
          ? _self.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageOriginalName: freezed == imageOriginalName
          ? _self.imageOriginalName
          : imageOriginalName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _self.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _self.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDateTime: freezed == updatedDateTime
          ? _self.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      promoImage: freezed == promoImage
          ? _self.promoImage
          : promoImage // ignore: cast_nullable_to_non_nullable
              as String?,
      operation: freezed == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LoyaltyPromoImage].
extension LoyaltyPromoImagePatterns on LoyaltyPromoImage {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoyaltyPromoImage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoyaltyPromoImage() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LoyaltyPromoImage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoyaltyPromoImage():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LoyaltyPromoImage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoyaltyPromoImage() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
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
            @JsonKey(name: "Operation") String? operation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LoyaltyPromoImage() when $default != null:
        return $default(
            _that.id,
            _that.programCode,
            _that.imageName,
            _that.imageOriginalName,
            _that.status,
            _that.createdBy,
            _that.createdDateTime,
            _that.updatedBy,
            _that.updatedDateTime,
            _that.userId,
            _that.promoImage,
            _that.operation);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
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
            @JsonKey(name: "Operation") String? operation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoyaltyPromoImage():
        return $default(
            _that.id,
            _that.programCode,
            _that.imageName,
            _that.imageOriginalName,
            _that.status,
            _that.createdBy,
            _that.createdDateTime,
            _that.updatedBy,
            _that.updatedDateTime,
            _that.userId,
            _that.promoImage,
            _that.operation);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
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
            @JsonKey(name: "Operation") String? operation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LoyaltyPromoImage() when $default != null:
        return $default(
            _that.id,
            _that.programCode,
            _that.imageName,
            _that.imageOriginalName,
            _that.status,
            _that.createdBy,
            _that.createdDateTime,
            _that.updatedBy,
            _that.updatedDateTime,
            _that.userId,
            _that.promoImage,
            _that.operation);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LoyaltyPromoImage implements LoyaltyPromoImage {
  const _LoyaltyPromoImage(
      {@JsonKey(name: "Id") this.id,
      @JsonKey(name: "ProgramCode") this.programCode,
      @JsonKey(name: "ImageName") this.imageName,
      @JsonKey(name: "ImageOriginalName") this.imageOriginalName,
      @JsonKey(name: "Status") this.status,
      @JsonKey(name: "CreatedBy") this.createdBy,
      @JsonKey(name: "CreatedDateTime") this.createdDateTime,
      @JsonKey(name: "UpdatedBy") this.updatedBy,
      @JsonKey(name: "UpdatedDateTime") this.updatedDateTime,
      @JsonKey(name: "UserId") this.userId,
      @JsonKey(name: "PromoImage") this.promoImage,
      @JsonKey(name: "Operation") this.operation});
  factory _LoyaltyPromoImage.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyPromoImageFromJson(json);

  @override
  @JsonKey(name: "Id")
  final String? id;
  @override
  @JsonKey(name: "ProgramCode")
  final String? programCode;
  @override
  @JsonKey(name: "ImageName")
  final String? imageName;
  @override
  @JsonKey(name: "ImageOriginalName")
  final String? imageOriginalName;
  @override
  @JsonKey(name: "Status")
  final String? status;
  @override
  @JsonKey(name: "CreatedBy")
  final String? createdBy;
  @override
  @JsonKey(name: "CreatedDateTime")
  final String? createdDateTime;
  @override
  @JsonKey(name: "UpdatedBy")
  final String? updatedBy;
  @override
  @JsonKey(name: "UpdatedDateTime")
  final String? updatedDateTime;
  @override
  @JsonKey(name: "UserId")
  final String? userId;
  @override
  @JsonKey(name: "PromoImage")
  final String? promoImage;
  @override
  @JsonKey(name: "Operation")
  final String? operation;

  /// Create a copy of LoyaltyPromoImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoyaltyPromoImageCopyWith<_LoyaltyPromoImage> get copyWith =>
      __$LoyaltyPromoImageCopyWithImpl<_LoyaltyPromoImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoyaltyPromoImageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoyaltyPromoImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.programCode, programCode) ||
                other.programCode == programCode) &&
            (identical(other.imageName, imageName) ||
                other.imageName == imageName) &&
            (identical(other.imageOriginalName, imageOriginalName) ||
                other.imageOriginalName == imageOriginalName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.promoImage, promoImage) ||
                other.promoImage == promoImage) &&
            (identical(other.operation, operation) ||
                other.operation == operation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      programCode,
      imageName,
      imageOriginalName,
      status,
      createdBy,
      createdDateTime,
      updatedBy,
      updatedDateTime,
      userId,
      promoImage,
      operation);

  @override
  String toString() {
    return 'LoyaltyPromoImage(id: $id, programCode: $programCode, imageName: $imageName, imageOriginalName: $imageOriginalName, status: $status, createdBy: $createdBy, createdDateTime: $createdDateTime, updatedBy: $updatedBy, updatedDateTime: $updatedDateTime, userId: $userId, promoImage: $promoImage, operation: $operation)';
  }
}

/// @nodoc
abstract mixin class _$LoyaltyPromoImageCopyWith<$Res>
    implements $LoyaltyPromoImageCopyWith<$Res> {
  factory _$LoyaltyPromoImageCopyWith(
          _LoyaltyPromoImage value, $Res Function(_LoyaltyPromoImage) _then) =
      __$LoyaltyPromoImageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Id") String? id,
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
      @JsonKey(name: "Operation") String? operation});
}

/// @nodoc
class __$LoyaltyPromoImageCopyWithImpl<$Res>
    implements _$LoyaltyPromoImageCopyWith<$Res> {
  __$LoyaltyPromoImageCopyWithImpl(this._self, this._then);

  final _LoyaltyPromoImage _self;
  final $Res Function(_LoyaltyPromoImage) _then;

  /// Create a copy of LoyaltyPromoImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? programCode = freezed,
    Object? imageName = freezed,
    Object? imageOriginalName = freezed,
    Object? status = freezed,
    Object? createdBy = freezed,
    Object? createdDateTime = freezed,
    Object? updatedBy = freezed,
    Object? updatedDateTime = freezed,
    Object? userId = freezed,
    Object? promoImage = freezed,
    Object? operation = freezed,
  }) {
    return _then(_LoyaltyPromoImage(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      programCode: freezed == programCode
          ? _self.programCode
          : programCode // ignore: cast_nullable_to_non_nullable
              as String?,
      imageName: freezed == imageName
          ? _self.imageName
          : imageName // ignore: cast_nullable_to_non_nullable
              as String?,
      imageOriginalName: freezed == imageOriginalName
          ? _self.imageOriginalName
          : imageOriginalName // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _self.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDateTime: freezed == createdDateTime
          ? _self.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedBy: freezed == updatedBy
          ? _self.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDateTime: freezed == updatedDateTime
          ? _self.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      promoImage: freezed == promoImage
          ? _self.promoImage
          : promoImage // ignore: cast_nullable_to_non_nullable
              as String?,
      operation: freezed == operation
          ? _self.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
