// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_details_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginationDetailsFz {
  @JsonKey(name: 'TotalRecords')
  int get totalRecords;
  @JsonKey(name: 'TotalPages')
  int get totalPages;
  @JsonKey(name: 'PageNumber')
  int get pageNumber;
  @JsonKey(name: 'PageSize')
  int get pageSize;

  /// Create a copy of PaginationDetailsFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaginationDetailsFzCopyWith<PaginationDetailsFz> get copyWith =>
      _$PaginationDetailsFzCopyWithImpl<PaginationDetailsFz>(
          this as PaginationDetailsFz, _$identity);

  /// Serializes this PaginationDetailsFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaginationDetailsFz &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalRecords, totalPages, pageNumber, pageSize);

  @override
  String toString() {
    return 'PaginationDetailsFz(totalRecords: $totalRecords, totalPages: $totalPages, pageNumber: $pageNumber, pageSize: $pageSize)';
  }
}

/// @nodoc
abstract mixin class $PaginationDetailsFzCopyWith<$Res> {
  factory $PaginationDetailsFzCopyWith(
          PaginationDetailsFz value, $Res Function(PaginationDetailsFz) _then) =
      _$PaginationDetailsFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalRecords') int totalRecords,
      @JsonKey(name: 'TotalPages') int totalPages,
      @JsonKey(name: 'PageNumber') int pageNumber,
      @JsonKey(name: 'PageSize') int pageSize});
}

/// @nodoc
class _$PaginationDetailsFzCopyWithImpl<$Res>
    implements $PaginationDetailsFzCopyWith<$Res> {
  _$PaginationDetailsFzCopyWithImpl(this._self, this._then);

  final PaginationDetailsFz _self;
  final $Res Function(PaginationDetailsFz) _then;

  /// Create a copy of PaginationDetailsFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? totalPages = null,
    Object? pageNumber = null,
    Object? pageSize = null,
  }) {
    return _then(_self.copyWith(
      totalRecords: null == totalRecords
          ? _self.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _self.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [PaginationDetailsFz].
extension PaginationDetailsFzPatterns on PaginationDetailsFz {
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
    TResult Function(_PaginationDetailsFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginationDetailsFz() when $default != null:
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
    TResult Function(_PaginationDetailsFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationDetailsFz():
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
    TResult? Function(_PaginationDetailsFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationDetailsFz() when $default != null:
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
            @JsonKey(name: 'TotalRecords') int totalRecords,
            @JsonKey(name: 'TotalPages') int totalPages,
            @JsonKey(name: 'PageNumber') int pageNumber,
            @JsonKey(name: 'PageSize') int pageSize)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaginationDetailsFz() when $default != null:
        return $default(_that.totalRecords, _that.totalPages, _that.pageNumber,
            _that.pageSize);
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
            @JsonKey(name: 'TotalRecords') int totalRecords,
            @JsonKey(name: 'TotalPages') int totalPages,
            @JsonKey(name: 'PageNumber') int pageNumber,
            @JsonKey(name: 'PageSize') int pageSize)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationDetailsFz():
        return $default(_that.totalRecords, _that.totalPages, _that.pageNumber,
            _that.pageSize);
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
            @JsonKey(name: 'TotalRecords') int totalRecords,
            @JsonKey(name: 'TotalPages') int totalPages,
            @JsonKey(name: 'PageNumber') int pageNumber,
            @JsonKey(name: 'PageSize') int pageSize)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaginationDetailsFz() when $default != null:
        return $default(_that.totalRecords, _that.totalPages, _that.pageNumber,
            _that.pageSize);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PaginationDetailsFz implements PaginationDetailsFz {
  const _PaginationDetailsFz(
      {@JsonKey(name: 'TotalRecords') this.totalRecords = 0,
      @JsonKey(name: 'TotalPages') this.totalPages = 0,
      @JsonKey(name: 'PageNumber') this.pageNumber = 1,
      @JsonKey(name: 'PageSize') this.pageSize = 10});
  factory _PaginationDetailsFz.fromJson(Map<String, dynamic> json) =>
      _$PaginationDetailsFzFromJson(json);

  @override
  @JsonKey(name: 'TotalRecords')
  final int totalRecords;
  @override
  @JsonKey(name: 'TotalPages')
  final int totalPages;
  @override
  @JsonKey(name: 'PageNumber')
  final int pageNumber;
  @override
  @JsonKey(name: 'PageSize')
  final int pageSize;

  /// Create a copy of PaginationDetailsFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaginationDetailsFzCopyWith<_PaginationDetailsFz> get copyWith =>
      __$PaginationDetailsFzCopyWithImpl<_PaginationDetailsFz>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaginationDetailsFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaginationDetailsFz &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalRecords, totalPages, pageNumber, pageSize);

  @override
  String toString() {
    return 'PaginationDetailsFz(totalRecords: $totalRecords, totalPages: $totalPages, pageNumber: $pageNumber, pageSize: $pageSize)';
  }
}

/// @nodoc
abstract mixin class _$PaginationDetailsFzCopyWith<$Res>
    implements $PaginationDetailsFzCopyWith<$Res> {
  factory _$PaginationDetailsFzCopyWith(_PaginationDetailsFz value,
          $Res Function(_PaginationDetailsFz) _then) =
      __$PaginationDetailsFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalRecords') int totalRecords,
      @JsonKey(name: 'TotalPages') int totalPages,
      @JsonKey(name: 'PageNumber') int pageNumber,
      @JsonKey(name: 'PageSize') int pageSize});
}

/// @nodoc
class __$PaginationDetailsFzCopyWithImpl<$Res>
    implements _$PaginationDetailsFzCopyWith<$Res> {
  __$PaginationDetailsFzCopyWithImpl(this._self, this._then);

  final _PaginationDetailsFz _self;
  final $Res Function(_PaginationDetailsFz) _then;

  /// Create a copy of PaginationDetailsFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalRecords = null,
    Object? totalPages = null,
    Object? pageNumber = null,
    Object? pageSize = null,
  }) {
    return _then(_PaginationDetailsFz(
      totalRecords: null == totalRecords
          ? _self.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _self.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
