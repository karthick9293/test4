// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_mode_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMode {
  @JsonKey(name: 'Code', readValue: _readCode)
  String? get type;
  @JsonKey(name: 'CodeName', readValue: _readName)
  String? get description;
  @JsonKey(name: "PaymentModeImage")
  String? get paymentModeImage;
  @JsonKey(name: "PaymentModeKey")
  String? get paymentModeKey;
  @JsonKey(name: "Status")
  String? get status;

  /// Create a copy of PaymentMode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentModeCopyWith<PaymentMode> get copyWith =>
      _$PaymentModeCopyWithImpl<PaymentMode>(this as PaymentMode, _$identity);

  /// Serializes this PaymentMode to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentMode &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paymentModeImage, paymentModeImage) ||
                other.paymentModeImage == paymentModeImage) &&
            (identical(other.paymentModeKey, paymentModeKey) ||
                other.paymentModeKey == paymentModeKey) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, description, paymentModeImage, paymentModeKey, status);

  @override
  String toString() {
    return 'PaymentMode(type: $type, description: $description, paymentModeImage: $paymentModeImage, paymentModeKey: $paymentModeKey, status: $status)';
  }
}

/// @nodoc
abstract mixin class $PaymentModeCopyWith<$Res> {
  factory $PaymentModeCopyWith(
          PaymentMode value, $Res Function(PaymentMode) _then) =
      _$PaymentModeCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Code', readValue: _readCode) String? type,
      @JsonKey(name: 'CodeName', readValue: _readName) String? description,
      @JsonKey(name: "PaymentModeImage") String? paymentModeImage,
      @JsonKey(name: "PaymentModeKey") String? paymentModeKey,
      @JsonKey(name: "Status") String? status});
}

/// @nodoc
class _$PaymentModeCopyWithImpl<$Res> implements $PaymentModeCopyWith<$Res> {
  _$PaymentModeCopyWithImpl(this._self, this._then);

  final PaymentMode _self;
  final $Res Function(PaymentMode) _then;

  /// Create a copy of PaymentMode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? description = freezed,
    Object? paymentModeImage = freezed,
    Object? paymentModeKey = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentModeImage: freezed == paymentModeImage
          ? _self.paymentModeImage
          : paymentModeImage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentModeKey: freezed == paymentModeKey
          ? _self.paymentModeKey
          : paymentModeKey // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaymentMode].
extension PaymentModePatterns on PaymentMode {
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
    TResult Function(_PaymentMode value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentMode() when $default != null:
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
    TResult Function(_PaymentMode value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMode():
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
    TResult? Function(_PaymentMode value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMode() when $default != null:
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
            @JsonKey(name: 'Code', readValue: _readCode) String? type,
            @JsonKey(name: 'CodeName', readValue: _readName)
            String? description,
            @JsonKey(name: "PaymentModeImage") String? paymentModeImage,
            @JsonKey(name: "PaymentModeKey") String? paymentModeKey,
            @JsonKey(name: "Status") String? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentMode() when $default != null:
        return $default(_that.type, _that.description, _that.paymentModeImage,
            _that.paymentModeKey, _that.status);
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
            @JsonKey(name: 'Code', readValue: _readCode) String? type,
            @JsonKey(name: 'CodeName', readValue: _readName)
            String? description,
            @JsonKey(name: "PaymentModeImage") String? paymentModeImage,
            @JsonKey(name: "PaymentModeKey") String? paymentModeKey,
            @JsonKey(name: "Status") String? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMode():
        return $default(_that.type, _that.description, _that.paymentModeImage,
            _that.paymentModeKey, _that.status);
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
            @JsonKey(name: 'Code', readValue: _readCode) String? type,
            @JsonKey(name: 'CodeName', readValue: _readName)
            String? description,
            @JsonKey(name: "PaymentModeImage") String? paymentModeImage,
            @JsonKey(name: "PaymentModeKey") String? paymentModeKey,
            @JsonKey(name: "Status") String? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentMode() when $default != null:
        return $default(_that.type, _that.description, _that.paymentModeImage,
            _that.paymentModeKey, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentMode implements PaymentMode {
  const _PaymentMode(
      {@JsonKey(name: 'Code', readValue: _readCode) this.type = '',
      @JsonKey(name: 'CodeName', readValue: _readName) this.description = '',
      @JsonKey(name: "PaymentModeImage") this.paymentModeImage = '',
      @JsonKey(name: "PaymentModeKey") this.paymentModeKey = '',
      @JsonKey(name: "Status") this.status = ''});
  factory _PaymentMode.fromJson(Map<String, dynamic> json) =>
      _$PaymentModeFromJson(json);

  @override
  @JsonKey(name: 'Code', readValue: _readCode)
  final String? type;
  @override
  @JsonKey(name: 'CodeName', readValue: _readName)
  final String? description;
  @override
  @JsonKey(name: "PaymentModeImage")
  final String? paymentModeImage;
  @override
  @JsonKey(name: "PaymentModeKey")
  final String? paymentModeKey;
  @override
  @JsonKey(name: "Status")
  final String? status;

  /// Create a copy of PaymentMode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentModeCopyWith<_PaymentMode> get copyWith =>
      __$PaymentModeCopyWithImpl<_PaymentMode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentModeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentMode &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paymentModeImage, paymentModeImage) ||
                other.paymentModeImage == paymentModeImage) &&
            (identical(other.paymentModeKey, paymentModeKey) ||
                other.paymentModeKey == paymentModeKey) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, description, paymentModeImage, paymentModeKey, status);

  @override
  String toString() {
    return 'PaymentMode(type: $type, description: $description, paymentModeImage: $paymentModeImage, paymentModeKey: $paymentModeKey, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$PaymentModeCopyWith<$Res>
    implements $PaymentModeCopyWith<$Res> {
  factory _$PaymentModeCopyWith(
          _PaymentMode value, $Res Function(_PaymentMode) _then) =
      __$PaymentModeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Code', readValue: _readCode) String? type,
      @JsonKey(name: 'CodeName', readValue: _readName) String? description,
      @JsonKey(name: "PaymentModeImage") String? paymentModeImage,
      @JsonKey(name: "PaymentModeKey") String? paymentModeKey,
      @JsonKey(name: "Status") String? status});
}

/// @nodoc
class __$PaymentModeCopyWithImpl<$Res> implements _$PaymentModeCopyWith<$Res> {
  __$PaymentModeCopyWithImpl(this._self, this._then);

  final _PaymentMode _self;
  final $Res Function(_PaymentMode) _then;

  /// Create a copy of PaymentMode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = freezed,
    Object? description = freezed,
    Object? paymentModeImage = freezed,
    Object? paymentModeKey = freezed,
    Object? status = freezed,
  }) {
    return _then(_PaymentMode(
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentModeImage: freezed == paymentModeImage
          ? _self.paymentModeImage
          : paymentModeImage // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentModeKey: freezed == paymentModeKey
          ? _self.paymentModeKey
          : paymentModeKey // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
