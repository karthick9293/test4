// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_message_details_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomMessageDetailsFZ {
  @JsonKey(name: 'MessageCode')
  String get MessageCode;
  @JsonKey(name: 'MessageType')
  String get MessageType;
  @JsonKey(name: 'MessageHeader')
  String get MessageHeader;
  @JsonKey(name: 'MessageDescription')
  String get MessageDescription;

  /// Create a copy of CustomMessageDetailsFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsFZCopyWith<CustomMessageDetailsFZ> get copyWith =>
      _$CustomMessageDetailsFZCopyWithImpl<CustomMessageDetailsFZ>(
          this as CustomMessageDetailsFZ, _$identity);

  /// Serializes this CustomMessageDetailsFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomMessageDetailsFZ &&
            (identical(other.MessageCode, MessageCode) ||
                other.MessageCode == MessageCode) &&
            (identical(other.MessageType, MessageType) ||
                other.MessageType == MessageType) &&
            (identical(other.MessageHeader, MessageHeader) ||
                other.MessageHeader == MessageHeader) &&
            (identical(other.MessageDescription, MessageDescription) ||
                other.MessageDescription == MessageDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, MessageCode, MessageType, MessageHeader, MessageDescription);

  @override
  String toString() {
    return 'CustomMessageDetailsFZ(MessageCode: $MessageCode, MessageType: $MessageType, MessageHeader: $MessageHeader, MessageDescription: $MessageDescription)';
  }
}

/// @nodoc
abstract mixin class $CustomMessageDetailsFZCopyWith<$Res> {
  factory $CustomMessageDetailsFZCopyWith(CustomMessageDetailsFZ value,
          $Res Function(CustomMessageDetailsFZ) _then) =
      _$CustomMessageDetailsFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageCode') String MessageCode,
      @JsonKey(name: 'MessageType') String MessageType,
      @JsonKey(name: 'MessageHeader') String MessageHeader,
      @JsonKey(name: 'MessageDescription') String MessageDescription});
}

/// @nodoc
class _$CustomMessageDetailsFZCopyWithImpl<$Res>
    implements $CustomMessageDetailsFZCopyWith<$Res> {
  _$CustomMessageDetailsFZCopyWithImpl(this._self, this._then);

  final CustomMessageDetailsFZ _self;
  final $Res Function(CustomMessageDetailsFZ) _then;

  /// Create a copy of CustomMessageDetailsFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? MessageCode = null,
    Object? MessageType = null,
    Object? MessageHeader = null,
    Object? MessageDescription = null,
  }) {
    return _then(_self.copyWith(
      MessageCode: null == MessageCode
          ? _self.MessageCode
          : MessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      MessageType: null == MessageType
          ? _self.MessageType
          : MessageType // ignore: cast_nullable_to_non_nullable
              as String,
      MessageHeader: null == MessageHeader
          ? _self.MessageHeader
          : MessageHeader // ignore: cast_nullable_to_non_nullable
              as String,
      MessageDescription: null == MessageDescription
          ? _self.MessageDescription
          : MessageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomMessageDetailsFZ].
extension CustomMessageDetailsFZPatterns on CustomMessageDetailsFZ {
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
    TResult Function(_CustomMessageDetailsFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetailsFZ() when $default != null:
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
    TResult Function(_CustomMessageDetailsFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetailsFZ():
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
    TResult? Function(_CustomMessageDetailsFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetailsFZ() when $default != null:
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
            @JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageType') String MessageType,
            @JsonKey(name: 'MessageHeader') String MessageHeader,
            @JsonKey(name: 'MessageDescription') String MessageDescription)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetailsFZ() when $default != null:
        return $default(_that.MessageCode, _that.MessageType,
            _that.MessageHeader, _that.MessageDescription);
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
            @JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageType') String MessageType,
            @JsonKey(name: 'MessageHeader') String MessageHeader,
            @JsonKey(name: 'MessageDescription') String MessageDescription)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetailsFZ():
        return $default(_that.MessageCode, _that.MessageType,
            _that.MessageHeader, _that.MessageDescription);
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
            @JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageType') String MessageType,
            @JsonKey(name: 'MessageHeader') String MessageHeader,
            @JsonKey(name: 'MessageDescription') String MessageDescription)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetailsFZ() when $default != null:
        return $default(_that.MessageCode, _that.MessageType,
            _that.MessageHeader, _that.MessageDescription);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomMessageDetailsFZ implements CustomMessageDetailsFZ {
  const _CustomMessageDetailsFZ(
      {@JsonKey(name: 'MessageCode') this.MessageCode = '',
      @JsonKey(name: 'MessageType') this.MessageType = '',
      @JsonKey(name: 'MessageHeader') this.MessageHeader = '',
      @JsonKey(name: 'MessageDescription') this.MessageDescription = ''});
  factory _CustomMessageDetailsFZ.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageDetailsFZFromJson(json);

  @override
  @JsonKey(name: 'MessageCode')
  final String MessageCode;
  @override
  @JsonKey(name: 'MessageType')
  final String MessageType;
  @override
  @JsonKey(name: 'MessageHeader')
  final String MessageHeader;
  @override
  @JsonKey(name: 'MessageDescription')
  final String MessageDescription;

  /// Create a copy of CustomMessageDetailsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomMessageDetailsFZCopyWith<_CustomMessageDetailsFZ> get copyWith =>
      __$CustomMessageDetailsFZCopyWithImpl<_CustomMessageDetailsFZ>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomMessageDetailsFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomMessageDetailsFZ &&
            (identical(other.MessageCode, MessageCode) ||
                other.MessageCode == MessageCode) &&
            (identical(other.MessageType, MessageType) ||
                other.MessageType == MessageType) &&
            (identical(other.MessageHeader, MessageHeader) ||
                other.MessageHeader == MessageHeader) &&
            (identical(other.MessageDescription, MessageDescription) ||
                other.MessageDescription == MessageDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, MessageCode, MessageType, MessageHeader, MessageDescription);

  @override
  String toString() {
    return 'CustomMessageDetailsFZ(MessageCode: $MessageCode, MessageType: $MessageType, MessageHeader: $MessageHeader, MessageDescription: $MessageDescription)';
  }
}

/// @nodoc
abstract mixin class _$CustomMessageDetailsFZCopyWith<$Res>
    implements $CustomMessageDetailsFZCopyWith<$Res> {
  factory _$CustomMessageDetailsFZCopyWith(_CustomMessageDetailsFZ value,
          $Res Function(_CustomMessageDetailsFZ) _then) =
      __$CustomMessageDetailsFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageCode') String MessageCode,
      @JsonKey(name: 'MessageType') String MessageType,
      @JsonKey(name: 'MessageHeader') String MessageHeader,
      @JsonKey(name: 'MessageDescription') String MessageDescription});
}

/// @nodoc
class __$CustomMessageDetailsFZCopyWithImpl<$Res>
    implements _$CustomMessageDetailsFZCopyWith<$Res> {
  __$CustomMessageDetailsFZCopyWithImpl(this._self, this._then);

  final _CustomMessageDetailsFZ _self;
  final $Res Function(_CustomMessageDetailsFZ) _then;

  /// Create a copy of CustomMessageDetailsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? MessageCode = null,
    Object? MessageType = null,
    Object? MessageHeader = null,
    Object? MessageDescription = null,
  }) {
    return _then(_CustomMessageDetailsFZ(
      MessageCode: null == MessageCode
          ? _self.MessageCode
          : MessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      MessageType: null == MessageType
          ? _self.MessageType
          : MessageType // ignore: cast_nullable_to_non_nullable
              as String,
      MessageHeader: null == MessageHeader
          ? _self.MessageHeader
          : MessageHeader // ignore: cast_nullable_to_non_nullable
              as String,
      MessageDescription: null == MessageDescription
          ? _self.MessageDescription
          : MessageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
