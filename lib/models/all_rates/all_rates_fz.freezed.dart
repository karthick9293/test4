// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_rates_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AllRateFz {
  @JsonKey(name: "StatusCode")
  String get statusCode;
  @JsonKey(name: "StatusMessage")
  String get statusMessage;
  @JsonKey(name: "Data")
  Data get data;
  @JsonKey(name: "CustomMessageDetails")
  CustomMessageDetails get customMessageDetails;

  /// Create a copy of AllRateFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AllRateFzCopyWith<AllRateFz> get copyWith =>
      _$AllRateFzCopyWithImpl<AllRateFz>(this as AllRateFz, _$identity);

  /// Serializes this AllRateFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AllRateFz &&
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
    return 'AllRateFz(statusCode: $statusCode, statusMessage: $statusMessage, data: $data, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $AllRateFzCopyWith<$Res> {
  factory $AllRateFzCopyWith(AllRateFz value, $Res Function(AllRateFz) _then) =
      _$AllRateFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String statusCode,
      @JsonKey(name: "StatusMessage") String statusMessage,
      @JsonKey(name: "Data") Data data,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails customMessageDetails});

  $DataCopyWith<$Res> get data;
  $CustomMessageDetailsCopyWith<$Res> get customMessageDetails;
}

/// @nodoc
class _$AllRateFzCopyWithImpl<$Res> implements $AllRateFzCopyWith<$Res> {
  _$AllRateFzCopyWithImpl(this._self, this._then);

  final AllRateFz _self;
  final $Res Function(AllRateFz) _then;

  /// Create a copy of AllRateFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? data = null,
    Object? customMessageDetails = null,
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
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      customMessageDetails: null == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails,
    ));
  }

  /// Create a copy of AllRateFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of AllRateFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsCopyWith<$Res> get customMessageDetails {
    return $CustomMessageDetailsCopyWith<$Res>(_self.customMessageDetails,
        (value) {
      return _then(_self.copyWith(customMessageDetails: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AllRateFz].
extension AllRateFzPatterns on AllRateFz {
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
    TResult Function(_AllRateFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AllRateFz() when $default != null:
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
    TResult Function(_AllRateFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AllRateFz():
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
    TResult? Function(_AllRateFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AllRateFz() when $default != null:
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
            @JsonKey(name: "Data") Data data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AllRateFz() when $default != null:
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
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage,
            @JsonKey(name: "Data") Data data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AllRateFz():
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
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage,
            @JsonKey(name: "Data") Data data,
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AllRateFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.data,
            _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AllRateFz implements AllRateFz {
  const _AllRateFz(
      {@JsonKey(name: "StatusCode") required this.statusCode,
      @JsonKey(name: "StatusMessage") required this.statusMessage,
      @JsonKey(name: "Data") required this.data,
      @JsonKey(name: "CustomMessageDetails")
      required this.customMessageDetails});
  factory _AllRateFz.fromJson(Map<String, dynamic> json) =>
      _$AllRateFzFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String statusMessage;
  @override
  @JsonKey(name: "Data")
  final Data data;
  @override
  @JsonKey(name: "CustomMessageDetails")
  final CustomMessageDetails customMessageDetails;

  /// Create a copy of AllRateFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AllRateFzCopyWith<_AllRateFz> get copyWith =>
      __$AllRateFzCopyWithImpl<_AllRateFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AllRateFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AllRateFz &&
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
    return 'AllRateFz(statusCode: $statusCode, statusMessage: $statusMessage, data: $data, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$AllRateFzCopyWith<$Res>
    implements $AllRateFzCopyWith<$Res> {
  factory _$AllRateFzCopyWith(
          _AllRateFz value, $Res Function(_AllRateFz) _then) =
      __$AllRateFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String statusCode,
      @JsonKey(name: "StatusMessage") String statusMessage,
      @JsonKey(name: "Data") Data data,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails customMessageDetails});

  @override
  $DataCopyWith<$Res> get data;
  @override
  $CustomMessageDetailsCopyWith<$Res> get customMessageDetails;
}

/// @nodoc
class __$AllRateFzCopyWithImpl<$Res> implements _$AllRateFzCopyWith<$Res> {
  __$AllRateFzCopyWithImpl(this._self, this._then);

  final _AllRateFz _self;
  final $Res Function(_AllRateFz) _then;

  /// Create a copy of AllRateFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? data = null,
    Object? customMessageDetails = null,
  }) {
    return _then(_AllRateFz(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      customMessageDetails: null == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails,
    ));
  }

  /// Create a copy of AllRateFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of AllRateFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsCopyWith<$Res> get customMessageDetails {
    return $CustomMessageDetailsCopyWith<$Res>(_self.customMessageDetails,
        (value) {
      return _then(_self.copyWith(customMessageDetails: value));
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
      {@JsonKey(name: "MessageCode") required this.messageCode,
      @JsonKey(name: "MessageType") required this.messageType,
      @JsonKey(name: "MessageHeader") required this.messageHeader,
      @JsonKey(name: "MessageDescription") required this.messageDescription});
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
  @JsonKey(name: "CurrencyRateList")
  List<CurrencyRateList> get currencyRateList;

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
                .equals(other.currencyRateList, currencyRateList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currencyRateList));

  @override
  String toString() {
    return 'Data(currencyRateList: $currencyRateList)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "CurrencyRateList")
      List<CurrencyRateList> currencyRateList});
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
    Object? currencyRateList = null,
  }) {
    return _then(_self.copyWith(
      currencyRateList: null == currencyRateList
          ? _self.currencyRateList
          : currencyRateList // ignore: cast_nullable_to_non_nullable
              as List<CurrencyRateList>,
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
            @JsonKey(name: "CurrencyRateList")
            List<CurrencyRateList> currencyRateList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(_that.currencyRateList);
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
            @JsonKey(name: "CurrencyRateList")
            List<CurrencyRateList> currencyRateList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(_that.currencyRateList);
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
            @JsonKey(name: "CurrencyRateList")
            List<CurrencyRateList> currencyRateList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(_that.currencyRateList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: "CurrencyRateList")
      required final List<CurrencyRateList> currencyRateList})
      : _currencyRateList = currencyRateList;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<CurrencyRateList> _currencyRateList;
  @override
  @JsonKey(name: "CurrencyRateList")
  List<CurrencyRateList> get currencyRateList {
    if (_currencyRateList is EqualUnmodifiableListView)
      return _currencyRateList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencyRateList);
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
            const DeepCollectionEquality()
                .equals(other._currencyRateList, _currencyRateList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_currencyRateList));

  @override
  String toString() {
    return 'Data(currencyRateList: $currencyRateList)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "CurrencyRateList")
      List<CurrencyRateList> currencyRateList});
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
    Object? currencyRateList = null,
  }) {
    return _then(_Data(
      currencyRateList: null == currencyRateList
          ? _self._currencyRateList
          : currencyRateList // ignore: cast_nullable_to_non_nullable
              as List<CurrencyRateList>,
    ));
  }
}

/// @nodoc
mixin _$CurrencyRateList {
  @JsonKey(name: "CurrencyCode")
  String get currencyCode;
  @JsonKey(name: "Currency")
  String get currency;
  @JsonKey(name: "CashRateBuy")
  double get cashRateBuy;
  @JsonKey(name: "CashRateSell")
  double get cashRateSell;
  @JsonKey(name: "TransferRateSell")
  double get transferRateSell;
  @JsonKey(name: "CurrencyFlagPath")
  dynamic get currencyFlagPath;

  /// Create a copy of CurrencyRateList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrencyRateListCopyWith<CurrencyRateList> get copyWith =>
      _$CurrencyRateListCopyWithImpl<CurrencyRateList>(
          this as CurrencyRateList, _$identity);

  /// Serializes this CurrencyRateList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurrencyRateList &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.cashRateBuy, cashRateBuy) ||
                other.cashRateBuy == cashRateBuy) &&
            (identical(other.cashRateSell, cashRateSell) ||
                other.cashRateSell == cashRateSell) &&
            (identical(other.transferRateSell, transferRateSell) ||
                other.transferRateSell == transferRateSell) &&
            const DeepCollectionEquality()
                .equals(other.currencyFlagPath, currencyFlagPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currencyCode,
      currency,
      cashRateBuy,
      cashRateSell,
      transferRateSell,
      const DeepCollectionEquality().hash(currencyFlagPath));

  @override
  String toString() {
    return 'CurrencyRateList(currencyCode: $currencyCode, currency: $currency, cashRateBuy: $cashRateBuy, cashRateSell: $cashRateSell, transferRateSell: $transferRateSell, currencyFlagPath: $currencyFlagPath)';
  }
}

/// @nodoc
abstract mixin class $CurrencyRateListCopyWith<$Res> {
  factory $CurrencyRateListCopyWith(
          CurrencyRateList value, $Res Function(CurrencyRateList) _then) =
      _$CurrencyRateListCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "CurrencyCode") String currencyCode,
      @JsonKey(name: "Currency") String currency,
      @JsonKey(name: "CashRateBuy") double cashRateBuy,
      @JsonKey(name: "CashRateSell") double cashRateSell,
      @JsonKey(name: "TransferRateSell") double transferRateSell,
      @JsonKey(name: "CurrencyFlagPath") dynamic currencyFlagPath});
}

/// @nodoc
class _$CurrencyRateListCopyWithImpl<$Res>
    implements $CurrencyRateListCopyWith<$Res> {
  _$CurrencyRateListCopyWithImpl(this._self, this._then);

  final CurrencyRateList _self;
  final $Res Function(CurrencyRateList) _then;

  /// Create a copy of CurrencyRateList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyCode = null,
    Object? currency = null,
    Object? cashRateBuy = null,
    Object? cashRateSell = null,
    Object? transferRateSell = null,
    Object? currencyFlagPath = freezed,
  }) {
    return _then(_self.copyWith(
      currencyCode: null == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      cashRateBuy: null == cashRateBuy
          ? _self.cashRateBuy
          : cashRateBuy // ignore: cast_nullable_to_non_nullable
              as double,
      cashRateSell: null == cashRateSell
          ? _self.cashRateSell
          : cashRateSell // ignore: cast_nullable_to_non_nullable
              as double,
      transferRateSell: null == transferRateSell
          ? _self.transferRateSell
          : transferRateSell // ignore: cast_nullable_to_non_nullable
              as double,
      currencyFlagPath: freezed == currencyFlagPath
          ? _self.currencyFlagPath
          : currencyFlagPath // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [CurrencyRateList].
extension CurrencyRateListPatterns on CurrencyRateList {
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
    TResult Function(_CurrencyRateList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurrencyRateList() when $default != null:
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
    TResult Function(_CurrencyRateList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencyRateList():
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
    TResult? Function(_CurrencyRateList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencyRateList() when $default != null:
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
            @JsonKey(name: "CurrencyCode") String currencyCode,
            @JsonKey(name: "Currency") String currency,
            @JsonKey(name: "CashRateBuy") double cashRateBuy,
            @JsonKey(name: "CashRateSell") double cashRateSell,
            @JsonKey(name: "TransferRateSell") double transferRateSell,
            @JsonKey(name: "CurrencyFlagPath") dynamic currencyFlagPath)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurrencyRateList() when $default != null:
        return $default(_that.currencyCode, _that.currency, _that.cashRateBuy,
            _that.cashRateSell, _that.transferRateSell, _that.currencyFlagPath);
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
            @JsonKey(name: "CurrencyCode") String currencyCode,
            @JsonKey(name: "Currency") String currency,
            @JsonKey(name: "CashRateBuy") double cashRateBuy,
            @JsonKey(name: "CashRateSell") double cashRateSell,
            @JsonKey(name: "TransferRateSell") double transferRateSell,
            @JsonKey(name: "CurrencyFlagPath") dynamic currencyFlagPath)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencyRateList():
        return $default(_that.currencyCode, _that.currency, _that.cashRateBuy,
            _that.cashRateSell, _that.transferRateSell, _that.currencyFlagPath);
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
            @JsonKey(name: "CurrencyCode") String currencyCode,
            @JsonKey(name: "Currency") String currency,
            @JsonKey(name: "CashRateBuy") double cashRateBuy,
            @JsonKey(name: "CashRateSell") double cashRateSell,
            @JsonKey(name: "TransferRateSell") double transferRateSell,
            @JsonKey(name: "CurrencyFlagPath") dynamic currencyFlagPath)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurrencyRateList() when $default != null:
        return $default(_that.currencyCode, _that.currency, _that.cashRateBuy,
            _that.cashRateSell, _that.transferRateSell, _that.currencyFlagPath);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CurrencyRateList implements CurrencyRateList {
  const _CurrencyRateList(
      {@JsonKey(name: "CurrencyCode") required this.currencyCode,
      @JsonKey(name: "Currency") required this.currency,
      @JsonKey(name: "CashRateBuy") required this.cashRateBuy,
      @JsonKey(name: "CashRateSell") required this.cashRateSell,
      @JsonKey(name: "TransferRateSell") required this.transferRateSell,
      @JsonKey(name: "CurrencyFlagPath") required this.currencyFlagPath});
  factory _CurrencyRateList.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateListFromJson(json);

  @override
  @JsonKey(name: "CurrencyCode")
  final String currencyCode;
  @override
  @JsonKey(name: "Currency")
  final String currency;
  @override
  @JsonKey(name: "CashRateBuy")
  final double cashRateBuy;
  @override
  @JsonKey(name: "CashRateSell")
  final double cashRateSell;
  @override
  @JsonKey(name: "TransferRateSell")
  final double transferRateSell;
  @override
  @JsonKey(name: "CurrencyFlagPath")
  final dynamic currencyFlagPath;

  /// Create a copy of CurrencyRateList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrencyRateListCopyWith<_CurrencyRateList> get copyWith =>
      __$CurrencyRateListCopyWithImpl<_CurrencyRateList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurrencyRateListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrencyRateList &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.cashRateBuy, cashRateBuy) ||
                other.cashRateBuy == cashRateBuy) &&
            (identical(other.cashRateSell, cashRateSell) ||
                other.cashRateSell == cashRateSell) &&
            (identical(other.transferRateSell, transferRateSell) ||
                other.transferRateSell == transferRateSell) &&
            const DeepCollectionEquality()
                .equals(other.currencyFlagPath, currencyFlagPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currencyCode,
      currency,
      cashRateBuy,
      cashRateSell,
      transferRateSell,
      const DeepCollectionEquality().hash(currencyFlagPath));

  @override
  String toString() {
    return 'CurrencyRateList(currencyCode: $currencyCode, currency: $currency, cashRateBuy: $cashRateBuy, cashRateSell: $cashRateSell, transferRateSell: $transferRateSell, currencyFlagPath: $currencyFlagPath)';
  }
}

/// @nodoc
abstract mixin class _$CurrencyRateListCopyWith<$Res>
    implements $CurrencyRateListCopyWith<$Res> {
  factory _$CurrencyRateListCopyWith(
          _CurrencyRateList value, $Res Function(_CurrencyRateList) _then) =
      __$CurrencyRateListCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "CurrencyCode") String currencyCode,
      @JsonKey(name: "Currency") String currency,
      @JsonKey(name: "CashRateBuy") double cashRateBuy,
      @JsonKey(name: "CashRateSell") double cashRateSell,
      @JsonKey(name: "TransferRateSell") double transferRateSell,
      @JsonKey(name: "CurrencyFlagPath") dynamic currencyFlagPath});
}

/// @nodoc
class __$CurrencyRateListCopyWithImpl<$Res>
    implements _$CurrencyRateListCopyWith<$Res> {
  __$CurrencyRateListCopyWithImpl(this._self, this._then);

  final _CurrencyRateList _self;
  final $Res Function(_CurrencyRateList) _then;

  /// Create a copy of CurrencyRateList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currencyCode = null,
    Object? currency = null,
    Object? cashRateBuy = null,
    Object? cashRateSell = null,
    Object? transferRateSell = null,
    Object? currencyFlagPath = freezed,
  }) {
    return _then(_CurrencyRateList(
      currencyCode: null == currencyCode
          ? _self.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      cashRateBuy: null == cashRateBuy
          ? _self.cashRateBuy
          : cashRateBuy // ignore: cast_nullable_to_non_nullable
              as double,
      cashRateSell: null == cashRateSell
          ? _self.cashRateSell
          : cashRateSell // ignore: cast_nullable_to_non_nullable
              as double,
      transferRateSell: null == transferRateSell
          ? _self.transferRateSell
          : transferRateSell // ignore: cast_nullable_to_non_nullable
              as double,
      currencyFlagPath: freezed == currencyFlagPath
          ? _self.currencyFlagPath
          : currencyFlagPath // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
