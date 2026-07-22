// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faqfz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FAQFZ {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetailsFZ? get customMessageDetails;
  @JsonKey(name: 'Data')
  FAQData? get faqData;

  /// Create a copy of FAQFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FAQFZCopyWith<FAQFZ> get copyWith =>
      _$FAQFZCopyWithImpl<FAQFZ>(this as FAQFZ, _$identity);

  /// Serializes this FAQFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FAQFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.faqData, faqData) || other.faqData == faqData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessage, customMessageDetails, faqData);

  @override
  String toString() {
    return 'FAQFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, faqData: $faqData)';
  }
}

/// @nodoc
abstract mixin class $FAQFZCopyWith<$Res> {
  factory $FAQFZCopyWith(FAQFZ value, $Res Function(FAQFZ) _then) =
      _$FAQFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetails,
      @JsonKey(name: 'Data') FAQData? faqData});

  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails;
  $FAQDataCopyWith<$Res>? get faqData;
}

/// @nodoc
class _$FAQFZCopyWithImpl<$Res> implements $FAQFZCopyWith<$Res> {
  _$FAQFZCopyWithImpl(this._self, this._then);

  final FAQFZ _self;
  final $Res Function(FAQFZ) _then;

  /// Create a copy of FAQFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? faqData = freezed,
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
      faqData: freezed == faqData
          ? _self.faqData
          : faqData // ignore: cast_nullable_to_non_nullable
              as FAQData?,
    ));
  }

  /// Create a copy of FAQFZ
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

  /// Create a copy of FAQFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FAQDataCopyWith<$Res>? get faqData {
    if (_self.faqData == null) {
      return null;
    }

    return $FAQDataCopyWith<$Res>(_self.faqData!, (value) {
      return _then(_self.copyWith(faqData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FAQFZ].
extension FAQFZPatterns on FAQFZ {
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
    TResult Function(_FAQFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FAQFZ() when $default != null:
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
    TResult Function(_FAQFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FAQFZ():
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
    TResult? Function(_FAQFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FAQFZ() when $default != null:
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
            @JsonKey(name: 'Data') FAQData? faqData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FAQFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.faqData);
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
            @JsonKey(name: 'Data') FAQData? faqData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FAQFZ():
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.faqData);
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
            @JsonKey(name: 'Data') FAQData? faqData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FAQFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.faqData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FAQFZ implements FAQFZ {
  const _FAQFZ(
      {@JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails,
      @JsonKey(name: 'Data') this.faqData});
  factory _FAQFZ.fromJson(Map<String, dynamic> json) => _$FAQFZFromJson(json);

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
  final FAQData? faqData;

  /// Create a copy of FAQFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FAQFZCopyWith<_FAQFZ> get copyWith =>
      __$FAQFZCopyWithImpl<_FAQFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FAQFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FAQFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.faqData, faqData) || other.faqData == faqData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessage, customMessageDetails, faqData);

  @override
  String toString() {
    return 'FAQFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, faqData: $faqData)';
  }
}

/// @nodoc
abstract mixin class _$FAQFZCopyWith<$Res> implements $FAQFZCopyWith<$Res> {
  factory _$FAQFZCopyWith(_FAQFZ value, $Res Function(_FAQFZ) _then) =
      __$FAQFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetails,
      @JsonKey(name: 'Data') FAQData? faqData});

  @override
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails;
  @override
  $FAQDataCopyWith<$Res>? get faqData;
}

/// @nodoc
class __$FAQFZCopyWithImpl<$Res> implements _$FAQFZCopyWith<$Res> {
  __$FAQFZCopyWithImpl(this._self, this._then);

  final _FAQFZ _self;
  final $Res Function(_FAQFZ) _then;

  /// Create a copy of FAQFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? faqData = freezed,
  }) {
    return _then(_FAQFZ(
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
      faqData: freezed == faqData
          ? _self.faqData
          : faqData // ignore: cast_nullable_to_non_nullable
              as FAQData?,
    ));
  }

  /// Create a copy of FAQFZ
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

  /// Create a copy of FAQFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FAQDataCopyWith<$Res>? get faqData {
    if (_self.faqData == null) {
      return null;
    }

    return $FAQDataCopyWith<$Res>(_self.faqData!, (value) {
      return _then(_self.copyWith(faqData: value));
    });
  }
}

/// @nodoc
mixin _$FAQData {
  @JsonKey(name: 'FaqResponselist')
  List<FaqResponselist> get faqResponselist;
  @JsonKey(name: 'MessageCode')
  String get messageCode;
  @JsonKey(name: 'MessageDetail')
  String get messageDetail;

  /// Create a copy of FAQData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FAQDataCopyWith<FAQData> get copyWith =>
      _$FAQDataCopyWithImpl<FAQData>(this as FAQData, _$identity);

  /// Serializes this FAQData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FAQData &&
            const DeepCollectionEquality()
                .equals(other.faqResponselist, faqResponselist) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(faqResponselist),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'FAQData(faqResponselist: $faqResponselist, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class $FAQDataCopyWith<$Res> {
  factory $FAQDataCopyWith(FAQData value, $Res Function(FAQData) _then) =
      _$FAQDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'FaqResponselist') List<FaqResponselist> faqResponselist,
      @JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageDetail') String messageDetail});
}

/// @nodoc
class _$FAQDataCopyWithImpl<$Res> implements $FAQDataCopyWith<$Res> {
  _$FAQDataCopyWithImpl(this._self, this._then);

  final FAQData _self;
  final $Res Function(FAQData) _then;

  /// Create a copy of FAQData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? faqResponselist = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_self.copyWith(
      faqResponselist: null == faqResponselist
          ? _self.faqResponselist
          : faqResponselist // ignore: cast_nullable_to_non_nullable
              as List<FaqResponselist>,
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

/// Adds pattern-matching-related methods to [FAQData].
extension FAQDataPatterns on FAQData {
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
    TResult Function(_FAQData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FAQData() when $default != null:
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
    TResult Function(_FAQData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FAQData():
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
    TResult? Function(_FAQData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FAQData() when $default != null:
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
            @JsonKey(name: 'FaqResponselist')
            List<FaqResponselist> faqResponselist,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FAQData() when $default != null:
        return $default(
            _that.faqResponselist, _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: 'FaqResponselist')
            List<FaqResponselist> faqResponselist,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FAQData():
        return $default(
            _that.faqResponselist, _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: 'FaqResponselist')
            List<FaqResponselist> faqResponselist,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FAQData() when $default != null:
        return $default(
            _that.faqResponselist, _that.messageCode, _that.messageDetail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FAQData implements FAQData {
  const _FAQData(
      {@JsonKey(name: 'FaqResponselist')
      final List<FaqResponselist> faqResponselist = const [],
      @JsonKey(name: 'MessageCode') this.messageCode = '',
      @JsonKey(name: 'MessageDetail') this.messageDetail = ''})
      : _faqResponselist = faqResponselist;
  factory _FAQData.fromJson(Map<String, dynamic> json) =>
      _$FAQDataFromJson(json);

  final List<FaqResponselist> _faqResponselist;
  @override
  @JsonKey(name: 'FaqResponselist')
  List<FaqResponselist> get faqResponselist {
    if (_faqResponselist is EqualUnmodifiableListView) return _faqResponselist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqResponselist);
  }

  @override
  @JsonKey(name: 'MessageCode')
  final String messageCode;
  @override
  @JsonKey(name: 'MessageDetail')
  final String messageDetail;

  /// Create a copy of FAQData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FAQDataCopyWith<_FAQData> get copyWith =>
      __$FAQDataCopyWithImpl<_FAQData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FAQDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FAQData &&
            const DeepCollectionEquality()
                .equals(other._faqResponselist, _faqResponselist) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_faqResponselist),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'FAQData(faqResponselist: $faqResponselist, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class _$FAQDataCopyWith<$Res> implements $FAQDataCopyWith<$Res> {
  factory _$FAQDataCopyWith(_FAQData value, $Res Function(_FAQData) _then) =
      __$FAQDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'FaqResponselist') List<FaqResponselist> faqResponselist,
      @JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageDetail') String messageDetail});
}

/// @nodoc
class __$FAQDataCopyWithImpl<$Res> implements _$FAQDataCopyWith<$Res> {
  __$FAQDataCopyWithImpl(this._self, this._then);

  final _FAQData _self;
  final $Res Function(_FAQData) _then;

  /// Create a copy of FAQData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? faqResponselist = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_FAQData(
      faqResponselist: null == faqResponselist
          ? _self._faqResponselist
          : faqResponselist // ignore: cast_nullable_to_non_nullable
              as List<FaqResponselist>,
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
mixin _$FaqResponselist {
  @JsonKey(name: 'Code')
  String get Code;
  @JsonKey(name: 'Question')
  String get Question;
  @JsonKey(name: 'Answer')
  String get Answer;
  @JsonKey(name: 'FileType')
  String get FileType;
  @JsonKey(name: 'FileUrl')
  String get FileUrl;
  @JsonKey(name: 'LanguageCode')
  String get LanguageCode;

  /// Create a copy of FaqResponselist
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FaqResponselistCopyWith<FaqResponselist> get copyWith =>
      _$FaqResponselistCopyWithImpl<FaqResponselist>(
          this as FaqResponselist, _$identity);

  /// Serializes this FaqResponselist to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FaqResponselist &&
            (identical(other.Code, Code) || other.Code == Code) &&
            (identical(other.Question, Question) ||
                other.Question == Question) &&
            (identical(other.Answer, Answer) || other.Answer == Answer) &&
            (identical(other.FileType, FileType) ||
                other.FileType == FileType) &&
            (identical(other.FileUrl, FileUrl) || other.FileUrl == FileUrl) &&
            (identical(other.LanguageCode, LanguageCode) ||
                other.LanguageCode == LanguageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, Code, Question, Answer, FileType, FileUrl, LanguageCode);

  @override
  String toString() {
    return 'FaqResponselist(Code: $Code, Question: $Question, Answer: $Answer, FileType: $FileType, FileUrl: $FileUrl, LanguageCode: $LanguageCode)';
  }
}

/// @nodoc
abstract mixin class $FaqResponselistCopyWith<$Res> {
  factory $FaqResponselistCopyWith(
          FaqResponselist value, $Res Function(FaqResponselist) _then) =
      _$FaqResponselistCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') String Code,
      @JsonKey(name: 'Question') String Question,
      @JsonKey(name: 'Answer') String Answer,
      @JsonKey(name: 'FileType') String FileType,
      @JsonKey(name: 'FileUrl') String FileUrl,
      @JsonKey(name: 'LanguageCode') String LanguageCode});
}

/// @nodoc
class _$FaqResponselistCopyWithImpl<$Res>
    implements $FaqResponselistCopyWith<$Res> {
  _$FaqResponselistCopyWithImpl(this._self, this._then);

  final FaqResponselist _self;
  final $Res Function(FaqResponselist) _then;

  /// Create a copy of FaqResponselist
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Code = null,
    Object? Question = null,
    Object? Answer = null,
    Object? FileType = null,
    Object? FileUrl = null,
    Object? LanguageCode = null,
  }) {
    return _then(_self.copyWith(
      Code: null == Code
          ? _self.Code
          : Code // ignore: cast_nullable_to_non_nullable
              as String,
      Question: null == Question
          ? _self.Question
          : Question // ignore: cast_nullable_to_non_nullable
              as String,
      Answer: null == Answer
          ? _self.Answer
          : Answer // ignore: cast_nullable_to_non_nullable
              as String,
      FileType: null == FileType
          ? _self.FileType
          : FileType // ignore: cast_nullable_to_non_nullable
              as String,
      FileUrl: null == FileUrl
          ? _self.FileUrl
          : FileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      LanguageCode: null == LanguageCode
          ? _self.LanguageCode
          : LanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [FaqResponselist].
extension FaqResponselistPatterns on FaqResponselist {
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
    TResult Function(_FaqResponselist value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FaqResponselist() when $default != null:
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
    TResult Function(_FaqResponselist value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FaqResponselist():
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
    TResult? Function(_FaqResponselist value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FaqResponselist() when $default != null:
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
            @JsonKey(name: 'Code') String Code,
            @JsonKey(name: 'Question') String Question,
            @JsonKey(name: 'Answer') String Answer,
            @JsonKey(name: 'FileType') String FileType,
            @JsonKey(name: 'FileUrl') String FileUrl,
            @JsonKey(name: 'LanguageCode') String LanguageCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FaqResponselist() when $default != null:
        return $default(_that.Code, _that.Question, _that.Answer,
            _that.FileType, _that.FileUrl, _that.LanguageCode);
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
            @JsonKey(name: 'Code') String Code,
            @JsonKey(name: 'Question') String Question,
            @JsonKey(name: 'Answer') String Answer,
            @JsonKey(name: 'FileType') String FileType,
            @JsonKey(name: 'FileUrl') String FileUrl,
            @JsonKey(name: 'LanguageCode') String LanguageCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FaqResponselist():
        return $default(_that.Code, _that.Question, _that.Answer,
            _that.FileType, _that.FileUrl, _that.LanguageCode);
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
            @JsonKey(name: 'Code') String Code,
            @JsonKey(name: 'Question') String Question,
            @JsonKey(name: 'Answer') String Answer,
            @JsonKey(name: 'FileType') String FileType,
            @JsonKey(name: 'FileUrl') String FileUrl,
            @JsonKey(name: 'LanguageCode') String LanguageCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FaqResponselist() when $default != null:
        return $default(_that.Code, _that.Question, _that.Answer,
            _that.FileType, _that.FileUrl, _that.LanguageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FaqResponselist implements FaqResponselist {
  const _FaqResponselist(
      {@JsonKey(name: 'Code') this.Code = '',
      @JsonKey(name: 'Question') this.Question = '',
      @JsonKey(name: 'Answer') this.Answer = '',
      @JsonKey(name: 'FileType') this.FileType = '',
      @JsonKey(name: 'FileUrl') this.FileUrl = '',
      @JsonKey(name: 'LanguageCode') this.LanguageCode = ''});
  factory _FaqResponselist.fromJson(Map<String, dynamic> json) =>
      _$FaqResponselistFromJson(json);

  @override
  @JsonKey(name: 'Code')
  final String Code;
  @override
  @JsonKey(name: 'Question')
  final String Question;
  @override
  @JsonKey(name: 'Answer')
  final String Answer;
  @override
  @JsonKey(name: 'FileType')
  final String FileType;
  @override
  @JsonKey(name: 'FileUrl')
  final String FileUrl;
  @override
  @JsonKey(name: 'LanguageCode')
  final String LanguageCode;

  /// Create a copy of FaqResponselist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FaqResponselistCopyWith<_FaqResponselist> get copyWith =>
      __$FaqResponselistCopyWithImpl<_FaqResponselist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FaqResponselistToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FaqResponselist &&
            (identical(other.Code, Code) || other.Code == Code) &&
            (identical(other.Question, Question) ||
                other.Question == Question) &&
            (identical(other.Answer, Answer) || other.Answer == Answer) &&
            (identical(other.FileType, FileType) ||
                other.FileType == FileType) &&
            (identical(other.FileUrl, FileUrl) || other.FileUrl == FileUrl) &&
            (identical(other.LanguageCode, LanguageCode) ||
                other.LanguageCode == LanguageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, Code, Question, Answer, FileType, FileUrl, LanguageCode);

  @override
  String toString() {
    return 'FaqResponselist(Code: $Code, Question: $Question, Answer: $Answer, FileType: $FileType, FileUrl: $FileUrl, LanguageCode: $LanguageCode)';
  }
}

/// @nodoc
abstract mixin class _$FaqResponselistCopyWith<$Res>
    implements $FaqResponselistCopyWith<$Res> {
  factory _$FaqResponselistCopyWith(
          _FaqResponselist value, $Res Function(_FaqResponselist) _then) =
      __$FaqResponselistCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') String Code,
      @JsonKey(name: 'Question') String Question,
      @JsonKey(name: 'Answer') String Answer,
      @JsonKey(name: 'FileType') String FileType,
      @JsonKey(name: 'FileUrl') String FileUrl,
      @JsonKey(name: 'LanguageCode') String LanguageCode});
}

/// @nodoc
class __$FaqResponselistCopyWithImpl<$Res>
    implements _$FaqResponselistCopyWith<$Res> {
  __$FaqResponselistCopyWithImpl(this._self, this._then);

  final _FaqResponselist _self;
  final $Res Function(_FaqResponselist) _then;

  /// Create a copy of FaqResponselist
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? Code = null,
    Object? Question = null,
    Object? Answer = null,
    Object? FileType = null,
    Object? FileUrl = null,
    Object? LanguageCode = null,
  }) {
    return _then(_FaqResponselist(
      Code: null == Code
          ? _self.Code
          : Code // ignore: cast_nullable_to_non_nullable
              as String,
      Question: null == Question
          ? _self.Question
          : Question // ignore: cast_nullable_to_non_nullable
              as String,
      Answer: null == Answer
          ? _self.Answer
          : Answer // ignore: cast_nullable_to_non_nullable
              as String,
      FileType: null == FileType
          ? _self.FileType
          : FileType // ignore: cast_nullable_to_non_nullable
              as String,
      FileUrl: null == FileUrl
          ? _self.FileUrl
          : FileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      LanguageCode: null == LanguageCode
          ? _self.LanguageCode
          : LanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
