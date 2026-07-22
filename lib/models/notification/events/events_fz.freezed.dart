// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventsFZ {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'EventType')
  List<EventType> get eventType;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of EventsFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventsFZCopyWith<EventsFZ> get copyWith =>
      _$EventsFZCopyWithImpl<EventsFZ>(this as EventsFZ, _$identity);

  /// Serializes this EventsFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventsFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality().equals(other.eventType, eventType) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      const DeepCollectionEquality().hash(eventType), customMessageDetails);

  @override
  String toString() {
    return 'EventsFZ(statusCode: $statusCode, statusMessage: $statusMessage, eventType: $eventType, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $EventsFZCopyWith<$Res> {
  factory $EventsFZCopyWith(EventsFZ value, $Res Function(EventsFZ) _then) =
      _$EventsFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'EventType') List<EventType> eventType,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$EventsFZCopyWithImpl<$Res> implements $EventsFZCopyWith<$Res> {
  _$EventsFZCopyWithImpl(this._self, this._then);

  final EventsFZ _self;
  final $Res Function(EventsFZ) _then;

  /// Create a copy of EventsFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? eventType = null,
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
      eventType: null == eventType
          ? _self.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as List<EventType>,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of EventsFZ
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

/// Adds pattern-matching-related methods to [EventsFZ].
extension EventsFZPatterns on EventsFZ {
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
    TResult Function(_EventsFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventsFZ() when $default != null:
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
    TResult Function(_EventsFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsFZ():
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
    TResult? Function(_EventsFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsFZ() when $default != null:
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
            @JsonKey(name: 'EventType') List<EventType> eventType,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventsFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.eventType,
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
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'EventType') List<EventType> eventType,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsFZ():
        return $default(_that.statusCode, _that.statusMessage, _that.eventType,
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
            @JsonKey(name: 'StatusCode') String statusCode,
            @JsonKey(name: 'StatusMessage') String statusMessage,
            @JsonKey(name: 'EventType') List<EventType> eventType,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventsFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.eventType,
            _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EventsFZ implements EventsFZ {
  const _EventsFZ(
      {@JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'EventType') final List<EventType> eventType = const [],
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails})
      : _eventType = eventType;
  factory _EventsFZ.fromJson(Map<String, dynamic> json) =>
      _$EventsFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String statusMessage;
  final List<EventType> _eventType;
  @override
  @JsonKey(name: 'EventType')
  List<EventType> get eventType {
    if (_eventType is EqualUnmodifiableListView) return _eventType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventType);
  }

  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of EventsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventsFZCopyWith<_EventsFZ> get copyWith =>
      __$EventsFZCopyWithImpl<_EventsFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventsFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventsFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            const DeepCollectionEquality()
                .equals(other._eventType, _eventType) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      const DeepCollectionEquality().hash(_eventType), customMessageDetails);

  @override
  String toString() {
    return 'EventsFZ(statusCode: $statusCode, statusMessage: $statusMessage, eventType: $eventType, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$EventsFZCopyWith<$Res>
    implements $EventsFZCopyWith<$Res> {
  factory _$EventsFZCopyWith(_EventsFZ value, $Res Function(_EventsFZ) _then) =
      __$EventsFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'EventType') List<EventType> eventType,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$EventsFZCopyWithImpl<$Res> implements _$EventsFZCopyWith<$Res> {
  __$EventsFZCopyWithImpl(this._self, this._then);

  final _EventsFZ _self;
  final $Res Function(_EventsFZ) _then;

  /// Create a copy of EventsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? eventType = null,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_EventsFZ(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _self._eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as List<EventType>,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of EventsFZ
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
  String get MessageCode;
  @JsonKey(name: 'MessageType')
  String get MessageType;
  @JsonKey(name: 'MessageHeader')
  String get MessageHeader;
  @JsonKey(name: 'MessageDescription')
  String get MessageDescription;

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
            (identical(other.MessageCode, MessageCode) ||
                other.MessageCode == MessageCode) &&
            (identical(other.MessageType, MessageType) ||
                other.MessageType == MessageType) &&
            (identical(other.MessageHeader, MessageHeader) ||
                other.MessageHeader == MessageHeader) &&
            (identical(other.MessageDescription, MessageDescription) ||
                other.MessageDescription == MessageDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, MessageCode, MessageType, MessageHeader, MessageDescription);

  @override
  String toString() {
    return 'CustomMessageDetails(MessageCode: $MessageCode, MessageType: $MessageType, MessageHeader: $MessageHeader, MessageDescription: $MessageDescription)';
  }
}

/// @nodoc
abstract mixin class $CustomMessageDetailsCopyWith<$Res> {
  factory $CustomMessageDetailsCopyWith(CustomMessageDetails value,
          $Res Function(CustomMessageDetails) _then) =
      _$CustomMessageDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'MessageCode') String MessageCode,
      @JsonKey(name: 'MessageType') String MessageType,
      @JsonKey(name: 'MessageHeader') String MessageHeader,
      @JsonKey(name: 'MessageDescription') String MessageDescription});
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
    Object? MessageCode = null,
    Object? MessageType = null,
    Object? MessageHeader = null,
    Object? MessageDescription = null,
  }) {
    return _then(_self.copyWith(
      MessageCode: null == MessageCode
          ? _self.MessageCode
          : MessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      MessageType: null == MessageType
          ? _self.MessageType
          : MessageType // ignore: cast_nullable_to_non_nullable
              as String,
      MessageHeader: null == MessageHeader
          ? _self.MessageHeader
          : MessageHeader // ignore: cast_nullable_to_non_nullable
              as String,
      MessageDescription: null == MessageDescription
          ? _self.MessageDescription
          : MessageDescription // ignore: cast_nullable_to_non_nullable
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
            @JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageType') String MessageType,
            @JsonKey(name: 'MessageHeader') String MessageHeader,
            @JsonKey(name: 'MessageDescription') String MessageDescription)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails() when $default != null:
        return $default(_that.MessageCode, _that.MessageType,
            _that.MessageHeader, _that.MessageDescription);
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
            @JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageType') String MessageType,
            @JsonKey(name: 'MessageHeader') String MessageHeader,
            @JsonKey(name: 'MessageDescription') String MessageDescription)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails():
        return $default(_that.MessageCode, _that.MessageType,
            _that.MessageHeader, _that.MessageDescription);
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
            @JsonKey(name: 'MessageCode') String MessageCode,
            @JsonKey(name: 'MessageType') String MessageType,
            @JsonKey(name: 'MessageHeader') String MessageHeader,
            @JsonKey(name: 'MessageDescription') String MessageDescription)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomMessageDetails() when $default != null:
        return $default(_that.MessageCode, _that.MessageType,
            _that.MessageHeader, _that.MessageDescription);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomMessageDetails implements CustomMessageDetails {
  const _CustomMessageDetails(
      {@JsonKey(name: 'MessageCode') this.MessageCode = '',
      @JsonKey(name: 'MessageType') this.MessageType = '',
      @JsonKey(name: 'MessageHeader') this.MessageHeader = '',
      @JsonKey(name: 'MessageDescription') this.MessageDescription = ''});
  factory _CustomMessageDetails.fromJson(Map<String, dynamic> json) =>
      _$CustomMessageDetailsFromJson(json);

  @override
  @JsonKey(name: 'MessageCode')
  final String MessageCode;
  @override
  @JsonKey(name: 'MessageType')
  final String MessageType;
  @override
  @JsonKey(name: 'MessageHeader')
  final String MessageHeader;
  @override
  @JsonKey(name: 'MessageDescription')
  final String MessageDescription;

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
            (identical(other.MessageCode, MessageCode) ||
                other.MessageCode == MessageCode) &&
            (identical(other.MessageType, MessageType) ||
                other.MessageType == MessageType) &&
            (identical(other.MessageHeader, MessageHeader) ||
                other.MessageHeader == MessageHeader) &&
            (identical(other.MessageDescription, MessageDescription) ||
                other.MessageDescription == MessageDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, MessageCode, MessageType, MessageHeader, MessageDescription);

  @override
  String toString() {
    return 'CustomMessageDetails(MessageCode: $MessageCode, MessageType: $MessageType, MessageHeader: $MessageHeader, MessageDescription: $MessageDescription)';
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
      {@JsonKey(name: 'MessageCode') String MessageCode,
      @JsonKey(name: 'MessageType') String MessageType,
      @JsonKey(name: 'MessageHeader') String MessageHeader,
      @JsonKey(name: 'MessageDescription') String MessageDescription});
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
    Object? MessageCode = null,
    Object? MessageType = null,
    Object? MessageHeader = null,
    Object? MessageDescription = null,
  }) {
    return _then(_CustomMessageDetails(
      MessageCode: null == MessageCode
          ? _self.MessageCode
          : MessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      MessageType: null == MessageType
          ? _self.MessageType
          : MessageType // ignore: cast_nullable_to_non_nullable
              as String,
      MessageHeader: null == MessageHeader
          ? _self.MessageHeader
          : MessageHeader // ignore: cast_nullable_to_non_nullable
              as String,
      MessageDescription: null == MessageDescription
          ? _self.MessageDescription
          : MessageDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$EventType {
  @JsonKey(name: 'Code')
  String get Code;
  @JsonKey(name: 'Description')
  String get Description;

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EventTypeCopyWith<EventType> get copyWith =>
      _$EventTypeCopyWithImpl<EventType>(this as EventType, _$identity);

  /// Serializes this EventType to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventType &&
            (identical(other.Code, Code) || other.Code == Code) &&
            (identical(other.Description, Description) ||
                other.Description == Description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Code, Description);

  @override
  String toString() {
    return 'EventType(Code: $Code, Description: $Description)';
  }
}

/// @nodoc
abstract mixin class $EventTypeCopyWith<$Res> {
  factory $EventTypeCopyWith(EventType value, $Res Function(EventType) _then) =
      _$EventTypeCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') String Code,
      @JsonKey(name: 'Description') String Description});
}

/// @nodoc
class _$EventTypeCopyWithImpl<$Res> implements $EventTypeCopyWith<$Res> {
  _$EventTypeCopyWithImpl(this._self, this._then);

  final EventType _self;
  final $Res Function(EventType) _then;

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Code = null,
    Object? Description = null,
  }) {
    return _then(_self.copyWith(
      Code: null == Code
          ? _self.Code
          : Code // ignore: cast_nullable_to_non_nullable
              as String,
      Description: null == Description
          ? _self.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [EventType].
extension EventTypePatterns on EventType {
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
    TResult Function(_EventType value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventType() when $default != null:
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
    TResult Function(_EventType value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventType():
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
    TResult? Function(_EventType value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventType() when $default != null:
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
    TResult Function(@JsonKey(name: 'Code') String Code,
            @JsonKey(name: 'Description') String Description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EventType() when $default != null:
        return $default(_that.Code, _that.Description);
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
    TResult Function(@JsonKey(name: 'Code') String Code,
            @JsonKey(name: 'Description') String Description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventType():
        return $default(_that.Code, _that.Description);
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
    TResult? Function(@JsonKey(name: 'Code') String Code,
            @JsonKey(name: 'Description') String Description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EventType() when $default != null:
        return $default(_that.Code, _that.Description);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EventType implements EventType {
  const _EventType(
      {@JsonKey(name: 'Code') this.Code = '',
      @JsonKey(name: 'Description') this.Description = ''});
  factory _EventType.fromJson(Map<String, dynamic> json) =>
      _$EventTypeFromJson(json);

  @override
  @JsonKey(name: 'Code')
  final String Code;
  @override
  @JsonKey(name: 'Description')
  final String Description;

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EventTypeCopyWith<_EventType> get copyWith =>
      __$EventTypeCopyWithImpl<_EventType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EventTypeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EventType &&
            (identical(other.Code, Code) || other.Code == Code) &&
            (identical(other.Description, Description) ||
                other.Description == Description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, Code, Description);

  @override
  String toString() {
    return 'EventType(Code: $Code, Description: $Description)';
  }
}

/// @nodoc
abstract mixin class _$EventTypeCopyWith<$Res>
    implements $EventTypeCopyWith<$Res> {
  factory _$EventTypeCopyWith(
          _EventType value, $Res Function(_EventType) _then) =
      __$EventTypeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') String Code,
      @JsonKey(name: 'Description') String Description});
}

/// @nodoc
class __$EventTypeCopyWithImpl<$Res> implements _$EventTypeCopyWith<$Res> {
  __$EventTypeCopyWithImpl(this._self, this._then);

  final _EventType _self;
  final $Res Function(_EventType) _then;

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? Code = null,
    Object? Description = null,
  }) {
    return _then(_EventType(
      Code: null == Code
          ? _self.Code
          : Code // ignore: cast_nullable_to_non_nullable
              as String,
      Description: null == Description
          ? _self.Description
          : Description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
