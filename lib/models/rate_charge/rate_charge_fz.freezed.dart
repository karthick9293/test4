// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_charge_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateChargeFz {
  @JsonKey(name: "SessionId")
  String? get sessionId;
  @JsonKey(name: "RoutingBankCode")
  String? get routingBankCode;
  @JsonKey(name: "CurrencyCode")
  String? get currencyCode;
  @JsonKey(name: "ServiceCode")
  String? get serviceCode;
  @JsonKey(name: "ServiceType")
  String? get serviceType;
  @JsonKey(name: "ChargeDetails")
  ChargeDetails? get chargeDetails;
  @JsonKey(name: "StatusCode")
  String? get statusCode;
  @JsonKey(name: "StatusMessage")
  String? get statusMessage;
  @JsonKey(name: "CustomMessageDetails")
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of RateChargeFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RateChargeFzCopyWith<RateChargeFz> get copyWith =>
      _$RateChargeFzCopyWithImpl<RateChargeFz>(
          this as RateChargeFz, _$identity);

  /// Serializes this RateChargeFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RateChargeFz &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.routingBankCode, routingBankCode) ||
                other.routingBankCode == routingBankCode) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.chargeDetails, chargeDetails) ||
                other.chargeDetails == chargeDetails) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      routingBankCode,
      currencyCode,
      serviceCode,
      serviceType,
      chargeDetails,
      statusCode,
      statusMessage,
      customMessageDetails);

  @override
  String toString() {
    return 'RateChargeFz(sessionId: $sessionId, routingBankCode: $routingBankCode, currencyCode: $currencyCode, serviceCode: $serviceCode, serviceType: $serviceType, chargeDetails: $chargeDetails, statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $RateChargeFzCopyWith<$Res> {
  factory $RateChargeFzCopyWith(
          RateChargeFz value, $Res Function(RateChargeFz) _then) =
      _$RateChargeFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "SessionId") String? sessionId,
      @JsonKey(name: "RoutingBankCode") String? routingBankCode,
      @JsonKey(name: "CurrencyCode") String? currencyCode,
      @JsonKey(name: "ServiceCode") String? serviceCode,
      @JsonKey(name: "ServiceType") String? serviceType,
      @JsonKey(name: "ChargeDetails") ChargeDetails? chargeDetails,
      @JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails});

  $ChargeDetailsCopyWith<$Res>? get chargeDetails;
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$RateChargeFzCopyWithImpl<$Res> implements $RateChargeFzCopyWith<$Res> {
  _$RateChargeFzCopyWithImpl(this._self, this._then);

  final RateChargeFz _self;
  final $Res Function(RateChargeFz) _then;

  /// Create a copy of RateChargeFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = freezed,
    Object? routingBankCode = freezed,
    Object? currencyCode = freezed,
    Object? serviceCode = freezed,
    Object? serviceType = freezed,
    Object? chargeDetails = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_self.copyWith(
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      routingBankCode: freezed == routingBankCode
          ? _self.routingBankCode
          : routingBankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCode: freezed == serviceCode
          ? _self.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeDetails: freezed == chargeDetails
          ? _self.chargeDetails
          : chargeDetails // ignore: cast_nullable_to_non_nullable
              as ChargeDetails?,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of RateChargeFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChargeDetailsCopyWith<$Res>? get chargeDetails {
    if (_self.chargeDetails == null) {
      return null;
    }

    return $ChargeDetailsCopyWith<$Res>(_self.chargeDetails!, (value) {
      return _then(_self.copyWith(chargeDetails: value));
    });
  }

  /// Create a copy of RateChargeFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails {
    if (_self.customMessageDetails == null) {
      return null;
    }

    return $CustomMessageDetailsCopyWith<$Res>(_self.customMessageDetails!,
        (value) {
      return _then(_self.copyWith(customMessageDetails: value));
    });
  }
}

/// Adds pattern-matching-related methods to [RateChargeFz].
extension RateChargeFzPatterns on RateChargeFz {
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
    TResult Function(_RateChargeFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateChargeFz() when $default != null:
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
    TResult Function(_RateChargeFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateChargeFz():
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
    TResult? Function(_RateChargeFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateChargeFz() when $default != null:
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
            @JsonKey(name: "SessionId") String? sessionId,
            @JsonKey(name: "RoutingBankCode") String? routingBankCode,
            @JsonKey(name: "CurrencyCode") String? currencyCode,
            @JsonKey(name: "ServiceCode") String? serviceCode,
            @JsonKey(name: "ServiceType") String? serviceType,
            @JsonKey(name: "ChargeDetails") ChargeDetails? chargeDetails,
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateChargeFz() when $default != null:
        return $default(
            _that.sessionId,
            _that.routingBankCode,
            _that.currencyCode,
            _that.serviceCode,
            _that.serviceType,
            _that.chargeDetails,
            _that.statusCode,
            _that.statusMessage,
            _that.customMessageDetails);
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
            @JsonKey(name: "SessionId") String? sessionId,
            @JsonKey(name: "RoutingBankCode") String? routingBankCode,
            @JsonKey(name: "CurrencyCode") String? currencyCode,
            @JsonKey(name: "ServiceCode") String? serviceCode,
            @JsonKey(name: "ServiceType") String? serviceType,
            @JsonKey(name: "ChargeDetails") ChargeDetails? chargeDetails,
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateChargeFz():
        return $default(
            _that.sessionId,
            _that.routingBankCode,
            _that.currencyCode,
            _that.serviceCode,
            _that.serviceType,
            _that.chargeDetails,
            _that.statusCode,
            _that.statusMessage,
            _that.customMessageDetails);
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
            @JsonKey(name: "SessionId") String? sessionId,
            @JsonKey(name: "RoutingBankCode") String? routingBankCode,
            @JsonKey(name: "CurrencyCode") String? currencyCode,
            @JsonKey(name: "ServiceCode") String? serviceCode,
            @JsonKey(name: "ServiceType") String? serviceType,
            @JsonKey(name: "ChargeDetails") ChargeDetails? chargeDetails,
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateChargeFz() when $default != null:
        return $default(
            _that.sessionId,
            _that.routingBankCode,
            _that.currencyCode,
            _that.serviceCode,
            _that.serviceType,
            _that.chargeDetails,
            _that.statusCode,
            _that.statusMessage,
            _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RateChargeFz implements RateChargeFz {
  const _RateChargeFz(
      {@JsonKey(name: "SessionId") this.sessionId,
      @JsonKey(name: "RoutingBankCode") this.routingBankCode,
      @JsonKey(name: "CurrencyCode") this.currencyCode,
      @JsonKey(name: "ServiceCode") this.serviceCode,
      @JsonKey(name: "ServiceType") this.serviceType,
      @JsonKey(name: "ChargeDetails") this.chargeDetails,
      @JsonKey(name: "StatusCode") this.statusCode,
      @JsonKey(name: "StatusMessage") this.statusMessage,
      @JsonKey(name: "CustomMessageDetails") this.customMessageDetails});
  factory _RateChargeFz.fromJson(Map<String, dynamic> json) =>
      _$RateChargeFzFromJson(json);

  @override
  @JsonKey(name: "SessionId")
  final String? sessionId;
  @override
  @JsonKey(name: "RoutingBankCode")
  final String? routingBankCode;
  @override
  @JsonKey(name: "CurrencyCode")
  final String? currencyCode;
  @override
  @JsonKey(name: "ServiceCode")
  final String? serviceCode;
  @override
  @JsonKey(name: "ServiceType")
  final String? serviceType;
  @override
  @JsonKey(name: "ChargeDetails")
  final ChargeDetails? chargeDetails;
  @override
  @JsonKey(name: "StatusCode")
  final String? statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String? statusMessage;
  @override
  @JsonKey(name: "CustomMessageDetails")
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of RateChargeFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RateChargeFzCopyWith<_RateChargeFz> get copyWith =>
      __$RateChargeFzCopyWithImpl<_RateChargeFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RateChargeFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RateChargeFz &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.routingBankCode, routingBankCode) ||
                other.routingBankCode == routingBankCode) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.chargeDetails, chargeDetails) ||
                other.chargeDetails == chargeDetails) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sessionId,
      routingBankCode,
      currencyCode,
      serviceCode,
      serviceType,
      chargeDetails,
      statusCode,
      statusMessage,
      customMessageDetails);

  @override
  String toString() {
    return 'RateChargeFz(sessionId: $sessionId, routingBankCode: $routingBankCode, currencyCode: $currencyCode, serviceCode: $serviceCode, serviceType: $serviceType, chargeDetails: $chargeDetails, statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$RateChargeFzCopyWith<$Res>
    implements $RateChargeFzCopyWith<$Res> {
  factory _$RateChargeFzCopyWith(
          _RateChargeFz value, $Res Function(_RateChargeFz) _then) =
      __$RateChargeFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "SessionId") String? sessionId,
      @JsonKey(name: "RoutingBankCode") String? routingBankCode,
      @JsonKey(name: "CurrencyCode") String? currencyCode,
      @JsonKey(name: "ServiceCode") String? serviceCode,
      @JsonKey(name: "ServiceType") String? serviceType,
      @JsonKey(name: "ChargeDetails") ChargeDetails? chargeDetails,
      @JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails});

  @override
  $ChargeDetailsCopyWith<$Res>? get chargeDetails;
  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$RateChargeFzCopyWithImpl<$Res>
    implements _$RateChargeFzCopyWith<$Res> {
  __$RateChargeFzCopyWithImpl(this._self, this._then);

  final _RateChargeFz _self;
  final $Res Function(_RateChargeFz) _then;

  /// Create a copy of RateChargeFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sessionId = freezed,
    Object? routingBankCode = freezed,
    Object? currencyCode = freezed,
    Object? serviceCode = freezed,
    Object? serviceType = freezed,
    Object? chargeDetails = freezed,
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_RateChargeFz(
      sessionId: freezed == sessionId
          ? _self.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      routingBankCode: freezed == routingBankCode
          ? _self.routingBankCode
          : routingBankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyCode: freezed == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCode: freezed == serviceCode
          ? _self.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeDetails: freezed == chargeDetails
          ? _self.chargeDetails
          : chargeDetails // ignore: cast_nullable_to_non_nullable
              as ChargeDetails?,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of RateChargeFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChargeDetailsCopyWith<$Res>? get chargeDetails {
    if (_self.chargeDetails == null) {
      return null;
    }

    return $ChargeDetailsCopyWith<$Res>(_self.chargeDetails!, (value) {
      return _then(_self.copyWith(chargeDetails: value));
    });
  }

  /// Create a copy of RateChargeFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails {
    if (_self.customMessageDetails == null) {
      return null;
    }

    return $CustomMessageDetailsCopyWith<$Res>(_self.customMessageDetails!,
        (value) {
      return _then(_self.copyWith(customMessageDetails: value));
    });
  }
}

/// @nodoc
mixin _$ChargeDetails {
  @JsonKey(name: "CorrorgCode")
  String? get corrorgCode;
  @JsonKey(name: "CurCode")
  String? get curCode;
  @JsonKey(name: "ServiceCode")
  String? get serviceCode;
  @JsonKey(name: "FcyAmount")
  double? get fcyAmount;
  @JsonKey(name: "Rate")
  double? get rate;
  @JsonKey(name: "DivisionRate")
  double? get divisionRate;
  @JsonKey(name: "LcyAmount")
  double? get lcyAmount;
  @JsonKey(name: "Commission")
  double? get commission;
  @JsonKey(name: "BankChargesFcy")
  double? get bankChargesFcy;
  @JsonKey(name: "BankChargesLcy")
  double? get bankChargesLcy;
  @JsonKey(name: "Discounts")
  double? get discounts;
  @JsonKey(name: "NetAmount")
  double? get netAmount;
  @JsonKey(name: "Tax")
  double? get tax;
  @JsonKey(name: "BranchCost")
  double? get branchCost;
  @JsonKey(name: "CurrencyDecimal")
  int? get currencyDecimal;
  @JsonKey(name: "FxCurrencyDecimal")
  int? get fxCurrencyDecimal;

  /// Create a copy of ChargeDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChargeDetailsCopyWith<ChargeDetails> get copyWith =>
      _$ChargeDetailsCopyWithImpl<ChargeDetails>(
          this as ChargeDetails, _$identity);

  /// Serializes this ChargeDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChargeDetails &&
            (identical(other.corrorgCode, corrorgCode) ||
                other.corrorgCode == corrorgCode) &&
            (identical(other.curCode, curCode) || other.curCode == curCode) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.fcyAmount, fcyAmount) ||
                other.fcyAmount == fcyAmount) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.divisionRate, divisionRate) ||
                other.divisionRate == divisionRate) &&
            (identical(other.lcyAmount, lcyAmount) ||
                other.lcyAmount == lcyAmount) &&
            (identical(other.commission, commission) ||
                other.commission == commission) &&
            (identical(other.bankChargesFcy, bankChargesFcy) ||
                other.bankChargesFcy == bankChargesFcy) &&
            (identical(other.bankChargesLcy, bankChargesLcy) ||
                other.bankChargesLcy == bankChargesLcy) &&
            (identical(other.discounts, discounts) ||
                other.discounts == discounts) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.branchCost, branchCost) ||
                other.branchCost == branchCost) &&
            (identical(other.currencyDecimal, currencyDecimal) ||
                other.currencyDecimal == currencyDecimal) &&
            (identical(other.fxCurrencyDecimal, fxCurrencyDecimal) ||
                other.fxCurrencyDecimal == fxCurrencyDecimal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      corrorgCode,
      curCode,
      serviceCode,
      fcyAmount,
      rate,
      divisionRate,
      lcyAmount,
      commission,
      bankChargesFcy,
      bankChargesLcy,
      discounts,
      netAmount,
      tax,
      branchCost,
      currencyDecimal,
      fxCurrencyDecimal);

  @override
  String toString() {
    return 'ChargeDetails(corrorgCode: $corrorgCode, curCode: $curCode, serviceCode: $serviceCode, fcyAmount: $fcyAmount, rate: $rate, divisionRate: $divisionRate, lcyAmount: $lcyAmount, commission: $commission, bankChargesFcy: $bankChargesFcy, bankChargesLcy: $bankChargesLcy, discounts: $discounts, netAmount: $netAmount, tax: $tax, branchCost: $branchCost, currencyDecimal: $currencyDecimal, fxCurrencyDecimal: $fxCurrencyDecimal)';
  }
}

/// @nodoc
abstract mixin class $ChargeDetailsCopyWith<$Res> {
  factory $ChargeDetailsCopyWith(
          ChargeDetails value, $Res Function(ChargeDetails) _then) =
      _$ChargeDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "CorrorgCode") String? corrorgCode,
      @JsonKey(name: "CurCode") String? curCode,
      @JsonKey(name: "ServiceCode") String? serviceCode,
      @JsonKey(name: "FcyAmount") double? fcyAmount,
      @JsonKey(name: "Rate") double? rate,
      @JsonKey(name: "DivisionRate") double? divisionRate,
      @JsonKey(name: "LcyAmount") double? lcyAmount,
      @JsonKey(name: "Commission") double? commission,
      @JsonKey(name: "BankChargesFcy") double? bankChargesFcy,
      @JsonKey(name: "BankChargesLcy") double? bankChargesLcy,
      @JsonKey(name: "Discounts") double? discounts,
      @JsonKey(name: "NetAmount") double? netAmount,
      @JsonKey(name: "Tax") double? tax,
      @JsonKey(name: "BranchCost") double? branchCost,
      @JsonKey(name: "CurrencyDecimal") int? currencyDecimal,
      @JsonKey(name: "FxCurrencyDecimal") int? fxCurrencyDecimal});
}

/// @nodoc
class _$ChargeDetailsCopyWithImpl<$Res>
    implements $ChargeDetailsCopyWith<$Res> {
  _$ChargeDetailsCopyWithImpl(this._self, this._then);

  final ChargeDetails _self;
  final $Res Function(ChargeDetails) _then;

  /// Create a copy of ChargeDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? corrorgCode = freezed,
    Object? curCode = freezed,
    Object? serviceCode = freezed,
    Object? fcyAmount = freezed,
    Object? rate = freezed,
    Object? divisionRate = freezed,
    Object? lcyAmount = freezed,
    Object? commission = freezed,
    Object? bankChargesFcy = freezed,
    Object? bankChargesLcy = freezed,
    Object? discounts = freezed,
    Object? netAmount = freezed,
    Object? tax = freezed,
    Object? branchCost = freezed,
    Object? currencyDecimal = freezed,
    Object? fxCurrencyDecimal = freezed,
  }) {
    return _then(_self.copyWith(
      corrorgCode: freezed == corrorgCode
          ? _self.corrorgCode
          : corrorgCode // ignore: cast_nullable_to_non_nullable
              as String?,
      curCode: freezed == curCode
          ? _self.curCode
          : curCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCode: freezed == serviceCode
          ? _self.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fcyAmount: freezed == fcyAmount
          ? _self.fcyAmount
          : fcyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      divisionRate: freezed == divisionRate
          ? _self.divisionRate
          : divisionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      lcyAmount: freezed == lcyAmount
          ? _self.lcyAmount
          : lcyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      commission: freezed == commission
          ? _self.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as double?,
      bankChargesFcy: freezed == bankChargesFcy
          ? _self.bankChargesFcy
          : bankChargesFcy // ignore: cast_nullable_to_non_nullable
              as double?,
      bankChargesLcy: freezed == bankChargesLcy
          ? _self.bankChargesLcy
          : bankChargesLcy // ignore: cast_nullable_to_non_nullable
              as double?,
      discounts: freezed == discounts
          ? _self.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as double?,
      netAmount: freezed == netAmount
          ? _self.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      branchCost: freezed == branchCost
          ? _self.branchCost
          : branchCost // ignore: cast_nullable_to_non_nullable
              as double?,
      currencyDecimal: freezed == currencyDecimal
          ? _self.currencyDecimal
          : currencyDecimal // ignore: cast_nullable_to_non_nullable
              as int?,
      fxCurrencyDecimal: freezed == fxCurrencyDecimal
          ? _self.fxCurrencyDecimal
          : fxCurrencyDecimal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChargeDetails].
extension ChargeDetailsPatterns on ChargeDetails {
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
    TResult Function(_ChargeDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChargeDetails() when $default != null:
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
    TResult Function(_ChargeDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChargeDetails():
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
    TResult? Function(_ChargeDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChargeDetails() when $default != null:
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
            @JsonKey(name: "CorrorgCode") String? corrorgCode,
            @JsonKey(name: "CurCode") String? curCode,
            @JsonKey(name: "ServiceCode") String? serviceCode,
            @JsonKey(name: "FcyAmount") double? fcyAmount,
            @JsonKey(name: "Rate") double? rate,
            @JsonKey(name: "DivisionRate") double? divisionRate,
            @JsonKey(name: "LcyAmount") double? lcyAmount,
            @JsonKey(name: "Commission") double? commission,
            @JsonKey(name: "BankChargesFcy") double? bankChargesFcy,
            @JsonKey(name: "BankChargesLcy") double? bankChargesLcy,
            @JsonKey(name: "Discounts") double? discounts,
            @JsonKey(name: "NetAmount") double? netAmount,
            @JsonKey(name: "Tax") double? tax,
            @JsonKey(name: "BranchCost") double? branchCost,
            @JsonKey(name: "CurrencyDecimal") int? currencyDecimal,
            @JsonKey(name: "FxCurrencyDecimal") int? fxCurrencyDecimal)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChargeDetails() when $default != null:
        return $default(
            _that.corrorgCode,
            _that.curCode,
            _that.serviceCode,
            _that.fcyAmount,
            _that.rate,
            _that.divisionRate,
            _that.lcyAmount,
            _that.commission,
            _that.bankChargesFcy,
            _that.bankChargesLcy,
            _that.discounts,
            _that.netAmount,
            _that.tax,
            _that.branchCost,
            _that.currencyDecimal,
            _that.fxCurrencyDecimal);
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
            @JsonKey(name: "CorrorgCode") String? corrorgCode,
            @JsonKey(name: "CurCode") String? curCode,
            @JsonKey(name: "ServiceCode") String? serviceCode,
            @JsonKey(name: "FcyAmount") double? fcyAmount,
            @JsonKey(name: "Rate") double? rate,
            @JsonKey(name: "DivisionRate") double? divisionRate,
            @JsonKey(name: "LcyAmount") double? lcyAmount,
            @JsonKey(name: "Commission") double? commission,
            @JsonKey(name: "BankChargesFcy") double? bankChargesFcy,
            @JsonKey(name: "BankChargesLcy") double? bankChargesLcy,
            @JsonKey(name: "Discounts") double? discounts,
            @JsonKey(name: "NetAmount") double? netAmount,
            @JsonKey(name: "Tax") double? tax,
            @JsonKey(name: "BranchCost") double? branchCost,
            @JsonKey(name: "CurrencyDecimal") int? currencyDecimal,
            @JsonKey(name: "FxCurrencyDecimal") int? fxCurrencyDecimal)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChargeDetails():
        return $default(
            _that.corrorgCode,
            _that.curCode,
            _that.serviceCode,
            _that.fcyAmount,
            _that.rate,
            _that.divisionRate,
            _that.lcyAmount,
            _that.commission,
            _that.bankChargesFcy,
            _that.bankChargesLcy,
            _that.discounts,
            _that.netAmount,
            _that.tax,
            _that.branchCost,
            _that.currencyDecimal,
            _that.fxCurrencyDecimal);
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
            @JsonKey(name: "CorrorgCode") String? corrorgCode,
            @JsonKey(name: "CurCode") String? curCode,
            @JsonKey(name: "ServiceCode") String? serviceCode,
            @JsonKey(name: "FcyAmount") double? fcyAmount,
            @JsonKey(name: "Rate") double? rate,
            @JsonKey(name: "DivisionRate") double? divisionRate,
            @JsonKey(name: "LcyAmount") double? lcyAmount,
            @JsonKey(name: "Commission") double? commission,
            @JsonKey(name: "BankChargesFcy") double? bankChargesFcy,
            @JsonKey(name: "BankChargesLcy") double? bankChargesLcy,
            @JsonKey(name: "Discounts") double? discounts,
            @JsonKey(name: "NetAmount") double? netAmount,
            @JsonKey(name: "Tax") double? tax,
            @JsonKey(name: "BranchCost") double? branchCost,
            @JsonKey(name: "CurrencyDecimal") int? currencyDecimal,
            @JsonKey(name: "FxCurrencyDecimal") int? fxCurrencyDecimal)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChargeDetails() when $default != null:
        return $default(
            _that.corrorgCode,
            _that.curCode,
            _that.serviceCode,
            _that.fcyAmount,
            _that.rate,
            _that.divisionRate,
            _that.lcyAmount,
            _that.commission,
            _that.bankChargesFcy,
            _that.bankChargesLcy,
            _that.discounts,
            _that.netAmount,
            _that.tax,
            _that.branchCost,
            _that.currencyDecimal,
            _that.fxCurrencyDecimal);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChargeDetails implements ChargeDetails {
  const _ChargeDetails(
      {@JsonKey(name: "CorrorgCode") this.corrorgCode,
      @JsonKey(name: "CurCode") this.curCode,
      @JsonKey(name: "ServiceCode") this.serviceCode,
      @JsonKey(name: "FcyAmount") this.fcyAmount,
      @JsonKey(name: "Rate") this.rate,
      @JsonKey(name: "DivisionRate") this.divisionRate,
      @JsonKey(name: "LcyAmount") this.lcyAmount,
      @JsonKey(name: "Commission") this.commission,
      @JsonKey(name: "BankChargesFcy") this.bankChargesFcy,
      @JsonKey(name: "BankChargesLcy") this.bankChargesLcy,
      @JsonKey(name: "Discounts") this.discounts,
      @JsonKey(name: "NetAmount") this.netAmount,
      @JsonKey(name: "Tax") this.tax,
      @JsonKey(name: "BranchCost") this.branchCost,
      @JsonKey(name: "CurrencyDecimal") this.currencyDecimal,
      @JsonKey(name: "FxCurrencyDecimal") this.fxCurrencyDecimal});
  factory _ChargeDetails.fromJson(Map<String, dynamic> json) =>
      _$ChargeDetailsFromJson(json);

  @override
  @JsonKey(name: "CorrorgCode")
  final String? corrorgCode;
  @override
  @JsonKey(name: "CurCode")
  final String? curCode;
  @override
  @JsonKey(name: "ServiceCode")
  final String? serviceCode;
  @override
  @JsonKey(name: "FcyAmount")
  final double? fcyAmount;
  @override
  @JsonKey(name: "Rate")
  final double? rate;
  @override
  @JsonKey(name: "DivisionRate")
  final double? divisionRate;
  @override
  @JsonKey(name: "LcyAmount")
  final double? lcyAmount;
  @override
  @JsonKey(name: "Commission")
  final double? commission;
  @override
  @JsonKey(name: "BankChargesFcy")
  final double? bankChargesFcy;
  @override
  @JsonKey(name: "BankChargesLcy")
  final double? bankChargesLcy;
  @override
  @JsonKey(name: "Discounts")
  final double? discounts;
  @override
  @JsonKey(name: "NetAmount")
  final double? netAmount;
  @override
  @JsonKey(name: "Tax")
  final double? tax;
  @override
  @JsonKey(name: "BranchCost")
  final double? branchCost;
  @override
  @JsonKey(name: "CurrencyDecimal")
  final int? currencyDecimal;
  @override
  @JsonKey(name: "FxCurrencyDecimal")
  final int? fxCurrencyDecimal;

  /// Create a copy of ChargeDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChargeDetailsCopyWith<_ChargeDetails> get copyWith =>
      __$ChargeDetailsCopyWithImpl<_ChargeDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChargeDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChargeDetails &&
            (identical(other.corrorgCode, corrorgCode) ||
                other.corrorgCode == corrorgCode) &&
            (identical(other.curCode, curCode) || other.curCode == curCode) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.fcyAmount, fcyAmount) ||
                other.fcyAmount == fcyAmount) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.divisionRate, divisionRate) ||
                other.divisionRate == divisionRate) &&
            (identical(other.lcyAmount, lcyAmount) ||
                other.lcyAmount == lcyAmount) &&
            (identical(other.commission, commission) ||
                other.commission == commission) &&
            (identical(other.bankChargesFcy, bankChargesFcy) ||
                other.bankChargesFcy == bankChargesFcy) &&
            (identical(other.bankChargesLcy, bankChargesLcy) ||
                other.bankChargesLcy == bankChargesLcy) &&
            (identical(other.discounts, discounts) ||
                other.discounts == discounts) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.branchCost, branchCost) ||
                other.branchCost == branchCost) &&
            (identical(other.currencyDecimal, currencyDecimal) ||
                other.currencyDecimal == currencyDecimal) &&
            (identical(other.fxCurrencyDecimal, fxCurrencyDecimal) ||
                other.fxCurrencyDecimal == fxCurrencyDecimal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      corrorgCode,
      curCode,
      serviceCode,
      fcyAmount,
      rate,
      divisionRate,
      lcyAmount,
      commission,
      bankChargesFcy,
      bankChargesLcy,
      discounts,
      netAmount,
      tax,
      branchCost,
      currencyDecimal,
      fxCurrencyDecimal);

  @override
  String toString() {
    return 'ChargeDetails(corrorgCode: $corrorgCode, curCode: $curCode, serviceCode: $serviceCode, fcyAmount: $fcyAmount, rate: $rate, divisionRate: $divisionRate, lcyAmount: $lcyAmount, commission: $commission, bankChargesFcy: $bankChargesFcy, bankChargesLcy: $bankChargesLcy, discounts: $discounts, netAmount: $netAmount, tax: $tax, branchCost: $branchCost, currencyDecimal: $currencyDecimal, fxCurrencyDecimal: $fxCurrencyDecimal)';
  }
}

/// @nodoc
abstract mixin class _$ChargeDetailsCopyWith<$Res>
    implements $ChargeDetailsCopyWith<$Res> {
  factory _$ChargeDetailsCopyWith(
          _ChargeDetails value, $Res Function(_ChargeDetails) _then) =
      __$ChargeDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "CorrorgCode") String? corrorgCode,
      @JsonKey(name: "CurCode") String? curCode,
      @JsonKey(name: "ServiceCode") String? serviceCode,
      @JsonKey(name: "FcyAmount") double? fcyAmount,
      @JsonKey(name: "Rate") double? rate,
      @JsonKey(name: "DivisionRate") double? divisionRate,
      @JsonKey(name: "LcyAmount") double? lcyAmount,
      @JsonKey(name: "Commission") double? commission,
      @JsonKey(name: "BankChargesFcy") double? bankChargesFcy,
      @JsonKey(name: "BankChargesLcy") double? bankChargesLcy,
      @JsonKey(name: "Discounts") double? discounts,
      @JsonKey(name: "NetAmount") double? netAmount,
      @JsonKey(name: "Tax") double? tax,
      @JsonKey(name: "BranchCost") double? branchCost,
      @JsonKey(name: "CurrencyDecimal") int? currencyDecimal,
      @JsonKey(name: "FxCurrencyDecimal") int? fxCurrencyDecimal});
}

/// @nodoc
class __$ChargeDetailsCopyWithImpl<$Res>
    implements _$ChargeDetailsCopyWith<$Res> {
  __$ChargeDetailsCopyWithImpl(this._self, this._then);

  final _ChargeDetails _self;
  final $Res Function(_ChargeDetails) _then;

  /// Create a copy of ChargeDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? corrorgCode = freezed,
    Object? curCode = freezed,
    Object? serviceCode = freezed,
    Object? fcyAmount = freezed,
    Object? rate = freezed,
    Object? divisionRate = freezed,
    Object? lcyAmount = freezed,
    Object? commission = freezed,
    Object? bankChargesFcy = freezed,
    Object? bankChargesLcy = freezed,
    Object? discounts = freezed,
    Object? netAmount = freezed,
    Object? tax = freezed,
    Object? branchCost = freezed,
    Object? currencyDecimal = freezed,
    Object? fxCurrencyDecimal = freezed,
  }) {
    return _then(_ChargeDetails(
      corrorgCode: freezed == corrorgCode
          ? _self.corrorgCode
          : corrorgCode // ignore: cast_nullable_to_non_nullable
              as String?,
      curCode: freezed == curCode
          ? _self.curCode
          : curCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCode: freezed == serviceCode
          ? _self.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fcyAmount: freezed == fcyAmount
          ? _self.fcyAmount
          : fcyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      rate: freezed == rate
          ? _self.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      divisionRate: freezed == divisionRate
          ? _self.divisionRate
          : divisionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      lcyAmount: freezed == lcyAmount
          ? _self.lcyAmount
          : lcyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      commission: freezed == commission
          ? _self.commission
          : commission // ignore: cast_nullable_to_non_nullable
              as double?,
      bankChargesFcy: freezed == bankChargesFcy
          ? _self.bankChargesFcy
          : bankChargesFcy // ignore: cast_nullable_to_non_nullable
              as double?,
      bankChargesLcy: freezed == bankChargesLcy
          ? _self.bankChargesLcy
          : bankChargesLcy // ignore: cast_nullable_to_non_nullable
              as double?,
      discounts: freezed == discounts
          ? _self.discounts
          : discounts // ignore: cast_nullable_to_non_nullable
              as double?,
      netAmount: freezed == netAmount
          ? _self.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _self.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      branchCost: freezed == branchCost
          ? _self.branchCost
          : branchCost // ignore: cast_nullable_to_non_nullable
              as double?,
      currencyDecimal: freezed == currencyDecimal
          ? _self.currencyDecimal
          : currencyDecimal // ignore: cast_nullable_to_non_nullable
              as int?,
      fxCurrencyDecimal: freezed == fxCurrencyDecimal
          ? _self.fxCurrencyDecimal
          : fxCurrencyDecimal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$CustomMessageDetails {
  @JsonKey(name: "MessageCode")
  String? get messageCode;
  @JsonKey(name: "MessageType")
  String? get messageType;
  @JsonKey(name: "MessageHeader")
  String? get messageHeader;
  @JsonKey(name: "MessageDescription")
  String? get messageDescription;

  /// Create a copy of CustomMessageDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsCopyWith<CustomMessageDetails> get copyWith =>
      _$CustomMessageDetailsCopyWithImpl<CustomMessageDetails>(
          this as CustomMessageDetails, _$identity);

  /// Serializes this CustomMessageDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomMessageDetails &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.messageHeader, messageHeader) ||
                other.messageHeader == messageHeader) &&
            (identical(other.messageDescription, messageDescription) ||
                other.messageDescription == messageDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, messageCode, messageType, messageHeader, messageDescription);

  @override
  String toString() {
    return 'CustomMessageDetails(messageCode: $messageCode, messageType: $messageType, messageHeader: $messageHeader, messageDescription: $messageDescription)';
  }
}

/// @nodoc
abstract mixin class $CustomMessageDetailsCopyWith<$Res> {
  factory $CustomMessageDetailsCopyWith(CustomMessageDetails value,
          $Res Function(CustomMessageDetails) _then) =
      _$CustomMessageDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "MessageCode") String? messageCode,
      @JsonKey(name: "MessageType") String? messageType,
      @JsonKey(name: "MessageHeader") String? messageHeader,
      @JsonKey(name: "MessageDescription") String? messageDescription});
}

/// @nodoc
class _$CustomMessageDetailsCopyWithImpl<$Res>
    implements $CustomMessageDetailsCopyWith<$Res> {
  _$CustomMessageDetailsCopyWithImpl(this._self, this._then);

  final CustomMessageDetails _self;
  final $Res Function(CustomMessageDetails) _then;

  /// Create a copy of CustomMessageDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageCode = freezed,
    Object? messageType = freezed,
    Object? messageHeader = freezed,
    Object? messageDescription = freezed,
  }) {
    return _then(_self.copyWith(
      messageCode: freezed == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: freezed == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String?,
      messageHeader: freezed == messageHeader
          ? _self.messageHeader
          : messageHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      messageDescription: freezed == messageDescription
          ? _self.messageDescription
          : messageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomMessageDetails].
extension CustomMessageDetailsPatterns on CustomMessageDetails {
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
    TResult Function(_CustomMessageDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails() when $default != null:
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
    TResult Function(_CustomMessageDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails():
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
    TResult? Function(_CustomMessageDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails() when $default != null:
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
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageType") String? messageType,
            @JsonKey(name: "MessageHeader") String? messageHeader,
            @JsonKey(name: "MessageDescription") String? messageDescription)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails() when $default != null:
        return $default(_that.messageCode, _that.messageType,
            _that.messageHeader, _that.messageDescription);
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
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageType") String? messageType,
            @JsonKey(name: "MessageHeader") String? messageHeader,
            @JsonKey(name: "MessageDescription") String? messageDescription)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails():
        return $default(_that.messageCode, _that.messageType,
            _that.messageHeader, _that.messageDescription);
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
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageType") String? messageType,
            @JsonKey(name: "MessageHeader") String? messageHeader,
            @JsonKey(name: "MessageDescription") String? messageDescription)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails() when $default != null:
        return $default(_that.messageCode, _that.messageType,
            _that.messageHeader, _that.messageDescription);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomMessageDetails implements CustomMessageDetails {
  const _CustomMessageDetails(
      {@JsonKey(name: "MessageCode") this.messageCode,
      @JsonKey(name: "MessageType") this.messageType,
      @JsonKey(name: "MessageHeader") this.messageHeader,
      @JsonKey(name: "MessageDescription") this.messageDescription});
  factory _CustomMessageDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageDetailsFromJson(json);

  @override
  @JsonKey(name: "MessageCode")
  final String? messageCode;
  @override
  @JsonKey(name: "MessageType")
  final String? messageType;
  @override
  @JsonKey(name: "MessageHeader")
  final String? messageHeader;
  @override
  @JsonKey(name: "MessageDescription")
  final String? messageDescription;

  /// Create a copy of CustomMessageDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomMessageDetailsCopyWith<_CustomMessageDetails> get copyWith =>
      __$CustomMessageDetailsCopyWithImpl<_CustomMessageDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomMessageDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomMessageDetails &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.messageHeader, messageHeader) ||
                other.messageHeader == messageHeader) &&
            (identical(other.messageDescription, messageDescription) ||
                other.messageDescription == messageDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, messageCode, messageType, messageHeader, messageDescription);

  @override
  String toString() {
    return 'CustomMessageDetails(messageCode: $messageCode, messageType: $messageType, messageHeader: $messageHeader, messageDescription: $messageDescription)';
  }
}

/// @nodoc
abstract mixin class _$CustomMessageDetailsCopyWith<$Res>
    implements $CustomMessageDetailsCopyWith<$Res> {
  factory _$CustomMessageDetailsCopyWith(_CustomMessageDetails value,
          $Res Function(_CustomMessageDetails) _then) =
      __$CustomMessageDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "MessageCode") String? messageCode,
      @JsonKey(name: "MessageType") String? messageType,
      @JsonKey(name: "MessageHeader") String? messageHeader,
      @JsonKey(name: "MessageDescription") String? messageDescription});
}

/// @nodoc
class __$CustomMessageDetailsCopyWithImpl<$Res>
    implements _$CustomMessageDetailsCopyWith<$Res> {
  __$CustomMessageDetailsCopyWithImpl(this._self, this._then);

  final _CustomMessageDetails _self;
  final $Res Function(_CustomMessageDetails) _then;

  /// Create a copy of CustomMessageDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messageCode = freezed,
    Object? messageType = freezed,
    Object? messageHeader = freezed,
    Object? messageDescription = freezed,
  }) {
    return _then(_CustomMessageDetails(
      messageCode: freezed == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: freezed == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String?,
      messageHeader: freezed == messageHeader
          ? _self.messageHeader
          : messageHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      messageDescription: freezed == messageDescription
          ? _self.messageDescription
          : messageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
