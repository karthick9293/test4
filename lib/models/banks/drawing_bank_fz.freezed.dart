// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drawing_bank_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DrawingBankFz {
  @JsonKey(name: 'BankCode')
  String get bankCode;
  @JsonKey(name: 'BankName')
  String get bankName;
  @JsonKey(name: 'BankAccountNumber')
  List<PayAccountNumberFZ> get payAccountNumbers;

  /// Create a copy of DrawingBankFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DrawingBankFzCopyWith<DrawingBankFz> get copyWith =>
      _$DrawingBankFzCopyWithImpl<DrawingBankFz>(
          this as DrawingBankFz, _$identity);

  /// Serializes this DrawingBankFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DrawingBankFz &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            const DeepCollectionEquality()
                .equals(other.payAccountNumbers, payAccountNumbers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bankCode, bankName,
      const DeepCollectionEquality().hash(payAccountNumbers));

  @override
  String toString() {
    return 'DrawingBankFz(bankCode: $bankCode, bankName: $bankName, payAccountNumbers: $payAccountNumbers)';
  }
}

/// @nodoc
abstract mixin class $DrawingBankFzCopyWith<$Res> {
  factory $DrawingBankFzCopyWith(
          DrawingBankFz value, $Res Function(DrawingBankFz) _then) =
      _$DrawingBankFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'BankCode') String bankCode,
      @JsonKey(name: 'BankName') String bankName,
      @JsonKey(name: 'BankAccountNumber')
      List<PayAccountNumberFZ> payAccountNumbers});
}

/// @nodoc
class _$DrawingBankFzCopyWithImpl<$Res>
    implements $DrawingBankFzCopyWith<$Res> {
  _$DrawingBankFzCopyWithImpl(this._self, this._then);

  final DrawingBankFz _self;
  final $Res Function(DrawingBankFz) _then;

  /// Create a copy of DrawingBankFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankCode = null,
    Object? bankName = null,
    Object? payAccountNumbers = null,
  }) {
    return _then(_self.copyWith(
      bankCode: null == bankCode
          ? _self.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      payAccountNumbers: null == payAccountNumbers
          ? _self.payAccountNumbers
          : payAccountNumbers // ignore: cast_nullable_to_non_nullable
              as List<PayAccountNumberFZ>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DrawingBankFz].
extension DrawingBankFzPatterns on DrawingBankFz {
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
    TResult Function(_DrawingBankFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrawingBankFz() when $default != null:
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
    TResult Function(_DrawingBankFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrawingBankFz():
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
    TResult? Function(_DrawingBankFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrawingBankFz() when $default != null:
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
            @JsonKey(name: 'BankCode') String bankCode,
            @JsonKey(name: 'BankName') String bankName,
            @JsonKey(name: 'BankAccountNumber')
            List<PayAccountNumberFZ> payAccountNumbers)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DrawingBankFz() when $default != null:
        return $default(
            _that.bankCode, _that.bankName, _that.payAccountNumbers);
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
            @JsonKey(name: 'BankCode') String bankCode,
            @JsonKey(name: 'BankName') String bankName,
            @JsonKey(name: 'BankAccountNumber')
            List<PayAccountNumberFZ> payAccountNumbers)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrawingBankFz():
        return $default(
            _that.bankCode, _that.bankName, _that.payAccountNumbers);
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
            @JsonKey(name: 'BankCode') String bankCode,
            @JsonKey(name: 'BankName') String bankName,
            @JsonKey(name: 'BankAccountNumber')
            List<PayAccountNumberFZ> payAccountNumbers)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DrawingBankFz() when $default != null:
        return $default(
            _that.bankCode, _that.bankName, _that.payAccountNumbers);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DrawingBankFz implements DrawingBankFz {
  const _DrawingBankFz(
      {@JsonKey(name: 'BankCode') this.bankCode = '',
      @JsonKey(name: 'BankName') this.bankName = '',
      @JsonKey(name: 'BankAccountNumber')
      final List<PayAccountNumberFZ> payAccountNumbers = const []})
      : _payAccountNumbers = payAccountNumbers;
  factory _DrawingBankFz.fromJson(Map<String, dynamic> json) =>
      _$DrawingBankFzFromJson(json);

  @override
  @JsonKey(name: 'BankCode')
  final String bankCode;
  @override
  @JsonKey(name: 'BankName')
  final String bankName;
  final List<PayAccountNumberFZ> _payAccountNumbers;
  @override
  @JsonKey(name: 'BankAccountNumber')
  List<PayAccountNumberFZ> get payAccountNumbers {
    if (_payAccountNumbers is EqualUnmodifiableListView)
      return _payAccountNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payAccountNumbers);
  }

  /// Create a copy of DrawingBankFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DrawingBankFzCopyWith<_DrawingBankFz> get copyWith =>
      __$DrawingBankFzCopyWithImpl<_DrawingBankFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DrawingBankFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrawingBankFz &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            const DeepCollectionEquality()
                .equals(other._payAccountNumbers, _payAccountNumbers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bankCode, bankName,
      const DeepCollectionEquality().hash(_payAccountNumbers));

  @override
  String toString() {
    return 'DrawingBankFz(bankCode: $bankCode, bankName: $bankName, payAccountNumbers: $payAccountNumbers)';
  }
}

/// @nodoc
abstract mixin class _$DrawingBankFzCopyWith<$Res>
    implements $DrawingBankFzCopyWith<$Res> {
  factory _$DrawingBankFzCopyWith(
          _DrawingBankFz value, $Res Function(_DrawingBankFz) _then) =
      __$DrawingBankFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'BankCode') String bankCode,
      @JsonKey(name: 'BankName') String bankName,
      @JsonKey(name: 'BankAccountNumber')
      List<PayAccountNumberFZ> payAccountNumbers});
}

/// @nodoc
class __$DrawingBankFzCopyWithImpl<$Res>
    implements _$DrawingBankFzCopyWith<$Res> {
  __$DrawingBankFzCopyWithImpl(this._self, this._then);

  final _DrawingBankFz _self;
  final $Res Function(_DrawingBankFz) _then;

  /// Create a copy of DrawingBankFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bankCode = null,
    Object? bankName = null,
    Object? payAccountNumbers = null,
  }) {
    return _then(_DrawingBankFz(
      bankCode: null == bankCode
          ? _self.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      payAccountNumbers: null == payAccountNumbers
          ? _self._payAccountNumbers
          : payAccountNumbers // ignore: cast_nullable_to_non_nullable
              as List<PayAccountNumberFZ>,
    ));
  }
}

/// @nodoc
mixin _$PayAccountNumberFZ {
  @JsonKey(name: 'BankAccountNumber')
  String get accountNumber;

  /// Create a copy of PayAccountNumberFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayAccountNumberFZCopyWith<PayAccountNumberFZ> get copyWith =>
      _$PayAccountNumberFZCopyWithImpl<PayAccountNumberFZ>(
          this as PayAccountNumberFZ, _$identity);

  /// Serializes this PayAccountNumberFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PayAccountNumberFZ &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountNumber);

  @override
  String toString() {
    return 'PayAccountNumberFZ(accountNumber: $accountNumber)';
  }
}

/// @nodoc
abstract mixin class $PayAccountNumberFZCopyWith<$Res> {
  factory $PayAccountNumberFZCopyWith(
          PayAccountNumberFZ value, $Res Function(PayAccountNumberFZ) _then) =
      _$PayAccountNumberFZCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'BankAccountNumber') String accountNumber});
}

/// @nodoc
class _$PayAccountNumberFZCopyWithImpl<$Res>
    implements $PayAccountNumberFZCopyWith<$Res> {
  _$PayAccountNumberFZCopyWithImpl(this._self, this._then);

  final PayAccountNumberFZ _self;
  final $Res Function(PayAccountNumberFZ) _then;

  /// Create a copy of PayAccountNumberFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountNumber = null,
  }) {
    return _then(_self.copyWith(
      accountNumber: null == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PayAccountNumberFZ].
extension PayAccountNumberFZPatterns on PayAccountNumberFZ {
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
    TResult Function(_PayAccountNumberFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayAccountNumberFZ() when $default != null:
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
    TResult Function(_PayAccountNumberFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayAccountNumberFZ():
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
    TResult? Function(_PayAccountNumberFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayAccountNumberFZ() when $default != null:
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
    TResult Function(@JsonKey(name: 'BankAccountNumber') String accountNumber)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PayAccountNumberFZ() when $default != null:
        return $default(_that.accountNumber);
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
    TResult Function(@JsonKey(name: 'BankAccountNumber') String accountNumber)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayAccountNumberFZ():
        return $default(_that.accountNumber);
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
    TResult? Function(@JsonKey(name: 'BankAccountNumber') String accountNumber)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PayAccountNumberFZ() when $default != null:
        return $default(_that.accountNumber);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PayAccountNumberFZ implements PayAccountNumberFZ {
  const _PayAccountNumberFZ(
      {@JsonKey(name: 'BankAccountNumber') this.accountNumber = ''});
  factory _PayAccountNumberFZ.fromJson(Map<String, dynamic> json) =>
      _$PayAccountNumberFZFromJson(json);

  @override
  @JsonKey(name: 'BankAccountNumber')
  final String accountNumber;

  /// Create a copy of PayAccountNumberFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PayAccountNumberFZCopyWith<_PayAccountNumberFZ> get copyWith =>
      __$PayAccountNumberFZCopyWithImpl<_PayAccountNumberFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PayAccountNumberFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PayAccountNumberFZ &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountNumber);

  @override
  String toString() {
    return 'PayAccountNumberFZ(accountNumber: $accountNumber)';
  }
}

/// @nodoc
abstract mixin class _$PayAccountNumberFZCopyWith<$Res>
    implements $PayAccountNumberFZCopyWith<$Res> {
  factory _$PayAccountNumberFZCopyWith(
          _PayAccountNumberFZ value, $Res Function(_PayAccountNumberFZ) _then) =
      __$PayAccountNumberFZCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'BankAccountNumber') String accountNumber});
}

/// @nodoc
class __$PayAccountNumberFZCopyWithImpl<$Res>
    implements _$PayAccountNumberFZCopyWith<$Res> {
  __$PayAccountNumberFZCopyWithImpl(this._self, this._then);

  final _PayAccountNumberFZ _self;
  final $Res Function(_PayAccountNumberFZ) _then;

  /// Create a copy of PayAccountNumberFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accountNumber = null,
  }) {
    return _then(_PayAccountNumberFZ(
      accountNumber: null == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
