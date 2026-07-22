// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_response_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TempSettings {
  @JsonKey(name: 'ParameterKey')
  String get parameterKey;
  @JsonKey(name: 'ParameterValue')
  String get parameterValue;
  @JsonKey(name: 'ParameterDescription')
  String get parameterDescription;
  @JsonKey(name: 'Status')
  String get status;
  @JsonKey(name: 'DigitalApplicationCode')
  int get digitalApplicationCode;
  @JsonKey(name: 'DisplayOrder')
  int get displayOrder;
  @JsonKey(name: 'DefaultValue')
  String get defaultValue;

  /// Create a copy of TempSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TempSettingsCopyWith<TempSettings> get copyWith =>
      _$TempSettingsCopyWithImpl<TempSettings>(
          this as TempSettings, _$identity);

  /// Serializes this TempSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TempSettings &&
            (identical(other.parameterKey, parameterKey) ||
                other.parameterKey == parameterKey) &&
            (identical(other.parameterValue, parameterValue) ||
                other.parameterValue == parameterValue) &&
            (identical(other.parameterDescription, parameterDescription) ||
                other.parameterDescription == parameterDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.digitalApplicationCode, digitalApplicationCode) ||
                other.digitalApplicationCode == digitalApplicationCode) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      parameterKey,
      parameterValue,
      parameterDescription,
      status,
      digitalApplicationCode,
      displayOrder,
      defaultValue);

  @override
  String toString() {
    return 'TempSettings(parameterKey: $parameterKey, parameterValue: $parameterValue, parameterDescription: $parameterDescription, status: $status, digitalApplicationCode: $digitalApplicationCode, displayOrder: $displayOrder, defaultValue: $defaultValue)';
  }
}

/// @nodoc
abstract mixin class $TempSettingsCopyWith<$Res> {
  factory $TempSettingsCopyWith(
          TempSettings value, $Res Function(TempSettings) _then) =
      _$TempSettingsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'ParameterKey') String parameterKey,
      @JsonKey(name: 'ParameterValue') String parameterValue,
      @JsonKey(name: 'ParameterDescription') String parameterDescription,
      @JsonKey(name: 'Status') String status,
      @JsonKey(name: 'DigitalApplicationCode') int digitalApplicationCode,
      @JsonKey(name: 'DisplayOrder') int displayOrder,
      @JsonKey(name: 'DefaultValue') String defaultValue});
}

/// @nodoc
class _$TempSettingsCopyWithImpl<$Res> implements $TempSettingsCopyWith<$Res> {
  _$TempSettingsCopyWithImpl(this._self, this._then);

  final TempSettings _self;
  final $Res Function(TempSettings) _then;

  /// Create a copy of TempSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? parameterKey = null,
    Object? parameterValue = null,
    Object? parameterDescription = null,
    Object? status = null,
    Object? digitalApplicationCode = null,
    Object? displayOrder = null,
    Object? defaultValue = null,
  }) {
    return _then(_self.copyWith(
      parameterKey: null == parameterKey
          ? _self.parameterKey
          : parameterKey // ignore: cast_nullable_to_non_nullable
              as String,
      parameterValue: null == parameterValue
          ? _self.parameterValue
          : parameterValue // ignore: cast_nullable_to_non_nullable
              as String,
      parameterDescription: null == parameterDescription
          ? _self.parameterDescription
          : parameterDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      digitalApplicationCode: null == digitalApplicationCode
          ? _self.digitalApplicationCode
          : digitalApplicationCode // ignore: cast_nullable_to_non_nullable
              as int,
      displayOrder: null == displayOrder
          ? _self.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [TempSettings].
extension TempSettingsPatterns on TempSettings {
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
    TResult Function(_TempSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TempSettings() when $default != null:
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
    TResult Function(_TempSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TempSettings():
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
    TResult? Function(_TempSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TempSettings() when $default != null:
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
            @JsonKey(name: 'ParameterKey') String parameterKey,
            @JsonKey(name: 'ParameterValue') String parameterValue,
            @JsonKey(name: 'ParameterDescription') String parameterDescription,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'DigitalApplicationCode') int digitalApplicationCode,
            @JsonKey(name: 'DisplayOrder') int displayOrder,
            @JsonKey(name: 'DefaultValue') String defaultValue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TempSettings() when $default != null:
        return $default(
            _that.parameterKey,
            _that.parameterValue,
            _that.parameterDescription,
            _that.status,
            _that.digitalApplicationCode,
            _that.displayOrder,
            _that.defaultValue);
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
            @JsonKey(name: 'ParameterKey') String parameterKey,
            @JsonKey(name: 'ParameterValue') String parameterValue,
            @JsonKey(name: 'ParameterDescription') String parameterDescription,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'DigitalApplicationCode') int digitalApplicationCode,
            @JsonKey(name: 'DisplayOrder') int displayOrder,
            @JsonKey(name: 'DefaultValue') String defaultValue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TempSettings():
        return $default(
            _that.parameterKey,
            _that.parameterValue,
            _that.parameterDescription,
            _that.status,
            _that.digitalApplicationCode,
            _that.displayOrder,
            _that.defaultValue);
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
            @JsonKey(name: 'ParameterKey') String parameterKey,
            @JsonKey(name: 'ParameterValue') String parameterValue,
            @JsonKey(name: 'ParameterDescription') String parameterDescription,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'DigitalApplicationCode') int digitalApplicationCode,
            @JsonKey(name: 'DisplayOrder') int displayOrder,
            @JsonKey(name: 'DefaultValue') String defaultValue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TempSettings() when $default != null:
        return $default(
            _that.parameterKey,
            _that.parameterValue,
            _that.parameterDescription,
            _that.status,
            _that.digitalApplicationCode,
            _that.displayOrder,
            _that.defaultValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TempSettings implements TempSettings {
  const _TempSettings(
      {@JsonKey(name: 'ParameterKey') this.parameterKey = '',
      @JsonKey(name: 'ParameterValue') this.parameterValue = '',
      @JsonKey(name: 'ParameterDescription') this.parameterDescription = '',
      @JsonKey(name: 'Status') this.status = '',
      @JsonKey(name: 'DigitalApplicationCode') this.digitalApplicationCode = 0,
      @JsonKey(name: 'DisplayOrder') this.displayOrder = 0,
      @JsonKey(name: 'DefaultValue') this.defaultValue = ''});
  factory _TempSettings.fromJson(Map<String, dynamic> json) =>
      _$TempSettingsFromJson(json);

  @override
  @JsonKey(name: 'ParameterKey')
  final String parameterKey;
  @override
  @JsonKey(name: 'ParameterValue')
  final String parameterValue;
  @override
  @JsonKey(name: 'ParameterDescription')
  final String parameterDescription;
  @override
  @JsonKey(name: 'Status')
  final String status;
  @override
  @JsonKey(name: 'DigitalApplicationCode')
  final int digitalApplicationCode;
  @override
  @JsonKey(name: 'DisplayOrder')
  final int displayOrder;
  @override
  @JsonKey(name: 'DefaultValue')
  final String defaultValue;

  /// Create a copy of TempSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TempSettingsCopyWith<_TempSettings> get copyWith =>
      __$TempSettingsCopyWithImpl<_TempSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TempSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TempSettings &&
            (identical(other.parameterKey, parameterKey) ||
                other.parameterKey == parameterKey) &&
            (identical(other.parameterValue, parameterValue) ||
                other.parameterValue == parameterValue) &&
            (identical(other.parameterDescription, parameterDescription) ||
                other.parameterDescription == parameterDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.digitalApplicationCode, digitalApplicationCode) ||
                other.digitalApplicationCode == digitalApplicationCode) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      parameterKey,
      parameterValue,
      parameterDescription,
      status,
      digitalApplicationCode,
      displayOrder,
      defaultValue);

  @override
  String toString() {
    return 'TempSettings(parameterKey: $parameterKey, parameterValue: $parameterValue, parameterDescription: $parameterDescription, status: $status, digitalApplicationCode: $digitalApplicationCode, displayOrder: $displayOrder, defaultValue: $defaultValue)';
  }
}

/// @nodoc
abstract mixin class _$TempSettingsCopyWith<$Res>
    implements $TempSettingsCopyWith<$Res> {
  factory _$TempSettingsCopyWith(
          _TempSettings value, $Res Function(_TempSettings) _then) =
      __$TempSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ParameterKey') String parameterKey,
      @JsonKey(name: 'ParameterValue') String parameterValue,
      @JsonKey(name: 'ParameterDescription') String parameterDescription,
      @JsonKey(name: 'Status') String status,
      @JsonKey(name: 'DigitalApplicationCode') int digitalApplicationCode,
      @JsonKey(name: 'DisplayOrder') int displayOrder,
      @JsonKey(name: 'DefaultValue') String defaultValue});
}

/// @nodoc
class __$TempSettingsCopyWithImpl<$Res>
    implements _$TempSettingsCopyWith<$Res> {
  __$TempSettingsCopyWithImpl(this._self, this._then);

  final _TempSettings _self;
  final $Res Function(_TempSettings) _then;

  /// Create a copy of TempSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? parameterKey = null,
    Object? parameterValue = null,
    Object? parameterDescription = null,
    Object? status = null,
    Object? digitalApplicationCode = null,
    Object? displayOrder = null,
    Object? defaultValue = null,
  }) {
    return _then(_TempSettings(
      parameterKey: null == parameterKey
          ? _self.parameterKey
          : parameterKey // ignore: cast_nullable_to_non_nullable
              as String,
      parameterValue: null == parameterValue
          ? _self.parameterValue
          : parameterValue // ignore: cast_nullable_to_non_nullable
              as String,
      parameterDescription: null == parameterDescription
          ? _self.parameterDescription
          : parameterDescription // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      digitalApplicationCode: null == digitalApplicationCode
          ? _self.digitalApplicationCode
          : digitalApplicationCode // ignore: cast_nullable_to_non_nullable
              as int,
      displayOrder: null == displayOrder
          ? _self.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
