// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_provider_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceProviderFz {
  @JsonKey(name: "StatusCode")
  String? get statusCode;
  @JsonKey(name: "StatusMessaage")
  String? get statusMessaage;
  @JsonKey(name: "Data")
  Data? get data;
  @JsonKey(name: "CustomMessageDetails")
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of ServiceProviderFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceProviderFzCopyWith<ServiceProviderFz> get copyWith =>
      _$ServiceProviderFzCopyWithImpl<ServiceProviderFz>(
          this as ServiceProviderFz, _$identity);

  /// Serializes this ServiceProviderFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceProviderFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessaage, statusMessaage) ||
                other.statusMessaage == statusMessaage) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessaage, data, customMessageDetails);

  @override
  String toString() {
    return 'ServiceProviderFz(statusCode: $statusCode, statusMessaage: $statusMessaage, data: $data, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $ServiceProviderFzCopyWith<$Res> {
  factory $ServiceProviderFzCopyWith(
          ServiceProviderFz value, $Res Function(ServiceProviderFz) _then) =
      _$ServiceProviderFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessaage") String? statusMessaage,
      @JsonKey(name: "Data") Data? data,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails});

  $DataCopyWith<$Res>? get data;
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$ServiceProviderFzCopyWithImpl<$Res>
    implements $ServiceProviderFzCopyWith<$Res> {
  _$ServiceProviderFzCopyWithImpl(this._self, this._then);

  final ServiceProviderFz _self;
  final $Res Function(ServiceProviderFz) _then;

  /// Create a copy of ServiceProviderFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessaage = freezed,
    Object? data = freezed,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_self.copyWith(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessaage: freezed == statusMessaage
          ? _self.statusMessaage
          : statusMessaage // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of ServiceProviderFz
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

  /// Create a copy of ServiceProviderFz
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

/// Adds pattern-matching-related methods to [ServiceProviderFz].
extension ServiceProviderFzPatterns on ServiceProviderFz {
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
    TResult Function(_ServiceProviderFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceProviderFz() when $default != null:
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
    TResult Function(_ServiceProviderFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceProviderFz():
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
    TResult? Function(_ServiceProviderFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceProviderFz() when $default != null:
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
            @JsonKey(name: "StatusMessaage") String? statusMessaage,
            @JsonKey(name: "Data") Data? data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceProviderFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessaage, _that.data,
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
            @JsonKey(name: "StatusMessaage") String? statusMessaage,
            @JsonKey(name: "Data") Data? data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceProviderFz():
        return $default(_that.statusCode, _that.statusMessaage, _that.data,
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
            @JsonKey(name: "StatusMessaage") String? statusMessaage,
            @JsonKey(name: "Data") Data? data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceProviderFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessaage, _that.data,
            _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceProviderFz implements ServiceProviderFz {
  const _ServiceProviderFz(
      {@JsonKey(name: "StatusCode") this.statusCode,
      @JsonKey(name: "StatusMessaage") this.statusMessaage,
      @JsonKey(name: "Data") this.data,
      @JsonKey(name: "CustomMessageDetails") this.customMessageDetails});
  factory _ServiceProviderFz.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderFzFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String? statusCode;
  @override
  @JsonKey(name: "StatusMessaage")
  final String? statusMessaage;
  @override
  @JsonKey(name: "Data")
  final Data? data;
  @override
  @JsonKey(name: "CustomMessageDetails")
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of ServiceProviderFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceProviderFzCopyWith<_ServiceProviderFz> get copyWith =>
      __$ServiceProviderFzCopyWithImpl<_ServiceProviderFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceProviderFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceProviderFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessaage, statusMessaage) ||
                other.statusMessaage == statusMessaage) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, statusCode, statusMessaage, data, customMessageDetails);

  @override
  String toString() {
    return 'ServiceProviderFz(statusCode: $statusCode, statusMessaage: $statusMessaage, data: $data, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$ServiceProviderFzCopyWith<$Res>
    implements $ServiceProviderFzCopyWith<$Res> {
  factory _$ServiceProviderFzCopyWith(
          _ServiceProviderFz value, $Res Function(_ServiceProviderFz) _then) =
      __$ServiceProviderFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessaage") String? statusMessaage,
      @JsonKey(name: "Data") Data? data,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails});

  @override
  $DataCopyWith<$Res>? get data;
  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$ServiceProviderFzCopyWithImpl<$Res>
    implements _$ServiceProviderFzCopyWith<$Res> {
  __$ServiceProviderFzCopyWithImpl(this._self, this._then);

  final _ServiceProviderFz _self;
  final $Res Function(_ServiceProviderFz) _then;

  /// Create a copy of ServiceProviderFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessaage = freezed,
    Object? data = freezed,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_ServiceProviderFz(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessaage: freezed == statusMessaage
          ? _self.statusMessaage
          : statusMessaage // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of ServiceProviderFz
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

  /// Create a copy of ServiceProviderFz
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
  @JsonKey(name: "ServiceProvider")
  List<ServiceProvider>? get serviceProvider;
  @JsonKey(name: "MessageCode")
  String? get messageCode;
  @JsonKey(name: "MessageDetail")
  String? get messageDetail;

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
                .equals(other.serviceProvider, serviceProvider) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serviceProvider),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'Data(serviceProvider: $serviceProvider, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "ServiceProvider") List<ServiceProvider>? serviceProvider,
      @JsonKey(name: "MessageCode") String? messageCode,
      @JsonKey(name: "MessageDetail") String? messageDetail});
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
    Object? serviceProvider = freezed,
    Object? messageCode = freezed,
    Object? messageDetail = freezed,
  }) {
    return _then(_self.copyWith(
      serviceProvider: freezed == serviceProvider
          ? _self.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as List<ServiceProvider>?,
      messageCode: freezed == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messageDetail: freezed == messageDetail
          ? _self.messageDetail
          : messageDetail // ignore: cast_nullable_to_non_nullable
              as String?,
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
            @JsonKey(name: "ServiceProvider")
            List<ServiceProvider>? serviceProvider,
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageDetail") String? messageDetail)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.serviceProvider, _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: "ServiceProvider")
            List<ServiceProvider>? serviceProvider,
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageDetail") String? messageDetail)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(
            _that.serviceProvider, _that.messageCode, _that.messageDetail);
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
            @JsonKey(name: "ServiceProvider")
            List<ServiceProvider>? serviceProvider,
            @JsonKey(name: "MessageCode") String? messageCode,
            @JsonKey(name: "MessageDetail") String? messageDetail)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.serviceProvider, _that.messageCode, _that.messageDetail);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: "ServiceProvider")
      final List<ServiceProvider>? serviceProvider,
      @JsonKey(name: "MessageCode") this.messageCode,
      @JsonKey(name: "MessageDetail") this.messageDetail})
      : _serviceProvider = serviceProvider;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<ServiceProvider>? _serviceProvider;
  @override
  @JsonKey(name: "ServiceProvider")
  List<ServiceProvider>? get serviceProvider {
    final value = _serviceProvider;
    if (value == null) return null;
    if (_serviceProvider is EqualUnmodifiableListView) return _serviceProvider;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "MessageCode")
  final String? messageCode;
  @override
  @JsonKey(name: "MessageDetail")
  final String? messageDetail;

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
                .equals(other._serviceProvider, _serviceProvider) &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetail, messageDetail) ||
                other.messageDetail == messageDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_serviceProvider),
      messageCode,
      messageDetail);

  @override
  String toString() {
    return 'Data(serviceProvider: $serviceProvider, messageCode: $messageCode, messageDetail: $messageDetail)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ServiceProvider") List<ServiceProvider>? serviceProvider,
      @JsonKey(name: "MessageCode") String? messageCode,
      @JsonKey(name: "MessageDetail") String? messageDetail});
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
    Object? serviceProvider = freezed,
    Object? messageCode = freezed,
    Object? messageDetail = freezed,
  }) {
    return _then(_Data(
      serviceProvider: freezed == serviceProvider
          ? _self._serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as List<ServiceProvider>?,
      messageCode: freezed == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messageDetail: freezed == messageDetail
          ? _self.messageDetail
          : messageDetail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ServiceProvider {
  @JsonKey(name: "Code")
  String? get code;
  @JsonKey(name: "Provider")
  String? get provider;
  @JsonKey(name: "MappingCode")
  String? get mappingCode;
  @JsonKey(name: "ImageContent")
  String? get imageContent;
  @JsonKey(name: "Status")
  String? get status;
  @JsonKey(name: "ServiceCategory")
  String? get serviceCategory;

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceProviderCopyWith<ServiceProvider> get copyWith =>
      _$ServiceProviderCopyWithImpl<ServiceProvider>(
          this as ServiceProvider, _$identity);

  /// Serializes this ServiceProvider to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceProvider &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.mappingCode, mappingCode) ||
                other.mappingCode == mappingCode) &&
            (identical(other.imageContent, imageContent) ||
                other.imageContent == imageContent) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serviceCategory, serviceCategory) ||
                other.serviceCategory == serviceCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, provider, mappingCode,
      imageContent, status, serviceCategory);

  @override
  String toString() {
    return 'ServiceProvider(code: $code, provider: $provider, mappingCode: $mappingCode, imageContent: $imageContent, status: $status, serviceCategory: $serviceCategory)';
  }
}

/// @nodoc
abstract mixin class $ServiceProviderCopyWith<$Res> {
  factory $ServiceProviderCopyWith(
          ServiceProvider value, $Res Function(ServiceProvider) _then) =
      _$ServiceProviderCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Code") String? code,
      @JsonKey(name: "Provider") String? provider,
      @JsonKey(name: "MappingCode") String? mappingCode,
      @JsonKey(name: "ImageContent") String? imageContent,
      @JsonKey(name: "Status") String? status,
      @JsonKey(name: "ServiceCategory") String? serviceCategory});
}

/// @nodoc
class _$ServiceProviderCopyWithImpl<$Res>
    implements $ServiceProviderCopyWith<$Res> {
  _$ServiceProviderCopyWithImpl(this._self, this._then);

  final ServiceProvider _self;
  final $Res Function(ServiceProvider) _then;

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? provider = freezed,
    Object? mappingCode = freezed,
    Object? imageContent = freezed,
    Object? status = freezed,
    Object? serviceCategory = freezed,
  }) {
    return _then(_self.copyWith(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      mappingCode: freezed == mappingCode
          ? _self.mappingCode
          : mappingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      imageContent: freezed == imageContent
          ? _self.imageContent
          : imageContent // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCategory: freezed == serviceCategory
          ? _self.serviceCategory
          : serviceCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ServiceProvider].
extension ServiceProviderPatterns on ServiceProvider {
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
    TResult Function(_ServiceProvider value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceProvider() when $default != null:
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
    TResult Function(_ServiceProvider value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceProvider():
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
    TResult? Function(_ServiceProvider value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceProvider() when $default != null:
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
            @JsonKey(name: "Code") String? code,
            @JsonKey(name: "Provider") String? provider,
            @JsonKey(name: "MappingCode") String? mappingCode,
            @JsonKey(name: "ImageContent") String? imageContent,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "ServiceCategory") String? serviceCategory)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ServiceProvider() when $default != null:
        return $default(_that.code, _that.provider, _that.mappingCode,
            _that.imageContent, _that.status, _that.serviceCategory);
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
            @JsonKey(name: "Code") String? code,
            @JsonKey(name: "Provider") String? provider,
            @JsonKey(name: "MappingCode") String? mappingCode,
            @JsonKey(name: "ImageContent") String? imageContent,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "ServiceCategory") String? serviceCategory)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceProvider():
        return $default(_that.code, _that.provider, _that.mappingCode,
            _that.imageContent, _that.status, _that.serviceCategory);
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
            @JsonKey(name: "Code") String? code,
            @JsonKey(name: "Provider") String? provider,
            @JsonKey(name: "MappingCode") String? mappingCode,
            @JsonKey(name: "ImageContent") String? imageContent,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "ServiceCategory") String? serviceCategory)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ServiceProvider() when $default != null:
        return $default(_that.code, _that.provider, _that.mappingCode,
            _that.imageContent, _that.status, _that.serviceCategory);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceProvider implements ServiceProvider {
  const _ServiceProvider(
      {@JsonKey(name: "Code") this.code,
      @JsonKey(name: "Provider") this.provider,
      @JsonKey(name: "MappingCode") this.mappingCode,
      @JsonKey(name: "ImageContent") this.imageContent,
      @JsonKey(name: "Status") this.status,
      @JsonKey(name: "ServiceCategory") this.serviceCategory});
  factory _ServiceProvider.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderFromJson(json);

  @override
  @JsonKey(name: "Code")
  final String? code;
  @override
  @JsonKey(name: "Provider")
  final String? provider;
  @override
  @JsonKey(name: "MappingCode")
  final String? mappingCode;
  @override
  @JsonKey(name: "ImageContent")
  final String? imageContent;
  @override
  @JsonKey(name: "Status")
  final String? status;
  @override
  @JsonKey(name: "ServiceCategory")
  final String? serviceCategory;

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceProviderCopyWith<_ServiceProvider> get copyWith =>
      __$ServiceProviderCopyWithImpl<_ServiceProvider>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceProviderToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceProvider &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.mappingCode, mappingCode) ||
                other.mappingCode == mappingCode) &&
            (identical(other.imageContent, imageContent) ||
                other.imageContent == imageContent) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serviceCategory, serviceCategory) ||
                other.serviceCategory == serviceCategory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, provider, mappingCode,
      imageContent, status, serviceCategory);

  @override
  String toString() {
    return 'ServiceProvider(code: $code, provider: $provider, mappingCode: $mappingCode, imageContent: $imageContent, status: $status, serviceCategory: $serviceCategory)';
  }
}

/// @nodoc
abstract mixin class _$ServiceProviderCopyWith<$Res>
    implements $ServiceProviderCopyWith<$Res> {
  factory _$ServiceProviderCopyWith(
          _ServiceProvider value, $Res Function(_ServiceProvider) _then) =
      __$ServiceProviderCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Code") String? code,
      @JsonKey(name: "Provider") String? provider,
      @JsonKey(name: "MappingCode") String? mappingCode,
      @JsonKey(name: "ImageContent") String? imageContent,
      @JsonKey(name: "Status") String? status,
      @JsonKey(name: "ServiceCategory") String? serviceCategory});
}

/// @nodoc
class __$ServiceProviderCopyWithImpl<$Res>
    implements _$ServiceProviderCopyWith<$Res> {
  __$ServiceProviderCopyWithImpl(this._self, this._then);

  final _ServiceProvider _self;
  final $Res Function(_ServiceProvider) _then;

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? provider = freezed,
    Object? mappingCode = freezed,
    Object? imageContent = freezed,
    Object? status = freezed,
    Object? serviceCategory = freezed,
  }) {
    return _then(_ServiceProvider(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      provider: freezed == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      mappingCode: freezed == mappingCode
          ? _self.mappingCode
          : mappingCode // ignore: cast_nullable_to_non_nullable
              as String?,
      imageContent: freezed == imageContent
          ? _self.imageContent
          : imageContent // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCategory: freezed == serviceCategory
          ? _self.serviceCategory
          : serviceCategory // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
