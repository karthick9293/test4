// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enquiry_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EnquiryDataFz {
  @JsonKey(name: 'EnquiryList')
  List<EnquiryFz> get enquiryList;

  /// Create a copy of EnquiryDataFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnquiryDataFzCopyWith<EnquiryDataFz> get copyWith =>
      _$EnquiryDataFzCopyWithImpl<EnquiryDataFz>(
          this as EnquiryDataFz, _$identity);

  /// Serializes this EnquiryDataFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnquiryDataFz &&
            const DeepCollectionEquality()
                .equals(other.enquiryList, enquiryList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(enquiryList));

  @override
  String toString() {
    return 'EnquiryDataFz(enquiryList: $enquiryList)';
  }
}

/// @nodoc
abstract mixin class $EnquiryDataFzCopyWith<$Res> {
  factory $EnquiryDataFzCopyWith(
          EnquiryDataFz value, $Res Function(EnquiryDataFz) _then) =
      _$EnquiryDataFzCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'EnquiryList') List<EnquiryFz> enquiryList});
}

/// @nodoc
class _$EnquiryDataFzCopyWithImpl<$Res>
    implements $EnquiryDataFzCopyWith<$Res> {
  _$EnquiryDataFzCopyWithImpl(this._self, this._then);

  final EnquiryDataFz _self;
  final $Res Function(EnquiryDataFz) _then;

  /// Create a copy of EnquiryDataFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enquiryList = null,
  }) {
    return _then(_self.copyWith(
      enquiryList: null == enquiryList
          ? _self.enquiryList
          : enquiryList // ignore: cast_nullable_to_non_nullable
              as List<EnquiryFz>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EnquiryDataFz].
extension EnquiryDataFzPatterns on EnquiryDataFz {
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
    TResult Function(_EnquiryDataFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnquiryDataFz() when $default != null:
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
    TResult Function(_EnquiryDataFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryDataFz():
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
    TResult? Function(_EnquiryDataFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryDataFz() when $default != null:
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
    TResult Function(@JsonKey(name: 'EnquiryList') List<EnquiryFz> enquiryList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnquiryDataFz() when $default != null:
        return $default(_that.enquiryList);
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
    TResult Function(@JsonKey(name: 'EnquiryList') List<EnquiryFz> enquiryList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryDataFz():
        return $default(_that.enquiryList);
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
            @JsonKey(name: 'EnquiryList') List<EnquiryFz> enquiryList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryDataFz() when $default != null:
        return $default(_that.enquiryList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EnquiryDataFz implements EnquiryDataFz {
  const _EnquiryDataFz(
      {@JsonKey(name: 'EnquiryList')
      final List<EnquiryFz> enquiryList = const []})
      : _enquiryList = enquiryList;
  factory _EnquiryDataFz.fromJson(Map<String, dynamic> json) =>
      _$EnquiryDataFzFromJson(json);

  final List<EnquiryFz> _enquiryList;
  @override
  @JsonKey(name: 'EnquiryList')
  List<EnquiryFz> get enquiryList {
    if (_enquiryList is EqualUnmodifiableListView) return _enquiryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enquiryList);
  }

  /// Create a copy of EnquiryDataFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnquiryDataFzCopyWith<_EnquiryDataFz> get copyWith =>
      __$EnquiryDataFzCopyWithImpl<_EnquiryDataFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnquiryDataFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnquiryDataFz &&
            const DeepCollectionEquality()
                .equals(other._enquiryList, _enquiryList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_enquiryList));

  @override
  String toString() {
    return 'EnquiryDataFz(enquiryList: $enquiryList)';
  }
}

/// @nodoc
abstract mixin class _$EnquiryDataFzCopyWith<$Res>
    implements $EnquiryDataFzCopyWith<$Res> {
  factory _$EnquiryDataFzCopyWith(
          _EnquiryDataFz value, $Res Function(_EnquiryDataFz) _then) =
      __$EnquiryDataFzCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'EnquiryList') List<EnquiryFz> enquiryList});
}

/// @nodoc
class __$EnquiryDataFzCopyWithImpl<$Res>
    implements _$EnquiryDataFzCopyWith<$Res> {
  __$EnquiryDataFzCopyWithImpl(this._self, this._then);

  final _EnquiryDataFz _self;
  final $Res Function(_EnquiryDataFz) _then;

  /// Create a copy of EnquiryDataFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enquiryList = null,
  }) {
    return _then(_EnquiryDataFz(
      enquiryList: null == enquiryList
          ? _self._enquiryList
          : enquiryList // ignore: cast_nullable_to_non_nullable
              as List<EnquiryFz>,
    ));
  }
}

/// @nodoc
mixin _$EnquiryFz {
  @JsonKey(name: 'EnquiryCode')
  String get enquiryCode;
  @JsonKey(name: 'TransactionRefNo')
  String get transactionRefNo;
  @JsonKey(name: 'CustomerCode')
  String get customerCode;
  @JsonKey(name: 'EmailId')
  String get emailId;
  @JsonKey(name: 'EnquiryStatus')
  String get enquiryStatus;
  @JsonKey(name: 'LanguageCode')
  String get languageCode;
  @JsonKey(name: 'EnquiryType')
  String get enquiryType;
  @JsonKey(name: 'EnquiryTypeCode')
  int? get enquiryTypeCode;
  @JsonKey(name: 'EnquiryStatusCode')
  String get enquiryStatusCode;
  @JsonKey(name: 'PhoneNo')
  String get phoneNo;
  @JsonKey(name: 'QueryType')
  String get queryType;
  @JsonKey(name: 'QueryTypeCode')
  int? get queryTypeCode;
  @JsonKey(name: 'BranchCode')
  String get branchCode;
  @JsonKey(name: 'Remarks')
  String get remarks;
  @JsonKey(name: 'TrackingDetails')
  List<TrackingDetailFz> get trackingDetails;

  /// Create a copy of EnquiryFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnquiryFzCopyWith<EnquiryFz> get copyWith =>
      _$EnquiryFzCopyWithImpl<EnquiryFz>(this as EnquiryFz, _$identity);

  /// Serializes this EnquiryFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnquiryFz &&
            (identical(other.enquiryCode, enquiryCode) ||
                other.enquiryCode == enquiryCode) &&
            (identical(other.transactionRefNo, transactionRefNo) ||
                other.transactionRefNo == transactionRefNo) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.enquiryStatus, enquiryStatus) ||
                other.enquiryStatus == enquiryStatus) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.enquiryType, enquiryType) ||
                other.enquiryType == enquiryType) &&
            (identical(other.enquiryTypeCode, enquiryTypeCode) ||
                other.enquiryTypeCode == enquiryTypeCode) &&
            (identical(other.enquiryStatusCode, enquiryStatusCode) ||
                other.enquiryStatusCode == enquiryStatusCode) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.queryType, queryType) ||
                other.queryType == queryType) &&
            (identical(other.queryTypeCode, queryTypeCode) ||
                other.queryTypeCode == queryTypeCode) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            const DeepCollectionEquality()
                .equals(other.trackingDetails, trackingDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      enquiryCode,
      transactionRefNo,
      customerCode,
      emailId,
      enquiryStatus,
      languageCode,
      enquiryType,
      enquiryTypeCode,
      enquiryStatusCode,
      phoneNo,
      queryType,
      queryTypeCode,
      branchCode,
      remarks,
      const DeepCollectionEquality().hash(trackingDetails));

  @override
  String toString() {
    return 'EnquiryFz(enquiryCode: $enquiryCode, transactionRefNo: $transactionRefNo, customerCode: $customerCode, emailId: $emailId, enquiryStatus: $enquiryStatus, languageCode: $languageCode, enquiryType: $enquiryType, enquiryTypeCode: $enquiryTypeCode, enquiryStatusCode: $enquiryStatusCode, phoneNo: $phoneNo, queryType: $queryType, queryTypeCode: $queryTypeCode, branchCode: $branchCode, remarks: $remarks, trackingDetails: $trackingDetails)';
  }
}

/// @nodoc
abstract mixin class $EnquiryFzCopyWith<$Res> {
  factory $EnquiryFzCopyWith(EnquiryFz value, $Res Function(EnquiryFz) _then) =
      _$EnquiryFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'EnquiryCode') String enquiryCode,
      @JsonKey(name: 'TransactionRefNo') String transactionRefNo,
      @JsonKey(name: 'CustomerCode') String customerCode,
      @JsonKey(name: 'EmailId') String emailId,
      @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
      @JsonKey(name: 'LanguageCode') String languageCode,
      @JsonKey(name: 'EnquiryType') String enquiryType,
      @JsonKey(name: 'EnquiryTypeCode') int? enquiryTypeCode,
      @JsonKey(name: 'EnquiryStatusCode') String enquiryStatusCode,
      @JsonKey(name: 'PhoneNo') String phoneNo,
      @JsonKey(name: 'QueryType') String queryType,
      @JsonKey(name: 'QueryTypeCode') int? queryTypeCode,
      @JsonKey(name: 'BranchCode') String branchCode,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'TrackingDetails')
      List<TrackingDetailFz> trackingDetails});
}

/// @nodoc
class _$EnquiryFzCopyWithImpl<$Res> implements $EnquiryFzCopyWith<$Res> {
  _$EnquiryFzCopyWithImpl(this._self, this._then);

  final EnquiryFz _self;
  final $Res Function(EnquiryFz) _then;

  /// Create a copy of EnquiryFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enquiryCode = null,
    Object? transactionRefNo = null,
    Object? customerCode = null,
    Object? emailId = null,
    Object? enquiryStatus = null,
    Object? languageCode = null,
    Object? enquiryType = null,
    Object? enquiryTypeCode = freezed,
    Object? enquiryStatusCode = null,
    Object? phoneNo = null,
    Object? queryType = null,
    Object? queryTypeCode = freezed,
    Object? branchCode = null,
    Object? remarks = null,
    Object? trackingDetails = null,
  }) {
    return _then(_self.copyWith(
      enquiryCode: null == enquiryCode
          ? _self.enquiryCode
          : enquiryCode // ignore: cast_nullable_to_non_nullable
              as String,
      transactionRefNo: null == transactionRefNo
          ? _self.transactionRefNo
          : transactionRefNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _self.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      enquiryStatus: null == enquiryStatus
          ? _self.enquiryStatus
          : enquiryStatus // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      enquiryType: null == enquiryType
          ? _self.enquiryType
          : enquiryType // ignore: cast_nullable_to_non_nullable
              as String,
      enquiryTypeCode: freezed == enquiryTypeCode
          ? _self.enquiryTypeCode
          : enquiryTypeCode // ignore: cast_nullable_to_non_nullable
              as int?,
      enquiryStatusCode: null == enquiryStatusCode
          ? _self.enquiryStatusCode
          : enquiryStatusCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _self.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      queryType: null == queryType
          ? _self.queryType
          : queryType // ignore: cast_nullable_to_non_nullable
              as String,
      queryTypeCode: freezed == queryTypeCode
          ? _self.queryTypeCode
          : queryTypeCode // ignore: cast_nullable_to_non_nullable
              as int?,
      branchCode: null == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      trackingDetails: null == trackingDetails
          ? _self.trackingDetails
          : trackingDetails // ignore: cast_nullable_to_non_nullable
              as List<TrackingDetailFz>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EnquiryFz].
extension EnquiryFzPatterns on EnquiryFz {
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
    TResult Function(_EnquiryFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnquiryFz() when $default != null:
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
    TResult Function(_EnquiryFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryFz():
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
    TResult? Function(_EnquiryFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryFz() when $default != null:
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
            @JsonKey(name: 'EnquiryCode') String enquiryCode,
            @JsonKey(name: 'TransactionRefNo') String transactionRefNo,
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'EmailId') String emailId,
            @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
            @JsonKey(name: 'LanguageCode') String languageCode,
            @JsonKey(name: 'EnquiryType') String enquiryType,
            @JsonKey(name: 'EnquiryTypeCode') int? enquiryTypeCode,
            @JsonKey(name: 'EnquiryStatusCode') String enquiryStatusCode,
            @JsonKey(name: 'PhoneNo') String phoneNo,
            @JsonKey(name: 'QueryType') String queryType,
            @JsonKey(name: 'QueryTypeCode') int? queryTypeCode,
            @JsonKey(name: 'BranchCode') String branchCode,
            @JsonKey(name: 'Remarks') String remarks,
            @JsonKey(name: 'TrackingDetails')
            List<TrackingDetailFz> trackingDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnquiryFz() when $default != null:
        return $default(
            _that.enquiryCode,
            _that.transactionRefNo,
            _that.customerCode,
            _that.emailId,
            _that.enquiryStatus,
            _that.languageCode,
            _that.enquiryType,
            _that.enquiryTypeCode,
            _that.enquiryStatusCode,
            _that.phoneNo,
            _that.queryType,
            _that.queryTypeCode,
            _that.branchCode,
            _that.remarks,
            _that.trackingDetails);
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
            @JsonKey(name: 'EnquiryCode') String enquiryCode,
            @JsonKey(name: 'TransactionRefNo') String transactionRefNo,
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'EmailId') String emailId,
            @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
            @JsonKey(name: 'LanguageCode') String languageCode,
            @JsonKey(name: 'EnquiryType') String enquiryType,
            @JsonKey(name: 'EnquiryTypeCode') int? enquiryTypeCode,
            @JsonKey(name: 'EnquiryStatusCode') String enquiryStatusCode,
            @JsonKey(name: 'PhoneNo') String phoneNo,
            @JsonKey(name: 'QueryType') String queryType,
            @JsonKey(name: 'QueryTypeCode') int? queryTypeCode,
            @JsonKey(name: 'BranchCode') String branchCode,
            @JsonKey(name: 'Remarks') String remarks,
            @JsonKey(name: 'TrackingDetails')
            List<TrackingDetailFz> trackingDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryFz():
        return $default(
            _that.enquiryCode,
            _that.transactionRefNo,
            _that.customerCode,
            _that.emailId,
            _that.enquiryStatus,
            _that.languageCode,
            _that.enquiryType,
            _that.enquiryTypeCode,
            _that.enquiryStatusCode,
            _that.phoneNo,
            _that.queryType,
            _that.queryTypeCode,
            _that.branchCode,
            _that.remarks,
            _that.trackingDetails);
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
            @JsonKey(name: 'EnquiryCode') String enquiryCode,
            @JsonKey(name: 'TransactionRefNo') String transactionRefNo,
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'EmailId') String emailId,
            @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
            @JsonKey(name: 'LanguageCode') String languageCode,
            @JsonKey(name: 'EnquiryType') String enquiryType,
            @JsonKey(name: 'EnquiryTypeCode') int? enquiryTypeCode,
            @JsonKey(name: 'EnquiryStatusCode') String enquiryStatusCode,
            @JsonKey(name: 'PhoneNo') String phoneNo,
            @JsonKey(name: 'QueryType') String queryType,
            @JsonKey(name: 'QueryTypeCode') int? queryTypeCode,
            @JsonKey(name: 'BranchCode') String branchCode,
            @JsonKey(name: 'Remarks') String remarks,
            @JsonKey(name: 'TrackingDetails')
            List<TrackingDetailFz> trackingDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryFz() when $default != null:
        return $default(
            _that.enquiryCode,
            _that.transactionRefNo,
            _that.customerCode,
            _that.emailId,
            _that.enquiryStatus,
            _that.languageCode,
            _that.enquiryType,
            _that.enquiryTypeCode,
            _that.enquiryStatusCode,
            _that.phoneNo,
            _that.queryType,
            _that.queryTypeCode,
            _that.branchCode,
            _that.remarks,
            _that.trackingDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EnquiryFz implements EnquiryFz {
  const _EnquiryFz(
      {@JsonKey(name: 'EnquiryCode') this.enquiryCode = '',
      @JsonKey(name: 'TransactionRefNo') this.transactionRefNo = '',
      @JsonKey(name: 'CustomerCode') this.customerCode = '',
      @JsonKey(name: 'EmailId') this.emailId = '',
      @JsonKey(name: 'EnquiryStatus') this.enquiryStatus = '',
      @JsonKey(name: 'LanguageCode') this.languageCode = '',
      @JsonKey(name: 'EnquiryType') this.enquiryType = '',
      @JsonKey(name: 'EnquiryTypeCode') this.enquiryTypeCode,
      @JsonKey(name: 'EnquiryStatusCode') this.enquiryStatusCode = '',
      @JsonKey(name: 'PhoneNo') this.phoneNo = '',
      @JsonKey(name: 'QueryType') this.queryType = '',
      @JsonKey(name: 'QueryTypeCode') this.queryTypeCode,
      @JsonKey(name: 'BranchCode') this.branchCode = '',
      @JsonKey(name: 'Remarks') this.remarks = '',
      @JsonKey(name: 'TrackingDetails')
      final List<TrackingDetailFz> trackingDetails = const []})
      : _trackingDetails = trackingDetails;
  factory _EnquiryFz.fromJson(Map<String, dynamic> json) =>
      _$EnquiryFzFromJson(json);

  @override
  @JsonKey(name: 'EnquiryCode')
  final String enquiryCode;
  @override
  @JsonKey(name: 'TransactionRefNo')
  final String transactionRefNo;
  @override
  @JsonKey(name: 'CustomerCode')
  final String customerCode;
  @override
  @JsonKey(name: 'EmailId')
  final String emailId;
  @override
  @JsonKey(name: 'EnquiryStatus')
  final String enquiryStatus;
  @override
  @JsonKey(name: 'LanguageCode')
  final String languageCode;
  @override
  @JsonKey(name: 'EnquiryType')
  final String enquiryType;
  @override
  @JsonKey(name: 'EnquiryTypeCode')
  final int? enquiryTypeCode;
  @override
  @JsonKey(name: 'EnquiryStatusCode')
  final String enquiryStatusCode;
  @override
  @JsonKey(name: 'PhoneNo')
  final String phoneNo;
  @override
  @JsonKey(name: 'QueryType')
  final String queryType;
  @override
  @JsonKey(name: 'QueryTypeCode')
  final int? queryTypeCode;
  @override
  @JsonKey(name: 'BranchCode')
  final String branchCode;
  @override
  @JsonKey(name: 'Remarks')
  final String remarks;
  final List<TrackingDetailFz> _trackingDetails;
  @override
  @JsonKey(name: 'TrackingDetails')
  List<TrackingDetailFz> get trackingDetails {
    if (_trackingDetails is EqualUnmodifiableListView) return _trackingDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackingDetails);
  }

  /// Create a copy of EnquiryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnquiryFzCopyWith<_EnquiryFz> get copyWith =>
      __$EnquiryFzCopyWithImpl<_EnquiryFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnquiryFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnquiryFz &&
            (identical(other.enquiryCode, enquiryCode) ||
                other.enquiryCode == enquiryCode) &&
            (identical(other.transactionRefNo, transactionRefNo) ||
                other.transactionRefNo == transactionRefNo) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.enquiryStatus, enquiryStatus) ||
                other.enquiryStatus == enquiryStatus) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.enquiryType, enquiryType) ||
                other.enquiryType == enquiryType) &&
            (identical(other.enquiryTypeCode, enquiryTypeCode) ||
                other.enquiryTypeCode == enquiryTypeCode) &&
            (identical(other.enquiryStatusCode, enquiryStatusCode) ||
                other.enquiryStatusCode == enquiryStatusCode) &&
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.queryType, queryType) ||
                other.queryType == queryType) &&
            (identical(other.queryTypeCode, queryTypeCode) ||
                other.queryTypeCode == queryTypeCode) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            const DeepCollectionEquality()
                .equals(other._trackingDetails, _trackingDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      enquiryCode,
      transactionRefNo,
      customerCode,
      emailId,
      enquiryStatus,
      languageCode,
      enquiryType,
      enquiryTypeCode,
      enquiryStatusCode,
      phoneNo,
      queryType,
      queryTypeCode,
      branchCode,
      remarks,
      const DeepCollectionEquality().hash(_trackingDetails));

  @override
  String toString() {
    return 'EnquiryFz(enquiryCode: $enquiryCode, transactionRefNo: $transactionRefNo, customerCode: $customerCode, emailId: $emailId, enquiryStatus: $enquiryStatus, languageCode: $languageCode, enquiryType: $enquiryType, enquiryTypeCode: $enquiryTypeCode, enquiryStatusCode: $enquiryStatusCode, phoneNo: $phoneNo, queryType: $queryType, queryTypeCode: $queryTypeCode, branchCode: $branchCode, remarks: $remarks, trackingDetails: $trackingDetails)';
  }
}

/// @nodoc
abstract mixin class _$EnquiryFzCopyWith<$Res>
    implements $EnquiryFzCopyWith<$Res> {
  factory _$EnquiryFzCopyWith(
          _EnquiryFz value, $Res Function(_EnquiryFz) _then) =
      __$EnquiryFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'EnquiryCode') String enquiryCode,
      @JsonKey(name: 'TransactionRefNo') String transactionRefNo,
      @JsonKey(name: 'CustomerCode') String customerCode,
      @JsonKey(name: 'EmailId') String emailId,
      @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
      @JsonKey(name: 'LanguageCode') String languageCode,
      @JsonKey(name: 'EnquiryType') String enquiryType,
      @JsonKey(name: 'EnquiryTypeCode') int? enquiryTypeCode,
      @JsonKey(name: 'EnquiryStatusCode') String enquiryStatusCode,
      @JsonKey(name: 'PhoneNo') String phoneNo,
      @JsonKey(name: 'QueryType') String queryType,
      @JsonKey(name: 'QueryTypeCode') int? queryTypeCode,
      @JsonKey(name: 'BranchCode') String branchCode,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'TrackingDetails')
      List<TrackingDetailFz> trackingDetails});
}

/// @nodoc
class __$EnquiryFzCopyWithImpl<$Res> implements _$EnquiryFzCopyWith<$Res> {
  __$EnquiryFzCopyWithImpl(this._self, this._then);

  final _EnquiryFz _self;
  final $Res Function(_EnquiryFz) _then;

  /// Create a copy of EnquiryFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enquiryCode = null,
    Object? transactionRefNo = null,
    Object? customerCode = null,
    Object? emailId = null,
    Object? enquiryStatus = null,
    Object? languageCode = null,
    Object? enquiryType = null,
    Object? enquiryTypeCode = freezed,
    Object? enquiryStatusCode = null,
    Object? phoneNo = null,
    Object? queryType = null,
    Object? queryTypeCode = freezed,
    Object? branchCode = null,
    Object? remarks = null,
    Object? trackingDetails = null,
  }) {
    return _then(_EnquiryFz(
      enquiryCode: null == enquiryCode
          ? _self.enquiryCode
          : enquiryCode // ignore: cast_nullable_to_non_nullable
              as String,
      transactionRefNo: null == transactionRefNo
          ? _self.transactionRefNo
          : transactionRefNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _self.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      enquiryStatus: null == enquiryStatus
          ? _self.enquiryStatus
          : enquiryStatus // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      enquiryType: null == enquiryType
          ? _self.enquiryType
          : enquiryType // ignore: cast_nullable_to_non_nullable
              as String,
      enquiryTypeCode: freezed == enquiryTypeCode
          ? _self.enquiryTypeCode
          : enquiryTypeCode // ignore: cast_nullable_to_non_nullable
              as int?,
      enquiryStatusCode: null == enquiryStatusCode
          ? _self.enquiryStatusCode
          : enquiryStatusCode // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNo: null == phoneNo
          ? _self.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String,
      queryType: null == queryType
          ? _self.queryType
          : queryType // ignore: cast_nullable_to_non_nullable
              as String,
      queryTypeCode: freezed == queryTypeCode
          ? _self.queryTypeCode
          : queryTypeCode // ignore: cast_nullable_to_non_nullable
              as int?,
      branchCode: null == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      trackingDetails: null == trackingDetails
          ? _self._trackingDetails
          : trackingDetails // ignore: cast_nullable_to_non_nullable
              as List<TrackingDetailFz>,
    ));
  }
}

/// @nodoc
mixin _$TrackingDetailFz {
  @JsonKey(name: 'SlNo')
  String get slNo;
  @JsonKey(name: 'BranchCode')
  String get branchCode;
  @JsonKey(name: 'Remarks')
  String get remarks;
  @JsonKey(name: 'EnquiryStatus')
  String get enquiryStatus;
  @JsonKey(name: 'LanguageCode')
  String get languageCode;

  /// Create a copy of TrackingDetailFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrackingDetailFzCopyWith<TrackingDetailFz> get copyWith =>
      _$TrackingDetailFzCopyWithImpl<TrackingDetailFz>(
          this as TrackingDetailFz, _$identity);

  /// Serializes this TrackingDetailFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TrackingDetailFz &&
            (identical(other.slNo, slNo) || other.slNo == slNo) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.enquiryStatus, enquiryStatus) ||
                other.enquiryStatus == enquiryStatus) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, slNo, branchCode, remarks, enquiryStatus, languageCode);

  @override
  String toString() {
    return 'TrackingDetailFz(slNo: $slNo, branchCode: $branchCode, remarks: $remarks, enquiryStatus: $enquiryStatus, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $TrackingDetailFzCopyWith<$Res> {
  factory $TrackingDetailFzCopyWith(
          TrackingDetailFz value, $Res Function(TrackingDetailFz) _then) =
      _$TrackingDetailFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'SlNo') String slNo,
      @JsonKey(name: 'BranchCode') String branchCode,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class _$TrackingDetailFzCopyWithImpl<$Res>
    implements $TrackingDetailFzCopyWith<$Res> {
  _$TrackingDetailFzCopyWithImpl(this._self, this._then);

  final TrackingDetailFz _self;
  final $Res Function(TrackingDetailFz) _then;

  /// Create a copy of TrackingDetailFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slNo = null,
    Object? branchCode = null,
    Object? remarks = null,
    Object? enquiryStatus = null,
    Object? languageCode = null,
  }) {
    return _then(_self.copyWith(
      slNo: null == slNo
          ? _self.slNo
          : slNo // ignore: cast_nullable_to_non_nullable
              as String,
      branchCode: null == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      enquiryStatus: null == enquiryStatus
          ? _self.enquiryStatus
          : enquiryStatus // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TrackingDetailFz].
extension TrackingDetailFzPatterns on TrackingDetailFz {
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
    TResult Function(_TrackingDetailFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TrackingDetailFz() when $default != null:
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
    TResult Function(_TrackingDetailFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TrackingDetailFz():
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
    TResult? Function(_TrackingDetailFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TrackingDetailFz() when $default != null:
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
            @JsonKey(name: 'SlNo') String slNo,
            @JsonKey(name: 'BranchCode') String branchCode,
            @JsonKey(name: 'Remarks') String remarks,
            @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
            @JsonKey(name: 'LanguageCode') String languageCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TrackingDetailFz() when $default != null:
        return $default(_that.slNo, _that.branchCode, _that.remarks,
            _that.enquiryStatus, _that.languageCode);
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
            @JsonKey(name: 'SlNo') String slNo,
            @JsonKey(name: 'BranchCode') String branchCode,
            @JsonKey(name: 'Remarks') String remarks,
            @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
            @JsonKey(name: 'LanguageCode') String languageCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TrackingDetailFz():
        return $default(_that.slNo, _that.branchCode, _that.remarks,
            _that.enquiryStatus, _that.languageCode);
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
            @JsonKey(name: 'SlNo') String slNo,
            @JsonKey(name: 'BranchCode') String branchCode,
            @JsonKey(name: 'Remarks') String remarks,
            @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
            @JsonKey(name: 'LanguageCode') String languageCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TrackingDetailFz() when $default != null:
        return $default(_that.slNo, _that.branchCode, _that.remarks,
            _that.enquiryStatus, _that.languageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TrackingDetailFz implements TrackingDetailFz {
  const _TrackingDetailFz(
      {@JsonKey(name: 'SlNo') this.slNo = '',
      @JsonKey(name: 'BranchCode') this.branchCode = '',
      @JsonKey(name: 'Remarks') this.remarks = '',
      @JsonKey(name: 'EnquiryStatus') this.enquiryStatus = '',
      @JsonKey(name: 'LanguageCode') this.languageCode = ''});
  factory _TrackingDetailFz.fromJson(Map<String, dynamic> json) =>
      _$TrackingDetailFzFromJson(json);

  @override
  @JsonKey(name: 'SlNo')
  final String slNo;
  @override
  @JsonKey(name: 'BranchCode')
  final String branchCode;
  @override
  @JsonKey(name: 'Remarks')
  final String remarks;
  @override
  @JsonKey(name: 'EnquiryStatus')
  final String enquiryStatus;
  @override
  @JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// Create a copy of TrackingDetailFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TrackingDetailFzCopyWith<_TrackingDetailFz> get copyWith =>
      __$TrackingDetailFzCopyWithImpl<_TrackingDetailFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TrackingDetailFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TrackingDetailFz &&
            (identical(other.slNo, slNo) || other.slNo == slNo) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.enquiryStatus, enquiryStatus) ||
                other.enquiryStatus == enquiryStatus) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, slNo, branchCode, remarks, enquiryStatus, languageCode);

  @override
  String toString() {
    return 'TrackingDetailFz(slNo: $slNo, branchCode: $branchCode, remarks: $remarks, enquiryStatus: $enquiryStatus, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class _$TrackingDetailFzCopyWith<$Res>
    implements $TrackingDetailFzCopyWith<$Res> {
  factory _$TrackingDetailFzCopyWith(
          _TrackingDetailFz value, $Res Function(_TrackingDetailFz) _then) =
      __$TrackingDetailFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SlNo') String slNo,
      @JsonKey(name: 'BranchCode') String branchCode,
      @JsonKey(name: 'Remarks') String remarks,
      @JsonKey(name: 'EnquiryStatus') String enquiryStatus,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class __$TrackingDetailFzCopyWithImpl<$Res>
    implements _$TrackingDetailFzCopyWith<$Res> {
  __$TrackingDetailFzCopyWithImpl(this._self, this._then);

  final _TrackingDetailFz _self;
  final $Res Function(_TrackingDetailFz) _then;

  /// Create a copy of TrackingDetailFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slNo = null,
    Object? branchCode = null,
    Object? remarks = null,
    Object? enquiryStatus = null,
    Object? languageCode = null,
  }) {
    return _then(_TrackingDetailFz(
      slNo: null == slNo
          ? _self.slNo
          : slNo // ignore: cast_nullable_to_non_nullable
              as String,
      branchCode: null == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _self.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      enquiryStatus: null == enquiryStatus
          ? _self.enquiryStatus
          : enquiryStatus // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
