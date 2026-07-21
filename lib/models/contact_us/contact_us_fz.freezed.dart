// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactUsFz {
  @JsonKey(name: "StatusCode")
  String? get statusCode;
  @JsonKey(name: "StatusMessage")
  String? get statusMessage;
  @JsonKey(name: "Data")
  Data? get data;
  @JsonKey(name: "CustomMessageDetails")
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of ContactUsFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContactUsFzCopyWith<ContactUsFz> get copyWith =>
      _$ContactUsFzCopyWithImpl<ContactUsFz>(this as ContactUsFz, _$identity);

  /// Serializes this ContactUsFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContactUsFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessage, data, customMessageDetails);

  @override
  String toString() {
    return 'ContactUsFz(statusCode: $statusCode, statusMessage: $statusMessage, data: $data, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $ContactUsFzCopyWith<$Res> {
  factory $ContactUsFzCopyWith(
          ContactUsFz value, $Res Function(ContactUsFz) _then) =
      _$ContactUsFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "Data") Data? data,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails});

  $DataCopyWith<$Res>? get data;
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$ContactUsFzCopyWithImpl<$Res> implements $ContactUsFzCopyWith<$Res> {
  _$ContactUsFzCopyWithImpl(this._self, this._then);

  final ContactUsFz _self;
  final $Res Function(ContactUsFz) _then;

  /// Create a copy of ContactUsFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? data = freezed,
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
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of ContactUsFz
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

  /// Create a copy of ContactUsFz
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

/// Adds pattern-matching-related methods to [ContactUsFz].
extension ContactUsFzPatterns on ContactUsFz {
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
    TResult Function(_ContactUsFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContactUsFz() when $default != null:
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
    TResult Function(_ContactUsFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContactUsFz():
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
    TResult? Function(_ContactUsFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContactUsFz() when $default != null:
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
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") Data? data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContactUsFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.data,
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
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") Data? data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContactUsFz():
        return $default(_that.statusCode, _that.statusMessage, _that.data,
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
            @JsonKey(name: "StatusCode") String? statusCode,
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") Data? data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContactUsFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.data,
            _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContactUsFz implements ContactUsFz {
  const _ContactUsFz(
      {@JsonKey(name: "StatusCode") this.statusCode,
      @JsonKey(name: "StatusMessage") this.statusMessage,
      @JsonKey(name: "Data") this.data,
      @JsonKey(name: "CustomMessageDetails") this.customMessageDetails});
  factory _ContactUsFz.fromJson(Map<String, dynamic> json) =>
      _$ContactUsFzFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String? statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String? statusMessage;
  @override
  @JsonKey(name: "Data")
  final Data? data;
  @override
  @JsonKey(name: "CustomMessageDetails")
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of ContactUsFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContactUsFzCopyWith<_ContactUsFz> get copyWith =>
      __$ContactUsFzCopyWithImpl<_ContactUsFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContactUsFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContactUsFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessage, data, customMessageDetails);

  @override
  String toString() {
    return 'ContactUsFz(statusCode: $statusCode, statusMessage: $statusMessage, data: $data, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$ContactUsFzCopyWith<$Res>
    implements $ContactUsFzCopyWith<$Res> {
  factory _$ContactUsFzCopyWith(
          _ContactUsFz value, $Res Function(_ContactUsFz) _then) =
      __$ContactUsFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "Data") Data? data,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails});

  @override
  $DataCopyWith<$Res>? get data;
  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$ContactUsFzCopyWithImpl<$Res> implements _$ContactUsFzCopyWith<$Res> {
  __$ContactUsFzCopyWithImpl(this._self, this._then);

  final _ContactUsFz _self;
  final $Res Function(_ContactUsFz) _then;

  /// Create a copy of ContactUsFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? data = freezed,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_ContactUsFz(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of ContactUsFz
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

  /// Create a copy of ContactUsFz
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
  @JsonKey(name: "MessageCode")
  String? get messageCode;
  @JsonKey(name: "MessageType")
  String? get messageType;
  @JsonKey(name: "MessageHeader")
  String? get messageHeader;
  @JsonKey(name: "MessageDescription")
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
      {@JsonKey(name: "MessageCode") String? messageCode,
      @JsonKey(name: "MessageType") String? messageType,
      @JsonKey(name: "MessageHeader") String? messageHeader,
      @JsonKey(name: "MessageDescription") String? messageDescription});
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
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageType") String? messageType,
            @JsonKey(name: "MessageHeader") String? messageHeader,
            @JsonKey(name: "MessageDescription") String? messageDescription)?
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
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageType") String? messageType,
            @JsonKey(name: "MessageHeader") String? messageHeader,
            @JsonKey(name: "MessageDescription") String? messageDescription)
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
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageType") String? messageType,
            @JsonKey(name: "MessageHeader") String? messageHeader,
            @JsonKey(name: "MessageDescription") String? messageDescription)?
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
      {@JsonKey(name: "MessageCode") this.messageCode,
      @JsonKey(name: "MessageType") this.messageType,
      @JsonKey(name: "MessageHeader") this.messageHeader,
      @JsonKey(name: "MessageDescription") this.messageDescription});
  factory _CustomMessageDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageDetailsFromJson(json);

  @override
  @JsonKey(name: "MessageCode")
  final String? messageCode;
  @override
  @JsonKey(name: "MessageType")
  final String? messageType;
  @override
  @JsonKey(name: "MessageHeader")
  final String? messageHeader;
  @override
  @JsonKey(name: "MessageDescription")
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
      {@JsonKey(name: "MessageCode") String? messageCode,
      @JsonKey(name: "MessageType") String? messageType,
      @JsonKey(name: "MessageHeader") String? messageHeader,
      @JsonKey(name: "MessageDescription") String? messageDescription});
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
mixin _$Data {
  @JsonKey(name: "PhoneNo")
  String? get phoneNo;
  @JsonKey(name: "CompanyName")
  String? get companyName;
  @JsonKey(name: "Email")
  String? get email;
  @JsonKey(name: "Address")
  String? get address;
  @JsonKey(name: "BranchDetails")
  List<BranchDetail>? get branchDetails;

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
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other.branchDetails, branchDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNo, companyName, email,
      address, const DeepCollectionEquality().hash(branchDetails));

  @override
  String toString() {
    return 'Data(phoneNo: $phoneNo, companyName: $companyName, email: $email, address: $address, branchDetails: $branchDetails)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "PhoneNo") String? phoneNo,
      @JsonKey(name: "CompanyName") String? companyName,
      @JsonKey(name: "Email") String? email,
      @JsonKey(name: "Address") String? address,
      @JsonKey(name: "BranchDetails") List<BranchDetail>? branchDetails});
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
    Object? phoneNo = freezed,
    Object? companyName = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? branchDetails = freezed,
  }) {
    return _then(_self.copyWith(
      phoneNo: freezed == phoneNo
          ? _self.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      branchDetails: freezed == branchDetails
          ? _self.branchDetails
          : branchDetails // ignore: cast_nullable_to_non_nullable
              as List<BranchDetail>?,
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
            @JsonKey(name: "PhoneNo") String? phoneNo,
            @JsonKey(name: "CompanyName") String? companyName,
            @JsonKey(name: "Email") String? email,
            @JsonKey(name: "Address") String? address,
            @JsonKey(name: "BranchDetails") List<BranchDetail>? branchDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(_that.phoneNo, _that.companyName, _that.email,
            _that.address, _that.branchDetails);
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
            @JsonKey(name: "PhoneNo") String? phoneNo,
            @JsonKey(name: "CompanyName") String? companyName,
            @JsonKey(name: "Email") String? email,
            @JsonKey(name: "Address") String? address,
            @JsonKey(name: "BranchDetails") List<BranchDetail>? branchDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(_that.phoneNo, _that.companyName, _that.email,
            _that.address, _that.branchDetails);
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
            @JsonKey(name: "PhoneNo") String? phoneNo,
            @JsonKey(name: "CompanyName") String? companyName,
            @JsonKey(name: "Email") String? email,
            @JsonKey(name: "Address") String? address,
            @JsonKey(name: "BranchDetails") List<BranchDetail>? branchDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(_that.phoneNo, _that.companyName, _that.email,
            _that.address, _that.branchDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: "PhoneNo") this.phoneNo,
      @JsonKey(name: "CompanyName") this.companyName,
      @JsonKey(name: "Email") this.email,
      @JsonKey(name: "Address") this.address,
      @JsonKey(name: "BranchDetails") final List<BranchDetail>? branchDetails})
      : _branchDetails = branchDetails;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  @override
  @JsonKey(name: "PhoneNo")
  final String? phoneNo;
  @override
  @JsonKey(name: "CompanyName")
  final String? companyName;
  @override
  @JsonKey(name: "Email")
  final String? email;
  @override
  @JsonKey(name: "Address")
  final String? address;
  final List<BranchDetail>? _branchDetails;
  @override
  @JsonKey(name: "BranchDetails")
  List<BranchDetail>? get branchDetails {
    final value = _branchDetails;
    if (value == null) return null;
    if (_branchDetails is EqualUnmodifiableListView) return _branchDetails;
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
            (identical(other.phoneNo, phoneNo) || other.phoneNo == phoneNo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._branchDetails, _branchDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNo, companyName, email,
      address, const DeepCollectionEquality().hash(_branchDetails));

  @override
  String toString() {
    return 'Data(phoneNo: $phoneNo, companyName: $companyName, email: $email, address: $address, branchDetails: $branchDetails)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "PhoneNo") String? phoneNo,
      @JsonKey(name: "CompanyName") String? companyName,
      @JsonKey(name: "Email") String? email,
      @JsonKey(name: "Address") String? address,
      @JsonKey(name: "BranchDetails") List<BranchDetail>? branchDetails});
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
    Object? phoneNo = freezed,
    Object? companyName = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? branchDetails = freezed,
  }) {
    return _then(_Data(
      phoneNo: freezed == phoneNo
          ? _self.phoneNo
          : phoneNo // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      branchDetails: freezed == branchDetails
          ? _self._branchDetails
          : branchDetails // ignore: cast_nullable_to_non_nullable
              as List<BranchDetail>?,
    ));
  }
}

/// @nodoc
mixin _$BranchDetail {
  @JsonKey(name: "BranchName")
  String? get branchName;
  @JsonKey(name: "Latitudes")
  String? get latitude;
  @JsonKey(name: "Longitudes")
  String? get longitude;
  @JsonKey(name: "BranchCode")
  String? get branchCode;
  @JsonKey(name: "ZoneName")
  String? get zoneName;
  @JsonKey(name: "LocationMap")
  String? get locationMap;
  @JsonKey(name: "Landmark")
  String? get landmark;
  @JsonKey(name: "Phone")
  String? get phone;
  @JsonKey(name: "BranchAddress")
  String? get branchAddress;
  @JsonKey(name: "Status")
  String? get status;
  @JsonKey(name: "LanguageCode")
  String? get languageCode;

  /// Create a copy of BranchDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BranchDetailCopyWith<BranchDetail> get copyWith =>
      _$BranchDetailCopyWithImpl<BranchDetail>(
          this as BranchDetail, _$identity);

  /// Serializes this BranchDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BranchDetail &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            (identical(other.locationMap, locationMap) ||
                other.locationMap == locationMap) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.branchAddress, branchAddress) ||
                other.branchAddress == branchAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      branchName,
      latitude,
      longitude,
      branchCode,
      zoneName,
      locationMap,
      landmark,
      phone,
      branchAddress,
      status,
      languageCode);

  @override
  String toString() {
    return 'BranchDetail(branchName: $branchName, latitude: $latitude, longitude: $longitude, branchCode: $branchCode, zoneName: $zoneName, locationMap: $locationMap, landmark: $landmark, phone: $phone, branchAddress: $branchAddress, status: $status, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $BranchDetailCopyWith<$Res> {
  factory $BranchDetailCopyWith(
          BranchDetail value, $Res Function(BranchDetail) _then) =
      _$BranchDetailCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "BranchName") String? branchName,
      @JsonKey(name: "Latitudes") String? latitude,
      @JsonKey(name: "Longitudes") String? longitude,
      @JsonKey(name: "BranchCode") String? branchCode,
      @JsonKey(name: "ZoneName") String? zoneName,
      @JsonKey(name: "LocationMap") String? locationMap,
      @JsonKey(name: "Landmark") String? landmark,
      @JsonKey(name: "Phone") String? phone,
      @JsonKey(name: "BranchAddress") String? branchAddress,
      @JsonKey(name: "Status") String? status,
      @JsonKey(name: "LanguageCode") String? languageCode});
}

/// @nodoc
class _$BranchDetailCopyWithImpl<$Res> implements $BranchDetailCopyWith<$Res> {
  _$BranchDetailCopyWithImpl(this._self, this._then);

  final BranchDetail _self;
  final $Res Function(BranchDetail) _then;

  /// Create a copy of BranchDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? branchCode = freezed,
    Object? zoneName = freezed,
    Object? locationMap = freezed,
    Object? landmark = freezed,
    Object? phone = freezed,
    Object? branchAddress = freezed,
    Object? status = freezed,
    Object? languageCode = freezed,
  }) {
    return _then(_self.copyWith(
      branchName: freezed == branchName
          ? _self.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      branchCode: freezed == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneName: freezed == zoneName
          ? _self.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationMap: freezed == locationMap
          ? _self.locationMap
          : locationMap // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      branchAddress: freezed == branchAddress
          ? _self.branchAddress
          : branchAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [BranchDetail].
extension BranchDetailPatterns on BranchDetail {
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
    TResult Function(_BranchDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BranchDetail() when $default != null:
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
    TResult Function(_BranchDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchDetail():
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
    TResult? Function(_BranchDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchDetail() when $default != null:
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
            @JsonKey(name: "BranchName") String? branchName,
            @JsonKey(name: "Latitudes") String? latitude,
            @JsonKey(name: "Longitudes") String? longitude,
            @JsonKey(name: "BranchCode") String? branchCode,
            @JsonKey(name: "ZoneName") String? zoneName,
            @JsonKey(name: "LocationMap") String? locationMap,
            @JsonKey(name: "Landmark") String? landmark,
            @JsonKey(name: "Phone") String? phone,
            @JsonKey(name: "BranchAddress") String? branchAddress,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "LanguageCode") String? languageCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BranchDetail() when $default != null:
        return $default(
            _that.branchName,
            _that.latitude,
            _that.longitude,
            _that.branchCode,
            _that.zoneName,
            _that.locationMap,
            _that.landmark,
            _that.phone,
            _that.branchAddress,
            _that.status,
            _that.languageCode);
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
            @JsonKey(name: "BranchName") String? branchName,
            @JsonKey(name: "Latitudes") String? latitude,
            @JsonKey(name: "Longitudes") String? longitude,
            @JsonKey(name: "BranchCode") String? branchCode,
            @JsonKey(name: "ZoneName") String? zoneName,
            @JsonKey(name: "LocationMap") String? locationMap,
            @JsonKey(name: "Landmark") String? landmark,
            @JsonKey(name: "Phone") String? phone,
            @JsonKey(name: "BranchAddress") String? branchAddress,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "LanguageCode") String? languageCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchDetail():
        return $default(
            _that.branchName,
            _that.latitude,
            _that.longitude,
            _that.branchCode,
            _that.zoneName,
            _that.locationMap,
            _that.landmark,
            _that.phone,
            _that.branchAddress,
            _that.status,
            _that.languageCode);
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
            @JsonKey(name: "BranchName") String? branchName,
            @JsonKey(name: "Latitudes") String? latitude,
            @JsonKey(name: "Longitudes") String? longitude,
            @JsonKey(name: "BranchCode") String? branchCode,
            @JsonKey(name: "ZoneName") String? zoneName,
            @JsonKey(name: "LocationMap") String? locationMap,
            @JsonKey(name: "Landmark") String? landmark,
            @JsonKey(name: "Phone") String? phone,
            @JsonKey(name: "BranchAddress") String? branchAddress,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "LanguageCode") String? languageCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BranchDetail() when $default != null:
        return $default(
            _that.branchName,
            _that.latitude,
            _that.longitude,
            _that.branchCode,
            _that.zoneName,
            _that.locationMap,
            _that.landmark,
            _that.phone,
            _that.branchAddress,
            _that.status,
            _that.languageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BranchDetail implements BranchDetail {
  const _BranchDetail(
      {@JsonKey(name: "BranchName") this.branchName,
      @JsonKey(name: "Latitudes") this.latitude,
      @JsonKey(name: "Longitudes") this.longitude,
      @JsonKey(name: "BranchCode") this.branchCode,
      @JsonKey(name: "ZoneName") this.zoneName,
      @JsonKey(name: "LocationMap") this.locationMap,
      @JsonKey(name: "Landmark") this.landmark,
      @JsonKey(name: "Phone") this.phone,
      @JsonKey(name: "BranchAddress") this.branchAddress,
      @JsonKey(name: "Status") this.status,
      @JsonKey(name: "LanguageCode") this.languageCode});
  factory _BranchDetail.fromJson(Map<String, dynamic> json) =>
      _$BranchDetailFromJson(json);

  @override
  @JsonKey(name: "BranchName")
  final String? branchName;
  @override
  @JsonKey(name: "Latitudes")
  final String? latitude;
  @override
  @JsonKey(name: "Longitudes")
  final String? longitude;
  @override
  @JsonKey(name: "BranchCode")
  final String? branchCode;
  @override
  @JsonKey(name: "ZoneName")
  final String? zoneName;
  @override
  @JsonKey(name: "LocationMap")
  final String? locationMap;
  @override
  @JsonKey(name: "Landmark")
  final String? landmark;
  @override
  @JsonKey(name: "Phone")
  final String? phone;
  @override
  @JsonKey(name: "BranchAddress")
  final String? branchAddress;
  @override
  @JsonKey(name: "Status")
  final String? status;
  @override
  @JsonKey(name: "LanguageCode")
  final String? languageCode;

  /// Create a copy of BranchDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BranchDetailCopyWith<_BranchDetail> get copyWith =>
      __$BranchDetailCopyWithImpl<_BranchDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BranchDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BranchDetail &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.zoneName, zoneName) ||
                other.zoneName == zoneName) &&
            (identical(other.locationMap, locationMap) ||
                other.locationMap == locationMap) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.branchAddress, branchAddress) ||
                other.branchAddress == branchAddress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      branchName,
      latitude,
      longitude,
      branchCode,
      zoneName,
      locationMap,
      landmark,
      phone,
      branchAddress,
      status,
      languageCode);

  @override
  String toString() {
    return 'BranchDetail(branchName: $branchName, latitude: $latitude, longitude: $longitude, branchCode: $branchCode, zoneName: $zoneName, locationMap: $locationMap, landmark: $landmark, phone: $phone, branchAddress: $branchAddress, status: $status, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class _$BranchDetailCopyWith<$Res>
    implements $BranchDetailCopyWith<$Res> {
  factory _$BranchDetailCopyWith(
          _BranchDetail value, $Res Function(_BranchDetail) _then) =
      __$BranchDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "BranchName") String? branchName,
      @JsonKey(name: "Latitudes") String? latitude,
      @JsonKey(name: "Longitudes") String? longitude,
      @JsonKey(name: "BranchCode") String? branchCode,
      @JsonKey(name: "ZoneName") String? zoneName,
      @JsonKey(name: "LocationMap") String? locationMap,
      @JsonKey(name: "Landmark") String? landmark,
      @JsonKey(name: "Phone") String? phone,
      @JsonKey(name: "BranchAddress") String? branchAddress,
      @JsonKey(name: "Status") String? status,
      @JsonKey(name: "LanguageCode") String? languageCode});
}

/// @nodoc
class __$BranchDetailCopyWithImpl<$Res>
    implements _$BranchDetailCopyWith<$Res> {
  __$BranchDetailCopyWithImpl(this._self, this._then);

  final _BranchDetail _self;
  final $Res Function(_BranchDetail) _then;

  /// Create a copy of BranchDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? branchName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? branchCode = freezed,
    Object? zoneName = freezed,
    Object? locationMap = freezed,
    Object? landmark = freezed,
    Object? phone = freezed,
    Object? branchAddress = freezed,
    Object? status = freezed,
    Object? languageCode = freezed,
  }) {
    return _then(_BranchDetail(
      branchName: freezed == branchName
          ? _self.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      branchCode: freezed == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneName: freezed == zoneName
          ? _self.zoneName
          : zoneName // ignore: cast_nullable_to_non_nullable
              as String?,
      locationMap: freezed == locationMap
          ? _self.locationMap
          : locationMap // ignore: cast_nullable_to_non_nullable
              as String?,
      landmark: freezed == landmark
          ? _self.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      branchAddress: freezed == branchAddress
          ? _self.branchAddress
          : branchAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
