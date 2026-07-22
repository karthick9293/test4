// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsFZ {
  @JsonKey(name: 'Code')
  String? get code;
  @JsonKey(name: 'NewsTitle')
  String? get newsTitle;
  @JsonKey(name: 'NewsContent')
  String? get newsContent;
  @JsonKey(name: 'LanguageCode')
  String? get languageCode;

  /// Create a copy of NewsFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewsFZCopyWith<NewsFZ> get copyWith =>
      _$NewsFZCopyWithImpl<NewsFZ>(this as NewsFZ, _$identity);

  /// Serializes this NewsFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewsFZ &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.newsTitle, newsTitle) ||
                other.newsTitle == newsTitle) &&
            (identical(other.newsContent, newsContent) ||
                other.newsContent == newsContent) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, newsTitle, newsContent, languageCode);

  @override
  String toString() {
    return 'NewsFZ(code: $code, newsTitle: $newsTitle, newsContent: $newsContent, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class $NewsFZCopyWith<$Res> {
  factory $NewsFZCopyWith(NewsFZ value, $Res Function(NewsFZ) _then) =
      _$NewsFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'NewsTitle') String? newsTitle,
      @JsonKey(name: 'NewsContent') String? newsContent,
      @JsonKey(name: 'LanguageCode') String? languageCode});
}

/// @nodoc
class _$NewsFZCopyWithImpl<$Res> implements $NewsFZCopyWith<$Res> {
  _$NewsFZCopyWithImpl(this._self, this._then);

  final NewsFZ _self;
  final $Res Function(NewsFZ) _then;

  /// Create a copy of NewsFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? newsTitle = freezed,
    Object? newsContent = freezed,
    Object? languageCode = freezed,
  }) {
    return _then(_self.copyWith(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      newsTitle: freezed == newsTitle
          ? _self.newsTitle
          : newsTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      newsContent: freezed == newsContent
          ? _self.newsContent
          : newsContent // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [NewsFZ].
extension NewsFZPatterns on NewsFZ {
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
    TResult Function(_NewsFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsFZ() when $default != null:
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
    TResult Function(_NewsFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsFZ():
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
    TResult? Function(_NewsFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsFZ() when $default != null:
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
            @JsonKey(name: 'Code') String? code,
            @JsonKey(name: 'NewsTitle') String? newsTitle,
            @JsonKey(name: 'NewsContent') String? newsContent,
            @JsonKey(name: 'LanguageCode') String? languageCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NewsFZ() when $default != null:
        return $default(
            _that.code, _that.newsTitle, _that.newsContent, _that.languageCode);
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
            @JsonKey(name: 'Code') String? code,
            @JsonKey(name: 'NewsTitle') String? newsTitle,
            @JsonKey(name: 'NewsContent') String? newsContent,
            @JsonKey(name: 'LanguageCode') String? languageCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsFZ():
        return $default(
            _that.code, _that.newsTitle, _that.newsContent, _that.languageCode);
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
            @JsonKey(name: 'Code') String? code,
            @JsonKey(name: 'NewsTitle') String? newsTitle,
            @JsonKey(name: 'NewsContent') String? newsContent,
            @JsonKey(name: 'LanguageCode') String? languageCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NewsFZ() when $default != null:
        return $default(
            _that.code, _that.newsTitle, _that.newsContent, _that.languageCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NewsFZ implements NewsFZ {
  const _NewsFZ(
      {@JsonKey(name: 'Code') this.code,
      @JsonKey(name: 'NewsTitle') this.newsTitle,
      @JsonKey(name: 'NewsContent') this.newsContent,
      @JsonKey(name: 'LanguageCode') this.languageCode});
  factory _NewsFZ.fromJson(Map<String, dynamic> json) => _$NewsFZFromJson(json);

  @override
  @JsonKey(name: 'Code')
  final String? code;
  @override
  @JsonKey(name: 'NewsTitle')
  final String? newsTitle;
  @override
  @JsonKey(name: 'NewsContent')
  final String? newsContent;
  @override
  @JsonKey(name: 'LanguageCode')
  final String? languageCode;

  /// Create a copy of NewsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsFZCopyWith<_NewsFZ> get copyWith =>
      __$NewsFZCopyWithImpl<_NewsFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NewsFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsFZ &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.newsTitle, newsTitle) ||
                other.newsTitle == newsTitle) &&
            (identical(other.newsContent, newsContent) ||
                other.newsContent == newsContent) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, code, newsTitle, newsContent, languageCode);

  @override
  String toString() {
    return 'NewsFZ(code: $code, newsTitle: $newsTitle, newsContent: $newsContent, languageCode: $languageCode)';
  }
}

/// @nodoc
abstract mixin class _$NewsFZCopyWith<$Res> implements $NewsFZCopyWith<$Res> {
  factory _$NewsFZCopyWith(_NewsFZ value, $Res Function(_NewsFZ) _then) =
      __$NewsFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'NewsTitle') String? newsTitle,
      @JsonKey(name: 'NewsContent') String? newsContent,
      @JsonKey(name: 'LanguageCode') String? languageCode});
}

/// @nodoc
class __$NewsFZCopyWithImpl<$Res> implements _$NewsFZCopyWith<$Res> {
  __$NewsFZCopyWithImpl(this._self, this._then);

  final _NewsFZ _self;
  final $Res Function(_NewsFZ) _then;

  /// Create a copy of NewsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = freezed,
    Object? newsTitle = freezed,
    Object? newsContent = freezed,
    Object? languageCode = freezed,
  }) {
    return _then(_NewsFZ(
      code: freezed == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      newsTitle: freezed == newsTitle
          ? _self.newsTitle
          : newsTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      newsContent: freezed == newsContent
          ? _self.newsContent
          : newsContent // ignore: cast_nullable_to_non_nullable
              as String?,
      languageCode: freezed == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
