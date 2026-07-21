// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_data_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerDataFZ {
  @JsonKey(name: 'Data')
  ProfileData? get data;
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of CustomerDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerDataFZCopyWith<CustomerDataFZ> get copyWith =>
      _$CustomerDataFZCopyWithImpl<CustomerDataFZ>(
          this as CustomerDataFZ, _$identity);

  /// Serializes this CustomerDataFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerDataFZ &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, data, statusCode, statusMessage, customMessageDetails);

  @override
  String toString() {
    return 'CustomerDataFZ(data: $data, statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $CustomerDataFZCopyWith<$Res> {
  factory $CustomerDataFZCopyWith(
          CustomerDataFZ value, $Res Function(CustomerDataFZ) _then) =
      _$CustomerDataFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Data') ProfileData? data,
      @JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  $ProfileDataCopyWith<$Res>? get data;
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$CustomerDataFZCopyWithImpl<$Res>
    implements $CustomerDataFZCopyWith<$Res> {
  _$CustomerDataFZCopyWithImpl(this._self, this._then);

  final CustomerDataFZ _self;
  final $Res Function(CustomerDataFZ) _then;

  /// Create a copy of CustomerDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileData?,
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
    ));
  }

  /// Create a copy of CustomerDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ProfileDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of CustomerDataFZ
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

/// Adds pattern-matching-related methods to [CustomerDataFZ].
extension CustomerDataFZPatterns on CustomerDataFZ {
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
    TResult Function(_CustomerDataFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerDataFZ() when $default != null:
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
    TResult Function(_CustomerDataFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDataFZ():
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
    TResult? Function(_CustomerDataFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDataFZ() when $default != null:
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
            @JsonKey(name: 'Data') ProfileData? data,
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerDataFZ() when $default != null:
        return $default(_that.data, _that.statusCode, _that.statusMessage,
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
            @JsonKey(name: 'Data') ProfileData? data,
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDataFZ():
        return $default(_that.data, _that.statusCode, _that.statusMessage,
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
            @JsonKey(name: 'Data') ProfileData? data,
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerDataFZ() when $default != null:
        return $default(_that.data, _that.statusCode, _that.statusMessage,
            _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerDataFZ implements CustomerDataFZ {
  const _CustomerDataFZ(
      {@JsonKey(name: 'Data') this.data,
      @JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails});
  factory _CustomerDataFZ.fromJson(Map<String, dynamic> json) =>
      _$CustomerDataFZFromJson(json);

  @override
  @JsonKey(name: 'Data')
  final ProfileData? data;
  @override
  @JsonKey(name: 'StatusCode')
  final String statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String statusMessage;
  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of CustomerDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerDataFZCopyWith<_CustomerDataFZ> get copyWith =>
      __$CustomerDataFZCopyWithImpl<_CustomerDataFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerDataFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerDataFZ &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, data, statusCode, statusMessage, customMessageDetails);

  @override
  String toString() {
    return 'CustomerDataFZ(data: $data, statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$CustomerDataFZCopyWith<$Res>
    implements $CustomerDataFZCopyWith<$Res> {
  factory _$CustomerDataFZCopyWith(
          _CustomerDataFZ value, $Res Function(_CustomerDataFZ) _then) =
      __$CustomerDataFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Data') ProfileData? data,
      @JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  @override
  $ProfileDataCopyWith<$Res>? get data;
  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$CustomerDataFZCopyWithImpl<$Res>
    implements _$CustomerDataFZCopyWith<$Res> {
  __$CustomerDataFZCopyWithImpl(this._self, this._then);

  final _CustomerDataFZ _self;
  final $Res Function(_CustomerDataFZ) _then;

  /// Create a copy of CustomerDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_CustomerDataFZ(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileData?,
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
    ));
  }

  /// Create a copy of CustomerDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $ProfileDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of CustomerDataFZ
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

/// @nodoc
mixin _$CustomMessageDetails {
  @JsonKey(name: 'messageCode')
  String get messageCode;
  @JsonKey(name: 'messageType')
  String get messageType;
  @JsonKey(name: 'messageHeader')
  String get messageHeader;
  @JsonKey(name: 'messageDescription')
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
      {@JsonKey(name: 'messageCode') String messageCode,
      @JsonKey(name: 'messageType') String messageType,
      @JsonKey(name: 'messageHeader') String messageHeader,
      @JsonKey(name: 'messageDescription') String messageDescription});
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
            @JsonKey(name: 'messageCode') String messageCode,
            @JsonKey(name: 'messageType') String messageType,
            @JsonKey(name: 'messageHeader') String messageHeader,
            @JsonKey(name: 'messageDescription') String messageDescription)?
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
            @JsonKey(name: 'messageCode') String messageCode,
            @JsonKey(name: 'messageType') String messageType,
            @JsonKey(name: 'messageHeader') String messageHeader,
            @JsonKey(name: 'messageDescription') String messageDescription)
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
            @JsonKey(name: 'messageCode') String messageCode,
            @JsonKey(name: 'messageType') String messageType,
            @JsonKey(name: 'messageHeader') String messageHeader,
            @JsonKey(name: 'messageDescription') String messageDescription)?
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
      {@JsonKey(name: 'messageCode') this.messageCode = '',
      @JsonKey(name: 'messageType') this.messageType = '',
      @JsonKey(name: 'messageHeader') this.messageHeader = '',
      @JsonKey(name: 'messageDescription') this.messageDescription = ''});
  factory _CustomMessageDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageDetailsFromJson(json);

  @override
  @JsonKey(name: 'messageCode')
  final String messageCode;
  @override
  @JsonKey(name: 'messageType')
  final String messageType;
  @override
  @JsonKey(name: 'messageHeader')
  final String messageHeader;
  @override
  @JsonKey(name: 'messageDescription')
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
      {@JsonKey(name: 'messageCode') String messageCode,
      @JsonKey(name: 'messageType') String messageType,
      @JsonKey(name: 'messageHeader') String messageHeader,
      @JsonKey(name: 'messageDescription') String messageDescription});
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
mixin _$ProfileData {
  @JsonKey(name: 'CustomerCode')
  String get customerCode;
  @JsonKey(name: 'CustomerType')
  String get customerType;
  @JsonKey(name: 'PersonalInfo')
  PersonalInfo? get personalInfo;
  @JsonKey(name: 'Documents')
  dynamic get documents;
  @JsonKey(name: 'LanguageCode')
  String get languageCode;
  @JsonKey(name: 'Status')
  String get status;
  @JsonKey(name: 'UserId')
  String get userId;
  @JsonKey(name: "Name", readValue: _readName)
  String get name;
  @JsonKey(name: "FirstName")
  String get firstName;
  @JsonKey(name: "MiddleName")
  String? get middleName;
  @JsonKey(name: "LastName")
  String? get lastName;
  @JsonKey(name: "Gender")
  String? get gender;
  @JsonKey(name: "GenderCode")
  String? get genderCode;
  @JsonKey(name: "DateOfBirth")
  String? get dateOfBirth;
  @JsonKey(name: "Address1")
  String? get address1;
  @JsonKey(name: "Address2")
  String? get address2;
  @JsonKey(name: "PostalCode")
  String? get postalCode;
  @JsonKey(name: "MobileNo")
  String? get mobileNo;
  @JsonKey(name: "Mobile")
  String? get mobile;
  @JsonKey(name: "Email")
  String? get email;
  @JsonKey(name: "Nationality")
  String? get nationality;
  @JsonKey(name: "NationalityCode")
  String? get nationalityCode;
  @JsonKey(name: "CountryCode")
  String? get countryCode;
  @JsonKey(name: "Country")
  String? get country;
  @JsonKey(name: "State")
  String? get state;
  @JsonKey(name: "City")
  String? get city;
  @JsonKey(name: "IdTypeCode")
  String? get idTypeCode;
  @JsonKey(name: "IdType")
  String? get idType;
  @JsonKey(name: "IdNo")
  String? get idNo;
  @JsonKey(name: "IdIssueDate")
  String? get idIssueDate;
  @JsonKey(name: "IdExpiryDate")
  String? get idExpiryDate;
  @JsonKey(name: "ProfessionCode")
  String? get professionCode;
  @JsonKey(name: "Profession")
  String? get profession;
  @JsonKey(name: "EmployerName")
  String? get employerName;
  @JsonKey(name: "ExpectedMonthlyIncome")
  dynamic get expectedMonthlyIncome;
  @JsonKey(name: "ExpectedMonthlyTransactionCount")
  dynamic get expectedMonthlyTransactionCount;
  @JsonKey(name: 'mPIN')
  String get mPIN;
  @JsonKey(name: 'password')
  String get password;
  @JsonKey(name: 'userName')
  String
      get userName; // @JsonKey(name: 'enableBiometric') bool enableBiometric,
// @JsonKey(name: 'enableFaceId') bool enableFaceId,
  @JsonKey(name: 'appSession')
  String get appSession;
  @JsonKey(name: 'enableSaveCred')
  String get enableSaveCred;
  @JsonKey(name: 'profilePic')
  String? get profilePic;
  @JsonKey(name: 'ImageFront')
  String get imageFront;
  @JsonKey(name: 'ImageBack')
  String get imageBack;
  @JsonKey(name: 'Zone')
  String? get zone;
  @JsonKey(name: 'SecondNationality')
  String? get secondNationality;
  @JsonKey(name: 'SecondNationalityCode')
  String? get secondNationalityCode;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      _$ProfileDataCopyWithImpl<ProfileData>(this as ProfileData, _$identity);

  /// Serializes this ProfileData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileData &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.personalInfo, personalInfo) ||
                other.personalInfo == personalInfo) &&
            const DeepCollectionEquality().equals(other.documents, documents) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.nationalityCode, nationalityCode) ||
                other.nationalityCode == nationalityCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.idTypeCode, idTypeCode) ||
                other.idTypeCode == idTypeCode) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            (identical(other.idIssueDate, idIssueDate) ||
                other.idIssueDate == idIssueDate) &&
            (identical(other.idExpiryDate, idExpiryDate) ||
                other.idExpiryDate == idExpiryDate) &&
            (identical(other.professionCode, professionCode) ||
                other.professionCode == professionCode) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            const DeepCollectionEquality()
                .equals(other.expectedMonthlyIncome, expectedMonthlyIncome) &&
            const DeepCollectionEquality().equals(
                other.expectedMonthlyTransactionCount,
                expectedMonthlyTransactionCount) &&
            (identical(other.mPIN, mPIN) || other.mPIN == mPIN) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.appSession, appSession) ||
                other.appSession == appSession) &&
            (identical(other.enableSaveCred, enableSaveCred) ||
                other.enableSaveCred == enableSaveCred) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.imageFront, imageFront) ||
                other.imageFront == imageFront) &&
            (identical(other.imageBack, imageBack) ||
                other.imageBack == imageBack) &&
            (identical(other.zone, zone) || other.zone == zone) &&
            (identical(other.secondNationality, secondNationality) ||
                other.secondNationality == secondNationality) &&
            (identical(other.secondNationalityCode, secondNationalityCode) ||
                other.secondNationalityCode == secondNationalityCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerCode,
        customerType,
        personalInfo,
        const DeepCollectionEquality().hash(documents),
        languageCode,
        status,
        userId,
        name,
        firstName,
        middleName,
        lastName,
        gender,
        genderCode,
        dateOfBirth,
        address1,
        address2,
        postalCode,
        mobileNo,
        mobile,
        email,
        nationality,
        nationalityCode,
        countryCode,
        country,
        state,
        city,
        idTypeCode,
        idType,
        idNo,
        idIssueDate,
        idExpiryDate,
        professionCode,
        profession,
        employerName,
        const DeepCollectionEquality().hash(expectedMonthlyIncome),
        const DeepCollectionEquality().hash(expectedMonthlyTransactionCount),
        mPIN,
        password,
        userName,
        appSession,
        enableSaveCred,
        profilePic,
        imageFront,
        imageBack,
        zone,
        secondNationality,
        secondNationalityCode
      ]);

  @override
  String toString() {
    return 'ProfileData(customerCode: $customerCode, customerType: $customerType, personalInfo: $personalInfo, documents: $documents, languageCode: $languageCode, status: $status, userId: $userId, name: $name, firstName: $firstName, middleName: $middleName, lastName: $lastName, gender: $gender, genderCode: $genderCode, dateOfBirth: $dateOfBirth, address1: $address1, address2: $address2, postalCode: $postalCode, mobileNo: $mobileNo, mobile: $mobile, email: $email, nationality: $nationality, nationalityCode: $nationalityCode, countryCode: $countryCode, country: $country, state: $state, city: $city, idTypeCode: $idTypeCode, idType: $idType, idNo: $idNo, idIssueDate: $idIssueDate, idExpiryDate: $idExpiryDate, professionCode: $professionCode, profession: $profession, employerName: $employerName, expectedMonthlyIncome: $expectedMonthlyIncome, expectedMonthlyTransactionCount: $expectedMonthlyTransactionCount, mPIN: $mPIN, password: $password, userName: $userName, appSession: $appSession, enableSaveCred: $enableSaveCred, profilePic: $profilePic, imageFront: $imageFront, imageBack: $imageBack, zone: $zone, secondNationality: $secondNationality, secondNationalityCode: $secondNationalityCode)';
  }
}

/// @nodoc
abstract mixin class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) _then) =
      _$ProfileDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerCode') String customerCode,
      @JsonKey(name: 'CustomerType') String customerType,
      @JsonKey(name: 'PersonalInfo') PersonalInfo? personalInfo,
      @JsonKey(name: 'Documents') dynamic documents,
      @JsonKey(name: 'LanguageCode') String languageCode,
      @JsonKey(name: 'Status') String status,
      @JsonKey(name: 'UserId') String userId,
      @JsonKey(name: "Name", readValue: _readName) String name,
      @JsonKey(name: "FirstName") String firstName,
      @JsonKey(name: "MiddleName") String? middleName,
      @JsonKey(name: "LastName") String? lastName,
      @JsonKey(name: "Gender") String? gender,
      @JsonKey(name: "GenderCode") String? genderCode,
      @JsonKey(name: "DateOfBirth") String? dateOfBirth,
      @JsonKey(name: "Address1") String? address1,
      @JsonKey(name: "Address2") String? address2,
      @JsonKey(name: "PostalCode") String? postalCode,
      @JsonKey(name: "MobileNo") String? mobileNo,
      @JsonKey(name: "Mobile") String? mobile,
      @JsonKey(name: "Email") String? email,
      @JsonKey(name: "Nationality") String? nationality,
      @JsonKey(name: "NationalityCode") String? nationalityCode,
      @JsonKey(name: "CountryCode") String? countryCode,
      @JsonKey(name: "Country") String? country,
      @JsonKey(name: "State") String? state,
      @JsonKey(name: "City") String? city,
      @JsonKey(name: "IdTypeCode") String? idTypeCode,
      @JsonKey(name: "IdType") String? idType,
      @JsonKey(name: "IdNo") String? idNo,
      @JsonKey(name: "IdIssueDate") String? idIssueDate,
      @JsonKey(name: "IdExpiryDate") String? idExpiryDate,
      @JsonKey(name: "ProfessionCode") String? professionCode,
      @JsonKey(name: "Profession") String? profession,
      @JsonKey(name: "EmployerName") String? employerName,
      @JsonKey(name: "ExpectedMonthlyIncome") dynamic expectedMonthlyIncome,
      @JsonKey(name: "ExpectedMonthlyTransactionCount")
      dynamic expectedMonthlyTransactionCount,
      @JsonKey(name: 'mPIN') String mPIN,
      @JsonKey(name: 'password') String password,
      @JsonKey(name: 'userName') String userName,
      @JsonKey(name: 'appSession') String appSession,
      @JsonKey(name: 'enableSaveCred') String enableSaveCred,
      @JsonKey(name: 'profilePic') String? profilePic,
      @JsonKey(name: 'ImageFront') String imageFront,
      @JsonKey(name: 'ImageBack') String imageBack,
      @JsonKey(name: 'Zone') String? zone,
      @JsonKey(name: 'SecondNationality') String? secondNationality,
      @JsonKey(name: 'SecondNationalityCode') String? secondNationalityCode});

  $PersonalInfoCopyWith<$Res>? get personalInfo;
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res> implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._self, this._then);

  final ProfileData _self;
  final $Res Function(ProfileData) _then;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? customerType = null,
    Object? personalInfo = freezed,
    Object? documents = freezed,
    Object? languageCode = null,
    Object? status = null,
    Object? userId = null,
    Object? name = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? gender = freezed,
    Object? genderCode = freezed,
    Object? dateOfBirth = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? postalCode = freezed,
    Object? mobileNo = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? nationality = freezed,
    Object? nationalityCode = freezed,
    Object? countryCode = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? idTypeCode = freezed,
    Object? idType = freezed,
    Object? idNo = freezed,
    Object? idIssueDate = freezed,
    Object? idExpiryDate = freezed,
    Object? professionCode = freezed,
    Object? profession = freezed,
    Object? employerName = freezed,
    Object? expectedMonthlyIncome = freezed,
    Object? expectedMonthlyTransactionCount = freezed,
    Object? mPIN = null,
    Object? password = null,
    Object? userName = null,
    Object? appSession = null,
    Object? enableSaveCred = null,
    Object? profilePic = freezed,
    Object? imageFront = null,
    Object? imageBack = null,
    Object? zone = freezed,
    Object? secondNationality = freezed,
    Object? secondNationalityCode = freezed,
  }) {
    return _then(_self.copyWith(
      customerCode: null == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      customerType: null == customerType
          ? _self.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String,
      personalInfo: freezed == personalInfo
          ? _self.personalInfo
          : personalInfo // ignore: cast_nullable_to_non_nullable
              as PersonalInfo?,
      documents: freezed == documents
          ? _self.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as dynamic,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _self.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      genderCode: freezed == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _self.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _self.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _self.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityCode: freezed == nationalityCode
          ? _self.nationalityCode
          : nationalityCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      idTypeCode: freezed == idTypeCode
          ? _self.idTypeCode
          : idTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      idType: freezed == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String?,
      idNo: freezed == idNo
          ? _self.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssueDate: freezed == idIssueDate
          ? _self.idIssueDate
          : idIssueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      idExpiryDate: freezed == idExpiryDate
          ? _self.idExpiryDate
          : idExpiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      professionCode: freezed == professionCode
          ? _self.professionCode
          : professionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      employerName: freezed == employerName
          ? _self.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedMonthlyIncome: freezed == expectedMonthlyIncome
          ? _self.expectedMonthlyIncome
          : expectedMonthlyIncome // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expectedMonthlyTransactionCount: freezed ==
              expectedMonthlyTransactionCount
          ? _self.expectedMonthlyTransactionCount
          : expectedMonthlyTransactionCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mPIN: null == mPIN
          ? _self.mPIN
          : mPIN // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      appSession: null == appSession
          ? _self.appSession
          : appSession // ignore: cast_nullable_to_non_nullable
              as String,
      enableSaveCred: null == enableSaveCred
          ? _self.enableSaveCred
          : enableSaveCred // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: freezed == profilePic
          ? _self.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFront: null == imageFront
          ? _self.imageFront
          : imageFront // ignore: cast_nullable_to_non_nullable
              as String,
      imageBack: null == imageBack
          ? _self.imageBack
          : imageBack // ignore: cast_nullable_to_non_nullable
              as String,
      zone: freezed == zone
          ? _self.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as String?,
      secondNationality: freezed == secondNationality
          ? _self.secondNationality
          : secondNationality // ignore: cast_nullable_to_non_nullable
              as String?,
      secondNationalityCode: freezed == secondNationalityCode
          ? _self.secondNationalityCode
          : secondNationalityCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalInfoCopyWith<$Res>? get personalInfo {
    if (_self.personalInfo == null) {
      return null;
    }

    return $PersonalInfoCopyWith<$Res>(_self.personalInfo!, (value) {
      return _then(_self.copyWith(personalInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProfileData].
extension ProfileDataPatterns on ProfileData {
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
    TResult Function(_ProfileData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileData() when $default != null:
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
    TResult Function(_ProfileData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileData():
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
    TResult? Function(_ProfileData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileData() when $default != null:
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
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'CustomerType') String customerType,
            @JsonKey(name: 'PersonalInfo') PersonalInfo? personalInfo,
            @JsonKey(name: 'Documents') dynamic documents,
            @JsonKey(name: 'LanguageCode') String languageCode,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'UserId') String userId,
            @JsonKey(name: "Name", readValue: _readName) String name,
            @JsonKey(name: "FirstName") String firstName,
            @JsonKey(name: "MiddleName") String? middleName,
            @JsonKey(name: "LastName") String? lastName,
            @JsonKey(name: "Gender") String? gender,
            @JsonKey(name: "GenderCode") String? genderCode,
            @JsonKey(name: "DateOfBirth") String? dateOfBirth,
            @JsonKey(name: "Address1") String? address1,
            @JsonKey(name: "Address2") String? address2,
            @JsonKey(name: "PostalCode") String? postalCode,
            @JsonKey(name: "MobileNo") String? mobileNo,
            @JsonKey(name: "Mobile") String? mobile,
            @JsonKey(name: "Email") String? email,
            @JsonKey(name: "Nationality") String? nationality,
            @JsonKey(name: "NationalityCode") String? nationalityCode,
            @JsonKey(name: "CountryCode") String? countryCode,
            @JsonKey(name: "Country") String? country,
            @JsonKey(name: "State") String? state,
            @JsonKey(name: "City") String? city,
            @JsonKey(name: "IdTypeCode") String? idTypeCode,
            @JsonKey(name: "IdType") String? idType,
            @JsonKey(name: "IdNo") String? idNo,
            @JsonKey(name: "IdIssueDate") String? idIssueDate,
            @JsonKey(name: "IdExpiryDate") String? idExpiryDate,
            @JsonKey(name: "ProfessionCode") String? professionCode,
            @JsonKey(name: "Profession") String? profession,
            @JsonKey(name: "EmployerName") String? employerName,
            @JsonKey(name: "ExpectedMonthlyIncome")
            dynamic expectedMonthlyIncome,
            @JsonKey(name: "ExpectedMonthlyTransactionCount")
            dynamic expectedMonthlyTransactionCount,
            @JsonKey(name: 'mPIN') String mPIN,
            @JsonKey(name: 'password') String password,
            @JsonKey(name: 'userName') String userName,
            @JsonKey(name: 'appSession') String appSession,
            @JsonKey(name: 'enableSaveCred') String enableSaveCred,
            @JsonKey(name: 'profilePic') String? profilePic,
            @JsonKey(name: 'ImageFront') String imageFront,
            @JsonKey(name: 'ImageBack') String imageBack,
            @JsonKey(name: 'Zone') String? zone,
            @JsonKey(name: 'SecondNationality') String? secondNationality,
            @JsonKey(name: 'SecondNationalityCode')
            String? secondNationalityCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProfileData() when $default != null:
        return $default(
            _that.customerCode,
            _that.customerType,
            _that.personalInfo,
            _that.documents,
            _that.languageCode,
            _that.status,
            _that.userId,
            _that.name,
            _that.firstName,
            _that.middleName,
            _that.lastName,
            _that.gender,
            _that.genderCode,
            _that.dateOfBirth,
            _that.address1,
            _that.address2,
            _that.postalCode,
            _that.mobileNo,
            _that.mobile,
            _that.email,
            _that.nationality,
            _that.nationalityCode,
            _that.countryCode,
            _that.country,
            _that.state,
            _that.city,
            _that.idTypeCode,
            _that.idType,
            _that.idNo,
            _that.idIssueDate,
            _that.idExpiryDate,
            _that.professionCode,
            _that.profession,
            _that.employerName,
            _that.expectedMonthlyIncome,
            _that.expectedMonthlyTransactionCount,
            _that.mPIN,
            _that.password,
            _that.userName,
            _that.appSession,
            _that.enableSaveCred,
            _that.profilePic,
            _that.imageFront,
            _that.imageBack,
            _that.zone,
            _that.secondNationality,
            _that.secondNationalityCode);
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
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'CustomerType') String customerType,
            @JsonKey(name: 'PersonalInfo') PersonalInfo? personalInfo,
            @JsonKey(name: 'Documents') dynamic documents,
            @JsonKey(name: 'LanguageCode') String languageCode,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'UserId') String userId,
            @JsonKey(name: "Name", readValue: _readName) String name,
            @JsonKey(name: "FirstName") String firstName,
            @JsonKey(name: "MiddleName") String? middleName,
            @JsonKey(name: "LastName") String? lastName,
            @JsonKey(name: "Gender") String? gender,
            @JsonKey(name: "GenderCode") String? genderCode,
            @JsonKey(name: "DateOfBirth") String? dateOfBirth,
            @JsonKey(name: "Address1") String? address1,
            @JsonKey(name: "Address2") String? address2,
            @JsonKey(name: "PostalCode") String? postalCode,
            @JsonKey(name: "MobileNo") String? mobileNo,
            @JsonKey(name: "Mobile") String? mobile,
            @JsonKey(name: "Email") String? email,
            @JsonKey(name: "Nationality") String? nationality,
            @JsonKey(name: "NationalityCode") String? nationalityCode,
            @JsonKey(name: "CountryCode") String? countryCode,
            @JsonKey(name: "Country") String? country,
            @JsonKey(name: "State") String? state,
            @JsonKey(name: "City") String? city,
            @JsonKey(name: "IdTypeCode") String? idTypeCode,
            @JsonKey(name: "IdType") String? idType,
            @JsonKey(name: "IdNo") String? idNo,
            @JsonKey(name: "IdIssueDate") String? idIssueDate,
            @JsonKey(name: "IdExpiryDate") String? idExpiryDate,
            @JsonKey(name: "ProfessionCode") String? professionCode,
            @JsonKey(name: "Profession") String? profession,
            @JsonKey(name: "EmployerName") String? employerName,
            @JsonKey(name: "ExpectedMonthlyIncome")
            dynamic expectedMonthlyIncome,
            @JsonKey(name: "ExpectedMonthlyTransactionCount")
            dynamic expectedMonthlyTransactionCount,
            @JsonKey(name: 'mPIN') String mPIN,
            @JsonKey(name: 'password') String password,
            @JsonKey(name: 'userName') String userName,
            @JsonKey(name: 'appSession') String appSession,
            @JsonKey(name: 'enableSaveCred') String enableSaveCred,
            @JsonKey(name: 'profilePic') String? profilePic,
            @JsonKey(name: 'ImageFront') String imageFront,
            @JsonKey(name: 'ImageBack') String imageBack,
            @JsonKey(name: 'Zone') String? zone,
            @JsonKey(name: 'SecondNationality') String? secondNationality,
            @JsonKey(name: 'SecondNationalityCode')
            String? secondNationalityCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileData():
        return $default(
            _that.customerCode,
            _that.customerType,
            _that.personalInfo,
            _that.documents,
            _that.languageCode,
            _that.status,
            _that.userId,
            _that.name,
            _that.firstName,
            _that.middleName,
            _that.lastName,
            _that.gender,
            _that.genderCode,
            _that.dateOfBirth,
            _that.address1,
            _that.address2,
            _that.postalCode,
            _that.mobileNo,
            _that.mobile,
            _that.email,
            _that.nationality,
            _that.nationalityCode,
            _that.countryCode,
            _that.country,
            _that.state,
            _that.city,
            _that.idTypeCode,
            _that.idType,
            _that.idNo,
            _that.idIssueDate,
            _that.idExpiryDate,
            _that.professionCode,
            _that.profession,
            _that.employerName,
            _that.expectedMonthlyIncome,
            _that.expectedMonthlyTransactionCount,
            _that.mPIN,
            _that.password,
            _that.userName,
            _that.appSession,
            _that.enableSaveCred,
            _that.profilePic,
            _that.imageFront,
            _that.imageBack,
            _that.zone,
            _that.secondNationality,
            _that.secondNationalityCode);
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
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'CustomerType') String customerType,
            @JsonKey(name: 'PersonalInfo') PersonalInfo? personalInfo,
            @JsonKey(name: 'Documents') dynamic documents,
            @JsonKey(name: 'LanguageCode') String languageCode,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'UserId') String userId,
            @JsonKey(name: "Name", readValue: _readName) String name,
            @JsonKey(name: "FirstName") String firstName,
            @JsonKey(name: "MiddleName") String? middleName,
            @JsonKey(name: "LastName") String? lastName,
            @JsonKey(name: "Gender") String? gender,
            @JsonKey(name: "GenderCode") String? genderCode,
            @JsonKey(name: "DateOfBirth") String? dateOfBirth,
            @JsonKey(name: "Address1") String? address1,
            @JsonKey(name: "Address2") String? address2,
            @JsonKey(name: "PostalCode") String? postalCode,
            @JsonKey(name: "MobileNo") String? mobileNo,
            @JsonKey(name: "Mobile") String? mobile,
            @JsonKey(name: "Email") String? email,
            @JsonKey(name: "Nationality") String? nationality,
            @JsonKey(name: "NationalityCode") String? nationalityCode,
            @JsonKey(name: "CountryCode") String? countryCode,
            @JsonKey(name: "Country") String? country,
            @JsonKey(name: "State") String? state,
            @JsonKey(name: "City") String? city,
            @JsonKey(name: "IdTypeCode") String? idTypeCode,
            @JsonKey(name: "IdType") String? idType,
            @JsonKey(name: "IdNo") String? idNo,
            @JsonKey(name: "IdIssueDate") String? idIssueDate,
            @JsonKey(name: "IdExpiryDate") String? idExpiryDate,
            @JsonKey(name: "ProfessionCode") String? professionCode,
            @JsonKey(name: "Profession") String? profession,
            @JsonKey(name: "EmployerName") String? employerName,
            @JsonKey(name: "ExpectedMonthlyIncome")
            dynamic expectedMonthlyIncome,
            @JsonKey(name: "ExpectedMonthlyTransactionCount")
            dynamic expectedMonthlyTransactionCount,
            @JsonKey(name: 'mPIN') String mPIN,
            @JsonKey(name: 'password') String password,
            @JsonKey(name: 'userName') String userName,
            @JsonKey(name: 'appSession') String appSession,
            @JsonKey(name: 'enableSaveCred') String enableSaveCred,
            @JsonKey(name: 'profilePic') String? profilePic,
            @JsonKey(name: 'ImageFront') String imageFront,
            @JsonKey(name: 'ImageBack') String imageBack,
            @JsonKey(name: 'Zone') String? zone,
            @JsonKey(name: 'SecondNationality') String? secondNationality,
            @JsonKey(name: 'SecondNationalityCode')
            String? secondNationalityCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProfileData() when $default != null:
        return $default(
            _that.customerCode,
            _that.customerType,
            _that.personalInfo,
            _that.documents,
            _that.languageCode,
            _that.status,
            _that.userId,
            _that.name,
            _that.firstName,
            _that.middleName,
            _that.lastName,
            _that.gender,
            _that.genderCode,
            _that.dateOfBirth,
            _that.address1,
            _that.address2,
            _that.postalCode,
            _that.mobileNo,
            _that.mobile,
            _that.email,
            _that.nationality,
            _that.nationalityCode,
            _that.countryCode,
            _that.country,
            _that.state,
            _that.city,
            _that.idTypeCode,
            _that.idType,
            _that.idNo,
            _that.idIssueDate,
            _that.idExpiryDate,
            _that.professionCode,
            _that.profession,
            _that.employerName,
            _that.expectedMonthlyIncome,
            _that.expectedMonthlyTransactionCount,
            _that.mPIN,
            _that.password,
            _that.userName,
            _that.appSession,
            _that.enableSaveCred,
            _that.profilePic,
            _that.imageFront,
            _that.imageBack,
            _that.zone,
            _that.secondNationality,
            _that.secondNationalityCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileData implements ProfileData {
  const _ProfileData(
      {@JsonKey(name: 'CustomerCode') this.customerCode = '',
      @JsonKey(name: 'CustomerType') this.customerType = '',
      @JsonKey(name: 'PersonalInfo') this.personalInfo,
      @JsonKey(name: 'Documents') this.documents,
      @JsonKey(name: 'LanguageCode') this.languageCode = '',
      @JsonKey(name: 'Status') this.status = '',
      @JsonKey(name: 'UserId') this.userId = '',
      @JsonKey(name: "Name", readValue: _readName) this.name = '',
      @JsonKey(name: "FirstName") this.firstName = '',
      @JsonKey(name: "MiddleName") this.middleName = '',
      @JsonKey(name: "LastName") this.lastName = '',
      @JsonKey(name: "Gender") this.gender = '',
      @JsonKey(name: "GenderCode") this.genderCode = '',
      @JsonKey(name: "DateOfBirth") this.dateOfBirth = '',
      @JsonKey(name: "Address1") this.address1 = '',
      @JsonKey(name: "Address2") this.address2 = '',
      @JsonKey(name: "PostalCode") this.postalCode = '',
      @JsonKey(name: "MobileNo") this.mobileNo = '',
      @JsonKey(name: "Mobile") this.mobile = '',
      @JsonKey(name: "Email") this.email = '',
      @JsonKey(name: "Nationality") this.nationality = '',
      @JsonKey(name: "NationalityCode") this.nationalityCode = '',
      @JsonKey(name: "CountryCode") this.countryCode = '',
      @JsonKey(name: "Country") this.country = '',
      @JsonKey(name: "State") this.state = '',
      @JsonKey(name: "City") this.city = '',
      @JsonKey(name: "IdTypeCode") this.idTypeCode = '',
      @JsonKey(name: "IdType") this.idType = '',
      @JsonKey(name: "IdNo") this.idNo = '',
      @JsonKey(name: "IdIssueDate") this.idIssueDate = '',
      @JsonKey(name: "IdExpiryDate") this.idExpiryDate = '',
      @JsonKey(name: "ProfessionCode") this.professionCode = '',
      @JsonKey(name: "Profession") this.profession = '',
      @JsonKey(name: "EmployerName") this.employerName = '',
      @JsonKey(name: "ExpectedMonthlyIncome") this.expectedMonthlyIncome = '',
      @JsonKey(name: "ExpectedMonthlyTransactionCount")
      this.expectedMonthlyTransactionCount = '',
      @JsonKey(name: 'mPIN') this.mPIN = '',
      @JsonKey(name: 'password') this.password = '',
      @JsonKey(name: 'userName') this.userName = '',
      @JsonKey(name: 'appSession') this.appSession = '',
      @JsonKey(name: 'enableSaveCred') this.enableSaveCred = '',
      @JsonKey(name: 'profilePic') this.profilePic = null,
      @JsonKey(name: 'ImageFront') this.imageFront = '',
      @JsonKey(name: 'ImageBack') this.imageBack = '',
      @JsonKey(name: 'Zone') this.zone = '',
      @JsonKey(name: 'SecondNationality') this.secondNationality = '',
      @JsonKey(name: 'SecondNationalityCode') this.secondNationalityCode = ''});
  factory _ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  @override
  @JsonKey(name: 'CustomerCode')
  final String customerCode;
  @override
  @JsonKey(name: 'CustomerType')
  final String customerType;
  @override
  @JsonKey(name: 'PersonalInfo')
  final PersonalInfo? personalInfo;
  @override
  @JsonKey(name: 'Documents')
  final dynamic documents;
  @override
  @JsonKey(name: 'LanguageCode')
  final String languageCode;
  @override
  @JsonKey(name: 'Status')
  final String status;
  @override
  @JsonKey(name: 'UserId')
  final String userId;
  @override
  @JsonKey(name: "Name", readValue: _readName)
  final String name;
  @override
  @JsonKey(name: "FirstName")
  final String firstName;
  @override
  @JsonKey(name: "MiddleName")
  final String? middleName;
  @override
  @JsonKey(name: "LastName")
  final String? lastName;
  @override
  @JsonKey(name: "Gender")
  final String? gender;
  @override
  @JsonKey(name: "GenderCode")
  final String? genderCode;
  @override
  @JsonKey(name: "DateOfBirth")
  final String? dateOfBirth;
  @override
  @JsonKey(name: "Address1")
  final String? address1;
  @override
  @JsonKey(name: "Address2")
  final String? address2;
  @override
  @JsonKey(name: "PostalCode")
  final String? postalCode;
  @override
  @JsonKey(name: "MobileNo")
  final String? mobileNo;
  @override
  @JsonKey(name: "Mobile")
  final String? mobile;
  @override
  @JsonKey(name: "Email")
  final String? email;
  @override
  @JsonKey(name: "Nationality")
  final String? nationality;
  @override
  @JsonKey(name: "NationalityCode")
  final String? nationalityCode;
  @override
  @JsonKey(name: "CountryCode")
  final String? countryCode;
  @override
  @JsonKey(name: "Country")
  final String? country;
  @override
  @JsonKey(name: "State")
  final String? state;
  @override
  @JsonKey(name: "City")
  final String? city;
  @override
  @JsonKey(name: "IdTypeCode")
  final String? idTypeCode;
  @override
  @JsonKey(name: "IdType")
  final String? idType;
  @override
  @JsonKey(name: "IdNo")
  final String? idNo;
  @override
  @JsonKey(name: "IdIssueDate")
  final String? idIssueDate;
  @override
  @JsonKey(name: "IdExpiryDate")
  final String? idExpiryDate;
  @override
  @JsonKey(name: "ProfessionCode")
  final String? professionCode;
  @override
  @JsonKey(name: "Profession")
  final String? profession;
  @override
  @JsonKey(name: "EmployerName")
  final String? employerName;
  @override
  @JsonKey(name: "ExpectedMonthlyIncome")
  final dynamic expectedMonthlyIncome;
  @override
  @JsonKey(name: "ExpectedMonthlyTransactionCount")
  final dynamic expectedMonthlyTransactionCount;
  @override
  @JsonKey(name: 'mPIN')
  final String mPIN;
  @override
  @JsonKey(name: 'password')
  final String password;
  @override
  @JsonKey(name: 'userName')
  final String userName;
// @JsonKey(name: 'enableBiometric') bool enableBiometric,
// @JsonKey(name: 'enableFaceId') bool enableFaceId,
  @override
  @JsonKey(name: 'appSession')
  final String appSession;
  @override
  @JsonKey(name: 'enableSaveCred')
  final String enableSaveCred;
  @override
  @JsonKey(name: 'profilePic')
  final String? profilePic;
  @override
  @JsonKey(name: 'ImageFront')
  final String imageFront;
  @override
  @JsonKey(name: 'ImageBack')
  final String imageBack;
  @override
  @JsonKey(name: 'Zone')
  final String? zone;
  @override
  @JsonKey(name: 'SecondNationality')
  final String? secondNationality;
  @override
  @JsonKey(name: 'SecondNationalityCode')
  final String? secondNationalityCode;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileDataCopyWith<_ProfileData> get copyWith =>
      __$ProfileDataCopyWithImpl<_ProfileData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileData &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.personalInfo, personalInfo) ||
                other.personalInfo == personalInfo) &&
            const DeepCollectionEquality().equals(other.documents, documents) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.nationalityCode, nationalityCode) ||
                other.nationalityCode == nationalityCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.idTypeCode, idTypeCode) ||
                other.idTypeCode == idTypeCode) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            (identical(other.idIssueDate, idIssueDate) ||
                other.idIssueDate == idIssueDate) &&
            (identical(other.idExpiryDate, idExpiryDate) ||
                other.idExpiryDate == idExpiryDate) &&
            (identical(other.professionCode, professionCode) ||
                other.professionCode == professionCode) &&
            (identical(other.profession, profession) ||
                other.profession == profession) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            const DeepCollectionEquality()
                .equals(other.expectedMonthlyIncome, expectedMonthlyIncome) &&
            const DeepCollectionEquality().equals(
                other.expectedMonthlyTransactionCount,
                expectedMonthlyTransactionCount) &&
            (identical(other.mPIN, mPIN) || other.mPIN == mPIN) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.appSession, appSession) ||
                other.appSession == appSession) &&
            (identical(other.enableSaveCred, enableSaveCred) ||
                other.enableSaveCred == enableSaveCred) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.imageFront, imageFront) ||
                other.imageFront == imageFront) &&
            (identical(other.imageBack, imageBack) ||
                other.imageBack == imageBack) &&
            (identical(other.zone, zone) || other.zone == zone) &&
            (identical(other.secondNationality, secondNationality) ||
                other.secondNationality == secondNationality) &&
            (identical(other.secondNationalityCode, secondNationalityCode) ||
                other.secondNationalityCode == secondNationalityCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerCode,
        customerType,
        personalInfo,
        const DeepCollectionEquality().hash(documents),
        languageCode,
        status,
        userId,
        name,
        firstName,
        middleName,
        lastName,
        gender,
        genderCode,
        dateOfBirth,
        address1,
        address2,
        postalCode,
        mobileNo,
        mobile,
        email,
        nationality,
        nationalityCode,
        countryCode,
        country,
        state,
        city,
        idTypeCode,
        idType,
        idNo,
        idIssueDate,
        idExpiryDate,
        professionCode,
        profession,
        employerName,
        const DeepCollectionEquality().hash(expectedMonthlyIncome),
        const DeepCollectionEquality().hash(expectedMonthlyTransactionCount),
        mPIN,
        password,
        userName,
        appSession,
        enableSaveCred,
        profilePic,
        imageFront,
        imageBack,
        zone,
        secondNationality,
        secondNationalityCode
      ]);

  @override
  String toString() {
    return 'ProfileData(customerCode: $customerCode, customerType: $customerType, personalInfo: $personalInfo, documents: $documents, languageCode: $languageCode, status: $status, userId: $userId, name: $name, firstName: $firstName, middleName: $middleName, lastName: $lastName, gender: $gender, genderCode: $genderCode, dateOfBirth: $dateOfBirth, address1: $address1, address2: $address2, postalCode: $postalCode, mobileNo: $mobileNo, mobile: $mobile, email: $email, nationality: $nationality, nationalityCode: $nationalityCode, countryCode: $countryCode, country: $country, state: $state, city: $city, idTypeCode: $idTypeCode, idType: $idType, idNo: $idNo, idIssueDate: $idIssueDate, idExpiryDate: $idExpiryDate, professionCode: $professionCode, profession: $profession, employerName: $employerName, expectedMonthlyIncome: $expectedMonthlyIncome, expectedMonthlyTransactionCount: $expectedMonthlyTransactionCount, mPIN: $mPIN, password: $password, userName: $userName, appSession: $appSession, enableSaveCred: $enableSaveCred, profilePic: $profilePic, imageFront: $imageFront, imageBack: $imageBack, zone: $zone, secondNationality: $secondNationality, secondNationalityCode: $secondNationalityCode)';
  }
}

/// @nodoc
abstract mixin class _$ProfileDataCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$ProfileDataCopyWith(
          _ProfileData value, $Res Function(_ProfileData) _then) =
      __$ProfileDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomerCode') String customerCode,
      @JsonKey(name: 'CustomerType') String customerType,
      @JsonKey(name: 'PersonalInfo') PersonalInfo? personalInfo,
      @JsonKey(name: 'Documents') dynamic documents,
      @JsonKey(name: 'LanguageCode') String languageCode,
      @JsonKey(name: 'Status') String status,
      @JsonKey(name: 'UserId') String userId,
      @JsonKey(name: "Name", readValue: _readName) String name,
      @JsonKey(name: "FirstName") String firstName,
      @JsonKey(name: "MiddleName") String? middleName,
      @JsonKey(name: "LastName") String? lastName,
      @JsonKey(name: "Gender") String? gender,
      @JsonKey(name: "GenderCode") String? genderCode,
      @JsonKey(name: "DateOfBirth") String? dateOfBirth,
      @JsonKey(name: "Address1") String? address1,
      @JsonKey(name: "Address2") String? address2,
      @JsonKey(name: "PostalCode") String? postalCode,
      @JsonKey(name: "MobileNo") String? mobileNo,
      @JsonKey(name: "Mobile") String? mobile,
      @JsonKey(name: "Email") String? email,
      @JsonKey(name: "Nationality") String? nationality,
      @JsonKey(name: "NationalityCode") String? nationalityCode,
      @JsonKey(name: "CountryCode") String? countryCode,
      @JsonKey(name: "Country") String? country,
      @JsonKey(name: "State") String? state,
      @JsonKey(name: "City") String? city,
      @JsonKey(name: "IdTypeCode") String? idTypeCode,
      @JsonKey(name: "IdType") String? idType,
      @JsonKey(name: "IdNo") String? idNo,
      @JsonKey(name: "IdIssueDate") String? idIssueDate,
      @JsonKey(name: "IdExpiryDate") String? idExpiryDate,
      @JsonKey(name: "ProfessionCode") String? professionCode,
      @JsonKey(name: "Profession") String? profession,
      @JsonKey(name: "EmployerName") String? employerName,
      @JsonKey(name: "ExpectedMonthlyIncome") dynamic expectedMonthlyIncome,
      @JsonKey(name: "ExpectedMonthlyTransactionCount")
      dynamic expectedMonthlyTransactionCount,
      @JsonKey(name: 'mPIN') String mPIN,
      @JsonKey(name: 'password') String password,
      @JsonKey(name: 'userName') String userName,
      @JsonKey(name: 'appSession') String appSession,
      @JsonKey(name: 'enableSaveCred') String enableSaveCred,
      @JsonKey(name: 'profilePic') String? profilePic,
      @JsonKey(name: 'ImageFront') String imageFront,
      @JsonKey(name: 'ImageBack') String imageBack,
      @JsonKey(name: 'Zone') String? zone,
      @JsonKey(name: 'SecondNationality') String? secondNationality,
      @JsonKey(name: 'SecondNationalityCode') String? secondNationalityCode});

  @override
  $PersonalInfoCopyWith<$Res>? get personalInfo;
}

/// @nodoc
class __$ProfileDataCopyWithImpl<$Res> implements _$ProfileDataCopyWith<$Res> {
  __$ProfileDataCopyWithImpl(this._self, this._then);

  final _ProfileData _self;
  final $Res Function(_ProfileData) _then;

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customerCode = null,
    Object? customerType = null,
    Object? personalInfo = freezed,
    Object? documents = freezed,
    Object? languageCode = null,
    Object? status = null,
    Object? userId = null,
    Object? name = null,
    Object? firstName = null,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? gender = freezed,
    Object? genderCode = freezed,
    Object? dateOfBirth = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? postalCode = freezed,
    Object? mobileNo = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? nationality = freezed,
    Object? nationalityCode = freezed,
    Object? countryCode = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? idTypeCode = freezed,
    Object? idType = freezed,
    Object? idNo = freezed,
    Object? idIssueDate = freezed,
    Object? idExpiryDate = freezed,
    Object? professionCode = freezed,
    Object? profession = freezed,
    Object? employerName = freezed,
    Object? expectedMonthlyIncome = freezed,
    Object? expectedMonthlyTransactionCount = freezed,
    Object? mPIN = null,
    Object? password = null,
    Object? userName = null,
    Object? appSession = null,
    Object? enableSaveCred = null,
    Object? profilePic = freezed,
    Object? imageFront = null,
    Object? imageBack = null,
    Object? zone = freezed,
    Object? secondNationality = freezed,
    Object? secondNationalityCode = freezed,
  }) {
    return _then(_ProfileData(
      customerCode: null == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      customerType: null == customerType
          ? _self.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String,
      personalInfo: freezed == personalInfo
          ? _self.personalInfo
          : personalInfo // ignore: cast_nullable_to_non_nullable
              as PersonalInfo?,
      documents: freezed == documents
          ? _self.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as dynamic,
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      middleName: freezed == middleName
          ? _self.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      genderCode: freezed == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _self.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _self.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileNo: freezed == mobileNo
          ? _self.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      nationality: freezed == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalityCode: freezed == nationalityCode
          ? _self.nationalityCode
          : nationalityCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      idTypeCode: freezed == idTypeCode
          ? _self.idTypeCode
          : idTypeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      idType: freezed == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String?,
      idNo: freezed == idNo
          ? _self.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssueDate: freezed == idIssueDate
          ? _self.idIssueDate
          : idIssueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      idExpiryDate: freezed == idExpiryDate
          ? _self.idExpiryDate
          : idExpiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      professionCode: freezed == professionCode
          ? _self.professionCode
          : professionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      employerName: freezed == employerName
          ? _self.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      expectedMonthlyIncome: freezed == expectedMonthlyIncome
          ? _self.expectedMonthlyIncome
          : expectedMonthlyIncome // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expectedMonthlyTransactionCount: freezed ==
              expectedMonthlyTransactionCount
          ? _self.expectedMonthlyTransactionCount
          : expectedMonthlyTransactionCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mPIN: null == mPIN
          ? _self.mPIN
          : mPIN // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      appSession: null == appSession
          ? _self.appSession
          : appSession // ignore: cast_nullable_to_non_nullable
              as String,
      enableSaveCred: null == enableSaveCred
          ? _self.enableSaveCred
          : enableSaveCred // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: freezed == profilePic
          ? _self.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFront: null == imageFront
          ? _self.imageFront
          : imageFront // ignore: cast_nullable_to_non_nullable
              as String,
      imageBack: null == imageBack
          ? _self.imageBack
          : imageBack // ignore: cast_nullable_to_non_nullable
              as String,
      zone: freezed == zone
          ? _self.zone
          : zone // ignore: cast_nullable_to_non_nullable
              as String?,
      secondNationality: freezed == secondNationality
          ? _self.secondNationality
          : secondNationality // ignore: cast_nullable_to_non_nullable
              as String?,
      secondNationalityCode: freezed == secondNationalityCode
          ? _self.secondNationalityCode
          : secondNationalityCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of ProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalInfoCopyWith<$Res>? get personalInfo {
    if (_self.personalInfo == null) {
      return null;
    }

    return $PersonalInfoCopyWith<$Res>(_self.personalInfo!, (value) {
      return _then(_self.copyWith(personalInfo: value));
    });
  }
}

/// @nodoc
mixin _$PersonalInfo {
  @JsonKey(name: 'name1')
  String get name1;
  @JsonKey(name: 'name2')
  String get name2;
  @JsonKey(name: 'name3')
  String get name3;
  @JsonKey(name: 'name4')
  String get name4;
  @JsonKey(name: 'gender')
  String get gender;
  @JsonKey(name: 'dob')
  String get dob;
  @JsonKey(name: 'nationalityCode')
  String get nationalityCode;
  @JsonKey(name: 'nationality')
  String get nationality;
  @JsonKey(name: 'address')
  Address? get address;
  @JsonKey(name: 'contact')
  Contact? get contact;
  @JsonKey(name: 'placeOfBirth')
  String get placeOfBirth;
  @JsonKey(name: 'region')
  String get region;
  @JsonKey(name: 'nameArabic')
  String get nameArabic;
  @JsonKey(name: 'professionCode')
  String get professionCode;
  @JsonKey(name: 'professionDesc')
  String get professionDesc;
  @JsonKey(name: 'employerName')
  String get employerName;
  @JsonKey(name: 'designationCode')
  String get designationCode;
  @JsonKey(name: 'visaType')
  String get visaType;
  @JsonKey(name: 'ispep')
  bool get ispep;
  @JsonKey(name: 'salary')
  String get salary;
  @JsonKey(name: 'status')
  String get status;
  @JsonKey(name: 'idDetailsData')
  IdDetailsData? get idDetailsData;

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PersonalInfoCopyWith<PersonalInfo> get copyWith =>
      _$PersonalInfoCopyWithImpl<PersonalInfo>(
          this as PersonalInfo, _$identity);

  /// Serializes this PersonalInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PersonalInfo &&
            (identical(other.name1, name1) || other.name1 == name1) &&
            (identical(other.name2, name2) || other.name2 == name2) &&
            (identical(other.name3, name3) || other.name3 == name3) &&
            (identical(other.name4, name4) || other.name4 == name4) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.nationalityCode, nationalityCode) ||
                other.nationalityCode == nationalityCode) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.nameArabic, nameArabic) ||
                other.nameArabic == nameArabic) &&
            (identical(other.professionCode, professionCode) ||
                other.professionCode == professionCode) &&
            (identical(other.professionDesc, professionDesc) ||
                other.professionDesc == professionDesc) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            (identical(other.designationCode, designationCode) ||
                other.designationCode == designationCode) &&
            (identical(other.visaType, visaType) ||
                other.visaType == visaType) &&
            (identical(other.ispep, ispep) || other.ispep == ispep) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.idDetailsData, idDetailsData) ||
                other.idDetailsData == idDetailsData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name1,
        name2,
        name3,
        name4,
        gender,
        dob,
        nationalityCode,
        nationality,
        address,
        contact,
        placeOfBirth,
        region,
        nameArabic,
        professionCode,
        professionDesc,
        employerName,
        designationCode,
        visaType,
        ispep,
        salary,
        status,
        idDetailsData
      ]);

  @override
  String toString() {
    return 'PersonalInfo(name1: $name1, name2: $name2, name3: $name3, name4: $name4, gender: $gender, dob: $dob, nationalityCode: $nationalityCode, nationality: $nationality, address: $address, contact: $contact, placeOfBirth: $placeOfBirth, region: $region, nameArabic: $nameArabic, professionCode: $professionCode, professionDesc: $professionDesc, employerName: $employerName, designationCode: $designationCode, visaType: $visaType, ispep: $ispep, salary: $salary, status: $status, idDetailsData: $idDetailsData)';
  }
}

/// @nodoc
abstract mixin class $PersonalInfoCopyWith<$Res> {
  factory $PersonalInfoCopyWith(
          PersonalInfo value, $Res Function(PersonalInfo) _then) =
      _$PersonalInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'name1') String name1,
      @JsonKey(name: 'name2') String name2,
      @JsonKey(name: 'name3') String name3,
      @JsonKey(name: 'name4') String name4,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'dob') String dob,
      @JsonKey(name: 'nationalityCode') String nationalityCode,
      @JsonKey(name: 'nationality') String nationality,
      @JsonKey(name: 'address') Address? address,
      @JsonKey(name: 'contact') Contact? contact,
      @JsonKey(name: 'placeOfBirth') String placeOfBirth,
      @JsonKey(name: 'region') String region,
      @JsonKey(name: 'nameArabic') String nameArabic,
      @JsonKey(name: 'professionCode') String professionCode,
      @JsonKey(name: 'professionDesc') String professionDesc,
      @JsonKey(name: 'employerName') String employerName,
      @JsonKey(name: 'designationCode') String designationCode,
      @JsonKey(name: 'visaType') String visaType,
      @JsonKey(name: 'ispep') bool ispep,
      @JsonKey(name: 'salary') String salary,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'idDetailsData') IdDetailsData? idDetailsData});

  $AddressCopyWith<$Res>? get address;
  $ContactCopyWith<$Res>? get contact;
  $IdDetailsDataCopyWith<$Res>? get idDetailsData;
}

/// @nodoc
class _$PersonalInfoCopyWithImpl<$Res> implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._self, this._then);

  final PersonalInfo _self;
  final $Res Function(PersonalInfo) _then;

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name1 = null,
    Object? name2 = null,
    Object? name3 = null,
    Object? name4 = null,
    Object? gender = null,
    Object? dob = null,
    Object? nationalityCode = null,
    Object? nationality = null,
    Object? address = freezed,
    Object? contact = freezed,
    Object? placeOfBirth = null,
    Object? region = null,
    Object? nameArabic = null,
    Object? professionCode = null,
    Object? professionDesc = null,
    Object? employerName = null,
    Object? designationCode = null,
    Object? visaType = null,
    Object? ispep = null,
    Object? salary = null,
    Object? status = null,
    Object? idDetailsData = freezed,
  }) {
    return _then(_self.copyWith(
      name1: null == name1
          ? _self.name1
          : name1 // ignore: cast_nullable_to_non_nullable
              as String,
      name2: null == name2
          ? _self.name2
          : name2 // ignore: cast_nullable_to_non_nullable
              as String,
      name3: null == name3
          ? _self.name3
          : name3 // ignore: cast_nullable_to_non_nullable
              as String,
      name4: null == name4
          ? _self.name4
          : name4 // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      nationalityCode: null == nationalityCode
          ? _self.nationalityCode
          : nationalityCode // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      contact: freezed == contact
          ? _self.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      placeOfBirth: null == placeOfBirth
          ? _self.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      nameArabic: null == nameArabic
          ? _self.nameArabic
          : nameArabic // ignore: cast_nullable_to_non_nullable
              as String,
      professionCode: null == professionCode
          ? _self.professionCode
          : professionCode // ignore: cast_nullable_to_non_nullable
              as String,
      professionDesc: null == professionDesc
          ? _self.professionDesc
          : professionDesc // ignore: cast_nullable_to_non_nullable
              as String,
      employerName: null == employerName
          ? _self.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String,
      designationCode: null == designationCode
          ? _self.designationCode
          : designationCode // ignore: cast_nullable_to_non_nullable
              as String,
      visaType: null == visaType
          ? _self.visaType
          : visaType // ignore: cast_nullable_to_non_nullable
              as String,
      ispep: null == ispep
          ? _self.ispep
          : ispep // ignore: cast_nullable_to_non_nullable
              as bool,
      salary: null == salary
          ? _self.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      idDetailsData: freezed == idDetailsData
          ? _self.idDetailsData
          : idDetailsData // ignore: cast_nullable_to_non_nullable
              as IdDetailsData?,
    ));
  }

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_self.address!, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get contact {
    if (_self.contact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_self.contact!, (value) {
      return _then(_self.copyWith(contact: value));
    });
  }

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdDetailsDataCopyWith<$Res>? get idDetailsData {
    if (_self.idDetailsData == null) {
      return null;
    }

    return $IdDetailsDataCopyWith<$Res>(_self.idDetailsData!, (value) {
      return _then(_self.copyWith(idDetailsData: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PersonalInfo].
extension PersonalInfoPatterns on PersonalInfo {
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
    TResult Function(_PersonalInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonalInfo() when $default != null:
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
    TResult Function(_PersonalInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonalInfo():
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
    TResult? Function(_PersonalInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonalInfo() when $default != null:
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
            @JsonKey(name: 'name1') String name1,
            @JsonKey(name: 'name2') String name2,
            @JsonKey(name: 'name3') String name3,
            @JsonKey(name: 'name4') String name4,
            @JsonKey(name: 'gender') String gender,
            @JsonKey(name: 'dob') String dob,
            @JsonKey(name: 'nationalityCode') String nationalityCode,
            @JsonKey(name: 'nationality') String nationality,
            @JsonKey(name: 'address') Address? address,
            @JsonKey(name: 'contact') Contact? contact,
            @JsonKey(name: 'placeOfBirth') String placeOfBirth,
            @JsonKey(name: 'region') String region,
            @JsonKey(name: 'nameArabic') String nameArabic,
            @JsonKey(name: 'professionCode') String professionCode,
            @JsonKey(name: 'professionDesc') String professionDesc,
            @JsonKey(name: 'employerName') String employerName,
            @JsonKey(name: 'designationCode') String designationCode,
            @JsonKey(name: 'visaType') String visaType,
            @JsonKey(name: 'ispep') bool ispep,
            @JsonKey(name: 'salary') String salary,
            @JsonKey(name: 'status') String status,
            @JsonKey(name: 'idDetailsData') IdDetailsData? idDetailsData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonalInfo() when $default != null:
        return $default(
            _that.name1,
            _that.name2,
            _that.name3,
            _that.name4,
            _that.gender,
            _that.dob,
            _that.nationalityCode,
            _that.nationality,
            _that.address,
            _that.contact,
            _that.placeOfBirth,
            _that.region,
            _that.nameArabic,
            _that.professionCode,
            _that.professionDesc,
            _that.employerName,
            _that.designationCode,
            _that.visaType,
            _that.ispep,
            _that.salary,
            _that.status,
            _that.idDetailsData);
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
            @JsonKey(name: 'name1') String name1,
            @JsonKey(name: 'name2') String name2,
            @JsonKey(name: 'name3') String name3,
            @JsonKey(name: 'name4') String name4,
            @JsonKey(name: 'gender') String gender,
            @JsonKey(name: 'dob') String dob,
            @JsonKey(name: 'nationalityCode') String nationalityCode,
            @JsonKey(name: 'nationality') String nationality,
            @JsonKey(name: 'address') Address? address,
            @JsonKey(name: 'contact') Contact? contact,
            @JsonKey(name: 'placeOfBirth') String placeOfBirth,
            @JsonKey(name: 'region') String region,
            @JsonKey(name: 'nameArabic') String nameArabic,
            @JsonKey(name: 'professionCode') String professionCode,
            @JsonKey(name: 'professionDesc') String professionDesc,
            @JsonKey(name: 'employerName') String employerName,
            @JsonKey(name: 'designationCode') String designationCode,
            @JsonKey(name: 'visaType') String visaType,
            @JsonKey(name: 'ispep') bool ispep,
            @JsonKey(name: 'salary') String salary,
            @JsonKey(name: 'status') String status,
            @JsonKey(name: 'idDetailsData') IdDetailsData? idDetailsData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonalInfo():
        return $default(
            _that.name1,
            _that.name2,
            _that.name3,
            _that.name4,
            _that.gender,
            _that.dob,
            _that.nationalityCode,
            _that.nationality,
            _that.address,
            _that.contact,
            _that.placeOfBirth,
            _that.region,
            _that.nameArabic,
            _that.professionCode,
            _that.professionDesc,
            _that.employerName,
            _that.designationCode,
            _that.visaType,
            _that.ispep,
            _that.salary,
            _that.status,
            _that.idDetailsData);
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
            @JsonKey(name: 'name1') String name1,
            @JsonKey(name: 'name2') String name2,
            @JsonKey(name: 'name3') String name3,
            @JsonKey(name: 'name4') String name4,
            @JsonKey(name: 'gender') String gender,
            @JsonKey(name: 'dob') String dob,
            @JsonKey(name: 'nationalityCode') String nationalityCode,
            @JsonKey(name: 'nationality') String nationality,
            @JsonKey(name: 'address') Address? address,
            @JsonKey(name: 'contact') Contact? contact,
            @JsonKey(name: 'placeOfBirth') String placeOfBirth,
            @JsonKey(name: 'region') String region,
            @JsonKey(name: 'nameArabic') String nameArabic,
            @JsonKey(name: 'professionCode') String professionCode,
            @JsonKey(name: 'professionDesc') String professionDesc,
            @JsonKey(name: 'employerName') String employerName,
            @JsonKey(name: 'designationCode') String designationCode,
            @JsonKey(name: 'visaType') String visaType,
            @JsonKey(name: 'ispep') bool ispep,
            @JsonKey(name: 'salary') String salary,
            @JsonKey(name: 'status') String status,
            @JsonKey(name: 'idDetailsData') IdDetailsData? idDetailsData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonalInfo() when $default != null:
        return $default(
            _that.name1,
            _that.name2,
            _that.name3,
            _that.name4,
            _that.gender,
            _that.dob,
            _that.nationalityCode,
            _that.nationality,
            _that.address,
            _that.contact,
            _that.placeOfBirth,
            _that.region,
            _that.nameArabic,
            _that.professionCode,
            _that.professionDesc,
            _that.employerName,
            _that.designationCode,
            _that.visaType,
            _that.ispep,
            _that.salary,
            _that.status,
            _that.idDetailsData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PersonalInfo implements PersonalInfo {
  const _PersonalInfo(
      {@JsonKey(name: 'name1') this.name1 = '',
      @JsonKey(name: 'name2') this.name2 = '',
      @JsonKey(name: 'name3') this.name3 = '',
      @JsonKey(name: 'name4') this.name4 = '',
      @JsonKey(name: 'gender') this.gender = '',
      @JsonKey(name: 'dob') this.dob = '',
      @JsonKey(name: 'nationalityCode') this.nationalityCode = '',
      @JsonKey(name: 'nationality') this.nationality = '',
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'contact') this.contact,
      @JsonKey(name: 'placeOfBirth') this.placeOfBirth = '',
      @JsonKey(name: 'region') this.region = '',
      @JsonKey(name: 'nameArabic') this.nameArabic = '',
      @JsonKey(name: 'professionCode') this.professionCode = '',
      @JsonKey(name: 'professionDesc') this.professionDesc = '',
      @JsonKey(name: 'employerName') this.employerName = '',
      @JsonKey(name: 'designationCode') this.designationCode = '',
      @JsonKey(name: 'visaType') this.visaType = '',
      @JsonKey(name: 'ispep') this.ispep = false,
      @JsonKey(name: 'salary') this.salary = '',
      @JsonKey(name: 'status') this.status = '',
      @JsonKey(name: 'idDetailsData') this.idDetailsData});
  factory _PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

  @override
  @JsonKey(name: 'name1')
  final String name1;
  @override
  @JsonKey(name: 'name2')
  final String name2;
  @override
  @JsonKey(name: 'name3')
  final String name3;
  @override
  @JsonKey(name: 'name4')
  final String name4;
  @override
  @JsonKey(name: 'gender')
  final String gender;
  @override
  @JsonKey(name: 'dob')
  final String dob;
  @override
  @JsonKey(name: 'nationalityCode')
  final String nationalityCode;
  @override
  @JsonKey(name: 'nationality')
  final String nationality;
  @override
  @JsonKey(name: 'address')
  final Address? address;
  @override
  @JsonKey(name: 'contact')
  final Contact? contact;
  @override
  @JsonKey(name: 'placeOfBirth')
  final String placeOfBirth;
  @override
  @JsonKey(name: 'region')
  final String region;
  @override
  @JsonKey(name: 'nameArabic')
  final String nameArabic;
  @override
  @JsonKey(name: 'professionCode')
  final String professionCode;
  @override
  @JsonKey(name: 'professionDesc')
  final String professionDesc;
  @override
  @JsonKey(name: 'employerName')
  final String employerName;
  @override
  @JsonKey(name: 'designationCode')
  final String designationCode;
  @override
  @JsonKey(name: 'visaType')
  final String visaType;
  @override
  @JsonKey(name: 'ispep')
  final bool ispep;
  @override
  @JsonKey(name: 'salary')
  final String salary;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'idDetailsData')
  final IdDetailsData? idDetailsData;

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PersonalInfoCopyWith<_PersonalInfo> get copyWith =>
      __$PersonalInfoCopyWithImpl<_PersonalInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PersonalInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PersonalInfo &&
            (identical(other.name1, name1) || other.name1 == name1) &&
            (identical(other.name2, name2) || other.name2 == name2) &&
            (identical(other.name3, name3) || other.name3 == name3) &&
            (identical(other.name4, name4) || other.name4 == name4) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.nationalityCode, nationalityCode) ||
                other.nationalityCode == nationalityCode) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.nameArabic, nameArabic) ||
                other.nameArabic == nameArabic) &&
            (identical(other.professionCode, professionCode) ||
                other.professionCode == professionCode) &&
            (identical(other.professionDesc, professionDesc) ||
                other.professionDesc == professionDesc) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            (identical(other.designationCode, designationCode) ||
                other.designationCode == designationCode) &&
            (identical(other.visaType, visaType) ||
                other.visaType == visaType) &&
            (identical(other.ispep, ispep) || other.ispep == ispep) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.idDetailsData, idDetailsData) ||
                other.idDetailsData == idDetailsData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name1,
        name2,
        name3,
        name4,
        gender,
        dob,
        nationalityCode,
        nationality,
        address,
        contact,
        placeOfBirth,
        region,
        nameArabic,
        professionCode,
        professionDesc,
        employerName,
        designationCode,
        visaType,
        ispep,
        salary,
        status,
        idDetailsData
      ]);

  @override
  String toString() {
    return 'PersonalInfo(name1: $name1, name2: $name2, name3: $name3, name4: $name4, gender: $gender, dob: $dob, nationalityCode: $nationalityCode, nationality: $nationality, address: $address, contact: $contact, placeOfBirth: $placeOfBirth, region: $region, nameArabic: $nameArabic, professionCode: $professionCode, professionDesc: $professionDesc, employerName: $employerName, designationCode: $designationCode, visaType: $visaType, ispep: $ispep, salary: $salary, status: $status, idDetailsData: $idDetailsData)';
  }
}

/// @nodoc
abstract mixin class _$PersonalInfoCopyWith<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  factory _$PersonalInfoCopyWith(
          _PersonalInfo value, $Res Function(_PersonalInfo) _then) =
      __$PersonalInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name1') String name1,
      @JsonKey(name: 'name2') String name2,
      @JsonKey(name: 'name3') String name3,
      @JsonKey(name: 'name4') String name4,
      @JsonKey(name: 'gender') String gender,
      @JsonKey(name: 'dob') String dob,
      @JsonKey(name: 'nationalityCode') String nationalityCode,
      @JsonKey(name: 'nationality') String nationality,
      @JsonKey(name: 'address') Address? address,
      @JsonKey(name: 'contact') Contact? contact,
      @JsonKey(name: 'placeOfBirth') String placeOfBirth,
      @JsonKey(name: 'region') String region,
      @JsonKey(name: 'nameArabic') String nameArabic,
      @JsonKey(name: 'professionCode') String professionCode,
      @JsonKey(name: 'professionDesc') String professionDesc,
      @JsonKey(name: 'employerName') String employerName,
      @JsonKey(name: 'designationCode') String designationCode,
      @JsonKey(name: 'visaType') String visaType,
      @JsonKey(name: 'ispep') bool ispep,
      @JsonKey(name: 'salary') String salary,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'idDetailsData') IdDetailsData? idDetailsData});

  @override
  $AddressCopyWith<$Res>? get address;
  @override
  $ContactCopyWith<$Res>? get contact;
  @override
  $IdDetailsDataCopyWith<$Res>? get idDetailsData;
}

/// @nodoc
class __$PersonalInfoCopyWithImpl<$Res>
    implements _$PersonalInfoCopyWith<$Res> {
  __$PersonalInfoCopyWithImpl(this._self, this._then);

  final _PersonalInfo _self;
  final $Res Function(_PersonalInfo) _then;

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name1 = null,
    Object? name2 = null,
    Object? name3 = null,
    Object? name4 = null,
    Object? gender = null,
    Object? dob = null,
    Object? nationalityCode = null,
    Object? nationality = null,
    Object? address = freezed,
    Object? contact = freezed,
    Object? placeOfBirth = null,
    Object? region = null,
    Object? nameArabic = null,
    Object? professionCode = null,
    Object? professionDesc = null,
    Object? employerName = null,
    Object? designationCode = null,
    Object? visaType = null,
    Object? ispep = null,
    Object? salary = null,
    Object? status = null,
    Object? idDetailsData = freezed,
  }) {
    return _then(_PersonalInfo(
      name1: null == name1
          ? _self.name1
          : name1 // ignore: cast_nullable_to_non_nullable
              as String,
      name2: null == name2
          ? _self.name2
          : name2 // ignore: cast_nullable_to_non_nullable
              as String,
      name3: null == name3
          ? _self.name3
          : name3 // ignore: cast_nullable_to_non_nullable
              as String,
      name4: null == name4
          ? _self.name4
          : name4 // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      nationalityCode: null == nationalityCode
          ? _self.nationalityCode
          : nationalityCode // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _self.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      contact: freezed == contact
          ? _self.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      placeOfBirth: null == placeOfBirth
          ? _self.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      nameArabic: null == nameArabic
          ? _self.nameArabic
          : nameArabic // ignore: cast_nullable_to_non_nullable
              as String,
      professionCode: null == professionCode
          ? _self.professionCode
          : professionCode // ignore: cast_nullable_to_non_nullable
              as String,
      professionDesc: null == professionDesc
          ? _self.professionDesc
          : professionDesc // ignore: cast_nullable_to_non_nullable
              as String,
      employerName: null == employerName
          ? _self.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String,
      designationCode: null == designationCode
          ? _self.designationCode
          : designationCode // ignore: cast_nullable_to_non_nullable
              as String,
      visaType: null == visaType
          ? _self.visaType
          : visaType // ignore: cast_nullable_to_non_nullable
              as String,
      ispep: null == ispep
          ? _self.ispep
          : ispep // ignore: cast_nullable_to_non_nullable
              as bool,
      salary: null == salary
          ? _self.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      idDetailsData: freezed == idDetailsData
          ? _self.idDetailsData
          : idDetailsData // ignore: cast_nullable_to_non_nullable
              as IdDetailsData?,
    ));
  }

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_self.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_self.address!, (value) {
      return _then(_self.copyWith(address: value));
    });
  }

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get contact {
    if (_self.contact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_self.contact!, (value) {
      return _then(_self.copyWith(contact: value));
    });
  }

  /// Create a copy of PersonalInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdDetailsDataCopyWith<$Res>? get idDetailsData {
    if (_self.idDetailsData == null) {
      return null;
    }

    return $IdDetailsDataCopyWith<$Res>(_self.idDetailsData!, (value) {
      return _then(_self.copyWith(idDetailsData: value));
    });
  }
}

/// @nodoc
mixin _$IdDetailsData {
  @JsonKey(name: 'idTypeCode')
  String get idTypeCode;
  @JsonKey(name: 'idType')
  String get idType;
  @JsonKey(name: 'idNo')
  String get idNo;
  @JsonKey(name: 'issueDate')
  String get issueDate;
  @JsonKey(name: 'expDate')
  String get expDate;
  @JsonKey(name: 'issuePlace')
  String get issuePlace;
  @JsonKey(name: 'imageFront')
  String get imageFront;
  @JsonKey(name: 'imageBack')
  String get imageBack;
  @JsonKey(name: 'issueCountryCode')
  String get issueCountryCode;
  @JsonKey(name: 'issueState')
  String get issueState;
  @JsonKey(name: 'idCollected')
  String get idCollected;
  @JsonKey(name: 'eidCardNo')
  String get eidCardNo;
  @JsonKey(name: 'isEidReadFlag')
  String get isEidReadFlag;

  /// Create a copy of IdDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IdDetailsDataCopyWith<IdDetailsData> get copyWith =>
      _$IdDetailsDataCopyWithImpl<IdDetailsData>(
          this as IdDetailsData, _$identity);

  /// Serializes this IdDetailsData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IdDetailsData &&
            (identical(other.idTypeCode, idTypeCode) ||
                other.idTypeCode == idTypeCode) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.expDate, expDate) || other.expDate == expDate) &&
            (identical(other.issuePlace, issuePlace) ||
                other.issuePlace == issuePlace) &&
            (identical(other.imageFront, imageFront) ||
                other.imageFront == imageFront) &&
            (identical(other.imageBack, imageBack) ||
                other.imageBack == imageBack) &&
            (identical(other.issueCountryCode, issueCountryCode) ||
                other.issueCountryCode == issueCountryCode) &&
            (identical(other.issueState, issueState) ||
                other.issueState == issueState) &&
            (identical(other.idCollected, idCollected) ||
                other.idCollected == idCollected) &&
            (identical(other.eidCardNo, eidCardNo) ||
                other.eidCardNo == eidCardNo) &&
            (identical(other.isEidReadFlag, isEidReadFlag) ||
                other.isEidReadFlag == isEidReadFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idTypeCode,
      idType,
      idNo,
      issueDate,
      expDate,
      issuePlace,
      imageFront,
      imageBack,
      issueCountryCode,
      issueState,
      idCollected,
      eidCardNo,
      isEidReadFlag);

  @override
  String toString() {
    return 'IdDetailsData(idTypeCode: $idTypeCode, idType: $idType, idNo: $idNo, issueDate: $issueDate, expDate: $expDate, issuePlace: $issuePlace, imageFront: $imageFront, imageBack: $imageBack, issueCountryCode: $issueCountryCode, issueState: $issueState, idCollected: $idCollected, eidCardNo: $eidCardNo, isEidReadFlag: $isEidReadFlag)';
  }
}

/// @nodoc
abstract mixin class $IdDetailsDataCopyWith<$Res> {
  factory $IdDetailsDataCopyWith(
          IdDetailsData value, $Res Function(IdDetailsData) _then) =
      _$IdDetailsDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'idTypeCode') String idTypeCode,
      @JsonKey(name: 'idType') String idType,
      @JsonKey(name: 'idNo') String idNo,
      @JsonKey(name: 'issueDate') String issueDate,
      @JsonKey(name: 'expDate') String expDate,
      @JsonKey(name: 'issuePlace') String issuePlace,
      @JsonKey(name: 'imageFront') String imageFront,
      @JsonKey(name: 'imageBack') String imageBack,
      @JsonKey(name: 'issueCountryCode') String issueCountryCode,
      @JsonKey(name: 'issueState') String issueState,
      @JsonKey(name: 'idCollected') String idCollected,
      @JsonKey(name: 'eidCardNo') String eidCardNo,
      @JsonKey(name: 'isEidReadFlag') String isEidReadFlag});
}

/// @nodoc
class _$IdDetailsDataCopyWithImpl<$Res>
    implements $IdDetailsDataCopyWith<$Res> {
  _$IdDetailsDataCopyWithImpl(this._self, this._then);

  final IdDetailsData _self;
  final $Res Function(IdDetailsData) _then;

  /// Create a copy of IdDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idTypeCode = null,
    Object? idType = null,
    Object? idNo = null,
    Object? issueDate = null,
    Object? expDate = null,
    Object? issuePlace = null,
    Object? imageFront = null,
    Object? imageBack = null,
    Object? issueCountryCode = null,
    Object? issueState = null,
    Object? idCollected = null,
    Object? eidCardNo = null,
    Object? isEidReadFlag = null,
  }) {
    return _then(_self.copyWith(
      idTypeCode: null == idTypeCode
          ? _self.idTypeCode
          : idTypeCode // ignore: cast_nullable_to_non_nullable
              as String,
      idType: null == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String,
      idNo: null == idNo
          ? _self.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _self.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String,
      expDate: null == expDate
          ? _self.expDate
          : expDate // ignore: cast_nullable_to_non_nullable
              as String,
      issuePlace: null == issuePlace
          ? _self.issuePlace
          : issuePlace // ignore: cast_nullable_to_non_nullable
              as String,
      imageFront: null == imageFront
          ? _self.imageFront
          : imageFront // ignore: cast_nullable_to_non_nullable
              as String,
      imageBack: null == imageBack
          ? _self.imageBack
          : imageBack // ignore: cast_nullable_to_non_nullable
              as String,
      issueCountryCode: null == issueCountryCode
          ? _self.issueCountryCode
          : issueCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      issueState: null == issueState
          ? _self.issueState
          : issueState // ignore: cast_nullable_to_non_nullable
              as String,
      idCollected: null == idCollected
          ? _self.idCollected
          : idCollected // ignore: cast_nullable_to_non_nullable
              as String,
      eidCardNo: null == eidCardNo
          ? _self.eidCardNo
          : eidCardNo // ignore: cast_nullable_to_non_nullable
              as String,
      isEidReadFlag: null == isEidReadFlag
          ? _self.isEidReadFlag
          : isEidReadFlag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [IdDetailsData].
extension IdDetailsDataPatterns on IdDetailsData {
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
    TResult Function(_IdDetailsData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IdDetailsData() when $default != null:
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
    TResult Function(_IdDetailsData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdDetailsData():
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
    TResult? Function(_IdDetailsData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdDetailsData() when $default != null:
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
            @JsonKey(name: 'idTypeCode') String idTypeCode,
            @JsonKey(name: 'idType') String idType,
            @JsonKey(name: 'idNo') String idNo,
            @JsonKey(name: 'issueDate') String issueDate,
            @JsonKey(name: 'expDate') String expDate,
            @JsonKey(name: 'issuePlace') String issuePlace,
            @JsonKey(name: 'imageFront') String imageFront,
            @JsonKey(name: 'imageBack') String imageBack,
            @JsonKey(name: 'issueCountryCode') String issueCountryCode,
            @JsonKey(name: 'issueState') String issueState,
            @JsonKey(name: 'idCollected') String idCollected,
            @JsonKey(name: 'eidCardNo') String eidCardNo,
            @JsonKey(name: 'isEidReadFlag') String isEidReadFlag)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IdDetailsData() when $default != null:
        return $default(
            _that.idTypeCode,
            _that.idType,
            _that.idNo,
            _that.issueDate,
            _that.expDate,
            _that.issuePlace,
            _that.imageFront,
            _that.imageBack,
            _that.issueCountryCode,
            _that.issueState,
            _that.idCollected,
            _that.eidCardNo,
            _that.isEidReadFlag);
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
            @JsonKey(name: 'idTypeCode') String idTypeCode,
            @JsonKey(name: 'idType') String idType,
            @JsonKey(name: 'idNo') String idNo,
            @JsonKey(name: 'issueDate') String issueDate,
            @JsonKey(name: 'expDate') String expDate,
            @JsonKey(name: 'issuePlace') String issuePlace,
            @JsonKey(name: 'imageFront') String imageFront,
            @JsonKey(name: 'imageBack') String imageBack,
            @JsonKey(name: 'issueCountryCode') String issueCountryCode,
            @JsonKey(name: 'issueState') String issueState,
            @JsonKey(name: 'idCollected') String idCollected,
            @JsonKey(name: 'eidCardNo') String eidCardNo,
            @JsonKey(name: 'isEidReadFlag') String isEidReadFlag)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdDetailsData():
        return $default(
            _that.idTypeCode,
            _that.idType,
            _that.idNo,
            _that.issueDate,
            _that.expDate,
            _that.issuePlace,
            _that.imageFront,
            _that.imageBack,
            _that.issueCountryCode,
            _that.issueState,
            _that.idCollected,
            _that.eidCardNo,
            _that.isEidReadFlag);
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
            @JsonKey(name: 'idTypeCode') String idTypeCode,
            @JsonKey(name: 'idType') String idType,
            @JsonKey(name: 'idNo') String idNo,
            @JsonKey(name: 'issueDate') String issueDate,
            @JsonKey(name: 'expDate') String expDate,
            @JsonKey(name: 'issuePlace') String issuePlace,
            @JsonKey(name: 'imageFront') String imageFront,
            @JsonKey(name: 'imageBack') String imageBack,
            @JsonKey(name: 'issueCountryCode') String issueCountryCode,
            @JsonKey(name: 'issueState') String issueState,
            @JsonKey(name: 'idCollected') String idCollected,
            @JsonKey(name: 'eidCardNo') String eidCardNo,
            @JsonKey(name: 'isEidReadFlag') String isEidReadFlag)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IdDetailsData() when $default != null:
        return $default(
            _that.idTypeCode,
            _that.idType,
            _that.idNo,
            _that.issueDate,
            _that.expDate,
            _that.issuePlace,
            _that.imageFront,
            _that.imageBack,
            _that.issueCountryCode,
            _that.issueState,
            _that.idCollected,
            _that.eidCardNo,
            _that.isEidReadFlag);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IdDetailsData implements IdDetailsData {
  const _IdDetailsData(
      {@JsonKey(name: 'idTypeCode') this.idTypeCode = '',
      @JsonKey(name: 'idType') this.idType = '',
      @JsonKey(name: 'idNo') this.idNo = '',
      @JsonKey(name: 'issueDate') this.issueDate = '',
      @JsonKey(name: 'expDate') this.expDate = '',
      @JsonKey(name: 'issuePlace') this.issuePlace = '',
      @JsonKey(name: 'imageFront') this.imageFront = '',
      @JsonKey(name: 'imageBack') this.imageBack = '',
      @JsonKey(name: 'issueCountryCode') this.issueCountryCode = '',
      @JsonKey(name: 'issueState') this.issueState = '',
      @JsonKey(name: 'idCollected') this.idCollected = '',
      @JsonKey(name: 'eidCardNo') this.eidCardNo = '',
      @JsonKey(name: 'isEidReadFlag') this.isEidReadFlag = ''});
  factory _IdDetailsData.fromJson(Map<String, dynamic> json) =>
      _$IdDetailsDataFromJson(json);

  @override
  @JsonKey(name: 'idTypeCode')
  final String idTypeCode;
  @override
  @JsonKey(name: 'idType')
  final String idType;
  @override
  @JsonKey(name: 'idNo')
  final String idNo;
  @override
  @JsonKey(name: 'issueDate')
  final String issueDate;
  @override
  @JsonKey(name: 'expDate')
  final String expDate;
  @override
  @JsonKey(name: 'issuePlace')
  final String issuePlace;
  @override
  @JsonKey(name: 'imageFront')
  final String imageFront;
  @override
  @JsonKey(name: 'imageBack')
  final String imageBack;
  @override
  @JsonKey(name: 'issueCountryCode')
  final String issueCountryCode;
  @override
  @JsonKey(name: 'issueState')
  final String issueState;
  @override
  @JsonKey(name: 'idCollected')
  final String idCollected;
  @override
  @JsonKey(name: 'eidCardNo')
  final String eidCardNo;
  @override
  @JsonKey(name: 'isEidReadFlag')
  final String isEidReadFlag;

  /// Create a copy of IdDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IdDetailsDataCopyWith<_IdDetailsData> get copyWith =>
      __$IdDetailsDataCopyWithImpl<_IdDetailsData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IdDetailsDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdDetailsData &&
            (identical(other.idTypeCode, idTypeCode) ||
                other.idTypeCode == idTypeCode) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.expDate, expDate) || other.expDate == expDate) &&
            (identical(other.issuePlace, issuePlace) ||
                other.issuePlace == issuePlace) &&
            (identical(other.imageFront, imageFront) ||
                other.imageFront == imageFront) &&
            (identical(other.imageBack, imageBack) ||
                other.imageBack == imageBack) &&
            (identical(other.issueCountryCode, issueCountryCode) ||
                other.issueCountryCode == issueCountryCode) &&
            (identical(other.issueState, issueState) ||
                other.issueState == issueState) &&
            (identical(other.idCollected, idCollected) ||
                other.idCollected == idCollected) &&
            (identical(other.eidCardNo, eidCardNo) ||
                other.eidCardNo == eidCardNo) &&
            (identical(other.isEidReadFlag, isEidReadFlag) ||
                other.isEidReadFlag == isEidReadFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idTypeCode,
      idType,
      idNo,
      issueDate,
      expDate,
      issuePlace,
      imageFront,
      imageBack,
      issueCountryCode,
      issueState,
      idCollected,
      eidCardNo,
      isEidReadFlag);

  @override
  String toString() {
    return 'IdDetailsData(idTypeCode: $idTypeCode, idType: $idType, idNo: $idNo, issueDate: $issueDate, expDate: $expDate, issuePlace: $issuePlace, imageFront: $imageFront, imageBack: $imageBack, issueCountryCode: $issueCountryCode, issueState: $issueState, idCollected: $idCollected, eidCardNo: $eidCardNo, isEidReadFlag: $isEidReadFlag)';
  }
}

/// @nodoc
abstract mixin class _$IdDetailsDataCopyWith<$Res>
    implements $IdDetailsDataCopyWith<$Res> {
  factory _$IdDetailsDataCopyWith(
          _IdDetailsData value, $Res Function(_IdDetailsData) _then) =
      __$IdDetailsDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'idTypeCode') String idTypeCode,
      @JsonKey(name: 'idType') String idType,
      @JsonKey(name: 'idNo') String idNo,
      @JsonKey(name: 'issueDate') String issueDate,
      @JsonKey(name: 'expDate') String expDate,
      @JsonKey(name: 'issuePlace') String issuePlace,
      @JsonKey(name: 'imageFront') String imageFront,
      @JsonKey(name: 'imageBack') String imageBack,
      @JsonKey(name: 'issueCountryCode') String issueCountryCode,
      @JsonKey(name: 'issueState') String issueState,
      @JsonKey(name: 'idCollected') String idCollected,
      @JsonKey(name: 'eidCardNo') String eidCardNo,
      @JsonKey(name: 'isEidReadFlag') String isEidReadFlag});
}

/// @nodoc
class __$IdDetailsDataCopyWithImpl<$Res>
    implements _$IdDetailsDataCopyWith<$Res> {
  __$IdDetailsDataCopyWithImpl(this._self, this._then);

  final _IdDetailsData _self;
  final $Res Function(_IdDetailsData) _then;

  /// Create a copy of IdDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? idTypeCode = null,
    Object? idType = null,
    Object? idNo = null,
    Object? issueDate = null,
    Object? expDate = null,
    Object? issuePlace = null,
    Object? imageFront = null,
    Object? imageBack = null,
    Object? issueCountryCode = null,
    Object? issueState = null,
    Object? idCollected = null,
    Object? eidCardNo = null,
    Object? isEidReadFlag = null,
  }) {
    return _then(_IdDetailsData(
      idTypeCode: null == idTypeCode
          ? _self.idTypeCode
          : idTypeCode // ignore: cast_nullable_to_non_nullable
              as String,
      idType: null == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String,
      idNo: null == idNo
          ? _self.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: null == issueDate
          ? _self.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String,
      expDate: null == expDate
          ? _self.expDate
          : expDate // ignore: cast_nullable_to_non_nullable
              as String,
      issuePlace: null == issuePlace
          ? _self.issuePlace
          : issuePlace // ignore: cast_nullable_to_non_nullable
              as String,
      imageFront: null == imageFront
          ? _self.imageFront
          : imageFront // ignore: cast_nullable_to_non_nullable
              as String,
      imageBack: null == imageBack
          ? _self.imageBack
          : imageBack // ignore: cast_nullable_to_non_nullable
              as String,
      issueCountryCode: null == issueCountryCode
          ? _self.issueCountryCode
          : issueCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      issueState: null == issueState
          ? _self.issueState
          : issueState // ignore: cast_nullable_to_non_nullable
              as String,
      idCollected: null == idCollected
          ? _self.idCollected
          : idCollected // ignore: cast_nullable_to_non_nullable
              as String,
      eidCardNo: null == eidCardNo
          ? _self.eidCardNo
          : eidCardNo // ignore: cast_nullable_to_non_nullable
              as String,
      isEidReadFlag: null == isEidReadFlag
          ? _self.isEidReadFlag
          : isEidReadFlag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Contact {
  @JsonKey(name: 'dialCode')
  String get dialCode;
  @JsonKey(name: 'phone1')
  String get phone1;
  @JsonKey(name: 'phone2')
  String get phone2;
  @JsonKey(name: 'phone3')
  String get phone3;
  @JsonKey(name: 'mobile1')
  String get mobile1;
  @JsonKey(name: 'mobile2')
  String get mobile2;
  @JsonKey(name: 'mobile3')
  String get mobile3;
  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'fax')
  String get fax;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContactCopyWith<Contact> get copyWith =>
      _$ContactCopyWithImpl<Contact>(this as Contact, _$identity);

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Contact &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.phone1, phone1) || other.phone1 == phone1) &&
            (identical(other.phone2, phone2) || other.phone2 == phone2) &&
            (identical(other.phone3, phone3) || other.phone3 == phone3) &&
            (identical(other.mobile1, mobile1) || other.mobile1 == mobile1) &&
            (identical(other.mobile2, mobile2) || other.mobile2 == mobile2) &&
            (identical(other.mobile3, mobile3) || other.mobile3 == mobile3) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fax, fax) || other.fax == fax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dialCode, phone1, phone2, phone3,
      mobile1, mobile2, mobile3, email, fax);

  @override
  String toString() {
    return 'Contact(dialCode: $dialCode, phone1: $phone1, phone2: $phone2, phone3: $phone3, mobile1: $mobile1, mobile2: $mobile2, mobile3: $mobile3, email: $email, fax: $fax)';
  }
}

/// @nodoc
abstract mixin class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) _then) =
      _$ContactCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'dialCode') String dialCode,
      @JsonKey(name: 'phone1') String phone1,
      @JsonKey(name: 'phone2') String phone2,
      @JsonKey(name: 'phone3') String phone3,
      @JsonKey(name: 'mobile1') String mobile1,
      @JsonKey(name: 'mobile2') String mobile2,
      @JsonKey(name: 'mobile3') String mobile3,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'fax') String fax});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res> implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._self, this._then);

  final Contact _self;
  final $Res Function(Contact) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dialCode = null,
    Object? phone1 = null,
    Object? phone2 = null,
    Object? phone3 = null,
    Object? mobile1 = null,
    Object? mobile2 = null,
    Object? mobile3 = null,
    Object? email = null,
    Object? fax = null,
  }) {
    return _then(_self.copyWith(
      dialCode: null == dialCode
          ? _self.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone1: null == phone1
          ? _self.phone1
          : phone1 // ignore: cast_nullable_to_non_nullable
              as String,
      phone2: null == phone2
          ? _self.phone2
          : phone2 // ignore: cast_nullable_to_non_nullable
              as String,
      phone3: null == phone3
          ? _self.phone3
          : phone3 // ignore: cast_nullable_to_non_nullable
              as String,
      mobile1: null == mobile1
          ? _self.mobile1
          : mobile1 // ignore: cast_nullable_to_non_nullable
              as String,
      mobile2: null == mobile2
          ? _self.mobile2
          : mobile2 // ignore: cast_nullable_to_non_nullable
              as String,
      mobile3: null == mobile3
          ? _self.mobile3
          : mobile3 // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fax: null == fax
          ? _self.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Contact].
extension ContactPatterns on Contact {
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
    TResult Function(_Contact value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Contact() when $default != null:
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
    TResult Function(_Contact value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Contact():
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
    TResult? Function(_Contact value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Contact() when $default != null:
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
            @JsonKey(name: 'dialCode') String dialCode,
            @JsonKey(name: 'phone1') String phone1,
            @JsonKey(name: 'phone2') String phone2,
            @JsonKey(name: 'phone3') String phone3,
            @JsonKey(name: 'mobile1') String mobile1,
            @JsonKey(name: 'mobile2') String mobile2,
            @JsonKey(name: 'mobile3') String mobile3,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'fax') String fax)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Contact() when $default != null:
        return $default(
            _that.dialCode,
            _that.phone1,
            _that.phone2,
            _that.phone3,
            _that.mobile1,
            _that.mobile2,
            _that.mobile3,
            _that.email,
            _that.fax);
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
            @JsonKey(name: 'dialCode') String dialCode,
            @JsonKey(name: 'phone1') String phone1,
            @JsonKey(name: 'phone2') String phone2,
            @JsonKey(name: 'phone3') String phone3,
            @JsonKey(name: 'mobile1') String mobile1,
            @JsonKey(name: 'mobile2') String mobile2,
            @JsonKey(name: 'mobile3') String mobile3,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'fax') String fax)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Contact():
        return $default(
            _that.dialCode,
            _that.phone1,
            _that.phone2,
            _that.phone3,
            _that.mobile1,
            _that.mobile2,
            _that.mobile3,
            _that.email,
            _that.fax);
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
            @JsonKey(name: 'dialCode') String dialCode,
            @JsonKey(name: 'phone1') String phone1,
            @JsonKey(name: 'phone2') String phone2,
            @JsonKey(name: 'phone3') String phone3,
            @JsonKey(name: 'mobile1') String mobile1,
            @JsonKey(name: 'mobile2') String mobile2,
            @JsonKey(name: 'mobile3') String mobile3,
            @JsonKey(name: 'email') String email,
            @JsonKey(name: 'fax') String fax)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Contact() when $default != null:
        return $default(
            _that.dialCode,
            _that.phone1,
            _that.phone2,
            _that.phone3,
            _that.mobile1,
            _that.mobile2,
            _that.mobile3,
            _that.email,
            _that.fax);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Contact implements Contact {
  const _Contact(
      {@JsonKey(name: 'dialCode') this.dialCode = '',
      @JsonKey(name: 'phone1') this.phone1 = '',
      @JsonKey(name: 'phone2') this.phone2 = '',
      @JsonKey(name: 'phone3') this.phone3 = '',
      @JsonKey(name: 'mobile1') this.mobile1 = '',
      @JsonKey(name: 'mobile2') this.mobile2 = '',
      @JsonKey(name: 'mobile3') this.mobile3 = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'fax') this.fax = ''});
  factory _Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  @override
  @JsonKey(name: 'dialCode')
  final String dialCode;
  @override
  @JsonKey(name: 'phone1')
  final String phone1;
  @override
  @JsonKey(name: 'phone2')
  final String phone2;
  @override
  @JsonKey(name: 'phone3')
  final String phone3;
  @override
  @JsonKey(name: 'mobile1')
  final String mobile1;
  @override
  @JsonKey(name: 'mobile2')
  final String mobile2;
  @override
  @JsonKey(name: 'mobile3')
  final String mobile3;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'fax')
  final String fax;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContactCopyWith<_Contact> get copyWith =>
      __$ContactCopyWithImpl<_Contact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContactToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Contact &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.phone1, phone1) || other.phone1 == phone1) &&
            (identical(other.phone2, phone2) || other.phone2 == phone2) &&
            (identical(other.phone3, phone3) || other.phone3 == phone3) &&
            (identical(other.mobile1, mobile1) || other.mobile1 == mobile1) &&
            (identical(other.mobile2, mobile2) || other.mobile2 == mobile2) &&
            (identical(other.mobile3, mobile3) || other.mobile3 == mobile3) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fax, fax) || other.fax == fax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dialCode, phone1, phone2, phone3,
      mobile1, mobile2, mobile3, email, fax);

  @override
  String toString() {
    return 'Contact(dialCode: $dialCode, phone1: $phone1, phone2: $phone2, phone3: $phone3, mobile1: $mobile1, mobile2: $mobile2, mobile3: $mobile3, email: $email, fax: $fax)';
  }
}

/// @nodoc
abstract mixin class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) _then) =
      __$ContactCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dialCode') String dialCode,
      @JsonKey(name: 'phone1') String phone1,
      @JsonKey(name: 'phone2') String phone2,
      @JsonKey(name: 'phone3') String phone3,
      @JsonKey(name: 'mobile1') String mobile1,
      @JsonKey(name: 'mobile2') String mobile2,
      @JsonKey(name: 'mobile3') String mobile3,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'fax') String fax});
}

/// @nodoc
class __$ContactCopyWithImpl<$Res> implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(this._self, this._then);

  final _Contact _self;
  final $Res Function(_Contact) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dialCode = null,
    Object? phone1 = null,
    Object? phone2 = null,
    Object? phone3 = null,
    Object? mobile1 = null,
    Object? mobile2 = null,
    Object? mobile3 = null,
    Object? email = null,
    Object? fax = null,
  }) {
    return _then(_Contact(
      dialCode: null == dialCode
          ? _self.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone1: null == phone1
          ? _self.phone1
          : phone1 // ignore: cast_nullable_to_non_nullable
              as String,
      phone2: null == phone2
          ? _self.phone2
          : phone2 // ignore: cast_nullable_to_non_nullable
              as String,
      phone3: null == phone3
          ? _self.phone3
          : phone3 // ignore: cast_nullable_to_non_nullable
              as String,
      mobile1: null == mobile1
          ? _self.mobile1
          : mobile1 // ignore: cast_nullable_to_non_nullable
              as String,
      mobile2: null == mobile2
          ? _self.mobile2
          : mobile2 // ignore: cast_nullable_to_non_nullable
              as String,
      mobile3: null == mobile3
          ? _self.mobile3
          : mobile3 // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      fax: null == fax
          ? _self.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Address {
  @JsonKey(name: 'address1')
  String get address1;
  @JsonKey(name: 'address2')
  String get address2;
  @JsonKey(name: 'address3')
  String get address3;
  @JsonKey(name: 'city')
  String get city;
  @JsonKey(name: 'district')
  String get district;
  @JsonKey(name: 'state')
  String get state;
  @JsonKey(name: 'stateCode')
  String get stateCode;
  @JsonKey(name: 'airportCode')
  String get airportCode;
  @JsonKey(name: 'country')
  String get country;
  @JsonKey(name: 'countryCode')
  String get countryCode;
  @JsonKey(name: 'zipcode')
  String get zipcode;
  @JsonKey(name: 'areaCode')
  String get areaCode;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressCopyWith<Address> get copyWith =>
      _$AddressCopyWithImpl<Address>(this as Address, _$identity);

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Address &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.address3, address3) ||
                other.address3 == address3) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.airportCode, airportCode) ||
                other.airportCode == airportCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.areaCode, areaCode) ||
                other.areaCode == areaCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address1,
      address2,
      address3,
      city,
      district,
      state,
      stateCode,
      airportCode,
      country,
      countryCode,
      zipcode,
      areaCode);

  @override
  String toString() {
    return 'Address(address1: $address1, address2: $address2, address3: $address3, city: $city, district: $district, state: $state, stateCode: $stateCode, airportCode: $airportCode, country: $country, countryCode: $countryCode, zipcode: $zipcode, areaCode: $areaCode)';
  }
}

/// @nodoc
abstract mixin class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) _then) =
      _$AddressCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'address1') String address1,
      @JsonKey(name: 'address2') String address2,
      @JsonKey(name: 'address3') String address3,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'district') String district,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'stateCode') String stateCode,
      @JsonKey(name: 'airportCode') String airportCode,
      @JsonKey(name: 'country') String country,
      @JsonKey(name: 'countryCode') String countryCode,
      @JsonKey(name: 'zipcode') String zipcode,
      @JsonKey(name: 'areaCode') String areaCode});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._self, this._then);

  final Address _self;
  final $Res Function(Address) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address1 = null,
    Object? address2 = null,
    Object? address3 = null,
    Object? city = null,
    Object? district = null,
    Object? state = null,
    Object? stateCode = null,
    Object? airportCode = null,
    Object? country = null,
    Object? countryCode = null,
    Object? zipcode = null,
    Object? areaCode = null,
  }) {
    return _then(_self.copyWith(
      address1: null == address1
          ? _self.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _self.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      address3: null == address3
          ? _self.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      airportCode: null == airportCode
          ? _self.airportCode
          : airportCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _self.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      areaCode: null == areaCode
          ? _self.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [Address].
extension AddressPatterns on Address {
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
    TResult Function(_Address value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Address() when $default != null:
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
    TResult Function(_Address value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Address():
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
    TResult? Function(_Address value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Address() when $default != null:
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
            @JsonKey(name: 'address1') String address1,
            @JsonKey(name: 'address2') String address2,
            @JsonKey(name: 'address3') String address3,
            @JsonKey(name: 'city') String city,
            @JsonKey(name: 'district') String district,
            @JsonKey(name: 'state') String state,
            @JsonKey(name: 'stateCode') String stateCode,
            @JsonKey(name: 'airportCode') String airportCode,
            @JsonKey(name: 'country') String country,
            @JsonKey(name: 'countryCode') String countryCode,
            @JsonKey(name: 'zipcode') String zipcode,
            @JsonKey(name: 'areaCode') String areaCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Address() when $default != null:
        return $default(
            _that.address1,
            _that.address2,
            _that.address3,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.airportCode,
            _that.country,
            _that.countryCode,
            _that.zipcode,
            _that.areaCode);
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
            @JsonKey(name: 'address1') String address1,
            @JsonKey(name: 'address2') String address2,
            @JsonKey(name: 'address3') String address3,
            @JsonKey(name: 'city') String city,
            @JsonKey(name: 'district') String district,
            @JsonKey(name: 'state') String state,
            @JsonKey(name: 'stateCode') String stateCode,
            @JsonKey(name: 'airportCode') String airportCode,
            @JsonKey(name: 'country') String country,
            @JsonKey(name: 'countryCode') String countryCode,
            @JsonKey(name: 'zipcode') String zipcode,
            @JsonKey(name: 'areaCode') String areaCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Address():
        return $default(
            _that.address1,
            _that.address2,
            _that.address3,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.airportCode,
            _that.country,
            _that.countryCode,
            _that.zipcode,
            _that.areaCode);
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
            @JsonKey(name: 'address1') String address1,
            @JsonKey(name: 'address2') String address2,
            @JsonKey(name: 'address3') String address3,
            @JsonKey(name: 'city') String city,
            @JsonKey(name: 'district') String district,
            @JsonKey(name: 'state') String state,
            @JsonKey(name: 'stateCode') String stateCode,
            @JsonKey(name: 'airportCode') String airportCode,
            @JsonKey(name: 'country') String country,
            @JsonKey(name: 'countryCode') String countryCode,
            @JsonKey(name: 'zipcode') String zipcode,
            @JsonKey(name: 'areaCode') String areaCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Address() when $default != null:
        return $default(
            _that.address1,
            _that.address2,
            _that.address3,
            _that.city,
            _that.district,
            _that.state,
            _that.stateCode,
            _that.airportCode,
            _that.country,
            _that.countryCode,
            _that.zipcode,
            _that.areaCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Address implements Address {
  const _Address(
      {@JsonKey(name: 'address1') this.address1 = '',
      @JsonKey(name: 'address2') this.address2 = '',
      @JsonKey(name: 'address3') this.address3 = '',
      @JsonKey(name: 'city') this.city = '',
      @JsonKey(name: 'district') this.district = '',
      @JsonKey(name: 'state') this.state = '',
      @JsonKey(name: 'stateCode') this.stateCode = '',
      @JsonKey(name: 'airportCode') this.airportCode = '',
      @JsonKey(name: 'country') this.country = '',
      @JsonKey(name: 'countryCode') this.countryCode = '',
      @JsonKey(name: 'zipcode') this.zipcode = '',
      @JsonKey(name: 'areaCode') this.areaCode = ''});
  factory _Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  @override
  @JsonKey(name: 'address1')
  final String address1;
  @override
  @JsonKey(name: 'address2')
  final String address2;
  @override
  @JsonKey(name: 'address3')
  final String address3;
  @override
  @JsonKey(name: 'city')
  final String city;
  @override
  @JsonKey(name: 'district')
  final String district;
  @override
  @JsonKey(name: 'state')
  final String state;
  @override
  @JsonKey(name: 'stateCode')
  final String stateCode;
  @override
  @JsonKey(name: 'airportCode')
  final String airportCode;
  @override
  @JsonKey(name: 'country')
  final String country;
  @override
  @JsonKey(name: 'countryCode')
  final String countryCode;
  @override
  @JsonKey(name: 'zipcode')
  final String zipcode;
  @override
  @JsonKey(name: 'areaCode')
  final String areaCode;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddressToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Address &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.address3, address3) ||
                other.address3 == address3) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.airportCode, airportCode) ||
                other.airportCode == airportCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            (identical(other.areaCode, areaCode) ||
                other.areaCode == areaCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address1,
      address2,
      address3,
      city,
      district,
      state,
      stateCode,
      airportCode,
      country,
      countryCode,
      zipcode,
      areaCode);

  @override
  String toString() {
    return 'Address(address1: $address1, address2: $address2, address3: $address3, city: $city, district: $district, state: $state, stateCode: $stateCode, airportCode: $airportCode, country: $country, countryCode: $countryCode, zipcode: $zipcode, areaCode: $areaCode)';
  }
}

/// @nodoc
abstract mixin class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) _then) =
      __$AddressCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'address1') String address1,
      @JsonKey(name: 'address2') String address2,
      @JsonKey(name: 'address3') String address3,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'district') String district,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'stateCode') String stateCode,
      @JsonKey(name: 'airportCode') String airportCode,
      @JsonKey(name: 'country') String country,
      @JsonKey(name: 'countryCode') String countryCode,
      @JsonKey(name: 'zipcode') String zipcode,
      @JsonKey(name: 'areaCode') String areaCode});
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(this._self, this._then);

  final _Address _self;
  final $Res Function(_Address) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address1 = null,
    Object? address2 = null,
    Object? address3 = null,
    Object? city = null,
    Object? district = null,
    Object? state = null,
    Object? stateCode = null,
    Object? airportCode = null,
    Object? country = null,
    Object? countryCode = null,
    Object? zipcode = null,
    Object? areaCode = null,
  }) {
    return _then(_Address(
      address1: null == address1
          ? _self.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _self.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      address3: null == address3
          ? _self.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _self.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _self.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      airportCode: null == airportCode
          ? _self.airportCode
          : airportCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: null == zipcode
          ? _self.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      areaCode: null == areaCode
          ? _self.areaCode
          : areaCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
