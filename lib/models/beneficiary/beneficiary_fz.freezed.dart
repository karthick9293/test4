// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beneficiary_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BeneficiaryFz {
  @JsonKey(name: "Active", readValue: _readStatus)
  String? get active;
  @JsonKey(name: "Archive")
  String? get archive;
  @JsonKey(name: "CustomerCode")
  String? get customerCode;
  @JsonKey(name: "BeneficiaryUID")
  int? get id;
  @JsonKey(name: "CoreBeneficiaryUID")
  String? get coreBeneficiaryUid;
  @JsonKey(name: "name", readValue: _readName)
  String? get name;
  @JsonKey(name: "FirstName")
  String? get firstName;
  @JsonKey(name: "MiddleName")
  String? get middleName;
  @JsonKey(name: "LastName")
  String? get lastName;
  @JsonKey(name: "NationalityCode")
  MasterResponseFZ? get nationality;
  @JsonKey(name: "GenderCode")
  MasterResponseFZ? get gender;
  @JsonKey(name: "DateOfBirth")
  String? get dateOfBirth;
  @JsonKey(name: "Phone")
  String? get phone;
  @JsonKey(name: "Email")
  String? get email;
  @JsonKey(name: "Address1")
  String? get address1;
  @JsonKey(name: "Address2")
  String? get address2;
  @JsonKey(name: "RelationshipCode")
  MasterResponseFZ? get relationship;
  @JsonKey(name: "ServiceCategoryCode")
  MasterResponseFZ? get serviceType;
  @JsonKey(name: "IdNo")
  String? get idNo;
  @JsonKey(name: "BeneficiaryMobile")
  String? get mobile;
  @JsonKey(name: "ServiceCountryCode")
  MasterResponseFZ? get serviceCountry;
  @JsonKey(name: "ServiceCurrencyCode")
  MasterResponseFZ? get serviceCurrency;
  @JsonKey(name: "CountryCode")
  MasterResponseFZ? get country;
  @JsonKey(name: "StateCode")
  MasterResponseFZ? get state;
  @JsonKey(name: "CityCode")
  MasterResponseFZ? get city;
  @JsonKey(name: "AccountNumber")
  String? get accountNumber;
  @JsonKey(name: "BeneficiaryBankCode")
  MasterResponseFZ? get bank;
  @JsonKey(name: "BeneficiaryBranchCode")
  MasterResponseFZ? get branch;
  @JsonKey(name: "BicCode")
  MasterResponseFZ? get bicType;
  @JsonKey(name: "BicValue")
  String? get bicValue;
  @JsonKey(name: "Favourites")
  String? get fav;
  @JsonKey(name: "SortOrder")
  int? get sortOrder;
  @JsonKey(name: "Status")
  String? get status;
  @JsonKey(name: "ServiceProviderCode")
  MasterResponseFZ? get serviceProvider;
  @JsonKey(name: "IdTypeCode")
  MasterResponseFZ? get idType;
  @JsonKey(name: "BeneficiaryTypeCode")
  String? get beneficiaryType;
  @JsonKey(name: "isCorrespondentActive")
  String? get isCorrespondentActive;
  @JsonKey(name: "CreatedOn", fromJson: _parseDateTime, toJson: _formatDateTime)
  DateTime? get createdOn;

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BeneficiaryFzCopyWith<BeneficiaryFz> get copyWith =>
      _$BeneficiaryFzCopyWithImpl<BeneficiaryFz>(
          this as BeneficiaryFz, _$identity);

  /// Serializes this BeneficiaryFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BeneficiaryFz &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.archive, archive) || other.archive == archive) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.coreBeneficiaryUid, coreBeneficiaryUid) ||
                other.coreBeneficiaryUid == coreBeneficiaryUid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.serviceCountry, serviceCountry) ||
                other.serviceCountry == serviceCountry) &&
            (identical(other.serviceCurrency, serviceCurrency) ||
                other.serviceCurrency == serviceCurrency) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.bicType, bicType) || other.bicType == bicType) &&
            (identical(other.bicValue, bicValue) ||
                other.bicValue == bicValue) &&
            (identical(other.fav, fav) || other.fav == fav) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serviceProvider, serviceProvider) ||
                other.serviceProvider == serviceProvider) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.beneficiaryType, beneficiaryType) ||
                other.beneficiaryType == beneficiaryType) &&
            (identical(other.isCorrespondentActive, isCorrespondentActive) ||
                other.isCorrespondentActive == isCorrespondentActive) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        active,
        archive,
        customerCode,
        id,
        coreBeneficiaryUid,
        name,
        firstName,
        middleName,
        lastName,
        nationality,
        gender,
        dateOfBirth,
        phone,
        email,
        address1,
        address2,
        relationship,
        serviceType,
        idNo,
        mobile,
        serviceCountry,
        serviceCurrency,
        country,
        state,
        city,
        accountNumber,
        bank,
        branch,
        bicType,
        bicValue,
        fav,
        sortOrder,
        status,
        serviceProvider,
        idType,
        beneficiaryType,
        isCorrespondentActive,
        createdOn
      ]);

  @override
  String toString() {
    return 'BeneficiaryFz(active: $active, archive: $archive, customerCode: $customerCode, id: $id, coreBeneficiaryUid: $coreBeneficiaryUid, name: $name, firstName: $firstName, middleName: $middleName, lastName: $lastName, nationality: $nationality, gender: $gender, dateOfBirth: $dateOfBirth, phone: $phone, email: $email, address1: $address1, address2: $address2, relationship: $relationship, serviceType: $serviceType, idNo: $idNo, mobile: $mobile, serviceCountry: $serviceCountry, serviceCurrency: $serviceCurrency, country: $country, state: $state, city: $city, accountNumber: $accountNumber, bank: $bank, branch: $branch, bicType: $bicType, bicValue: $bicValue, fav: $fav, sortOrder: $sortOrder, status: $status, serviceProvider: $serviceProvider, idType: $idType, beneficiaryType: $beneficiaryType, isCorrespondentActive: $isCorrespondentActive, createdOn: $createdOn)';
  }
}

/// @nodoc
abstract mixin class $BeneficiaryFzCopyWith<$Res> {
  factory $BeneficiaryFzCopyWith(
          BeneficiaryFz value, $Res Function(BeneficiaryFz) _then) =
      _$BeneficiaryFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Active", readValue: _readStatus) String? active,
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
      DateTime? createdOn});

  $MasterResponseFZCopyWith<$Res>? get nationality;
  $MasterResponseFZCopyWith<$Res>? get gender;
  $MasterResponseFZCopyWith<$Res>? get relationship;
  $MasterResponseFZCopyWith<$Res>? get serviceType;
  $MasterResponseFZCopyWith<$Res>? get serviceCountry;
  $MasterResponseFZCopyWith<$Res>? get serviceCurrency;
  $MasterResponseFZCopyWith<$Res>? get country;
  $MasterResponseFZCopyWith<$Res>? get state;
  $MasterResponseFZCopyWith<$Res>? get city;
  $MasterResponseFZCopyWith<$Res>? get bank;
  $MasterResponseFZCopyWith<$Res>? get branch;
  $MasterResponseFZCopyWith<$Res>? get bicType;
  $MasterResponseFZCopyWith<$Res>? get serviceProvider;
  $MasterResponseFZCopyWith<$Res>? get idType;
}

/// @nodoc
class _$BeneficiaryFzCopyWithImpl<$Res>
    implements $BeneficiaryFzCopyWith<$Res> {
  _$BeneficiaryFzCopyWithImpl(this._self, this._then);

  final BeneficiaryFz _self;
  final $Res Function(BeneficiaryFz) _then;

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = freezed,
    Object? archive = freezed,
    Object? customerCode = freezed,
    Object? id = freezed,
    Object? coreBeneficiaryUid = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? nationality = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? relationship = freezed,
    Object? serviceType = freezed,
    Object? idNo = freezed,
    Object? mobile = freezed,
    Object? serviceCountry = freezed,
    Object? serviceCurrency = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? accountNumber = freezed,
    Object? bank = freezed,
    Object? branch = freezed,
    Object? bicType = freezed,
    Object? bicValue = freezed,
    Object? fav = freezed,
    Object? sortOrder = freezed,
    Object? status = freezed,
    Object? serviceProvider = freezed,
    Object? idType = freezed,
    Object? beneficiaryType = freezed,
    Object? isCorrespondentActive = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_self.copyWith(
      active: freezed == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as String?,
      archive: freezed == archive
          ? _self.archive
          : archive // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      coreBeneficiaryUid: freezed == coreBeneficiaryUid
          ? _self.coreBeneficiaryUid
          : coreBeneficiaryUid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _self.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _self.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _self.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _self.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      idNo: freezed == idNo
          ? _self.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCountry: freezed == serviceCountry
          ? _self.serviceCountry
          : serviceCountry // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      serviceCurrency: freezed == serviceCurrency
          ? _self.serviceCurrency
          : serviceCurrency // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      accountNumber: freezed == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bank: freezed == bank
          ? _self.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      branch: freezed == branch
          ? _self.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      bicType: freezed == bicType
          ? _self.bicType
          : bicType // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      bicValue: freezed == bicValue
          ? _self.bicValue
          : bicValue // ignore: cast_nullable_to_non_nullable
              as String?,
      fav: freezed == fav
          ? _self.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceProvider: freezed == serviceProvider
          ? _self.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      idType: freezed == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      beneficiaryType: freezed == beneficiaryType
          ? _self.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrespondentActive: freezed == isCorrespondentActive
          ? _self.isCorrespondentActive
          : isCorrespondentActive // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _self.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get nationality {
    if (_self.nationality == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.nationality!, (value) {
      return _then(_self.copyWith(nationality: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get gender {
    if (_self.gender == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.gender!, (value) {
      return _then(_self.copyWith(gender: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get relationship {
    if (_self.relationship == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.relationship!, (value) {
      return _then(_self.copyWith(relationship: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get serviceType {
    if (_self.serviceType == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.serviceType!, (value) {
      return _then(_self.copyWith(serviceType: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get serviceCountry {
    if (_self.serviceCountry == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.serviceCountry!, (value) {
      return _then(_self.copyWith(serviceCountry: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get serviceCurrency {
    if (_self.serviceCurrency == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.serviceCurrency!, (value) {
      return _then(_self.copyWith(serviceCurrency: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get country {
    if (_self.country == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.country!, (value) {
      return _then(_self.copyWith(country: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get state {
    if (_self.state == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.state!, (value) {
      return _then(_self.copyWith(state: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get city {
    if (_self.city == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.city!, (value) {
      return _then(_self.copyWith(city: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get bank {
    if (_self.bank == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.bank!, (value) {
      return _then(_self.copyWith(bank: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get branch {
    if (_self.branch == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.branch!, (value) {
      return _then(_self.copyWith(branch: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get bicType {
    if (_self.bicType == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.bicType!, (value) {
      return _then(_self.copyWith(bicType: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get serviceProvider {
    if (_self.serviceProvider == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.serviceProvider!, (value) {
      return _then(_self.copyWith(serviceProvider: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get idType {
    if (_self.idType == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.idType!, (value) {
      return _then(_self.copyWith(idType: value));
    });
  }
}

/// Adds pattern-matching-related methods to [BeneficiaryFz].
extension BeneficiaryFzPatterns on BeneficiaryFz {
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
    TResult Function(_BeneficiaryFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BeneficiaryFz() when $default != null:
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
    TResult Function(_BeneficiaryFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BeneficiaryFz():
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
    TResult? Function(_BeneficiaryFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BeneficiaryFz() when $default != null:
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
            @JsonKey(name: "ServiceCountryCode")
            MasterResponseFZ? serviceCountry,
            @JsonKey(name: "ServiceCurrencyCode")
            MasterResponseFZ? serviceCurrency,
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
            @JsonKey(name: "ServiceProviderCode")
            MasterResponseFZ? serviceProvider,
            @JsonKey(name: "IdTypeCode") MasterResponseFZ? idType,
            @JsonKey(name: "BeneficiaryTypeCode") String? beneficiaryType,
            @JsonKey(name: "isCorrespondentActive")
            String? isCorrespondentActive,
            @JsonKey(
                name: "CreatedOn",
                fromJson: _parseDateTime,
                toJson: _formatDateTime)
            DateTime? createdOn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BeneficiaryFz() when $default != null:
        return $default(
            _that.active,
            _that.archive,
            _that.customerCode,
            _that.id,
            _that.coreBeneficiaryUid,
            _that.name,
            _that.firstName,
            _that.middleName,
            _that.lastName,
            _that.nationality,
            _that.gender,
            _that.dateOfBirth,
            _that.phone,
            _that.email,
            _that.address1,
            _that.address2,
            _that.relationship,
            _that.serviceType,
            _that.idNo,
            _that.mobile,
            _that.serviceCountry,
            _that.serviceCurrency,
            _that.country,
            _that.state,
            _that.city,
            _that.accountNumber,
            _that.bank,
            _that.branch,
            _that.bicType,
            _that.bicValue,
            _that.fav,
            _that.sortOrder,
            _that.status,
            _that.serviceProvider,
            _that.idType,
            _that.beneficiaryType,
            _that.isCorrespondentActive,
            _that.createdOn);
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
            @JsonKey(name: "ServiceCountryCode")
            MasterResponseFZ? serviceCountry,
            @JsonKey(name: "ServiceCurrencyCode")
            MasterResponseFZ? serviceCurrency,
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
            @JsonKey(name: "ServiceProviderCode")
            MasterResponseFZ? serviceProvider,
            @JsonKey(name: "IdTypeCode") MasterResponseFZ? idType,
            @JsonKey(name: "BeneficiaryTypeCode") String? beneficiaryType,
            @JsonKey(name: "isCorrespondentActive")
            String? isCorrespondentActive,
            @JsonKey(
                name: "CreatedOn",
                fromJson: _parseDateTime,
                toJson: _formatDateTime)
            DateTime? createdOn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BeneficiaryFz():
        return $default(
            _that.active,
            _that.archive,
            _that.customerCode,
            _that.id,
            _that.coreBeneficiaryUid,
            _that.name,
            _that.firstName,
            _that.middleName,
            _that.lastName,
            _that.nationality,
            _that.gender,
            _that.dateOfBirth,
            _that.phone,
            _that.email,
            _that.address1,
            _that.address2,
            _that.relationship,
            _that.serviceType,
            _that.idNo,
            _that.mobile,
            _that.serviceCountry,
            _that.serviceCurrency,
            _that.country,
            _that.state,
            _that.city,
            _that.accountNumber,
            _that.bank,
            _that.branch,
            _that.bicType,
            _that.bicValue,
            _that.fav,
            _that.sortOrder,
            _that.status,
            _that.serviceProvider,
            _that.idType,
            _that.beneficiaryType,
            _that.isCorrespondentActive,
            _that.createdOn);
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
            @JsonKey(name: "ServiceCountryCode")
            MasterResponseFZ? serviceCountry,
            @JsonKey(name: "ServiceCurrencyCode")
            MasterResponseFZ? serviceCurrency,
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
            @JsonKey(name: "ServiceProviderCode")
            MasterResponseFZ? serviceProvider,
            @JsonKey(name: "IdTypeCode") MasterResponseFZ? idType,
            @JsonKey(name: "BeneficiaryTypeCode") String? beneficiaryType,
            @JsonKey(name: "isCorrespondentActive")
            String? isCorrespondentActive,
            @JsonKey(
                name: "CreatedOn",
                fromJson: _parseDateTime,
                toJson: _formatDateTime)
            DateTime? createdOn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BeneficiaryFz() when $default != null:
        return $default(
            _that.active,
            _that.archive,
            _that.customerCode,
            _that.id,
            _that.coreBeneficiaryUid,
            _that.name,
            _that.firstName,
            _that.middleName,
            _that.lastName,
            _that.nationality,
            _that.gender,
            _that.dateOfBirth,
            _that.phone,
            _that.email,
            _that.address1,
            _that.address2,
            _that.relationship,
            _that.serviceType,
            _that.idNo,
            _that.mobile,
            _that.serviceCountry,
            _that.serviceCurrency,
            _that.country,
            _that.state,
            _that.city,
            _that.accountNumber,
            _that.bank,
            _that.branch,
            _that.bicType,
            _that.bicValue,
            _that.fav,
            _that.sortOrder,
            _that.status,
            _that.serviceProvider,
            _that.idType,
            _that.beneficiaryType,
            _that.isCorrespondentActive,
            _that.createdOn);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BeneficiaryFz implements BeneficiaryFz {
  const _BeneficiaryFz(
      {@JsonKey(name: "Active", readValue: _readStatus) this.active,
      @JsonKey(name: "Archive") this.archive,
      @JsonKey(name: "CustomerCode") this.customerCode,
      @JsonKey(name: "BeneficiaryUID") this.id,
      @JsonKey(name: "CoreBeneficiaryUID") this.coreBeneficiaryUid,
      @JsonKey(name: "name", readValue: _readName) this.name,
      @JsonKey(name: "FirstName") this.firstName,
      @JsonKey(name: "MiddleName") this.middleName,
      @JsonKey(name: "LastName") this.lastName,
      @JsonKey(name: "NationalityCode") this.nationality,
      @JsonKey(name: "GenderCode") this.gender,
      @JsonKey(name: "DateOfBirth") this.dateOfBirth,
      @JsonKey(name: "Phone") this.phone,
      @JsonKey(name: "Email") this.email,
      @JsonKey(name: "Address1") this.address1,
      @JsonKey(name: "Address2") this.address2,
      @JsonKey(name: "RelationshipCode") this.relationship,
      @JsonKey(name: "ServiceCategoryCode") this.serviceType,
      @JsonKey(name: "IdNo") this.idNo,
      @JsonKey(name: "BeneficiaryMobile") this.mobile,
      @JsonKey(name: "ServiceCountryCode") this.serviceCountry,
      @JsonKey(name: "ServiceCurrencyCode") this.serviceCurrency,
      @JsonKey(name: "CountryCode") this.country,
      @JsonKey(name: "StateCode") this.state,
      @JsonKey(name: "CityCode") this.city,
      @JsonKey(name: "AccountNumber") this.accountNumber,
      @JsonKey(name: "BeneficiaryBankCode") this.bank,
      @JsonKey(name: "BeneficiaryBranchCode") this.branch,
      @JsonKey(name: "BicCode") this.bicType,
      @JsonKey(name: "BicValue") this.bicValue,
      @JsonKey(name: "Favourites") this.fav,
      @JsonKey(name: "SortOrder") this.sortOrder,
      @JsonKey(name: "Status") this.status,
      @JsonKey(name: "ServiceProviderCode") this.serviceProvider,
      @JsonKey(name: "IdTypeCode") this.idType,
      @JsonKey(name: "BeneficiaryTypeCode") this.beneficiaryType,
      @JsonKey(name: "isCorrespondentActive") this.isCorrespondentActive,
      @JsonKey(
          name: "CreatedOn", fromJson: _parseDateTime, toJson: _formatDateTime)
      this.createdOn});
  factory _BeneficiaryFz.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryFzFromJson(json);

  @override
  @JsonKey(name: "Active", readValue: _readStatus)
  final String? active;
  @override
  @JsonKey(name: "Archive")
  final String? archive;
  @override
  @JsonKey(name: "CustomerCode")
  final String? customerCode;
  @override
  @JsonKey(name: "BeneficiaryUID")
  final int? id;
  @override
  @JsonKey(name: "CoreBeneficiaryUID")
  final String? coreBeneficiaryUid;
  @override
  @JsonKey(name: "name", readValue: _readName)
  final String? name;
  @override
  @JsonKey(name: "FirstName")
  final String? firstName;
  @override
  @JsonKey(name: "MiddleName")
  final String? middleName;
  @override
  @JsonKey(name: "LastName")
  final String? lastName;
  @override
  @JsonKey(name: "NationalityCode")
  final MasterResponseFZ? nationality;
  @override
  @JsonKey(name: "GenderCode")
  final MasterResponseFZ? gender;
  @override
  @JsonKey(name: "DateOfBirth")
  final String? dateOfBirth;
  @override
  @JsonKey(name: "Phone")
  final String? phone;
  @override
  @JsonKey(name: "Email")
  final String? email;
  @override
  @JsonKey(name: "Address1")
  final String? address1;
  @override
  @JsonKey(name: "Address2")
  final String? address2;
  @override
  @JsonKey(name: "RelationshipCode")
  final MasterResponseFZ? relationship;
  @override
  @JsonKey(name: "ServiceCategoryCode")
  final MasterResponseFZ? serviceType;
  @override
  @JsonKey(name: "IdNo")
  final String? idNo;
  @override
  @JsonKey(name: "BeneficiaryMobile")
  final String? mobile;
  @override
  @JsonKey(name: "ServiceCountryCode")
  final MasterResponseFZ? serviceCountry;
  @override
  @JsonKey(name: "ServiceCurrencyCode")
  final MasterResponseFZ? serviceCurrency;
  @override
  @JsonKey(name: "CountryCode")
  final MasterResponseFZ? country;
  @override
  @JsonKey(name: "StateCode")
  final MasterResponseFZ? state;
  @override
  @JsonKey(name: "CityCode")
  final MasterResponseFZ? city;
  @override
  @JsonKey(name: "AccountNumber")
  final String? accountNumber;
  @override
  @JsonKey(name: "BeneficiaryBankCode")
  final MasterResponseFZ? bank;
  @override
  @JsonKey(name: "BeneficiaryBranchCode")
  final MasterResponseFZ? branch;
  @override
  @JsonKey(name: "BicCode")
  final MasterResponseFZ? bicType;
  @override
  @JsonKey(name: "BicValue")
  final String? bicValue;
  @override
  @JsonKey(name: "Favourites")
  final String? fav;
  @override
  @JsonKey(name: "SortOrder")
  final int? sortOrder;
  @override
  @JsonKey(name: "Status")
  final String? status;
  @override
  @JsonKey(name: "ServiceProviderCode")
  final MasterResponseFZ? serviceProvider;
  @override
  @JsonKey(name: "IdTypeCode")
  final MasterResponseFZ? idType;
  @override
  @JsonKey(name: "BeneficiaryTypeCode")
  final String? beneficiaryType;
  @override
  @JsonKey(name: "isCorrespondentActive")
  final String? isCorrespondentActive;
  @override
  @JsonKey(name: "CreatedOn", fromJson: _parseDateTime, toJson: _formatDateTime)
  final DateTime? createdOn;

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BeneficiaryFzCopyWith<_BeneficiaryFz> get copyWith =>
      __$BeneficiaryFzCopyWithImpl<_BeneficiaryFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BeneficiaryFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BeneficiaryFz &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.archive, archive) || other.archive == archive) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.coreBeneficiaryUid, coreBeneficiaryUid) ||
                other.coreBeneficiaryUid == coreBeneficiaryUid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.serviceCountry, serviceCountry) ||
                other.serviceCountry == serviceCountry) &&
            (identical(other.serviceCurrency, serviceCurrency) ||
                other.serviceCurrency == serviceCurrency) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.branch, branch) || other.branch == branch) &&
            (identical(other.bicType, bicType) || other.bicType == bicType) &&
            (identical(other.bicValue, bicValue) ||
                other.bicValue == bicValue) &&
            (identical(other.fav, fav) || other.fav == fav) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serviceProvider, serviceProvider) ||
                other.serviceProvider == serviceProvider) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.beneficiaryType, beneficiaryType) ||
                other.beneficiaryType == beneficiaryType) &&
            (identical(other.isCorrespondentActive, isCorrespondentActive) ||
                other.isCorrespondentActive == isCorrespondentActive) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        active,
        archive,
        customerCode,
        id,
        coreBeneficiaryUid,
        name,
        firstName,
        middleName,
        lastName,
        nationality,
        gender,
        dateOfBirth,
        phone,
        email,
        address1,
        address2,
        relationship,
        serviceType,
        idNo,
        mobile,
        serviceCountry,
        serviceCurrency,
        country,
        state,
        city,
        accountNumber,
        bank,
        branch,
        bicType,
        bicValue,
        fav,
        sortOrder,
        status,
        serviceProvider,
        idType,
        beneficiaryType,
        isCorrespondentActive,
        createdOn
      ]);

  @override
  String toString() {
    return 'BeneficiaryFz(active: $active, archive: $archive, customerCode: $customerCode, id: $id, coreBeneficiaryUid: $coreBeneficiaryUid, name: $name, firstName: $firstName, middleName: $middleName, lastName: $lastName, nationality: $nationality, gender: $gender, dateOfBirth: $dateOfBirth, phone: $phone, email: $email, address1: $address1, address2: $address2, relationship: $relationship, serviceType: $serviceType, idNo: $idNo, mobile: $mobile, serviceCountry: $serviceCountry, serviceCurrency: $serviceCurrency, country: $country, state: $state, city: $city, accountNumber: $accountNumber, bank: $bank, branch: $branch, bicType: $bicType, bicValue: $bicValue, fav: $fav, sortOrder: $sortOrder, status: $status, serviceProvider: $serviceProvider, idType: $idType, beneficiaryType: $beneficiaryType, isCorrespondentActive: $isCorrespondentActive, createdOn: $createdOn)';
  }
}

/// @nodoc
abstract mixin class _$BeneficiaryFzCopyWith<$Res>
    implements $BeneficiaryFzCopyWith<$Res> {
  factory _$BeneficiaryFzCopyWith(
          _BeneficiaryFz value, $Res Function(_BeneficiaryFz) _then) =
      __$BeneficiaryFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Active", readValue: _readStatus) String? active,
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
      DateTime? createdOn});

  @override
  $MasterResponseFZCopyWith<$Res>? get nationality;
  @override
  $MasterResponseFZCopyWith<$Res>? get gender;
  @override
  $MasterResponseFZCopyWith<$Res>? get relationship;
  @override
  $MasterResponseFZCopyWith<$Res>? get serviceType;
  @override
  $MasterResponseFZCopyWith<$Res>? get serviceCountry;
  @override
  $MasterResponseFZCopyWith<$Res>? get serviceCurrency;
  @override
  $MasterResponseFZCopyWith<$Res>? get country;
  @override
  $MasterResponseFZCopyWith<$Res>? get state;
  @override
  $MasterResponseFZCopyWith<$Res>? get city;
  @override
  $MasterResponseFZCopyWith<$Res>? get bank;
  @override
  $MasterResponseFZCopyWith<$Res>? get branch;
  @override
  $MasterResponseFZCopyWith<$Res>? get bicType;
  @override
  $MasterResponseFZCopyWith<$Res>? get serviceProvider;
  @override
  $MasterResponseFZCopyWith<$Res>? get idType;
}

/// @nodoc
class __$BeneficiaryFzCopyWithImpl<$Res>
    implements _$BeneficiaryFzCopyWith<$Res> {
  __$BeneficiaryFzCopyWithImpl(this._self, this._then);

  final _BeneficiaryFz _self;
  final $Res Function(_BeneficiaryFz) _then;

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? active = freezed,
    Object? archive = freezed,
    Object? customerCode = freezed,
    Object? id = freezed,
    Object? coreBeneficiaryUid = freezed,
    Object? name = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? nationality = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? relationship = freezed,
    Object? serviceType = freezed,
    Object? idNo = freezed,
    Object? mobile = freezed,
    Object? serviceCountry = freezed,
    Object? serviceCurrency = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? accountNumber = freezed,
    Object? bank = freezed,
    Object? branch = freezed,
    Object? bicType = freezed,
    Object? bicValue = freezed,
    Object? fav = freezed,
    Object? sortOrder = freezed,
    Object? status = freezed,
    Object? serviceProvider = freezed,
    Object? idType = freezed,
    Object? beneficiaryType = freezed,
    Object? isCorrespondentActive = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_BeneficiaryFz(
      active: freezed == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as String?,
      archive: freezed == archive
          ? _self.archive
          : archive // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      coreBeneficiaryUid: freezed == coreBeneficiaryUid
          ? _self.coreBeneficiaryUid
          : coreBeneficiaryUid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _self.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _self.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _self.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _self.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      idNo: freezed == idNo
          ? _self.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCountry: freezed == serviceCountry
          ? _self.serviceCountry
          : serviceCountry // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      serviceCurrency: freezed == serviceCurrency
          ? _self.serviceCurrency
          : serviceCurrency // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      accountNumber: freezed == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bank: freezed == bank
          ? _self.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      branch: freezed == branch
          ? _self.branch
          : branch // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      bicType: freezed == bicType
          ? _self.bicType
          : bicType // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      bicValue: freezed == bicValue
          ? _self.bicValue
          : bicValue // ignore: cast_nullable_to_non_nullable
              as String?,
      fav: freezed == fav
          ? _self.fav
          : fav // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: freezed == sortOrder
          ? _self.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceProvider: freezed == serviceProvider
          ? _self.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      idType: freezed == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as MasterResponseFZ?,
      beneficiaryType: freezed == beneficiaryType
          ? _self.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      isCorrespondentActive: freezed == isCorrespondentActive
          ? _self.isCorrespondentActive
          : isCorrespondentActive // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _self.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get nationality {
    if (_self.nationality == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.nationality!, (value) {
      return _then(_self.copyWith(nationality: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get gender {
    if (_self.gender == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.gender!, (value) {
      return _then(_self.copyWith(gender: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get relationship {
    if (_self.relationship == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.relationship!, (value) {
      return _then(_self.copyWith(relationship: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get serviceType {
    if (_self.serviceType == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.serviceType!, (value) {
      return _then(_self.copyWith(serviceType: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get serviceCountry {
    if (_self.serviceCountry == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.serviceCountry!, (value) {
      return _then(_self.copyWith(serviceCountry: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get serviceCurrency {
    if (_self.serviceCurrency == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.serviceCurrency!, (value) {
      return _then(_self.copyWith(serviceCurrency: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get country {
    if (_self.country == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.country!, (value) {
      return _then(_self.copyWith(country: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get state {
    if (_self.state == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.state!, (value) {
      return _then(_self.copyWith(state: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get city {
    if (_self.city == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.city!, (value) {
      return _then(_self.copyWith(city: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get bank {
    if (_self.bank == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.bank!, (value) {
      return _then(_self.copyWith(bank: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get branch {
    if (_self.branch == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.branch!, (value) {
      return _then(_self.copyWith(branch: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get bicType {
    if (_self.bicType == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.bicType!, (value) {
      return _then(_self.copyWith(bicType: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get serviceProvider {
    if (_self.serviceProvider == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.serviceProvider!, (value) {
      return _then(_self.copyWith(serviceProvider: value));
    });
  }

  /// Create a copy of BeneficiaryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MasterResponseFZCopyWith<$Res>? get idType {
    if (_self.idType == null) {
      return null;
    }

    return $MasterResponseFZCopyWith<$Res>(_self.idType!, (value) {
      return _then(_self.copyWith(idType: value));
    });
  }
}

// dart format on
