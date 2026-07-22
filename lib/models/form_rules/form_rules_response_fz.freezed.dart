// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_rules_response_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FormRulesResponseFZ {
  @JsonKey(name: 'StatusCode')
  String get statusCode;
  @JsonKey(name: 'StatusMessage')
  String get statusMessage;
  @JsonKey(name: 'Data')
  FormRulesData? get formRulesData;
  @JsonKey(name: 'CustomMessageDetails')
  CustomMessageDetails? get customMessageDetails;

  /// Create a copy of FormRulesResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormRulesResponseFZCopyWith<FormRulesResponseFZ> get copyWith =>
      _$FormRulesResponseFZCopyWithImpl<FormRulesResponseFZ>(
          this as FormRulesResponseFZ, _$identity);

  /// Serializes this FormRulesResponseFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormRulesResponseFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.formRulesData, formRulesData) ||
                other.formRulesData == formRulesData) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      formRulesData, customMessageDetails);

  @override
  String toString() {
    return 'FormRulesResponseFZ(statusCode: $statusCode, statusMessage: $statusMessage, formRulesData: $formRulesData, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class $FormRulesResponseFZCopyWith<$Res> {
  factory $FormRulesResponseFZCopyWith(
          FormRulesResponseFZ value, $Res Function(FormRulesResponseFZ) _then) =
      _$FormRulesResponseFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'Data') FormRulesData? formRulesData,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  $FormRulesDataCopyWith<$Res>? get formRulesData;
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$FormRulesResponseFZCopyWithImpl<$Res>
    implements $FormRulesResponseFZCopyWith<$Res> {
  _$FormRulesResponseFZCopyWithImpl(this._self, this._then);

  final FormRulesResponseFZ _self;
  final $Res Function(FormRulesResponseFZ) _then;

  /// Create a copy of FormRulesResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? formRulesData = freezed,
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
      formRulesData: freezed == formRulesData
          ? _self.formRulesData
          : formRulesData // ignore: cast_nullable_to_non_nullable
              as FormRulesData?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of FormRulesResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormRulesDataCopyWith<$Res>? get formRulesData {
    if (_self.formRulesData == null) {
      return null;
    }

    return $FormRulesDataCopyWith<$Res>(_self.formRulesData!, (value) {
      return _then(_self.copyWith(formRulesData: value));
    });
  }

  /// Create a copy of FormRulesResponseFZ
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

/// Adds pattern-matching-related methods to [FormRulesResponseFZ].
extension FormRulesResponseFZPatterns on FormRulesResponseFZ {
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
    TResult Function(_FormRulesResponseFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormRulesResponseFZ() when $default != null:
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
    TResult Function(_FormRulesResponseFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormRulesResponseFZ():
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
    TResult? Function(_FormRulesResponseFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormRulesResponseFZ() when $default != null:
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
            @JsonKey(name: 'Data') FormRulesData? formRulesData,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormRulesResponseFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.formRulesData, _that.customMessageDetails);
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
            @JsonKey(name: 'Data') FormRulesData? formRulesData,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormRulesResponseFZ():
        return $default(_that.statusCode, _that.statusMessage,
            _that.formRulesData, _that.customMessageDetails);
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
            @JsonKey(name: 'Data') FormRulesData? formRulesData,
            @JsonKey(name: 'CustomMessageDetails')
            CustomMessageDetails? customMessageDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormRulesResponseFZ() when $default != null:
        return $default(_that.statusCode, _that.statusMessage,
            _that.formRulesData, _that.customMessageDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FormRulesResponseFZ implements FormRulesResponseFZ {
  const _FormRulesResponseFZ(
      {@JsonKey(name: 'StatusCode') this.statusCode = '',
      @JsonKey(name: 'StatusMessage') this.statusMessage = '',
      @JsonKey(name: 'Data') this.formRulesData,
      @JsonKey(name: 'CustomMessageDetails') this.customMessageDetails});
  factory _FormRulesResponseFZ.fromJson(Map<String, dynamic> json) =>
      _$FormRulesResponseFZFromJson(json);

  @override
  @JsonKey(name: 'StatusCode')
  final String statusCode;
  @override
  @JsonKey(name: 'StatusMessage')
  final String statusMessage;
  @override
  @JsonKey(name: 'Data')
  final FormRulesData? formRulesData;
  @override
  @JsonKey(name: 'CustomMessageDetails')
  final CustomMessageDetails? customMessageDetails;

  /// Create a copy of FormRulesResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormRulesResponseFZCopyWith<_FormRulesResponseFZ> get copyWith =>
      __$FormRulesResponseFZCopyWithImpl<_FormRulesResponseFZ>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormRulesResponseFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormRulesResponseFZ &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.formRulesData, formRulesData) ||
                other.formRulesData == formRulesData) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage,
      formRulesData, customMessageDetails);

  @override
  String toString() {
    return 'FormRulesResponseFZ(statusCode: $statusCode, statusMessage: $statusMessage, formRulesData: $formRulesData, customMessageDetails: $customMessageDetails)';
  }
}

/// @nodoc
abstract mixin class _$FormRulesResponseFZCopyWith<$Res>
    implements $FormRulesResponseFZCopyWith<$Res> {
  factory _$FormRulesResponseFZCopyWith(_FormRulesResponseFZ value,
          $Res Function(_FormRulesResponseFZ) _then) =
      __$FormRulesResponseFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StatusCode') String statusCode,
      @JsonKey(name: 'StatusMessage') String statusMessage,
      @JsonKey(name: 'Data') FormRulesData? formRulesData,
      @JsonKey(name: 'CustomMessageDetails')
      CustomMessageDetails? customMessageDetails});

  @override
  $FormRulesDataCopyWith<$Res>? get formRulesData;
  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$FormRulesResponseFZCopyWithImpl<$Res>
    implements _$FormRulesResponseFZCopyWith<$Res> {
  __$FormRulesResponseFZCopyWithImpl(this._self, this._then);

  final _FormRulesResponseFZ _self;
  final $Res Function(_FormRulesResponseFZ) _then;

  /// Create a copy of FormRulesResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? formRulesData = freezed,
    Object? customMessageDetails = freezed,
  }) {
    return _then(_FormRulesResponseFZ(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      formRulesData: freezed == formRulesData
          ? _self.formRulesData
          : formRulesData // ignore: cast_nullable_to_non_nullable
              as FormRulesData?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
    ));
  }

  /// Create a copy of FormRulesResponseFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FormRulesDataCopyWith<$Res>? get formRulesData {
    if (_self.formRulesData == null) {
      return null;
    }

    return $FormRulesDataCopyWith<$Res>(_self.formRulesData!, (value) {
      return _then(_self.copyWith(formRulesData: value));
    });
  }

  /// Create a copy of FormRulesResponseFZ
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
mixin _$FormRulesData {
  @JsonKey(name: 'Rules')
  List<FormFieldItem> get formFieldItem;
  @JsonKey(name: 'CriteriaMap')
  String get criteriaMap;

  /// Create a copy of FormRulesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormRulesDataCopyWith<FormRulesData> get copyWith =>
      _$FormRulesDataCopyWithImpl<FormRulesData>(
          this as FormRulesData, _$identity);

  /// Serializes this FormRulesData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormRulesData &&
            const DeepCollectionEquality()
                .equals(other.formFieldItem, formFieldItem) &&
            (identical(other.criteriaMap, criteriaMap) ||
                other.criteriaMap == criteriaMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(formFieldItem), criteriaMap);

  @override
  String toString() {
    return 'FormRulesData(formFieldItem: $formFieldItem, criteriaMap: $criteriaMap)';
  }
}

/// @nodoc
abstract mixin class $FormRulesDataCopyWith<$Res> {
  factory $FormRulesDataCopyWith(
          FormRulesData value, $Res Function(FormRulesData) _then) =
      _$FormRulesDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Rules') List<FormFieldItem> formFieldItem,
      @JsonKey(name: 'CriteriaMap') String criteriaMap});
}

/// @nodoc
class _$FormRulesDataCopyWithImpl<$Res>
    implements $FormRulesDataCopyWith<$Res> {
  _$FormRulesDataCopyWithImpl(this._self, this._then);

  final FormRulesData _self;
  final $Res Function(FormRulesData) _then;

  /// Create a copy of FormRulesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formFieldItem = null,
    Object? criteriaMap = null,
  }) {
    return _then(_self.copyWith(
      formFieldItem: null == formFieldItem
          ? _self.formFieldItem
          : formFieldItem // ignore: cast_nullable_to_non_nullable
              as List<FormFieldItem>,
      criteriaMap: null == criteriaMap
          ? _self.criteriaMap
          : criteriaMap // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [FormRulesData].
extension FormRulesDataPatterns on FormRulesData {
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
    TResult Function(_FormRulesData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormRulesData() when $default != null:
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
    TResult Function(_FormRulesData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormRulesData():
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
    TResult? Function(_FormRulesData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormRulesData() when $default != null:
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
    TResult Function(@JsonKey(name: 'Rules') List<FormFieldItem> formFieldItem,
            @JsonKey(name: 'CriteriaMap') String criteriaMap)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormRulesData() when $default != null:
        return $default(_that.formFieldItem, _that.criteriaMap);
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
    TResult Function(@JsonKey(name: 'Rules') List<FormFieldItem> formFieldItem,
            @JsonKey(name: 'CriteriaMap') String criteriaMap)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormRulesData():
        return $default(_that.formFieldItem, _that.criteriaMap);
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
    TResult? Function(@JsonKey(name: 'Rules') List<FormFieldItem> formFieldItem,
            @JsonKey(name: 'CriteriaMap') String criteriaMap)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormRulesData() when $default != null:
        return $default(_that.formFieldItem, _that.criteriaMap);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FormRulesData implements FormRulesData {
  const _FormRulesData(
      {@JsonKey(name: 'Rules')
      final List<FormFieldItem> formFieldItem = const [],
      @JsonKey(name: 'CriteriaMap') this.criteriaMap = ''})
      : _formFieldItem = formFieldItem;
  factory _FormRulesData.fromJson(Map<String, dynamic> json) =>
      _$FormRulesDataFromJson(json);

  final List<FormFieldItem> _formFieldItem;
  @override
  @JsonKey(name: 'Rules')
  List<FormFieldItem> get formFieldItem {
    if (_formFieldItem is EqualUnmodifiableListView) return _formFieldItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formFieldItem);
  }

  @override
  @JsonKey(name: 'CriteriaMap')
  final String criteriaMap;

  /// Create a copy of FormRulesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormRulesDataCopyWith<_FormRulesData> get copyWith =>
      __$FormRulesDataCopyWithImpl<_FormRulesData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormRulesDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormRulesData &&
            const DeepCollectionEquality()
                .equals(other._formFieldItem, _formFieldItem) &&
            (identical(other.criteriaMap, criteriaMap) ||
                other.criteriaMap == criteriaMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_formFieldItem), criteriaMap);

  @override
  String toString() {
    return 'FormRulesData(formFieldItem: $formFieldItem, criteriaMap: $criteriaMap)';
  }
}

/// @nodoc
abstract mixin class _$FormRulesDataCopyWith<$Res>
    implements $FormRulesDataCopyWith<$Res> {
  factory _$FormRulesDataCopyWith(
          _FormRulesData value, $Res Function(_FormRulesData) _then) =
      __$FormRulesDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Rules') List<FormFieldItem> formFieldItem,
      @JsonKey(name: 'CriteriaMap') String criteriaMap});
}

/// @nodoc
class __$FormRulesDataCopyWithImpl<$Res>
    implements _$FormRulesDataCopyWith<$Res> {
  __$FormRulesDataCopyWithImpl(this._self, this._then);

  final _FormRulesData _self;
  final $Res Function(_FormRulesData) _then;

  /// Create a copy of FormRulesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formFieldItem = null,
    Object? criteriaMap = null,
  }) {
    return _then(_FormRulesData(
      formFieldItem: null == formFieldItem
          ? _self._formFieldItem
          : formFieldItem // ignore: cast_nullable_to_non_nullable
              as List<FormFieldItem>,
      criteriaMap: null == criteriaMap
          ? _self.criteriaMap
          : criteriaMap // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$FormFieldItem {
  @JsonKey(name: 'Id')
  int get Id;
  @JsonKey(name: 'LicenseCountry')
  String get LicenseCountry;
  @JsonKey(name: 'ClientCode')
  String get ClientCode;
  @JsonKey(name: 'ApplicationName')
  String get ApplicationName;
  @JsonKey(name: 'ModuleName')
  String get ModuleName;
  @JsonKey(name: 'FormName')
  String get FormName;
  @JsonKey(name: 'CriteriaId')
  String get CriteriaId;
  @JsonKey(name: 'CriteriaMap')
  String get CriteriaMap;
  @JsonKey(name: 'CriteriaMapSplit')
  String get CriteriaMapSplit;
  @JsonKey(name: 'RuleSelected')
  String get RuleSelected;
  @JsonKey(name: 'FieldId')
  String get FieldId;
  @JsonKey(name: 'FzParamName')
  String get FzParamName;
  @JsonKey(name: 'FzParamName2')
  String get FzParamName2;
  @JsonKey(name: 'IsMandatory')
  String get IsMandatory;
  @JsonKey(name: 'IsEnable')
  String get IsEnable;
  @JsonKey(name: 'IsVisible')
  String get IsVisible;
  @JsonKey(name: 'FieldDisplayName')
  String get FieldDisplayName;
  @JsonKey(name: 'FieldType')
  String get FieldTypeNew;
  @JsonKey(name: 'FieldDisplayOrder')
  String get FieldDisplayOrder;
  @JsonKey(name: 'Regex')
  String get Regex;
  @JsonKey(name: 'RegexMessage')
  String get RegexMessage;
  @JsonKey(name: 'DefaultValue')
  String get DefaultValue;
  @JsonKey(name: 'SetOptions')
  String get SetOptions;
  @JsonKey(name: 'Masking')
  String get Masking;
  @JsonKey(name: 'ApiKey')
  String get ApiKey;
  @JsonKey(name: 'ApiKey1')
  String get ApiKey1;
  @JsonKey(name: 'Block')
  String get Block;
  @JsonKey(name: 'BlockMessageCode')
  String get BlockMessageCode;
  @JsonKey(name: 'BlockMessageDescription')
  String get BlockMessageDescription;
  @JsonKey(name: 'Warning')
  String get Warning;
  @JsonKey(name: 'WarningMessageCode')
  String get WarningMessageCode;
  @JsonKey(name: 'WarningMessageDescription')
  String get WarningMessageDescription;
  @JsonKey(name: 'CheckDuplicate')
  String get CheckDuplicate;
  @JsonKey(name: 'DisplayInNewLine')
  String get DisplayInNewLine;
  @JsonKey(name: 'MinLength')
  String get MinLength;
  @JsonKey(name: 'MaxLength')
  String get MaxLength;
  @JsonKey(name: 'ValidValues')
  String get ValidValues;
  @JsonKey(name: 'DisplayValidValuesOnHover')
  String get DisplayValidValuesOnHover;
  @JsonKey(name: 'FormRuleCode')
  String get FormRuleCode;
  @JsonKey(name: 'FormRuleSubCode')
  String get FormRuleSubCode;
  @JsonKey(name: 'FormRuleDescription')
  String get FormRuleDescription;
  @JsonKey(name: 'DisplaySection')
  String get DisplaySection;
  @JsonKey(name: 'DisplaySectionOrder')
  String get DisplaySectionOrder;
  @JsonKey(name: 'Linked')
  String get Linked;
  @JsonKey(name: 'LinkedWith')
  String get LinkedWith;
  @JsonKey(name: 'CreatedBy')
  String get CreatedBy;
  @JsonKey(name: 'CreateDatetime')
  String get CreateDatetime;
  @JsonKey(name: 'UpdatedBy')
  String get UpdatedBy;
  @JsonKey(name: 'UpdateDatetime')
  String get UpdateDatetime;
  @JsonKey(name: 'Status')
  String get Status;
  @JsonKey(name: 'RuleSeq')
  String get RuleSeq;
  @JsonKey(name: 'Prefix')
  String get Prefix;
  @JsonKey(name: 'Suffix')
  String get Suffix;
  @JsonKey(name: 'CriteriaMapOrg')
  String get CriteriaMapOrg;

  /// Create a copy of FormFieldItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FormFieldItemCopyWith<FormFieldItem> get copyWith =>
      _$FormFieldItemCopyWithImpl<FormFieldItem>(
          this as FormFieldItem, _$identity);

  /// Serializes this FormFieldItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormFieldItem &&
            (identical(other.Id, Id) || other.Id == Id) &&
            (identical(other.LicenseCountry, LicenseCountry) ||
                other.LicenseCountry == LicenseCountry) &&
            (identical(other.ClientCode, ClientCode) ||
                other.ClientCode == ClientCode) &&
            (identical(other.ApplicationName, ApplicationName) ||
                other.ApplicationName == ApplicationName) &&
            (identical(other.ModuleName, ModuleName) ||
                other.ModuleName == ModuleName) &&
            (identical(other.FormName, FormName) ||
                other.FormName == FormName) &&
            (identical(other.CriteriaId, CriteriaId) ||
                other.CriteriaId == CriteriaId) &&
            (identical(other.CriteriaMap, CriteriaMap) ||
                other.CriteriaMap == CriteriaMap) &&
            (identical(other.CriteriaMapSplit, CriteriaMapSplit) ||
                other.CriteriaMapSplit == CriteriaMapSplit) &&
            (identical(other.RuleSelected, RuleSelected) ||
                other.RuleSelected == RuleSelected) &&
            (identical(other.FieldId, FieldId) || other.FieldId == FieldId) &&
            (identical(other.FzParamName, FzParamName) ||
                other.FzParamName == FzParamName) &&
            (identical(other.FzParamName2, FzParamName2) ||
                other.FzParamName2 == FzParamName2) &&
            (identical(other.IsMandatory, IsMandatory) ||
                other.IsMandatory == IsMandatory) &&
            (identical(other.IsEnable, IsEnable) ||
                other.IsEnable == IsEnable) &&
            (identical(other.IsVisible, IsVisible) ||
                other.IsVisible == IsVisible) &&
            (identical(other.FieldDisplayName, FieldDisplayName) ||
                other.FieldDisplayName == FieldDisplayName) &&
            (identical(other.FieldTypeNew, FieldTypeNew) ||
                other.FieldTypeNew == FieldTypeNew) &&
            (identical(other.FieldDisplayOrder, FieldDisplayOrder) ||
                other.FieldDisplayOrder == FieldDisplayOrder) &&
            (identical(other.Regex, Regex) || other.Regex == Regex) &&
            (identical(other.RegexMessage, RegexMessage) ||
                other.RegexMessage == RegexMessage) &&
            (identical(other.DefaultValue, DefaultValue) ||
                other.DefaultValue == DefaultValue) &&
            (identical(other.SetOptions, SetOptions) ||
                other.SetOptions == SetOptions) &&
            (identical(other.Masking, Masking) || other.Masking == Masking) &&
            (identical(other.ApiKey, ApiKey) || other.ApiKey == ApiKey) &&
            (identical(other.ApiKey1, ApiKey1) || other.ApiKey1 == ApiKey1) &&
            (identical(other.Block, Block) || other.Block == Block) &&
            (identical(other.BlockMessageCode, BlockMessageCode) ||
                other.BlockMessageCode == BlockMessageCode) &&
            (identical(other.BlockMessageDescription, BlockMessageDescription) ||
                other.BlockMessageDescription == BlockMessageDescription) &&
            (identical(other.Warning, Warning) || other.Warning == Warning) &&
            (identical(other.WarningMessageCode, WarningMessageCode) ||
                other.WarningMessageCode == WarningMessageCode) &&
            (identical(other.WarningMessageDescription, WarningMessageDescription) ||
                other.WarningMessageDescription == WarningMessageDescription) &&
            (identical(other.CheckDuplicate, CheckDuplicate) ||
                other.CheckDuplicate == CheckDuplicate) &&
            (identical(other.DisplayInNewLine, DisplayInNewLine) ||
                other.DisplayInNewLine == DisplayInNewLine) &&
            (identical(other.MinLength, MinLength) ||
                other.MinLength == MinLength) &&
            (identical(other.MaxLength, MaxLength) ||
                other.MaxLength == MaxLength) &&
            (identical(other.ValidValues, ValidValues) ||
                other.ValidValues == ValidValues) &&
            (identical(other.DisplayValidValuesOnHover, DisplayValidValuesOnHover) ||
                other.DisplayValidValuesOnHover == DisplayValidValuesOnHover) &&
            (identical(other.FormRuleCode, FormRuleCode) ||
                other.FormRuleCode == FormRuleCode) &&
            (identical(other.FormRuleSubCode, FormRuleSubCode) ||
                other.FormRuleSubCode == FormRuleSubCode) &&
            (identical(other.FormRuleDescription, FormRuleDescription) ||
                other.FormRuleDescription == FormRuleDescription) &&
            (identical(other.DisplaySection, DisplaySection) ||
                other.DisplaySection == DisplaySection) &&
            (identical(other.DisplaySectionOrder, DisplaySectionOrder) ||
                other.DisplaySectionOrder == DisplaySectionOrder) &&
            (identical(other.Linked, Linked) || other.Linked == Linked) &&
            (identical(other.LinkedWith, LinkedWith) ||
                other.LinkedWith == LinkedWith) &&
            (identical(other.CreatedBy, CreatedBy) ||
                other.CreatedBy == CreatedBy) &&
            (identical(other.CreateDatetime, CreateDatetime) ||
                other.CreateDatetime == CreateDatetime) &&
            (identical(other.UpdatedBy, UpdatedBy) || other.UpdatedBy == UpdatedBy) &&
            (identical(other.UpdateDatetime, UpdateDatetime) || other.UpdateDatetime == UpdateDatetime) &&
            (identical(other.Status, Status) || other.Status == Status) &&
            (identical(other.RuleSeq, RuleSeq) || other.RuleSeq == RuleSeq) &&
            (identical(other.Prefix, Prefix) || other.Prefix == Prefix) &&
            (identical(other.Suffix, Suffix) || other.Suffix == Suffix) &&
            (identical(other.CriteriaMapOrg, CriteriaMapOrg) || other.CriteriaMapOrg == CriteriaMapOrg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        Id,
        LicenseCountry,
        ClientCode,
        ApplicationName,
        ModuleName,
        FormName,
        CriteriaId,
        CriteriaMap,
        CriteriaMapSplit,
        RuleSelected,
        FieldId,
        FzParamName,
        FzParamName2,
        IsMandatory,
        IsEnable,
        IsVisible,
        FieldDisplayName,
        FieldTypeNew,
        FieldDisplayOrder,
        Regex,
        RegexMessage,
        DefaultValue,
        SetOptions,
        Masking,
        ApiKey,
        ApiKey1,
        Block,
        BlockMessageCode,
        BlockMessageDescription,
        Warning,
        WarningMessageCode,
        WarningMessageDescription,
        CheckDuplicate,
        DisplayInNewLine,
        MinLength,
        MaxLength,
        ValidValues,
        DisplayValidValuesOnHover,
        FormRuleCode,
        FormRuleSubCode,
        FormRuleDescription,
        DisplaySection,
        DisplaySectionOrder,
        Linked,
        LinkedWith,
        CreatedBy,
        CreateDatetime,
        UpdatedBy,
        UpdateDatetime,
        Status,
        RuleSeq,
        Prefix,
        Suffix,
        CriteriaMapOrg
      ]);

  @override
  String toString() {
    return 'FormFieldItem(Id: $Id, LicenseCountry: $LicenseCountry, ClientCode: $ClientCode, ApplicationName: $ApplicationName, ModuleName: $ModuleName, FormName: $FormName, CriteriaId: $CriteriaId, CriteriaMap: $CriteriaMap, CriteriaMapSplit: $CriteriaMapSplit, RuleSelected: $RuleSelected, FieldId: $FieldId, FzParamName: $FzParamName, FzParamName2: $FzParamName2, IsMandatory: $IsMandatory, IsEnable: $IsEnable, IsVisible: $IsVisible, FieldDisplayName: $FieldDisplayName, FieldTypeNew: $FieldTypeNew, FieldDisplayOrder: $FieldDisplayOrder, Regex: $Regex, RegexMessage: $RegexMessage, DefaultValue: $DefaultValue, SetOptions: $SetOptions, Masking: $Masking, ApiKey: $ApiKey, ApiKey1: $ApiKey1, Block: $Block, BlockMessageCode: $BlockMessageCode, BlockMessageDescription: $BlockMessageDescription, Warning: $Warning, WarningMessageCode: $WarningMessageCode, WarningMessageDescription: $WarningMessageDescription, CheckDuplicate: $CheckDuplicate, DisplayInNewLine: $DisplayInNewLine, MinLength: $MinLength, MaxLength: $MaxLength, ValidValues: $ValidValues, DisplayValidValuesOnHover: $DisplayValidValuesOnHover, FormRuleCode: $FormRuleCode, FormRuleSubCode: $FormRuleSubCode, FormRuleDescription: $FormRuleDescription, DisplaySection: $DisplaySection, DisplaySectionOrder: $DisplaySectionOrder, Linked: $Linked, LinkedWith: $LinkedWith, CreatedBy: $CreatedBy, CreateDatetime: $CreateDatetime, UpdatedBy: $UpdatedBy, UpdateDatetime: $UpdateDatetime, Status: $Status, RuleSeq: $RuleSeq, Prefix: $Prefix, Suffix: $Suffix, CriteriaMapOrg: $CriteriaMapOrg)';
  }
}

/// @nodoc
abstract mixin class $FormFieldItemCopyWith<$Res> {
  factory $FormFieldItemCopyWith(
          FormFieldItem value, $Res Function(FormFieldItem) _then) =
      _$FormFieldItemCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int Id,
      @JsonKey(name: 'LicenseCountry') String LicenseCountry,
      @JsonKey(name: 'ClientCode') String ClientCode,
      @JsonKey(name: 'ApplicationName') String ApplicationName,
      @JsonKey(name: 'ModuleName') String ModuleName,
      @JsonKey(name: 'FormName') String FormName,
      @JsonKey(name: 'CriteriaId') String CriteriaId,
      @JsonKey(name: 'CriteriaMap') String CriteriaMap,
      @JsonKey(name: 'CriteriaMapSplit') String CriteriaMapSplit,
      @JsonKey(name: 'RuleSelected') String RuleSelected,
      @JsonKey(name: 'FieldId') String FieldId,
      @JsonKey(name: 'FzParamName') String FzParamName,
      @JsonKey(name: 'FzParamName2') String FzParamName2,
      @JsonKey(name: 'IsMandatory') String IsMandatory,
      @JsonKey(name: 'IsEnable') String IsEnable,
      @JsonKey(name: 'IsVisible') String IsVisible,
      @JsonKey(name: 'FieldDisplayName') String FieldDisplayName,
      @JsonKey(name: 'FieldType') String FieldTypeNew,
      @JsonKey(name: 'FieldDisplayOrder') String FieldDisplayOrder,
      @JsonKey(name: 'Regex') String Regex,
      @JsonKey(name: 'RegexMessage') String RegexMessage,
      @JsonKey(name: 'DefaultValue') String DefaultValue,
      @JsonKey(name: 'SetOptions') String SetOptions,
      @JsonKey(name: 'Masking') String Masking,
      @JsonKey(name: 'ApiKey') String ApiKey,
      @JsonKey(name: 'ApiKey1') String ApiKey1,
      @JsonKey(name: 'Block') String Block,
      @JsonKey(name: 'BlockMessageCode') String BlockMessageCode,
      @JsonKey(name: 'BlockMessageDescription') String BlockMessageDescription,
      @JsonKey(name: 'Warning') String Warning,
      @JsonKey(name: 'WarningMessageCode') String WarningMessageCode,
      @JsonKey(name: 'WarningMessageDescription')
      String WarningMessageDescription,
      @JsonKey(name: 'CheckDuplicate') String CheckDuplicate,
      @JsonKey(name: 'DisplayInNewLine') String DisplayInNewLine,
      @JsonKey(name: 'MinLength') String MinLength,
      @JsonKey(name: 'MaxLength') String MaxLength,
      @JsonKey(name: 'ValidValues') String ValidValues,
      @JsonKey(name: 'DisplayValidValuesOnHover')
      String DisplayValidValuesOnHover,
      @JsonKey(name: 'FormRuleCode') String FormRuleCode,
      @JsonKey(name: 'FormRuleSubCode') String FormRuleSubCode,
      @JsonKey(name: 'FormRuleDescription') String FormRuleDescription,
      @JsonKey(name: 'DisplaySection') String DisplaySection,
      @JsonKey(name: 'DisplaySectionOrder') String DisplaySectionOrder,
      @JsonKey(name: 'Linked') String Linked,
      @JsonKey(name: 'LinkedWith') String LinkedWith,
      @JsonKey(name: 'CreatedBy') String CreatedBy,
      @JsonKey(name: 'CreateDatetime') String CreateDatetime,
      @JsonKey(name: 'UpdatedBy') String UpdatedBy,
      @JsonKey(name: 'UpdateDatetime') String UpdateDatetime,
      @JsonKey(name: 'Status') String Status,
      @JsonKey(name: 'RuleSeq') String RuleSeq,
      @JsonKey(name: 'Prefix') String Prefix,
      @JsonKey(name: 'Suffix') String Suffix,
      @JsonKey(name: 'CriteriaMapOrg') String CriteriaMapOrg});
}

/// @nodoc
class _$FormFieldItemCopyWithImpl<$Res>
    implements $FormFieldItemCopyWith<$Res> {
  _$FormFieldItemCopyWithImpl(this._self, this._then);

  final FormFieldItem _self;
  final $Res Function(FormFieldItem) _then;

  /// Create a copy of FormFieldItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Id = null,
    Object? LicenseCountry = null,
    Object? ClientCode = null,
    Object? ApplicationName = null,
    Object? ModuleName = null,
    Object? FormName = null,
    Object? CriteriaId = null,
    Object? CriteriaMap = null,
    Object? CriteriaMapSplit = null,
    Object? RuleSelected = null,
    Object? FieldId = null,
    Object? FzParamName = null,
    Object? FzParamName2 = null,
    Object? IsMandatory = null,
    Object? IsEnable = null,
    Object? IsVisible = null,
    Object? FieldDisplayName = null,
    Object? FieldTypeNew = null,
    Object? FieldDisplayOrder = null,
    Object? Regex = null,
    Object? RegexMessage = null,
    Object? DefaultValue = null,
    Object? SetOptions = null,
    Object? Masking = null,
    Object? ApiKey = null,
    Object? ApiKey1 = null,
    Object? Block = null,
    Object? BlockMessageCode = null,
    Object? BlockMessageDescription = null,
    Object? Warning = null,
    Object? WarningMessageCode = null,
    Object? WarningMessageDescription = null,
    Object? CheckDuplicate = null,
    Object? DisplayInNewLine = null,
    Object? MinLength = null,
    Object? MaxLength = null,
    Object? ValidValues = null,
    Object? DisplayValidValuesOnHover = null,
    Object? FormRuleCode = null,
    Object? FormRuleSubCode = null,
    Object? FormRuleDescription = null,
    Object? DisplaySection = null,
    Object? DisplaySectionOrder = null,
    Object? Linked = null,
    Object? LinkedWith = null,
    Object? CreatedBy = null,
    Object? CreateDatetime = null,
    Object? UpdatedBy = null,
    Object? UpdateDatetime = null,
    Object? Status = null,
    Object? RuleSeq = null,
    Object? Prefix = null,
    Object? Suffix = null,
    Object? CriteriaMapOrg = null,
  }) {
    return _then(_self.copyWith(
      Id: null == Id
          ? _self.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as int,
      LicenseCountry: null == LicenseCountry
          ? _self.LicenseCountry
          : LicenseCountry // ignore: cast_nullable_to_non_nullable
              as String,
      ClientCode: null == ClientCode
          ? _self.ClientCode
          : ClientCode // ignore: cast_nullable_to_non_nullable
              as String,
      ApplicationName: null == ApplicationName
          ? _self.ApplicationName
          : ApplicationName // ignore: cast_nullable_to_non_nullable
              as String,
      ModuleName: null == ModuleName
          ? _self.ModuleName
          : ModuleName // ignore: cast_nullable_to_non_nullable
              as String,
      FormName: null == FormName
          ? _self.FormName
          : FormName // ignore: cast_nullable_to_non_nullable
              as String,
      CriteriaId: null == CriteriaId
          ? _self.CriteriaId
          : CriteriaId // ignore: cast_nullable_to_non_nullable
              as String,
      CriteriaMap: null == CriteriaMap
          ? _self.CriteriaMap
          : CriteriaMap // ignore: cast_nullable_to_non_nullable
              as String,
      CriteriaMapSplit: null == CriteriaMapSplit
          ? _self.CriteriaMapSplit
          : CriteriaMapSplit // ignore: cast_nullable_to_non_nullable
              as String,
      RuleSelected: null == RuleSelected
          ? _self.RuleSelected
          : RuleSelected // ignore: cast_nullable_to_non_nullable
              as String,
      FieldId: null == FieldId
          ? _self.FieldId
          : FieldId // ignore: cast_nullable_to_non_nullable
              as String,
      FzParamName: null == FzParamName
          ? _self.FzParamName
          : FzParamName // ignore: cast_nullable_to_non_nullable
              as String,
      FzParamName2: null == FzParamName2
          ? _self.FzParamName2
          : FzParamName2 // ignore: cast_nullable_to_non_nullable
              as String,
      IsMandatory: null == IsMandatory
          ? _self.IsMandatory
          : IsMandatory // ignore: cast_nullable_to_non_nullable
              as String,
      IsEnable: null == IsEnable
          ? _self.IsEnable
          : IsEnable // ignore: cast_nullable_to_non_nullable
              as String,
      IsVisible: null == IsVisible
          ? _self.IsVisible
          : IsVisible // ignore: cast_nullable_to_non_nullable
              as String,
      FieldDisplayName: null == FieldDisplayName
          ? _self.FieldDisplayName
          : FieldDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      FieldTypeNew: null == FieldTypeNew
          ? _self.FieldTypeNew
          : FieldTypeNew // ignore: cast_nullable_to_non_nullable
              as String,
      FieldDisplayOrder: null == FieldDisplayOrder
          ? _self.FieldDisplayOrder
          : FieldDisplayOrder // ignore: cast_nullable_to_non_nullable
              as String,
      Regex: null == Regex
          ? _self.Regex
          : Regex // ignore: cast_nullable_to_non_nullable
              as String,
      RegexMessage: null == RegexMessage
          ? _self.RegexMessage
          : RegexMessage // ignore: cast_nullable_to_non_nullable
              as String,
      DefaultValue: null == DefaultValue
          ? _self.DefaultValue
          : DefaultValue // ignore: cast_nullable_to_non_nullable
              as String,
      SetOptions: null == SetOptions
          ? _self.SetOptions
          : SetOptions // ignore: cast_nullable_to_non_nullable
              as String,
      Masking: null == Masking
          ? _self.Masking
          : Masking // ignore: cast_nullable_to_non_nullable
              as String,
      ApiKey: null == ApiKey
          ? _self.ApiKey
          : ApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      ApiKey1: null == ApiKey1
          ? _self.ApiKey1
          : ApiKey1 // ignore: cast_nullable_to_non_nullable
              as String,
      Block: null == Block
          ? _self.Block
          : Block // ignore: cast_nullable_to_non_nullable
              as String,
      BlockMessageCode: null == BlockMessageCode
          ? _self.BlockMessageCode
          : BlockMessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      BlockMessageDescription: null == BlockMessageDescription
          ? _self.BlockMessageDescription
          : BlockMessageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      Warning: null == Warning
          ? _self.Warning
          : Warning // ignore: cast_nullable_to_non_nullable
              as String,
      WarningMessageCode: null == WarningMessageCode
          ? _self.WarningMessageCode
          : WarningMessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      WarningMessageDescription: null == WarningMessageDescription
          ? _self.WarningMessageDescription
          : WarningMessageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      CheckDuplicate: null == CheckDuplicate
          ? _self.CheckDuplicate
          : CheckDuplicate // ignore: cast_nullable_to_non_nullable
              as String,
      DisplayInNewLine: null == DisplayInNewLine
          ? _self.DisplayInNewLine
          : DisplayInNewLine // ignore: cast_nullable_to_non_nullable
              as String,
      MinLength: null == MinLength
          ? _self.MinLength
          : MinLength // ignore: cast_nullable_to_non_nullable
              as String,
      MaxLength: null == MaxLength
          ? _self.MaxLength
          : MaxLength // ignore: cast_nullable_to_non_nullable
              as String,
      ValidValues: null == ValidValues
          ? _self.ValidValues
          : ValidValues // ignore: cast_nullable_to_non_nullable
              as String,
      DisplayValidValuesOnHover: null == DisplayValidValuesOnHover
          ? _self.DisplayValidValuesOnHover
          : DisplayValidValuesOnHover // ignore: cast_nullable_to_non_nullable
              as String,
      FormRuleCode: null == FormRuleCode
          ? _self.FormRuleCode
          : FormRuleCode // ignore: cast_nullable_to_non_nullable
              as String,
      FormRuleSubCode: null == FormRuleSubCode
          ? _self.FormRuleSubCode
          : FormRuleSubCode // ignore: cast_nullable_to_non_nullable
              as String,
      FormRuleDescription: null == FormRuleDescription
          ? _self.FormRuleDescription
          : FormRuleDescription // ignore: cast_nullable_to_non_nullable
              as String,
      DisplaySection: null == DisplaySection
          ? _self.DisplaySection
          : DisplaySection // ignore: cast_nullable_to_non_nullable
              as String,
      DisplaySectionOrder: null == DisplaySectionOrder
          ? _self.DisplaySectionOrder
          : DisplaySectionOrder // ignore: cast_nullable_to_non_nullable
              as String,
      Linked: null == Linked
          ? _self.Linked
          : Linked // ignore: cast_nullable_to_non_nullable
              as String,
      LinkedWith: null == LinkedWith
          ? _self.LinkedWith
          : LinkedWith // ignore: cast_nullable_to_non_nullable
              as String,
      CreatedBy: null == CreatedBy
          ? _self.CreatedBy
          : CreatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      CreateDatetime: null == CreateDatetime
          ? _self.CreateDatetime
          : CreateDatetime // ignore: cast_nullable_to_non_nullable
              as String,
      UpdatedBy: null == UpdatedBy
          ? _self.UpdatedBy
          : UpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      UpdateDatetime: null == UpdateDatetime
          ? _self.UpdateDatetime
          : UpdateDatetime // ignore: cast_nullable_to_non_nullable
              as String,
      Status: null == Status
          ? _self.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as String,
      RuleSeq: null == RuleSeq
          ? _self.RuleSeq
          : RuleSeq // ignore: cast_nullable_to_non_nullable
              as String,
      Prefix: null == Prefix
          ? _self.Prefix
          : Prefix // ignore: cast_nullable_to_non_nullable
              as String,
      Suffix: null == Suffix
          ? _self.Suffix
          : Suffix // ignore: cast_nullable_to_non_nullable
              as String,
      CriteriaMapOrg: null == CriteriaMapOrg
          ? _self.CriteriaMapOrg
          : CriteriaMapOrg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [FormFieldItem].
extension FormFieldItemPatterns on FormFieldItem {
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
    TResult Function(_FormFieldItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormFieldItem() when $default != null:
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
    TResult Function(_FormFieldItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormFieldItem():
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
    TResult? Function(_FormFieldItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormFieldItem() when $default != null:
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
            @JsonKey(name: 'Id') int Id,
            @JsonKey(name: 'LicenseCountry') String LicenseCountry,
            @JsonKey(name: 'ClientCode') String ClientCode,
            @JsonKey(name: 'ApplicationName') String ApplicationName,
            @JsonKey(name: 'ModuleName') String ModuleName,
            @JsonKey(name: 'FormName') String FormName,
            @JsonKey(name: 'CriteriaId') String CriteriaId,
            @JsonKey(name: 'CriteriaMap') String CriteriaMap,
            @JsonKey(name: 'CriteriaMapSplit') String CriteriaMapSplit,
            @JsonKey(name: 'RuleSelected') String RuleSelected,
            @JsonKey(name: 'FieldId') String FieldId,
            @JsonKey(name: 'FzParamName') String FzParamName,
            @JsonKey(name: 'FzParamName2') String FzParamName2,
            @JsonKey(name: 'IsMandatory') String IsMandatory,
            @JsonKey(name: 'IsEnable') String IsEnable,
            @JsonKey(name: 'IsVisible') String IsVisible,
            @JsonKey(name: 'FieldDisplayName') String FieldDisplayName,
            @JsonKey(name: 'FieldType') String FieldTypeNew,
            @JsonKey(name: 'FieldDisplayOrder') String FieldDisplayOrder,
            @JsonKey(name: 'Regex') String Regex,
            @JsonKey(name: 'RegexMessage') String RegexMessage,
            @JsonKey(name: 'DefaultValue') String DefaultValue,
            @JsonKey(name: 'SetOptions') String SetOptions,
            @JsonKey(name: 'Masking') String Masking,
            @JsonKey(name: 'ApiKey') String ApiKey,
            @JsonKey(name: 'ApiKey1') String ApiKey1,
            @JsonKey(name: 'Block') String Block,
            @JsonKey(name: 'BlockMessageCode') String BlockMessageCode,
            @JsonKey(name: 'BlockMessageDescription')
            String BlockMessageDescription,
            @JsonKey(name: 'Warning') String Warning,
            @JsonKey(name: 'WarningMessageCode') String WarningMessageCode,
            @JsonKey(name: 'WarningMessageDescription')
            String WarningMessageDescription,
            @JsonKey(name: 'CheckDuplicate') String CheckDuplicate,
            @JsonKey(name: 'DisplayInNewLine') String DisplayInNewLine,
            @JsonKey(name: 'MinLength') String MinLength,
            @JsonKey(name: 'MaxLength') String MaxLength,
            @JsonKey(name: 'ValidValues') String ValidValues,
            @JsonKey(name: 'DisplayValidValuesOnHover')
            String DisplayValidValuesOnHover,
            @JsonKey(name: 'FormRuleCode') String FormRuleCode,
            @JsonKey(name: 'FormRuleSubCode') String FormRuleSubCode,
            @JsonKey(name: 'FormRuleDescription') String FormRuleDescription,
            @JsonKey(name: 'DisplaySection') String DisplaySection,
            @JsonKey(name: 'DisplaySectionOrder') String DisplaySectionOrder,
            @JsonKey(name: 'Linked') String Linked,
            @JsonKey(name: 'LinkedWith') String LinkedWith,
            @JsonKey(name: 'CreatedBy') String CreatedBy,
            @JsonKey(name: 'CreateDatetime') String CreateDatetime,
            @JsonKey(name: 'UpdatedBy') String UpdatedBy,
            @JsonKey(name: 'UpdateDatetime') String UpdateDatetime,
            @JsonKey(name: 'Status') String Status,
            @JsonKey(name: 'RuleSeq') String RuleSeq,
            @JsonKey(name: 'Prefix') String Prefix,
            @JsonKey(name: 'Suffix') String Suffix,
            @JsonKey(name: 'CriteriaMapOrg') String CriteriaMapOrg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FormFieldItem() when $default != null:
        return $default(
            _that.Id,
            _that.LicenseCountry,
            _that.ClientCode,
            _that.ApplicationName,
            _that.ModuleName,
            _that.FormName,
            _that.CriteriaId,
            _that.CriteriaMap,
            _that.CriteriaMapSplit,
            _that.RuleSelected,
            _that.FieldId,
            _that.FzParamName,
            _that.FzParamName2,
            _that.IsMandatory,
            _that.IsEnable,
            _that.IsVisible,
            _that.FieldDisplayName,
            _that.FieldTypeNew,
            _that.FieldDisplayOrder,
            _that.Regex,
            _that.RegexMessage,
            _that.DefaultValue,
            _that.SetOptions,
            _that.Masking,
            _that.ApiKey,
            _that.ApiKey1,
            _that.Block,
            _that.BlockMessageCode,
            _that.BlockMessageDescription,
            _that.Warning,
            _that.WarningMessageCode,
            _that.WarningMessageDescription,
            _that.CheckDuplicate,
            _that.DisplayInNewLine,
            _that.MinLength,
            _that.MaxLength,
            _that.ValidValues,
            _that.DisplayValidValuesOnHover,
            _that.FormRuleCode,
            _that.FormRuleSubCode,
            _that.FormRuleDescription,
            _that.DisplaySection,
            _that.DisplaySectionOrder,
            _that.Linked,
            _that.LinkedWith,
            _that.CreatedBy,
            _that.CreateDatetime,
            _that.UpdatedBy,
            _that.UpdateDatetime,
            _that.Status,
            _that.RuleSeq,
            _that.Prefix,
            _that.Suffix,
            _that.CriteriaMapOrg);
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
            @JsonKey(name: 'Id') int Id,
            @JsonKey(name: 'LicenseCountry') String LicenseCountry,
            @JsonKey(name: 'ClientCode') String ClientCode,
            @JsonKey(name: 'ApplicationName') String ApplicationName,
            @JsonKey(name: 'ModuleName') String ModuleName,
            @JsonKey(name: 'FormName') String FormName,
            @JsonKey(name: 'CriteriaId') String CriteriaId,
            @JsonKey(name: 'CriteriaMap') String CriteriaMap,
            @JsonKey(name: 'CriteriaMapSplit') String CriteriaMapSplit,
            @JsonKey(name: 'RuleSelected') String RuleSelected,
            @JsonKey(name: 'FieldId') String FieldId,
            @JsonKey(name: 'FzParamName') String FzParamName,
            @JsonKey(name: 'FzParamName2') String FzParamName2,
            @JsonKey(name: 'IsMandatory') String IsMandatory,
            @JsonKey(name: 'IsEnable') String IsEnable,
            @JsonKey(name: 'IsVisible') String IsVisible,
            @JsonKey(name: 'FieldDisplayName') String FieldDisplayName,
            @JsonKey(name: 'FieldType') String FieldTypeNew,
            @JsonKey(name: 'FieldDisplayOrder') String FieldDisplayOrder,
            @JsonKey(name: 'Regex') String Regex,
            @JsonKey(name: 'RegexMessage') String RegexMessage,
            @JsonKey(name: 'DefaultValue') String DefaultValue,
            @JsonKey(name: 'SetOptions') String SetOptions,
            @JsonKey(name: 'Masking') String Masking,
            @JsonKey(name: 'ApiKey') String ApiKey,
            @JsonKey(name: 'ApiKey1') String ApiKey1,
            @JsonKey(name: 'Block') String Block,
            @JsonKey(name: 'BlockMessageCode') String BlockMessageCode,
            @JsonKey(name: 'BlockMessageDescription')
            String BlockMessageDescription,
            @JsonKey(name: 'Warning') String Warning,
            @JsonKey(name: 'WarningMessageCode') String WarningMessageCode,
            @JsonKey(name: 'WarningMessageDescription')
            String WarningMessageDescription,
            @JsonKey(name: 'CheckDuplicate') String CheckDuplicate,
            @JsonKey(name: 'DisplayInNewLine') String DisplayInNewLine,
            @JsonKey(name: 'MinLength') String MinLength,
            @JsonKey(name: 'MaxLength') String MaxLength,
            @JsonKey(name: 'ValidValues') String ValidValues,
            @JsonKey(name: 'DisplayValidValuesOnHover')
            String DisplayValidValuesOnHover,
            @JsonKey(name: 'FormRuleCode') String FormRuleCode,
            @JsonKey(name: 'FormRuleSubCode') String FormRuleSubCode,
            @JsonKey(name: 'FormRuleDescription') String FormRuleDescription,
            @JsonKey(name: 'DisplaySection') String DisplaySection,
            @JsonKey(name: 'DisplaySectionOrder') String DisplaySectionOrder,
            @JsonKey(name: 'Linked') String Linked,
            @JsonKey(name: 'LinkedWith') String LinkedWith,
            @JsonKey(name: 'CreatedBy') String CreatedBy,
            @JsonKey(name: 'CreateDatetime') String CreateDatetime,
            @JsonKey(name: 'UpdatedBy') String UpdatedBy,
            @JsonKey(name: 'UpdateDatetime') String UpdateDatetime,
            @JsonKey(name: 'Status') String Status,
            @JsonKey(name: 'RuleSeq') String RuleSeq,
            @JsonKey(name: 'Prefix') String Prefix,
            @JsonKey(name: 'Suffix') String Suffix,
            @JsonKey(name: 'CriteriaMapOrg') String CriteriaMapOrg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormFieldItem():
        return $default(
            _that.Id,
            _that.LicenseCountry,
            _that.ClientCode,
            _that.ApplicationName,
            _that.ModuleName,
            _that.FormName,
            _that.CriteriaId,
            _that.CriteriaMap,
            _that.CriteriaMapSplit,
            _that.RuleSelected,
            _that.FieldId,
            _that.FzParamName,
            _that.FzParamName2,
            _that.IsMandatory,
            _that.IsEnable,
            _that.IsVisible,
            _that.FieldDisplayName,
            _that.FieldTypeNew,
            _that.FieldDisplayOrder,
            _that.Regex,
            _that.RegexMessage,
            _that.DefaultValue,
            _that.SetOptions,
            _that.Masking,
            _that.ApiKey,
            _that.ApiKey1,
            _that.Block,
            _that.BlockMessageCode,
            _that.BlockMessageDescription,
            _that.Warning,
            _that.WarningMessageCode,
            _that.WarningMessageDescription,
            _that.CheckDuplicate,
            _that.DisplayInNewLine,
            _that.MinLength,
            _that.MaxLength,
            _that.ValidValues,
            _that.DisplayValidValuesOnHover,
            _that.FormRuleCode,
            _that.FormRuleSubCode,
            _that.FormRuleDescription,
            _that.DisplaySection,
            _that.DisplaySectionOrder,
            _that.Linked,
            _that.LinkedWith,
            _that.CreatedBy,
            _that.CreateDatetime,
            _that.UpdatedBy,
            _that.UpdateDatetime,
            _that.Status,
            _that.RuleSeq,
            _that.Prefix,
            _that.Suffix,
            _that.CriteriaMapOrg);
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
            @JsonKey(name: 'Id') int Id,
            @JsonKey(name: 'LicenseCountry') String LicenseCountry,
            @JsonKey(name: 'ClientCode') String ClientCode,
            @JsonKey(name: 'ApplicationName') String ApplicationName,
            @JsonKey(name: 'ModuleName') String ModuleName,
            @JsonKey(name: 'FormName') String FormName,
            @JsonKey(name: 'CriteriaId') String CriteriaId,
            @JsonKey(name: 'CriteriaMap') String CriteriaMap,
            @JsonKey(name: 'CriteriaMapSplit') String CriteriaMapSplit,
            @JsonKey(name: 'RuleSelected') String RuleSelected,
            @JsonKey(name: 'FieldId') String FieldId,
            @JsonKey(name: 'FzParamName') String FzParamName,
            @JsonKey(name: 'FzParamName2') String FzParamName2,
            @JsonKey(name: 'IsMandatory') String IsMandatory,
            @JsonKey(name: 'IsEnable') String IsEnable,
            @JsonKey(name: 'IsVisible') String IsVisible,
            @JsonKey(name: 'FieldDisplayName') String FieldDisplayName,
            @JsonKey(name: 'FieldType') String FieldTypeNew,
            @JsonKey(name: 'FieldDisplayOrder') String FieldDisplayOrder,
            @JsonKey(name: 'Regex') String Regex,
            @JsonKey(name: 'RegexMessage') String RegexMessage,
            @JsonKey(name: 'DefaultValue') String DefaultValue,
            @JsonKey(name: 'SetOptions') String SetOptions,
            @JsonKey(name: 'Masking') String Masking,
            @JsonKey(name: 'ApiKey') String ApiKey,
            @JsonKey(name: 'ApiKey1') String ApiKey1,
            @JsonKey(name: 'Block') String Block,
            @JsonKey(name: 'BlockMessageCode') String BlockMessageCode,
            @JsonKey(name: 'BlockMessageDescription')
            String BlockMessageDescription,
            @JsonKey(name: 'Warning') String Warning,
            @JsonKey(name: 'WarningMessageCode') String WarningMessageCode,
            @JsonKey(name: 'WarningMessageDescription')
            String WarningMessageDescription,
            @JsonKey(name: 'CheckDuplicate') String CheckDuplicate,
            @JsonKey(name: 'DisplayInNewLine') String DisplayInNewLine,
            @JsonKey(name: 'MinLength') String MinLength,
            @JsonKey(name: 'MaxLength') String MaxLength,
            @JsonKey(name: 'ValidValues') String ValidValues,
            @JsonKey(name: 'DisplayValidValuesOnHover')
            String DisplayValidValuesOnHover,
            @JsonKey(name: 'FormRuleCode') String FormRuleCode,
            @JsonKey(name: 'FormRuleSubCode') String FormRuleSubCode,
            @JsonKey(name: 'FormRuleDescription') String FormRuleDescription,
            @JsonKey(name: 'DisplaySection') String DisplaySection,
            @JsonKey(name: 'DisplaySectionOrder') String DisplaySectionOrder,
            @JsonKey(name: 'Linked') String Linked,
            @JsonKey(name: 'LinkedWith') String LinkedWith,
            @JsonKey(name: 'CreatedBy') String CreatedBy,
            @JsonKey(name: 'CreateDatetime') String CreateDatetime,
            @JsonKey(name: 'UpdatedBy') String UpdatedBy,
            @JsonKey(name: 'UpdateDatetime') String UpdateDatetime,
            @JsonKey(name: 'Status') String Status,
            @JsonKey(name: 'RuleSeq') String RuleSeq,
            @JsonKey(name: 'Prefix') String Prefix,
            @JsonKey(name: 'Suffix') String Suffix,
            @JsonKey(name: 'CriteriaMapOrg') String CriteriaMapOrg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FormFieldItem() when $default != null:
        return $default(
            _that.Id,
            _that.LicenseCountry,
            _that.ClientCode,
            _that.ApplicationName,
            _that.ModuleName,
            _that.FormName,
            _that.CriteriaId,
            _that.CriteriaMap,
            _that.CriteriaMapSplit,
            _that.RuleSelected,
            _that.FieldId,
            _that.FzParamName,
            _that.FzParamName2,
            _that.IsMandatory,
            _that.IsEnable,
            _that.IsVisible,
            _that.FieldDisplayName,
            _that.FieldTypeNew,
            _that.FieldDisplayOrder,
            _that.Regex,
            _that.RegexMessage,
            _that.DefaultValue,
            _that.SetOptions,
            _that.Masking,
            _that.ApiKey,
            _that.ApiKey1,
            _that.Block,
            _that.BlockMessageCode,
            _that.BlockMessageDescription,
            _that.Warning,
            _that.WarningMessageCode,
            _that.WarningMessageDescription,
            _that.CheckDuplicate,
            _that.DisplayInNewLine,
            _that.MinLength,
            _that.MaxLength,
            _that.ValidValues,
            _that.DisplayValidValuesOnHover,
            _that.FormRuleCode,
            _that.FormRuleSubCode,
            _that.FormRuleDescription,
            _that.DisplaySection,
            _that.DisplaySectionOrder,
            _that.Linked,
            _that.LinkedWith,
            _that.CreatedBy,
            _that.CreateDatetime,
            _that.UpdatedBy,
            _that.UpdateDatetime,
            _that.Status,
            _that.RuleSeq,
            _that.Prefix,
            _that.Suffix,
            _that.CriteriaMapOrg);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FormFieldItem extends FormFieldItem {
  const _FormFieldItem(
      {@JsonKey(name: 'Id') this.Id = 0,
      @JsonKey(name: 'LicenseCountry') this.LicenseCountry = '',
      @JsonKey(name: 'ClientCode') this.ClientCode = '',
      @JsonKey(name: 'ApplicationName') this.ApplicationName = '',
      @JsonKey(name: 'ModuleName') this.ModuleName = '',
      @JsonKey(name: 'FormName') this.FormName = '',
      @JsonKey(name: 'CriteriaId') this.CriteriaId = '',
      @JsonKey(name: 'CriteriaMap') this.CriteriaMap = '',
      @JsonKey(name: 'CriteriaMapSplit') this.CriteriaMapSplit = '',
      @JsonKey(name: 'RuleSelected') this.RuleSelected = '',
      @JsonKey(name: 'FieldId') this.FieldId = '',
      @JsonKey(name: 'FzParamName') this.FzParamName = '',
      @JsonKey(name: 'FzParamName2') this.FzParamName2 = '',
      @JsonKey(name: 'IsMandatory') this.IsMandatory = '',
      @JsonKey(name: 'IsEnable') this.IsEnable = '',
      @JsonKey(name: 'IsVisible') this.IsVisible = '',
      @JsonKey(name: 'FieldDisplayName') this.FieldDisplayName = '',
      @JsonKey(name: 'FieldType') this.FieldTypeNew = '',
      @JsonKey(name: 'FieldDisplayOrder') this.FieldDisplayOrder = '',
      @JsonKey(name: 'Regex') this.Regex = '',
      @JsonKey(name: 'RegexMessage') this.RegexMessage = '',
      @JsonKey(name: 'DefaultValue') this.DefaultValue = '',
      @JsonKey(name: 'SetOptions') this.SetOptions = '',
      @JsonKey(name: 'Masking') this.Masking = '',
      @JsonKey(name: 'ApiKey') this.ApiKey = '',
      @JsonKey(name: 'ApiKey1') this.ApiKey1 = '',
      @JsonKey(name: 'Block') this.Block = '',
      @JsonKey(name: 'BlockMessageCode') this.BlockMessageCode = '',
      @JsonKey(name: 'BlockMessageDescription')
      this.BlockMessageDescription = '',
      @JsonKey(name: 'Warning') this.Warning = '',
      @JsonKey(name: 'WarningMessageCode') this.WarningMessageCode = '',
      @JsonKey(name: 'WarningMessageDescription')
      this.WarningMessageDescription = '',
      @JsonKey(name: 'CheckDuplicate') this.CheckDuplicate = '',
      @JsonKey(name: 'DisplayInNewLine') this.DisplayInNewLine = '',
      @JsonKey(name: 'MinLength') this.MinLength = '',
      @JsonKey(name: 'MaxLength') this.MaxLength = '',
      @JsonKey(name: 'ValidValues') this.ValidValues = '',
      @JsonKey(name: 'DisplayValidValuesOnHover')
      this.DisplayValidValuesOnHover = '',
      @JsonKey(name: 'FormRuleCode') this.FormRuleCode = '',
      @JsonKey(name: 'FormRuleSubCode') this.FormRuleSubCode = '',
      @JsonKey(name: 'FormRuleDescription') this.FormRuleDescription = '',
      @JsonKey(name: 'DisplaySection') this.DisplaySection = '',
      @JsonKey(name: 'DisplaySectionOrder') this.DisplaySectionOrder = '',
      @JsonKey(name: 'Linked') this.Linked = '',
      @JsonKey(name: 'LinkedWith') this.LinkedWith = '',
      @JsonKey(name: 'CreatedBy') this.CreatedBy = '',
      @JsonKey(name: 'CreateDatetime') this.CreateDatetime = '',
      @JsonKey(name: 'UpdatedBy') this.UpdatedBy = '',
      @JsonKey(name: 'UpdateDatetime') this.UpdateDatetime = '',
      @JsonKey(name: 'Status') this.Status = '',
      @JsonKey(name: 'RuleSeq') this.RuleSeq = '',
      @JsonKey(name: 'Prefix') this.Prefix = '',
      @JsonKey(name: 'Suffix') this.Suffix = '',
      @JsonKey(name: 'CriteriaMapOrg') this.CriteriaMapOrg = ''})
      : super._();
  factory _FormFieldItem.fromJson(Map<String, dynamic> json) =>
      _$FormFieldItemFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int Id;
  @override
  @JsonKey(name: 'LicenseCountry')
  final String LicenseCountry;
  @override
  @JsonKey(name: 'ClientCode')
  final String ClientCode;
  @override
  @JsonKey(name: 'ApplicationName')
  final String ApplicationName;
  @override
  @JsonKey(name: 'ModuleName')
  final String ModuleName;
  @override
  @JsonKey(name: 'FormName')
  final String FormName;
  @override
  @JsonKey(name: 'CriteriaId')
  final String CriteriaId;
  @override
  @JsonKey(name: 'CriteriaMap')
  final String CriteriaMap;
  @override
  @JsonKey(name: 'CriteriaMapSplit')
  final String CriteriaMapSplit;
  @override
  @JsonKey(name: 'RuleSelected')
  final String RuleSelected;
  @override
  @JsonKey(name: 'FieldId')
  final String FieldId;
  @override
  @JsonKey(name: 'FzParamName')
  final String FzParamName;
  @override
  @JsonKey(name: 'FzParamName2')
  final String FzParamName2;
  @override
  @JsonKey(name: 'IsMandatory')
  final String IsMandatory;
  @override
  @JsonKey(name: 'IsEnable')
  final String IsEnable;
  @override
  @JsonKey(name: 'IsVisible')
  final String IsVisible;
  @override
  @JsonKey(name: 'FieldDisplayName')
  final String FieldDisplayName;
  @override
  @JsonKey(name: 'FieldType')
  final String FieldTypeNew;
  @override
  @JsonKey(name: 'FieldDisplayOrder')
  final String FieldDisplayOrder;
  @override
  @JsonKey(name: 'Regex')
  final String Regex;
  @override
  @JsonKey(name: 'RegexMessage')
  final String RegexMessage;
  @override
  @JsonKey(name: 'DefaultValue')
  final String DefaultValue;
  @override
  @JsonKey(name: 'SetOptions')
  final String SetOptions;
  @override
  @JsonKey(name: 'Masking')
  final String Masking;
  @override
  @JsonKey(name: 'ApiKey')
  final String ApiKey;
  @override
  @JsonKey(name: 'ApiKey1')
  final String ApiKey1;
  @override
  @JsonKey(name: 'Block')
  final String Block;
  @override
  @JsonKey(name: 'BlockMessageCode')
  final String BlockMessageCode;
  @override
  @JsonKey(name: 'BlockMessageDescription')
  final String BlockMessageDescription;
  @override
  @JsonKey(name: 'Warning')
  final String Warning;
  @override
  @JsonKey(name: 'WarningMessageCode')
  final String WarningMessageCode;
  @override
  @JsonKey(name: 'WarningMessageDescription')
  final String WarningMessageDescription;
  @override
  @JsonKey(name: 'CheckDuplicate')
  final String CheckDuplicate;
  @override
  @JsonKey(name: 'DisplayInNewLine')
  final String DisplayInNewLine;
  @override
  @JsonKey(name: 'MinLength')
  final String MinLength;
  @override
  @JsonKey(name: 'MaxLength')
  final String MaxLength;
  @override
  @JsonKey(name: 'ValidValues')
  final String ValidValues;
  @override
  @JsonKey(name: 'DisplayValidValuesOnHover')
  final String DisplayValidValuesOnHover;
  @override
  @JsonKey(name: 'FormRuleCode')
  final String FormRuleCode;
  @override
  @JsonKey(name: 'FormRuleSubCode')
  final String FormRuleSubCode;
  @override
  @JsonKey(name: 'FormRuleDescription')
  final String FormRuleDescription;
  @override
  @JsonKey(name: 'DisplaySection')
  final String DisplaySection;
  @override
  @JsonKey(name: 'DisplaySectionOrder')
  final String DisplaySectionOrder;
  @override
  @JsonKey(name: 'Linked')
  final String Linked;
  @override
  @JsonKey(name: 'LinkedWith')
  final String LinkedWith;
  @override
  @JsonKey(name: 'CreatedBy')
  final String CreatedBy;
  @override
  @JsonKey(name: 'CreateDatetime')
  final String CreateDatetime;
  @override
  @JsonKey(name: 'UpdatedBy')
  final String UpdatedBy;
  @override
  @JsonKey(name: 'UpdateDatetime')
  final String UpdateDatetime;
  @override
  @JsonKey(name: 'Status')
  final String Status;
  @override
  @JsonKey(name: 'RuleSeq')
  final String RuleSeq;
  @override
  @JsonKey(name: 'Prefix')
  final String Prefix;
  @override
  @JsonKey(name: 'Suffix')
  final String Suffix;
  @override
  @JsonKey(name: 'CriteriaMapOrg')
  final String CriteriaMapOrg;

  /// Create a copy of FormFieldItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FormFieldItemCopyWith<_FormFieldItem> get copyWith =>
      __$FormFieldItemCopyWithImpl<_FormFieldItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FormFieldItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FormFieldItem &&
            (identical(other.Id, Id) || other.Id == Id) &&
            (identical(other.LicenseCountry, LicenseCountry) ||
                other.LicenseCountry == LicenseCountry) &&
            (identical(other.ClientCode, ClientCode) ||
                other.ClientCode == ClientCode) &&
            (identical(other.ApplicationName, ApplicationName) ||
                other.ApplicationName == ApplicationName) &&
            (identical(other.ModuleName, ModuleName) ||
                other.ModuleName == ModuleName) &&
            (identical(other.FormName, FormName) ||
                other.FormName == FormName) &&
            (identical(other.CriteriaId, CriteriaId) ||
                other.CriteriaId == CriteriaId) &&
            (identical(other.CriteriaMap, CriteriaMap) ||
                other.CriteriaMap == CriteriaMap) &&
            (identical(other.CriteriaMapSplit, CriteriaMapSplit) ||
                other.CriteriaMapSplit == CriteriaMapSplit) &&
            (identical(other.RuleSelected, RuleSelected) ||
                other.RuleSelected == RuleSelected) &&
            (identical(other.FieldId, FieldId) || other.FieldId == FieldId) &&
            (identical(other.FzParamName, FzParamName) ||
                other.FzParamName == FzParamName) &&
            (identical(other.FzParamName2, FzParamName2) ||
                other.FzParamName2 == FzParamName2) &&
            (identical(other.IsMandatory, IsMandatory) ||
                other.IsMandatory == IsMandatory) &&
            (identical(other.IsEnable, IsEnable) ||
                other.IsEnable == IsEnable) &&
            (identical(other.IsVisible, IsVisible) ||
                other.IsVisible == IsVisible) &&
            (identical(other.FieldDisplayName, FieldDisplayName) ||
                other.FieldDisplayName == FieldDisplayName) &&
            (identical(other.FieldTypeNew, FieldTypeNew) ||
                other.FieldTypeNew == FieldTypeNew) &&
            (identical(other.FieldDisplayOrder, FieldDisplayOrder) ||
                other.FieldDisplayOrder == FieldDisplayOrder) &&
            (identical(other.Regex, Regex) || other.Regex == Regex) &&
            (identical(other.RegexMessage, RegexMessage) ||
                other.RegexMessage == RegexMessage) &&
            (identical(other.DefaultValue, DefaultValue) ||
                other.DefaultValue == DefaultValue) &&
            (identical(other.SetOptions, SetOptions) ||
                other.SetOptions == SetOptions) &&
            (identical(other.Masking, Masking) || other.Masking == Masking) &&
            (identical(other.ApiKey, ApiKey) || other.ApiKey == ApiKey) &&
            (identical(other.ApiKey1, ApiKey1) || other.ApiKey1 == ApiKey1) &&
            (identical(other.Block, Block) || other.Block == Block) &&
            (identical(other.BlockMessageCode, BlockMessageCode) ||
                other.BlockMessageCode == BlockMessageCode) &&
            (identical(other.BlockMessageDescription, BlockMessageDescription) ||
                other.BlockMessageDescription == BlockMessageDescription) &&
            (identical(other.Warning, Warning) || other.Warning == Warning) &&
            (identical(other.WarningMessageCode, WarningMessageCode) ||
                other.WarningMessageCode == WarningMessageCode) &&
            (identical(other.WarningMessageDescription, WarningMessageDescription) ||
                other.WarningMessageDescription == WarningMessageDescription) &&
            (identical(other.CheckDuplicate, CheckDuplicate) ||
                other.CheckDuplicate == CheckDuplicate) &&
            (identical(other.DisplayInNewLine, DisplayInNewLine) ||
                other.DisplayInNewLine == DisplayInNewLine) &&
            (identical(other.MinLength, MinLength) ||
                other.MinLength == MinLength) &&
            (identical(other.MaxLength, MaxLength) ||
                other.MaxLength == MaxLength) &&
            (identical(other.ValidValues, ValidValues) ||
                other.ValidValues == ValidValues) &&
            (identical(other.DisplayValidValuesOnHover, DisplayValidValuesOnHover) ||
                other.DisplayValidValuesOnHover == DisplayValidValuesOnHover) &&
            (identical(other.FormRuleCode, FormRuleCode) ||
                other.FormRuleCode == FormRuleCode) &&
            (identical(other.FormRuleSubCode, FormRuleSubCode) ||
                other.FormRuleSubCode == FormRuleSubCode) &&
            (identical(other.FormRuleDescription, FormRuleDescription) ||
                other.FormRuleDescription == FormRuleDescription) &&
            (identical(other.DisplaySection, DisplaySection) ||
                other.DisplaySection == DisplaySection) &&
            (identical(other.DisplaySectionOrder, DisplaySectionOrder) ||
                other.DisplaySectionOrder == DisplaySectionOrder) &&
            (identical(other.Linked, Linked) || other.Linked == Linked) &&
            (identical(other.LinkedWith, LinkedWith) ||
                other.LinkedWith == LinkedWith) &&
            (identical(other.CreatedBy, CreatedBy) ||
                other.CreatedBy == CreatedBy) &&
            (identical(other.CreateDatetime, CreateDatetime) ||
                other.CreateDatetime == CreateDatetime) &&
            (identical(other.UpdatedBy, UpdatedBy) || other.UpdatedBy == UpdatedBy) &&
            (identical(other.UpdateDatetime, UpdateDatetime) || other.UpdateDatetime == UpdateDatetime) &&
            (identical(other.Status, Status) || other.Status == Status) &&
            (identical(other.RuleSeq, RuleSeq) || other.RuleSeq == RuleSeq) &&
            (identical(other.Prefix, Prefix) || other.Prefix == Prefix) &&
            (identical(other.Suffix, Suffix) || other.Suffix == Suffix) &&
            (identical(other.CriteriaMapOrg, CriteriaMapOrg) || other.CriteriaMapOrg == CriteriaMapOrg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        Id,
        LicenseCountry,
        ClientCode,
        ApplicationName,
        ModuleName,
        FormName,
        CriteriaId,
        CriteriaMap,
        CriteriaMapSplit,
        RuleSelected,
        FieldId,
        FzParamName,
        FzParamName2,
        IsMandatory,
        IsEnable,
        IsVisible,
        FieldDisplayName,
        FieldTypeNew,
        FieldDisplayOrder,
        Regex,
        RegexMessage,
        DefaultValue,
        SetOptions,
        Masking,
        ApiKey,
        ApiKey1,
        Block,
        BlockMessageCode,
        BlockMessageDescription,
        Warning,
        WarningMessageCode,
        WarningMessageDescription,
        CheckDuplicate,
        DisplayInNewLine,
        MinLength,
        MaxLength,
        ValidValues,
        DisplayValidValuesOnHover,
        FormRuleCode,
        FormRuleSubCode,
        FormRuleDescription,
        DisplaySection,
        DisplaySectionOrder,
        Linked,
        LinkedWith,
        CreatedBy,
        CreateDatetime,
        UpdatedBy,
        UpdateDatetime,
        Status,
        RuleSeq,
        Prefix,
        Suffix,
        CriteriaMapOrg
      ]);

  @override
  String toString() {
    return 'FormFieldItem(Id: $Id, LicenseCountry: $LicenseCountry, ClientCode: $ClientCode, ApplicationName: $ApplicationName, ModuleName: $ModuleName, FormName: $FormName, CriteriaId: $CriteriaId, CriteriaMap: $CriteriaMap, CriteriaMapSplit: $CriteriaMapSplit, RuleSelected: $RuleSelected, FieldId: $FieldId, FzParamName: $FzParamName, FzParamName2: $FzParamName2, IsMandatory: $IsMandatory, IsEnable: $IsEnable, IsVisible: $IsVisible, FieldDisplayName: $FieldDisplayName, FieldTypeNew: $FieldTypeNew, FieldDisplayOrder: $FieldDisplayOrder, Regex: $Regex, RegexMessage: $RegexMessage, DefaultValue: $DefaultValue, SetOptions: $SetOptions, Masking: $Masking, ApiKey: $ApiKey, ApiKey1: $ApiKey1, Block: $Block, BlockMessageCode: $BlockMessageCode, BlockMessageDescription: $BlockMessageDescription, Warning: $Warning, WarningMessageCode: $WarningMessageCode, WarningMessageDescription: $WarningMessageDescription, CheckDuplicate: $CheckDuplicate, DisplayInNewLine: $DisplayInNewLine, MinLength: $MinLength, MaxLength: $MaxLength, ValidValues: $ValidValues, DisplayValidValuesOnHover: $DisplayValidValuesOnHover, FormRuleCode: $FormRuleCode, FormRuleSubCode: $FormRuleSubCode, FormRuleDescription: $FormRuleDescription, DisplaySection: $DisplaySection, DisplaySectionOrder: $DisplaySectionOrder, Linked: $Linked, LinkedWith: $LinkedWith, CreatedBy: $CreatedBy, CreateDatetime: $CreateDatetime, UpdatedBy: $UpdatedBy, UpdateDatetime: $UpdateDatetime, Status: $Status, RuleSeq: $RuleSeq, Prefix: $Prefix, Suffix: $Suffix, CriteriaMapOrg: $CriteriaMapOrg)';
  }
}

/// @nodoc
abstract mixin class _$FormFieldItemCopyWith<$Res>
    implements $FormFieldItemCopyWith<$Res> {
  factory _$FormFieldItemCopyWith(
          _FormFieldItem value, $Res Function(_FormFieldItem) _then) =
      __$FormFieldItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int Id,
      @JsonKey(name: 'LicenseCountry') String LicenseCountry,
      @JsonKey(name: 'ClientCode') String ClientCode,
      @JsonKey(name: 'ApplicationName') String ApplicationName,
      @JsonKey(name: 'ModuleName') String ModuleName,
      @JsonKey(name: 'FormName') String FormName,
      @JsonKey(name: 'CriteriaId') String CriteriaId,
      @JsonKey(name: 'CriteriaMap') String CriteriaMap,
      @JsonKey(name: 'CriteriaMapSplit') String CriteriaMapSplit,
      @JsonKey(name: 'RuleSelected') String RuleSelected,
      @JsonKey(name: 'FieldId') String FieldId,
      @JsonKey(name: 'FzParamName') String FzParamName,
      @JsonKey(name: 'FzParamName2') String FzParamName2,
      @JsonKey(name: 'IsMandatory') String IsMandatory,
      @JsonKey(name: 'IsEnable') String IsEnable,
      @JsonKey(name: 'IsVisible') String IsVisible,
      @JsonKey(name: 'FieldDisplayName') String FieldDisplayName,
      @JsonKey(name: 'FieldType') String FieldTypeNew,
      @JsonKey(name: 'FieldDisplayOrder') String FieldDisplayOrder,
      @JsonKey(name: 'Regex') String Regex,
      @JsonKey(name: 'RegexMessage') String RegexMessage,
      @JsonKey(name: 'DefaultValue') String DefaultValue,
      @JsonKey(name: 'SetOptions') String SetOptions,
      @JsonKey(name: 'Masking') String Masking,
      @JsonKey(name: 'ApiKey') String ApiKey,
      @JsonKey(name: 'ApiKey1') String ApiKey1,
      @JsonKey(name: 'Block') String Block,
      @JsonKey(name: 'BlockMessageCode') String BlockMessageCode,
      @JsonKey(name: 'BlockMessageDescription') String BlockMessageDescription,
      @JsonKey(name: 'Warning') String Warning,
      @JsonKey(name: 'WarningMessageCode') String WarningMessageCode,
      @JsonKey(name: 'WarningMessageDescription')
      String WarningMessageDescription,
      @JsonKey(name: 'CheckDuplicate') String CheckDuplicate,
      @JsonKey(name: 'DisplayInNewLine') String DisplayInNewLine,
      @JsonKey(name: 'MinLength') String MinLength,
      @JsonKey(name: 'MaxLength') String MaxLength,
      @JsonKey(name: 'ValidValues') String ValidValues,
      @JsonKey(name: 'DisplayValidValuesOnHover')
      String DisplayValidValuesOnHover,
      @JsonKey(name: 'FormRuleCode') String FormRuleCode,
      @JsonKey(name: 'FormRuleSubCode') String FormRuleSubCode,
      @JsonKey(name: 'FormRuleDescription') String FormRuleDescription,
      @JsonKey(name: 'DisplaySection') String DisplaySection,
      @JsonKey(name: 'DisplaySectionOrder') String DisplaySectionOrder,
      @JsonKey(name: 'Linked') String Linked,
      @JsonKey(name: 'LinkedWith') String LinkedWith,
      @JsonKey(name: 'CreatedBy') String CreatedBy,
      @JsonKey(name: 'CreateDatetime') String CreateDatetime,
      @JsonKey(name: 'UpdatedBy') String UpdatedBy,
      @JsonKey(name: 'UpdateDatetime') String UpdateDatetime,
      @JsonKey(name: 'Status') String Status,
      @JsonKey(name: 'RuleSeq') String RuleSeq,
      @JsonKey(name: 'Prefix') String Prefix,
      @JsonKey(name: 'Suffix') String Suffix,
      @JsonKey(name: 'CriteriaMapOrg') String CriteriaMapOrg});
}

/// @nodoc
class __$FormFieldItemCopyWithImpl<$Res>
    implements _$FormFieldItemCopyWith<$Res> {
  __$FormFieldItemCopyWithImpl(this._self, this._then);

  final _FormFieldItem _self;
  final $Res Function(_FormFieldItem) _then;

  /// Create a copy of FormFieldItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? Id = null,
    Object? LicenseCountry = null,
    Object? ClientCode = null,
    Object? ApplicationName = null,
    Object? ModuleName = null,
    Object? FormName = null,
    Object? CriteriaId = null,
    Object? CriteriaMap = null,
    Object? CriteriaMapSplit = null,
    Object? RuleSelected = null,
    Object? FieldId = null,
    Object? FzParamName = null,
    Object? FzParamName2 = null,
    Object? IsMandatory = null,
    Object? IsEnable = null,
    Object? IsVisible = null,
    Object? FieldDisplayName = null,
    Object? FieldTypeNew = null,
    Object? FieldDisplayOrder = null,
    Object? Regex = null,
    Object? RegexMessage = null,
    Object? DefaultValue = null,
    Object? SetOptions = null,
    Object? Masking = null,
    Object? ApiKey = null,
    Object? ApiKey1 = null,
    Object? Block = null,
    Object? BlockMessageCode = null,
    Object? BlockMessageDescription = null,
    Object? Warning = null,
    Object? WarningMessageCode = null,
    Object? WarningMessageDescription = null,
    Object? CheckDuplicate = null,
    Object? DisplayInNewLine = null,
    Object? MinLength = null,
    Object? MaxLength = null,
    Object? ValidValues = null,
    Object? DisplayValidValuesOnHover = null,
    Object? FormRuleCode = null,
    Object? FormRuleSubCode = null,
    Object? FormRuleDescription = null,
    Object? DisplaySection = null,
    Object? DisplaySectionOrder = null,
    Object? Linked = null,
    Object? LinkedWith = null,
    Object? CreatedBy = null,
    Object? CreateDatetime = null,
    Object? UpdatedBy = null,
    Object? UpdateDatetime = null,
    Object? Status = null,
    Object? RuleSeq = null,
    Object? Prefix = null,
    Object? Suffix = null,
    Object? CriteriaMapOrg = null,
  }) {
    return _then(_FormFieldItem(
      Id: null == Id
          ? _self.Id
          : Id // ignore: cast_nullable_to_non_nullable
              as int,
      LicenseCountry: null == LicenseCountry
          ? _self.LicenseCountry
          : LicenseCountry // ignore: cast_nullable_to_non_nullable
              as String,
      ClientCode: null == ClientCode
          ? _self.ClientCode
          : ClientCode // ignore: cast_nullable_to_non_nullable
              as String,
      ApplicationName: null == ApplicationName
          ? _self.ApplicationName
          : ApplicationName // ignore: cast_nullable_to_non_nullable
              as String,
      ModuleName: null == ModuleName
          ? _self.ModuleName
          : ModuleName // ignore: cast_nullable_to_non_nullable
              as String,
      FormName: null == FormName
          ? _self.FormName
          : FormName // ignore: cast_nullable_to_non_nullable
              as String,
      CriteriaId: null == CriteriaId
          ? _self.CriteriaId
          : CriteriaId // ignore: cast_nullable_to_non_nullable
              as String,
      CriteriaMap: null == CriteriaMap
          ? _self.CriteriaMap
          : CriteriaMap // ignore: cast_nullable_to_non_nullable
              as String,
      CriteriaMapSplit: null == CriteriaMapSplit
          ? _self.CriteriaMapSplit
          : CriteriaMapSplit // ignore: cast_nullable_to_non_nullable
              as String,
      RuleSelected: null == RuleSelected
          ? _self.RuleSelected
          : RuleSelected // ignore: cast_nullable_to_non_nullable
              as String,
      FieldId: null == FieldId
          ? _self.FieldId
          : FieldId // ignore: cast_nullable_to_non_nullable
              as String,
      FzParamName: null == FzParamName
          ? _self.FzParamName
          : FzParamName // ignore: cast_nullable_to_non_nullable
              as String,
      FzParamName2: null == FzParamName2
          ? _self.FzParamName2
          : FzParamName2 // ignore: cast_nullable_to_non_nullable
              as String,
      IsMandatory: null == IsMandatory
          ? _self.IsMandatory
          : IsMandatory // ignore: cast_nullable_to_non_nullable
              as String,
      IsEnable: null == IsEnable
          ? _self.IsEnable
          : IsEnable // ignore: cast_nullable_to_non_nullable
              as String,
      IsVisible: null == IsVisible
          ? _self.IsVisible
          : IsVisible // ignore: cast_nullable_to_non_nullable
              as String,
      FieldDisplayName: null == FieldDisplayName
          ? _self.FieldDisplayName
          : FieldDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      FieldTypeNew: null == FieldTypeNew
          ? _self.FieldTypeNew
          : FieldTypeNew // ignore: cast_nullable_to_non_nullable
              as String,
      FieldDisplayOrder: null == FieldDisplayOrder
          ? _self.FieldDisplayOrder
          : FieldDisplayOrder // ignore: cast_nullable_to_non_nullable
              as String,
      Regex: null == Regex
          ? _self.Regex
          : Regex // ignore: cast_nullable_to_non_nullable
              as String,
      RegexMessage: null == RegexMessage
          ? _self.RegexMessage
          : RegexMessage // ignore: cast_nullable_to_non_nullable
              as String,
      DefaultValue: null == DefaultValue
          ? _self.DefaultValue
          : DefaultValue // ignore: cast_nullable_to_non_nullable
              as String,
      SetOptions: null == SetOptions
          ? _self.SetOptions
          : SetOptions // ignore: cast_nullable_to_non_nullable
              as String,
      Masking: null == Masking
          ? _self.Masking
          : Masking // ignore: cast_nullable_to_non_nullable
              as String,
      ApiKey: null == ApiKey
          ? _self.ApiKey
          : ApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      ApiKey1: null == ApiKey1
          ? _self.ApiKey1
          : ApiKey1 // ignore: cast_nullable_to_non_nullable
              as String,
      Block: null == Block
          ? _self.Block
          : Block // ignore: cast_nullable_to_non_nullable
              as String,
      BlockMessageCode: null == BlockMessageCode
          ? _self.BlockMessageCode
          : BlockMessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      BlockMessageDescription: null == BlockMessageDescription
          ? _self.BlockMessageDescription
          : BlockMessageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      Warning: null == Warning
          ? _self.Warning
          : Warning // ignore: cast_nullable_to_non_nullable
              as String,
      WarningMessageCode: null == WarningMessageCode
          ? _self.WarningMessageCode
          : WarningMessageCode // ignore: cast_nullable_to_non_nullable
              as String,
      WarningMessageDescription: null == WarningMessageDescription
          ? _self.WarningMessageDescription
          : WarningMessageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      CheckDuplicate: null == CheckDuplicate
          ? _self.CheckDuplicate
          : CheckDuplicate // ignore: cast_nullable_to_non_nullable
              as String,
      DisplayInNewLine: null == DisplayInNewLine
          ? _self.DisplayInNewLine
          : DisplayInNewLine // ignore: cast_nullable_to_non_nullable
              as String,
      MinLength: null == MinLength
          ? _self.MinLength
          : MinLength // ignore: cast_nullable_to_non_nullable
              as String,
      MaxLength: null == MaxLength
          ? _self.MaxLength
          : MaxLength // ignore: cast_nullable_to_non_nullable
              as String,
      ValidValues: null == ValidValues
          ? _self.ValidValues
          : ValidValues // ignore: cast_nullable_to_non_nullable
              as String,
      DisplayValidValuesOnHover: null == DisplayValidValuesOnHover
          ? _self.DisplayValidValuesOnHover
          : DisplayValidValuesOnHover // ignore: cast_nullable_to_non_nullable
              as String,
      FormRuleCode: null == FormRuleCode
          ? _self.FormRuleCode
          : FormRuleCode // ignore: cast_nullable_to_non_nullable
              as String,
      FormRuleSubCode: null == FormRuleSubCode
          ? _self.FormRuleSubCode
          : FormRuleSubCode // ignore: cast_nullable_to_non_nullable
              as String,
      FormRuleDescription: null == FormRuleDescription
          ? _self.FormRuleDescription
          : FormRuleDescription // ignore: cast_nullable_to_non_nullable
              as String,
      DisplaySection: null == DisplaySection
          ? _self.DisplaySection
          : DisplaySection // ignore: cast_nullable_to_non_nullable
              as String,
      DisplaySectionOrder: null == DisplaySectionOrder
          ? _self.DisplaySectionOrder
          : DisplaySectionOrder // ignore: cast_nullable_to_non_nullable
              as String,
      Linked: null == Linked
          ? _self.Linked
          : Linked // ignore: cast_nullable_to_non_nullable
              as String,
      LinkedWith: null == LinkedWith
          ? _self.LinkedWith
          : LinkedWith // ignore: cast_nullable_to_non_nullable
              as String,
      CreatedBy: null == CreatedBy
          ? _self.CreatedBy
          : CreatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      CreateDatetime: null == CreateDatetime
          ? _self.CreateDatetime
          : CreateDatetime // ignore: cast_nullable_to_non_nullable
              as String,
      UpdatedBy: null == UpdatedBy
          ? _self.UpdatedBy
          : UpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      UpdateDatetime: null == UpdateDatetime
          ? _self.UpdateDatetime
          : UpdateDatetime // ignore: cast_nullable_to_non_nullable
              as String,
      Status: null == Status
          ? _self.Status
          : Status // ignore: cast_nullable_to_non_nullable
              as String,
      RuleSeq: null == RuleSeq
          ? _self.RuleSeq
          : RuleSeq // ignore: cast_nullable_to_non_nullable
              as String,
      Prefix: null == Prefix
          ? _self.Prefix
          : Prefix // ignore: cast_nullable_to_non_nullable
              as String,
      Suffix: null == Suffix
          ? _self.Suffix
          : Suffix // ignore: cast_nullable_to_non_nullable
              as String,
      CriteriaMapOrg: null == CriteriaMapOrg
          ? _self.CriteriaMapOrg
          : CriteriaMapOrg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
