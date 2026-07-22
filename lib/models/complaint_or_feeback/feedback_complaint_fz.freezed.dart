// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_complaint_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackComplaintFz {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetails get customMessageDetails;
  @JsonKey(name: 'Data')
  EnquiryData? get data;

  /// Create a copy of FeedbackComplaintFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FeedbackComplaintFzCopyWith<FeedbackComplaintFz> get copyWith =>
      _$FeedbackComplaintFzCopyWithImpl<FeedbackComplaintFz>(
          this as FeedbackComplaintFz, _$identity);

  /// Serializes this FeedbackComplaintFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FeedbackComplaintFz &&
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
    return 'FeedbackComplaintFz(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, data: $data)';
  }
}

/// @nodoc
abstract mixin class $FeedbackComplaintFzCopyWith<$Res> {
  factory $FeedbackComplaintFzCopyWith(
          FeedbackComplaintFz value, $Res Function(FeedbackComplaintFz) _then) =
      _$FeedbackComplaintFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails customMessageDetails,
      @JsonKey(name: 'Data') EnquiryData? data});

  $CustomMessageDetailsCopyWith<$Res> get customMessageDetails;
  $EnquiryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FeedbackComplaintFzCopyWithImpl<$Res>
    implements $FeedbackComplaintFzCopyWith<$Res> {
  _$FeedbackComplaintFzCopyWithImpl(this._self, this._then);

  final FeedbackComplaintFz _self;
  final $Res Function(FeedbackComplaintFz) _then;

  /// Create a copy of FeedbackComplaintFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = null,
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
      customMessageDetails: null == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as EnquiryData?,
    ));
  }

  /// Create a copy of FeedbackComplaintFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsCopyWith<$Res> get customMessageDetails {
    return $CustomMessageDetailsCopyWith<$Res>(_self.customMessageDetails,
        (value) {
      return _then(_self.copyWith(customMessageDetails: value));
    });
  }

  /// Create a copy of FeedbackComplaintFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EnquiryDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $EnquiryDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FeedbackComplaintFz].
extension FeedbackComplaintFzPatterns on FeedbackComplaintFz {
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
    TResult Function(_FeedbackComplaintFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedbackComplaintFz() when $default != null:
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
    TResult Function(_FeedbackComplaintFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackComplaintFz():
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
    TResult? Function(_FeedbackComplaintFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackComplaintFz() when $default != null:
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
            CustomMessageDetails customMessageDetails,
            @JsonKey(name: 'Data') EnquiryData? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FeedbackComplaintFz() when $default != null:
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
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails customMessageDetails,
            @JsonKey(name: 'Data') EnquiryData? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackComplaintFz():
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
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails customMessageDetails,
            @JsonKey(name: 'Data') EnquiryData? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FeedbackComplaintFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FeedbackComplaintFz implements FeedbackComplaintFz {
  const _FeedbackComplaintFz(
      {@JsonKey(name: 'StatusCode') required this.statusCode,
      @JsonKey(name: 'StatusMessage') required this.statusMessage,
      @JsonKey(name: 'CustomMessageDetails') required this.customMessageDetails,
      @JsonKey(name: 'Data') this.data});
  factory _FeedbackComplaintFz.fromJson(Map<String, dynamic> json) =>
      _$FeedbackComplaintFzFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String statusMessage;
  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetails customMessageDetails;
  @override
  @JsonKey(name: 'Data')
  final EnquiryData? data;

  /// Create a copy of FeedbackComplaintFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FeedbackComplaintFzCopyWith<_FeedbackComplaintFz> get copyWith =>
      __$FeedbackComplaintFzCopyWithImpl<_FeedbackComplaintFz>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FeedbackComplaintFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FeedbackComplaintFz &&
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
    return 'FeedbackComplaintFz(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$FeedbackComplaintFzCopyWith<$Res>
    implements $FeedbackComplaintFzCopyWith<$Res> {
  factory _$FeedbackComplaintFzCopyWith(_FeedbackComplaintFz value,
          $Res Function(_FeedbackComplaintFz) _then) =
      __$FeedbackComplaintFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails customMessageDetails,
      @JsonKey(name: 'Data') EnquiryData? data});

  @override
  $CustomMessageDetailsCopyWith<$Res> get customMessageDetails;
  @override
  $EnquiryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$FeedbackComplaintFzCopyWithImpl<$Res>
    implements _$FeedbackComplaintFzCopyWith<$Res> {
  __$FeedbackComplaintFzCopyWithImpl(this._self, this._then);

  final _FeedbackComplaintFz _self;
  final $Res Function(_FeedbackComplaintFz) _then;

  /// Create a copy of FeedbackComplaintFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = null,
    Object? data = freezed,
  }) {
    return _then(_FeedbackComplaintFz(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      customMessageDetails: null == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as EnquiryData?,
    ));
  }

  /// Create a copy of FeedbackComplaintFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomMessageDetailsCopyWith<$Res> get customMessageDetails {
    return $CustomMessageDetailsCopyWith<$Res>(_self.customMessageDetails,
        (value) {
      return _then(_self.copyWith(customMessageDetails: value));
    });
  }

  /// Create a copy of FeedbackComplaintFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EnquiryDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $EnquiryDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$CustomMessageDetails {
  @JsonKey(name: 'MessageCode')
  String get messageCode;
  @JsonKey(name: 'MessageType')
  String get messageType;
  @JsonKey(name: 'MessageHeader')
  String get messageHeader;
  @JsonKey(name: 'MessageDescription')
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
      {@JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageType') String messageType,
      @JsonKey(name: 'MessageHeader') String messageHeader,
      @JsonKey(name: 'MessageDescription') String messageDescription});
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
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageType') String messageType,
            @JsonKey(name: 'MessageHeader') String messageHeader,
            @JsonKey(name: 'MessageDescription') String messageDescription)?
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
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageType') String messageType,
            @JsonKey(name: 'MessageHeader') String messageHeader,
            @JsonKey(name: 'MessageDescription') String messageDescription)
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
            @JsonKey(name: 'MessageCode') String messageCode,
            @JsonKey(name: 'MessageType') String messageType,
            @JsonKey(name: 'MessageHeader') String messageHeader,
            @JsonKey(name: 'MessageDescription') String messageDescription)?
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
      {@JsonKey(name: 'MessageCode') required this.messageCode,
      @JsonKey(name: 'MessageType') required this.messageType,
      @JsonKey(name: 'MessageHeader') required this.messageHeader,
      @JsonKey(name: 'MessageDescription') required this.messageDescription});
  factory _CustomMessageDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageDetailsFromJson(json);

  @override
  @JsonKey(name: 'MessageCode')
  final String messageCode;
  @override
  @JsonKey(name: 'MessageType')
  final String messageType;
  @override
  @JsonKey(name: 'MessageHeader')
  final String messageHeader;
  @override
  @JsonKey(name: 'MessageDescription')
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
      {@JsonKey(name: 'MessageCode') String messageCode,
      @JsonKey(name: 'MessageType') String messageType,
      @JsonKey(name: 'MessageHeader') String messageHeader,
      @JsonKey(name: 'MessageDescription') String messageDescription});
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
mixin _$EnquiryData {
  @JsonKey(name: 'EnquiryCode')
  String get enquiryCode;

  /// Create a copy of EnquiryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnquiryDataCopyWith<EnquiryData> get copyWith =>
      _$EnquiryDataCopyWithImpl<EnquiryData>(this as EnquiryData, _$identity);

  /// Serializes this EnquiryData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnquiryData &&
            (identical(other.enquiryCode, enquiryCode) ||
                other.enquiryCode == enquiryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enquiryCode);

  @override
  String toString() {
    return 'EnquiryData(enquiryCode: $enquiryCode)';
  }
}

/// @nodoc
abstract mixin class $EnquiryDataCopyWith<$Res> {
  factory $EnquiryDataCopyWith(
          EnquiryData value, $Res Function(EnquiryData) _then) =
      _$EnquiryDataCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'EnquiryCode') String enquiryCode});
}

/// @nodoc
class _$EnquiryDataCopyWithImpl<$Res> implements $EnquiryDataCopyWith<$Res> {
  _$EnquiryDataCopyWithImpl(this._self, this._then);

  final EnquiryData _self;
  final $Res Function(EnquiryData) _then;

  /// Create a copy of EnquiryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enquiryCode = null,
  }) {
    return _then(_self.copyWith(
      enquiryCode: null == enquiryCode
          ? _self.enquiryCode
          : enquiryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [EnquiryData].
extension EnquiryDataPatterns on EnquiryData {
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
    TResult Function(_EnquiryData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnquiryData() when $default != null:
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
    TResult Function(_EnquiryData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryData():
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
    TResult? Function(_EnquiryData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryData() when $default != null:
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
    TResult Function(@JsonKey(name: 'EnquiryCode') String enquiryCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EnquiryData() when $default != null:
        return $default(_that.enquiryCode);
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
    TResult Function(@JsonKey(name: 'EnquiryCode') String enquiryCode) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryData():
        return $default(_that.enquiryCode);
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
    TResult? Function(@JsonKey(name: 'EnquiryCode') String enquiryCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EnquiryData() when $default != null:
        return $default(_that.enquiryCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EnquiryData implements EnquiryData {
  const _EnquiryData({@JsonKey(name: 'EnquiryCode') required this.enquiryCode});
  factory _EnquiryData.fromJson(Map<String, dynamic> json) =>
      _$EnquiryDataFromJson(json);

  @override
  @JsonKey(name: 'EnquiryCode')
  final String enquiryCode;

  /// Create a copy of EnquiryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnquiryDataCopyWith<_EnquiryData> get copyWith =>
      __$EnquiryDataCopyWithImpl<_EnquiryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnquiryDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnquiryData &&
            (identical(other.enquiryCode, enquiryCode) ||
                other.enquiryCode == enquiryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enquiryCode);

  @override
  String toString() {
    return 'EnquiryData(enquiryCode: $enquiryCode)';
  }
}

/// @nodoc
abstract mixin class _$EnquiryDataCopyWith<$Res>
    implements $EnquiryDataCopyWith<$Res> {
  factory _$EnquiryDataCopyWith(
          _EnquiryData value, $Res Function(_EnquiryData) _then) =
      __$EnquiryDataCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'EnquiryCode') String enquiryCode});
}

/// @nodoc
class __$EnquiryDataCopyWithImpl<$Res> implements _$EnquiryDataCopyWith<$Res> {
  __$EnquiryDataCopyWithImpl(this._self, this._then);

  final _EnquiryData _self;
  final $Res Function(_EnquiryData) _then;

  /// Create a copy of EnquiryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enquiryCode = null,
  }) {
    return _then(_EnquiryData(
      enquiryCode: null == enquiryCode
          ? _self.enquiryCode
          : enquiryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
