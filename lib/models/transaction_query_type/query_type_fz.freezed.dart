// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query_type_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueryTypeFz {
  @JsonKey(name: 'QueryTypeCode')
  String? get queryTypeCode;
  @JsonKey(name: 'QueryTypeName')
  String? get queryTypeName;

  /// Create a copy of QueryTypeFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryTypeFzCopyWith<QueryTypeFz> get copyWith =>
      _$QueryTypeFzCopyWithImpl<QueryTypeFz>(this as QueryTypeFz, _$identity);

  /// Serializes this QueryTypeFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryTypeFz &&
            (identical(other.queryTypeCode, queryTypeCode) ||
                other.queryTypeCode == queryTypeCode) &&
            (identical(other.queryTypeName, queryTypeName) ||
                other.queryTypeName == queryTypeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, queryTypeCode, queryTypeName);

  @override
  String toString() {
    return 'QueryTypeFz(queryTypeCode: $queryTypeCode, queryTypeName: $queryTypeName)';
  }
}

/// @nodoc
abstract mixin class $QueryTypeFzCopyWith<$Res> {
  factory $QueryTypeFzCopyWith(
          QueryTypeFz value, $Res Function(QueryTypeFz) _then) =
      _$QueryTypeFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'QueryTypeCode') String? queryTypeCode,
      @JsonKey(name: 'QueryTypeName') String? queryTypeName});
}

/// @nodoc
class _$QueryTypeFzCopyWithImpl<$Res> implements $QueryTypeFzCopyWith<$Res> {
  _$QueryTypeFzCopyWithImpl(this._self, this._then);

  final QueryTypeFz _self;
  final $Res Function(QueryTypeFz) _then;

  /// Create a copy of QueryTypeFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? queryTypeCode = freezed,
    Object? queryTypeName = freezed,
  }) {
    return _then(_self.copyWith(
      queryTypeCode: freezed == queryTypeCode
          ? _self.queryTypeCode
          : queryTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      queryTypeName: freezed == queryTypeName
          ? _self.queryTypeName
          : queryTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [QueryTypeFz].
extension QueryTypeFzPatterns on QueryTypeFz {
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
    TResult Function(_QueryTypeFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QueryTypeFz() when $default != null:
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
    TResult Function(_QueryTypeFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypeFz():
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
    TResult? Function(_QueryTypeFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypeFz() when $default != null:
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
    TResult Function(@JsonKey(name: 'QueryTypeCode') String? queryTypeCode,
            @JsonKey(name: 'QueryTypeName') String? queryTypeName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QueryTypeFz() when $default != null:
        return $default(_that.queryTypeCode, _that.queryTypeName);
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
    TResult Function(@JsonKey(name: 'QueryTypeCode') String? queryTypeCode,
            @JsonKey(name: 'QueryTypeName') String? queryTypeName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypeFz():
        return $default(_that.queryTypeCode, _that.queryTypeName);
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
    TResult? Function(@JsonKey(name: 'QueryTypeCode') String? queryTypeCode,
            @JsonKey(name: 'QueryTypeName') String? queryTypeName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypeFz() when $default != null:
        return $default(_that.queryTypeCode, _that.queryTypeName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QueryTypeFz implements QueryTypeFz {
  const _QueryTypeFz(
      {@JsonKey(name: 'QueryTypeCode') this.queryTypeCode,
      @JsonKey(name: 'QueryTypeName') this.queryTypeName});
  factory _QueryTypeFz.fromJson(Map<String, dynamic> json) =>
      _$QueryTypeFzFromJson(json);

  @override
  @JsonKey(name: 'QueryTypeCode')
  final String? queryTypeCode;
  @override
  @JsonKey(name: 'QueryTypeName')
  final String? queryTypeName;

  /// Create a copy of QueryTypeFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QueryTypeFzCopyWith<_QueryTypeFz> get copyWith =>
      __$QueryTypeFzCopyWithImpl<_QueryTypeFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QueryTypeFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QueryTypeFz &&
            (identical(other.queryTypeCode, queryTypeCode) ||
                other.queryTypeCode == queryTypeCode) &&
            (identical(other.queryTypeName, queryTypeName) ||
                other.queryTypeName == queryTypeName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, queryTypeCode, queryTypeName);

  @override
  String toString() {
    return 'QueryTypeFz(queryTypeCode: $queryTypeCode, queryTypeName: $queryTypeName)';
  }
}

/// @nodoc
abstract mixin class _$QueryTypeFzCopyWith<$Res>
    implements $QueryTypeFzCopyWith<$Res> {
  factory _$QueryTypeFzCopyWith(
          _QueryTypeFz value, $Res Function(_QueryTypeFz) _then) =
      __$QueryTypeFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'QueryTypeCode') String? queryTypeCode,
      @JsonKey(name: 'QueryTypeName') String? queryTypeName});
}

/// @nodoc
class __$QueryTypeFzCopyWithImpl<$Res> implements _$QueryTypeFzCopyWith<$Res> {
  __$QueryTypeFzCopyWithImpl(this._self, this._then);

  final _QueryTypeFz _self;
  final $Res Function(_QueryTypeFz) _then;

  /// Create a copy of QueryTypeFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? queryTypeCode = freezed,
    Object? queryTypeName = freezed,
  }) {
    return _then(_QueryTypeFz(
      queryTypeCode: freezed == queryTypeCode
          ? _self.queryTypeCode
          : queryTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      queryTypeName: freezed == queryTypeName
          ? _self.queryTypeName
          : queryTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$CustomMessageDetails {
  @JsonKey(name: 'MessageCode')
  String? get messageCode;
  @JsonKey(name: 'MessageType')
  String? get messageType;
  @JsonKey(name: 'MessageHeader')
  String? get messageHeader;
  @JsonKey(name: 'MessageDescription')
  String? get messageDescription;

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
      {@JsonKey(name: 'MessageCode') String? messageCode,
      @JsonKey(name: 'MessageType') String? messageType,
      @JsonKey(name: 'MessageHeader') String? messageHeader,
      @JsonKey(name: 'MessageDescription') String? messageDescription});
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
    Object? messageCode = freezed,
    Object? messageType = freezed,
    Object? messageHeader = freezed,
    Object? messageDescription = freezed,
  }) {
    return _then(_self.copyWith(
      messageCode: freezed == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: freezed == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String?,
      messageHeader: freezed == messageHeader
          ? _self.messageHeader
          : messageHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      messageDescription: freezed == messageDescription
          ? _self.messageDescription
          : messageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
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
            @JsonKey(name: 'MessageCode') String? messageCode,
            @JsonKey(name: 'MessageType') String? messageType,
            @JsonKey(name: 'MessageHeader') String? messageHeader,
            @JsonKey(name: 'MessageDescription') String? messageDescription)?
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
            @JsonKey(name: 'MessageCode') String? messageCode,
            @JsonKey(name: 'MessageType') String? messageType,
            @JsonKey(name: 'MessageHeader') String? messageHeader,
            @JsonKey(name: 'MessageDescription') String? messageDescription)
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
            @JsonKey(name: 'MessageCode') String? messageCode,
            @JsonKey(name: 'MessageType') String? messageType,
            @JsonKey(name: 'MessageHeader') String? messageHeader,
            @JsonKey(name: 'MessageDescription') String? messageDescription)?
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
      {@JsonKey(name: 'MessageCode') this.messageCode,
      @JsonKey(name: 'MessageType') this.messageType,
      @JsonKey(name: 'MessageHeader') this.messageHeader,
      @JsonKey(name: 'MessageDescription') this.messageDescription});
  factory _CustomMessageDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageDetailsFromJson(json);

  @override
  @JsonKey(name: 'MessageCode')
  final String? messageCode;
  @override
  @JsonKey(name: 'MessageType')
  final String? messageType;
  @override
  @JsonKey(name: 'MessageHeader')
  final String? messageHeader;
  @override
  @JsonKey(name: 'MessageDescription')
  final String? messageDescription;

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
      {@JsonKey(name: 'MessageCode') String? messageCode,
      @JsonKey(name: 'MessageType') String? messageType,
      @JsonKey(name: 'MessageHeader') String? messageHeader,
      @JsonKey(name: 'MessageDescription') String? messageDescription});
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
    Object? messageCode = freezed,
    Object? messageType = freezed,
    Object? messageHeader = freezed,
    Object? messageDescription = freezed,
  }) {
    return _then(_CustomMessageDetails(
      messageCode: freezed == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: freezed == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String?,
      messageHeader: freezed == messageHeader
          ? _self.messageHeader
          : messageHeader // ignore: cast_nullable_to_non_nullable
              as String?,
      messageDescription: freezed == messageDescription
          ? _self.messageDescription
          : messageDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$QueryTypeResponse {
  @JsonKey(name: 'StatusCode')
  String? get statusCode;
  @JsonKey(name: 'StatusMessage')
  String? get statusMessage;
  @JsonKey(name: 'QueryList')
  List<QueryTypeFz>? get queryList;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of QueryTypeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryTypeResponseCopyWith<QueryTypeResponse> get copyWith =>
      _$QueryTypeResponseCopyWithImpl<QueryTypeResponse>(
          this as QueryTypeResponse, _$identity);

  /// Serializes this QueryTypeResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryTypeResponse &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality().equals(other.queryList, queryList) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      const DeepCollectionEquality().hash(queryList), customMessageDetails);

  @override
  String toString() {
    return 'QueryTypeResponse(statusCode: $statusCode, statusMessage: $statusMessage, queryList: $queryList, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $QueryTypeResponseCopyWith<$Res> {
  factory $QueryTypeResponseCopyWith(
          QueryTypeResponse value, $Res Function(QueryTypeResponse) _then) =
      _$QueryTypeResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String? statusCode,
      @JsonKey(name: 'StatusMessage') String? statusMessage,
      @JsonKey(name: 'QueryList') List<QueryTypeFz>? queryList,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$QueryTypeResponseCopyWithImpl<$Res>
    implements $QueryTypeResponseCopyWith<$Res> {
  _$QueryTypeResponseCopyWithImpl(this._self, this._then);

  final QueryTypeResponse _self;
  final $Res Function(QueryTypeResponse) _then;

  /// Create a copy of QueryTypeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? queryList = freezed,
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
      queryList: freezed == queryList
          ? _self.queryList
          : queryList // ignore: cast_nullable_to_non_nullable
              as List<QueryTypeFz>?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of QueryTypeResponse
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

/// Adds pattern-matching-related methods to [QueryTypeResponse].
extension QueryTypeResponsePatterns on QueryTypeResponse {
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
    TResult Function(_QueryTypeResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QueryTypeResponse() when $default != null:
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
    TResult Function(_QueryTypeResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypeResponse():
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
    TResult? Function(_QueryTypeResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypeResponse() when $default != null:
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
            @JsonKey(name: 'StatusCode') String? statusCode,
            @JsonKey(name: 'StatusMessage') String? statusMessage,
            @JsonKey(name: 'QueryList') List<QueryTypeFz>? queryList,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _QueryTypeResponse() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.queryList,
            _that.customMessageDetails);
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
            @JsonKey(name: 'StatusCode') String? statusCode,
            @JsonKey(name: 'StatusMessage') String? statusMessage,
            @JsonKey(name: 'QueryList') List<QueryTypeFz>? queryList,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypeResponse():
        return $default(_that.statusCode, _that.statusMessage, _that.queryList,
            _that.customMessageDetails);
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
            @JsonKey(name: 'StatusCode') String? statusCode,
            @JsonKey(name: 'StatusMessage') String? statusMessage,
            @JsonKey(name: 'QueryList') List<QueryTypeFz>? queryList,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _QueryTypeResponse() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.queryList,
            _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _QueryTypeResponse extends QueryTypeResponse {
  const _QueryTypeResponse(
      {@JsonKey(name: 'StatusCode') this.statusCode,
      @JsonKey(name: 'StatusMessage') this.statusMessage,
      @JsonKey(name: 'QueryList') final List<QueryTypeFz>? queryList,
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails})
      : _queryList = queryList,
        super._();
  factory _QueryTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryTypeResponseFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String? statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String? statusMessage;
  final List<QueryTypeFz>? _queryList;
  @override
  @JsonKey(name: 'QueryList')
  List<QueryTypeFz>? get queryList {
    final value = _queryList;
    if (value == null) return null;
    if (_queryList is EqualUnmodifiableListView) return _queryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of QueryTypeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QueryTypeResponseCopyWith<_QueryTypeResponse> get copyWith =>
      __$QueryTypeResponseCopyWithImpl<_QueryTypeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QueryTypeResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QueryTypeResponse &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality()
                .equals(other._queryList, _queryList) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      const DeepCollectionEquality().hash(_queryList), customMessageDetails);

  @override
  String toString() {
    return 'QueryTypeResponse(statusCode: $statusCode, statusMessage: $statusMessage, queryList: $queryList, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$QueryTypeResponseCopyWith<$Res>
    implements $QueryTypeResponseCopyWith<$Res> {
  factory _$QueryTypeResponseCopyWith(
          _QueryTypeResponse value, $Res Function(_QueryTypeResponse) _then) =
      __$QueryTypeResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String? statusCode,
      @JsonKey(name: 'StatusMessage') String? statusMessage,
      @JsonKey(name: 'QueryList') List<QueryTypeFz>? queryList,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$QueryTypeResponseCopyWithImpl<$Res>
    implements _$QueryTypeResponseCopyWith<$Res> {
  __$QueryTypeResponseCopyWithImpl(this._self, this._then);

  final _QueryTypeResponse _self;
  final $Res Function(_QueryTypeResponse) _then;

  /// Create a copy of QueryTypeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? queryList = freezed,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_QueryTypeResponse(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      queryList: freezed == queryList
          ? _self._queryList
          : queryList // ignore: cast_nullable_to_non_nullable
              as List<QueryTypeFz>?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of QueryTypeResponse
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

// dart format on
