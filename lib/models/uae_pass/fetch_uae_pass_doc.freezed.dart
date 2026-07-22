// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_uae_pass_doc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FetchUAEPassDoc {
  @JsonKey(name: 'UUID')
  String? get uUID;
  @JsonKey(name: 'EmiratesID')
  String? get emiratesID;
  @JsonKey(name: 'DocumentID1')
  String? get documentID1;
  @JsonKey(name: 'DocumentCode1')
  String? get documentCode1;
  @JsonKey(name: 'DocumentID2')
  String? get documentID2;
  @JsonKey(name: 'DocumentCode2')
  String? get documentCode2;
  @JsonKey(name: 'ReqAuthorized')
  String? get reqAuthorized;
  @JsonKey(name: 'DateOfBirth')
  DateTime? get dateOfBirth;
  @JsonKey(name: 'PlaceOfBirth')
  String? get placeOfBirth;
  @JsonKey(name: 'ExpiryDate1')
  DateTime? get expiryDate1;
  @JsonKey(name: 'EmployerName')
  String? get employerName;
  @JsonKey(name: 'NotificationExpiry')
  DateTime? get notificationExpiry;
  @JsonKey(name: 'VisualizationExpiry')
  DateTime? get visualizationExpiry;

  /// Create a copy of FetchUAEPassDoc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FetchUAEPassDocCopyWith<FetchUAEPassDoc> get copyWith =>
      _$FetchUAEPassDocCopyWithImpl<FetchUAEPassDoc>(
          this as FetchUAEPassDoc, _$identity);

  /// Serializes this FetchUAEPassDoc to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchUAEPassDoc &&
            (identical(other.uUID, uUID) || other.uUID == uUID) &&
            (identical(other.emiratesID, emiratesID) ||
                other.emiratesID == emiratesID) &&
            (identical(other.documentID1, documentID1) ||
                other.documentID1 == documentID1) &&
            (identical(other.documentCode1, documentCode1) ||
                other.documentCode1 == documentCode1) &&
            (identical(other.documentID2, documentID2) ||
                other.documentID2 == documentID2) &&
            (identical(other.documentCode2, documentCode2) ||
                other.documentCode2 == documentCode2) &&
            (identical(other.reqAuthorized, reqAuthorized) ||
                other.reqAuthorized == reqAuthorized) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.expiryDate1, expiryDate1) ||
                other.expiryDate1 == expiryDate1) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            (identical(other.notificationExpiry, notificationExpiry) ||
                other.notificationExpiry == notificationExpiry) &&
            (identical(other.visualizationExpiry, visualizationExpiry) ||
                other.visualizationExpiry == visualizationExpiry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uUID,
      emiratesID,
      documentID1,
      documentCode1,
      documentID2,
      documentCode2,
      reqAuthorized,
      dateOfBirth,
      placeOfBirth,
      expiryDate1,
      employerName,
      notificationExpiry,
      visualizationExpiry);

  @override
  String toString() {
    return 'FetchUAEPassDoc(uUID: $uUID, emiratesID: $emiratesID, documentID1: $documentID1, documentCode1: $documentCode1, documentID2: $documentID2, documentCode2: $documentCode2, reqAuthorized: $reqAuthorized, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, expiryDate1: $expiryDate1, employerName: $employerName, notificationExpiry: $notificationExpiry, visualizationExpiry: $visualizationExpiry)';
  }
}

/// @nodoc
abstract mixin class $FetchUAEPassDocCopyWith<$Res> {
  factory $FetchUAEPassDocCopyWith(
          FetchUAEPassDoc value, $Res Function(FetchUAEPassDoc) _then) =
      _$FetchUAEPassDocCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'UUID') String? uUID,
      @JsonKey(name: 'EmiratesID') String? emiratesID,
      @JsonKey(name: 'DocumentID1') String? documentID1,
      @JsonKey(name: 'DocumentCode1') String? documentCode1,
      @JsonKey(name: 'DocumentID2') String? documentID2,
      @JsonKey(name: 'DocumentCode2') String? documentCode2,
      @JsonKey(name: 'ReqAuthorized') String? reqAuthorized,
      @JsonKey(name: 'DateOfBirth') DateTime? dateOfBirth,
      @JsonKey(name: 'PlaceOfBirth') String? placeOfBirth,
      @JsonKey(name: 'ExpiryDate1') DateTime? expiryDate1,
      @JsonKey(name: 'EmployerName') String? employerName,
      @JsonKey(name: 'NotificationExpiry') DateTime? notificationExpiry,
      @JsonKey(name: 'VisualizationExpiry') DateTime? visualizationExpiry});
}

/// @nodoc
class _$FetchUAEPassDocCopyWithImpl<$Res>
    implements $FetchUAEPassDocCopyWith<$Res> {
  _$FetchUAEPassDocCopyWithImpl(this._self, this._then);

  final FetchUAEPassDoc _self;
  final $Res Function(FetchUAEPassDoc) _then;

  /// Create a copy of FetchUAEPassDoc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uUID = freezed,
    Object? emiratesID = freezed,
    Object? documentID1 = freezed,
    Object? documentCode1 = freezed,
    Object? documentID2 = freezed,
    Object? documentCode2 = freezed,
    Object? reqAuthorized = freezed,
    Object? dateOfBirth = freezed,
    Object? placeOfBirth = freezed,
    Object? expiryDate1 = freezed,
    Object? employerName = freezed,
    Object? notificationExpiry = freezed,
    Object? visualizationExpiry = freezed,
  }) {
    return _then(_self.copyWith(
      uUID: freezed == uUID
          ? _self.uUID
          : uUID // ignore: cast_nullable_to_non_nullable
              as String?,
      emiratesID: freezed == emiratesID
          ? _self.emiratesID
          : emiratesID // ignore: cast_nullable_to_non_nullable
              as String?,
      documentID1: freezed == documentID1
          ? _self.documentID1
          : documentID1 // ignore: cast_nullable_to_non_nullable
              as String?,
      documentCode1: freezed == documentCode1
          ? _self.documentCode1
          : documentCode1 // ignore: cast_nullable_to_non_nullable
              as String?,
      documentID2: freezed == documentID2
          ? _self.documentID2
          : documentID2 // ignore: cast_nullable_to_non_nullable
              as String?,
      documentCode2: freezed == documentCode2
          ? _self.documentCode2
          : documentCode2 // ignore: cast_nullable_to_non_nullable
              as String?,
      reqAuthorized: freezed == reqAuthorized
          ? _self.reqAuthorized
          : reqAuthorized // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      placeOfBirth: freezed == placeOfBirth
          ? _self.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate1: freezed == expiryDate1
          ? _self.expiryDate1
          : expiryDate1 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employerName: freezed == employerName
          ? _self.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationExpiry: freezed == notificationExpiry
          ? _self.notificationExpiry
          : notificationExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visualizationExpiry: freezed == visualizationExpiry
          ? _self.visualizationExpiry
          : visualizationExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [FetchUAEPassDoc].
extension FetchUAEPassDocPatterns on FetchUAEPassDoc {
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
    TResult Function(_FetchUAEPassDoc value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchUAEPassDoc() when $default != null:
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
    TResult Function(_FetchUAEPassDoc value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FetchUAEPassDoc():
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
    TResult? Function(_FetchUAEPassDoc value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FetchUAEPassDoc() when $default != null:
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
            @JsonKey(name: 'UUID') String? uUID,
            @JsonKey(name: 'EmiratesID') String? emiratesID,
            @JsonKey(name: 'DocumentID1') String? documentID1,
            @JsonKey(name: 'DocumentCode1') String? documentCode1,
            @JsonKey(name: 'DocumentID2') String? documentID2,
            @JsonKey(name: 'DocumentCode2') String? documentCode2,
            @JsonKey(name: 'ReqAuthorized') String? reqAuthorized,
            @JsonKey(name: 'DateOfBirth') DateTime? dateOfBirth,
            @JsonKey(name: 'PlaceOfBirth') String? placeOfBirth,
            @JsonKey(name: 'ExpiryDate1') DateTime? expiryDate1,
            @JsonKey(name: 'EmployerName') String? employerName,
            @JsonKey(name: 'NotificationExpiry') DateTime? notificationExpiry,
            @JsonKey(name: 'VisualizationExpiry')
            DateTime? visualizationExpiry)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FetchUAEPassDoc() when $default != null:
        return $default(
            _that.uUID,
            _that.emiratesID,
            _that.documentID1,
            _that.documentCode1,
            _that.documentID2,
            _that.documentCode2,
            _that.reqAuthorized,
            _that.dateOfBirth,
            _that.placeOfBirth,
            _that.expiryDate1,
            _that.employerName,
            _that.notificationExpiry,
            _that.visualizationExpiry);
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
            @JsonKey(name: 'UUID') String? uUID,
            @JsonKey(name: 'EmiratesID') String? emiratesID,
            @JsonKey(name: 'DocumentID1') String? documentID1,
            @JsonKey(name: 'DocumentCode1') String? documentCode1,
            @JsonKey(name: 'DocumentID2') String? documentID2,
            @JsonKey(name: 'DocumentCode2') String? documentCode2,
            @JsonKey(name: 'ReqAuthorized') String? reqAuthorized,
            @JsonKey(name: 'DateOfBirth') DateTime? dateOfBirth,
            @JsonKey(name: 'PlaceOfBirth') String? placeOfBirth,
            @JsonKey(name: 'ExpiryDate1') DateTime? expiryDate1,
            @JsonKey(name: 'EmployerName') String? employerName,
            @JsonKey(name: 'NotificationExpiry') DateTime? notificationExpiry,
            @JsonKey(name: 'VisualizationExpiry') DateTime? visualizationExpiry)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FetchUAEPassDoc():
        return $default(
            _that.uUID,
            _that.emiratesID,
            _that.documentID1,
            _that.documentCode1,
            _that.documentID2,
            _that.documentCode2,
            _that.reqAuthorized,
            _that.dateOfBirth,
            _that.placeOfBirth,
            _that.expiryDate1,
            _that.employerName,
            _that.notificationExpiry,
            _that.visualizationExpiry);
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
            @JsonKey(name: 'UUID') String? uUID,
            @JsonKey(name: 'EmiratesID') String? emiratesID,
            @JsonKey(name: 'DocumentID1') String? documentID1,
            @JsonKey(name: 'DocumentCode1') String? documentCode1,
            @JsonKey(name: 'DocumentID2') String? documentID2,
            @JsonKey(name: 'DocumentCode2') String? documentCode2,
            @JsonKey(name: 'ReqAuthorized') String? reqAuthorized,
            @JsonKey(name: 'DateOfBirth') DateTime? dateOfBirth,
            @JsonKey(name: 'PlaceOfBirth') String? placeOfBirth,
            @JsonKey(name: 'ExpiryDate1') DateTime? expiryDate1,
            @JsonKey(name: 'EmployerName') String? employerName,
            @JsonKey(name: 'NotificationExpiry') DateTime? notificationExpiry,
            @JsonKey(name: 'VisualizationExpiry')
            DateTime? visualizationExpiry)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FetchUAEPassDoc() when $default != null:
        return $default(
            _that.uUID,
            _that.emiratesID,
            _that.documentID1,
            _that.documentCode1,
            _that.documentID2,
            _that.documentCode2,
            _that.reqAuthorized,
            _that.dateOfBirth,
            _that.placeOfBirth,
            _that.expiryDate1,
            _that.employerName,
            _that.notificationExpiry,
            _that.visualizationExpiry);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FetchUAEPassDoc implements FetchUAEPassDoc {
  _FetchUAEPassDoc(
      {@JsonKey(name: 'UUID') this.uUID,
      @JsonKey(name: 'EmiratesID') this.emiratesID,
      @JsonKey(name: 'DocumentID1') this.documentID1,
      @JsonKey(name: 'DocumentCode1') this.documentCode1,
      @JsonKey(name: 'DocumentID2') this.documentID2,
      @JsonKey(name: 'DocumentCode2') this.documentCode2,
      @JsonKey(name: 'ReqAuthorized') this.reqAuthorized,
      @JsonKey(name: 'DateOfBirth') this.dateOfBirth,
      @JsonKey(name: 'PlaceOfBirth') this.placeOfBirth,
      @JsonKey(name: 'ExpiryDate1') this.expiryDate1,
      @JsonKey(name: 'EmployerName') this.employerName,
      @JsonKey(name: 'NotificationExpiry') this.notificationExpiry,
      @JsonKey(name: 'VisualizationExpiry') this.visualizationExpiry});
  factory _FetchUAEPassDoc.fromJson(Map<String, dynamic> json) =>
      _$FetchUAEPassDocFromJson(json);

  @override
  @JsonKey(name: 'UUID')
  final String? uUID;
  @override
  @JsonKey(name: 'EmiratesID')
  final String? emiratesID;
  @override
  @JsonKey(name: 'DocumentID1')
  final String? documentID1;
  @override
  @JsonKey(name: 'DocumentCode1')
  final String? documentCode1;
  @override
  @JsonKey(name: 'DocumentID2')
  final String? documentID2;
  @override
  @JsonKey(name: 'DocumentCode2')
  final String? documentCode2;
  @override
  @JsonKey(name: 'ReqAuthorized')
  final String? reqAuthorized;
  @override
  @JsonKey(name: 'DateOfBirth')
  final DateTime? dateOfBirth;
  @override
  @JsonKey(name: 'PlaceOfBirth')
  final String? placeOfBirth;
  @override
  @JsonKey(name: 'ExpiryDate1')
  final DateTime? expiryDate1;
  @override
  @JsonKey(name: 'EmployerName')
  final String? employerName;
  @override
  @JsonKey(name: 'NotificationExpiry')
  final DateTime? notificationExpiry;
  @override
  @JsonKey(name: 'VisualizationExpiry')
  final DateTime? visualizationExpiry;

  /// Create a copy of FetchUAEPassDoc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchUAEPassDocCopyWith<_FetchUAEPassDoc> get copyWith =>
      __$FetchUAEPassDocCopyWithImpl<_FetchUAEPassDoc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FetchUAEPassDocToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchUAEPassDoc &&
            (identical(other.uUID, uUID) || other.uUID == uUID) &&
            (identical(other.emiratesID, emiratesID) ||
                other.emiratesID == emiratesID) &&
            (identical(other.documentID1, documentID1) ||
                other.documentID1 == documentID1) &&
            (identical(other.documentCode1, documentCode1) ||
                other.documentCode1 == documentCode1) &&
            (identical(other.documentID2, documentID2) ||
                other.documentID2 == documentID2) &&
            (identical(other.documentCode2, documentCode2) ||
                other.documentCode2 == documentCode2) &&
            (identical(other.reqAuthorized, reqAuthorized) ||
                other.reqAuthorized == reqAuthorized) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.placeOfBirth, placeOfBirth) ||
                other.placeOfBirth == placeOfBirth) &&
            (identical(other.expiryDate1, expiryDate1) ||
                other.expiryDate1 == expiryDate1) &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            (identical(other.notificationExpiry, notificationExpiry) ||
                other.notificationExpiry == notificationExpiry) &&
            (identical(other.visualizationExpiry, visualizationExpiry) ||
                other.visualizationExpiry == visualizationExpiry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uUID,
      emiratesID,
      documentID1,
      documentCode1,
      documentID2,
      documentCode2,
      reqAuthorized,
      dateOfBirth,
      placeOfBirth,
      expiryDate1,
      employerName,
      notificationExpiry,
      visualizationExpiry);

  @override
  String toString() {
    return 'FetchUAEPassDoc(uUID: $uUID, emiratesID: $emiratesID, documentID1: $documentID1, documentCode1: $documentCode1, documentID2: $documentID2, documentCode2: $documentCode2, reqAuthorized: $reqAuthorized, dateOfBirth: $dateOfBirth, placeOfBirth: $placeOfBirth, expiryDate1: $expiryDate1, employerName: $employerName, notificationExpiry: $notificationExpiry, visualizationExpiry: $visualizationExpiry)';
  }
}

/// @nodoc
abstract mixin class _$FetchUAEPassDocCopyWith<$Res>
    implements $FetchUAEPassDocCopyWith<$Res> {
  factory _$FetchUAEPassDocCopyWith(
          _FetchUAEPassDoc value, $Res Function(_FetchUAEPassDoc) _then) =
      __$FetchUAEPassDocCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UUID') String? uUID,
      @JsonKey(name: 'EmiratesID') String? emiratesID,
      @JsonKey(name: 'DocumentID1') String? documentID1,
      @JsonKey(name: 'DocumentCode1') String? documentCode1,
      @JsonKey(name: 'DocumentID2') String? documentID2,
      @JsonKey(name: 'DocumentCode2') String? documentCode2,
      @JsonKey(name: 'ReqAuthorized') String? reqAuthorized,
      @JsonKey(name: 'DateOfBirth') DateTime? dateOfBirth,
      @JsonKey(name: 'PlaceOfBirth') String? placeOfBirth,
      @JsonKey(name: 'ExpiryDate1') DateTime? expiryDate1,
      @JsonKey(name: 'EmployerName') String? employerName,
      @JsonKey(name: 'NotificationExpiry') DateTime? notificationExpiry,
      @JsonKey(name: 'VisualizationExpiry') DateTime? visualizationExpiry});
}

/// @nodoc
class __$FetchUAEPassDocCopyWithImpl<$Res>
    implements _$FetchUAEPassDocCopyWith<$Res> {
  __$FetchUAEPassDocCopyWithImpl(this._self, this._then);

  final _FetchUAEPassDoc _self;
  final $Res Function(_FetchUAEPassDoc) _then;

  /// Create a copy of FetchUAEPassDoc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uUID = freezed,
    Object? emiratesID = freezed,
    Object? documentID1 = freezed,
    Object? documentCode1 = freezed,
    Object? documentID2 = freezed,
    Object? documentCode2 = freezed,
    Object? reqAuthorized = freezed,
    Object? dateOfBirth = freezed,
    Object? placeOfBirth = freezed,
    Object? expiryDate1 = freezed,
    Object? employerName = freezed,
    Object? notificationExpiry = freezed,
    Object? visualizationExpiry = freezed,
  }) {
    return _then(_FetchUAEPassDoc(
      uUID: freezed == uUID
          ? _self.uUID
          : uUID // ignore: cast_nullable_to_non_nullable
              as String?,
      emiratesID: freezed == emiratesID
          ? _self.emiratesID
          : emiratesID // ignore: cast_nullable_to_non_nullable
              as String?,
      documentID1: freezed == documentID1
          ? _self.documentID1
          : documentID1 // ignore: cast_nullable_to_non_nullable
              as String?,
      documentCode1: freezed == documentCode1
          ? _self.documentCode1
          : documentCode1 // ignore: cast_nullable_to_non_nullable
              as String?,
      documentID2: freezed == documentID2
          ? _self.documentID2
          : documentID2 // ignore: cast_nullable_to_non_nullable
              as String?,
      documentCode2: freezed == documentCode2
          ? _self.documentCode2
          : documentCode2 // ignore: cast_nullable_to_non_nullable
              as String?,
      reqAuthorized: freezed == reqAuthorized
          ? _self.reqAuthorized
          : reqAuthorized // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      placeOfBirth: freezed == placeOfBirth
          ? _self.placeOfBirth
          : placeOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate1: freezed == expiryDate1
          ? _self.expiryDate1
          : expiryDate1 // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      employerName: freezed == employerName
          ? _self.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationExpiry: freezed == notificationExpiry
          ? _self.notificationExpiry
          : notificationExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visualizationExpiry: freezed == visualizationExpiry
          ? _self.visualizationExpiry
          : visualizationExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
