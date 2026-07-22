// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_us_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AboutUsFZ {
  @JsonKey(name: 'StatusCode')
  String get StatusCode;
  @JsonKey(name: 'StatusMessage')
  String get StatusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetailsFZ? get customMessageDetailsFZ;
  @JsonKey(name: 'Data')
  Data? get aboutUsData;

  /// Create a copy of AboutUsFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AboutUsFZCopyWith<AboutUsFZ> get copyWith =>
      _$AboutUsFZCopyWithImpl<AboutUsFZ>(this as AboutUsFZ, _$identity);

  /// Serializes this AboutUsFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AboutUsFZ &&
            (identical(other.StatusCode, StatusCode) ||
                other.StatusCode == StatusCode) &&
            (identical(other.StatusMessage, StatusMessage) ||
                other.StatusMessage == StatusMessage) &&
            (identical(other.customMessageDetailsFZ, customMessageDetailsFZ) ||
                other.customMessageDetailsFZ == customMessageDetailsFZ) &&
            (identical(other.aboutUsData, aboutUsData) ||
                other.aboutUsData == aboutUsData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, StatusCode, StatusMessage,
      customMessageDetailsFZ, aboutUsData);

  @override
  String toString() {
    return 'AboutUsFZ(StatusCode: $StatusCode, StatusMessage: $StatusMessage, customMessageDetailsFZ: $customMessageDetailsFZ, aboutUsData: $aboutUsData)';
  }
}

/// @nodoc
abstract mixin class $AboutUsFZCopyWith<$Res> {
  factory $AboutUsFZCopyWith(AboutUsFZ value, $Res Function(AboutUsFZ) _then) =
      _$AboutUsFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String StatusCode,
      @JsonKey(name: 'StatusMessage') String StatusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetailsFZ,
      @JsonKey(name: 'Data') Data? aboutUsData});

  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetailsFZ;
  $DataCopyWith<$Res>? get aboutUsData;
}

/// @nodoc
class _$AboutUsFZCopyWithImpl<$Res> implements $AboutUsFZCopyWith<$Res> {
  _$AboutUsFZCopyWithImpl(this._self, this._then);

  final AboutUsFZ _self;
  final $Res Function(AboutUsFZ) _then;

  /// Create a copy of AboutUsFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? StatusCode = null,
    Object? StatusMessage = null,
    Object? customMessageDetailsFZ = freezed,
    Object? aboutUsData = freezed,
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
      customMessageDetailsFZ: freezed == customMessageDetailsFZ
          ? _self.customMessageDetailsFZ
          : customMessageDetailsFZ // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      aboutUsData: freezed == aboutUsData
          ? _self.aboutUsData
          : aboutUsData // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of AboutUsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetailsFZ {
    if (_self.customMessageDetailsFZ == null) {
      return null;
    }

    return $CustomMessageDetailsFZCopyWith<$Res>(_self.customMessageDetailsFZ!,
        (value) {
      return _then(_self.copyWith(customMessageDetailsFZ: value));
    });
  }

  /// Create a copy of AboutUsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get aboutUsData {
    if (_self.aboutUsData == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.aboutUsData!, (value) {
      return _then(_self.copyWith(aboutUsData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AboutUsFZ].
extension AboutUsFZPatterns on AboutUsFZ {
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
    TResult Function(_AboutUsFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AboutUsFZ() when $default != null:
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
    TResult Function(_AboutUsFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AboutUsFZ():
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
    TResult? Function(_AboutUsFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AboutUsFZ() when $default != null:
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
            CustomMessageDetailsFZ? customMessageDetailsFZ,
            @JsonKey(name: 'Data') Data? aboutUsData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AboutUsFZ() when $default != null:
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.customMessageDetailsFZ, _that.aboutUsData);
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
            CustomMessageDetailsFZ? customMessageDetailsFZ,
            @JsonKey(name: 'Data') Data? aboutUsData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AboutUsFZ():
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.customMessageDetailsFZ, _that.aboutUsData);
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
            CustomMessageDetailsFZ? customMessageDetailsFZ,
            @JsonKey(name: 'Data') Data? aboutUsData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AboutUsFZ() when $default != null:
        return $default(_that.StatusCode, _that.StatusMessage,
            _that.customMessageDetailsFZ, _that.aboutUsData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AboutUsFZ implements AboutUsFZ {
  const _AboutUsFZ(
      {@JsonKey(name: 'StatusCode') this.StatusCode = '',
      @JsonKey(name: 'StatusMessage') this.StatusMessage = '',
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetailsFZ,
      @JsonKey(name: 'Data') this.aboutUsData});
  factory _AboutUsFZ.fromJson(Map<String, dynamic> json) =>
      _$AboutUsFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String StatusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String StatusMessage;
  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetailsFZ? customMessageDetailsFZ;
  @override
  @JsonKey(name: 'Data')
  final Data? aboutUsData;

  /// Create a copy of AboutUsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AboutUsFZCopyWith<_AboutUsFZ> get copyWith =>
      __$AboutUsFZCopyWithImpl<_AboutUsFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AboutUsFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AboutUsFZ &&
            (identical(other.StatusCode, StatusCode) ||
                other.StatusCode == StatusCode) &&
            (identical(other.StatusMessage, StatusMessage) ||
                other.StatusMessage == StatusMessage) &&
            (identical(other.customMessageDetailsFZ, customMessageDetailsFZ) ||
                other.customMessageDetailsFZ == customMessageDetailsFZ) &&
            (identical(other.aboutUsData, aboutUsData) ||
                other.aboutUsData == aboutUsData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, StatusCode, StatusMessage,
      customMessageDetailsFZ, aboutUsData);

  @override
  String toString() {
    return 'AboutUsFZ(StatusCode: $StatusCode, StatusMessage: $StatusMessage, customMessageDetailsFZ: $customMessageDetailsFZ, aboutUsData: $aboutUsData)';
  }
}

/// @nodoc
abstract mixin class _$AboutUsFZCopyWith<$Res>
    implements $AboutUsFZCopyWith<$Res> {
  factory _$AboutUsFZCopyWith(
          _AboutUsFZ value, $Res Function(_AboutUsFZ) _then) =
      __$AboutUsFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String StatusCode,
      @JsonKey(name: 'StatusMessage') String StatusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetailsFZ,
      @JsonKey(name: 'Data') Data? aboutUsData});

  @override
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetailsFZ;
  @override
  $DataCopyWith<$Res>? get aboutUsData;
}

/// @nodoc
class __$AboutUsFZCopyWithImpl<$Res> implements _$AboutUsFZCopyWith<$Res> {
  __$AboutUsFZCopyWithImpl(this._self, this._then);

  final _AboutUsFZ _self;
  final $Res Function(_AboutUsFZ) _then;

  /// Create a copy of AboutUsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? StatusCode = null,
    Object? StatusMessage = null,
    Object? customMessageDetailsFZ = freezed,
    Object? aboutUsData = freezed,
  }) {
    return _then(_AboutUsFZ(
      StatusCode: null == StatusCode
          ? _self.StatusCode
          : StatusCode // ignore: cast_nullable_to_non_nullable
              as String,
      StatusMessage: null == StatusMessage
          ? _self.StatusMessage
          : StatusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      customMessageDetailsFZ: freezed == customMessageDetailsFZ
          ? _self.customMessageDetailsFZ
          : customMessageDetailsFZ // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      aboutUsData: freezed == aboutUsData
          ? _self.aboutUsData
          : aboutUsData // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of AboutUsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetailsFZ {
    if (_self.customMessageDetailsFZ == null) {
      return null;
    }

    return $CustomMessageDetailsFZCopyWith<$Res>(_self.customMessageDetailsFZ!,
        (value) {
      return _then(_self.copyWith(customMessageDetailsFZ: value));
    });
  }

  /// Create a copy of AboutUsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get aboutUsData {
    if (_self.aboutUsData == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.aboutUsData!, (value) {
      return _then(_self.copyWith(aboutUsData: value));
    });
  }
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'AboutUsList')
  List<AboutUsList> get aboutUsList;
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
            const DeepCollectionEquality()
                .equals(other.aboutUsList, aboutUsList) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(aboutUsList),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'Data(aboutUsList: $aboutUsList, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'AboutUsList') List<AboutUsList> aboutUsList,
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
    Object? aboutUsList = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_self.copyWith(
      aboutUsList: null == aboutUsList
          ? _self.aboutUsList
          : aboutUsList // ignore: cast_nullable_to_non_nullable
              as List<AboutUsList>,
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
            @JsonKey(name: 'AboutUsList') List<AboutUsList> aboutUsList,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.aboutUsList, _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: 'AboutUsList') List<AboutUsList> aboutUsList,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(
            _that.aboutUsList, _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: 'AboutUsList') List<AboutUsList> aboutUsList,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.aboutUsList, _that.messageCode, _that.messageDetail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: 'AboutUsList')
      final List<AboutUsList> aboutUsList = const [],
      @JsonKey(name: 'MessageCode') this.messageCode = '',
      @JsonKey(name: 'MessageDetail') this.messageDetail = ''})
      : _aboutUsList = aboutUsList;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<AboutUsList> _aboutUsList;
  @override
  @JsonKey(name: 'AboutUsList')
  List<AboutUsList> get aboutUsList {
    if (_aboutUsList is EqualUnmodifiableListView) return _aboutUsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aboutUsList);
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
            const DeepCollectionEquality()
                .equals(other._aboutUsList, _aboutUsList) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_aboutUsList),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'Data(aboutUsList: $aboutUsList, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AboutUsList') List<AboutUsList> aboutUsList,
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
    Object? aboutUsList = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_Data(
      aboutUsList: null == aboutUsList
          ? _self._aboutUsList
          : aboutUsList // ignore: cast_nullable_to_non_nullable
              as List<AboutUsList>,
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
mixin _$AboutUsList {
  @JsonKey(name: 'Description')
  String get description;
  @JsonKey(name: 'LanguageCode')
  String get languageCode;

  /// Create a copy of AboutUsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AboutUsListCopyWith<AboutUsList> get copyWith =>
      _$AboutUsListCopyWithImpl<AboutUsList>(this as AboutUsList, _$identity);

  /// Serializes this AboutUsList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AboutUsList &&
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
    return 'AboutUsList(description: $description, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $AboutUsListCopyWith<$Res> {
  factory $AboutUsListCopyWith(
          AboutUsList value, $Res Function(AboutUsList) _then) =
      _$AboutUsListCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Description') String description,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class _$AboutUsListCopyWithImpl<$Res> implements $AboutUsListCopyWith<$Res> {
  _$AboutUsListCopyWithImpl(this._self, this._then);

  final AboutUsList _self;
  final $Res Function(AboutUsList) _then;

  /// Create a copy of AboutUsList
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

/// Adds pattern-matching-related methods to [AboutUsList].
extension AboutUsListPatterns on AboutUsList {
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
    TResult Function(_AboutUsList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AboutUsList() when $default != null:
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
    TResult Function(_AboutUsList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AboutUsList():
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
    TResult? Function(_AboutUsList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AboutUsList() when $default != null:
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
      case _AboutUsList() when $default != null:
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
      case _AboutUsList():
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
      case _AboutUsList() when $default != null:
        return $default(_that.description, _that.languageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AboutUsList implements AboutUsList {
  const _AboutUsList(
      {@JsonKey(name: 'Description') this.description = '',
      @JsonKey(name: 'LanguageCode') this.languageCode = ''});
  factory _AboutUsList.fromJson(Map<String, dynamic> json) =>
      _$AboutUsListFromJson(json);

  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'LanguageCode')
  final String languageCode;

  /// Create a copy of AboutUsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AboutUsListCopyWith<_AboutUsList> get copyWith =>
      __$AboutUsListCopyWithImpl<_AboutUsList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AboutUsListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AboutUsList &&
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
    return 'AboutUsList(description: $description, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class _$AboutUsListCopyWith<$Res>
    implements $AboutUsListCopyWith<$Res> {
  factory _$AboutUsListCopyWith(
          _AboutUsList value, $Res Function(_AboutUsList) _then) =
      __$AboutUsListCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Description') String description,
      @JsonKey(name: 'LanguageCode') String languageCode});
}

/// @nodoc
class __$AboutUsListCopyWithImpl<$Res> implements _$AboutUsListCopyWith<$Res> {
  __$AboutUsListCopyWithImpl(this._self, this._then);

  final _AboutUsList _self;
  final $Res Function(_AboutUsList) _then;

  /// Create a copy of AboutUsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? languageCode = null,
  }) {
    return _then(_AboutUsList(
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
