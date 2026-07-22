// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_symbol_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrencySymbolFz {
  @JsonKey(name: "StatusCode")
  String? get statusCode;
  @JsonKey(name: "StatusMessage")
  String? get statusMessage;
  @JsonKey(name: "CurrencySymbol")
  List<CurrencySymbol>? get currencySymbols;
  @JsonKey(name: "CustomMessageDetails")
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of CurrencySymbolFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrencySymbolFzCopyWith<CurrencySymbolFz> get copyWith =>
      _$CurrencySymbolFzCopyWithImpl<CurrencySymbolFz>(
          this as CurrencySymbolFz, _$identity);

  /// Serializes this CurrencySymbolFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurrencySymbolFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality()
                .equals(other.currencySymbols, currencySymbols) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      const DeepCollectionEquality().hash(currencySymbols),
      customMessageDetails);

  @override
  String toString() {
    return 'CurrencySymbolFz(statusCode: $statusCode, statusMessage: $statusMessage, currencySymbols: $currencySymbols, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $CurrencySymbolFzCopyWith<$Res> {
  factory $CurrencySymbolFzCopyWith(
          CurrencySymbolFz value, $Res Function(CurrencySymbolFz) _then) =
      _$CurrencySymbolFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "CurrencySymbol") List<CurrencySymbol>? currencySymbols,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails});

  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$CurrencySymbolFzCopyWithImpl<$Res>
    implements $CurrencySymbolFzCopyWith<$Res> {
  _$CurrencySymbolFzCopyWithImpl(this._self, this._then);

  final CurrencySymbolFz _self;
  final $Res Function(CurrencySymbolFz) _then;

  /// Create a copy of CurrencySymbolFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? currencySymbols = freezed,
    Object? customMessageDetails = freezed,
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
      currencySymbols: freezed == currencySymbols
          ? _self.currencySymbols
          : currencySymbols // ignore: cast_nullable_to_non_nullable
              as List<CurrencySymbol>?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of CurrencySymbolFz
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

/// Adds pattern-matching-related methods to [CurrencySymbolFz].
extension CurrencySymbolFzPatterns on CurrencySymbolFz {
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
    TResult Function(_CurrencySymbolFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbolFz() when $default != null:
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
    TResult Function(_CurrencySymbolFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbolFz():
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
    TResult? Function(_CurrencySymbolFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbolFz() when $default != null:
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
            @JsonKey(name: "CurrencySymbol")
            List<CurrencySymbol>? currencySymbols,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbolFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.currencySymbols, _that.customMessageDetails);
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
            @JsonKey(name: "CurrencySymbol")
            List<CurrencySymbol>? currencySymbols,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbolFz():
        return $default(_that.statusCode, _that.statusMessage,
            _that.currencySymbols, _that.customMessageDetails);
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
            @JsonKey(name: "CurrencySymbol")
            List<CurrencySymbol>? currencySymbols,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbolFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.currencySymbols, _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurrencySymbolFz implements CurrencySymbolFz {
  const _CurrencySymbolFz(
      {@JsonKey(name: "StatusCode") this.statusCode,
      @JsonKey(name: "StatusMessage") this.statusMessage,
      @JsonKey(name: "CurrencySymbol")
      final List<CurrencySymbol>? currencySymbols,
      @JsonKey(name: "CustomMessageDetails") this.customMessageDetails})
      : _currencySymbols = currencySymbols;
  factory _CurrencySymbolFz.fromJson(Map<String, dynamic> json) =>
      _$CurrencySymbolFzFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String? statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String? statusMessage;
  final List<CurrencySymbol>? _currencySymbols;
  @override
  @JsonKey(name: "CurrencySymbol")
  List<CurrencySymbol>? get currencySymbols {
    final value = _currencySymbols;
    if (value == null) return null;
    if (_currencySymbols is EqualUnmodifiableListView) return _currencySymbols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "CustomMessageDetails")
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of CurrencySymbolFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrencySymbolFzCopyWith<_CurrencySymbolFz> get copyWith =>
      __$CurrencySymbolFzCopyWithImpl<_CurrencySymbolFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurrencySymbolFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrencySymbolFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality()
                .equals(other._currencySymbols, _currencySymbols) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      const DeepCollectionEquality().hash(_currencySymbols),
      customMessageDetails);

  @override
  String toString() {
    return 'CurrencySymbolFz(statusCode: $statusCode, statusMessage: $statusMessage, currencySymbols: $currencySymbols, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$CurrencySymbolFzCopyWith<$Res>
    implements $CurrencySymbolFzCopyWith<$Res> {
  factory _$CurrencySymbolFzCopyWith(
          _CurrencySymbolFz value, $Res Function(_CurrencySymbolFz) _then) =
      __$CurrencySymbolFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "CurrencySymbol") List<CurrencySymbol>? currencySymbols,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails});

  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$CurrencySymbolFzCopyWithImpl<$Res>
    implements _$CurrencySymbolFzCopyWith<$Res> {
  __$CurrencySymbolFzCopyWithImpl(this._self, this._then);

  final _CurrencySymbolFz _self;
  final $Res Function(_CurrencySymbolFz) _then;

  /// Create a copy of CurrencySymbolFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? currencySymbols = freezed,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_CurrencySymbolFz(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbols: freezed == currencySymbols
          ? _self._currencySymbols
          : currencySymbols // ignore: cast_nullable_to_non_nullable
              as List<CurrencySymbol>?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of CurrencySymbolFz
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
mixin _$CurrencySymbol {
  @JsonKey(name: "CurrencyCode")
  String? get currencyCode;
  @JsonKey(name: "Base64String")
  String? get base64String;
  @JsonKey(name: "CurrencyImage")
  String? get currencyImage;

  /// Create a copy of CurrencySymbol
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrencySymbolCopyWith<CurrencySymbol> get copyWith =>
      _$CurrencySymbolCopyWithImpl<CurrencySymbol>(
          this as CurrencySymbol, _$identity);

  /// Serializes this CurrencySymbol to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurrencySymbol &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.base64String, base64String) ||
                other.base64String == base64String) &&
            (identical(other.currencyImage, currencyImage) ||
                other.currencyImage == currencyImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currencyCode, base64String, currencyImage);

  @override
  String toString() {
    return 'CurrencySymbol(currencyCode: $currencyCode, base64String: $base64String, currencyImage: $currencyImage)';
  }
}

/// @nodoc
abstract mixin class $CurrencySymbolCopyWith<$Res> {
  factory $CurrencySymbolCopyWith(
          CurrencySymbol value, $Res Function(CurrencySymbol) _then) =
      _$CurrencySymbolCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "CurrencyCode") String? currencyCode,
      @JsonKey(name: "Base64String") String? base64String,
      @JsonKey(name: "CurrencyImage") String? currencyImage});
}

/// @nodoc
class _$CurrencySymbolCopyWithImpl<$Res>
    implements $CurrencySymbolCopyWith<$Res> {
  _$CurrencySymbolCopyWithImpl(this._self, this._then);

  final CurrencySymbol _self;
  final $Res Function(CurrencySymbol) _then;

  /// Create a copy of CurrencySymbol
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyCode = freezed,
    Object? base64String = freezed,
    Object? currencyImage = freezed,
  }) {
    return _then(_self.copyWith(
      currencyCode: freezed == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      base64String: freezed == base64String
          ? _self.base64String
          : base64String // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyImage: freezed == currencyImage
          ? _self.currencyImage
          : currencyImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CurrencySymbol].
extension CurrencySymbolPatterns on CurrencySymbol {
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
    TResult Function(_CurrencySymbol value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbol() when $default != null:
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
    TResult Function(_CurrencySymbol value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbol():
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
    TResult? Function(_CurrencySymbol value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbol() when $default != null:
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
            @JsonKey(name: "Base64String") String? base64String,
            @JsonKey(name: "CurrencyImage") String? currencyImage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbol() when $default != null:
        return $default(
            _that.currencyCode, _that.base64String, _that.currencyImage);
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
            @JsonKey(name: "Base64String") String? base64String,
            @JsonKey(name: "CurrencyImage") String? currencyImage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbol():
        return $default(
            _that.currencyCode, _that.base64String, _that.currencyImage);
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
            @JsonKey(name: "Base64String") String? base64String,
            @JsonKey(name: "CurrencyImage") String? currencyImage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencySymbol() when $default != null:
        return $default(
            _that.currencyCode, _that.base64String, _that.currencyImage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurrencySymbol implements CurrencySymbol {
  const _CurrencySymbol(
      {@JsonKey(name: "CurrencyCode") this.currencyCode,
      @JsonKey(name: "Base64String") this.base64String,
      @JsonKey(name: "CurrencyImage") this.currencyImage});
  factory _CurrencySymbol.fromJson(Map<String, dynamic> json) =>
      _$CurrencySymbolFromJson(json);

  @override
  @JsonKey(name: "CurrencyCode")
  final String? currencyCode;
  @override
  @JsonKey(name: "Base64String")
  final String? base64String;
  @override
  @JsonKey(name: "CurrencyImage")
  final String? currencyImage;

  /// Create a copy of CurrencySymbol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrencySymbolCopyWith<_CurrencySymbol> get copyWith =>
      __$CurrencySymbolCopyWithImpl<_CurrencySymbol>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurrencySymbolToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrencySymbol &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.base64String, base64String) ||
                other.base64String == base64String) &&
            (identical(other.currencyImage, currencyImage) ||
                other.currencyImage == currencyImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currencyCode, base64String, currencyImage);

  @override
  String toString() {
    return 'CurrencySymbol(currencyCode: $currencyCode, base64String: $base64String, currencyImage: $currencyImage)';
  }
}

/// @nodoc
abstract mixin class _$CurrencySymbolCopyWith<$Res>
    implements $CurrencySymbolCopyWith<$Res> {
  factory _$CurrencySymbolCopyWith(
          _CurrencySymbol value, $Res Function(_CurrencySymbol) _then) =
      __$CurrencySymbolCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "CurrencyCode") String? currencyCode,
      @JsonKey(name: "Base64String") String? base64String,
      @JsonKey(name: "CurrencyImage") String? currencyImage});
}

/// @nodoc
class __$CurrencySymbolCopyWithImpl<$Res>
    implements _$CurrencySymbolCopyWith<$Res> {
  __$CurrencySymbolCopyWithImpl(this._self, this._then);

  final _CurrencySymbol _self;
  final $Res Function(_CurrencySymbol) _then;

  /// Create a copy of CurrencySymbol
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currencyCode = freezed,
    Object? base64String = freezed,
    Object? currencyImage = freezed,
  }) {
    return _then(_CurrencySymbol(
      currencyCode: freezed == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      base64String: freezed == base64String
          ? _self.base64String
          : base64String // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyImage: freezed == currencyImage
          ? _self.currencyImage
          : currencyImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CustomMessageDetails {
  @JsonKey(name: "MessageCode")
  String get messageCode;
  @JsonKey(name: "MessageType")
  String get messageType;
  @JsonKey(name: "MessageHeader")
  String get messageHeader;
  @JsonKey(name: "MessageDescription")
  String get messageDescription;

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
      {@JsonKey(name: "MessageCode") String messageCode,
      @JsonKey(name: "MessageType") String messageType,
      @JsonKey(name: "MessageHeader") String messageHeader,
      @JsonKey(name: "MessageDescription") String messageDescription});
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
    Object? messageCode = null,
    Object? messageType = null,
    Object? messageHeader = null,
    Object? messageDescription = null,
  }) {
    return _then(_self.copyWith(
      messageCode: null == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      messageHeader: null == messageHeader
          ? _self.messageHeader
          : messageHeader // ignore: cast_nullable_to_non_nullable
              as String,
      messageDescription: null == messageDescription
          ? _self.messageDescription
          : messageDescription // ignore: cast_nullable_to_non_nullable
              as String,
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
            @JsonKey(name: "MessageCode") String messageCode,
            @JsonKey(name: "MessageType") String messageType,
            @JsonKey(name: "MessageHeader") String messageHeader,
            @JsonKey(name: "MessageDescription") String messageDescription)?
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
            @JsonKey(name: "MessageCode") String messageCode,
            @JsonKey(name: "MessageType") String messageType,
            @JsonKey(name: "MessageHeader") String messageHeader,
            @JsonKey(name: "MessageDescription") String messageDescription)
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
            @JsonKey(name: "MessageCode") String messageCode,
            @JsonKey(name: "MessageType") String messageType,
            @JsonKey(name: "MessageHeader") String messageHeader,
            @JsonKey(name: "MessageDescription") String messageDescription)?
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
      {@JsonKey(name: "MessageCode") required this.messageCode,
      @JsonKey(name: "MessageType") required this.messageType,
      @JsonKey(name: "MessageHeader") required this.messageHeader,
      @JsonKey(name: "MessageDescription") required this.messageDescription});
  factory _CustomMessageDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageDetailsFromJson(json);

  @override
  @JsonKey(name: "MessageCode")
  final String messageCode;
  @override
  @JsonKey(name: "MessageType")
  final String messageType;
  @override
  @JsonKey(name: "MessageHeader")
  final String messageHeader;
  @override
  @JsonKey(name: "MessageDescription")
  final String messageDescription;

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
      {@JsonKey(name: "MessageCode") String messageCode,
      @JsonKey(name: "MessageType") String messageType,
      @JsonKey(name: "MessageHeader") String messageHeader,
      @JsonKey(name: "MessageDescription") String messageDescription});
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
    Object? messageCode = null,
    Object? messageType = null,
    Object? messageHeader = null,
    Object? messageDescription = null,
  }) {
    return _then(_CustomMessageDetails(
      messageCode: null == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      messageHeader: null == messageHeader
          ? _self.messageHeader
          : messageHeader // ignore: cast_nullable_to_non_nullable
              as String,
      messageDescription: null == messageDescription
          ? _self.messageDescription
          : messageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
