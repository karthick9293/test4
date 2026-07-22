// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivacyPolicyFZ {
  @JsonKey(name: 'StatusCode')
  String get StatusCode;
  @JsonKey(name: 'StatusMessage')
  String get StatusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetailsFZ? get CustomMessageDetails;
  @JsonKey(name: 'Data')
  Data? get privacyData;

  /// Create a copy of PrivacyPolicyFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrivacyPolicyFZCopyWith<PrivacyPolicyFZ> get copyWith =>
      _$PrivacyPolicyFZCopyWithImpl<PrivacyPolicyFZ>(
          this as PrivacyPolicyFZ, _$identity);

  /// Serializes this PrivacyPolicyFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrivacyPolicyFZ &&
            (identical(other.StatusCode, StatusCode) ||
                other.StatusCode == StatusCode) &&
            (identical(other.StatusMessage, StatusMessage) ||
                other.StatusMessage == StatusMessage) &&
            (identical(other.CustomMessageDetails, CustomMessageDetails) ||
                other.CustomMessageDetails == CustomMessageDetails) &&
            (identical(other.privacyData, privacyData) ||
                other.privacyData == privacyData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, StatusCode, StatusMessage,
      CustomMessageDetails, privacyData);

  @override
  String toString() {
    return 'PrivacyPolicyFZ(StatusCode: $StatusCode, StatusMessage: $StatusMessage, CustomMessageDetails: $CustomMessageDetails, privacyData: $privacyData)';
  }
}

/// @nodoc
abstract mixin class $PrivacyPolicyFZCopyWith<$Res> {
  factory $PrivacyPolicyFZCopyWith(
          PrivacyPolicyFZ value, $Res Function(PrivacyPolicyFZ) _then) =
      _$PrivacyPolicyFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String StatusCode,
      @JsonKey(name: 'StatusMessage') String StatusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? CustomMessageDetails,
      @JsonKey(name: 'Data') Data? privacyData});

  $CustomMessageDetailsFZCopyWith<$Res>? get CustomMessageDetails;
  $DataCopyWith<$Res>? get privacyData;
}

/// @nodoc
class _$PrivacyPolicyFZCopyWithImpl<$Res>
    implements $PrivacyPolicyFZCopyWith<$Res> {
  _$PrivacyPolicyFZCopyWithImpl(this._self, this._then);

  final PrivacyPolicyFZ _self;
  final $Res Function(PrivacyPolicyFZ) _then;

  /// Create a copy of PrivacyPolicyFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? StatusCode = null,
    Object? StatusMessage = null,
    Object? CustomMessageDetails = freezed,
    Object? privacyData = freezed,
  }) {
    return _then(_self.copyWith(
      StatusCode: null == StatusCode
          ? _self.StatusCode
          : StatusCode // ignore: cast_nullable_to_non_nullable
              as String,
      StatusMessage: null == StatusMessage
          ? _self.StatusMessage
          : StatusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      CustomMessageDetails: freezed == CustomMessageDetails
          ? _self.CustomMessageDetails
          : CustomMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      privacyData: freezed == privacyData
          ? _self.privacyData
          : privacyData // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of PrivacyPolicyFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsFZCopyWith<$Res>? get CustomMessageDetails {
    if (_self.CustomMessageDetails == null) {
      return null;
    }

    return $CustomMessageDetailsFZCopyWith<$Res>(_self.CustomMessageDetails!,
        (value) {
      return _then(_self.copyWith(CustomMessageDetails: value));
    });
  }

  /// Create a copy of PrivacyPolicyFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get privacyData {
    if (_self.privacyData == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.privacyData!, (value) {
      return _then(_self.copyWith(privacyData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PrivacyPolicyFZ].
extension PrivacyPolicyFZPatterns on PrivacyPolicyFZ {
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
    TResult Function(_PrivacyPolicyFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyFZ() when $default != null:
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
    TResult Function(_PrivacyPolicyFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyFZ():
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
    TResult? Function(_PrivacyPolicyFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyFZ() when $default != null:
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
            @JsonKey(name: 'StatusCode') String StatusCode,
            @JsonKey(name: 'StatusMessage') String StatusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetailsFZ? CustomMessageDetails,
            @JsonKey(name: 'Data') Data? privacyData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyFZ() when $default != null:
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.CustomMessageDetails, _that.privacyData);
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
            @JsonKey(name: 'StatusCode') String StatusCode,
            @JsonKey(name: 'StatusMessage') String StatusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetailsFZ? CustomMessageDetails,
            @JsonKey(name: 'Data') Data? privacyData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyFZ():
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.CustomMessageDetails, _that.privacyData);
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
            @JsonKey(name: 'StatusCode') String StatusCode,
            @JsonKey(name: 'StatusMessage') String StatusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetailsFZ? CustomMessageDetails,
            @JsonKey(name: 'Data') Data? privacyData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyFZ() when $default != null:
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.CustomMessageDetails, _that.privacyData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PrivacyPolicyFZ implements PrivacyPolicyFZ {
  const _PrivacyPolicyFZ(
      {@JsonKey(name: 'StatusCode') this.StatusCode = '',
      @JsonKey(name: 'StatusMessage') this.StatusMessage = '',
      @JsonKey(name: 'CustomMessageDetails') this.CustomMessageDetails,
      @JsonKey(name: 'Data') this.privacyData});
  factory _PrivacyPolicyFZ.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String StatusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String StatusMessage;
  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetailsFZ? CustomMessageDetails;
  @override
  @JsonKey(name: 'Data')
  final Data? privacyData;

  /// Create a copy of PrivacyPolicyFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PrivacyPolicyFZCopyWith<_PrivacyPolicyFZ> get copyWith =>
      __$PrivacyPolicyFZCopyWithImpl<_PrivacyPolicyFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PrivacyPolicyFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PrivacyPolicyFZ &&
            (identical(other.StatusCode, StatusCode) ||
                other.StatusCode == StatusCode) &&
            (identical(other.StatusMessage, StatusMessage) ||
                other.StatusMessage == StatusMessage) &&
            (identical(other.CustomMessageDetails, CustomMessageDetails) ||
                other.CustomMessageDetails == CustomMessageDetails) &&
            (identical(other.privacyData, privacyData) ||
                other.privacyData == privacyData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, StatusCode, StatusMessage,
      CustomMessageDetails, privacyData);

  @override
  String toString() {
    return 'PrivacyPolicyFZ(StatusCode: $StatusCode, StatusMessage: $StatusMessage, CustomMessageDetails: $CustomMessageDetails, privacyData: $privacyData)';
  }
}

/// @nodoc
abstract mixin class _$PrivacyPolicyFZCopyWith<$Res>
    implements $PrivacyPolicyFZCopyWith<$Res> {
  factory _$PrivacyPolicyFZCopyWith(
          _PrivacyPolicyFZ value, $Res Function(_PrivacyPolicyFZ) _then) =
      __$PrivacyPolicyFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String StatusCode,
      @JsonKey(name: 'StatusMessage') String StatusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? CustomMessageDetails,
      @JsonKey(name: 'Data') Data? privacyData});

  @override
  $CustomMessageDetailsFZCopyWith<$Res>? get CustomMessageDetails;
  @override
  $DataCopyWith<$Res>? get privacyData;
}

/// @nodoc
class __$PrivacyPolicyFZCopyWithImpl<$Res>
    implements _$PrivacyPolicyFZCopyWith<$Res> {
  __$PrivacyPolicyFZCopyWithImpl(this._self, this._then);

  final _PrivacyPolicyFZ _self;
  final $Res Function(_PrivacyPolicyFZ) _then;

  /// Create a copy of PrivacyPolicyFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? StatusCode = null,
    Object? StatusMessage = null,
    Object? CustomMessageDetails = freezed,
    Object? privacyData = freezed,
  }) {
    return _then(_PrivacyPolicyFZ(
      StatusCode: null == StatusCode
          ? _self.StatusCode
          : StatusCode // ignore: cast_nullable_to_non_nullable
              as String,
      StatusMessage: null == StatusMessage
          ? _self.StatusMessage
          : StatusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      CustomMessageDetails: freezed == CustomMessageDetails
          ? _self.CustomMessageDetails
          : CustomMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      privacyData: freezed == privacyData
          ? _self.privacyData
          : privacyData // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of PrivacyPolicyFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsFZCopyWith<$Res>? get CustomMessageDetails {
    if (_self.CustomMessageDetails == null) {
      return null;
    }

    return $CustomMessageDetailsFZCopyWith<$Res>(_self.CustomMessageDetails!,
        (value) {
      return _then(_self.copyWith(CustomMessageDetails: value));
    });
  }

  /// Create a copy of PrivacyPolicyFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get privacyData {
    if (_self.privacyData == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.privacyData!, (value) {
      return _then(_self.copyWith(privacyData: value));
    });
  }
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'MessageCode')
  String get messageCode;
  @JsonKey(name: 'MessageDetail')
  String get messageDetail;
  @JsonKey(name: 'PrivacyPolicyDetails')
  List<PrivacyPolicyDetails> get privacyPolicyDetails;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this as Data, _$identity);

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Data &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail) &&
            const DeepCollectionEquality()
                .equals(other.privacyPolicyDetails, privacyPolicyDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageCode, messageDetail,
      const DeepCollectionEquality().hash(privacyPolicyDetails));

  @override
  String toString() {
    return 'Data(messageCode: $messageCode, messageDetail: $messageDetail, privacyPolicyDetails: $privacyPolicyDetails)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageDetail') String messageDetail,
      @JsonKey(name: 'PrivacyPolicyDetails')
      List<PrivacyPolicyDetails> privacyPolicyDetails});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageCode = null,
    Object? messageDetail = null,
    Object? privacyPolicyDetails = null,
  }) {
    return _then(_self.copyWith(
      messageCode: null == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String,
      messageDetail: null == messageDetail
          ? _self.messageDetail
          : messageDetail // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyDetails: null == privacyPolicyDetails
          ? _self.privacyPolicyDetails
          : privacyPolicyDetails // ignore: cast_nullable_to_non_nullable
              as List<PrivacyPolicyDetails>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Data].
extension DataPatterns on Data {
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
    TResult Function(_Data value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
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
    TResult Function(_Data value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
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
    TResult? Function(_Data value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
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
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail,
            @JsonKey(name: 'PrivacyPolicyDetails')
            List<PrivacyPolicyDetails> privacyPolicyDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.messageCode, _that.messageDetail, _that.privacyPolicyDetails);
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
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail,
            @JsonKey(name: 'PrivacyPolicyDetails')
            List<PrivacyPolicyDetails> privacyPolicyDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(
            _that.messageCode, _that.messageDetail, _that.privacyPolicyDetails);
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
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail,
            @JsonKey(name: 'PrivacyPolicyDetails')
            List<PrivacyPolicyDetails> privacyPolicyDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.messageCode, _that.messageDetail, _that.privacyPolicyDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: 'MessageCode') this.messageCode = '',
      @JsonKey(name: 'MessageDetail') this.messageDetail = '',
      @JsonKey(name: 'PrivacyPolicyDetails')
      final List<PrivacyPolicyDetails> privacyPolicyDetails = const []})
      : _privacyPolicyDetails = privacyPolicyDetails;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  @JsonKey(name: 'MessageCode')
  final String messageCode;
  @override
  @JsonKey(name: 'MessageDetail')
  final String messageDetail;
  final List<PrivacyPolicyDetails> _privacyPolicyDetails;
  @override
  @JsonKey(name: 'PrivacyPolicyDetails')
  List<PrivacyPolicyDetails> get privacyPolicyDetails {
    if (_privacyPolicyDetails is EqualUnmodifiableListView)
      return _privacyPolicyDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_privacyPolicyDetails);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Data &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail) &&
            const DeepCollectionEquality()
                .equals(other._privacyPolicyDetails, _privacyPolicyDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageCode, messageDetail,
      const DeepCollectionEquality().hash(_privacyPolicyDetails));

  @override
  String toString() {
    return 'Data(messageCode: $messageCode, messageDetail: $messageDetail, privacyPolicyDetails: $privacyPolicyDetails)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageDetail') String messageDetail,
      @JsonKey(name: 'PrivacyPolicyDetails')
      List<PrivacyPolicyDetails> privacyPolicyDetails});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messageCode = null,
    Object? messageDetail = null,
    Object? privacyPolicyDetails = null,
  }) {
    return _then(_Data(
      messageCode: null == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String,
      messageDetail: null == messageDetail
          ? _self.messageDetail
          : messageDetail // ignore: cast_nullable_to_non_nullable
              as String,
      privacyPolicyDetails: null == privacyPolicyDetails
          ? _self._privacyPolicyDetails
          : privacyPolicyDetails // ignore: cast_nullable_to_non_nullable
              as List<PrivacyPolicyDetails>,
    ));
  }
}

/// @nodoc
mixin _$PrivacyPolicyDetails {
  @JsonKey(name: 'Description')
  String get description;
  @JsonKey(name: 'LanguageCode')
  String get languageCode;

  /// Create a copy of PrivacyPolicyDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrivacyPolicyDetailsCopyWith<PrivacyPolicyDetails> get copyWith =>
      _$PrivacyPolicyDetailsCopyWithImpl<PrivacyPolicyDetails>(
          this as PrivacyPolicyDetails, _$identity);

  /// Serializes this PrivacyPolicyDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrivacyPolicyDetails &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, languageCode);

  @override
  String toString() {
    return 'PrivacyPolicyDetails(description: $description, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $PrivacyPolicyDetailsCopyWith<$Res> {
  factory $PrivacyPolicyDetailsCopyWith(PrivacyPolicyDetails value,
          $Res Function(PrivacyPolicyDetails) _then) =
      _$PrivacyPolicyDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Description') String description,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class _$PrivacyPolicyDetailsCopyWithImpl<$Res>
    implements $PrivacyPolicyDetailsCopyWith<$Res> {
  _$PrivacyPolicyDetailsCopyWithImpl(this._self, this._then);

  final PrivacyPolicyDetails _self;
  final $Res Function(PrivacyPolicyDetails) _then;

  /// Create a copy of PrivacyPolicyDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? languageCode = null,
  }) {
    return _then(_self.copyWith(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PrivacyPolicyDetails].
extension PrivacyPolicyDetailsPatterns on PrivacyPolicyDetails {
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
    TResult Function(_PrivacyPolicyDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDetails() when $default != null:
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
    TResult Function(_PrivacyPolicyDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDetails():
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
    TResult? Function(_PrivacyPolicyDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDetails() when $default != null:
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
    TResult Function(@JsonKey(name: 'Description') String description,
            @JsonKey(name: 'LanguageCode') String languageCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDetails() when $default != null:
        return $default(_that.description, _that.languageCode);
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
    TResult Function(@JsonKey(name: 'Description') String description,
            @JsonKey(name: 'LanguageCode') String languageCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDetails():
        return $default(_that.description, _that.languageCode);
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
    TResult? Function(@JsonKey(name: 'Description') String description,
            @JsonKey(name: 'LanguageCode') String languageCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PrivacyPolicyDetails() when $default != null:
        return $default(_that.description, _that.languageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PrivacyPolicyDetails implements PrivacyPolicyDetails {
  const _PrivacyPolicyDetails(
      {@JsonKey(name: 'Description') this.description = '',
      @JsonKey(name: 'LanguageCode') this.languageCode = ''});
  factory _PrivacyPolicyDetails.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyDetailsFromJson(json);

  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// Create a copy of PrivacyPolicyDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PrivacyPolicyDetailsCopyWith<_PrivacyPolicyDetails> get copyWith =>
      __$PrivacyPolicyDetailsCopyWithImpl<_PrivacyPolicyDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PrivacyPolicyDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PrivacyPolicyDetails &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, languageCode);

  @override
  String toString() {
    return 'PrivacyPolicyDetails(description: $description, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class _$PrivacyPolicyDetailsCopyWith<$Res>
    implements $PrivacyPolicyDetailsCopyWith<$Res> {
  factory _$PrivacyPolicyDetailsCopyWith(_PrivacyPolicyDetails value,
          $Res Function(_PrivacyPolicyDetails) _then) =
      __$PrivacyPolicyDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Description') String description,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class __$PrivacyPolicyDetailsCopyWithImpl<$Res>
    implements _$PrivacyPolicyDetailsCopyWith<$Res> {
  __$PrivacyPolicyDetailsCopyWithImpl(this._self, this._then);

  final _PrivacyPolicyDetails _self;
  final $Res Function(_PrivacyPolicyDetails) _then;

  /// Create a copy of PrivacyPolicyDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? languageCode = null,
  }) {
    return _then(_PrivacyPolicyDetails(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
