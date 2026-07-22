// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modules_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ModulesFZ {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetails? get customMessageDetails;
  @JsonKey(name: 'ModuleList')
  List<ModuleList> get moduleList;

  /// Create a copy of ModulesFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModulesFZCopyWith<ModulesFZ> get copyWith =>
      _$ModulesFZCopyWithImpl<ModulesFZ>(this as ModulesFZ, _$identity);

  /// Serializes this ModulesFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModulesFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            const DeepCollectionEquality()
                .equals(other.moduleList, moduleList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      customMessageDetails, const DeepCollectionEquality().hash(moduleList));

  @override
  String toString() {
    return 'ModulesFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, moduleList: $moduleList)';
  }
}

/// @nodoc
abstract mixin class $ModulesFZCopyWith<$Res> {
  factory $ModulesFZCopyWith(ModulesFZ value, $Res Function(ModulesFZ) _then) =
      _$ModulesFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails,
      @JsonKey(name: 'ModuleList') List<ModuleList> moduleList});

  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$ModulesFZCopyWithImpl<$Res> implements $ModulesFZCopyWith<$Res> {
  _$ModulesFZCopyWithImpl(this._self, this._then);

  final ModulesFZ _self;
  final $Res Function(ModulesFZ) _then;

  /// Create a copy of ModulesFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? moduleList = null,
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
      moduleList: null == moduleList
          ? _self.moduleList
          : moduleList // ignore: cast_nullable_to_non_nullable
              as List<ModuleList>,
    ));
  }

  /// Create a copy of ModulesFZ
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

/// Adds pattern-matching-related methods to [ModulesFZ].
extension ModulesFZPatterns on ModulesFZ {
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
    TResult Function(_ModulesFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModulesFZ() when $default != null:
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
    TResult Function(_ModulesFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModulesFZ():
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
    TResult? Function(_ModulesFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModulesFZ() when $default != null:
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
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: 'ModuleList') List<ModuleList> moduleList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModulesFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.moduleList);
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
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: 'ModuleList') List<ModuleList> moduleList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModulesFZ():
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.moduleList);
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
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: 'ModuleList') List<ModuleList> moduleList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModulesFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.customMessageDetails, _that.moduleList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ModulesFZ implements ModulesFZ {
  const _ModulesFZ(
      {@JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails,
      @JsonKey(name: 'ModuleList')
      final List<ModuleList> moduleList = const []})
      : _moduleList = moduleList;
  factory _ModulesFZ.fromJson(Map<String, dynamic> json) =>
      _$ModulesFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String statusMessage;
  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetails? customMessageDetails;
  final List<ModuleList> _moduleList;
  @override
  @JsonKey(name: 'ModuleList')
  List<ModuleList> get moduleList {
    if (_moduleList is EqualUnmodifiableListView) return _moduleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moduleList);
  }

  /// Create a copy of ModulesFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModulesFZCopyWith<_ModulesFZ> get copyWith =>
      __$ModulesFZCopyWithImpl<_ModulesFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ModulesFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModulesFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            const DeepCollectionEquality()
                .equals(other._moduleList, _moduleList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      customMessageDetails, const DeepCollectionEquality().hash(_moduleList));

  @override
  String toString() {
    return 'ModulesFZ(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, moduleList: $moduleList)';
  }
}

/// @nodoc
abstract mixin class _$ModulesFZCopyWith<$Res>
    implements $ModulesFZCopyWith<$Res> {
  factory _$ModulesFZCopyWith(
          _ModulesFZ value, $Res Function(_ModulesFZ) _then) =
      __$ModulesFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails,
      @JsonKey(name: 'ModuleList') List<ModuleList> moduleList});

  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$ModulesFZCopyWithImpl<$Res> implements _$ModulesFZCopyWith<$Res> {
  __$ModulesFZCopyWithImpl(this._self, this._then);

  final _ModulesFZ _self;
  final $Res Function(_ModulesFZ) _then;

  /// Create a copy of ModulesFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? customMessageDetails = freezed,
    Object? moduleList = null,
  }) {
    return _then(_ModulesFZ(
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
      moduleList: null == moduleList
          ? _self._moduleList
          : moduleList // ignore: cast_nullable_to_non_nullable
              as List<ModuleList>,
    ));
  }

  /// Create a copy of ModulesFZ
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
mixin _$ModuleList {
  @JsonKey(name: 'ModuleCode')
  String get ModuleCode;
  @JsonKey(name: 'ModuleName')
  String get ModuleName;
  @JsonKey(name: 'Status')
  String get Status;

  /// Create a copy of ModuleList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ModuleListCopyWith<ModuleList> get copyWith =>
      _$ModuleListCopyWithImpl<ModuleList>(this as ModuleList, _$identity);

  /// Serializes this ModuleList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ModuleList &&
            (identical(other.ModuleCode, ModuleCode) ||
                other.ModuleCode == ModuleCode) &&
            (identical(other.ModuleName, ModuleName) ||
                other.ModuleName == ModuleName) &&
            (identical(other.Status, Status) || other.Status == Status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ModuleCode, ModuleName, Status);

  @override
  String toString() {
    return 'ModuleList(ModuleCode: $ModuleCode, ModuleName: $ModuleName, Status: $Status)';
  }
}

/// @nodoc
abstract mixin class $ModuleListCopyWith<$Res> {
  factory $ModuleListCopyWith(
          ModuleList value, $Res Function(ModuleList) _then) =
      _$ModuleListCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'ModuleCode') String ModuleCode,
      @JsonKey(name: 'ModuleName') String ModuleName,
      @JsonKey(name: 'Status') String Status});
}

/// @nodoc
class _$ModuleListCopyWithImpl<$Res> implements $ModuleListCopyWith<$Res> {
  _$ModuleListCopyWithImpl(this._self, this._then);

  final ModuleList _self;
  final $Res Function(ModuleList) _then;

  /// Create a copy of ModuleList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ModuleCode = null,
    Object? ModuleName = null,
    Object? Status = null,
  }) {
    return _then(_self.copyWith(
      ModuleCode: null == ModuleCode
          ? _self.ModuleCode
          : ModuleCode // ignore: cast_nullable_to_non_nullable
              as String,
      ModuleName: null == ModuleName
          ? _self.ModuleName
          : ModuleName // ignore: cast_nullable_to_non_nullable
              as String,
      Status: null == Status
          ? _self.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ModuleList].
extension ModuleListPatterns on ModuleList {
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
    TResult Function(_ModuleList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModuleList() when $default != null:
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
    TResult Function(_ModuleList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModuleList():
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
    TResult? Function(_ModuleList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModuleList() when $default != null:
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
            @JsonKey(name: 'ModuleCode') String ModuleCode,
            @JsonKey(name: 'ModuleName') String ModuleName,
            @JsonKey(name: 'Status') String Status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ModuleList() when $default != null:
        return $default(_that.ModuleCode, _that.ModuleName, _that.Status);
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
            @JsonKey(name: 'ModuleCode') String ModuleCode,
            @JsonKey(name: 'ModuleName') String ModuleName,
            @JsonKey(name: 'Status') String Status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModuleList():
        return $default(_that.ModuleCode, _that.ModuleName, _that.Status);
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
            @JsonKey(name: 'ModuleCode') String ModuleCode,
            @JsonKey(name: 'ModuleName') String ModuleName,
            @JsonKey(name: 'Status') String Status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ModuleList() when $default != null:
        return $default(_that.ModuleCode, _that.ModuleName, _that.Status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ModuleList implements ModuleList {
  const _ModuleList(
      {@JsonKey(name: 'ModuleCode') this.ModuleCode = '',
      @JsonKey(name: 'ModuleName') this.ModuleName = '',
      @JsonKey(name: 'Status') this.Status = ''});
  factory _ModuleList.fromJson(Map<String, dynamic> json) =>
      _$ModuleListFromJson(json);

  @override
  @JsonKey(name: 'ModuleCode')
  final String ModuleCode;
  @override
  @JsonKey(name: 'ModuleName')
  final String ModuleName;
  @override
  @JsonKey(name: 'Status')
  final String Status;

  /// Create a copy of ModuleList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ModuleListCopyWith<_ModuleList> get copyWith =>
      __$ModuleListCopyWithImpl<_ModuleList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ModuleListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ModuleList &&
            (identical(other.ModuleCode, ModuleCode) ||
                other.ModuleCode == ModuleCode) &&
            (identical(other.ModuleName, ModuleName) ||
                other.ModuleName == ModuleName) &&
            (identical(other.Status, Status) || other.Status == Status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ModuleCode, ModuleName, Status);

  @override
  String toString() {
    return 'ModuleList(ModuleCode: $ModuleCode, ModuleName: $ModuleName, Status: $Status)';
  }
}

/// @nodoc
abstract mixin class _$ModuleListCopyWith<$Res>
    implements $ModuleListCopyWith<$Res> {
  factory _$ModuleListCopyWith(
          _ModuleList value, $Res Function(_ModuleList) _then) =
      __$ModuleListCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ModuleCode') String ModuleCode,
      @JsonKey(name: 'ModuleName') String ModuleName,
      @JsonKey(name: 'Status') String Status});
}

/// @nodoc
class __$ModuleListCopyWithImpl<$Res> implements _$ModuleListCopyWith<$Res> {
  __$ModuleListCopyWithImpl(this._self, this._then);

  final _ModuleList _self;
  final $Res Function(_ModuleList) _then;

  /// Create a copy of ModuleList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ModuleCode = null,
    Object? ModuleName = null,
    Object? Status = null,
  }) {
    return _then(_ModuleList(
      ModuleCode: null == ModuleCode
          ? _self.ModuleCode
          : ModuleCode // ignore: cast_nullable_to_non_nullable
              as String,
      ModuleName: null == ModuleName
          ? _self.ModuleName
          : ModuleName // ignore: cast_nullable_to_non_nullable
              as String,
      Status: null == Status
          ? _self.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
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

// dart format on
