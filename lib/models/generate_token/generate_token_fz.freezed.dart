// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_token_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateTokenFZ {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetailsFZ? get customMessageDetailsFZ;
  @JsonKey(name: 'Data')
  Data? get tokenData;

  /// Create a copy of GenerateTokenFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerateTokenFZCopyWith<GenerateTokenFZ> get copyWith =>
      _$GenerateTokenFZCopyWithImpl<GenerateTokenFZ>(
          this as GenerateTokenFZ, _$identity);

  /// Serializes this GenerateTokenFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerateTokenFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetailsFZ, customMessageDetailsFZ) ||
                other.customMessageDetailsFZ == customMessageDetailsFZ) &&
            (identical(other.tokenData, tokenData) ||
                other.tokenData == tokenData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      customMessageDetailsFZ, tokenData);

  @override
  String toString() {
    return 'GenerateTokenFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetailsFZ: $customMessageDetailsFZ, tokenData: $tokenData)';
  }
}

/// @nodoc
abstract mixin class $GenerateTokenFZCopyWith<$Res> {
  factory $GenerateTokenFZCopyWith(
          GenerateTokenFZ value, $Res Function(GenerateTokenFZ) _then) =
      _$GenerateTokenFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetailsFZ,
      @JsonKey(name: 'Data') Data? tokenData});

  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetailsFZ;
  $DataCopyWith<$Res>? get tokenData;
}

/// @nodoc
class _$GenerateTokenFZCopyWithImpl<$Res>
    implements $GenerateTokenFZCopyWith<$Res> {
  _$GenerateTokenFZCopyWithImpl(this._self, this._then);

  final GenerateTokenFZ _self;
  final $Res Function(GenerateTokenFZ) _then;

  /// Create a copy of GenerateTokenFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetailsFZ = freezed,
    Object? tokenData = freezed,
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
      customMessageDetailsFZ: freezed == customMessageDetailsFZ
          ? _self.customMessageDetailsFZ
          : customMessageDetailsFZ // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      tokenData: freezed == tokenData
          ? _self.tokenData
          : tokenData // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of GenerateTokenFZ
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

  /// Create a copy of GenerateTokenFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get tokenData {
    if (_self.tokenData == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.tokenData!, (value) {
      return _then(_self.copyWith(tokenData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [GenerateTokenFZ].
extension GenerateTokenFZPatterns on GenerateTokenFZ {
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
    TResult Function(_GenerateTokenFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenerateTokenFZ() when $default != null:
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
    TResult Function(_GenerateTokenFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateTokenFZ():
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
    TResult? Function(_GenerateTokenFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateTokenFZ() when $default != null:
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
            CustomMessageDetailsFZ? customMessageDetailsFZ,
            @JsonKey(name: 'Data') Data? tokenData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GenerateTokenFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetailsFZ, _that.tokenData);
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
            CustomMessageDetailsFZ? customMessageDetailsFZ,
            @JsonKey(name: 'Data') Data? tokenData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateTokenFZ():
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetailsFZ, _that.tokenData);
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
            CustomMessageDetailsFZ? customMessageDetailsFZ,
            @JsonKey(name: 'Data') Data? tokenData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _GenerateTokenFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetailsFZ, _that.tokenData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _GenerateTokenFZ implements GenerateTokenFZ {
  const _GenerateTokenFZ(
      {@JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetailsFZ,
      @JsonKey(name: 'Data') this.tokenData});
  factory _GenerateTokenFZ.fromJson(Map<String, dynamic> json) =>
      _$GenerateTokenFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String statusMessage;
  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetailsFZ? customMessageDetailsFZ;
  @override
  @JsonKey(name: 'Data')
  final Data? tokenData;

  /// Create a copy of GenerateTokenFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenerateTokenFZCopyWith<_GenerateTokenFZ> get copyWith =>
      __$GenerateTokenFZCopyWithImpl<_GenerateTokenFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenerateTokenFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenerateTokenFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetailsFZ, customMessageDetailsFZ) ||
                other.customMessageDetailsFZ == customMessageDetailsFZ) &&
            (identical(other.tokenData, tokenData) ||
                other.tokenData == tokenData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      customMessageDetailsFZ, tokenData);

  @override
  String toString() {
    return 'GenerateTokenFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetailsFZ: $customMessageDetailsFZ, tokenData: $tokenData)';
  }
}

/// @nodoc
abstract mixin class _$GenerateTokenFZCopyWith<$Res>
    implements $GenerateTokenFZCopyWith<$Res> {
  factory _$GenerateTokenFZCopyWith(
          _GenerateTokenFZ value, $Res Function(_GenerateTokenFZ) _then) =
      __$GenerateTokenFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetailsFZ? customMessageDetailsFZ,
      @JsonKey(name: 'Data') Data? tokenData});

  @override
  $CustomMessageDetailsFZCopyWith<$Res>? get customMessageDetailsFZ;
  @override
  $DataCopyWith<$Res>? get tokenData;
}

/// @nodoc
class __$GenerateTokenFZCopyWithImpl<$Res>
    implements _$GenerateTokenFZCopyWith<$Res> {
  __$GenerateTokenFZCopyWithImpl(this._self, this._then);

  final _GenerateTokenFZ _self;
  final $Res Function(_GenerateTokenFZ) _then;

  /// Create a copy of GenerateTokenFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetailsFZ = freezed,
    Object? tokenData = freezed,
  }) {
    return _then(_GenerateTokenFZ(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      customMessageDetailsFZ: freezed == customMessageDetailsFZ
          ? _self.customMessageDetailsFZ
          : customMessageDetailsFZ // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetailsFZ?,
      tokenData: freezed == tokenData
          ? _self.tokenData
          : tokenData // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of GenerateTokenFZ
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

  /// Create a copy of GenerateTokenFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get tokenData {
    if (_self.tokenData == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.tokenData!, (value) {
      return _then(_self.copyWith(tokenData: value));
    });
  }
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'Token')
  String get Token;
  @JsonKey(name: 'ClientCode')
  String get clientCode;
  @JsonKey(name: 'EnvironmentCode')
  String get environmentCode;
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
            (identical(other.Token, Token) || other.Token == Token) &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.environmentCode, environmentCode) ||
                other.environmentCode == environmentCode) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Token, clientCode,
      environmentCode, messageCode, messageDetail);

  @override
  String toString() {
    return 'Data(Token: $Token, clientCode: $clientCode, environmentCode: $environmentCode, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Token') String Token,
      @JsonKey(name: 'ClientCode') String clientCode,
      @JsonKey(name: 'EnvironmentCode') String environmentCode,
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
    Object? Token = null,
    Object? clientCode = null,
    Object? environmentCode = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_self.copyWith(
      Token: null == Token
          ? _self.Token
          : Token // ignore: cast_nullable_to_non_nullable
              as String,
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
      environmentCode: null == environmentCode
          ? _self.environmentCode
          : environmentCode // ignore: cast_nullable_to_non_nullable
              as String,
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
            @JsonKey(name: 'Token') String Token,
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'EnvironmentCode') String environmentCode,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(_that.Token, _that.clientCode, _that.environmentCode,
            _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: 'Token') String Token,
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'EnvironmentCode') String environmentCode,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(_that.Token, _that.clientCode, _that.environmentCode,
            _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: 'Token') String Token,
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'EnvironmentCode') String environmentCode,
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageDetail') String messageDetail)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(_that.Token, _that.clientCode, _that.environmentCode,
            _that.messageCode, _that.messageDetail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: 'Token') this.Token = '',
      @JsonKey(name: 'ClientCode') this.clientCode = '',
      @JsonKey(name: 'EnvironmentCode') this.environmentCode = '1',
      @JsonKey(name: 'MessageCode') this.messageCode = '',
      @JsonKey(name: 'MessageDetail') this.messageDetail = ''});
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  @JsonKey(name: 'Token')
  final String Token;
  @override
  @JsonKey(name: 'ClientCode')
  final String clientCode;
  @override
  @JsonKey(name: 'EnvironmentCode')
  final String environmentCode;
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
            (identical(other.Token, Token) || other.Token == Token) &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.environmentCode, environmentCode) ||
                other.environmentCode == environmentCode) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Token, clientCode,
      environmentCode, messageCode, messageDetail);

  @override
  String toString() {
    return 'Data(Token: $Token, clientCode: $clientCode, environmentCode: $environmentCode, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Token') String Token,
      @JsonKey(name: 'ClientCode') String clientCode,
      @JsonKey(name: 'EnvironmentCode') String environmentCode,
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
    Object? Token = null,
    Object? clientCode = null,
    Object? environmentCode = null,
    Object? messageCode = null,
    Object? messageDetail = null,
  }) {
    return _then(_Data(
      Token: null == Token
          ? _self.Token
          : Token // ignore: cast_nullable_to_non_nullable
              as String,
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
      environmentCode: null == environmentCode
          ? _self.environmentCode
          : environmentCode // ignore: cast_nullable_to_non_nullable
              as String,
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

// dart format on
