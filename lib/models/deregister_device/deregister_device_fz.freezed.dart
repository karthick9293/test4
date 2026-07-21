// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deregister_device_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeregisterDeviceFZ {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetailsFZ? get customMessageDetails;
  @JsonKey(name: 'Data')
  DeregisterData? get deregisterData;

  /// Create a copy of DeregisterDeviceFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeregisterDeviceFZCopyWith<DeregisterDeviceFZ> get copyWith =>
      _$DeregisterDeviceFZCopyWithImpl<DeregisterDeviceFZ>(
          this as DeregisterDeviceFZ, _$identity);

  /// Serializes this DeregisterDeviceFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeregisterDeviceFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.deregisterData, deregisterData) ||
                other.deregisterData == deregisterData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      customMessageDetails, deregisterData);

  @override
  String toString() {
    return 'DeregisterDeviceFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, deregisterData: $deregisterData)';
  }
}

/// @nodoc
abstract mixin class $DeregisterDeviceFZCopyWith<$Res> {
  factory $DeregisterDeviceFZCopyWith(
          DeregisterDeviceFZ value, $Res Function(DeregisterDeviceFZ) _then) =
      _$DeregisterDeviceFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetails,
      @JsonKey(name: 'Data') DeregisterData? deregisterData});

  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails;
  $DeregisterDataCopyWith<$Res>? get deregisterData;
}

/// @nodoc
class _$DeregisterDeviceFZCopyWithImpl<$Res>
    implements $DeregisterDeviceFZCopyWith<$Res> {
  _$DeregisterDeviceFZCopyWithImpl(this._self, this._then);

  final DeregisterDeviceFZ _self;
  final $Res Function(DeregisterDeviceFZ) _then;

  /// Create a copy of DeregisterDeviceFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? deregisterData = freezed,
  }) {
    return _then(_self.copyWith(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      deregisterData: freezed == deregisterData
          ? _self.deregisterData
          : deregisterData // ignore: cast_nullable_to_non_nullable
              as DeregisterData?,
    ));
  }

  /// Create a copy of DeregisterDeviceFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails {
    if (_self.customMessageDetails == null) {
      return null;
    }

    return $CustomMessageDetailsFZCopyWith<$Res>(_self.customMessageDetails!,
        (value) {
      return _then(_self.copyWith(customMessageDetails: value));
    });
  }

  /// Create a copy of DeregisterDeviceFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeregisterDataCopyWith<$Res>? get deregisterData {
    if (_self.deregisterData == null) {
      return null;
    }

    return $DeregisterDataCopyWith<$Res>(_self.deregisterData!, (value) {
      return _then(_self.copyWith(deregisterData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DeregisterDeviceFZ].
extension DeregisterDeviceFZPatterns on DeregisterDeviceFZ {
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
    TResult Function(_DeregisterDeviceFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeregisterDeviceFZ() when $default != null:
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
    TResult Function(_DeregisterDeviceFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeregisterDeviceFZ():
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
    TResult? Function(_DeregisterDeviceFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeregisterDeviceFZ() when $default != null:
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
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetailsFZ? customMessageDetails,
            @JsonKey(name: 'Data') DeregisterData? deregisterData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeregisterDeviceFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.deregisterData);
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
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetailsFZ? customMessageDetails,
            @JsonKey(name: 'Data') DeregisterData? deregisterData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeregisterDeviceFZ():
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.deregisterData);
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
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetailsFZ? customMessageDetails,
            @JsonKey(name: 'Data') DeregisterData? deregisterData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeregisterDeviceFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.deregisterData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeregisterDeviceFZ implements DeregisterDeviceFZ {
  const _DeregisterDeviceFZ(
      {@JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails,
      @JsonKey(name: 'Data') this.deregisterData});
  factory _DeregisterDeviceFZ.fromJson(Map<String, dynamic> json) =>
      _$DeregisterDeviceFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String statusMessage;
  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetailsFZ? customMessageDetails;
  @override
  @JsonKey(name: 'Data')
  final DeregisterData? deregisterData;

  /// Create a copy of DeregisterDeviceFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeregisterDeviceFZCopyWith<_DeregisterDeviceFZ> get copyWith =>
      __$DeregisterDeviceFZCopyWithImpl<_DeregisterDeviceFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeregisterDeviceFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeregisterDeviceFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.deregisterData, deregisterData) ||
                other.deregisterData == deregisterData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      customMessageDetails, deregisterData);

  @override
  String toString() {
    return 'DeregisterDeviceFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, deregisterData: $deregisterData)';
  }
}

/// @nodoc
abstract mixin class _$DeregisterDeviceFZCopyWith<$Res>
    implements $DeregisterDeviceFZCopyWith<$Res> {
  factory _$DeregisterDeviceFZCopyWith(
          _DeregisterDeviceFZ value, $Res Function(_DeregisterDeviceFZ) _then) =
      __$DeregisterDeviceFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetails,
      @JsonKey(name: 'Data') DeregisterData? deregisterData});

  @override
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails;
  @override
  $DeregisterDataCopyWith<$Res>? get deregisterData;
}

/// @nodoc
class __$DeregisterDeviceFZCopyWithImpl<$Res>
    implements _$DeregisterDeviceFZCopyWith<$Res> {
  __$DeregisterDeviceFZCopyWithImpl(this._self, this._then);

  final _DeregisterDeviceFZ _self;
  final $Res Function(_DeregisterDeviceFZ) _then;

  /// Create a copy of DeregisterDeviceFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? deregisterData = freezed,
  }) {
    return _then(_DeregisterDeviceFZ(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      deregisterData: freezed == deregisterData
          ? _self.deregisterData
          : deregisterData // ignore: cast_nullable_to_non_nullable
              as DeregisterData?,
    ));
  }

  /// Create a copy of DeregisterDeviceFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails {
    if (_self.customMessageDetails == null) {
      return null;
    }

    return $CustomMessageDetailsFZCopyWith<$Res>(_self.customMessageDetails!,
        (value) {
      return _then(_self.copyWith(customMessageDetails: value));
    });
  }

  /// Create a copy of DeregisterDeviceFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeregisterDataCopyWith<$Res>? get deregisterData {
    if (_self.deregisterData == null) {
      return null;
    }

    return $DeregisterDataCopyWith<$Res>(_self.deregisterData!, (value) {
      return _then(_self.copyWith(deregisterData: value));
    });
  }
}

/// @nodoc
mixin _$DeregisterData {
  @JsonKey(name: 'MessageCode')
  String get MessageCode;
  @JsonKey(name: 'MessageDetail')
  String get MessageDetail;

  /// Create a copy of DeregisterData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeregisterDataCopyWith<DeregisterData> get copyWith =>
      _$DeregisterDataCopyWithImpl<DeregisterData>(
          this as DeregisterData, _$identity);

  /// Serializes this DeregisterData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeregisterData &&
            (identical(other.MessageCode, MessageCode) ||
                other.MessageCode == MessageCode) &&
            (identical(other.MessageDetail, MessageDetail) ||
                other.MessageDetail == MessageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, MessageCode, MessageDetail);

  @override
  String toString() {
    return 'DeregisterData(MessageCode: $MessageCode, MessageDetail: $MessageDetail)';
  }
}

/// @nodoc
abstract mixin class $DeregisterDataCopyWith<$Res> {
  factory $DeregisterDataCopyWith(
          DeregisterData value, $Res Function(DeregisterData) _then) =
      _$DeregisterDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageCode') String MessageCode,
      @JsonKey(name: 'MessageDetail') String MessageDetail});
}

/// @nodoc
class _$DeregisterDataCopyWithImpl<$Res>
    implements $DeregisterDataCopyWith<$Res> {
  _$DeregisterDataCopyWithImpl(this._self, this._then);

  final DeregisterData _self;
  final $Res Function(DeregisterData) _then;

  /// Create a copy of DeregisterData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? MessageCode = null,
    Object? MessageDetail = null,
  }) {
    return _then(_self.copyWith(
      MessageCode: null == MessageCode
          ? _self.MessageCode
          : MessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      MessageDetail: null == MessageDetail
          ? _self.MessageDetail
          : MessageDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DeregisterData].
extension DeregisterDataPatterns on DeregisterData {
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
    TResult Function(_DeregisterData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeregisterData() when $default != null:
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
    TResult Function(_DeregisterData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeregisterData():
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
    TResult? Function(_DeregisterData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeregisterData() when $default != null:
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
    TResult Function(@JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageDetail') String MessageDetail)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DeregisterData() when $default != null:
        return $default(_that.MessageCode, _that.MessageDetail);
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
    TResult Function(@JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageDetail') String MessageDetail)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeregisterData():
        return $default(_that.MessageCode, _that.MessageDetail);
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
    TResult? Function(@JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageDetail') String MessageDetail)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DeregisterData() when $default != null:
        return $default(_that.MessageCode, _that.MessageDetail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DeregisterData implements DeregisterData {
  const _DeregisterData(
      {@JsonKey(name: 'MessageCode') this.MessageCode = '',
      @JsonKey(name: 'MessageDetail') this.MessageDetail = ''});
  factory _DeregisterData.fromJson(Map<String, dynamic> json) =>
      _$DeregisterDataFromJson(json);

  @override
  @JsonKey(name: 'MessageCode')
  final String MessageCode;
  @override
  @JsonKey(name: 'MessageDetail')
  final String MessageDetail;

  /// Create a copy of DeregisterData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeregisterDataCopyWith<_DeregisterData> get copyWith =>
      __$DeregisterDataCopyWithImpl<_DeregisterData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeregisterDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeregisterData &&
            (identical(other.MessageCode, MessageCode) ||
                other.MessageCode == MessageCode) &&
            (identical(other.MessageDetail, MessageDetail) ||
                other.MessageDetail == MessageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, MessageCode, MessageDetail);

  @override
  String toString() {
    return 'DeregisterData(MessageCode: $MessageCode, MessageDetail: $MessageDetail)';
  }
}

/// @nodoc
abstract mixin class _$DeregisterDataCopyWith<$Res>
    implements $DeregisterDataCopyWith<$Res> {
  factory _$DeregisterDataCopyWith(
          _DeregisterData value, $Res Function(_DeregisterData) _then) =
      __$DeregisterDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageCode') String MessageCode,
      @JsonKey(name: 'MessageDetail') String MessageDetail});
}

/// @nodoc
class __$DeregisterDataCopyWithImpl<$Res>
    implements _$DeregisterDataCopyWith<$Res> {
  __$DeregisterDataCopyWithImpl(this._self, this._then);

  final _DeregisterData _self;
  final $Res Function(_DeregisterData) _then;

  /// Create a copy of DeregisterData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? MessageCode = null,
    Object? MessageDetail = null,
  }) {
    return _then(_DeregisterData(
      MessageCode: null == MessageCode
          ? _self.MessageCode
          : MessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      MessageDetail: null == MessageDetail
          ? _self.MessageDetail
          : MessageDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
