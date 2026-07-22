// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rate_calculator_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateCalculatorFz {
  @JsonKey(name: "CurrencyCode")
  String? get currencyCode;
  @JsonKey(name: "SellMultiplicationRate")
  double? get sellMultiplicationRate;
  @JsonKey(name: "SellDivisionRate")
  double? get sellDivisionRate;
  @JsonKey(name: "BuyMultiplicationRate")
  double? get buyMultiplicationRate;
  @JsonKey(name: "BuyDivisionRate")
  double? get buyDivisionRate;
  @JsonKey(name: "Factor")
  String? get factor;
  @JsonKey(name: "MaskMultiplication")
  String? get maskMultiplication;
  @JsonKey(name: "MaskDivision")
  String? get maskDivision;
  @JsonKey(name: "FcyAmount")
  double? get fcyAmount;
  @JsonKey(name: "LcyAmount")
  double? get lcyAmount;
  @JsonKey(name: "FcyCurrencyDecimal")
  double? get fcyCurrencyDecimal;
  @JsonKey(name: "LcyCurrencyDecimal")
  double? get lcyCurrencyDecimal;
  @JsonKey(name: "BranchZoneType")
  dynamic get branchZoneType;
  @JsonKey(name: "ActivityCode")
  dynamic get activityCode;

  /// Create a copy of RateCalculatorFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RateCalculatorFzCopyWith<RateCalculatorFz> get copyWith =>
      _$RateCalculatorFzCopyWithImpl<RateCalculatorFz>(
          this as RateCalculatorFz, _$identity);

  /// Serializes this RateCalculatorFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RateCalculatorFz &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.sellMultiplicationRate, sellMultiplicationRate) ||
                other.sellMultiplicationRate == sellMultiplicationRate) &&
            (identical(other.sellDivisionRate, sellDivisionRate) ||
                other.sellDivisionRate == sellDivisionRate) &&
            (identical(other.buyMultiplicationRate, buyMultiplicationRate) ||
                other.buyMultiplicationRate == buyMultiplicationRate) &&
            (identical(other.buyDivisionRate, buyDivisionRate) ||
                other.buyDivisionRate == buyDivisionRate) &&
            (identical(other.factor, factor) || other.factor == factor) &&
            (identical(other.maskMultiplication, maskMultiplication) ||
                other.maskMultiplication == maskMultiplication) &&
            (identical(other.maskDivision, maskDivision) ||
                other.maskDivision == maskDivision) &&
            (identical(other.fcyAmount, fcyAmount) ||
                other.fcyAmount == fcyAmount) &&
            (identical(other.lcyAmount, lcyAmount) ||
                other.lcyAmount == lcyAmount) &&
            (identical(other.fcyCurrencyDecimal, fcyCurrencyDecimal) ||
                other.fcyCurrencyDecimal == fcyCurrencyDecimal) &&
            (identical(other.lcyCurrencyDecimal, lcyCurrencyDecimal) ||
                other.lcyCurrencyDecimal == lcyCurrencyDecimal) &&
            const DeepCollectionEquality()
                .equals(other.branchZoneType, branchZoneType) &&
            const DeepCollectionEquality()
                .equals(other.activityCode, activityCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currencyCode,
      sellMultiplicationRate,
      sellDivisionRate,
      buyMultiplicationRate,
      buyDivisionRate,
      factor,
      maskMultiplication,
      maskDivision,
      fcyAmount,
      lcyAmount,
      fcyCurrencyDecimal,
      lcyCurrencyDecimal,
      const DeepCollectionEquality().hash(branchZoneType),
      const DeepCollectionEquality().hash(activityCode));

  @override
  String toString() {
    return 'RateCalculatorFz(currencyCode: $currencyCode, sellMultiplicationRate: $sellMultiplicationRate, sellDivisionRate: $sellDivisionRate, buyMultiplicationRate: $buyMultiplicationRate, buyDivisionRate: $buyDivisionRate, factor: $factor, maskMultiplication: $maskMultiplication, maskDivision: $maskDivision, fcyAmount: $fcyAmount, lcyAmount: $lcyAmount, fcyCurrencyDecimal: $fcyCurrencyDecimal, lcyCurrencyDecimal: $lcyCurrencyDecimal, branchZoneType: $branchZoneType, activityCode: $activityCode)';
  }
}

/// @nodoc
abstract mixin class $RateCalculatorFzCopyWith<$Res> {
  factory $RateCalculatorFzCopyWith(
          RateCalculatorFz value, $Res Function(RateCalculatorFz) _then) =
      _$RateCalculatorFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "CurrencyCode") String? currencyCode,
      @JsonKey(name: "SellMultiplicationRate") double? sellMultiplicationRate,
      @JsonKey(name: "SellDivisionRate") double? sellDivisionRate,
      @JsonKey(name: "BuyMultiplicationRate") double? buyMultiplicationRate,
      @JsonKey(name: "BuyDivisionRate") double? buyDivisionRate,
      @JsonKey(name: "Factor") String? factor,
      @JsonKey(name: "MaskMultiplication") String? maskMultiplication,
      @JsonKey(name: "MaskDivision") String? maskDivision,
      @JsonKey(name: "FcyAmount") double? fcyAmount,
      @JsonKey(name: "LcyAmount") double? lcyAmount,
      @JsonKey(name: "FcyCurrencyDecimal") double? fcyCurrencyDecimal,
      @JsonKey(name: "LcyCurrencyDecimal") double? lcyCurrencyDecimal,
      @JsonKey(name: "BranchZoneType") dynamic branchZoneType,
      @JsonKey(name: "ActivityCode") dynamic activityCode});
}

/// @nodoc
class _$RateCalculatorFzCopyWithImpl<$Res>
    implements $RateCalculatorFzCopyWith<$Res> {
  _$RateCalculatorFzCopyWithImpl(this._self, this._then);

  final RateCalculatorFz _self;
  final $Res Function(RateCalculatorFz) _then;

  /// Create a copy of RateCalculatorFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyCode = freezed,
    Object? sellMultiplicationRate = freezed,
    Object? sellDivisionRate = freezed,
    Object? buyMultiplicationRate = freezed,
    Object? buyDivisionRate = freezed,
    Object? factor = freezed,
    Object? maskMultiplication = freezed,
    Object? maskDivision = freezed,
    Object? fcyAmount = freezed,
    Object? lcyAmount = freezed,
    Object? fcyCurrencyDecimal = freezed,
    Object? lcyCurrencyDecimal = freezed,
    Object? branchZoneType = freezed,
    Object? activityCode = freezed,
  }) {
    return _then(_self.copyWith(
      currencyCode: freezed == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      sellMultiplicationRate: freezed == sellMultiplicationRate
          ? _self.sellMultiplicationRate
          : sellMultiplicationRate // ignore: cast_nullable_to_non_nullable
              as double?,
      sellDivisionRate: freezed == sellDivisionRate
          ? _self.sellDivisionRate
          : sellDivisionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      buyMultiplicationRate: freezed == buyMultiplicationRate
          ? _self.buyMultiplicationRate
          : buyMultiplicationRate // ignore: cast_nullable_to_non_nullable
              as double?,
      buyDivisionRate: freezed == buyDivisionRate
          ? _self.buyDivisionRate
          : buyDivisionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      factor: freezed == factor
          ? _self.factor
          : factor // ignore: cast_nullable_to_non_nullable
              as String?,
      maskMultiplication: freezed == maskMultiplication
          ? _self.maskMultiplication
          : maskMultiplication // ignore: cast_nullable_to_non_nullable
              as String?,
      maskDivision: freezed == maskDivision
          ? _self.maskDivision
          : maskDivision // ignore: cast_nullable_to_non_nullable
              as String?,
      fcyAmount: freezed == fcyAmount
          ? _self.fcyAmount
          : fcyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      lcyAmount: freezed == lcyAmount
          ? _self.lcyAmount
          : lcyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      fcyCurrencyDecimal: freezed == fcyCurrencyDecimal
          ? _self.fcyCurrencyDecimal
          : fcyCurrencyDecimal // ignore: cast_nullable_to_non_nullable
              as double?,
      lcyCurrencyDecimal: freezed == lcyCurrencyDecimal
          ? _self.lcyCurrencyDecimal
          : lcyCurrencyDecimal // ignore: cast_nullable_to_non_nullable
              as double?,
      branchZoneType: freezed == branchZoneType
          ? _self.branchZoneType
          : branchZoneType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activityCode: freezed == activityCode
          ? _self.activityCode
          : activityCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [RateCalculatorFz].
extension RateCalculatorFzPatterns on RateCalculatorFz {
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
    TResult Function(_RateCalculatorFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateCalculatorFz() when $default != null:
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
    TResult Function(_RateCalculatorFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateCalculatorFz():
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
    TResult? Function(_RateCalculatorFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateCalculatorFz() when $default != null:
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
            @JsonKey(name: "CurrencyCode") String? currencyCode,
            @JsonKey(name: "SellMultiplicationRate")
            double? sellMultiplicationRate,
            @JsonKey(name: "SellDivisionRate") double? sellDivisionRate,
            @JsonKey(name: "BuyMultiplicationRate")
            double? buyMultiplicationRate,
            @JsonKey(name: "BuyDivisionRate") double? buyDivisionRate,
            @JsonKey(name: "Factor") String? factor,
            @JsonKey(name: "MaskMultiplication") String? maskMultiplication,
            @JsonKey(name: "MaskDivision") String? maskDivision,
            @JsonKey(name: "FcyAmount") double? fcyAmount,
            @JsonKey(name: "LcyAmount") double? lcyAmount,
            @JsonKey(name: "FcyCurrencyDecimal") double? fcyCurrencyDecimal,
            @JsonKey(name: "LcyCurrencyDecimal") double? lcyCurrencyDecimal,
            @JsonKey(name: "BranchZoneType") dynamic branchZoneType,
            @JsonKey(name: "ActivityCode") dynamic activityCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RateCalculatorFz() when $default != null:
        return $default(
            _that.currencyCode,
            _that.sellMultiplicationRate,
            _that.sellDivisionRate,
            _that.buyMultiplicationRate,
            _that.buyDivisionRate,
            _that.factor,
            _that.maskMultiplication,
            _that.maskDivision,
            _that.fcyAmount,
            _that.lcyAmount,
            _that.fcyCurrencyDecimal,
            _that.lcyCurrencyDecimal,
            _that.branchZoneType,
            _that.activityCode);
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
            @JsonKey(name: "CurrencyCode") String? currencyCode,
            @JsonKey(name: "SellMultiplicationRate")
            double? sellMultiplicationRate,
            @JsonKey(name: "SellDivisionRate") double? sellDivisionRate,
            @JsonKey(name: "BuyMultiplicationRate")
            double? buyMultiplicationRate,
            @JsonKey(name: "BuyDivisionRate") double? buyDivisionRate,
            @JsonKey(name: "Factor") String? factor,
            @JsonKey(name: "MaskMultiplication") String? maskMultiplication,
            @JsonKey(name: "MaskDivision") String? maskDivision,
            @JsonKey(name: "FcyAmount") double? fcyAmount,
            @JsonKey(name: "LcyAmount") double? lcyAmount,
            @JsonKey(name: "FcyCurrencyDecimal") double? fcyCurrencyDecimal,
            @JsonKey(name: "LcyCurrencyDecimal") double? lcyCurrencyDecimal,
            @JsonKey(name: "BranchZoneType") dynamic branchZoneType,
            @JsonKey(name: "ActivityCode") dynamic activityCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateCalculatorFz():
        return $default(
            _that.currencyCode,
            _that.sellMultiplicationRate,
            _that.sellDivisionRate,
            _that.buyMultiplicationRate,
            _that.buyDivisionRate,
            _that.factor,
            _that.maskMultiplication,
            _that.maskDivision,
            _that.fcyAmount,
            _that.lcyAmount,
            _that.fcyCurrencyDecimal,
            _that.lcyCurrencyDecimal,
            _that.branchZoneType,
            _that.activityCode);
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
            @JsonKey(name: "CurrencyCode") String? currencyCode,
            @JsonKey(name: "SellMultiplicationRate")
            double? sellMultiplicationRate,
            @JsonKey(name: "SellDivisionRate") double? sellDivisionRate,
            @JsonKey(name: "BuyMultiplicationRate")
            double? buyMultiplicationRate,
            @JsonKey(name: "BuyDivisionRate") double? buyDivisionRate,
            @JsonKey(name: "Factor") String? factor,
            @JsonKey(name: "MaskMultiplication") String? maskMultiplication,
            @JsonKey(name: "MaskDivision") String? maskDivision,
            @JsonKey(name: "FcyAmount") double? fcyAmount,
            @JsonKey(name: "LcyAmount") double? lcyAmount,
            @JsonKey(name: "FcyCurrencyDecimal") double? fcyCurrencyDecimal,
            @JsonKey(name: "LcyCurrencyDecimal") double? lcyCurrencyDecimal,
            @JsonKey(name: "BranchZoneType") dynamic branchZoneType,
            @JsonKey(name: "ActivityCode") dynamic activityCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RateCalculatorFz() when $default != null:
        return $default(
            _that.currencyCode,
            _that.sellMultiplicationRate,
            _that.sellDivisionRate,
            _that.buyMultiplicationRate,
            _that.buyDivisionRate,
            _that.factor,
            _that.maskMultiplication,
            _that.maskDivision,
            _that.fcyAmount,
            _that.lcyAmount,
            _that.fcyCurrencyDecimal,
            _that.lcyCurrencyDecimal,
            _that.branchZoneType,
            _that.activityCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RateCalculatorFz implements RateCalculatorFz {
  const _RateCalculatorFz(
      {@JsonKey(name: "CurrencyCode") this.currencyCode,
      @JsonKey(name: "SellMultiplicationRate") this.sellMultiplicationRate,
      @JsonKey(name: "SellDivisionRate") this.sellDivisionRate,
      @JsonKey(name: "BuyMultiplicationRate") this.buyMultiplicationRate,
      @JsonKey(name: "BuyDivisionRate") this.buyDivisionRate,
      @JsonKey(name: "Factor") this.factor,
      @JsonKey(name: "MaskMultiplication") this.maskMultiplication,
      @JsonKey(name: "MaskDivision") this.maskDivision,
      @JsonKey(name: "FcyAmount") this.fcyAmount,
      @JsonKey(name: "LcyAmount") this.lcyAmount,
      @JsonKey(name: "FcyCurrencyDecimal") this.fcyCurrencyDecimal,
      @JsonKey(name: "LcyCurrencyDecimal") this.lcyCurrencyDecimal,
      @JsonKey(name: "BranchZoneType") this.branchZoneType,
      @JsonKey(name: "ActivityCode") this.activityCode});
  factory _RateCalculatorFz.fromJson(Map<String, dynamic> json) =>
      _$RateCalculatorFzFromJson(json);

  @override
  @JsonKey(name: "CurrencyCode")
  final String? currencyCode;
  @override
  @JsonKey(name: "SellMultiplicationRate")
  final double? sellMultiplicationRate;
  @override
  @JsonKey(name: "SellDivisionRate")
  final double? sellDivisionRate;
  @override
  @JsonKey(name: "BuyMultiplicationRate")
  final double? buyMultiplicationRate;
  @override
  @JsonKey(name: "BuyDivisionRate")
  final double? buyDivisionRate;
  @override
  @JsonKey(name: "Factor")
  final String? factor;
  @override
  @JsonKey(name: "MaskMultiplication")
  final String? maskMultiplication;
  @override
  @JsonKey(name: "MaskDivision")
  final String? maskDivision;
  @override
  @JsonKey(name: "FcyAmount")
  final double? fcyAmount;
  @override
  @JsonKey(name: "LcyAmount")
  final double? lcyAmount;
  @override
  @JsonKey(name: "FcyCurrencyDecimal")
  final double? fcyCurrencyDecimal;
  @override
  @JsonKey(name: "LcyCurrencyDecimal")
  final double? lcyCurrencyDecimal;
  @override
  @JsonKey(name: "BranchZoneType")
  final dynamic branchZoneType;
  @override
  @JsonKey(name: "ActivityCode")
  final dynamic activityCode;

  /// Create a copy of RateCalculatorFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RateCalculatorFzCopyWith<_RateCalculatorFz> get copyWith =>
      __$RateCalculatorFzCopyWithImpl<_RateCalculatorFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RateCalculatorFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RateCalculatorFz &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.sellMultiplicationRate, sellMultiplicationRate) ||
                other.sellMultiplicationRate == sellMultiplicationRate) &&
            (identical(other.sellDivisionRate, sellDivisionRate) ||
                other.sellDivisionRate == sellDivisionRate) &&
            (identical(other.buyMultiplicationRate, buyMultiplicationRate) ||
                other.buyMultiplicationRate == buyMultiplicationRate) &&
            (identical(other.buyDivisionRate, buyDivisionRate) ||
                other.buyDivisionRate == buyDivisionRate) &&
            (identical(other.factor, factor) || other.factor == factor) &&
            (identical(other.maskMultiplication, maskMultiplication) ||
                other.maskMultiplication == maskMultiplication) &&
            (identical(other.maskDivision, maskDivision) ||
                other.maskDivision == maskDivision) &&
            (identical(other.fcyAmount, fcyAmount) ||
                other.fcyAmount == fcyAmount) &&
            (identical(other.lcyAmount, lcyAmount) ||
                other.lcyAmount == lcyAmount) &&
            (identical(other.fcyCurrencyDecimal, fcyCurrencyDecimal) ||
                other.fcyCurrencyDecimal == fcyCurrencyDecimal) &&
            (identical(other.lcyCurrencyDecimal, lcyCurrencyDecimal) ||
                other.lcyCurrencyDecimal == lcyCurrencyDecimal) &&
            const DeepCollectionEquality()
                .equals(other.branchZoneType, branchZoneType) &&
            const DeepCollectionEquality()
                .equals(other.activityCode, activityCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currencyCode,
      sellMultiplicationRate,
      sellDivisionRate,
      buyMultiplicationRate,
      buyDivisionRate,
      factor,
      maskMultiplication,
      maskDivision,
      fcyAmount,
      lcyAmount,
      fcyCurrencyDecimal,
      lcyCurrencyDecimal,
      const DeepCollectionEquality().hash(branchZoneType),
      const DeepCollectionEquality().hash(activityCode));

  @override
  String toString() {
    return 'RateCalculatorFz(currencyCode: $currencyCode, sellMultiplicationRate: $sellMultiplicationRate, sellDivisionRate: $sellDivisionRate, buyMultiplicationRate: $buyMultiplicationRate, buyDivisionRate: $buyDivisionRate, factor: $factor, maskMultiplication: $maskMultiplication, maskDivision: $maskDivision, fcyAmount: $fcyAmount, lcyAmount: $lcyAmount, fcyCurrencyDecimal: $fcyCurrencyDecimal, lcyCurrencyDecimal: $lcyCurrencyDecimal, branchZoneType: $branchZoneType, activityCode: $activityCode)';
  }
}

/// @nodoc
abstract mixin class _$RateCalculatorFzCopyWith<$Res>
    implements $RateCalculatorFzCopyWith<$Res> {
  factory _$RateCalculatorFzCopyWith(
          _RateCalculatorFz value, $Res Function(_RateCalculatorFz) _then) =
      __$RateCalculatorFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "CurrencyCode") String? currencyCode,
      @JsonKey(name: "SellMultiplicationRate") double? sellMultiplicationRate,
      @JsonKey(name: "SellDivisionRate") double? sellDivisionRate,
      @JsonKey(name: "BuyMultiplicationRate") double? buyMultiplicationRate,
      @JsonKey(name: "BuyDivisionRate") double? buyDivisionRate,
      @JsonKey(name: "Factor") String? factor,
      @JsonKey(name: "MaskMultiplication") String? maskMultiplication,
      @JsonKey(name: "MaskDivision") String? maskDivision,
      @JsonKey(name: "FcyAmount") double? fcyAmount,
      @JsonKey(name: "LcyAmount") double? lcyAmount,
      @JsonKey(name: "FcyCurrencyDecimal") double? fcyCurrencyDecimal,
      @JsonKey(name: "LcyCurrencyDecimal") double? lcyCurrencyDecimal,
      @JsonKey(name: "BranchZoneType") dynamic branchZoneType,
      @JsonKey(name: "ActivityCode") dynamic activityCode});
}

/// @nodoc
class __$RateCalculatorFzCopyWithImpl<$Res>
    implements _$RateCalculatorFzCopyWith<$Res> {
  __$RateCalculatorFzCopyWithImpl(this._self, this._then);

  final _RateCalculatorFz _self;
  final $Res Function(_RateCalculatorFz) _then;

  /// Create a copy of RateCalculatorFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currencyCode = freezed,
    Object? sellMultiplicationRate = freezed,
    Object? sellDivisionRate = freezed,
    Object? buyMultiplicationRate = freezed,
    Object? buyDivisionRate = freezed,
    Object? factor = freezed,
    Object? maskMultiplication = freezed,
    Object? maskDivision = freezed,
    Object? fcyAmount = freezed,
    Object? lcyAmount = freezed,
    Object? fcyCurrencyDecimal = freezed,
    Object? lcyCurrencyDecimal = freezed,
    Object? branchZoneType = freezed,
    Object? activityCode = freezed,
  }) {
    return _then(_RateCalculatorFz(
      currencyCode: freezed == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      sellMultiplicationRate: freezed == sellMultiplicationRate
          ? _self.sellMultiplicationRate
          : sellMultiplicationRate // ignore: cast_nullable_to_non_nullable
              as double?,
      sellDivisionRate: freezed == sellDivisionRate
          ? _self.sellDivisionRate
          : sellDivisionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      buyMultiplicationRate: freezed == buyMultiplicationRate
          ? _self.buyMultiplicationRate
          : buyMultiplicationRate // ignore: cast_nullable_to_non_nullable
              as double?,
      buyDivisionRate: freezed == buyDivisionRate
          ? _self.buyDivisionRate
          : buyDivisionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      factor: freezed == factor
          ? _self.factor
          : factor // ignore: cast_nullable_to_non_nullable
              as String?,
      maskMultiplication: freezed == maskMultiplication
          ? _self.maskMultiplication
          : maskMultiplication // ignore: cast_nullable_to_non_nullable
              as String?,
      maskDivision: freezed == maskDivision
          ? _self.maskDivision
          : maskDivision // ignore: cast_nullable_to_non_nullable
              as String?,
      fcyAmount: freezed == fcyAmount
          ? _self.fcyAmount
          : fcyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      lcyAmount: freezed == lcyAmount
          ? _self.lcyAmount
          : lcyAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      fcyCurrencyDecimal: freezed == fcyCurrencyDecimal
          ? _self.fcyCurrencyDecimal
          : fcyCurrencyDecimal // ignore: cast_nullable_to_non_nullable
              as double?,
      lcyCurrencyDecimal: freezed == lcyCurrencyDecimal
          ? _self.lcyCurrencyDecimal
          : lcyCurrencyDecimal // ignore: cast_nullable_to_non_nullable
              as double?,
      branchZoneType: freezed == branchZoneType
          ? _self.branchZoneType
          : branchZoneType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activityCode: freezed == activityCode
          ? _self.activityCode
          : activityCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
