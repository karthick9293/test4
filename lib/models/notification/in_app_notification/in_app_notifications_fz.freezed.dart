// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'in_app_notifications_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InAppNotificationsFZ {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'NotificationsList')
  List<NotificationFz> get notificationsList;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of InAppNotificationsFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InAppNotificationsFZCopyWith<InAppNotificationsFZ> get copyWith =>
      _$InAppNotificationsFZCopyWithImpl<InAppNotificationsFZ>(
          this as InAppNotificationsFZ, _$identity);

  /// Serializes this InAppNotificationsFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InAppNotificationsFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality()
                .equals(other.notificationsList, notificationsList) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      const DeepCollectionEquality().hash(notificationsList),
      customMessageDetails);

  @override
  String toString() {
    return 'InAppNotificationsFZ(statusCode: $statusCode, statusMessage: $statusMessage, notificationsList: $notificationsList, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $InAppNotificationsFZCopyWith<$Res> {
  factory $InAppNotificationsFZCopyWith(InAppNotificationsFZ value,
          $Res Function(InAppNotificationsFZ) _then) =
      _$InAppNotificationsFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'NotificationsList')
      List<NotificationFz> notificationsList,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$InAppNotificationsFZCopyWithImpl<$Res>
    implements $InAppNotificationsFZCopyWith<$Res> {
  _$InAppNotificationsFZCopyWithImpl(this._self, this._then);

  final InAppNotificationsFZ _self;
  final $Res Function(InAppNotificationsFZ) _then;

  /// Create a copy of InAppNotificationsFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? notificationsList = null,
    Object? customMessageDetails = freezed,
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
      notificationsList: null == notificationsList
          ? _self.notificationsList
          : notificationsList // ignore: cast_nullable_to_non_nullable
              as List<NotificationFz>,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of InAppNotificationsFZ
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

/// Adds pattern-matching-related methods to [InAppNotificationsFZ].
extension InAppNotificationsFZPatterns on InAppNotificationsFZ {
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
    TResult Function(_InAppNotificationsFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InAppNotificationsFZ() when $default != null:
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
    TResult Function(_InAppNotificationsFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InAppNotificationsFZ():
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
    TResult? Function(_InAppNotificationsFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InAppNotificationsFZ() when $default != null:
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
            @JsonKey(name: 'NotificationsList')
            List<NotificationFz> notificationsList,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InAppNotificationsFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.notificationsList, _that.customMessageDetails);
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
            @JsonKey(name: 'NotificationsList')
            List<NotificationFz> notificationsList,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InAppNotificationsFZ():
        return $default(_that.statusCode, _that.statusMessage,
            _that.notificationsList, _that.customMessageDetails);
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
            @JsonKey(name: 'NotificationsList')
            List<NotificationFz> notificationsList,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InAppNotificationsFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.notificationsList, _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InAppNotificationsFZ implements InAppNotificationsFZ {
  const _InAppNotificationsFZ(
      {@JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'NotificationsList')
      final List<NotificationFz> notificationsList = const [],
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails})
      : _notificationsList = notificationsList;
  factory _InAppNotificationsFZ.fromJson(Map<String, dynamic> json) =>
      _$InAppNotificationsFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String statusMessage;
  final List<NotificationFz> _notificationsList;
  @override
  @JsonKey(name: 'NotificationsList')
  List<NotificationFz> get notificationsList {
    if (_notificationsList is EqualUnmodifiableListView)
      return _notificationsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationsList);
  }

  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of InAppNotificationsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InAppNotificationsFZCopyWith<_InAppNotificationsFZ> get copyWith =>
      __$InAppNotificationsFZCopyWithImpl<_InAppNotificationsFZ>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InAppNotificationsFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InAppNotificationsFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality()
                .equals(other._notificationsList, _notificationsList) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      const DeepCollectionEquality().hash(_notificationsList),
      customMessageDetails);

  @override
  String toString() {
    return 'InAppNotificationsFZ(statusCode: $statusCode, statusMessage: $statusMessage, notificationsList: $notificationsList, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$InAppNotificationsFZCopyWith<$Res>
    implements $InAppNotificationsFZCopyWith<$Res> {
  factory _$InAppNotificationsFZCopyWith(_InAppNotificationsFZ value,
          $Res Function(_InAppNotificationsFZ) _then) =
      __$InAppNotificationsFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'NotificationsList')
      List<NotificationFz> notificationsList,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$InAppNotificationsFZCopyWithImpl<$Res>
    implements _$InAppNotificationsFZCopyWith<$Res> {
  __$InAppNotificationsFZCopyWithImpl(this._self, this._then);

  final _InAppNotificationsFZ _self;
  final $Res Function(_InAppNotificationsFZ) _then;

  /// Create a copy of InAppNotificationsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? notificationsList = null,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_InAppNotificationsFZ(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsList: null == notificationsList
          ? _self._notificationsList
          : notificationsList // ignore: cast_nullable_to_non_nullable
              as List<NotificationFz>,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of InAppNotificationsFZ
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
      {@JsonKey(name: 'MessageCode') this.messageCode = '',
      @JsonKey(name: 'MessageType') this.messageType = '',
      @JsonKey(name: 'MessageHeader') this.messageHeader = '',
      @JsonKey(name: 'MessageDescription') this.messageDescription = ''});
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
mixin _$NotificationFz {
  @JsonKey(name: 'NotificationId')
  int get notificationId;
  @JsonKey(name: 'CreatedOn')
  String get createdOn;
  @JsonKey(name: 'Subject')
  String get subject;
  @JsonKey(name: 'MessageContent')
  String get messageContent;
  @JsonKey(name: 'CustomerCode')
  String get customerCode;
  @JsonKey(name: 'DeviceId')
  String get deviceId;
  @JsonKey(name: 'Status')
  String get status;

  /// Create a copy of NotificationFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationFzCopyWith<NotificationFz> get copyWith =>
      _$NotificationFzCopyWithImpl<NotificationFz>(
          this as NotificationFz, _$identity);

  /// Serializes this NotificationFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationFz &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.messageContent, messageContent) ||
                other.messageContent == messageContent) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notificationId, createdOn,
      subject, messageContent, customerCode, deviceId, status);

  @override
  String toString() {
    return 'NotificationFz(notificationId: $notificationId, createdOn: $createdOn, subject: $subject, messageContent: $messageContent, customerCode: $customerCode, deviceId: $deviceId, status: $status)';
  }
}

/// @nodoc
abstract mixin class $NotificationFzCopyWith<$Res> {
  factory $NotificationFzCopyWith(
          NotificationFz value, $Res Function(NotificationFz) _then) =
      _$NotificationFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'NotificationId') int notificationId,
      @JsonKey(name: 'CreatedOn') String createdOn,
      @JsonKey(name: 'Subject') String subject,
      @JsonKey(name: 'MessageContent') String messageContent,
      @JsonKey(name: 'CustomerCode') String customerCode,
      @JsonKey(name: 'DeviceId') String deviceId,
      @JsonKey(name: 'Status') String status});
}

/// @nodoc
class _$NotificationFzCopyWithImpl<$Res>
    implements $NotificationFzCopyWith<$Res> {
  _$NotificationFzCopyWithImpl(this._self, this._then);

  final NotificationFz _self;
  final $Res Function(NotificationFz) _then;

  /// Create a copy of NotificationFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? createdOn = null,
    Object? subject = null,
    Object? messageContent = null,
    Object? customerCode = null,
    Object? deviceId = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      notificationId: null == notificationId
          ? _self.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      createdOn: null == createdOn
          ? _self.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      messageContent: null == messageContent
          ? _self.messageContent
          : messageContent // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [NotificationFz].
extension NotificationFzPatterns on NotificationFz {
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
    TResult Function(_NotificationFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationFz() when $default != null:
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
    TResult Function(_NotificationFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationFz():
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
    TResult? Function(_NotificationFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationFz() when $default != null:
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
            @JsonKey(name: 'NotificationId') int notificationId,
            @JsonKey(name: 'CreatedOn') String createdOn,
            @JsonKey(name: 'Subject') String subject,
            @JsonKey(name: 'MessageContent') String messageContent,
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'DeviceId') String deviceId,
            @JsonKey(name: 'Status') String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NotificationFz() when $default != null:
        return $default(
            _that.notificationId,
            _that.createdOn,
            _that.subject,
            _that.messageContent,
            _that.customerCode,
            _that.deviceId,
            _that.status);
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
            @JsonKey(name: 'NotificationId') int notificationId,
            @JsonKey(name: 'CreatedOn') String createdOn,
            @JsonKey(name: 'Subject') String subject,
            @JsonKey(name: 'MessageContent') String messageContent,
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'DeviceId') String deviceId,
            @JsonKey(name: 'Status') String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationFz():
        return $default(
            _that.notificationId,
            _that.createdOn,
            _that.subject,
            _that.messageContent,
            _that.customerCode,
            _that.deviceId,
            _that.status);
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
            @JsonKey(name: 'NotificationId') int notificationId,
            @JsonKey(name: 'CreatedOn') String createdOn,
            @JsonKey(name: 'Subject') String subject,
            @JsonKey(name: 'MessageContent') String messageContent,
            @JsonKey(name: 'CustomerCode') String customerCode,
            @JsonKey(name: 'DeviceId') String deviceId,
            @JsonKey(name: 'Status') String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NotificationFz() when $default != null:
        return $default(
            _that.notificationId,
            _that.createdOn,
            _that.subject,
            _that.messageContent,
            _that.customerCode,
            _that.deviceId,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationFz implements NotificationFz {
  const _NotificationFz(
      {@JsonKey(name: 'NotificationId') this.notificationId = 0,
      @JsonKey(name: 'CreatedOn') this.createdOn = '',
      @JsonKey(name: 'Subject') this.subject = '',
      @JsonKey(name: 'MessageContent') this.messageContent = '',
      @JsonKey(name: 'CustomerCode') this.customerCode = '',
      @JsonKey(name: 'DeviceId') this.deviceId = '',
      @JsonKey(name: 'Status') this.status = ''});
  factory _NotificationFz.fromJson(Map<String, dynamic> json) =>
      _$NotificationFzFromJson(json);

  @override
  @JsonKey(name: 'NotificationId')
  final int notificationId;
  @override
  @JsonKey(name: 'CreatedOn')
  final String createdOn;
  @override
  @JsonKey(name: 'Subject')
  final String subject;
  @override
  @JsonKey(name: 'MessageContent')
  final String messageContent;
  @override
  @JsonKey(name: 'CustomerCode')
  final String customerCode;
  @override
  @JsonKey(name: 'DeviceId')
  final String deviceId;
  @override
  @JsonKey(name: 'Status')
  final String status;

  /// Create a copy of NotificationFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationFzCopyWith<_NotificationFz> get copyWith =>
      __$NotificationFzCopyWithImpl<_NotificationFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationFz &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.messageContent, messageContent) ||
                other.messageContent == messageContent) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notificationId, createdOn,
      subject, messageContent, customerCode, deviceId, status);

  @override
  String toString() {
    return 'NotificationFz(notificationId: $notificationId, createdOn: $createdOn, subject: $subject, messageContent: $messageContent, customerCode: $customerCode, deviceId: $deviceId, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$NotificationFzCopyWith<$Res>
    implements $NotificationFzCopyWith<$Res> {
  factory _$NotificationFzCopyWith(
          _NotificationFz value, $Res Function(_NotificationFz) _then) =
      __$NotificationFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'NotificationId') int notificationId,
      @JsonKey(name: 'CreatedOn') String createdOn,
      @JsonKey(name: 'Subject') String subject,
      @JsonKey(name: 'MessageContent') String messageContent,
      @JsonKey(name: 'CustomerCode') String customerCode,
      @JsonKey(name: 'DeviceId') String deviceId,
      @JsonKey(name: 'Status') String status});
}

/// @nodoc
class __$NotificationFzCopyWithImpl<$Res>
    implements _$NotificationFzCopyWith<$Res> {
  __$NotificationFzCopyWithImpl(this._self, this._then);

  final _NotificationFz _self;
  final $Res Function(_NotificationFz) _then;

  /// Create a copy of NotificationFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? notificationId = null,
    Object? createdOn = null,
    Object? subject = null,
    Object? messageContent = null,
    Object? customerCode = null,
    Object? deviceId = null,
    Object? status = null,
  }) {
    return _then(_NotificationFz(
      notificationId: null == notificationId
          ? _self.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      createdOn: null == createdOn
          ? _self.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _self.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      messageContent: null == messageContent
          ? _self.messageContent
          : messageContent // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: null == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _self.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
