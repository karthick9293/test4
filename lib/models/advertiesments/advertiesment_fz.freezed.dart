// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advertiesment_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdvertiesmentFZ {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetailsFZ? get customMessageDetails;
  @JsonKey(name: 'Data')
  AdvertiesmentData? get advertiesmentData;

  /// Create a copy of AdvertiesmentFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdvertiesmentFZCopyWith<AdvertiesmentFZ> get copyWith =>
      _$AdvertiesmentFZCopyWithImpl<AdvertiesmentFZ>(
          this as AdvertiesmentFZ, _$identity);

  /// Serializes this AdvertiesmentFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdvertiesmentFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.advertiesmentData, advertiesmentData) ||
                other.advertiesmentData == advertiesmentData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      customMessageDetails, advertiesmentData);

  @override
  String toString() {
    return 'AdvertiesmentFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, advertiesmentData: $advertiesmentData)';
  }
}

/// @nodoc
abstract mixin class $AdvertiesmentFZCopyWith<$Res> {
  factory $AdvertiesmentFZCopyWith(
          AdvertiesmentFZ value, $Res Function(AdvertiesmentFZ) _then) =
      _$AdvertiesmentFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetails,
      @JsonKey(name: 'Data') AdvertiesmentData? advertiesmentData});

  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails;
  $AdvertiesmentDataCopyWith<$Res>? get advertiesmentData;
}

/// @nodoc
class _$AdvertiesmentFZCopyWithImpl<$Res>
    implements $AdvertiesmentFZCopyWith<$Res> {
  _$AdvertiesmentFZCopyWithImpl(this._self, this._then);

  final AdvertiesmentFZ _self;
  final $Res Function(AdvertiesmentFZ) _then;

  /// Create a copy of AdvertiesmentFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? advertiesmentData = freezed,
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
      advertiesmentData: freezed == advertiesmentData
          ? _self.advertiesmentData
          : advertiesmentData // ignore: cast_nullable_to_non_nullable
              as AdvertiesmentData?,
    ));
  }

  /// Create a copy of AdvertiesmentFZ
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

  /// Create a copy of AdvertiesmentFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdvertiesmentDataCopyWith<$Res>? get advertiesmentData {
    if (_self.advertiesmentData == null) {
      return null;
    }

    return $AdvertiesmentDataCopyWith<$Res>(_self.advertiesmentData!, (value) {
      return _then(_self.copyWith(advertiesmentData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AdvertiesmentFZ].
extension AdvertiesmentFZPatterns on AdvertiesmentFZ {
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
    TResult Function(_AdvertiesmentFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentFZ() when $default != null:
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
    TResult Function(_AdvertiesmentFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentFZ():
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
    TResult? Function(_AdvertiesmentFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentFZ() when $default != null:
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
            @JsonKey(name: 'Data') AdvertiesmentData? advertiesmentData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.advertiesmentData);
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
            @JsonKey(name: 'Data') AdvertiesmentData? advertiesmentData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentFZ():
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.advertiesmentData);
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
            @JsonKey(name: 'Data') AdvertiesmentData? advertiesmentData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.advertiesmentData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdvertiesmentFZ implements AdvertiesmentFZ {
  const _AdvertiesmentFZ(
      {@JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails,
      @JsonKey(name: 'Data') this.advertiesmentData});
  factory _AdvertiesmentFZ.fromJson(Map<String, dynamic> json) =>
      _$AdvertiesmentFZFromJson(json);

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
  final AdvertiesmentData? advertiesmentData;

  /// Create a copy of AdvertiesmentFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdvertiesmentFZCopyWith<_AdvertiesmentFZ> get copyWith =>
      __$AdvertiesmentFZCopyWithImpl<_AdvertiesmentFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdvertiesmentFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdvertiesmentFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.advertiesmentData, advertiesmentData) ||
                other.advertiesmentData == advertiesmentData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      customMessageDetails, advertiesmentData);

  @override
  String toString() {
    return 'AdvertiesmentFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, advertiesmentData: $advertiesmentData)';
  }
}

/// @nodoc
abstract mixin class _$AdvertiesmentFZCopyWith<$Res>
    implements $AdvertiesmentFZCopyWith<$Res> {
  factory _$AdvertiesmentFZCopyWith(
          _AdvertiesmentFZ value, $Res Function(_AdvertiesmentFZ) _then) =
      __$AdvertiesmentFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetails,
      @JsonKey(name: 'Data') AdvertiesmentData? advertiesmentData});

  @override
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails;
  @override
  $AdvertiesmentDataCopyWith<$Res>? get advertiesmentData;
}

/// @nodoc
class __$AdvertiesmentFZCopyWithImpl<$Res>
    implements _$AdvertiesmentFZCopyWith<$Res> {
  __$AdvertiesmentFZCopyWithImpl(this._self, this._then);

  final _AdvertiesmentFZ _self;
  final $Res Function(_AdvertiesmentFZ) _then;

  /// Create a copy of AdvertiesmentFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? advertiesmentData = freezed,
  }) {
    return _then(_AdvertiesmentFZ(
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
      advertiesmentData: freezed == advertiesmentData
          ? _self.advertiesmentData
          : advertiesmentData // ignore: cast_nullable_to_non_nullable
              as AdvertiesmentData?,
    ));
  }

  /// Create a copy of AdvertiesmentFZ
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

  /// Create a copy of AdvertiesmentFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdvertiesmentDataCopyWith<$Res>? get advertiesmentData {
    if (_self.advertiesmentData == null) {
      return null;
    }

    return $AdvertiesmentDataCopyWith<$Res>(_self.advertiesmentData!, (value) {
      return _then(_self.copyWith(advertiesmentData: value));
    });
  }
}

/// @nodoc
mixin _$AdvertiesmentData {
  @JsonKey(name: 'AdvertisementList')
  List<AdvertisementList> get advertisementList;
  @JsonKey(name: 'MessageCode')
  String get messageCode;
  @JsonKey(name: 'MessageDetail')
  String get messageDetail;

  /// Create a copy of AdvertiesmentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdvertiesmentDataCopyWith<AdvertiesmentData> get copyWith =>
      _$AdvertiesmentDataCopyWithImpl<AdvertiesmentData>(
          this as AdvertiesmentData, _$identity);

  /// Serializes this AdvertiesmentData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdvertiesmentData &&
            const DeepCollectionEquality()
                .equals(other.advertisementList, advertisementList) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(advertisementList),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'AdvertiesmentData(advertisementList: $advertisementList, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class $AdvertiesmentDataCopyWith<$Res> {
  factory $AdvertiesmentDataCopyWith(
          AdvertiesmentData value, $Res Function(AdvertiesmentData) _then) =
      _$AdvertiesmentDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'AdvertisementList')
      List<AdvertisementList> advertisementList,
      @JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageDetail') String messageDetail});
}

/// @nodoc
class _$AdvertiesmentDataCopyWithImpl<$Res>
    implements $AdvertiesmentDataCopyWith<$Res> {
  _$AdvertiesmentDataCopyWithImpl(this._self, this._then);

  final AdvertiesmentData _self;
  final $Res Function(AdvertiesmentData) _then;

  /// Create a copy of AdvertiesmentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advertisementList = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_self.copyWith(
      advertisementList: null == advertisementList
          ? _self.advertisementList
          : advertisementList // ignore: cast_nullable_to_non_nullable
              as List<AdvertisementList>,
      messageCode: null == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String,
      messageDetail: null == messageDetail
          ? _self.messageDetail
          : messageDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdvertiesmentData].
extension AdvertiesmentDataPatterns on AdvertiesmentData {
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
    TResult Function(_AdvertiesmentData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentData() when $default != null:
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
    TResult Function(_AdvertiesmentData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentData():
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
    TResult? Function(_AdvertiesmentData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentData() when $default != null:
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
            @JsonKey(name: 'AdvertisementList')
            List<AdvertisementList> advertisementList,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentData() when $default != null:
        return $default(
            _that.advertisementList, _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: 'AdvertisementList')
            List<AdvertisementList> advertisementList,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentData():
        return $default(
            _that.advertisementList, _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: 'AdvertisementList')
            List<AdvertisementList> advertisementList,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertiesmentData() when $default != null:
        return $default(
            _that.advertisementList, _that.messageCode, _that.messageDetail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdvertiesmentData implements AdvertiesmentData {
  const _AdvertiesmentData(
      {@JsonKey(name: 'AdvertisementList')
      final List<AdvertisementList> advertisementList = const [],
      @JsonKey(name: 'MessageCode') this.messageCode = '',
      @JsonKey(name: 'MessageDetail') this.messageDetail = ''})
      : _advertisementList = advertisementList;
  factory _AdvertiesmentData.fromJson(Map<String, dynamic> json) =>
      _$AdvertiesmentDataFromJson(json);

  final List<AdvertisementList> _advertisementList;
  @override
  @JsonKey(name: 'AdvertisementList')
  List<AdvertisementList> get advertisementList {
    if (_advertisementList is EqualUnmodifiableListView)
      return _advertisementList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_advertisementList);
  }

  @override
  @JsonKey(name: 'MessageCode')
  final String messageCode;
  @override
  @JsonKey(name: 'MessageDetail')
  final String messageDetail;

  /// Create a copy of AdvertiesmentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdvertiesmentDataCopyWith<_AdvertiesmentData> get copyWith =>
      __$AdvertiesmentDataCopyWithImpl<_AdvertiesmentData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdvertiesmentDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdvertiesmentData &&
            const DeepCollectionEquality()
                .equals(other._advertisementList, _advertisementList) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_advertisementList),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'AdvertiesmentData(advertisementList: $advertisementList, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class _$AdvertiesmentDataCopyWith<$Res>
    implements $AdvertiesmentDataCopyWith<$Res> {
  factory _$AdvertiesmentDataCopyWith(
          _AdvertiesmentData value, $Res Function(_AdvertiesmentData) _then) =
      __$AdvertiesmentDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AdvertisementList')
      List<AdvertisementList> advertisementList,
      @JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageDetail') String messageDetail});
}

/// @nodoc
class __$AdvertiesmentDataCopyWithImpl<$Res>
    implements _$AdvertiesmentDataCopyWith<$Res> {
  __$AdvertiesmentDataCopyWithImpl(this._self, this._then);

  final _AdvertiesmentData _self;
  final $Res Function(_AdvertiesmentData) _then;

  /// Create a copy of AdvertiesmentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? advertisementList = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_AdvertiesmentData(
      advertisementList: null == advertisementList
          ? _self._advertisementList
          : advertisementList // ignore: cast_nullable_to_non_nullable
              as List<AdvertisementList>,
      messageCode: null == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String,
      messageDetail: null == messageDetail
          ? _self.messageDetail
          : messageDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AdvertisementList {
  @JsonKey(name: 'Code')
  String get code;
  @JsonKey(name: 'DisplayFormat')
  String get displayFormat;
  @JsonKey(name: 'FileContent')
  String get fileContent;
  @JsonKey(name: 'RedirectUrl')
  String get redirectUrl;
  @JsonKey(name: 'FileUrl')
  String get fileUrl;
  @JsonKey(name: 'Status')
  String get status;

  /// Create a copy of AdvertisementList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdvertisementListCopyWith<AdvertisementList> get copyWith =>
      _$AdvertisementListCopyWithImpl<AdvertisementList>(
          this as AdvertisementList, _$identity);

  /// Serializes this AdvertisementList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdvertisementList &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.displayFormat, displayFormat) ||
                other.displayFormat == displayFormat) &&
            (identical(other.fileContent, fileContent) ||
                other.fileContent == fileContent) &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, displayFormat, fileContent,
      redirectUrl, fileUrl, status);

  @override
  String toString() {
    return 'AdvertisementList(code: $code, displayFormat: $displayFormat, fileContent: $fileContent, redirectUrl: $redirectUrl, fileUrl: $fileUrl, status: $status)';
  }
}

/// @nodoc
abstract mixin class $AdvertisementListCopyWith<$Res> {
  factory $AdvertisementListCopyWith(
          AdvertisementList value, $Res Function(AdvertisementList) _then) =
      _$AdvertisementListCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') String code,
      @JsonKey(name: 'DisplayFormat') String displayFormat,
      @JsonKey(name: 'FileContent') String fileContent,
      @JsonKey(name: 'RedirectUrl') String redirectUrl,
      @JsonKey(name: 'FileUrl') String fileUrl,
      @JsonKey(name: 'Status') String status});
}

/// @nodoc
class _$AdvertisementListCopyWithImpl<$Res>
    implements $AdvertisementListCopyWith<$Res> {
  _$AdvertisementListCopyWithImpl(this._self, this._then);

  final AdvertisementList _self;
  final $Res Function(AdvertisementList) _then;

  /// Create a copy of AdvertisementList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? displayFormat = null,
    Object? fileContent = null,
    Object? redirectUrl = null,
    Object? fileUrl = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      displayFormat: null == displayFormat
          ? _self.displayFormat
          : displayFormat // ignore: cast_nullable_to_non_nullable
              as String,
      fileContent: null == fileContent
          ? _self.fileContent
          : fileContent // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUrl: null == redirectUrl
          ? _self.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AdvertisementList].
extension AdvertisementListPatterns on AdvertisementList {
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
    TResult Function(_AdvertisementList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdvertisementList() when $default != null:
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
    TResult Function(_AdvertisementList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertisementList():
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
    TResult? Function(_AdvertisementList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertisementList() when $default != null:
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
            @JsonKey(name: 'Code') String code,
            @JsonKey(name: 'DisplayFormat') String displayFormat,
            @JsonKey(name: 'FileContent') String fileContent,
            @JsonKey(name: 'RedirectUrl') String redirectUrl,
            @JsonKey(name: 'FileUrl') String fileUrl,
            @JsonKey(name: 'Status') String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdvertisementList() when $default != null:
        return $default(_that.code, _that.displayFormat, _that.fileContent,
            _that.redirectUrl, _that.fileUrl, _that.status);
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
            @JsonKey(name: 'Code') String code,
            @JsonKey(name: 'DisplayFormat') String displayFormat,
            @JsonKey(name: 'FileContent') String fileContent,
            @JsonKey(name: 'RedirectUrl') String redirectUrl,
            @JsonKey(name: 'FileUrl') String fileUrl,
            @JsonKey(name: 'Status') String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertisementList():
        return $default(_that.code, _that.displayFormat, _that.fileContent,
            _that.redirectUrl, _that.fileUrl, _that.status);
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
            @JsonKey(name: 'Code') String code,
            @JsonKey(name: 'DisplayFormat') String displayFormat,
            @JsonKey(name: 'FileContent') String fileContent,
            @JsonKey(name: 'RedirectUrl') String redirectUrl,
            @JsonKey(name: 'FileUrl') String fileUrl,
            @JsonKey(name: 'Status') String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdvertisementList() when $default != null:
        return $default(_that.code, _that.displayFormat, _that.fileContent,
            _that.redirectUrl, _that.fileUrl, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AdvertisementList implements AdvertisementList {
  const _AdvertisementList(
      {@JsonKey(name: 'Code') this.code = '',
      @JsonKey(name: 'DisplayFormat') this.displayFormat = '',
      @JsonKey(name: 'FileContent') this.fileContent = '',
      @JsonKey(name: 'RedirectUrl') this.redirectUrl = '',
      @JsonKey(name: 'FileUrl') this.fileUrl = '',
      @JsonKey(name: 'Status') this.status = ''});
  factory _AdvertisementList.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementListFromJson(json);

  @override
  @JsonKey(name: 'Code')
  final String code;
  @override
  @JsonKey(name: 'DisplayFormat')
  final String displayFormat;
  @override
  @JsonKey(name: 'FileContent')
  final String fileContent;
  @override
  @JsonKey(name: 'RedirectUrl')
  final String redirectUrl;
  @override
  @JsonKey(name: 'FileUrl')
  final String fileUrl;
  @override
  @JsonKey(name: 'Status')
  final String status;

  /// Create a copy of AdvertisementList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdvertisementListCopyWith<_AdvertisementList> get copyWith =>
      __$AdvertisementListCopyWithImpl<_AdvertisementList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AdvertisementListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdvertisementList &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.displayFormat, displayFormat) ||
                other.displayFormat == displayFormat) &&
            (identical(other.fileContent, fileContent) ||
                other.fileContent == fileContent) &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, displayFormat, fileContent,
      redirectUrl, fileUrl, status);

  @override
  String toString() {
    return 'AdvertisementList(code: $code, displayFormat: $displayFormat, fileContent: $fileContent, redirectUrl: $redirectUrl, fileUrl: $fileUrl, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$AdvertisementListCopyWith<$Res>
    implements $AdvertisementListCopyWith<$Res> {
  factory _$AdvertisementListCopyWith(
          _AdvertisementList value, $Res Function(_AdvertisementList) _then) =
      __$AdvertisementListCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') String code,
      @JsonKey(name: 'DisplayFormat') String displayFormat,
      @JsonKey(name: 'FileContent') String fileContent,
      @JsonKey(name: 'RedirectUrl') String redirectUrl,
      @JsonKey(name: 'FileUrl') String fileUrl,
      @JsonKey(name: 'Status') String status});
}

/// @nodoc
class __$AdvertisementListCopyWithImpl<$Res>
    implements _$AdvertisementListCopyWith<$Res> {
  __$AdvertisementListCopyWithImpl(this._self, this._then);

  final _AdvertisementList _self;
  final $Res Function(_AdvertisementList) _then;

  /// Create a copy of AdvertisementList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
    Object? displayFormat = null,
    Object? fileContent = null,
    Object? redirectUrl = null,
    Object? fileUrl = null,
    Object? status = null,
  }) {
    return _then(_AdvertisementList(
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      displayFormat: null == displayFormat
          ? _self.displayFormat
          : displayFormat // ignore: cast_nullable_to_non_nullable
              as String,
      fileContent: null == fileContent
          ? _self.fileContent
          : fileContent // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUrl: null == redirectUrl
          ? _self.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
