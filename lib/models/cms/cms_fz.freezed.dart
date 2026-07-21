// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cms_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cms {
  @JsonKey(name: "MessageCode")
  String? get messageCode;
  @JsonKey(name: "MessageDetails")
  String? get messageDetails;
  @JsonKey(name: "CMSList")
  List<CmsList>? get cmsList;

  /// Create a copy of Cms
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CmsCopyWith<Cms> get copyWith =>
      _$CmsCopyWithImpl<Cms>(this as Cms, _$identity);

  /// Serializes this Cms to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Cms &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetails, messageDetails) ||
                other.messageDetails == messageDetails) &&
            const DeepCollectionEquality().equals(other.cmsList, cmsList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageCode, messageDetails,
      const DeepCollectionEquality().hash(cmsList));

  @override
  String toString() {
    return 'Cms(messageCode: $messageCode, messageDetails: $messageDetails, cmsList: $cmsList)';
  }
}

/// @nodoc
abstract mixin class $CmsCopyWith<$Res> {
  factory $CmsCopyWith(Cms value, $Res Function(Cms) _then) = _$CmsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "MessageCode") String? messageCode,
      @JsonKey(name: "MessageDetails") String? messageDetails,
      @JsonKey(name: "CMSList") List<CmsList>? cmsList});
}

/// @nodoc
class _$CmsCopyWithImpl<$Res> implements $CmsCopyWith<$Res> {
  _$CmsCopyWithImpl(this._self, this._then);

  final Cms _self;
  final $Res Function(Cms) _then;

  /// Create a copy of Cms
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageCode = freezed,
    Object? messageDetails = freezed,
    Object? cmsList = freezed,
  }) {
    return _then(_self.copyWith(
      messageCode: freezed == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messageDetails: freezed == messageDetails
          ? _self.messageDetails
          : messageDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      cmsList: freezed == cmsList
          ? _self.cmsList
          : cmsList // ignore: cast_nullable_to_non_nullable
              as List<CmsList>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Cms].
extension CmsPatterns on Cms {
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
    TResult Function(_Cms value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Cms() when $default != null:
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
    TResult Function(_Cms value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Cms():
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
    TResult? Function(_Cms value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Cms() when $default != null:
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
            @JsonKey(name: "MessageDetails") String? messageDetails,
            @JsonKey(name: "CMSList") List<CmsList>? cmsList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Cms() when $default != null:
        return $default(_that.messageCode, _that.messageDetails, _that.cmsList);
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
            @JsonKey(name: "MessageDetails") String? messageDetails,
            @JsonKey(name: "CMSList") List<CmsList>? cmsList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Cms():
        return $default(_that.messageCode, _that.messageDetails, _that.cmsList);
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
            @JsonKey(name: "MessageDetails") String? messageDetails,
            @JsonKey(name: "CMSList") List<CmsList>? cmsList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Cms() when $default != null:
        return $default(_that.messageCode, _that.messageDetails, _that.cmsList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Cms implements Cms {
  const _Cms(
      {@JsonKey(name: "MessageCode") this.messageCode,
      @JsonKey(name: "MessageDetails") this.messageDetails,
      @JsonKey(name: "CMSList") final List<CmsList>? cmsList})
      : _cmsList = cmsList;
  factory _Cms.fromJson(Map<String, dynamic> json) => _$CmsFromJson(json);

  @override
  @JsonKey(name: "MessageCode")
  final String? messageCode;
  @override
  @JsonKey(name: "MessageDetails")
  final String? messageDetails;
  final List<CmsList>? _cmsList;
  @override
  @JsonKey(name: "CMSList")
  List<CmsList>? get cmsList {
    final value = _cmsList;
    if (value == null) return null;
    if (_cmsList is EqualUnmodifiableListView) return _cmsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Cms
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CmsCopyWith<_Cms> get copyWith =>
      __$CmsCopyWithImpl<_Cms>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CmsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Cms &&
            (identical(other.messageCode, messageCode) ||
                other.messageCode == messageCode) &&
            (identical(other.messageDetails, messageDetails) ||
                other.messageDetails == messageDetails) &&
            const DeepCollectionEquality().equals(other._cmsList, _cmsList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, messageCode, messageDetails,
      const DeepCollectionEquality().hash(_cmsList));

  @override
  String toString() {
    return 'Cms(messageCode: $messageCode, messageDetails: $messageDetails, cmsList: $cmsList)';
  }
}

/// @nodoc
abstract mixin class _$CmsCopyWith<$Res> implements $CmsCopyWith<$Res> {
  factory _$CmsCopyWith(_Cms value, $Res Function(_Cms) _then) =
      __$CmsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "MessageCode") String? messageCode,
      @JsonKey(name: "MessageDetails") String? messageDetails,
      @JsonKey(name: "CMSList") List<CmsList>? cmsList});
}

/// @nodoc
class __$CmsCopyWithImpl<$Res> implements _$CmsCopyWith<$Res> {
  __$CmsCopyWithImpl(this._self, this._then);

  final _Cms _self;
  final $Res Function(_Cms) _then;

  /// Create a copy of Cms
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? messageCode = freezed,
    Object? messageDetails = freezed,
    Object? cmsList = freezed,
  }) {
    return _then(_Cms(
      messageCode: freezed == messageCode
          ? _self.messageCode
          : messageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      messageDetails: freezed == messageDetails
          ? _self.messageDetails
          : messageDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      cmsList: freezed == cmsList
          ? _self._cmsList
          : cmsList // ignore: cast_nullable_to_non_nullable
              as List<CmsList>?,
    ));
  }
}

/// @nodoc
mixin _$CmsList {
  @JsonKey(name: "Code")
  int? get code;
  @JsonKey(name: "ScreenName")
  String? get screenName;
  @JsonKey(name: "Image")
  String? get image;
  @JsonKey(name: "FileUrl")
  String? get fileUrl;
  @JsonKey(name: "ParameterName")
  String? get parameterName;
  @JsonKey(name: "TextHeading")
  String? get textHeading;
  @JsonKey(name: "Description")
  String? get description;
  @JsonKey(name: "Note")
  String? get note;
  @JsonKey(name: "Status")
  String? get status;
  @JsonKey(name: "LanguageCode")
  String? get languageCode;
  @JsonKey(name: "UserId")
  String? get userId;

  /// Create a copy of CmsList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CmsListCopyWith<CmsList> get copyWith =>
      _$CmsListCopyWithImpl<CmsList>(this as CmsList, _$identity);

  /// Serializes this CmsList to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CmsList &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.parameterName, parameterName) ||
                other.parameterName == parameterName) &&
            (identical(other.textHeading, textHeading) ||
                other.textHeading == textHeading) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      screenName,
      image,
      fileUrl,
      parameterName,
      textHeading,
      description,
      note,
      status,
      languageCode,
      userId);

  @override
  String toString() {
    return 'CmsList(code: $code, screenName: $screenName, image: $image, fileUrl: $fileUrl, parameterName: $parameterName, textHeading: $textHeading, description: $description, note: $note, status: $status, languageCode: $languageCode, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $CmsListCopyWith<$Res> {
  factory $CmsListCopyWith(CmsList value, $Res Function(CmsList) _then) =
      _$CmsListCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int? code,
      @JsonKey(name: "ScreenName") String? screenName,
      @JsonKey(name: "Image") String? image,
      @JsonKey(name: "FileUrl") String? fileUrl,
      @JsonKey(name: "ParameterName") String? parameterName,
      @JsonKey(name: "TextHeading") String? textHeading,
      @JsonKey(name: "Description") String? description,
      @JsonKey(name: "Note") String? note,
      @JsonKey(name: "Status") String? status,
      @JsonKey(name: "LanguageCode") String? languageCode,
      @JsonKey(name: "UserId") String? userId});
}

/// @nodoc
class _$CmsListCopyWithImpl<$Res> implements $CmsListCopyWith<$Res> {
  _$CmsListCopyWithImpl(this._self, this._then);

  final CmsList _self;
  final $Res Function(CmsList) _then;

  /// Create a copy of CmsList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? screenName = freezed,
    Object? image = freezed,
    Object? fileUrl = freezed,
    Object? parameterName = freezed,
    Object? textHeading = freezed,
    Object? description = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? languageCode = freezed,
    Object? userId = freezed,
  }) {
    return _then(_self.copyWith(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      screenName: freezed == screenName
          ? _self.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: freezed == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      parameterName: freezed == parameterName
          ? _self.parameterName
          : parameterName // ignore: cast_nullable_to_non_nullable
              as String?,
      textHeading: freezed == textHeading
          ? _self.textHeading
          : textHeading // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CmsList].
extension CmsListPatterns on CmsList {
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
    TResult Function(_CmsList value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CmsList() when $default != null:
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
    TResult Function(_CmsList value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CmsList():
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
    TResult? Function(_CmsList value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CmsList() when $default != null:
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
            @JsonKey(name: "Code") int? code,
            @JsonKey(name: "ScreenName") String? screenName,
            @JsonKey(name: "Image") String? image,
            @JsonKey(name: "FileUrl") String? fileUrl,
            @JsonKey(name: "ParameterName") String? parameterName,
            @JsonKey(name: "TextHeading") String? textHeading,
            @JsonKey(name: "Description") String? description,
            @JsonKey(name: "Note") String? note,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "LanguageCode") String? languageCode,
            @JsonKey(name: "UserId") String? userId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CmsList() when $default != null:
        return $default(
            _that.code,
            _that.screenName,
            _that.image,
            _that.fileUrl,
            _that.parameterName,
            _that.textHeading,
            _that.description,
            _that.note,
            _that.status,
            _that.languageCode,
            _that.userId);
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
            @JsonKey(name: "Code") int? code,
            @JsonKey(name: "ScreenName") String? screenName,
            @JsonKey(name: "Image") String? image,
            @JsonKey(name: "FileUrl") String? fileUrl,
            @JsonKey(name: "ParameterName") String? parameterName,
            @JsonKey(name: "TextHeading") String? textHeading,
            @JsonKey(name: "Description") String? description,
            @JsonKey(name: "Note") String? note,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "LanguageCode") String? languageCode,
            @JsonKey(name: "UserId") String? userId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CmsList():
        return $default(
            _that.code,
            _that.screenName,
            _that.image,
            _that.fileUrl,
            _that.parameterName,
            _that.textHeading,
            _that.description,
            _that.note,
            _that.status,
            _that.languageCode,
            _that.userId);
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
            @JsonKey(name: "Code") int? code,
            @JsonKey(name: "ScreenName") String? screenName,
            @JsonKey(name: "Image") String? image,
            @JsonKey(name: "FileUrl") String? fileUrl,
            @JsonKey(name: "ParameterName") String? parameterName,
            @JsonKey(name: "TextHeading") String? textHeading,
            @JsonKey(name: "Description") String? description,
            @JsonKey(name: "Note") String? note,
            @JsonKey(name: "Status") String? status,
            @JsonKey(name: "LanguageCode") String? languageCode,
            @JsonKey(name: "UserId") String? userId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CmsList() when $default != null:
        return $default(
            _that.code,
            _that.screenName,
            _that.image,
            _that.fileUrl,
            _that.parameterName,
            _that.textHeading,
            _that.description,
            _that.note,
            _that.status,
            _that.languageCode,
            _that.userId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CmsList implements CmsList {
  const _CmsList(
      {@JsonKey(name: "Code") this.code,
      @JsonKey(name: "ScreenName") this.screenName,
      @JsonKey(name: "Image") this.image,
      @JsonKey(name: "FileUrl") this.fileUrl,
      @JsonKey(name: "ParameterName") this.parameterName,
      @JsonKey(name: "TextHeading") this.textHeading,
      @JsonKey(name: "Description") this.description,
      @JsonKey(name: "Note") this.note,
      @JsonKey(name: "Status") this.status,
      @JsonKey(name: "LanguageCode") this.languageCode,
      @JsonKey(name: "UserId") this.userId});
  factory _CmsList.fromJson(Map<String, dynamic> json) =>
      _$CmsListFromJson(json);

  @override
  @JsonKey(name: "Code")
  final int? code;
  @override
  @JsonKey(name: "ScreenName")
  final String? screenName;
  @override
  @JsonKey(name: "Image")
  final String? image;
  @override
  @JsonKey(name: "FileUrl")
  final String? fileUrl;
  @override
  @JsonKey(name: "ParameterName")
  final String? parameterName;
  @override
  @JsonKey(name: "TextHeading")
  final String? textHeading;
  @override
  @JsonKey(name: "Description")
  final String? description;
  @override
  @JsonKey(name: "Note")
  final String? note;
  @override
  @JsonKey(name: "Status")
  final String? status;
  @override
  @JsonKey(name: "LanguageCode")
  final String? languageCode;
  @override
  @JsonKey(name: "UserId")
  final String? userId;

  /// Create a copy of CmsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CmsListCopyWith<_CmsList> get copyWith =>
      __$CmsListCopyWithImpl<_CmsList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CmsListToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CmsList &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.screenName, screenName) ||
                other.screenName == screenName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.parameterName, parameterName) ||
                other.parameterName == parameterName) &&
            (identical(other.textHeading, textHeading) ||
                other.textHeading == textHeading) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      screenName,
      image,
      fileUrl,
      parameterName,
      textHeading,
      description,
      note,
      status,
      languageCode,
      userId);

  @override
  String toString() {
    return 'CmsList(code: $code, screenName: $screenName, image: $image, fileUrl: $fileUrl, parameterName: $parameterName, textHeading: $textHeading, description: $description, note: $note, status: $status, languageCode: $languageCode, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$CmsListCopyWith<$Res> implements $CmsListCopyWith<$Res> {
  factory _$CmsListCopyWith(_CmsList value, $Res Function(_CmsList) _then) =
      __$CmsListCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Code") int? code,
      @JsonKey(name: "ScreenName") String? screenName,
      @JsonKey(name: "Image") String? image,
      @JsonKey(name: "FileUrl") String? fileUrl,
      @JsonKey(name: "ParameterName") String? parameterName,
      @JsonKey(name: "TextHeading") String? textHeading,
      @JsonKey(name: "Description") String? description,
      @JsonKey(name: "Note") String? note,
      @JsonKey(name: "Status") String? status,
      @JsonKey(name: "LanguageCode") String? languageCode,
      @JsonKey(name: "UserId") String? userId});
}

/// @nodoc
class __$CmsListCopyWithImpl<$Res> implements _$CmsListCopyWith<$Res> {
  __$CmsListCopyWithImpl(this._self, this._then);

  final _CmsList _self;
  final $Res Function(_CmsList) _then;

  /// Create a copy of CmsList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? screenName = freezed,
    Object? image = freezed,
    Object? fileUrl = freezed,
    Object? parameterName = freezed,
    Object? textHeading = freezed,
    Object? description = freezed,
    Object? note = freezed,
    Object? status = freezed,
    Object? languageCode = freezed,
    Object? userId = freezed,
  }) {
    return _then(_CmsList(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      screenName: freezed == screenName
          ? _self.screenName
          : screenName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: freezed == fileUrl
          ? _self.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      parameterName: freezed == parameterName
          ? _self.parameterName
          : parameterName // ignore: cast_nullable_to_non_nullable
              as String?,
      textHeading: freezed == textHeading
          ? _self.textHeading
          : textHeading // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
