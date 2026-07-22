// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgotPassword.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPassword {
  @JsonKey(name: "StatusCode")
  String get statusCode;
  @JsonKey(name: "StatusMessage")
  String get statusMessage;
  @JsonKey(name: "CustomMessageDetails")
  CustomMessageDetails? get customMessageDetails;
  @JsonKey(name: "Data")
  Data? get data;

  /// Create a copy of ForgotPassword
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPasswordCopyWith<ForgotPassword> get copyWith =>
      _$ForgotPasswordCopyWithImpl<ForgotPassword>(
          this as ForgotPassword, _$identity);

  /// Serializes this ForgotPassword to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPassword &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessage, customMessageDetails, data);

  @override
  String toString() {
    return 'ForgotPassword(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ForgotPasswordCopyWith<$Res> {
  factory $ForgotPasswordCopyWith(
          ForgotPassword value, $Res Function(ForgotPassword) _then) =
      _$ForgotPasswordCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String statusCode,
      @JsonKey(name: "StatusMessage") String statusMessage,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails,
      @JsonKey(name: "Data") Data? data});

  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ForgotPasswordCopyWithImpl<$Res>
    implements $ForgotPasswordCopyWith<$Res> {
  _$ForgotPasswordCopyWithImpl(this._self, this._then);

  final ForgotPassword _self;
  final $Res Function(ForgotPassword) _then;

  /// Create a copy of ForgotPassword
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? data = freezed,
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
              as CustomMessageDetails?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of ForgotPassword
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

  /// Create a copy of ForgotPassword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ForgotPassword].
extension ForgotPasswordPatterns on ForgotPassword {
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
    TResult Function(_ForgotPassword value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForgotPassword() when $default != null:
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
    TResult Function(_ForgotPassword value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForgotPassword():
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
    TResult? Function(_ForgotPassword value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForgotPassword() when $default != null:
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
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: "Data") Data? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForgotPassword() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.data);
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
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: "Data") Data? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForgotPassword():
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.data);
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
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: "Data") Data? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForgotPassword() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ForgotPassword implements ForgotPassword {
  const _ForgotPassword(
      {@JsonKey(name: "StatusCode") this.statusCode = "",
      @JsonKey(name: "StatusMessage") this.statusMessage = "",
      @JsonKey(name: "CustomMessageDetails") this.customMessageDetails,
      @JsonKey(name: "Data") this.data});
  factory _ForgotPassword.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String statusMessage;
  @override
  @JsonKey(name: "CustomMessageDetails")
  final CustomMessageDetails? customMessageDetails;
  @override
  @JsonKey(name: "Data")
  final Data? data;

  /// Create a copy of ForgotPassword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPasswordCopyWith<_ForgotPassword> get copyWith =>
      __$ForgotPasswordCopyWithImpl<_ForgotPassword>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForgotPasswordToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPassword &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessage, customMessageDetails, data);

  @override
  String toString() {
    return 'ForgotPassword(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPasswordCopyWith<$Res>
    implements $ForgotPasswordCopyWith<$Res> {
  factory _$ForgotPasswordCopyWith(
          _ForgotPassword value, $Res Function(_ForgotPassword) _then) =
      __$ForgotPasswordCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String statusCode,
      @JsonKey(name: "StatusMessage") String statusMessage,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails,
      @JsonKey(name: "Data") Data? data});

  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$ForgotPasswordCopyWithImpl<$Res>
    implements _$ForgotPasswordCopyWith<$Res> {
  __$ForgotPasswordCopyWithImpl(this._self, this._then);

  final _ForgotPassword _self;
  final $Res Function(_ForgotPassword) _then;

  /// Create a copy of ForgotPassword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? data = freezed,
  }) {
    return _then(_ForgotPassword(
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
              as CustomMessageDetails?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of ForgotPassword
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

  /// Create a copy of ForgotPassword
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
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
      {@JsonKey(name: "MessageCode") this.messageCode = "",
      @JsonKey(name: "MessageType") this.messageType = "",
      @JsonKey(name: "MessageHeader") this.messageHeader = "",
      @JsonKey(name: "MessageDescription") this.messageDescription = ""});
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

/// @nodoc
mixin _$Data {
  @JsonKey(name: "MessageCode")
  String get messageCode;
  @JsonKey(name: "MessageDetails")
  String get messageDetails;
  @JsonKey(name: "StepOrderId")
  String get stepOrderId;
  @JsonKey(name: "CustomerCode")
  String get customerCode;
  @JsonKey(name: "IdNo")
  String get idNo;
  @JsonKey(name: "NotificationArray")
  List<NotificationArray>? get notificationArray;

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
            (identical(other.messageDetails, messageDetails) ||
                other.messageDetails == messageDetails) &&
            (identical(other.stepOrderId, stepOrderId) ||
                other.stepOrderId == stepOrderId) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            const DeepCollectionEquality()
                .equals(other.notificationArray, notificationArray));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      messageCode,
      messageDetails,
      stepOrderId,
      customerCode,
      idNo,
      const DeepCollectionEquality().hash(notificationArray));

  @override
  String toString() {
    return 'Data(messageCode: $messageCode, messageDetails: $messageDetails, stepOrderId: $stepOrderId, customerCode: $customerCode, idNo: $idNo, notificationArray: $notificationArray)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "MessageCode") String messageCode,
      @JsonKey(name: "MessageDetails") String messageDetails,
      @JsonKey(name: "StepOrderId") String stepOrderId,
      @JsonKey(name: "CustomerCode") String customerCode,
      @JsonKey(name: "IdNo") String idNo,
      @JsonKey(name: "NotificationArray")
      List<NotificationArray>? notificationArray});
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
    Object? messageDetails = null,
    Object? stepOrderId = null,
    Object? customerCode = null,
    Object? idNo = null,
    Object? notificationArray = freezed,
  }) {
    return _then(_self.copyWith(
      messageCode: null == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String,
      messageDetails: null == messageDetails
          ? _self.messageDetails
          : messageDetails // ignore: cast_nullable_to_non_nullable
              as String,
      stepOrderId: null == stepOrderId
          ? _self.stepOrderId
          : stepOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      idNo: null == idNo
          ? _self.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String,
      notificationArray: freezed == notificationArray
          ? _self.notificationArray
          : notificationArray // ignore: cast_nullable_to_non_nullable
              as List<NotificationArray>?,
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
            @JsonKey(name: "MessageCode") String messageCode,
            @JsonKey(name: "MessageDetails") String messageDetails,
            @JsonKey(name: "StepOrderId") String stepOrderId,
            @JsonKey(name: "CustomerCode") String customerCode,
            @JsonKey(name: "IdNo") String idNo,
            @JsonKey(name: "NotificationArray")
            List<NotificationArray>? notificationArray)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.messageCode,
            _that.messageDetails,
            _that.stepOrderId,
            _that.customerCode,
            _that.idNo,
            _that.notificationArray);
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
            @JsonKey(name: "MessageDetails") String messageDetails,
            @JsonKey(name: "StepOrderId") String stepOrderId,
            @JsonKey(name: "CustomerCode") String customerCode,
            @JsonKey(name: "IdNo") String idNo,
            @JsonKey(name: "NotificationArray")
            List<NotificationArray>? notificationArray)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(
            _that.messageCode,
            _that.messageDetails,
            _that.stepOrderId,
            _that.customerCode,
            _that.idNo,
            _that.notificationArray);
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
            @JsonKey(name: "MessageDetails") String messageDetails,
            @JsonKey(name: "StepOrderId") String stepOrderId,
            @JsonKey(name: "CustomerCode") String customerCode,
            @JsonKey(name: "IdNo") String idNo,
            @JsonKey(name: "NotificationArray")
            List<NotificationArray>? notificationArray)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.messageCode,
            _that.messageDetails,
            _that.stepOrderId,
            _that.customerCode,
            _that.idNo,
            _that.notificationArray);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: "MessageCode") this.messageCode = "",
      @JsonKey(name: "MessageDetails") this.messageDetails = "",
      @JsonKey(name: "StepOrderId") this.stepOrderId = "",
      @JsonKey(name: "CustomerCode") this.customerCode = "",
      @JsonKey(name: "IdNo") this.idNo = "",
      @JsonKey(name: "NotificationArray")
      final List<NotificationArray>? notificationArray})
      : _notificationArray = notificationArray;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  @JsonKey(name: "MessageCode")
  final String messageCode;
  @override
  @JsonKey(name: "MessageDetails")
  final String messageDetails;
  @override
  @JsonKey(name: "StepOrderId")
  final String stepOrderId;
  @override
  @JsonKey(name: "CustomerCode")
  final String customerCode;
  @override
  @JsonKey(name: "IdNo")
  final String idNo;
  final List<NotificationArray>? _notificationArray;
  @override
  @JsonKey(name: "NotificationArray")
  List<NotificationArray>? get notificationArray {
    final value = _notificationArray;
    if (value == null) return null;
    if (_notificationArray is EqualUnmodifiableListView)
      return _notificationArray;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
            (identical(other.messageDetails, messageDetails) ||
                other.messageDetails == messageDetails) &&
            (identical(other.stepOrderId, stepOrderId) ||
                other.stepOrderId == stepOrderId) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            const DeepCollectionEquality()
                .equals(other._notificationArray, _notificationArray));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      messageCode,
      messageDetails,
      stepOrderId,
      customerCode,
      idNo,
      const DeepCollectionEquality().hash(_notificationArray));

  @override
  String toString() {
    return 'Data(messageCode: $messageCode, messageDetails: $messageDetails, stepOrderId: $stepOrderId, customerCode: $customerCode, idNo: $idNo, notificationArray: $notificationArray)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "MessageCode") String messageCode,
      @JsonKey(name: "MessageDetails") String messageDetails,
      @JsonKey(name: "StepOrderId") String stepOrderId,
      @JsonKey(name: "CustomerCode") String customerCode,
      @JsonKey(name: "IdNo") String idNo,
      @JsonKey(name: "NotificationArray")
      List<NotificationArray>? notificationArray});
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
    Object? messageDetails = null,
    Object? stepOrderId = null,
    Object? customerCode = null,
    Object? idNo = null,
    Object? notificationArray = freezed,
  }) {
    return _then(_Data(
      messageCode: null == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String,
      messageDetails: null == messageDetails
          ? _self.messageDetails
          : messageDetails // ignore: cast_nullable_to_non_nullable
              as String,
      stepOrderId: null == stepOrderId
          ? _self.stepOrderId
          : stepOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      idNo: null == idNo
          ? _self.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String,
      notificationArray: freezed == notificationArray
          ? _self._notificationArray
          : notificationArray // ignore: cast_nullable_to_non_nullable
              as List<NotificationArray>?,
    ));
  }
}

/// @nodoc
mixin _$NotificationArray {
  @JsonKey(name: "MessageType")
  String get messageType;
  @JsonKey(name: "Recipient")
  String get recipient;
  @JsonKey(name: "OtpId")
  String get otpId;
  @JsonKey(name: "StatusCode")
  String get statusCode;
  @JsonKey(name: "StatusMessage")
  String get statusMessage;

  /// Create a copy of NotificationArray
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationArrayCopyWith<NotificationArray> get copyWith =>
      _$NotificationArrayCopyWithImpl<NotificationArray>(
          this as NotificationArray, _$identity);

  /// Serializes this NotificationArray to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationArray &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.otpId, otpId) || other.otpId == otpId) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, messageType, recipient, otpId, statusCode, statusMessage);

  @override
  String toString() {
    return 'NotificationArray(messageType: $messageType, recipient: $recipient, otpId: $otpId, statusCode: $statusCode, statusMessage: $statusMessage)';
  }
}

/// @nodoc
abstract mixin class $NotificationArrayCopyWith<$Res> {
  factory $NotificationArrayCopyWith(
          NotificationArray value, $Res Function(NotificationArray) _then) =
      _$NotificationArrayCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "MessageType") String messageType,
      @JsonKey(name: "Recipient") String recipient,
      @JsonKey(name: "OtpId") String otpId,
      @JsonKey(name: "StatusCode") String statusCode,
      @JsonKey(name: "StatusMessage") String statusMessage});
}

/// @nodoc
class _$NotificationArrayCopyWithImpl<$Res>
    implements $NotificationArrayCopyWith<$Res> {
  _$NotificationArrayCopyWithImpl(this._self, this._then);

  final NotificationArray _self;
  final $Res Function(NotificationArray) _then;

  /// Create a copy of NotificationArray
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageType = null,
    Object? recipient = null,
    Object? otpId = null,
    Object? statusCode = null,
    Object? statusMessage = null,
  }) {
    return _then(_self.copyWith(
      messageType: null == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      otpId: null == otpId
          ? _self.otpId
          : otpId // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationArray].
extension NotificationArrayPatterns on NotificationArray {
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
    TResult Function(_NotificationArray value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationArray() when $default != null:
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
    TResult Function(_NotificationArray value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationArray():
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
    TResult? Function(_NotificationArray value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationArray() when $default != null:
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
            @JsonKey(name: "MessageType") String messageType,
            @JsonKey(name: "Recipient") String recipient,
            @JsonKey(name: "OtpId") String otpId,
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationArray() when $default != null:
        return $default(_that.messageType, _that.recipient, _that.otpId,
            _that.statusCode, _that.statusMessage);
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
            @JsonKey(name: "MessageType") String messageType,
            @JsonKey(name: "Recipient") String recipient,
            @JsonKey(name: "OtpId") String otpId,
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationArray():
        return $default(_that.messageType, _that.recipient, _that.otpId,
            _that.statusCode, _that.statusMessage);
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
            @JsonKey(name: "MessageType") String messageType,
            @JsonKey(name: "Recipient") String recipient,
            @JsonKey(name: "OtpId") String otpId,
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationArray() when $default != null:
        return $default(_that.messageType, _that.recipient, _that.otpId,
            _that.statusCode, _that.statusMessage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationArray implements NotificationArray {
  const _NotificationArray(
      {@JsonKey(name: "MessageType") this.messageType = "",
      @JsonKey(name: "Recipient") this.recipient = "",
      @JsonKey(name: "OtpId") this.otpId = "",
      @JsonKey(name: "StatusCode") this.statusCode = "",
      @JsonKey(name: "StatusMessage") this.statusMessage = ""});
  factory _NotificationArray.fromJson(Map<String, dynamic> json) =>
      _$NotificationArrayFromJson(json);

  @override
  @JsonKey(name: "MessageType")
  final String messageType;
  @override
  @JsonKey(name: "Recipient")
  final String recipient;
  @override
  @JsonKey(name: "OtpId")
  final String otpId;
  @override
  @JsonKey(name: "StatusCode")
  final String statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String statusMessage;

  /// Create a copy of NotificationArray
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationArrayCopyWith<_NotificationArray> get copyWith =>
      __$NotificationArrayCopyWithImpl<_NotificationArray>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationArrayToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationArray &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.otpId, otpId) || other.otpId == otpId) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, messageType, recipient, otpId, statusCode, statusMessage);

  @override
  String toString() {
    return 'NotificationArray(messageType: $messageType, recipient: $recipient, otpId: $otpId, statusCode: $statusCode, statusMessage: $statusMessage)';
  }
}

/// @nodoc
abstract mixin class _$NotificationArrayCopyWith<$Res>
    implements $NotificationArrayCopyWith<$Res> {
  factory _$NotificationArrayCopyWith(
          _NotificationArray value, $Res Function(_NotificationArray) _then) =
      __$NotificationArrayCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "MessageType") String messageType,
      @JsonKey(name: "Recipient") String recipient,
      @JsonKey(name: "OtpId") String otpId,
      @JsonKey(name: "StatusCode") String statusCode,
      @JsonKey(name: "StatusMessage") String statusMessage});
}

/// @nodoc
class __$NotificationArrayCopyWithImpl<$Res>
    implements _$NotificationArrayCopyWith<$Res> {
  __$NotificationArrayCopyWithImpl(this._self, this._then);

  final _NotificationArray _self;
  final $Res Function(_NotificationArray) _then;

  /// Create a copy of NotificationArray
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messageType = null,
    Object? recipient = null,
    Object? otpId = null,
    Object? statusCode = null,
    Object? statusMessage = null,
  }) {
    return _then(_NotificationArray(
      messageType: null == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: null == recipient
          ? _self.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      otpId: null == otpId
          ? _self.otpId
          : otpId // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
