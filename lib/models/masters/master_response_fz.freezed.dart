// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_response_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MasterResponseFZ {
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'Desc', readValue: _readName)
  String get Desc;
  @JsonKey(name: 'Code', readValue: _readCode)
  String get Code;
  @JsonKey(name: 'type')
  String get type;
  @JsonKey(name: 'baseUrl')
  String get baseUrl;
  @JsonKey(name: 'address')
  String get address;
  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'phone')
  String get phone;
  @JsonKey(name: 'bicType')
  String get bicType;
  @JsonKey(name: 'bicValue')
  String get bicValue;
  @JsonKey(name: 'CurrencyFlagPath')
  String get CurrencyFlagPath;
  @JsonKey(name: 'label')
  String get label;
  @JsonKey(name: 'BankCode')
  String get BankCode;
  @JsonKey(name: 'BankName')
  String get BankName;
  @JsonKey(name: 'BranchCode')
  String get BranchCode;
  @JsonKey(name: 'BranchName')
  String get BranchName;
  @JsonKey(name: 'BranchAddress1')
  String get BranchAddress1;
  @JsonKey(name: 'BranchAddress2')
  String get BranchAddress2;
  @JsonKey(name: 'BranchAddress3')
  String get BranchAddress3;
  @JsonKey(name: 'BranchBicDetails')
  List<BranchBicDetails> get branchBicDetails;
  @JsonKey(name: 'Provider')
  String get provider;
  @JsonKey(name: 'MappingCode')
  String get mappingCode;
  @JsonKey(name: 'ImageContent')
  String get imageContent;
  @JsonKey(name: 'Status')
  String get providerStatus;
  @JsonKey(name: 'ServiceCategory')
  String get providerServiceCategory;
  @JsonKey(name: 'CategoryCode')
  String get categoryCode;
  @JsonKey(name: 'CategoryName')
  String get categoryName;
  @JsonKey(name: 'CountryCode')
  String get countryCode;
  @JsonKey(name: 'CountryName')
  String get countryName;
  @JsonKey(name: 'CurrencyCode')
  String get currencyCode;
  @JsonKey(name: 'CurrencyName')
  String get currencyName;
  @JsonKey(name: 'StateName')
  String get stateName;
  @JsonKey(name: 'StateCode')
  String get stateCode;
  @JsonKey(name: 'CityName')
  String get cityName;
  @JsonKey(name: 'CityCode')
  String get cityCode;
  @JsonKey(name: 'AccountLengthList')
  List<BankAccountLength>? get accountLengthList;

  /// Create a copy of MasterResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<MasterResponseFZ> get copyWith =>
      _$MasterResponseFZCopyWithImpl<MasterResponseFZ>(
          this as MasterResponseFZ, _$identity);

  /// Serializes this MasterResponseFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MasterResponseFZ &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.Desc, Desc) || other.Desc == Desc) &&
            (identical(other.Code, Code) || other.Code == Code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.bicType, bicType) || other.bicType == bicType) &&
            (identical(other.bicValue, bicValue) ||
                other.bicValue == bicValue) &&
            (identical(other.CurrencyFlagPath, CurrencyFlagPath) ||
                other.CurrencyFlagPath == CurrencyFlagPath) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.BankCode, BankCode) ||
                other.BankCode == BankCode) &&
            (identical(other.BankName, BankName) ||
                other.BankName == BankName) &&
            (identical(other.BranchCode, BranchCode) ||
                other.BranchCode == BranchCode) &&
            (identical(other.BranchName, BranchName) ||
                other.BranchName == BranchName) &&
            (identical(other.BranchAddress1, BranchAddress1) ||
                other.BranchAddress1 == BranchAddress1) &&
            (identical(other.BranchAddress2, BranchAddress2) ||
                other.BranchAddress2 == BranchAddress2) &&
            (identical(other.BranchAddress3, BranchAddress3) ||
                other.BranchAddress3 == BranchAddress3) &&
            const DeepCollectionEquality()
                .equals(other.branchBicDetails, branchBicDetails) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.mappingCode, mappingCode) ||
                other.mappingCode == mappingCode) &&
            (identical(other.imageContent, imageContent) ||
                other.imageContent == imageContent) &&
            (identical(other.providerStatus, providerStatus) ||
                other.providerStatus == providerStatus) &&
            (identical(
                    other.providerServiceCategory, providerServiceCategory) ||
                other.providerServiceCategory == providerServiceCategory) &&
            (identical(other.categoryCode, categoryCode) ||
                other.categoryCode == categoryCode) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currencyName, currencyName) ||
                other.currencyName == currencyName) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.cityCode, cityCode) ||
                other.cityCode == cityCode) &&
            const DeepCollectionEquality()
                .equals(other.accountLengthList, accountLengthList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        Desc,
        Code,
        type,
        baseUrl,
        address,
        email,
        phone,
        bicType,
        bicValue,
        CurrencyFlagPath,
        label,
        BankCode,
        BankName,
        BranchCode,
        BranchName,
        BranchAddress1,
        BranchAddress2,
        BranchAddress3,
        const DeepCollectionEquality().hash(branchBicDetails),
        provider,
        mappingCode,
        imageContent,
        providerStatus,
        providerServiceCategory,
        categoryCode,
        categoryName,
        countryCode,
        countryName,
        currencyCode,
        currencyName,
        stateName,
        stateCode,
        cityName,
        cityCode,
        const DeepCollectionEquality().hash(accountLengthList)
      ]);

  @override
  String toString() {
    return 'MasterResponseFZ(id: $id, Desc: $Desc, Code: $Code, type: $type, baseUrl: $baseUrl, address: $address, email: $email, phone: $phone, bicType: $bicType, bicValue: $bicValue, CurrencyFlagPath: $CurrencyFlagPath, label: $label, BankCode: $BankCode, BankName: $BankName, BranchCode: $BranchCode, BranchName: $BranchName, BranchAddress1: $BranchAddress1, BranchAddress2: $BranchAddress2, BranchAddress3: $BranchAddress3, branchBicDetails: $branchBicDetails, provider: $provider, mappingCode: $mappingCode, imageContent: $imageContent, providerStatus: $providerStatus, providerServiceCategory: $providerServiceCategory, categoryCode: $categoryCode, categoryName: $categoryName, countryCode: $countryCode, countryName: $countryName, currencyCode: $currencyCode, currencyName: $currencyName, stateName: $stateName, stateCode: $stateCode, cityName: $cityName, cityCode: $cityCode, accountLengthList: $accountLengthList)';
  }
}

/// @nodoc
abstract mixin class $MasterResponseFZCopyWith<$Res> {
  factory $MasterResponseFZCopyWith(
          MasterResponseFZ value, $Res Function(MasterResponseFZ) _then) =
      _$MasterResponseFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'Desc', readValue: _readName) String Desc,
      @JsonKey(name: 'Code', readValue: _readCode) String Code,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'baseUrl') String baseUrl,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'bicType') String bicType,
      @JsonKey(name: 'bicValue') String bicValue,
      @JsonKey(name: 'CurrencyFlagPath') String CurrencyFlagPath,
      @JsonKey(name: 'label') String label,
      @JsonKey(name: 'BankCode') String BankCode,
      @JsonKey(name: 'BankName') String BankName,
      @JsonKey(name: 'BranchCode') String BranchCode,
      @JsonKey(name: 'BranchName') String BranchName,
      @JsonKey(name: 'BranchAddress1') String BranchAddress1,
      @JsonKey(name: 'BranchAddress2') String BranchAddress2,
      @JsonKey(name: 'BranchAddress3') String BranchAddress3,
      @JsonKey(name: 'BranchBicDetails')
      List<BranchBicDetails> branchBicDetails,
      @JsonKey(name: 'Provider') String provider,
      @JsonKey(name: 'MappingCode') String mappingCode,
      @JsonKey(name: 'ImageContent') String imageContent,
      @JsonKey(name: 'Status') String providerStatus,
      @JsonKey(name: 'ServiceCategory') String providerServiceCategory,
      @JsonKey(name: 'CategoryCode') String categoryCode,
      @JsonKey(name: 'CategoryName') String categoryName,
      @JsonKey(name: 'CountryCode') String countryCode,
      @JsonKey(name: 'CountryName') String countryName,
      @JsonKey(name: 'CurrencyCode') String currencyCode,
      @JsonKey(name: 'CurrencyName') String currencyName,
      @JsonKey(name: 'StateName') String stateName,
      @JsonKey(name: 'StateCode') String stateCode,
      @JsonKey(name: 'CityName') String cityName,
      @JsonKey(name: 'CityCode') String cityCode,
      @JsonKey(name: 'AccountLengthList')
      List<BankAccountLength>? accountLengthList});
}

/// @nodoc
class _$MasterResponseFZCopyWithImpl<$Res>
    implements $MasterResponseFZCopyWith<$Res> {
  _$MasterResponseFZCopyWithImpl(this._self, this._then);

  final MasterResponseFZ _self;
  final $Res Function(MasterResponseFZ) _then;

  /// Create a copy of MasterResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? Desc = null,
    Object? Code = null,
    Object? type = null,
    Object? baseUrl = null,
    Object? address = null,
    Object? email = null,
    Object? phone = null,
    Object? bicType = null,
    Object? bicValue = null,
    Object? CurrencyFlagPath = null,
    Object? label = null,
    Object? BankCode = null,
    Object? BankName = null,
    Object? BranchCode = null,
    Object? BranchName = null,
    Object? BranchAddress1 = null,
    Object? BranchAddress2 = null,
    Object? BranchAddress3 = null,
    Object? branchBicDetails = null,
    Object? provider = null,
    Object? mappingCode = null,
    Object? imageContent = null,
    Object? providerStatus = null,
    Object? providerServiceCategory = null,
    Object? categoryCode = null,
    Object? categoryName = null,
    Object? countryCode = null,
    Object? countryName = null,
    Object? currencyCode = null,
    Object? currencyName = null,
    Object? stateName = null,
    Object? stateCode = null,
    Object? cityName = null,
    Object? cityCode = null,
    Object? accountLengthList = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      Desc: null == Desc
          ? _self.Desc
          : Desc // ignore: cast_nullable_to_non_nullable
              as String,
      Code: null == Code
          ? _self.Code
          : Code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrl: null == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      bicType: null == bicType
          ? _self.bicType
          : bicType // ignore: cast_nullable_to_non_nullable
              as String,
      bicValue: null == bicValue
          ? _self.bicValue
          : bicValue // ignore: cast_nullable_to_non_nullable
              as String,
      CurrencyFlagPath: null == CurrencyFlagPath
          ? _self.CurrencyFlagPath
          : CurrencyFlagPath // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      BankCode: null == BankCode
          ? _self.BankCode
          : BankCode // ignore: cast_nullable_to_non_nullable
              as String,
      BankName: null == BankName
          ? _self.BankName
          : BankName // ignore: cast_nullable_to_non_nullable
              as String,
      BranchCode: null == BranchCode
          ? _self.BranchCode
          : BranchCode // ignore: cast_nullable_to_non_nullable
              as String,
      BranchName: null == BranchName
          ? _self.BranchName
          : BranchName // ignore: cast_nullable_to_non_nullable
              as String,
      BranchAddress1: null == BranchAddress1
          ? _self.BranchAddress1
          : BranchAddress1 // ignore: cast_nullable_to_non_nullable
              as String,
      BranchAddress2: null == BranchAddress2
          ? _self.BranchAddress2
          : BranchAddress2 // ignore: cast_nullable_to_non_nullable
              as String,
      BranchAddress3: null == BranchAddress3
          ? _self.BranchAddress3
          : BranchAddress3 // ignore: cast_nullable_to_non_nullable
              as String,
      branchBicDetails: null == branchBicDetails
          ? _self.branchBicDetails
          : branchBicDetails // ignore: cast_nullable_to_non_nullable
              as List<BranchBicDetails>,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      mappingCode: null == mappingCode
          ? _self.mappingCode
          : mappingCode // ignore: cast_nullable_to_non_nullable
              as String,
      imageContent: null == imageContent
          ? _self.imageContent
          : imageContent // ignore: cast_nullable_to_non_nullable
              as String,
      providerStatus: null == providerStatus
          ? _self.providerStatus
          : providerStatus // ignore: cast_nullable_to_non_nullable
              as String,
      providerServiceCategory: null == providerServiceCategory
          ? _self.providerServiceCategory
          : providerServiceCategory // ignore: cast_nullable_to_non_nullable
              as String,
      categoryCode: null == categoryCode
          ? _self.categoryCode
          : categoryCode // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _self.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _self.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      stateName: null == stateName
          ? _self.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: null == cityName
          ? _self.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      cityCode: null == cityCode
          ? _self.cityCode
          : cityCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountLengthList: freezed == accountLengthList
          ? _self.accountLengthList
          : accountLengthList // ignore: cast_nullable_to_non_nullable
              as List<BankAccountLength>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MasterResponseFZ].
extension MasterResponseFZPatterns on MasterResponseFZ {
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
    TResult Function(_MasterResponseFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MasterResponseFZ() when $default != null:
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
    TResult Function(_MasterResponseFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MasterResponseFZ():
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
    TResult? Function(_MasterResponseFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MasterResponseFZ() when $default != null:
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'Desc', readValue: _readName) String Desc,
            @JsonKey(name: 'Code', readValue: _readCode) String Code,
            @JsonKey(name: 'type') String type,
            @JsonKey(name: 'baseUrl') String baseUrl,
            @JsonKey(name: 'address') String address,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'phone') String phone,
            @JsonKey(name: 'bicType') String bicType,
            @JsonKey(name: 'bicValue') String bicValue,
            @JsonKey(name: 'CurrencyFlagPath') String CurrencyFlagPath,
            @JsonKey(name: 'label') String label,
            @JsonKey(name: 'BankCode') String BankCode,
            @JsonKey(name: 'BankName') String BankName,
            @JsonKey(name: 'BranchCode') String BranchCode,
            @JsonKey(name: 'BranchName') String BranchName,
            @JsonKey(name: 'BranchAddress1') String BranchAddress1,
            @JsonKey(name: 'BranchAddress2') String BranchAddress2,
            @JsonKey(name: 'BranchAddress3') String BranchAddress3,
            @JsonKey(name: 'BranchBicDetails')
            List<BranchBicDetails> branchBicDetails,
            @JsonKey(name: 'Provider') String provider,
            @JsonKey(name: 'MappingCode') String mappingCode,
            @JsonKey(name: 'ImageContent') String imageContent,
            @JsonKey(name: 'Status') String providerStatus,
            @JsonKey(name: 'ServiceCategory') String providerServiceCategory,
            @JsonKey(name: 'CategoryCode') String categoryCode,
            @JsonKey(name: 'CategoryName') String categoryName,
            @JsonKey(name: 'CountryCode') String countryCode,
            @JsonKey(name: 'CountryName') String countryName,
            @JsonKey(name: 'CurrencyCode') String currencyCode,
            @JsonKey(name: 'CurrencyName') String currencyName,
            @JsonKey(name: 'StateName') String stateName,
            @JsonKey(name: 'StateCode') String stateCode,
            @JsonKey(name: 'CityName') String cityName,
            @JsonKey(name: 'CityCode') String cityCode,
            @JsonKey(name: 'AccountLengthList')
            List<BankAccountLength>? accountLengthList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MasterResponseFZ() when $default != null:
        return $default(
            _that.id,
            _that.Desc,
            _that.Code,
            _that.type,
            _that.baseUrl,
            _that.address,
            _that.email,
            _that.phone,
            _that.bicType,
            _that.bicValue,
            _that.CurrencyFlagPath,
            _that.label,
            _that.BankCode,
            _that.BankName,
            _that.BranchCode,
            _that.BranchName,
            _that.BranchAddress1,
            _that.BranchAddress2,
            _that.BranchAddress3,
            _that.branchBicDetails,
            _that.provider,
            _that.mappingCode,
            _that.imageContent,
            _that.providerStatus,
            _that.providerServiceCategory,
            _that.categoryCode,
            _that.categoryName,
            _that.countryCode,
            _that.countryName,
            _that.currencyCode,
            _that.currencyName,
            _that.stateName,
            _that.stateCode,
            _that.cityName,
            _that.cityCode,
            _that.accountLengthList);
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'Desc', readValue: _readName) String Desc,
            @JsonKey(name: 'Code', readValue: _readCode) String Code,
            @JsonKey(name: 'type') String type,
            @JsonKey(name: 'baseUrl') String baseUrl,
            @JsonKey(name: 'address') String address,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'phone') String phone,
            @JsonKey(name: 'bicType') String bicType,
            @JsonKey(name: 'bicValue') String bicValue,
            @JsonKey(name: 'CurrencyFlagPath') String CurrencyFlagPath,
            @JsonKey(name: 'label') String label,
            @JsonKey(name: 'BankCode') String BankCode,
            @JsonKey(name: 'BankName') String BankName,
            @JsonKey(name: 'BranchCode') String BranchCode,
            @JsonKey(name: 'BranchName') String BranchName,
            @JsonKey(name: 'BranchAddress1') String BranchAddress1,
            @JsonKey(name: 'BranchAddress2') String BranchAddress2,
            @JsonKey(name: 'BranchAddress3') String BranchAddress3,
            @JsonKey(name: 'BranchBicDetails')
            List<BranchBicDetails> branchBicDetails,
            @JsonKey(name: 'Provider') String provider,
            @JsonKey(name: 'MappingCode') String mappingCode,
            @JsonKey(name: 'ImageContent') String imageContent,
            @JsonKey(name: 'Status') String providerStatus,
            @JsonKey(name: 'ServiceCategory') String providerServiceCategory,
            @JsonKey(name: 'CategoryCode') String categoryCode,
            @JsonKey(name: 'CategoryName') String categoryName,
            @JsonKey(name: 'CountryCode') String countryCode,
            @JsonKey(name: 'CountryName') String countryName,
            @JsonKey(name: 'CurrencyCode') String currencyCode,
            @JsonKey(name: 'CurrencyName') String currencyName,
            @JsonKey(name: 'StateName') String stateName,
            @JsonKey(name: 'StateCode') String stateCode,
            @JsonKey(name: 'CityName') String cityName,
            @JsonKey(name: 'CityCode') String cityCode,
            @JsonKey(name: 'AccountLengthList')
            List<BankAccountLength>? accountLengthList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MasterResponseFZ():
        return $default(
            _that.id,
            _that.Desc,
            _that.Code,
            _that.type,
            _that.baseUrl,
            _that.address,
            _that.email,
            _that.phone,
            _that.bicType,
            _that.bicValue,
            _that.CurrencyFlagPath,
            _that.label,
            _that.BankCode,
            _that.BankName,
            _that.BranchCode,
            _that.BranchName,
            _that.BranchAddress1,
            _that.BranchAddress2,
            _that.BranchAddress3,
            _that.branchBicDetails,
            _that.provider,
            _that.mappingCode,
            _that.imageContent,
            _that.providerStatus,
            _that.providerServiceCategory,
            _that.categoryCode,
            _that.categoryName,
            _that.countryCode,
            _that.countryName,
            _that.currencyCode,
            _that.currencyName,
            _that.stateName,
            _that.stateCode,
            _that.cityName,
            _that.cityCode,
            _that.accountLengthList);
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
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'Desc', readValue: _readName) String Desc,
            @JsonKey(name: 'Code', readValue: _readCode) String Code,
            @JsonKey(name: 'type') String type,
            @JsonKey(name: 'baseUrl') String baseUrl,
            @JsonKey(name: 'address') String address,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'phone') String phone,
            @JsonKey(name: 'bicType') String bicType,
            @JsonKey(name: 'bicValue') String bicValue,
            @JsonKey(name: 'CurrencyFlagPath') String CurrencyFlagPath,
            @JsonKey(name: 'label') String label,
            @JsonKey(name: 'BankCode') String BankCode,
            @JsonKey(name: 'BankName') String BankName,
            @JsonKey(name: 'BranchCode') String BranchCode,
            @JsonKey(name: 'BranchName') String BranchName,
            @JsonKey(name: 'BranchAddress1') String BranchAddress1,
            @JsonKey(name: 'BranchAddress2') String BranchAddress2,
            @JsonKey(name: 'BranchAddress3') String BranchAddress3,
            @JsonKey(name: 'BranchBicDetails')
            List<BranchBicDetails> branchBicDetails,
            @JsonKey(name: 'Provider') String provider,
            @JsonKey(name: 'MappingCode') String mappingCode,
            @JsonKey(name: 'ImageContent') String imageContent,
            @JsonKey(name: 'Status') String providerStatus,
            @JsonKey(name: 'ServiceCategory') String providerServiceCategory,
            @JsonKey(name: 'CategoryCode') String categoryCode,
            @JsonKey(name: 'CategoryName') String categoryName,
            @JsonKey(name: 'CountryCode') String countryCode,
            @JsonKey(name: 'CountryName') String countryName,
            @JsonKey(name: 'CurrencyCode') String currencyCode,
            @JsonKey(name: 'CurrencyName') String currencyName,
            @JsonKey(name: 'StateName') String stateName,
            @JsonKey(name: 'StateCode') String stateCode,
            @JsonKey(name: 'CityName') String cityName,
            @JsonKey(name: 'CityCode') String cityCode,
            @JsonKey(name: 'AccountLengthList')
            List<BankAccountLength>? accountLengthList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MasterResponseFZ() when $default != null:
        return $default(
            _that.id,
            _that.Desc,
            _that.Code,
            _that.type,
            _that.baseUrl,
            _that.address,
            _that.email,
            _that.phone,
            _that.bicType,
            _that.bicValue,
            _that.CurrencyFlagPath,
            _that.label,
            _that.BankCode,
            _that.BankName,
            _that.BranchCode,
            _that.BranchName,
            _that.BranchAddress1,
            _that.BranchAddress2,
            _that.BranchAddress3,
            _that.branchBicDetails,
            _that.provider,
            _that.mappingCode,
            _that.imageContent,
            _that.providerStatus,
            _that.providerServiceCategory,
            _that.categoryCode,
            _that.categoryName,
            _that.countryCode,
            _that.countryName,
            _that.currencyCode,
            _that.currencyName,
            _that.stateName,
            _that.stateCode,
            _that.cityName,
            _that.cityCode,
            _that.accountLengthList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MasterResponseFZ implements MasterResponseFZ {
  const _MasterResponseFZ(
      {@JsonKey(name: 'id') this.id = '',
      @JsonKey(name: 'Desc', readValue: _readName) this.Desc = '',
      @JsonKey(name: 'Code', readValue: _readCode) this.Code = '',
      @JsonKey(name: 'type') this.type = '',
      @JsonKey(name: 'baseUrl') this.baseUrl = '',
      @JsonKey(name: 'address') this.address = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'phone') this.phone = '',
      @JsonKey(name: 'bicType') this.bicType = '',
      @JsonKey(name: 'bicValue') this.bicValue = '',
      @JsonKey(name: 'CurrencyFlagPath') this.CurrencyFlagPath = '',
      @JsonKey(name: 'label') this.label = '',
      @JsonKey(name: 'BankCode') this.BankCode = '',
      @JsonKey(name: 'BankName') this.BankName = '',
      @JsonKey(name: 'BranchCode') this.BranchCode = '',
      @JsonKey(name: 'BranchName') this.BranchName = '',
      @JsonKey(name: 'BranchAddress1') this.BranchAddress1 = '',
      @JsonKey(name: 'BranchAddress2') this.BranchAddress2 = '',
      @JsonKey(name: 'BranchAddress3') this.BranchAddress3 = '',
      @JsonKey(name: 'BranchBicDetails')
      final List<BranchBicDetails> branchBicDetails = const [],
      @JsonKey(name: 'Provider') this.provider = '',
      @JsonKey(name: 'MappingCode') this.mappingCode = '',
      @JsonKey(name: 'ImageContent') this.imageContent = '',
      @JsonKey(name: 'Status') this.providerStatus = '',
      @JsonKey(name: 'ServiceCategory') this.providerServiceCategory = '',
      @JsonKey(name: 'CategoryCode') this.categoryCode = '',
      @JsonKey(name: 'CategoryName') this.categoryName = '',
      @JsonKey(name: 'CountryCode') this.countryCode = '',
      @JsonKey(name: 'CountryName') this.countryName = '',
      @JsonKey(name: 'CurrencyCode') this.currencyCode = '',
      @JsonKey(name: 'CurrencyName') this.currencyName = '',
      @JsonKey(name: 'StateName') this.stateName = '',
      @JsonKey(name: 'StateCode') this.stateCode = '',
      @JsonKey(name: 'CityName') this.cityName = '',
      @JsonKey(name: 'CityCode') this.cityCode = '',
      @JsonKey(name: 'AccountLengthList')
      final List<BankAccountLength>? accountLengthList})
      : _branchBicDetails = branchBicDetails,
        _accountLengthList = accountLengthList;
  factory _MasterResponseFZ.fromJson(Map<String, dynamic> json) =>
      _$MasterResponseFZFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'Desc', readValue: _readName)
  final String Desc;
  @override
  @JsonKey(name: 'Code', readValue: _readCode)
  final String Code;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'baseUrl')
  final String baseUrl;
  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey(name: 'bicType')
  final String bicType;
  @override
  @JsonKey(name: 'bicValue')
  final String bicValue;
  @override
  @JsonKey(name: 'CurrencyFlagPath')
  final String CurrencyFlagPath;
  @override
  @JsonKey(name: 'label')
  final String label;
  @override
  @JsonKey(name: 'BankCode')
  final String BankCode;
  @override
  @JsonKey(name: 'BankName')
  final String BankName;
  @override
  @JsonKey(name: 'BranchCode')
  final String BranchCode;
  @override
  @JsonKey(name: 'BranchName')
  final String BranchName;
  @override
  @JsonKey(name: 'BranchAddress1')
  final String BranchAddress1;
  @override
  @JsonKey(name: 'BranchAddress2')
  final String BranchAddress2;
  @override
  @JsonKey(name: 'BranchAddress3')
  final String BranchAddress3;
  final List<BranchBicDetails> _branchBicDetails;
  @override
  @JsonKey(name: 'BranchBicDetails')
  List<BranchBicDetails> get branchBicDetails {
    if (_branchBicDetails is EqualUnmodifiableListView)
      return _branchBicDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_branchBicDetails);
  }

  @override
  @JsonKey(name: 'Provider')
  final String provider;
  @override
  @JsonKey(name: 'MappingCode')
  final String mappingCode;
  @override
  @JsonKey(name: 'ImageContent')
  final String imageContent;
  @override
  @JsonKey(name: 'Status')
  final String providerStatus;
  @override
  @JsonKey(name: 'ServiceCategory')
  final String providerServiceCategory;
  @override
  @JsonKey(name: 'CategoryCode')
  final String categoryCode;
  @override
  @JsonKey(name: 'CategoryName')
  final String categoryName;
  @override
  @JsonKey(name: 'CountryCode')
  final String countryCode;
  @override
  @JsonKey(name: 'CountryName')
  final String countryName;
  @override
  @JsonKey(name: 'CurrencyCode')
  final String currencyCode;
  @override
  @JsonKey(name: 'CurrencyName')
  final String currencyName;
  @override
  @JsonKey(name: 'StateName')
  final String stateName;
  @override
  @JsonKey(name: 'StateCode')
  final String stateCode;
  @override
  @JsonKey(name: 'CityName')
  final String cityName;
  @override
  @JsonKey(name: 'CityCode')
  final String cityCode;
  final List<BankAccountLength>? _accountLengthList;
  @override
  @JsonKey(name: 'AccountLengthList')
  List<BankAccountLength>? get accountLengthList {
    final value = _accountLengthList;
    if (value == null) return null;
    if (_accountLengthList is EqualUnmodifiableListView)
      return _accountLengthList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of MasterResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MasterResponseFZCopyWith<_MasterResponseFZ> get copyWith =>
      __$MasterResponseFZCopyWithImpl<_MasterResponseFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MasterResponseFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MasterResponseFZ &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.Desc, Desc) || other.Desc == Desc) &&
            (identical(other.Code, Code) || other.Code == Code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.bicType, bicType) || other.bicType == bicType) &&
            (identical(other.bicValue, bicValue) ||
                other.bicValue == bicValue) &&
            (identical(other.CurrencyFlagPath, CurrencyFlagPath) ||
                other.CurrencyFlagPath == CurrencyFlagPath) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.BankCode, BankCode) ||
                other.BankCode == BankCode) &&
            (identical(other.BankName, BankName) ||
                other.BankName == BankName) &&
            (identical(other.BranchCode, BranchCode) ||
                other.BranchCode == BranchCode) &&
            (identical(other.BranchName, BranchName) ||
                other.BranchName == BranchName) &&
            (identical(other.BranchAddress1, BranchAddress1) ||
                other.BranchAddress1 == BranchAddress1) &&
            (identical(other.BranchAddress2, BranchAddress2) ||
                other.BranchAddress2 == BranchAddress2) &&
            (identical(other.BranchAddress3, BranchAddress3) ||
                other.BranchAddress3 == BranchAddress3) &&
            const DeepCollectionEquality()
                .equals(other._branchBicDetails, _branchBicDetails) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.mappingCode, mappingCode) ||
                other.mappingCode == mappingCode) &&
            (identical(other.imageContent, imageContent) ||
                other.imageContent == imageContent) &&
            (identical(other.providerStatus, providerStatus) ||
                other.providerStatus == providerStatus) &&
            (identical(
                    other.providerServiceCategory, providerServiceCategory) ||
                other.providerServiceCategory == providerServiceCategory) &&
            (identical(other.categoryCode, categoryCode) ||
                other.categoryCode == categoryCode) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currencyName, currencyName) ||
                other.currencyName == currencyName) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.cityCode, cityCode) ||
                other.cityCode == cityCode) &&
            const DeepCollectionEquality()
                .equals(other._accountLengthList, _accountLengthList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        Desc,
        Code,
        type,
        baseUrl,
        address,
        email,
        phone,
        bicType,
        bicValue,
        CurrencyFlagPath,
        label,
        BankCode,
        BankName,
        BranchCode,
        BranchName,
        BranchAddress1,
        BranchAddress2,
        BranchAddress3,
        const DeepCollectionEquality().hash(_branchBicDetails),
        provider,
        mappingCode,
        imageContent,
        providerStatus,
        providerServiceCategory,
        categoryCode,
        categoryName,
        countryCode,
        countryName,
        currencyCode,
        currencyName,
        stateName,
        stateCode,
        cityName,
        cityCode,
        const DeepCollectionEquality().hash(_accountLengthList)
      ]);

  @override
  String toString() {
    return 'MasterResponseFZ(id: $id, Desc: $Desc, Code: $Code, type: $type, baseUrl: $baseUrl, address: $address, email: $email, phone: $phone, bicType: $bicType, bicValue: $bicValue, CurrencyFlagPath: $CurrencyFlagPath, label: $label, BankCode: $BankCode, BankName: $BankName, BranchCode: $BranchCode, BranchName: $BranchName, BranchAddress1: $BranchAddress1, BranchAddress2: $BranchAddress2, BranchAddress3: $BranchAddress3, branchBicDetails: $branchBicDetails, provider: $provider, mappingCode: $mappingCode, imageContent: $imageContent, providerStatus: $providerStatus, providerServiceCategory: $providerServiceCategory, categoryCode: $categoryCode, categoryName: $categoryName, countryCode: $countryCode, countryName: $countryName, currencyCode: $currencyCode, currencyName: $currencyName, stateName: $stateName, stateCode: $stateCode, cityName: $cityName, cityCode: $cityCode, accountLengthList: $accountLengthList)';
  }
}

/// @nodoc
abstract mixin class _$MasterResponseFZCopyWith<$Res>
    implements $MasterResponseFZCopyWith<$Res> {
  factory _$MasterResponseFZCopyWith(
          _MasterResponseFZ value, $Res Function(_MasterResponseFZ) _then) =
      __$MasterResponseFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'Desc', readValue: _readName) String Desc,
      @JsonKey(name: 'Code', readValue: _readCode) String Code,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'baseUrl') String baseUrl,
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'phone') String phone,
      @JsonKey(name: 'bicType') String bicType,
      @JsonKey(name: 'bicValue') String bicValue,
      @JsonKey(name: 'CurrencyFlagPath') String CurrencyFlagPath,
      @JsonKey(name: 'label') String label,
      @JsonKey(name: 'BankCode') String BankCode,
      @JsonKey(name: 'BankName') String BankName,
      @JsonKey(name: 'BranchCode') String BranchCode,
      @JsonKey(name: 'BranchName') String BranchName,
      @JsonKey(name: 'BranchAddress1') String BranchAddress1,
      @JsonKey(name: 'BranchAddress2') String BranchAddress2,
      @JsonKey(name: 'BranchAddress3') String BranchAddress3,
      @JsonKey(name: 'BranchBicDetails')
      List<BranchBicDetails> branchBicDetails,
      @JsonKey(name: 'Provider') String provider,
      @JsonKey(name: 'MappingCode') String mappingCode,
      @JsonKey(name: 'ImageContent') String imageContent,
      @JsonKey(name: 'Status') String providerStatus,
      @JsonKey(name: 'ServiceCategory') String providerServiceCategory,
      @JsonKey(name: 'CategoryCode') String categoryCode,
      @JsonKey(name: 'CategoryName') String categoryName,
      @JsonKey(name: 'CountryCode') String countryCode,
      @JsonKey(name: 'CountryName') String countryName,
      @JsonKey(name: 'CurrencyCode') String currencyCode,
      @JsonKey(name: 'CurrencyName') String currencyName,
      @JsonKey(name: 'StateName') String stateName,
      @JsonKey(name: 'StateCode') String stateCode,
      @JsonKey(name: 'CityName') String cityName,
      @JsonKey(name: 'CityCode') String cityCode,
      @JsonKey(name: 'AccountLengthList')
      List<BankAccountLength>? accountLengthList});
}

/// @nodoc
class __$MasterResponseFZCopyWithImpl<$Res>
    implements _$MasterResponseFZCopyWith<$Res> {
  __$MasterResponseFZCopyWithImpl(this._self, this._then);

  final _MasterResponseFZ _self;
  final $Res Function(_MasterResponseFZ) _then;

  /// Create a copy of MasterResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? Desc = null,
    Object? Code = null,
    Object? type = null,
    Object? baseUrl = null,
    Object? address = null,
    Object? email = null,
    Object? phone = null,
    Object? bicType = null,
    Object? bicValue = null,
    Object? CurrencyFlagPath = null,
    Object? label = null,
    Object? BankCode = null,
    Object? BankName = null,
    Object? BranchCode = null,
    Object? BranchName = null,
    Object? BranchAddress1 = null,
    Object? BranchAddress2 = null,
    Object? BranchAddress3 = null,
    Object? branchBicDetails = null,
    Object? provider = null,
    Object? mappingCode = null,
    Object? imageContent = null,
    Object? providerStatus = null,
    Object? providerServiceCategory = null,
    Object? categoryCode = null,
    Object? categoryName = null,
    Object? countryCode = null,
    Object? countryName = null,
    Object? currencyCode = null,
    Object? currencyName = null,
    Object? stateName = null,
    Object? stateCode = null,
    Object? cityName = null,
    Object? cityCode = null,
    Object? accountLengthList = freezed,
  }) {
    return _then(_MasterResponseFZ(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      Desc: null == Desc
          ? _self.Desc
          : Desc // ignore: cast_nullable_to_non_nullable
              as String,
      Code: null == Code
          ? _self.Code
          : Code // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrl: null == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      bicType: null == bicType
          ? _self.bicType
          : bicType // ignore: cast_nullable_to_non_nullable
              as String,
      bicValue: null == bicValue
          ? _self.bicValue
          : bicValue // ignore: cast_nullable_to_non_nullable
              as String,
      CurrencyFlagPath: null == CurrencyFlagPath
          ? _self.CurrencyFlagPath
          : CurrencyFlagPath // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      BankCode: null == BankCode
          ? _self.BankCode
          : BankCode // ignore: cast_nullable_to_non_nullable
              as String,
      BankName: null == BankName
          ? _self.BankName
          : BankName // ignore: cast_nullable_to_non_nullable
              as String,
      BranchCode: null == BranchCode
          ? _self.BranchCode
          : BranchCode // ignore: cast_nullable_to_non_nullable
              as String,
      BranchName: null == BranchName
          ? _self.BranchName
          : BranchName // ignore: cast_nullable_to_non_nullable
              as String,
      BranchAddress1: null == BranchAddress1
          ? _self.BranchAddress1
          : BranchAddress1 // ignore: cast_nullable_to_non_nullable
              as String,
      BranchAddress2: null == BranchAddress2
          ? _self.BranchAddress2
          : BranchAddress2 // ignore: cast_nullable_to_non_nullable
              as String,
      BranchAddress3: null == BranchAddress3
          ? _self.BranchAddress3
          : BranchAddress3 // ignore: cast_nullable_to_non_nullable
              as String,
      branchBicDetails: null == branchBicDetails
          ? _self._branchBicDetails
          : branchBicDetails // ignore: cast_nullable_to_non_nullable
              as List<BranchBicDetails>,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      mappingCode: null == mappingCode
          ? _self.mappingCode
          : mappingCode // ignore: cast_nullable_to_non_nullable
              as String,
      imageContent: null == imageContent
          ? _self.imageContent
          : imageContent // ignore: cast_nullable_to_non_nullable
              as String,
      providerStatus: null == providerStatus
          ? _self.providerStatus
          : providerStatus // ignore: cast_nullable_to_non_nullable
              as String,
      providerServiceCategory: null == providerServiceCategory
          ? _self.providerServiceCategory
          : providerServiceCategory // ignore: cast_nullable_to_non_nullable
              as String,
      categoryCode: null == categoryCode
          ? _self.categoryCode
          : categoryCode // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _self.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _self.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      stateName: null == stateName
          ? _self.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      cityName: null == cityName
          ? _self.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      cityCode: null == cityCode
          ? _self.cityCode
          : cityCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountLengthList: freezed == accountLengthList
          ? _self._accountLengthList
          : accountLengthList // ignore: cast_nullable_to_non_nullable
              as List<BankAccountLength>?,
    ));
  }
}

/// @nodoc
mixin _$BranchBicDetails {
  @JsonKey(name: 'BicTypeCode')
  String get BicTypeCode;
  @JsonKey(name: 'BicTypeDescription')
  String get BicTypeDescription;
  @JsonKey(name: 'BicTypeValue')
  String get BicTypeValue;

  /// Create a copy of BranchBicDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BranchBicDetailsCopyWith<BranchBicDetails> get copyWith =>
      _$BranchBicDetailsCopyWithImpl<BranchBicDetails>(
          this as BranchBicDetails, _$identity);

  /// Serializes this BranchBicDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BranchBicDetails &&
            (identical(other.BicTypeCode, BicTypeCode) ||
                other.BicTypeCode == BicTypeCode) &&
            (identical(other.BicTypeDescription, BicTypeDescription) ||
                other.BicTypeDescription == BicTypeDescription) &&
            (identical(other.BicTypeValue, BicTypeValue) ||
                other.BicTypeValue == BicTypeValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, BicTypeCode, BicTypeDescription, BicTypeValue);

  @override
  String toString() {
    return 'BranchBicDetails(BicTypeCode: $BicTypeCode, BicTypeDescription: $BicTypeDescription, BicTypeValue: $BicTypeValue)';
  }
}

/// @nodoc
abstract mixin class $BranchBicDetailsCopyWith<$Res> {
  factory $BranchBicDetailsCopyWith(
          BranchBicDetails value, $Res Function(BranchBicDetails) _then) =
      _$BranchBicDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'BicTypeCode') String BicTypeCode,
      @JsonKey(name: 'BicTypeDescription') String BicTypeDescription,
      @JsonKey(name: 'BicTypeValue') String BicTypeValue});
}

/// @nodoc
class _$BranchBicDetailsCopyWithImpl<$Res>
    implements $BranchBicDetailsCopyWith<$Res> {
  _$BranchBicDetailsCopyWithImpl(this._self, this._then);

  final BranchBicDetails _self;
  final $Res Function(BranchBicDetails) _then;

  /// Create a copy of BranchBicDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? BicTypeCode = null,
    Object? BicTypeDescription = null,
    Object? BicTypeValue = null,
  }) {
    return _then(_self.copyWith(
      BicTypeCode: null == BicTypeCode
          ? _self.BicTypeCode
          : BicTypeCode // ignore: cast_nullable_to_non_nullable
              as String,
      BicTypeDescription: null == BicTypeDescription
          ? _self.BicTypeDescription
          : BicTypeDescription // ignore: cast_nullable_to_non_nullable
              as String,
      BicTypeValue: null == BicTypeValue
          ? _self.BicTypeValue
          : BicTypeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BranchBicDetails].
extension BranchBicDetailsPatterns on BranchBicDetails {
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
    TResult Function(_BranchBicDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BranchBicDetails() when $default != null:
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
    TResult Function(_BranchBicDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchBicDetails():
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
    TResult? Function(_BranchBicDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchBicDetails() when $default != null:
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
            @JsonKey(name: 'BicTypeCode') String BicTypeCode,
            @JsonKey(name: 'BicTypeDescription') String BicTypeDescription,
            @JsonKey(name: 'BicTypeValue') String BicTypeValue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BranchBicDetails() when $default != null:
        return $default(
            _that.BicTypeCode, _that.BicTypeDescription, _that.BicTypeValue);
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
            @JsonKey(name: 'BicTypeCode') String BicTypeCode,
            @JsonKey(name: 'BicTypeDescription') String BicTypeDescription,
            @JsonKey(name: 'BicTypeValue') String BicTypeValue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchBicDetails():
        return $default(
            _that.BicTypeCode, _that.BicTypeDescription, _that.BicTypeValue);
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
            @JsonKey(name: 'BicTypeCode') String BicTypeCode,
            @JsonKey(name: 'BicTypeDescription') String BicTypeDescription,
            @JsonKey(name: 'BicTypeValue') String BicTypeValue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchBicDetails() when $default != null:
        return $default(
            _that.BicTypeCode, _that.BicTypeDescription, _that.BicTypeValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BranchBicDetails implements BranchBicDetails {
  const _BranchBicDetails(
      {@JsonKey(name: 'BicTypeCode') this.BicTypeCode = '',
      @JsonKey(name: 'BicTypeDescription') this.BicTypeDescription = '',
      @JsonKey(name: 'BicTypeValue') this.BicTypeValue = ''});
  factory _BranchBicDetails.fromJson(Map<String, dynamic> json) =>
      _$BranchBicDetailsFromJson(json);

  @override
  @JsonKey(name: 'BicTypeCode')
  final String BicTypeCode;
  @override
  @JsonKey(name: 'BicTypeDescription')
  final String BicTypeDescription;
  @override
  @JsonKey(name: 'BicTypeValue')
  final String BicTypeValue;

  /// Create a copy of BranchBicDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BranchBicDetailsCopyWith<_BranchBicDetails> get copyWith =>
      __$BranchBicDetailsCopyWithImpl<_BranchBicDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BranchBicDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BranchBicDetails &&
            (identical(other.BicTypeCode, BicTypeCode) ||
                other.BicTypeCode == BicTypeCode) &&
            (identical(other.BicTypeDescription, BicTypeDescription) ||
                other.BicTypeDescription == BicTypeDescription) &&
            (identical(other.BicTypeValue, BicTypeValue) ||
                other.BicTypeValue == BicTypeValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, BicTypeCode, BicTypeDescription, BicTypeValue);

  @override
  String toString() {
    return 'BranchBicDetails(BicTypeCode: $BicTypeCode, BicTypeDescription: $BicTypeDescription, BicTypeValue: $BicTypeValue)';
  }
}

/// @nodoc
abstract mixin class _$BranchBicDetailsCopyWith<$Res>
    implements $BranchBicDetailsCopyWith<$Res> {
  factory _$BranchBicDetailsCopyWith(
          _BranchBicDetails value, $Res Function(_BranchBicDetails) _then) =
      __$BranchBicDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'BicTypeCode') String BicTypeCode,
      @JsonKey(name: 'BicTypeDescription') String BicTypeDescription,
      @JsonKey(name: 'BicTypeValue') String BicTypeValue});
}

/// @nodoc
class __$BranchBicDetailsCopyWithImpl<$Res>
    implements _$BranchBicDetailsCopyWith<$Res> {
  __$BranchBicDetailsCopyWithImpl(this._self, this._then);

  final _BranchBicDetails _self;
  final $Res Function(_BranchBicDetails) _then;

  /// Create a copy of BranchBicDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? BicTypeCode = null,
    Object? BicTypeDescription = null,
    Object? BicTypeValue = null,
  }) {
    return _then(_BranchBicDetails(
      BicTypeCode: null == BicTypeCode
          ? _self.BicTypeCode
          : BicTypeCode // ignore: cast_nullable_to_non_nullable
              as String,
      BicTypeDescription: null == BicTypeDescription
          ? _self.BicTypeDescription
          : BicTypeDescription // ignore: cast_nullable_to_non_nullable
              as String,
      BicTypeValue: null == BicTypeValue
          ? _self.BicTypeValue
          : BicTypeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$BankAccountLength {
  @JsonKey(name: 'Length')
  String get length;
  @JsonKey(name: 'Prefix')
  String get prefix;

  /// Create a copy of BankAccountLength
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankAccountLengthCopyWith<BankAccountLength> get copyWith =>
      _$BankAccountLengthCopyWithImpl<BankAccountLength>(
          this as BankAccountLength, _$identity);

  /// Serializes this BankAccountLength to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BankAccountLength &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.prefix, prefix) || other.prefix == prefix));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, length, prefix);

  @override
  String toString() {
    return 'BankAccountLength(length: $length, prefix: $prefix)';
  }
}

/// @nodoc
abstract mixin class $BankAccountLengthCopyWith<$Res> {
  factory $BankAccountLengthCopyWith(
          BankAccountLength value, $Res Function(BankAccountLength) _then) =
      _$BankAccountLengthCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Length') String length,
      @JsonKey(name: 'Prefix') String prefix});
}

/// @nodoc
class _$BankAccountLengthCopyWithImpl<$Res>
    implements $BankAccountLengthCopyWith<$Res> {
  _$BankAccountLengthCopyWithImpl(this._self, this._then);

  final BankAccountLength _self;
  final $Res Function(BankAccountLength) _then;

  /// Create a copy of BankAccountLength
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? prefix = null,
  }) {
    return _then(_self.copyWith(
      length: null == length
          ? _self.length
          : length // ignore: cast_nullable_to_non_nullable
              as String,
      prefix: null == prefix
          ? _self.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [BankAccountLength].
extension BankAccountLengthPatterns on BankAccountLength {
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
    TResult Function(_BankAccountLength value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankAccountLength() when $default != null:
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
    TResult Function(_BankAccountLength value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankAccountLength():
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
    TResult? Function(_BankAccountLength value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankAccountLength() when $default != null:
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
    TResult Function(@JsonKey(name: 'Length') String length,
            @JsonKey(name: 'Prefix') String prefix)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankAccountLength() when $default != null:
        return $default(_that.length, _that.prefix);
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
    TResult Function(@JsonKey(name: 'Length') String length,
            @JsonKey(name: 'Prefix') String prefix)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankAccountLength():
        return $default(_that.length, _that.prefix);
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
    TResult? Function(@JsonKey(name: 'Length') String length,
            @JsonKey(name: 'Prefix') String prefix)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankAccountLength() when $default != null:
        return $default(_that.length, _that.prefix);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BankAccountLength implements BankAccountLength {
  const _BankAccountLength(
      {@JsonKey(name: 'Length') this.length = '',
      @JsonKey(name: 'Prefix') this.prefix = ''});
  factory _BankAccountLength.fromJson(Map<String, dynamic> json) =>
      _$BankAccountLengthFromJson(json);

  @override
  @JsonKey(name: 'Length')
  final String length;
  @override
  @JsonKey(name: 'Prefix')
  final String prefix;

  /// Create a copy of BankAccountLength
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankAccountLengthCopyWith<_BankAccountLength> get copyWith =>
      __$BankAccountLengthCopyWithImpl<_BankAccountLength>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BankAccountLengthToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankAccountLength &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.prefix, prefix) || other.prefix == prefix));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, length, prefix);

  @override
  String toString() {
    return 'BankAccountLength(length: $length, prefix: $prefix)';
  }
}

/// @nodoc
abstract mixin class _$BankAccountLengthCopyWith<$Res>
    implements $BankAccountLengthCopyWith<$Res> {
  factory _$BankAccountLengthCopyWith(
          _BankAccountLength value, $Res Function(_BankAccountLength) _then) =
      __$BankAccountLengthCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Length') String length,
      @JsonKey(name: 'Prefix') String prefix});
}

/// @nodoc
class __$BankAccountLengthCopyWithImpl<$Res>
    implements _$BankAccountLengthCopyWith<$Res> {
  __$BankAccountLengthCopyWithImpl(this._self, this._then);

  final _BankAccountLength _self;
  final $Res Function(_BankAccountLength) _then;

  /// Create a copy of BankAccountLength
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? length = null,
    Object? prefix = null,
  }) {
    return _then(_BankAccountLength(
      length: null == length
          ? _self.length
          : length // ignore: cast_nullable_to_non_nullable
              as String,
      prefix: null == prefix
          ? _self.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
