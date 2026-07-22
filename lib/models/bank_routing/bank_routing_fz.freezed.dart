// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_routing_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BankRoutingFz {
  @JsonKey(name: "StatusCode")
  String? get statusCode;
  @JsonKey(name: "StatusMessage")
  String? get statusMessage;
  @JsonKey(name: "Data")
  Data? get data;

  /// Create a copy of BankRoutingFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BankRoutingFzCopyWith<BankRoutingFz> get copyWith =>
      _$BankRoutingFzCopyWithImpl<BankRoutingFz>(
          this as BankRoutingFz, _$identity);

  /// Serializes this BankRoutingFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BankRoutingFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage, data);

  @override
  String toString() {
    return 'BankRoutingFz(statusCode: $statusCode, statusMessage: $statusMessage, data: $data)';
  }
}

/// @nodoc
abstract mixin class $BankRoutingFzCopyWith<$Res> {
  factory $BankRoutingFzCopyWith(
          BankRoutingFz value, $Res Function(BankRoutingFz) _then) =
      _$BankRoutingFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "Data") Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$BankRoutingFzCopyWithImpl<$Res>
    implements $BankRoutingFzCopyWith<$Res> {
  _$BankRoutingFzCopyWithImpl(this._self, this._then);

  final BankRoutingFz _self;
  final $Res Function(BankRoutingFz) _then;

  /// Create a copy of BankRoutingFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of BankRoutingFz
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
}

/// Adds pattern-matching-related methods to [BankRoutingFz].
extension BankRoutingFzPatterns on BankRoutingFz {
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
    TResult Function(_BankRoutingFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankRoutingFz() when $default != null:
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
    TResult Function(_BankRoutingFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankRoutingFz():
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
    TResult? Function(_BankRoutingFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankRoutingFz() when $default != null:
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
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") Data? data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _BankRoutingFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.data);
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
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") Data? data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankRoutingFz():
        return $default(_that.statusCode, _that.statusMessage, _that.data);
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
            @JsonKey(name: "StatusMessage") String? statusMessage,
            @JsonKey(name: "Data") Data? data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _BankRoutingFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _BankRoutingFz implements BankRoutingFz {
  const _BankRoutingFz(
      {@JsonKey(name: "StatusCode") this.statusCode,
      @JsonKey(name: "StatusMessage") this.statusMessage,
      @JsonKey(name: "Data") this.data});
  factory _BankRoutingFz.fromJson(Map<String, dynamic> json) =>
      _$BankRoutingFzFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String? statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String? statusMessage;
  @override
  @JsonKey(name: "Data")
  final Data? data;

  /// Create a copy of BankRoutingFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BankRoutingFzCopyWith<_BankRoutingFz> get copyWith =>
      __$BankRoutingFzCopyWithImpl<_BankRoutingFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BankRoutingFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BankRoutingFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, statusMessage, data);

  @override
  String toString() {
    return 'BankRoutingFz(statusCode: $statusCode, statusMessage: $statusMessage, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$BankRoutingFzCopyWith<$Res>
    implements $BankRoutingFzCopyWith<$Res> {
  factory _$BankRoutingFzCopyWith(
          _BankRoutingFz value, $Res Function(_BankRoutingFz) _then) =
      __$BankRoutingFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "Data") Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$BankRoutingFzCopyWithImpl<$Res>
    implements _$BankRoutingFzCopyWith<$Res> {
  __$BankRoutingFzCopyWithImpl(this._self, this._then);

  final _BankRoutingFz _self;
  final $Res Function(_BankRoutingFz) _then;

  /// Create a copy of BankRoutingFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? data = freezed,
  }) {
    return _then(_BankRoutingFz(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }

  /// Create a copy of BankRoutingFz
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
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: "CategoryList")
  List<MasterResponseFZ>? get categoryList;
  @JsonKey(name: "CountryList")
  List<MasterResponseFZ>? get countryList;
  @JsonKey(name: "CurrencyList")
  List<MasterResponseFZ>? get currencyList;

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
                .equals(other.categoryList, categoryList) &&
            const DeepCollectionEquality()
                .equals(other.countryList, countryList) &&
            const DeepCollectionEquality()
                .equals(other.currencyList, currencyList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryList),
      const DeepCollectionEquality().hash(countryList),
      const DeepCollectionEquality().hash(currencyList));

  @override
  String toString() {
    return 'Data(categoryList: $categoryList, countryList: $countryList, currencyList: $currencyList)';
  }
}

/// @nodoc
abstract mixin class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) =
      _$DataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "CategoryList") List<MasterResponseFZ>? categoryList,
      @JsonKey(name: "CountryList") List<MasterResponseFZ>? countryList,
      @JsonKey(name: "CurrencyList") List<MasterResponseFZ>? currencyList});
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
    Object? categoryList = freezed,
    Object? countryList = freezed,
    Object? currencyList = freezed,
  }) {
    return _then(_self.copyWith(
      categoryList: freezed == categoryList
          ? _self.categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<MasterResponseFZ>?,
      countryList: freezed == countryList
          ? _self.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<MasterResponseFZ>?,
      currencyList: freezed == currencyList
          ? _self.currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<MasterResponseFZ>?,
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
            @JsonKey(name: "CategoryList") List<MasterResponseFZ>? categoryList,
            @JsonKey(name: "CountryList") List<MasterResponseFZ>? countryList,
            @JsonKey(name: "CurrencyList")
            List<MasterResponseFZ>? currencyList)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.categoryList, _that.countryList, _that.currencyList);
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
            @JsonKey(name: "CategoryList") List<MasterResponseFZ>? categoryList,
            @JsonKey(name: "CountryList") List<MasterResponseFZ>? countryList,
            @JsonKey(name: "CurrencyList") List<MasterResponseFZ>? currencyList)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data():
        return $default(
            _that.categoryList, _that.countryList, _that.currencyList);
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
            @JsonKey(name: "CategoryList") List<MasterResponseFZ>? categoryList,
            @JsonKey(name: "CountryList") List<MasterResponseFZ>? countryList,
            @JsonKey(name: "CurrencyList")
            List<MasterResponseFZ>? currencyList)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Data() when $default != null:
        return $default(
            _that.categoryList, _that.countryList, _that.currencyList);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Data implements Data {
  const _Data(
      {@JsonKey(name: "CategoryList")
      final List<MasterResponseFZ>? categoryList = const [],
      @JsonKey(name: "CountryList")
      final List<MasterResponseFZ>? countryList = const [],
      @JsonKey(name: "CurrencyList")
      final List<MasterResponseFZ>? currencyList = const []})
      : _categoryList = categoryList,
        _countryList = countryList,
        _currencyList = currencyList;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final List<MasterResponseFZ>? _categoryList;
  @override
  @JsonKey(name: "CategoryList")
  List<MasterResponseFZ>? get categoryList {
    final value = _categoryList;
    if (value == null) return null;
    if (_categoryList is EqualUnmodifiableListView) return _categoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MasterResponseFZ>? _countryList;
  @override
  @JsonKey(name: "CountryList")
  List<MasterResponseFZ>? get countryList {
    final value = _countryList;
    if (value == null) return null;
    if (_countryList is EqualUnmodifiableListView) return _countryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MasterResponseFZ>? _currencyList;
  @override
  @JsonKey(name: "CurrencyList")
  List<MasterResponseFZ>? get currencyList {
    final value = _currencyList;
    if (value == null) return null;
    if (_currencyList is EqualUnmodifiableListView) return _currencyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
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
                .equals(other._categoryList, _categoryList) &&
            const DeepCollectionEquality()
                .equals(other._countryList, _countryList) &&
            const DeepCollectionEquality()
                .equals(other._currencyList, _currencyList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categoryList),
      const DeepCollectionEquality().hash(_countryList),
      const DeepCollectionEquality().hash(_currencyList));

  @override
  String toString() {
    return 'Data(categoryList: $categoryList, countryList: $countryList, currencyList: $currencyList)';
  }
}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) =
      __$DataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "CategoryList") List<MasterResponseFZ>? categoryList,
      @JsonKey(name: "CountryList") List<MasterResponseFZ>? countryList,
      @JsonKey(name: "CurrencyList") List<MasterResponseFZ>? currencyList});
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
    Object? categoryList = freezed,
    Object? countryList = freezed,
    Object? currencyList = freezed,
  }) {
    return _then(_Data(
      categoryList: freezed == categoryList
          ? _self._categoryList
          : categoryList // ignore: cast_nullable_to_non_nullable
              as List<MasterResponseFZ>?,
      countryList: freezed == countryList
          ? _self._countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<MasterResponseFZ>?,
      currencyList: freezed == currencyList
          ? _self._currencyList
          : currencyList // ignore: cast_nullable_to_non_nullable
              as List<MasterResponseFZ>?,
    ));
  }
}

// dart format on
