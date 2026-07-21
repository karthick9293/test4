// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_ekyc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerEkyc {
  @JsonKey(name: "StatusCode")
  String? get statusCode;
  @JsonKey(name: "StatusMessage")
  String? get statusMessage;
  @JsonKey(name: "CustomMessageDetails")
  CustomMessageDetails? get customMessageDetails;
  @JsonKey(name: "CustomerCode")
  dynamic get customerCode;
  @JsonKey(name: "DocumentDetails")
  List<DocumentDetail>? get documentDetails;

  /// Create a copy of CustomerEkyc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerEkycCopyWith<CustomerEkyc> get copyWith =>
      _$CustomerEkycCopyWithImpl<CustomerEkyc>(
          this as CustomerEkyc, _$identity);

  /// Serializes this CustomerEkyc to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerEkyc &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            const DeepCollectionEquality()
                .equals(other.customerCode, customerCode) &&
            const DeepCollectionEquality()
                .equals(other.documentDetails, documentDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      customMessageDetails,
      const DeepCollectionEquality().hash(customerCode),
      const DeepCollectionEquality().hash(documentDetails));

  @override
  String toString() {
    return 'CustomerEkyc(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, customerCode: $customerCode, documentDetails: $documentDetails)';
  }
}

/// @nodoc
abstract mixin class $CustomerEkycCopyWith<$Res> {
  factory $CustomerEkycCopyWith(
          CustomerEkyc value, $Res Function(CustomerEkyc) _then) =
      _$CustomerEkycCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails,
      @JsonKey(name: "CustomerCode") dynamic customerCode,
      @JsonKey(name: "DocumentDetails") List<DocumentDetail>? documentDetails});

  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class _$CustomerEkycCopyWithImpl<$Res> implements $CustomerEkycCopyWith<$Res> {
  _$CustomerEkycCopyWithImpl(this._self, this._then);

  final CustomerEkyc _self;
  final $Res Function(CustomerEkyc) _then;

  /// Create a copy of CustomerEkyc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? customMessageDetails = freezed,
    Object? customerCode = freezed,
    Object? documentDetails = freezed,
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
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
      customerCode: freezed == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      documentDetails: freezed == documentDetails
          ? _self.documentDetails
          : documentDetails // ignore: cast_nullable_to_non_nullable
              as List<DocumentDetail>?,
    ));
  }

  /// Create a copy of CustomerEkyc
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

/// Adds pattern-matching-related methods to [CustomerEkyc].
extension CustomerEkycPatterns on CustomerEkyc {
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
    TResult Function(_CustomerEkyc value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerEkyc() when $default != null:
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
    TResult Function(_CustomerEkyc value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerEkyc():
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
    TResult? Function(_CustomerEkyc value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerEkyc() when $default != null:
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
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: "CustomerCode") dynamic customerCode,
            @JsonKey(name: "DocumentDetails")
            List<DocumentDetail>? documentDetails)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerEkyc() when $default != null:
        return $default(
            _that.statusCode,
            _that.statusMessage,
            _that.customMessageDetails,
            _that.customerCode,
            _that.documentDetails);
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
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: "CustomerCode") dynamic customerCode,
            @JsonKey(name: "DocumentDetails")
            List<DocumentDetail>? documentDetails)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerEkyc():
        return $default(
            _that.statusCode,
            _that.statusMessage,
            _that.customMessageDetails,
            _that.customerCode,
            _that.documentDetails);
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
            @JsonKey(name: "CustomMessageDetails")
            CustomMessageDetails? customMessageDetails,
            @JsonKey(name: "CustomerCode") dynamic customerCode,
            @JsonKey(name: "DocumentDetails")
            List<DocumentDetail>? documentDetails)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerEkyc() when $default != null:
        return $default(
            _that.statusCode,
            _that.statusMessage,
            _that.customMessageDetails,
            _that.customerCode,
            _that.documentDetails);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerEkyc implements CustomerEkyc {
  const _CustomerEkyc(
      {@JsonKey(name: "StatusCode") this.statusCode,
      @JsonKey(name: "StatusMessage") this.statusMessage,
      @JsonKey(name: "CustomMessageDetails") this.customMessageDetails,
      @JsonKey(name: "CustomerCode") this.customerCode,
      @JsonKey(name: "DocumentDetails")
      final List<DocumentDetail>? documentDetails})
      : _documentDetails = documentDetails;
  factory _CustomerEkyc.fromJson(Map<String, dynamic> json) =>
      _$CustomerEkycFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String? statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String? statusMessage;
  @override
  @JsonKey(name: "CustomMessageDetails")
  final CustomMessageDetails? customMessageDetails;
  @override
  @JsonKey(name: "CustomerCode")
  final dynamic customerCode;
  final List<DocumentDetail>? _documentDetails;
  @override
  @JsonKey(name: "DocumentDetails")
  List<DocumentDetail>? get documentDetails {
    final value = _documentDetails;
    if (value == null) return null;
    if (_documentDetails is EqualUnmodifiableListView) return _documentDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of CustomerEkyc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerEkycCopyWith<_CustomerEkyc> get copyWith =>
      __$CustomerEkycCopyWithImpl<_CustomerEkyc>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerEkycToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerEkyc &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.customMessageDetails, customMessageDetails) ||
                other.customMessageDetails == customMessageDetails) &&
            const DeepCollectionEquality()
                .equals(other.customerCode, customerCode) &&
            const DeepCollectionEquality()
                .equals(other._documentDetails, _documentDetails));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      customMessageDetails,
      const DeepCollectionEquality().hash(customerCode),
      const DeepCollectionEquality().hash(_documentDetails));

  @override
  String toString() {
    return 'CustomerEkyc(statusCode: $statusCode, statusMessage: $statusMessage, customMessageDetails: $customMessageDetails, customerCode: $customerCode, documentDetails: $documentDetails)';
  }
}

/// @nodoc
abstract mixin class _$CustomerEkycCopyWith<$Res>
    implements $CustomerEkycCopyWith<$Res> {
  factory _$CustomerEkycCopyWith(
          _CustomerEkyc value, $Res Function(_CustomerEkyc) _then) =
      __$CustomerEkycCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String? statusCode,
      @JsonKey(name: "StatusMessage") String? statusMessage,
      @JsonKey(name: "CustomMessageDetails")
      CustomMessageDetails? customMessageDetails,
      @JsonKey(name: "CustomerCode") dynamic customerCode,
      @JsonKey(name: "DocumentDetails") List<DocumentDetail>? documentDetails});

  @override
  $CustomMessageDetailsCopyWith<$Res>? get customMessageDetails;
}

/// @nodoc
class __$CustomerEkycCopyWithImpl<$Res>
    implements _$CustomerEkycCopyWith<$Res> {
  __$CustomerEkycCopyWithImpl(this._self, this._then);

  final _CustomerEkyc _self;
  final $Res Function(_CustomerEkyc) _then;

  /// Create a copy of CustomerEkyc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = freezed,
    Object? statusMessage = freezed,
    Object? customMessageDetails = freezed,
    Object? customerCode = freezed,
    Object? documentDetails = freezed,
  }) {
    return _then(_CustomerEkyc(
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String?,
      statusMessage: freezed == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      customMessageDetails: freezed == customMessageDetails
          ? _self.customMessageDetails
          : customMessageDetails // ignore: cast_nullable_to_non_nullable
              as CustomMessageDetails?,
      customerCode: freezed == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      documentDetails: freezed == documentDetails
          ? _self._documentDetails
          : documentDetails // ignore: cast_nullable_to_non_nullable
              as List<DocumentDetail>?,
    ));
  }

  /// Create a copy of CustomerEkyc
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
mixin _$DocumentDetail {
  @JsonKey(name: "DocumentId")
  String? get documentId;
  @JsonKey(name: "DocumentName")
  String? get documentName;
  @JsonKey(name: "DocumentType")
  String? get documentType;
  @JsonKey(name: "DocumentContent")
  String? get documentContent;
  @JsonKey(name: "Status")
  String? get status;

  /// Create a copy of DocumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DocumentDetailCopyWith<DocumentDetail> get copyWith =>
      _$DocumentDetailCopyWithImpl<DocumentDetail>(
          this as DocumentDetail, _$identity);

  /// Serializes this DocumentDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DocumentDetail &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentContent, documentContent) ||
                other.documentContent == documentContent) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, documentId, documentName,
      documentType, documentContent, status);

  @override
  String toString() {
    return 'DocumentDetail(documentId: $documentId, documentName: $documentName, documentType: $documentType, documentContent: $documentContent, status: $status)';
  }
}

/// @nodoc
abstract mixin class $DocumentDetailCopyWith<$Res> {
  factory $DocumentDetailCopyWith(
          DocumentDetail value, $Res Function(DocumentDetail) _then) =
      _$DocumentDetailCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "DocumentId") String? documentId,
      @JsonKey(name: "DocumentName") String? documentName,
      @JsonKey(name: "DocumentType") String? documentType,
      @JsonKey(name: "DocumentContent") String? documentContent,
      @JsonKey(name: "Status") String? status});
}

/// @nodoc
class _$DocumentDetailCopyWithImpl<$Res>
    implements $DocumentDetailCopyWith<$Res> {
  _$DocumentDetailCopyWithImpl(this._self, this._then);

  final DocumentDetail _self;
  final $Res Function(DocumentDetail) _then;

  /// Create a copy of DocumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentId = freezed,
    Object? documentName = freezed,
    Object? documentType = freezed,
    Object? documentContent = freezed,
    Object? status = freezed,
  }) {
    return _then(_self.copyWith(
      documentId: freezed == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      documentName: freezed == documentName
          ? _self.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: freezed == documentType
          ? _self.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String?,
      documentContent: freezed == documentContent
          ? _self.documentContent
          : documentContent // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DocumentDetail].
extension DocumentDetailPatterns on DocumentDetail {
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
    TResult Function(_DocumentDetail value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentDetail() when $default != null:
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
    TResult Function(_DocumentDetail value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDetail():
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
    TResult? Function(_DocumentDetail value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDetail() when $default != null:
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
            @JsonKey(name: "DocumentId") String? documentId,
            @JsonKey(name: "DocumentName") String? documentName,
            @JsonKey(name: "DocumentType") String? documentType,
            @JsonKey(name: "DocumentContent") String? documentContent,
            @JsonKey(name: "Status") String? status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DocumentDetail() when $default != null:
        return $default(_that.documentId, _that.documentName,
            _that.documentType, _that.documentContent, _that.status);
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
            @JsonKey(name: "DocumentId") String? documentId,
            @JsonKey(name: "DocumentName") String? documentName,
            @JsonKey(name: "DocumentType") String? documentType,
            @JsonKey(name: "DocumentContent") String? documentContent,
            @JsonKey(name: "Status") String? status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDetail():
        return $default(_that.documentId, _that.documentName,
            _that.documentType, _that.documentContent, _that.status);
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
            @JsonKey(name: "DocumentId") String? documentId,
            @JsonKey(name: "DocumentName") String? documentName,
            @JsonKey(name: "DocumentType") String? documentType,
            @JsonKey(name: "DocumentContent") String? documentContent,
            @JsonKey(name: "Status") String? status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DocumentDetail() when $default != null:
        return $default(_that.documentId, _that.documentName,
            _that.documentType, _that.documentContent, _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DocumentDetail implements DocumentDetail {
  const _DocumentDetail(
      {@JsonKey(name: "DocumentId") this.documentId,
      @JsonKey(name: "DocumentName") this.documentName,
      @JsonKey(name: "DocumentType") this.documentType,
      @JsonKey(name: "DocumentContent") this.documentContent,
      @JsonKey(name: "Status") this.status});
  factory _DocumentDetail.fromJson(Map<String, dynamic> json) =>
      _$DocumentDetailFromJson(json);

  @override
  @JsonKey(name: "DocumentId")
  final String? documentId;
  @override
  @JsonKey(name: "DocumentName")
  final String? documentName;
  @override
  @JsonKey(name: "DocumentType")
  final String? documentType;
  @override
  @JsonKey(name: "DocumentContent")
  final String? documentContent;
  @override
  @JsonKey(name: "Status")
  final String? status;

  /// Create a copy of DocumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DocumentDetailCopyWith<_DocumentDetail> get copyWith =>
      __$DocumentDetailCopyWithImpl<_DocumentDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DocumentDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DocumentDetail &&
            (identical(other.documentId, documentId) ||
                other.documentId == documentId) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.documentContent, documentContent) ||
                other.documentContent == documentContent) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, documentId, documentName,
      documentType, documentContent, status);

  @override
  String toString() {
    return 'DocumentDetail(documentId: $documentId, documentName: $documentName, documentType: $documentType, documentContent: $documentContent, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$DocumentDetailCopyWith<$Res>
    implements $DocumentDetailCopyWith<$Res> {
  factory _$DocumentDetailCopyWith(
          _DocumentDetail value, $Res Function(_DocumentDetail) _then) =
      __$DocumentDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "DocumentId") String? documentId,
      @JsonKey(name: "DocumentName") String? documentName,
      @JsonKey(name: "DocumentType") String? documentType,
      @JsonKey(name: "DocumentContent") String? documentContent,
      @JsonKey(name: "Status") String? status});
}

/// @nodoc
class __$DocumentDetailCopyWithImpl<$Res>
    implements _$DocumentDetailCopyWith<$Res> {
  __$DocumentDetailCopyWithImpl(this._self, this._then);

  final _DocumentDetail _self;
  final $Res Function(_DocumentDetail) _then;

  /// Create a copy of DocumentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? documentId = freezed,
    Object? documentName = freezed,
    Object? documentType = freezed,
    Object? documentContent = freezed,
    Object? status = freezed,
  }) {
    return _then(_DocumentDetail(
      documentId: freezed == documentId
          ? _self.documentId
          : documentId // ignore: cast_nullable_to_non_nullable
              as String?,
      documentName: freezed == documentName
          ? _self.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: freezed == documentType
          ? _self.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String?,
      documentContent: freezed == documentContent
          ? _self.documentContent
          : documentContent // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
