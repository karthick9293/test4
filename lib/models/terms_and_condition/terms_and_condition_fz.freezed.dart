// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_and_condition_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TermsAndConditionFZ {
  @JsonKey(name: 'StatusCode')
  String get StatusCode;
  @JsonKey(name: 'StatusMessage')
  String get StatusMessage;
  @JsonKey(name: 'customMessageDetails')
  CustomMessageDetailsFZ? get customMessageDetails;
  @JsonKey(name: 'Data')
  Data? get termsData;

  /// Create a copy of TermsAndConditionFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TermsAndConditionFZCopyWith<TermsAndConditionFZ> get copyWith =>
      _$TermsAndConditionFZCopyWithImpl<TermsAndConditionFZ>(
          this as TermsAndConditionFZ, _$identity);

  /// Serializes this TermsAndConditionFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TermsAndConditionFZ &&
            (identical(other.StatusCode, StatusCode) ||
                other.StatusCode == StatusCode) &&
            (identical(other.StatusMessage, StatusMessage) ||
                other.StatusMessage == StatusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.termsData, termsData) ||
                other.termsData == termsData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, StatusCode, StatusMessage, customMessageDetails, termsData);

  @override
  String toString() {
    return 'TermsAndConditionFZ(StatusCode: $StatusCode, StatusMessage: $StatusMessage, customMessageDetails: $customMessageDetails, termsData: $termsData)';
  }
}

/// @nodoc
abstract mixin class $TermsAndConditionFZCopyWith<$Res> {
  factory $TermsAndConditionFZCopyWith(
          TermsAndConditionFZ value, $Res Function(TermsAndConditionFZ) _then) =
      _$TermsAndConditionFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String StatusCode,
      @JsonKey(name: 'StatusMessage') String StatusMessage,
      @JsonKey(name: 'customMessageDetails')
      CustomMessageDetailsFZ? customMessageDetails,
      @JsonKey(name: 'Data') Data? termsData});

  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails;
  $DataCopyWith<$Res>? get termsData;
}

/// @nodoc
class _$TermsAndConditionFZCopyWithImpl<$Res>
    implements $TermsAndConditionFZCopyWith<$Res> {
  _$TermsAndConditionFZCopyWithImpl(this._self, this._then);

  final TermsAndConditionFZ _self;
  final $Res Function(TermsAndConditionFZ) _then;

  /// Create a copy of TermsAndConditionFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? StatusCode = null,
    Object? StatusMessage = null,
    Object? customMessageDetails = freezed,
    Object? termsData = freezed,
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
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      termsData: freezed == termsData
          ? _self.termsData
          : termsData // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of TermsAndConditionFZ
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

  /// Create a copy of TermsAndConditionFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get termsData {
    if (_self.termsData == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.termsData!, (value) {
      return _then(_self.copyWith(termsData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TermsAndConditionFZ].
extension TermsAndConditionFZPatterns on TermsAndConditionFZ {
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
    TResult Function(_TermsAndConditionFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionFZ() when $default != null:
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
    TResult Function(_TermsAndConditionFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionFZ():
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
    TResult? Function(_TermsAndConditionFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionFZ() when $default != null:
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
            @JsonKey(name: 'customMessageDetails')
            CustomMessageDetailsFZ? customMessageDetails,
            @JsonKey(name: 'Data') Data? termsData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionFZ() when $default != null:
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.customMessageDetails, _that.termsData);
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
            @JsonKey(name: 'customMessageDetails')
            CustomMessageDetailsFZ? customMessageDetails,
            @JsonKey(name: 'Data') Data? termsData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionFZ():
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.customMessageDetails, _that.termsData);
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
            @JsonKey(name: 'customMessageDetails')
            CustomMessageDetailsFZ? customMessageDetails,
            @JsonKey(name: 'Data') Data? termsData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionFZ() when $default != null:
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.customMessageDetails, _that.termsData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TermsAndConditionFZ implements TermsAndConditionFZ {
  const _TermsAndConditionFZ(
      {@JsonKey(name: 'StatusCode') this.StatusCode = '',
      @JsonKey(name: 'StatusMessage') this.StatusMessage = '',
      @JsonKey(name: 'customMessageDetails') this.customMessageDetails,
      @JsonKey(name: 'Data') this.termsData});
  factory _TermsAndConditionFZ.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String StatusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String StatusMessage;
  @override
  @JsonKey(name: 'customMessageDetails')
  final CustomMessageDetailsFZ? customMessageDetails;
  @override
  @JsonKey(name: 'Data')
  final Data? termsData;

  /// Create a copy of TermsAndConditionFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TermsAndConditionFZCopyWith<_TermsAndConditionFZ> get copyWith =>
      __$TermsAndConditionFZCopyWithImpl<_TermsAndConditionFZ>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TermsAndConditionFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TermsAndConditionFZ &&
            (identical(other.StatusCode, StatusCode) ||
                other.StatusCode == StatusCode) &&
            (identical(other.StatusMessage, StatusMessage) ||
                other.StatusMessage == StatusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.termsData, termsData) ||
                other.termsData == termsData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, StatusCode, StatusMessage, customMessageDetails, termsData);

  @override
  String toString() {
    return 'TermsAndConditionFZ(StatusCode: $StatusCode, StatusMessage: $StatusMessage, customMessageDetails: $customMessageDetails, termsData: $termsData)';
  }
}

/// @nodoc
abstract mixin class _$TermsAndConditionFZCopyWith<$Res>
    implements $TermsAndConditionFZCopyWith<$Res> {
  factory _$TermsAndConditionFZCopyWith(_TermsAndConditionFZ value,
          $Res Function(_TermsAndConditionFZ) _then) =
      __$TermsAndConditionFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String StatusCode,
      @JsonKey(name: 'StatusMessage') String StatusMessage,
      @JsonKey(name: 'customMessageDetails')
      CustomMessageDetailsFZ? customMessageDetails,
      @JsonKey(name: 'Data') Data? termsData});

  @override
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetails;
  @override
  $DataCopyWith<$Res>? get termsData;
}

/// @nodoc
class __$TermsAndConditionFZCopyWithImpl<$Res>
    implements _$TermsAndConditionFZCopyWith<$Res> {
  __$TermsAndConditionFZCopyWithImpl(this._self, this._then);

  final _TermsAndConditionFZ _self;
  final $Res Function(_TermsAndConditionFZ) _then;

  /// Create a copy of TermsAndConditionFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? StatusCode = null,
    Object? StatusMessage = null,
    Object? customMessageDetails = freezed,
    Object? termsData = freezed,
  }) {
    return _then(_TermsAndConditionFZ(
      StatusCode: null == StatusCode
          ? _self.StatusCode
          : StatusCode // ignore: cast_nullable_to_non_nullable
              as String,
      StatusMessage: null == StatusMessage
          ? _self.StatusMessage
          : StatusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      termsData: freezed == termsData
          ? _self.termsData
          : termsData // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of TermsAndConditionFZ
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

  /// Create a copy of TermsAndConditionFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get termsData {
    if (_self.termsData == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.termsData!, (value) {
      return _then(_self.copyWith(termsData: value));
    });
  }
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'TermsAndConditionDetails')
  List<TermsAndConditionDetails> get termsAndConditionDetails;
  @JsonKey(name: 'MessageCode')
  String get messageCode;
  @JsonKey(name: 'MessageDetail')
  String get messageDetail;

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
            const DeepCollectionEquality().equals(
                other.termsAndConditionDetails, termsAndConditionDetails) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(termsAndConditionDetails),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'Data(termsAndConditionDetails: $termsAndConditionDetails, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'TermsAndConditionDetails')
      List<TermsAndConditionDetails> termsAndConditionDetails,
      @JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageDetail') String messageDetail});
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
    Object? termsAndConditionDetails = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_self.copyWith(
      termsAndConditionDetails: null == termsAndConditionDetails
          ? _self.termsAndConditionDetails
          : termsAndConditionDetails // ignore: cast_nullable_to_non_nullable
              as List<TermsAndConditionDetails>,
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
            @JsonKey(name: 'TermsAndConditionDetails')
            List<TermsAndConditionDetails> termsAndConditionDetails,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(_that.termsAndConditionDetails, _that.messageCode,
            _that.messageDetail);
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
            @JsonKey(name: 'TermsAndConditionDetails')
            List<TermsAndConditionDetails> termsAndConditionDetails,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(_that.termsAndConditionDetails, _that.messageCode,
            _that.messageDetail);
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
            @JsonKey(name: 'TermsAndConditionDetails')
            List<TermsAndConditionDetails> termsAndConditionDetails,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(_that.termsAndConditionDetails, _that.messageCode,
            _that.messageDetail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: 'TermsAndConditionDetails')
      final List<TermsAndConditionDetails> termsAndConditionDetails = const [],
      @JsonKey(name: 'MessageCode') this.messageCode = '',
      @JsonKey(name: 'MessageDetail') this.messageDetail = ''})
      : _termsAndConditionDetails = termsAndConditionDetails;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<TermsAndConditionDetails> _termsAndConditionDetails;
  @override
  @JsonKey(name: 'TermsAndConditionDetails')
  List<TermsAndConditionDetails> get termsAndConditionDetails {
    if (_termsAndConditionDetails is EqualUnmodifiableListView)
      return _termsAndConditionDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_termsAndConditionDetails);
  }

  @override
  @JsonKey(name: 'MessageCode')
  final String messageCode;
  @override
  @JsonKey(name: 'MessageDetail')
  final String messageDetail;

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
            const DeepCollectionEquality().equals(
                other._termsAndConditionDetails, _termsAndConditionDetails) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_termsAndConditionDetails),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'Data(termsAndConditionDetails: $termsAndConditionDetails, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TermsAndConditionDetails')
      List<TermsAndConditionDetails> termsAndConditionDetails,
      @JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageDetail') String messageDetail});
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
    Object? termsAndConditionDetails = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_Data(
      termsAndConditionDetails: null == termsAndConditionDetails
          ? _self._termsAndConditionDetails
          : termsAndConditionDetails // ignore: cast_nullable_to_non_nullable
              as List<TermsAndConditionDetails>,
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
mixin _$TermsAndConditionDetails {
  @JsonKey(name: 'Description')
  String get description;
  @JsonKey(name: 'LanguageCode')
  String get languageCode;

  /// Create a copy of TermsAndConditionDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TermsAndConditionDetailsCopyWith<TermsAndConditionDetails> get copyWith =>
      _$TermsAndConditionDetailsCopyWithImpl<TermsAndConditionDetails>(
          this as TermsAndConditionDetails, _$identity);

  /// Serializes this TermsAndConditionDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TermsAndConditionDetails &&
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
    return 'TermsAndConditionDetails(description: $description, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $TermsAndConditionDetailsCopyWith<$Res> {
  factory $TermsAndConditionDetailsCopyWith(TermsAndConditionDetails value,
          $Res Function(TermsAndConditionDetails) _then) =
      _$TermsAndConditionDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Description') String description,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class _$TermsAndConditionDetailsCopyWithImpl<$Res>
    implements $TermsAndConditionDetailsCopyWith<$Res> {
  _$TermsAndConditionDetailsCopyWithImpl(this._self, this._then);

  final TermsAndConditionDetails _self;
  final $Res Function(TermsAndConditionDetails) _then;

  /// Create a copy of TermsAndConditionDetails
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

/// Adds pattern-matching-related methods to [TermsAndConditionDetails].
extension TermsAndConditionDetailsPatterns on TermsAndConditionDetails {
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
    TResult Function(_TermsAndConditionDetails value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionDetails() when $default != null:
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
    TResult Function(_TermsAndConditionDetails value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionDetails():
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
    TResult? Function(_TermsAndConditionDetails value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TermsAndConditionDetails() when $default != null:
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
      case _TermsAndConditionDetails() when $default != null:
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
      case _TermsAndConditionDetails():
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
      case _TermsAndConditionDetails() when $default != null:
        return $default(_that.description, _that.languageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TermsAndConditionDetails implements TermsAndConditionDetails {
  const _TermsAndConditionDetails(
      {@JsonKey(name: 'Description') this.description = '',
      @JsonKey(name: 'LanguageCode') this.languageCode = ''});
  factory _TermsAndConditionDetails.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionDetailsFromJson(json);

  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// Create a copy of TermsAndConditionDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TermsAndConditionDetailsCopyWith<_TermsAndConditionDetails> get copyWith =>
      __$TermsAndConditionDetailsCopyWithImpl<_TermsAndConditionDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TermsAndConditionDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TermsAndConditionDetails &&
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
    return 'TermsAndConditionDetails(description: $description, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class _$TermsAndConditionDetailsCopyWith<$Res>
    implements $TermsAndConditionDetailsCopyWith<$Res> {
  factory _$TermsAndConditionDetailsCopyWith(_TermsAndConditionDetails value,
          $Res Function(_TermsAndConditionDetails) _then) =
      __$TermsAndConditionDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Description') String description,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class __$TermsAndConditionDetailsCopyWithImpl<$Res>
    implements _$TermsAndConditionDetailsCopyWith<$Res> {
  __$TermsAndConditionDetailsCopyWithImpl(this._self, this._then);

  final _TermsAndConditionDetails _self;
  final $Res Function(_TermsAndConditionDetails) _then;

  /// Create a copy of TermsAndConditionDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? languageCode = null,
  }) {
    return _then(_TermsAndConditionDetails(
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
