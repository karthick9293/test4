// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_details_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionFz {
  @JsonKey(name: "StatusCode")
  String get statusCode;
  @JsonKey(name: "StatusMessage")
  String get statusMessage;
  @JsonKey(name: "PageSize")
  int get pageSize;
  @JsonKey(name: "CurrentPage")
  int get currentPage;
  @JsonKey(name: "TotalPages")
  int get totalPages;
  @JsonKey(name: "TotalCount")
  int get totalCount;
  @JsonKey(name: "Data")
  List<TransactionDetailsFz> get data;

  /// Create a copy of TransactionFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionFzCopyWith<TransactionFz> get copyWith =>
      _$TransactionFzCopyWithImpl<TransactionFz>(
          this as TransactionFz, _$identity);

  /// Serializes this TransactionFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      pageSize,
      currentPage,
      totalPages,
      totalCount,
      const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'TransactionFz(statusCode: $statusCode, statusMessage: $statusMessage, pageSize: $pageSize, currentPage: $currentPage, totalPages: $totalPages, totalCount: $totalCount, data: $data)';
  }
}

/// @nodoc
abstract mixin class $TransactionFzCopyWith<$Res> {
  factory $TransactionFzCopyWith(
          TransactionFz value, $Res Function(TransactionFz) _then) =
      _$TransactionFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String statusCode,
      @JsonKey(name: "StatusMessage") String statusMessage,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "CurrentPage") int currentPage,
      @JsonKey(name: "TotalPages") int totalPages,
      @JsonKey(name: "TotalCount") int totalCount,
      @JsonKey(name: "Data") List<TransactionDetailsFz> data});
}

/// @nodoc
class _$TransactionFzCopyWithImpl<$Res>
    implements $TransactionFzCopyWith<$Res> {
  _$TransactionFzCopyWithImpl(this._self, this._then);

  final TransactionFz _self;
  final $Res Function(TransactionFz) _then;

  /// Create a copy of TransactionFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? pageSize = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalCount = null,
    Object? data = null,
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
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionDetailsFz>,
    ));
  }
}

/// Adds pattern-matching-related methods to [TransactionFz].
extension TransactionFzPatterns on TransactionFz {
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
    TResult Function(_TransactionFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionFz() when $default != null:
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
    TResult Function(_TransactionFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionFz():
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
    TResult? Function(_TransactionFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionFz() when $default != null:
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
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage,
            @JsonKey(name: "PageSize") int pageSize,
            @JsonKey(name: "CurrentPage") int currentPage,
            @JsonKey(name: "TotalPages") int totalPages,
            @JsonKey(name: "TotalCount") int totalCount,
            @JsonKey(name: "Data") List<TransactionDetailsFz> data)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.pageSize,
            _that.currentPage, _that.totalPages, _that.totalCount, _that.data);
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
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage,
            @JsonKey(name: "PageSize") int pageSize,
            @JsonKey(name: "CurrentPage") int currentPage,
            @JsonKey(name: "TotalPages") int totalPages,
            @JsonKey(name: "TotalCount") int totalCount,
            @JsonKey(name: "Data") List<TransactionDetailsFz> data)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionFz():
        return $default(_that.statusCode, _that.statusMessage, _that.pageSize,
            _that.currentPage, _that.totalPages, _that.totalCount, _that.data);
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
            @JsonKey(name: "StatusCode") String statusCode,
            @JsonKey(name: "StatusMessage") String statusMessage,
            @JsonKey(name: "PageSize") int pageSize,
            @JsonKey(name: "CurrentPage") int currentPage,
            @JsonKey(name: "TotalPages") int totalPages,
            @JsonKey(name: "TotalCount") int totalCount,
            @JsonKey(name: "Data") List<TransactionDetailsFz> data)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionFz() when $default != null:
        return $default(_that.statusCode, _that.statusMessage, _that.pageSize,
            _that.currentPage, _that.totalPages, _that.totalCount, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TransactionFz implements TransactionFz {
  const _TransactionFz(
      {@JsonKey(name: "StatusCode") this.statusCode = '',
      @JsonKey(name: "StatusMessage") this.statusMessage = '',
      @JsonKey(name: "PageSize") this.pageSize = 0,
      @JsonKey(name: "CurrentPage") this.currentPage = 0,
      @JsonKey(name: "TotalPages") this.totalPages = 0,
      @JsonKey(name: "TotalCount") this.totalCount = 0,
      @JsonKey(name: "Data") final List<TransactionDetailsFz> data = const []})
      : _data = data;
  factory _TransactionFz.fromJson(Map<String, dynamic> json) =>
      _$TransactionFzFromJson(json);

  @override
  @JsonKey(name: "StatusCode")
  final String statusCode;
  @override
  @JsonKey(name: "StatusMessage")
  final String statusMessage;
  @override
  @JsonKey(name: "PageSize")
  final int pageSize;
  @override
  @JsonKey(name: "CurrentPage")
  final int currentPage;
  @override
  @JsonKey(name: "TotalPages")
  final int totalPages;
  @override
  @JsonKey(name: "TotalCount")
  final int totalCount;
  final List<TransactionDetailsFz> _data;
  @override
  @JsonKey(name: "Data")
  List<TransactionDetailsFz> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of TransactionFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionFzCopyWith<_TransactionFz> get copyWith =>
      __$TransactionFzCopyWithImpl<_TransactionFz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionFz &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.statusMessage, statusMessage) ||
                other.statusMessage == statusMessage) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      statusMessage,
      pageSize,
      currentPage,
      totalPages,
      totalCount,
      const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'TransactionFz(statusCode: $statusCode, statusMessage: $statusMessage, pageSize: $pageSize, currentPage: $currentPage, totalPages: $totalPages, totalCount: $totalCount, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$TransactionFzCopyWith<$Res>
    implements $TransactionFzCopyWith<$Res> {
  factory _$TransactionFzCopyWith(
          _TransactionFz value, $Res Function(_TransactionFz) _then) =
      __$TransactionFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "StatusCode") String statusCode,
      @JsonKey(name: "StatusMessage") String statusMessage,
      @JsonKey(name: "PageSize") int pageSize,
      @JsonKey(name: "CurrentPage") int currentPage,
      @JsonKey(name: "TotalPages") int totalPages,
      @JsonKey(name: "TotalCount") int totalCount,
      @JsonKey(name: "Data") List<TransactionDetailsFz> data});
}

/// @nodoc
class __$TransactionFzCopyWithImpl<$Res>
    implements _$TransactionFzCopyWith<$Res> {
  __$TransactionFzCopyWithImpl(this._self, this._then);

  final _TransactionFz _self;
  final $Res Function(_TransactionFz) _then;

  /// Create a copy of TransactionFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? statusMessage = null,
    Object? pageSize = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(_TransactionFz(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as String,
      statusMessage: null == statusMessage
          ? _self.statusMessage
          : statusMessage // ignore: cast_nullable_to_non_nullable
              as String,
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _self.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionDetailsFz>,
    ));
  }
}

/// @nodoc
mixin _$TransactionDetailsFz {
  @JsonKey(name: 'ReferenceNo')
  String? get transactionReference;
  @JsonKey(name: 'ChqNo')
  String? get chqNo;
  @JsonKey(
      name: 'TranDate', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
  DateTime? get transactionDate;
  @JsonKey(name: "CustomerName", readValue: _readCustName)
  String? get customerName;
  @JsonKey(name: 'CustomerFirstName')
  String? get custFirstName;
  @JsonKey(name: 'CustomerMiddleName')
  String? get custMiddleName;
  @JsonKey(name: 'CustomerLastName')
  String? get custLastName;
  @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
  String? get beneficiaryName;
  @JsonKey(name: 'BenfName')
  String? get benfFirstName;
  @JsonKey(name: 'BenfName2')
  String? get benfMiddleName;
  @JsonKey(name: 'BenfName3')
  String? get benfLastName;
  @JsonKey(name: 'BenfCountry')
  String? get benfCountry;
  @JsonKey(name: 'BenfCurrencyCode')
  String? get toCurrencyCode;
  @JsonKey(name: 'CurrencyCode')
  String? get fromCurrencyCode;
  @JsonKey(name: 'AccountNo')
  String? get accountNumber;
  @JsonKey(name: 'BankName')
  String? get bankName;
  @JsonKey(name: 'FcyAmount')
  double? get paymentAmount;
  @JsonKey(name: 'LcyAmount')
  String? get receivedAmount;
  @JsonKey(name: 'Charges')
  String? get charge;
  @JsonKey(name: 'TaxAmount')
  double? get taxAmount;
  @JsonKey(name: 'NetAmount')
  double? get netAmount;
  @JsonKey(name: 'MultiplicationRate')
  double? get multiplicationRate; // @JsonKey(name: 'Status') String? status,
  @JsonKey(name: 'BeneficiaryMobile')
  String? get beneficiaryMobile;
  @JsonKey(name: 'ServMode')
  String? get servMode;
  @JsonKey(name: 'PinNumber')
  String? get pinNumber;
  @JsonKey(name: 'PayMode')
  String? get payMode;
  @JsonKey(name: 'PayModeDesc')
  String? get payModeDesc;
  @JsonKey(name: 'PaymentStatus')
  String? get paymentStatus;
  @JsonKey(name: 'BneficiaryId')
  String? get bneficiaryId;
  @JsonKey(name: 'ServiceCode')
  String? get serviceCode;
  @JsonKey(name: 'ServiceType')
  String? get serviceType;
  @JsonKey(name: 'BenfActiveStatus')
  String? get benfActiveStatus;
  @JsonKey(name: 'ReadyForCancel')
  String? get readyForCancel;
  @JsonKey(name: 'TransactionStatus')
  String? get transactionStatus;
  @JsonKey(name: 'ServiceProvider')
  String? get serviceProvider;
  @JsonKey(name: 'PaymentRefNo')
  String? get paymentRefNo;
  @JsonKey(name: 'DivisionRate')
  double? get divisionRate;
  @JsonKey(name: 'Header')
  String? get header;
  @JsonKey(name: 'IsMobileTxn')
  bool? get isMobileTxn;
  @JsonKey(name: 'IsCorrespondentActive')
  String? get isCorrespondentActive;
  @JsonKey(name: 'BranchName')
  String? get branchName;
  @JsonKey(name: 'Purpose')
  String? get purpose;
  @JsonKey(name: 'IfscCode')
  String? get ifscCode;
  @JsonKey(name: 'Rebate')
  String? get rebate;
  @JsonKey(name: 'BranchCode')
  String? get branchCode;
  @JsonKey(name: 'Customer')
  String? get customer;
  @JsonKey(name: 'Email')
  String? get email;
  @JsonKey(name: 'TaxCard')
  String? get taxCard;
  @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin)
  double? get customerVatin;
  @JsonKey(name: 'ArieEmployeeFlag')
  String? get arieEmployeeFlag;
  @JsonKey(name: 'Relationship')
  String? get relationship;
  @JsonKey(name: 'DestinationCountryCode')
  String? get destinationCountryCode;
  @JsonKey(name: 'DestinationCountry')
  String? get destinationCountry;
  @JsonKey(name: 'CR')
  String? get cr;
  @JsonKey(name: 'CustomerNationality')
  String? get customerNationality;
  @JsonKey(name: 'CustomerNationalityCode')
  String? get customerNationalityCode;
  @JsonKey(name: 'Source')
  String? get source;
  @JsonKey(name: 'BeneficiaryNationality')
  String? get beneficiaryNationality;
  @JsonKey(name: 'BeneficiaryAddress')
  String? get beneficiaryAddress;
  @JsonKey(name: 'BeneficiaryCountryCode')
  String? get beneficiaryCountryCode;
  @JsonKey(name: 'Correspondent')
  String? get correspondent;
  @JsonKey(name: 'Profession')
  String? get profession;
  @JsonKey(name: 'BeneficiaryType')
  String? get beneficiaryType;
  @JsonKey(name: 'CustomerIdDescription')
  String? get customerIdDescription;
  @JsonKey(name: 'VisaType')
  String? get visaType;
  @JsonKey(name: 'CustomerType')
  String? get customerType;
  @JsonKey(name: 'BranchId')
  String? get branchId;
  @JsonKey(name: 'BirthCountryCode')
  String? get birthCountryCode;
  @JsonKey(name: 'BirthCountry')
  String? get birthCountry;
  @JsonKey(name: 'CustomerIdNo')
  String? get customerIdNo;
  @JsonKey(name: 'CustomerCode')
  String? get customerCode;
  @JsonKey(name: 'IsPep')
  String? get isPep;
  @JsonKey(name: 'IdCode')
  String? get idCode;
  @JsonKey(name: 'PaymentType')
  String? get paymentType;
  @JsonKey(name: 'CustomerDob')
  String? get customerDob;
  @JsonKey(name: 'IdIssuePlace')
  String? get idIssuePlace;
  @JsonKey(
      name: 'IdIssueDate', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
  DateTime? get idIssueDate;
  @JsonKey(name: 'IdType')
  String? get idType;
  @JsonKey(name: 'IdDescription')
  String? get idDescription;
  @JsonKey(
      name: 'IdExpiry', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
  DateTime? get idExpiry;
  @JsonKey(name: 'Phone')
  String? get phone;
  @JsonKey(name: 'Address')
  String? get address;
  @JsonKey(name: 'CompanyName')
  String? get companyName;
  @JsonKey(name: 'TransactionService')
  String? get transactionService;
  @JsonKey(name: 'IsIntegration')
  String? get isIntegration;

  /// Create a copy of TransactionDetailsFz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionDetailsFzCopyWith<TransactionDetailsFz> get copyWith =>
      _$TransactionDetailsFzCopyWithImpl<TransactionDetailsFz>(
          this as TransactionDetailsFz, _$identity);

  /// Serializes this TransactionDetailsFz to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionDetailsFz &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.chqNo, chqNo) || other.chqNo == chqNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.custFirstName, custFirstName) ||
                other.custFirstName == custFirstName) &&
            (identical(other.custMiddleName, custMiddleName) ||
                other.custMiddleName == custMiddleName) &&
            (identical(other.custLastName, custLastName) ||
                other.custLastName == custLastName) &&
            (identical(other.beneficiaryName, beneficiaryName) ||
                other.beneficiaryName == beneficiaryName) &&
            (identical(other.benfFirstName, benfFirstName) ||
                other.benfFirstName == benfFirstName) &&
            (identical(other.benfMiddleName, benfMiddleName) ||
                other.benfMiddleName == benfMiddleName) &&
            (identical(other.benfLastName, benfLastName) ||
                other.benfLastName == benfLastName) &&
            (identical(other.benfCountry, benfCountry) ||
                other.benfCountry == benfCountry) &&
            (identical(other.toCurrencyCode, toCurrencyCode) ||
                other.toCurrencyCode == toCurrencyCode) &&
            (identical(other.fromCurrencyCode, fromCurrencyCode) ||
                other.fromCurrencyCode == fromCurrencyCode) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.receivedAmount, receivedAmount) ||
                other.receivedAmount == receivedAmount) &&
            (identical(other.charge, charge) || other.charge == charge) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.multiplicationRate, multiplicationRate) ||
                other.multiplicationRate == multiplicationRate) &&
            (identical(other.beneficiaryMobile, beneficiaryMobile) ||
                other.beneficiaryMobile == beneficiaryMobile) &&
            (identical(other.servMode, servMode) ||
                other.servMode == servMode) &&
            (identical(other.pinNumber, pinNumber) ||
                other.pinNumber == pinNumber) &&
            (identical(other.payMode, payMode) || other.payMode == payMode) &&
            (identical(other.payModeDesc, payModeDesc) ||
                other.payModeDesc == payModeDesc) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.bneficiaryId, bneficiaryId) ||
                other.bneficiaryId == bneficiaryId) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.benfActiveStatus, benfActiveStatus) ||
                other.benfActiveStatus == benfActiveStatus) &&
            (identical(other.readyForCancel, readyForCancel) ||
                other.readyForCancel == readyForCancel) &&
            (identical(other.transactionStatus, transactionStatus) ||
                other.transactionStatus == transactionStatus) &&
            (identical(other.serviceProvider, serviceProvider) ||
                other.serviceProvider == serviceProvider) &&
            (identical(other.paymentRefNo, paymentRefNo) ||
                other.paymentRefNo == paymentRefNo) &&
            (identical(other.divisionRate, divisionRate) ||
                other.divisionRate == divisionRate) &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.isMobileTxn, isMobileTxn) ||
                other.isMobileTxn == isMobileTxn) &&
            (identical(other.isCorrespondentActive, isCorrespondentActive) ||
                other.isCorrespondentActive == isCorrespondentActive) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.rebate, rebate) || other.rebate == rebate) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.taxCard, taxCard) || other.taxCard == taxCard) &&
            (identical(other.customerVatin, customerVatin) ||
                other.customerVatin == customerVatin) &&
            (identical(other.arieEmployeeFlag, arieEmployeeFlag) ||
                other.arieEmployeeFlag == arieEmployeeFlag) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            (identical(other.destinationCountryCode, destinationCountryCode) || other.destinationCountryCode == destinationCountryCode) &&
            (identical(other.destinationCountry, destinationCountry) || other.destinationCountry == destinationCountry) &&
            (identical(other.cr, cr) || other.cr == cr) &&
            (identical(other.customerNationality, customerNationality) || other.customerNationality == customerNationality) &&
            (identical(other.customerNationalityCode, customerNationalityCode) || other.customerNationalityCode == customerNationalityCode) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.beneficiaryNationality, beneficiaryNationality) || other.beneficiaryNationality == beneficiaryNationality) &&
            (identical(other.beneficiaryAddress, beneficiaryAddress) || other.beneficiaryAddress == beneficiaryAddress) &&
            (identical(other.beneficiaryCountryCode, beneficiaryCountryCode) || other.beneficiaryCountryCode == beneficiaryCountryCode) &&
            (identical(other.correspondent, correspondent) || other.correspondent == correspondent) &&
            (identical(other.profession, profession) || other.profession == profession) &&
            (identical(other.beneficiaryType, beneficiaryType) || other.beneficiaryType == beneficiaryType) &&
            (identical(other.customerIdDescription, customerIdDescription) || other.customerIdDescription == customerIdDescription) &&
            (identical(other.visaType, visaType) || other.visaType == visaType) &&
            (identical(other.customerType, customerType) || other.customerType == customerType) &&
            (identical(other.branchId, branchId) || other.branchId == branchId) &&
            (identical(other.birthCountryCode, birthCountryCode) || other.birthCountryCode == birthCountryCode) &&
            (identical(other.birthCountry, birthCountry) || other.birthCountry == birthCountry) &&
            (identical(other.customerIdNo, customerIdNo) || other.customerIdNo == customerIdNo) &&
            (identical(other.customerCode, customerCode) || other.customerCode == customerCode) &&
            (identical(other.isPep, isPep) || other.isPep == isPep) &&
            (identical(other.idCode, idCode) || other.idCode == idCode) &&
            (identical(other.paymentType, paymentType) || other.paymentType == paymentType) &&
            (identical(other.customerDob, customerDob) || other.customerDob == customerDob) &&
            (identical(other.idIssuePlace, idIssuePlace) || other.idIssuePlace == idIssuePlace) &&
            (identical(other.idIssueDate, idIssueDate) || other.idIssueDate == idIssueDate) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idDescription, idDescription) || other.idDescription == idDescription) &&
            (identical(other.idExpiry, idExpiry) || other.idExpiry == idExpiry) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.companyName, companyName) || other.companyName == companyName) &&
            (identical(other.transactionService, transactionService) || other.transactionService == transactionService) &&
            (identical(other.isIntegration, isIntegration) || other.isIntegration == isIntegration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        transactionReference,
        chqNo,
        transactionDate,
        customerName,
        custFirstName,
        custMiddleName,
        custLastName,
        beneficiaryName,
        benfFirstName,
        benfMiddleName,
        benfLastName,
        benfCountry,
        toCurrencyCode,
        fromCurrencyCode,
        accountNumber,
        bankName,
        paymentAmount,
        receivedAmount,
        charge,
        taxAmount,
        netAmount,
        multiplicationRate,
        beneficiaryMobile,
        servMode,
        pinNumber,
        payMode,
        payModeDesc,
        paymentStatus,
        bneficiaryId,
        serviceCode,
        serviceType,
        benfActiveStatus,
        readyForCancel,
        transactionStatus,
        serviceProvider,
        paymentRefNo,
        divisionRate,
        header,
        isMobileTxn,
        isCorrespondentActive,
        branchName,
        purpose,
        ifscCode,
        rebate,
        branchCode,
        customer,
        email,
        taxCard,
        customerVatin,
        arieEmployeeFlag,
        relationship,
        destinationCountryCode,
        destinationCountry,
        cr,
        customerNationality,
        customerNationalityCode,
        source,
        beneficiaryNationality,
        beneficiaryAddress,
        beneficiaryCountryCode,
        correspondent,
        profession,
        beneficiaryType,
        customerIdDescription,
        visaType,
        customerType,
        branchId,
        birthCountryCode,
        birthCountry,
        customerIdNo,
        customerCode,
        isPep,
        idCode,
        paymentType,
        customerDob,
        idIssuePlace,
        idIssueDate,
        idType,
        idDescription,
        idExpiry,
        phone,
        address,
        companyName,
        transactionService,
        isIntegration
      ]);

  @override
  String toString() {
    return 'TransactionDetailsFz(transactionReference: $transactionReference, chqNo: $chqNo, transactionDate: $transactionDate, customerName: $customerName, custFirstName: $custFirstName, custMiddleName: $custMiddleName, custLastName: $custLastName, beneficiaryName: $beneficiaryName, benfFirstName: $benfFirstName, benfMiddleName: $benfMiddleName, benfLastName: $benfLastName, benfCountry: $benfCountry, toCurrencyCode: $toCurrencyCode, fromCurrencyCode: $fromCurrencyCode, accountNumber: $accountNumber, bankName: $bankName, paymentAmount: $paymentAmount, receivedAmount: $receivedAmount, charge: $charge, taxAmount: $taxAmount, netAmount: $netAmount, multiplicationRate: $multiplicationRate, beneficiaryMobile: $beneficiaryMobile, servMode: $servMode, pinNumber: $pinNumber, payMode: $payMode, payModeDesc: $payModeDesc, paymentStatus: $paymentStatus, bneficiaryId: $bneficiaryId, serviceCode: $serviceCode, serviceType: $serviceType, benfActiveStatus: $benfActiveStatus, readyForCancel: $readyForCancel, transactionStatus: $transactionStatus, serviceProvider: $serviceProvider, paymentRefNo: $paymentRefNo, divisionRate: $divisionRate, header: $header, isMobileTxn: $isMobileTxn, isCorrespondentActive: $isCorrespondentActive, branchName: $branchName, purpose: $purpose, ifscCode: $ifscCode, rebate: $rebate, branchCode: $branchCode, customer: $customer, email: $email, taxCard: $taxCard, customerVatin: $customerVatin, arieEmployeeFlag: $arieEmployeeFlag, relationship: $relationship, destinationCountryCode: $destinationCountryCode, destinationCountry: $destinationCountry, cr: $cr, customerNationality: $customerNationality, customerNationalityCode: $customerNationalityCode, source: $source, beneficiaryNationality: $beneficiaryNationality, beneficiaryAddress: $beneficiaryAddress, beneficiaryCountryCode: $beneficiaryCountryCode, correspondent: $correspondent, profession: $profession, beneficiaryType: $beneficiaryType, customerIdDescription: $customerIdDescription, visaType: $visaType, customerType: $customerType, branchId: $branchId, birthCountryCode: $birthCountryCode, birthCountry: $birthCountry, customerIdNo: $customerIdNo, customerCode: $customerCode, isPep: $isPep, idCode: $idCode, paymentType: $paymentType, customerDob: $customerDob, idIssuePlace: $idIssuePlace, idIssueDate: $idIssueDate, idType: $idType, idDescription: $idDescription, idExpiry: $idExpiry, phone: $phone, address: $address, companyName: $companyName, transactionService: $transactionService, isIntegration: $isIntegration)';
  }
}

/// @nodoc
abstract mixin class $TransactionDetailsFzCopyWith<$Res> {
  factory $TransactionDetailsFzCopyWith(TransactionDetailsFz value,
          $Res Function(TransactionDetailsFz) _then) =
      _$TransactionDetailsFzCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'ReferenceNo') String? transactionReference,
      @JsonKey(name: 'ChqNo') String? chqNo,
      @JsonKey(
          name: 'TranDate',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      DateTime? transactionDate,
      @JsonKey(name: "CustomerName", readValue: _readCustName)
      String? customerName,
      @JsonKey(name: 'CustomerFirstName') String? custFirstName,
      @JsonKey(name: 'CustomerMiddleName') String? custMiddleName,
      @JsonKey(name: 'CustomerLastName') String? custLastName,
      @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
      String? beneficiaryName,
      @JsonKey(name: 'BenfName') String? benfFirstName,
      @JsonKey(name: 'BenfName2') String? benfMiddleName,
      @JsonKey(name: 'BenfName3') String? benfLastName,
      @JsonKey(name: 'BenfCountry') String? benfCountry,
      @JsonKey(name: 'BenfCurrencyCode') String? toCurrencyCode,
      @JsonKey(name: 'CurrencyCode') String? fromCurrencyCode,
      @JsonKey(name: 'AccountNo') String? accountNumber,
      @JsonKey(name: 'BankName') String? bankName,
      @JsonKey(name: 'FcyAmount') double? paymentAmount,
      @JsonKey(name: 'LcyAmount') String? receivedAmount,
      @JsonKey(name: 'Charges') String? charge,
      @JsonKey(name: 'TaxAmount') double? taxAmount,
      @JsonKey(name: 'NetAmount') double? netAmount,
      @JsonKey(name: 'MultiplicationRate') double? multiplicationRate,
      @JsonKey(name: 'BeneficiaryMobile') String? beneficiaryMobile,
      @JsonKey(name: 'ServMode') String? servMode,
      @JsonKey(name: 'PinNumber') String? pinNumber,
      @JsonKey(name: 'PayMode') String? payMode,
      @JsonKey(name: 'PayModeDesc') String? payModeDesc,
      @JsonKey(name: 'PaymentStatus') String? paymentStatus,
      @JsonKey(name: 'BneficiaryId') String? bneficiaryId,
      @JsonKey(name: 'ServiceCode') String? serviceCode,
      @JsonKey(name: 'ServiceType') String? serviceType,
      @JsonKey(name: 'BenfActiveStatus') String? benfActiveStatus,
      @JsonKey(name: 'ReadyForCancel') String? readyForCancel,
      @JsonKey(name: 'TransactionStatus') String? transactionStatus,
      @JsonKey(name: 'ServiceProvider') String? serviceProvider,
      @JsonKey(name: 'PaymentRefNo') String? paymentRefNo,
      @JsonKey(name: 'DivisionRate') double? divisionRate,
      @JsonKey(name: 'Header') String? header,
      @JsonKey(name: 'IsMobileTxn') bool? isMobileTxn,
      @JsonKey(name: 'IsCorrespondentActive') String? isCorrespondentActive,
      @JsonKey(name: 'BranchName') String? branchName,
      @JsonKey(name: 'Purpose') String? purpose,
      @JsonKey(name: 'IfscCode') String? ifscCode,
      @JsonKey(name: 'Rebate') String? rebate,
      @JsonKey(name: 'BranchCode') String? branchCode,
      @JsonKey(name: 'Customer') String? customer,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'TaxCard') String? taxCard,
      @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin)
      double? customerVatin,
      @JsonKey(name: 'ArieEmployeeFlag') String? arieEmployeeFlag,
      @JsonKey(name: 'Relationship') String? relationship,
      @JsonKey(name: 'DestinationCountryCode') String? destinationCountryCode,
      @JsonKey(name: 'DestinationCountry') String? destinationCountry,
      @JsonKey(name: 'CR') String? cr,
      @JsonKey(name: 'CustomerNationality') String? customerNationality,
      @JsonKey(name: 'CustomerNationalityCode') String? customerNationalityCode,
      @JsonKey(name: 'Source') String? source,
      @JsonKey(name: 'BeneficiaryNationality') String? beneficiaryNationality,
      @JsonKey(name: 'BeneficiaryAddress') String? beneficiaryAddress,
      @JsonKey(name: 'BeneficiaryCountryCode') String? beneficiaryCountryCode,
      @JsonKey(name: 'Correspondent') String? correspondent,
      @JsonKey(name: 'Profession') String? profession,
      @JsonKey(name: 'BeneficiaryType') String? beneficiaryType,
      @JsonKey(name: 'CustomerIdDescription') String? customerIdDescription,
      @JsonKey(name: 'VisaType') String? visaType,
      @JsonKey(name: 'CustomerType') String? customerType,
      @JsonKey(name: 'BranchId') String? branchId,
      @JsonKey(name: 'BirthCountryCode') String? birthCountryCode,
      @JsonKey(name: 'BirthCountry') String? birthCountry,
      @JsonKey(name: 'CustomerIdNo') String? customerIdNo,
      @JsonKey(name: 'CustomerCode') String? customerCode,
      @JsonKey(name: 'IsPep') String? isPep,
      @JsonKey(name: 'IdCode') String? idCode,
      @JsonKey(name: 'PaymentType') String? paymentType,
      @JsonKey(name: 'CustomerDob') String? customerDob,
      @JsonKey(name: 'IdIssuePlace') String? idIssuePlace,
      @JsonKey(
          name: 'IdIssueDate',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      DateTime? idIssueDate,
      @JsonKey(name: 'IdType') String? idType,
      @JsonKey(name: 'IdDescription') String? idDescription,
      @JsonKey(
          name: 'IdExpiry',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      DateTime? idExpiry,
      @JsonKey(name: 'Phone') String? phone,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'TransactionService') String? transactionService,
      @JsonKey(name: 'IsIntegration') String? isIntegration});
}

/// @nodoc
class _$TransactionDetailsFzCopyWithImpl<$Res>
    implements $TransactionDetailsFzCopyWith<$Res> {
  _$TransactionDetailsFzCopyWithImpl(this._self, this._then);

  final TransactionDetailsFz _self;
  final $Res Function(TransactionDetailsFz) _then;

  /// Create a copy of TransactionDetailsFz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionReference = freezed,
    Object? chqNo = freezed,
    Object? transactionDate = freezed,
    Object? customerName = freezed,
    Object? custFirstName = freezed,
    Object? custMiddleName = freezed,
    Object? custLastName = freezed,
    Object? beneficiaryName = freezed,
    Object? benfFirstName = freezed,
    Object? benfMiddleName = freezed,
    Object? benfLastName = freezed,
    Object? benfCountry = freezed,
    Object? toCurrencyCode = freezed,
    Object? fromCurrencyCode = freezed,
    Object? accountNumber = freezed,
    Object? bankName = freezed,
    Object? paymentAmount = freezed,
    Object? receivedAmount = freezed,
    Object? charge = freezed,
    Object? taxAmount = freezed,
    Object? netAmount = freezed,
    Object? multiplicationRate = freezed,
    Object? beneficiaryMobile = freezed,
    Object? servMode = freezed,
    Object? pinNumber = freezed,
    Object? payMode = freezed,
    Object? payModeDesc = freezed,
    Object? paymentStatus = freezed,
    Object? bneficiaryId = freezed,
    Object? serviceCode = freezed,
    Object? serviceType = freezed,
    Object? benfActiveStatus = freezed,
    Object? readyForCancel = freezed,
    Object? transactionStatus = freezed,
    Object? serviceProvider = freezed,
    Object? paymentRefNo = freezed,
    Object? divisionRate = freezed,
    Object? header = freezed,
    Object? isMobileTxn = freezed,
    Object? isCorrespondentActive = freezed,
    Object? branchName = freezed,
    Object? purpose = freezed,
    Object? ifscCode = freezed,
    Object? rebate = freezed,
    Object? branchCode = freezed,
    Object? customer = freezed,
    Object? email = freezed,
    Object? taxCard = freezed,
    Object? customerVatin = freezed,
    Object? arieEmployeeFlag = freezed,
    Object? relationship = freezed,
    Object? destinationCountryCode = freezed,
    Object? destinationCountry = freezed,
    Object? cr = freezed,
    Object? customerNationality = freezed,
    Object? customerNationalityCode = freezed,
    Object? source = freezed,
    Object? beneficiaryNationality = freezed,
    Object? beneficiaryAddress = freezed,
    Object? beneficiaryCountryCode = freezed,
    Object? correspondent = freezed,
    Object? profession = freezed,
    Object? beneficiaryType = freezed,
    Object? customerIdDescription = freezed,
    Object? visaType = freezed,
    Object? customerType = freezed,
    Object? branchId = freezed,
    Object? birthCountryCode = freezed,
    Object? birthCountry = freezed,
    Object? customerIdNo = freezed,
    Object? customerCode = freezed,
    Object? isPep = freezed,
    Object? idCode = freezed,
    Object? paymentType = freezed,
    Object? customerDob = freezed,
    Object? idIssuePlace = freezed,
    Object? idIssueDate = freezed,
    Object? idType = freezed,
    Object? idDescription = freezed,
    Object? idExpiry = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? companyName = freezed,
    Object? transactionService = freezed,
    Object? isIntegration = freezed,
  }) {
    return _then(_self.copyWith(
      transactionReference: freezed == transactionReference
          ? _self.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      chqNo: freezed == chqNo
          ? _self.chqNo
          : chqNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _self.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customerName: freezed == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      custFirstName: freezed == custFirstName
          ? _self.custFirstName
          : custFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      custMiddleName: freezed == custMiddleName
          ? _self.custMiddleName
          : custMiddleName // ignore: cast_nullable_to_non_nullable
              as String?,
      custLastName: freezed == custLastName
          ? _self.custLastName
          : custLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryName: freezed == beneficiaryName
          ? _self.beneficiaryName
          : beneficiaryName // ignore: cast_nullable_to_non_nullable
              as String?,
      benfFirstName: freezed == benfFirstName
          ? _self.benfFirstName
          : benfFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      benfMiddleName: freezed == benfMiddleName
          ? _self.benfMiddleName
          : benfMiddleName // ignore: cast_nullable_to_non_nullable
              as String?,
      benfLastName: freezed == benfLastName
          ? _self.benfLastName
          : benfLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      benfCountry: freezed == benfCountry
          ? _self.benfCountry
          : benfCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      toCurrencyCode: freezed == toCurrencyCode
          ? _self.toCurrencyCode
          : toCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fromCurrencyCode: freezed == fromCurrencyCode
          ? _self.fromCurrencyCode
          : fromCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAmount: freezed == paymentAmount
          ? _self.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      receivedAmount: freezed == receivedAmount
          ? _self.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      charge: freezed == charge
          ? _self.charge
          : charge // ignore: cast_nullable_to_non_nullable
              as String?,
      taxAmount: freezed == taxAmount
          ? _self.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      netAmount: freezed == netAmount
          ? _self.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      multiplicationRate: freezed == multiplicationRate
          ? _self.multiplicationRate
          : multiplicationRate // ignore: cast_nullable_to_non_nullable
              as double?,
      beneficiaryMobile: freezed == beneficiaryMobile
          ? _self.beneficiaryMobile
          : beneficiaryMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      servMode: freezed == servMode
          ? _self.servMode
          : servMode // ignore: cast_nullable_to_non_nullable
              as String?,
      pinNumber: freezed == pinNumber
          ? _self.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      payMode: freezed == payMode
          ? _self.payMode
          : payMode // ignore: cast_nullable_to_non_nullable
              as String?,
      payModeDesc: freezed == payModeDesc
          ? _self.payModeDesc
          : payModeDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      bneficiaryId: freezed == bneficiaryId
          ? _self.bneficiaryId
          : bneficiaryId // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCode: freezed == serviceCode
          ? _self.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      benfActiveStatus: freezed == benfActiveStatus
          ? _self.benfActiveStatus
          : benfActiveStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      readyForCancel: freezed == readyForCancel
          ? _self.readyForCancel
          : readyForCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionStatus: freezed == transactionStatus
          ? _self.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceProvider: freezed == serviceProvider
          ? _self.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRefNo: freezed == paymentRefNo
          ? _self.paymentRefNo
          : paymentRefNo // ignore: cast_nullable_to_non_nullable
              as String?,
      divisionRate: freezed == divisionRate
          ? _self.divisionRate
          : divisionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      header: freezed == header
          ? _self.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      isMobileTxn: freezed == isMobileTxn
          ? _self.isMobileTxn
          : isMobileTxn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCorrespondentActive: freezed == isCorrespondentActive
          ? _self.isCorrespondentActive
          : isCorrespondentActive // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _self.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _self.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      ifscCode: freezed == ifscCode
          ? _self.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String?,
      rebate: freezed == rebate
          ? _self.rebate
          : rebate // ignore: cast_nullable_to_non_nullable
              as String?,
      branchCode: freezed == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCard: freezed == taxCard
          ? _self.taxCard
          : taxCard // ignore: cast_nullable_to_non_nullable
              as String?,
      customerVatin: freezed == customerVatin
          ? _self.customerVatin
          : customerVatin // ignore: cast_nullable_to_non_nullable
              as double?,
      arieEmployeeFlag: freezed == arieEmployeeFlag
          ? _self.arieEmployeeFlag
          : arieEmployeeFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _self.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationCountryCode: freezed == destinationCountryCode
          ? _self.destinationCountryCode
          : destinationCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationCountry: freezed == destinationCountry
          ? _self.destinationCountry
          : destinationCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      cr: freezed == cr
          ? _self.cr
          : cr // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNationality: freezed == customerNationality
          ? _self.customerNationality
          : customerNationality // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNationalityCode: freezed == customerNationalityCode
          ? _self.customerNationalityCode
          : customerNationalityCode // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryNationality: freezed == beneficiaryNationality
          ? _self.beneficiaryNationality
          : beneficiaryNationality // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryAddress: freezed == beneficiaryAddress
          ? _self.beneficiaryAddress
          : beneficiaryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryCountryCode: freezed == beneficiaryCountryCode
          ? _self.beneficiaryCountryCode
          : beneficiaryCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      correspondent: freezed == correspondent
          ? _self.correspondent
          : correspondent // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryType: freezed == beneficiaryType
          ? _self.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdDescription: freezed == customerIdDescription
          ? _self.customerIdDescription
          : customerIdDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      visaType: freezed == visaType
          ? _self.visaType
          : visaType // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: freezed == customerType
          ? _self.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _self.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String?,
      birthCountryCode: freezed == birthCountryCode
          ? _self.birthCountryCode
          : birthCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      birthCountry: freezed == birthCountry
          ? _self.birthCountry
          : birthCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdNo: freezed == customerIdNo
          ? _self.customerIdNo
          : customerIdNo // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPep: freezed == isPep
          ? _self.isPep
          : isPep // ignore: cast_nullable_to_non_nullable
              as String?,
      idCode: freezed == idCode
          ? _self.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _self.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      customerDob: freezed == customerDob
          ? _self.customerDob
          : customerDob // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssuePlace: freezed == idIssuePlace
          ? _self.idIssuePlace
          : idIssuePlace // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssueDate: freezed == idIssueDate
          ? _self.idIssueDate
          : idIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idType: freezed == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String?,
      idDescription: freezed == idDescription
          ? _self.idDescription
          : idDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      idExpiry: freezed == idExpiry
          ? _self.idExpiry
          : idExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionService: freezed == transactionService
          ? _self.transactionService
          : transactionService // ignore: cast_nullable_to_non_nullable
              as String?,
      isIntegration: freezed == isIntegration
          ? _self.isIntegration
          : isIntegration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TransactionDetailsFz].
extension TransactionDetailsFzPatterns on TransactionDetailsFz {
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
    TResult Function(_TransactionDetailsFz value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionDetailsFz() when $default != null:
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
    TResult Function(_TransactionDetailsFz value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionDetailsFz():
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
    TResult? Function(_TransactionDetailsFz value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionDetailsFz() when $default != null:
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
            @JsonKey(name: 'ReferenceNo') String? transactionReference,
            @JsonKey(name: 'ChqNo') String? chqNo,
            @JsonKey(
                name: 'TranDate',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? transactionDate,
            @JsonKey(name: "CustomerName", readValue: _readCustName)
            String? customerName,
            @JsonKey(name: 'CustomerFirstName') String? custFirstName,
            @JsonKey(name: 'CustomerMiddleName') String? custMiddleName,
            @JsonKey(name: 'CustomerLastName') String? custLastName,
            @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
            String? beneficiaryName,
            @JsonKey(name: 'BenfName') String? benfFirstName,
            @JsonKey(name: 'BenfName2') String? benfMiddleName,
            @JsonKey(name: 'BenfName3') String? benfLastName,
            @JsonKey(name: 'BenfCountry') String? benfCountry,
            @JsonKey(name: 'BenfCurrencyCode') String? toCurrencyCode,
            @JsonKey(name: 'CurrencyCode') String? fromCurrencyCode,
            @JsonKey(name: 'AccountNo') String? accountNumber,
            @JsonKey(name: 'BankName') String? bankName,
            @JsonKey(name: 'FcyAmount') double? paymentAmount,
            @JsonKey(name: 'LcyAmount') String? receivedAmount,
            @JsonKey(name: 'Charges') String? charge,
            @JsonKey(name: 'TaxAmount') double? taxAmount,
            @JsonKey(name: 'NetAmount') double? netAmount,
            @JsonKey(name: 'MultiplicationRate') double? multiplicationRate,
            @JsonKey(name: 'BeneficiaryMobile') String? beneficiaryMobile,
            @JsonKey(name: 'ServMode') String? servMode,
            @JsonKey(name: 'PinNumber') String? pinNumber,
            @JsonKey(name: 'PayMode') String? payMode,
            @JsonKey(name: 'PayModeDesc') String? payModeDesc,
            @JsonKey(name: 'PaymentStatus') String? paymentStatus,
            @JsonKey(name: 'BneficiaryId') String? bneficiaryId,
            @JsonKey(name: 'ServiceCode') String? serviceCode,
            @JsonKey(name: 'ServiceType') String? serviceType,
            @JsonKey(name: 'BenfActiveStatus') String? benfActiveStatus,
            @JsonKey(name: 'ReadyForCancel') String? readyForCancel,
            @JsonKey(name: 'TransactionStatus') String? transactionStatus,
            @JsonKey(name: 'ServiceProvider') String? serviceProvider,
            @JsonKey(name: 'PaymentRefNo') String? paymentRefNo,
            @JsonKey(name: 'DivisionRate') double? divisionRate,
            @JsonKey(name: 'Header') String? header,
            @JsonKey(name: 'IsMobileTxn') bool? isMobileTxn,
            @JsonKey(name: 'IsCorrespondentActive')
            String? isCorrespondentActive,
            @JsonKey(name: 'BranchName') String? branchName,
            @JsonKey(name: 'Purpose') String? purpose,
            @JsonKey(name: 'IfscCode') String? ifscCode,
            @JsonKey(name: 'Rebate') String? rebate,
            @JsonKey(name: 'BranchCode') String? branchCode,
            @JsonKey(name: 'Customer') String? customer,
            @JsonKey(name: 'Email') String? email,
            @JsonKey(name: 'TaxCard') String? taxCard,
            @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin)
            double? customerVatin,
            @JsonKey(name: 'ArieEmployeeFlag') String? arieEmployeeFlag,
            @JsonKey(name: 'Relationship') String? relationship,
            @JsonKey(name: 'DestinationCountryCode')
            String? destinationCountryCode,
            @JsonKey(name: 'DestinationCountry') String? destinationCountry,
            @JsonKey(name: 'CR') String? cr,
            @JsonKey(name: 'CustomerNationality') String? customerNationality,
            @JsonKey(name: 'CustomerNationalityCode')
            String? customerNationalityCode,
            @JsonKey(name: 'Source') String? source,
            @JsonKey(name: 'BeneficiaryNationality')
            String? beneficiaryNationality,
            @JsonKey(name: 'BeneficiaryAddress') String? beneficiaryAddress,
            @JsonKey(name: 'BeneficiaryCountryCode')
            String? beneficiaryCountryCode,
            @JsonKey(name: 'Correspondent') String? correspondent,
            @JsonKey(name: 'Profession') String? profession,
            @JsonKey(name: 'BeneficiaryType') String? beneficiaryType,
            @JsonKey(name: 'CustomerIdDescription')
            String? customerIdDescription,
            @JsonKey(name: 'VisaType') String? visaType,
            @JsonKey(name: 'CustomerType') String? customerType,
            @JsonKey(name: 'BranchId') String? branchId,
            @JsonKey(name: 'BirthCountryCode') String? birthCountryCode,
            @JsonKey(name: 'BirthCountry') String? birthCountry,
            @JsonKey(name: 'CustomerIdNo') String? customerIdNo,
            @JsonKey(name: 'CustomerCode') String? customerCode,
            @JsonKey(name: 'IsPep') String? isPep,
            @JsonKey(name: 'IdCode') String? idCode,
            @JsonKey(name: 'PaymentType') String? paymentType,
            @JsonKey(name: 'CustomerDob') String? customerDob,
            @JsonKey(name: 'IdIssuePlace') String? idIssuePlace,
            @JsonKey(
                name: 'IdIssueDate',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? idIssueDate,
            @JsonKey(name: 'IdType') String? idType,
            @JsonKey(name: 'IdDescription') String? idDescription,
            @JsonKey(
                name: 'IdExpiry',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? idExpiry,
            @JsonKey(name: 'Phone') String? phone,
            @JsonKey(name: 'Address') String? address,
            @JsonKey(name: 'CompanyName') String? companyName,
            @JsonKey(name: 'TransactionService') String? transactionService,
            @JsonKey(name: 'IsIntegration') String? isIntegration)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TransactionDetailsFz() when $default != null:
        return $default(
            _that.transactionReference,
            _that.chqNo,
            _that.transactionDate,
            _that.customerName,
            _that.custFirstName,
            _that.custMiddleName,
            _that.custLastName,
            _that.beneficiaryName,
            _that.benfFirstName,
            _that.benfMiddleName,
            _that.benfLastName,
            _that.benfCountry,
            _that.toCurrencyCode,
            _that.fromCurrencyCode,
            _that.accountNumber,
            _that.bankName,
            _that.paymentAmount,
            _that.receivedAmount,
            _that.charge,
            _that.taxAmount,
            _that.netAmount,
            _that.multiplicationRate,
            _that.beneficiaryMobile,
            _that.servMode,
            _that.pinNumber,
            _that.payMode,
            _that.payModeDesc,
            _that.paymentStatus,
            _that.bneficiaryId,
            _that.serviceCode,
            _that.serviceType,
            _that.benfActiveStatus,
            _that.readyForCancel,
            _that.transactionStatus,
            _that.serviceProvider,
            _that.paymentRefNo,
            _that.divisionRate,
            _that.header,
            _that.isMobileTxn,
            _that.isCorrespondentActive,
            _that.branchName,
            _that.purpose,
            _that.ifscCode,
            _that.rebate,
            _that.branchCode,
            _that.customer,
            _that.email,
            _that.taxCard,
            _that.customerVatin,
            _that.arieEmployeeFlag,
            _that.relationship,
            _that.destinationCountryCode,
            _that.destinationCountry,
            _that.cr,
            _that.customerNationality,
            _that.customerNationalityCode,
            _that.source,
            _that.beneficiaryNationality,
            _that.beneficiaryAddress,
            _that.beneficiaryCountryCode,
            _that.correspondent,
            _that.profession,
            _that.beneficiaryType,
            _that.customerIdDescription,
            _that.visaType,
            _that.customerType,
            _that.branchId,
            _that.birthCountryCode,
            _that.birthCountry,
            _that.customerIdNo,
            _that.customerCode,
            _that.isPep,
            _that.idCode,
            _that.paymentType,
            _that.customerDob,
            _that.idIssuePlace,
            _that.idIssueDate,
            _that.idType,
            _that.idDescription,
            _that.idExpiry,
            _that.phone,
            _that.address,
            _that.companyName,
            _that.transactionService,
            _that.isIntegration);
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
            @JsonKey(name: 'ReferenceNo') String? transactionReference,
            @JsonKey(name: 'ChqNo') String? chqNo,
            @JsonKey(
                name: 'TranDate',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? transactionDate,
            @JsonKey(name: "CustomerName", readValue: _readCustName)
            String? customerName,
            @JsonKey(name: 'CustomerFirstName') String? custFirstName,
            @JsonKey(name: 'CustomerMiddleName') String? custMiddleName,
            @JsonKey(name: 'CustomerLastName') String? custLastName,
            @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
            String? beneficiaryName,
            @JsonKey(name: 'BenfName') String? benfFirstName,
            @JsonKey(name: 'BenfName2') String? benfMiddleName,
            @JsonKey(name: 'BenfName3') String? benfLastName,
            @JsonKey(name: 'BenfCountry') String? benfCountry,
            @JsonKey(name: 'BenfCurrencyCode') String? toCurrencyCode,
            @JsonKey(name: 'CurrencyCode') String? fromCurrencyCode,
            @JsonKey(name: 'AccountNo') String? accountNumber,
            @JsonKey(name: 'BankName') String? bankName,
            @JsonKey(name: 'FcyAmount') double? paymentAmount,
            @JsonKey(name: 'LcyAmount') String? receivedAmount,
            @JsonKey(name: 'Charges') String? charge,
            @JsonKey(name: 'TaxAmount') double? taxAmount,
            @JsonKey(name: 'NetAmount') double? netAmount,
            @JsonKey(name: 'MultiplicationRate') double? multiplicationRate,
            @JsonKey(name: 'BeneficiaryMobile') String? beneficiaryMobile,
            @JsonKey(name: 'ServMode') String? servMode,
            @JsonKey(name: 'PinNumber') String? pinNumber,
            @JsonKey(name: 'PayMode') String? payMode,
            @JsonKey(name: 'PayModeDesc') String? payModeDesc,
            @JsonKey(name: 'PaymentStatus') String? paymentStatus,
            @JsonKey(name: 'BneficiaryId') String? bneficiaryId,
            @JsonKey(name: 'ServiceCode') String? serviceCode,
            @JsonKey(name: 'ServiceType') String? serviceType,
            @JsonKey(name: 'BenfActiveStatus') String? benfActiveStatus,
            @JsonKey(name: 'ReadyForCancel') String? readyForCancel,
            @JsonKey(name: 'TransactionStatus') String? transactionStatus,
            @JsonKey(name: 'ServiceProvider') String? serviceProvider,
            @JsonKey(name: 'PaymentRefNo') String? paymentRefNo,
            @JsonKey(name: 'DivisionRate') double? divisionRate,
            @JsonKey(name: 'Header') String? header,
            @JsonKey(name: 'IsMobileTxn') bool? isMobileTxn,
            @JsonKey(name: 'IsCorrespondentActive')
            String? isCorrespondentActive,
            @JsonKey(name: 'BranchName') String? branchName,
            @JsonKey(name: 'Purpose') String? purpose,
            @JsonKey(name: 'IfscCode') String? ifscCode,
            @JsonKey(name: 'Rebate') String? rebate,
            @JsonKey(name: 'BranchCode') String? branchCode,
            @JsonKey(name: 'Customer') String? customer,
            @JsonKey(name: 'Email') String? email,
            @JsonKey(name: 'TaxCard') String? taxCard,
            @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin)
            double? customerVatin,
            @JsonKey(name: 'ArieEmployeeFlag') String? arieEmployeeFlag,
            @JsonKey(name: 'Relationship') String? relationship,
            @JsonKey(name: 'DestinationCountryCode')
            String? destinationCountryCode,
            @JsonKey(name: 'DestinationCountry') String? destinationCountry,
            @JsonKey(name: 'CR') String? cr,
            @JsonKey(name: 'CustomerNationality') String? customerNationality,
            @JsonKey(name: 'CustomerNationalityCode')
            String? customerNationalityCode,
            @JsonKey(name: 'Source') String? source,
            @JsonKey(name: 'BeneficiaryNationality')
            String? beneficiaryNationality,
            @JsonKey(name: 'BeneficiaryAddress') String? beneficiaryAddress,
            @JsonKey(name: 'BeneficiaryCountryCode')
            String? beneficiaryCountryCode,
            @JsonKey(name: 'Correspondent') String? correspondent,
            @JsonKey(name: 'Profession') String? profession,
            @JsonKey(name: 'BeneficiaryType') String? beneficiaryType,
            @JsonKey(name: 'CustomerIdDescription')
            String? customerIdDescription,
            @JsonKey(name: 'VisaType') String? visaType,
            @JsonKey(name: 'CustomerType') String? customerType,
            @JsonKey(name: 'BranchId') String? branchId,
            @JsonKey(name: 'BirthCountryCode') String? birthCountryCode,
            @JsonKey(name: 'BirthCountry') String? birthCountry,
            @JsonKey(name: 'CustomerIdNo') String? customerIdNo,
            @JsonKey(name: 'CustomerCode') String? customerCode,
            @JsonKey(name: 'IsPep') String? isPep,
            @JsonKey(name: 'IdCode') String? idCode,
            @JsonKey(name: 'PaymentType') String? paymentType,
            @JsonKey(name: 'CustomerDob') String? customerDob,
            @JsonKey(name: 'IdIssuePlace') String? idIssuePlace,
            @JsonKey(
                name: 'IdIssueDate',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? idIssueDate,
            @JsonKey(name: 'IdType') String? idType,
            @JsonKey(name: 'IdDescription') String? idDescription,
            @JsonKey(
                name: 'IdExpiry',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? idExpiry,
            @JsonKey(name: 'Phone') String? phone,
            @JsonKey(name: 'Address') String? address,
            @JsonKey(name: 'CompanyName') String? companyName,
            @JsonKey(name: 'TransactionService') String? transactionService,
            @JsonKey(name: 'IsIntegration') String? isIntegration)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionDetailsFz():
        return $default(
            _that.transactionReference,
            _that.chqNo,
            _that.transactionDate,
            _that.customerName,
            _that.custFirstName,
            _that.custMiddleName,
            _that.custLastName,
            _that.beneficiaryName,
            _that.benfFirstName,
            _that.benfMiddleName,
            _that.benfLastName,
            _that.benfCountry,
            _that.toCurrencyCode,
            _that.fromCurrencyCode,
            _that.accountNumber,
            _that.bankName,
            _that.paymentAmount,
            _that.receivedAmount,
            _that.charge,
            _that.taxAmount,
            _that.netAmount,
            _that.multiplicationRate,
            _that.beneficiaryMobile,
            _that.servMode,
            _that.pinNumber,
            _that.payMode,
            _that.payModeDesc,
            _that.paymentStatus,
            _that.bneficiaryId,
            _that.serviceCode,
            _that.serviceType,
            _that.benfActiveStatus,
            _that.readyForCancel,
            _that.transactionStatus,
            _that.serviceProvider,
            _that.paymentRefNo,
            _that.divisionRate,
            _that.header,
            _that.isMobileTxn,
            _that.isCorrespondentActive,
            _that.branchName,
            _that.purpose,
            _that.ifscCode,
            _that.rebate,
            _that.branchCode,
            _that.customer,
            _that.email,
            _that.taxCard,
            _that.customerVatin,
            _that.arieEmployeeFlag,
            _that.relationship,
            _that.destinationCountryCode,
            _that.destinationCountry,
            _that.cr,
            _that.customerNationality,
            _that.customerNationalityCode,
            _that.source,
            _that.beneficiaryNationality,
            _that.beneficiaryAddress,
            _that.beneficiaryCountryCode,
            _that.correspondent,
            _that.profession,
            _that.beneficiaryType,
            _that.customerIdDescription,
            _that.visaType,
            _that.customerType,
            _that.branchId,
            _that.birthCountryCode,
            _that.birthCountry,
            _that.customerIdNo,
            _that.customerCode,
            _that.isPep,
            _that.idCode,
            _that.paymentType,
            _that.customerDob,
            _that.idIssuePlace,
            _that.idIssueDate,
            _that.idType,
            _that.idDescription,
            _that.idExpiry,
            _that.phone,
            _that.address,
            _that.companyName,
            _that.transactionService,
            _that.isIntegration);
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
            @JsonKey(name: 'ReferenceNo') String? transactionReference,
            @JsonKey(name: 'ChqNo') String? chqNo,
            @JsonKey(
                name: 'TranDate',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? transactionDate,
            @JsonKey(name: "CustomerName", readValue: _readCustName)
            String? customerName,
            @JsonKey(name: 'CustomerFirstName') String? custFirstName,
            @JsonKey(name: 'CustomerMiddleName') String? custMiddleName,
            @JsonKey(name: 'CustomerLastName') String? custLastName,
            @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
            String? beneficiaryName,
            @JsonKey(name: 'BenfName') String? benfFirstName,
            @JsonKey(name: 'BenfName2') String? benfMiddleName,
            @JsonKey(name: 'BenfName3') String? benfLastName,
            @JsonKey(name: 'BenfCountry') String? benfCountry,
            @JsonKey(name: 'BenfCurrencyCode') String? toCurrencyCode,
            @JsonKey(name: 'CurrencyCode') String? fromCurrencyCode,
            @JsonKey(name: 'AccountNo') String? accountNumber,
            @JsonKey(name: 'BankName') String? bankName,
            @JsonKey(name: 'FcyAmount') double? paymentAmount,
            @JsonKey(name: 'LcyAmount') String? receivedAmount,
            @JsonKey(name: 'Charges') String? charge,
            @JsonKey(name: 'TaxAmount') double? taxAmount,
            @JsonKey(name: 'NetAmount') double? netAmount,
            @JsonKey(name: 'MultiplicationRate') double? multiplicationRate,
            @JsonKey(name: 'BeneficiaryMobile') String? beneficiaryMobile,
            @JsonKey(name: 'ServMode') String? servMode,
            @JsonKey(name: 'PinNumber') String? pinNumber,
            @JsonKey(name: 'PayMode') String? payMode,
            @JsonKey(name: 'PayModeDesc') String? payModeDesc,
            @JsonKey(name: 'PaymentStatus') String? paymentStatus,
            @JsonKey(name: 'BneficiaryId') String? bneficiaryId,
            @JsonKey(name: 'ServiceCode') String? serviceCode,
            @JsonKey(name: 'ServiceType') String? serviceType,
            @JsonKey(name: 'BenfActiveStatus') String? benfActiveStatus,
            @JsonKey(name: 'ReadyForCancel') String? readyForCancel,
            @JsonKey(name: 'TransactionStatus') String? transactionStatus,
            @JsonKey(name: 'ServiceProvider') String? serviceProvider,
            @JsonKey(name: 'PaymentRefNo') String? paymentRefNo,
            @JsonKey(name: 'DivisionRate') double? divisionRate,
            @JsonKey(name: 'Header') String? header,
            @JsonKey(name: 'IsMobileTxn') bool? isMobileTxn,
            @JsonKey(name: 'IsCorrespondentActive')
            String? isCorrespondentActive,
            @JsonKey(name: 'BranchName') String? branchName,
            @JsonKey(name: 'Purpose') String? purpose,
            @JsonKey(name: 'IfscCode') String? ifscCode,
            @JsonKey(name: 'Rebate') String? rebate,
            @JsonKey(name: 'BranchCode') String? branchCode,
            @JsonKey(name: 'Customer') String? customer,
            @JsonKey(name: 'Email') String? email,
            @JsonKey(name: 'TaxCard') String? taxCard,
            @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin)
            double? customerVatin,
            @JsonKey(name: 'ArieEmployeeFlag') String? arieEmployeeFlag,
            @JsonKey(name: 'Relationship') String? relationship,
            @JsonKey(name: 'DestinationCountryCode')
            String? destinationCountryCode,
            @JsonKey(name: 'DestinationCountry') String? destinationCountry,
            @JsonKey(name: 'CR') String? cr,
            @JsonKey(name: 'CustomerNationality') String? customerNationality,
            @JsonKey(name: 'CustomerNationalityCode')
            String? customerNationalityCode,
            @JsonKey(name: 'Source') String? source,
            @JsonKey(name: 'BeneficiaryNationality')
            String? beneficiaryNationality,
            @JsonKey(name: 'BeneficiaryAddress') String? beneficiaryAddress,
            @JsonKey(name: 'BeneficiaryCountryCode')
            String? beneficiaryCountryCode,
            @JsonKey(name: 'Correspondent') String? correspondent,
            @JsonKey(name: 'Profession') String? profession,
            @JsonKey(name: 'BeneficiaryType') String? beneficiaryType,
            @JsonKey(name: 'CustomerIdDescription')
            String? customerIdDescription,
            @JsonKey(name: 'VisaType') String? visaType,
            @JsonKey(name: 'CustomerType') String? customerType,
            @JsonKey(name: 'BranchId') String? branchId,
            @JsonKey(name: 'BirthCountryCode') String? birthCountryCode,
            @JsonKey(name: 'BirthCountry') String? birthCountry,
            @JsonKey(name: 'CustomerIdNo') String? customerIdNo,
            @JsonKey(name: 'CustomerCode') String? customerCode,
            @JsonKey(name: 'IsPep') String? isPep,
            @JsonKey(name: 'IdCode') String? idCode,
            @JsonKey(name: 'PaymentType') String? paymentType,
            @JsonKey(name: 'CustomerDob') String? customerDob,
            @JsonKey(name: 'IdIssuePlace') String? idIssuePlace,
            @JsonKey(
                name: 'IdIssueDate',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? idIssueDate,
            @JsonKey(name: 'IdType') String? idType,
            @JsonKey(name: 'IdDescription') String? idDescription,
            @JsonKey(
                name: 'IdExpiry',
                fromJson: _fromJsonDateTime,
                toJson: _toJsonDateTime)
            DateTime? idExpiry,
            @JsonKey(name: 'Phone') String? phone,
            @JsonKey(name: 'Address') String? address,
            @JsonKey(name: 'CompanyName') String? companyName,
            @JsonKey(name: 'TransactionService') String? transactionService,
            @JsonKey(name: 'IsIntegration') String? isIntegration)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TransactionDetailsFz() when $default != null:
        return $default(
            _that.transactionReference,
            _that.chqNo,
            _that.transactionDate,
            _that.customerName,
            _that.custFirstName,
            _that.custMiddleName,
            _that.custLastName,
            _that.beneficiaryName,
            _that.benfFirstName,
            _that.benfMiddleName,
            _that.benfLastName,
            _that.benfCountry,
            _that.toCurrencyCode,
            _that.fromCurrencyCode,
            _that.accountNumber,
            _that.bankName,
            _that.paymentAmount,
            _that.receivedAmount,
            _that.charge,
            _that.taxAmount,
            _that.netAmount,
            _that.multiplicationRate,
            _that.beneficiaryMobile,
            _that.servMode,
            _that.pinNumber,
            _that.payMode,
            _that.payModeDesc,
            _that.paymentStatus,
            _that.bneficiaryId,
            _that.serviceCode,
            _that.serviceType,
            _that.benfActiveStatus,
            _that.readyForCancel,
            _that.transactionStatus,
            _that.serviceProvider,
            _that.paymentRefNo,
            _that.divisionRate,
            _that.header,
            _that.isMobileTxn,
            _that.isCorrespondentActive,
            _that.branchName,
            _that.purpose,
            _that.ifscCode,
            _that.rebate,
            _that.branchCode,
            _that.customer,
            _that.email,
            _that.taxCard,
            _that.customerVatin,
            _that.arieEmployeeFlag,
            _that.relationship,
            _that.destinationCountryCode,
            _that.destinationCountry,
            _that.cr,
            _that.customerNationality,
            _that.customerNationalityCode,
            _that.source,
            _that.beneficiaryNationality,
            _that.beneficiaryAddress,
            _that.beneficiaryCountryCode,
            _that.correspondent,
            _that.profession,
            _that.beneficiaryType,
            _that.customerIdDescription,
            _that.visaType,
            _that.customerType,
            _that.branchId,
            _that.birthCountryCode,
            _that.birthCountry,
            _that.customerIdNo,
            _that.customerCode,
            _that.isPep,
            _that.idCode,
            _that.paymentType,
            _that.customerDob,
            _that.idIssuePlace,
            _that.idIssueDate,
            _that.idType,
            _that.idDescription,
            _that.idExpiry,
            _that.phone,
            _that.address,
            _that.companyName,
            _that.transactionService,
            _that.isIntegration);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TransactionDetailsFz implements TransactionDetailsFz {
  const _TransactionDetailsFz(
      {@JsonKey(name: 'ReferenceNo') this.transactionReference,
      @JsonKey(name: 'ChqNo') this.chqNo,
      @JsonKey(
          name: 'TranDate',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      this.transactionDate,
      @JsonKey(name: "CustomerName", readValue: _readCustName)
      this.customerName,
      @JsonKey(name: 'CustomerFirstName') this.custFirstName,
      @JsonKey(name: 'CustomerMiddleName') this.custMiddleName,
      @JsonKey(name: 'CustomerLastName') this.custLastName,
      @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
      this.beneficiaryName,
      @JsonKey(name: 'BenfName') this.benfFirstName,
      @JsonKey(name: 'BenfName2') this.benfMiddleName,
      @JsonKey(name: 'BenfName3') this.benfLastName,
      @JsonKey(name: 'BenfCountry') this.benfCountry,
      @JsonKey(name: 'BenfCurrencyCode') this.toCurrencyCode,
      @JsonKey(name: 'CurrencyCode') this.fromCurrencyCode,
      @JsonKey(name: 'AccountNo') this.accountNumber,
      @JsonKey(name: 'BankName') this.bankName,
      @JsonKey(name: 'FcyAmount') this.paymentAmount,
      @JsonKey(name: 'LcyAmount') this.receivedAmount,
      @JsonKey(name: 'Charges') this.charge,
      @JsonKey(name: 'TaxAmount') this.taxAmount,
      @JsonKey(name: 'NetAmount') this.netAmount,
      @JsonKey(name: 'MultiplicationRate') this.multiplicationRate,
      @JsonKey(name: 'BeneficiaryMobile') this.beneficiaryMobile,
      @JsonKey(name: 'ServMode') this.servMode,
      @JsonKey(name: 'PinNumber') this.pinNumber,
      @JsonKey(name: 'PayMode') this.payMode,
      @JsonKey(name: 'PayModeDesc') this.payModeDesc,
      @JsonKey(name: 'PaymentStatus') this.paymentStatus,
      @JsonKey(name: 'BneficiaryId') this.bneficiaryId,
      @JsonKey(name: 'ServiceCode') this.serviceCode,
      @JsonKey(name: 'ServiceType') this.serviceType,
      @JsonKey(name: 'BenfActiveStatus') this.benfActiveStatus,
      @JsonKey(name: 'ReadyForCancel') this.readyForCancel,
      @JsonKey(name: 'TransactionStatus') this.transactionStatus,
      @JsonKey(name: 'ServiceProvider') this.serviceProvider,
      @JsonKey(name: 'PaymentRefNo') this.paymentRefNo,
      @JsonKey(name: 'DivisionRate') this.divisionRate,
      @JsonKey(name: 'Header') this.header,
      @JsonKey(name: 'IsMobileTxn') this.isMobileTxn,
      @JsonKey(name: 'IsCorrespondentActive') this.isCorrespondentActive,
      @JsonKey(name: 'BranchName') this.branchName,
      @JsonKey(name: 'Purpose') this.purpose,
      @JsonKey(name: 'IfscCode') this.ifscCode,
      @JsonKey(name: 'Rebate') this.rebate,
      @JsonKey(name: 'BranchCode') this.branchCode,
      @JsonKey(name: 'Customer') this.customer,
      @JsonKey(name: 'Email') this.email,
      @JsonKey(name: 'TaxCard') this.taxCard,
      @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin)
      this.customerVatin,
      @JsonKey(name: 'ArieEmployeeFlag') this.arieEmployeeFlag,
      @JsonKey(name: 'Relationship') this.relationship,
      @JsonKey(name: 'DestinationCountryCode') this.destinationCountryCode,
      @JsonKey(name: 'DestinationCountry') this.destinationCountry,
      @JsonKey(name: 'CR') this.cr,
      @JsonKey(name: 'CustomerNationality') this.customerNationality,
      @JsonKey(name: 'CustomerNationalityCode') this.customerNationalityCode,
      @JsonKey(name: 'Source') this.source,
      @JsonKey(name: 'BeneficiaryNationality') this.beneficiaryNationality,
      @JsonKey(name: 'BeneficiaryAddress') this.beneficiaryAddress,
      @JsonKey(name: 'BeneficiaryCountryCode') this.beneficiaryCountryCode,
      @JsonKey(name: 'Correspondent') this.correspondent,
      @JsonKey(name: 'Profession') this.profession,
      @JsonKey(name: 'BeneficiaryType') this.beneficiaryType,
      @JsonKey(name: 'CustomerIdDescription') this.customerIdDescription,
      @JsonKey(name: 'VisaType') this.visaType,
      @JsonKey(name: 'CustomerType') this.customerType,
      @JsonKey(name: 'BranchId') this.branchId,
      @JsonKey(name: 'BirthCountryCode') this.birthCountryCode,
      @JsonKey(name: 'BirthCountry') this.birthCountry,
      @JsonKey(name: 'CustomerIdNo') this.customerIdNo,
      @JsonKey(name: 'CustomerCode') this.customerCode,
      @JsonKey(name: 'IsPep') this.isPep,
      @JsonKey(name: 'IdCode') this.idCode,
      @JsonKey(name: 'PaymentType') this.paymentType,
      @JsonKey(name: 'CustomerDob') this.customerDob,
      @JsonKey(name: 'IdIssuePlace') this.idIssuePlace,
      @JsonKey(
          name: 'IdIssueDate',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      this.idIssueDate,
      @JsonKey(name: 'IdType') this.idType,
      @JsonKey(name: 'IdDescription') this.idDescription,
      @JsonKey(
          name: 'IdExpiry',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      this.idExpiry,
      @JsonKey(name: 'Phone') this.phone,
      @JsonKey(name: 'Address') this.address,
      @JsonKey(name: 'CompanyName') this.companyName,
      @JsonKey(name: 'TransactionService') this.transactionService,
      @JsonKey(name: 'IsIntegration') this.isIntegration});
  factory _TransactionDetailsFz.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailsFzFromJson(json);

  @override
  @JsonKey(name: 'ReferenceNo')
  final String? transactionReference;
  @override
  @JsonKey(name: 'ChqNo')
  final String? chqNo;
  @override
  @JsonKey(
      name: 'TranDate', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
  final DateTime? transactionDate;
  @override
  @JsonKey(name: "CustomerName", readValue: _readCustName)
  final String? customerName;
  @override
  @JsonKey(name: 'CustomerFirstName')
  final String? custFirstName;
  @override
  @JsonKey(name: 'CustomerMiddleName')
  final String? custMiddleName;
  @override
  @JsonKey(name: 'CustomerLastName')
  final String? custLastName;
  @override
  @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
  final String? beneficiaryName;
  @override
  @JsonKey(name: 'BenfName')
  final String? benfFirstName;
  @override
  @JsonKey(name: 'BenfName2')
  final String? benfMiddleName;
  @override
  @JsonKey(name: 'BenfName3')
  final String? benfLastName;
  @override
  @JsonKey(name: 'BenfCountry')
  final String? benfCountry;
  @override
  @JsonKey(name: 'BenfCurrencyCode')
  final String? toCurrencyCode;
  @override
  @JsonKey(name: 'CurrencyCode')
  final String? fromCurrencyCode;
  @override
  @JsonKey(name: 'AccountNo')
  final String? accountNumber;
  @override
  @JsonKey(name: 'BankName')
  final String? bankName;
  @override
  @JsonKey(name: 'FcyAmount')
  final double? paymentAmount;
  @override
  @JsonKey(name: 'LcyAmount')
  final String? receivedAmount;
  @override
  @JsonKey(name: 'Charges')
  final String? charge;
  @override
  @JsonKey(name: 'TaxAmount')
  final double? taxAmount;
  @override
  @JsonKey(name: 'NetAmount')
  final double? netAmount;
  @override
  @JsonKey(name: 'MultiplicationRate')
  final double? multiplicationRate;
// @JsonKey(name: 'Status') String? status,
  @override
  @JsonKey(name: 'BeneficiaryMobile')
  final String? beneficiaryMobile;
  @override
  @JsonKey(name: 'ServMode')
  final String? servMode;
  @override
  @JsonKey(name: 'PinNumber')
  final String? pinNumber;
  @override
  @JsonKey(name: 'PayMode')
  final String? payMode;
  @override
  @JsonKey(name: 'PayModeDesc')
  final String? payModeDesc;
  @override
  @JsonKey(name: 'PaymentStatus')
  final String? paymentStatus;
  @override
  @JsonKey(name: 'BneficiaryId')
  final String? bneficiaryId;
  @override
  @JsonKey(name: 'ServiceCode')
  final String? serviceCode;
  @override
  @JsonKey(name: 'ServiceType')
  final String? serviceType;
  @override
  @JsonKey(name: 'BenfActiveStatus')
  final String? benfActiveStatus;
  @override
  @JsonKey(name: 'ReadyForCancel')
  final String? readyForCancel;
  @override
  @JsonKey(name: 'TransactionStatus')
  final String? transactionStatus;
  @override
  @JsonKey(name: 'ServiceProvider')
  final String? serviceProvider;
  @override
  @JsonKey(name: 'PaymentRefNo')
  final String? paymentRefNo;
  @override
  @JsonKey(name: 'DivisionRate')
  final double? divisionRate;
  @override
  @JsonKey(name: 'Header')
  final String? header;
  @override
  @JsonKey(name: 'IsMobileTxn')
  final bool? isMobileTxn;
  @override
  @JsonKey(name: 'IsCorrespondentActive')
  final String? isCorrespondentActive;
  @override
  @JsonKey(name: 'BranchName')
  final String? branchName;
  @override
  @JsonKey(name: 'Purpose')
  final String? purpose;
  @override
  @JsonKey(name: 'IfscCode')
  final String? ifscCode;
  @override
  @JsonKey(name: 'Rebate')
  final String? rebate;
  @override
  @JsonKey(name: 'BranchCode')
  final String? branchCode;
  @override
  @JsonKey(name: 'Customer')
  final String? customer;
  @override
  @JsonKey(name: 'Email')
  final String? email;
  @override
  @JsonKey(name: 'TaxCard')
  final String? taxCard;
  @override
  @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin)
  final double? customerVatin;
  @override
  @JsonKey(name: 'ArieEmployeeFlag')
  final String? arieEmployeeFlag;
  @override
  @JsonKey(name: 'Relationship')
  final String? relationship;
  @override
  @JsonKey(name: 'DestinationCountryCode')
  final String? destinationCountryCode;
  @override
  @JsonKey(name: 'DestinationCountry')
  final String? destinationCountry;
  @override
  @JsonKey(name: 'CR')
  final String? cr;
  @override
  @JsonKey(name: 'CustomerNationality')
  final String? customerNationality;
  @override
  @JsonKey(name: 'CustomerNationalityCode')
  final String? customerNationalityCode;
  @override
  @JsonKey(name: 'Source')
  final String? source;
  @override
  @JsonKey(name: 'BeneficiaryNationality')
  final String? beneficiaryNationality;
  @override
  @JsonKey(name: 'BeneficiaryAddress')
  final String? beneficiaryAddress;
  @override
  @JsonKey(name: 'BeneficiaryCountryCode')
  final String? beneficiaryCountryCode;
  @override
  @JsonKey(name: 'Correspondent')
  final String? correspondent;
  @override
  @JsonKey(name: 'Profession')
  final String? profession;
  @override
  @JsonKey(name: 'BeneficiaryType')
  final String? beneficiaryType;
  @override
  @JsonKey(name: 'CustomerIdDescription')
  final String? customerIdDescription;
  @override
  @JsonKey(name: 'VisaType')
  final String? visaType;
  @override
  @JsonKey(name: 'CustomerType')
  final String? customerType;
  @override
  @JsonKey(name: 'BranchId')
  final String? branchId;
  @override
  @JsonKey(name: 'BirthCountryCode')
  final String? birthCountryCode;
  @override
  @JsonKey(name: 'BirthCountry')
  final String? birthCountry;
  @override
  @JsonKey(name: 'CustomerIdNo')
  final String? customerIdNo;
  @override
  @JsonKey(name: 'CustomerCode')
  final String? customerCode;
  @override
  @JsonKey(name: 'IsPep')
  final String? isPep;
  @override
  @JsonKey(name: 'IdCode')
  final String? idCode;
  @override
  @JsonKey(name: 'PaymentType')
  final String? paymentType;
  @override
  @JsonKey(name: 'CustomerDob')
  final String? customerDob;
  @override
  @JsonKey(name: 'IdIssuePlace')
  final String? idIssuePlace;
  @override
  @JsonKey(
      name: 'IdIssueDate', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
  final DateTime? idIssueDate;
  @override
  @JsonKey(name: 'IdType')
  final String? idType;
  @override
  @JsonKey(name: 'IdDescription')
  final String? idDescription;
  @override
  @JsonKey(
      name: 'IdExpiry', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
  final DateTime? idExpiry;
  @override
  @JsonKey(name: 'Phone')
  final String? phone;
  @override
  @JsonKey(name: 'Address')
  final String? address;
  @override
  @JsonKey(name: 'CompanyName')
  final String? companyName;
  @override
  @JsonKey(name: 'TransactionService')
  final String? transactionService;
  @override
  @JsonKey(name: 'IsIntegration')
  final String? isIntegration;

  /// Create a copy of TransactionDetailsFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TransactionDetailsFzCopyWith<_TransactionDetailsFz> get copyWith =>
      __$TransactionDetailsFzCopyWithImpl<_TransactionDetailsFz>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TransactionDetailsFzToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TransactionDetailsFz &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.chqNo, chqNo) || other.chqNo == chqNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.custFirstName, custFirstName) ||
                other.custFirstName == custFirstName) &&
            (identical(other.custMiddleName, custMiddleName) ||
                other.custMiddleName == custMiddleName) &&
            (identical(other.custLastName, custLastName) ||
                other.custLastName == custLastName) &&
            (identical(other.beneficiaryName, beneficiaryName) ||
                other.beneficiaryName == beneficiaryName) &&
            (identical(other.benfFirstName, benfFirstName) ||
                other.benfFirstName == benfFirstName) &&
            (identical(other.benfMiddleName, benfMiddleName) ||
                other.benfMiddleName == benfMiddleName) &&
            (identical(other.benfLastName, benfLastName) ||
                other.benfLastName == benfLastName) &&
            (identical(other.benfCountry, benfCountry) ||
                other.benfCountry == benfCountry) &&
            (identical(other.toCurrencyCode, toCurrencyCode) ||
                other.toCurrencyCode == toCurrencyCode) &&
            (identical(other.fromCurrencyCode, fromCurrencyCode) ||
                other.fromCurrencyCode == fromCurrencyCode) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.receivedAmount, receivedAmount) ||
                other.receivedAmount == receivedAmount) &&
            (identical(other.charge, charge) || other.charge == charge) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.netAmount, netAmount) ||
                other.netAmount == netAmount) &&
            (identical(other.multiplicationRate, multiplicationRate) ||
                other.multiplicationRate == multiplicationRate) &&
            (identical(other.beneficiaryMobile, beneficiaryMobile) ||
                other.beneficiaryMobile == beneficiaryMobile) &&
            (identical(other.servMode, servMode) ||
                other.servMode == servMode) &&
            (identical(other.pinNumber, pinNumber) ||
                other.pinNumber == pinNumber) &&
            (identical(other.payMode, payMode) || other.payMode == payMode) &&
            (identical(other.payModeDesc, payModeDesc) ||
                other.payModeDesc == payModeDesc) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.bneficiaryId, bneficiaryId) ||
                other.bneficiaryId == bneficiaryId) &&
            (identical(other.serviceCode, serviceCode) ||
                other.serviceCode == serviceCode) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.benfActiveStatus, benfActiveStatus) ||
                other.benfActiveStatus == benfActiveStatus) &&
            (identical(other.readyForCancel, readyForCancel) ||
                other.readyForCancel == readyForCancel) &&
            (identical(other.transactionStatus, transactionStatus) ||
                other.transactionStatus == transactionStatus) &&
            (identical(other.serviceProvider, serviceProvider) ||
                other.serviceProvider == serviceProvider) &&
            (identical(other.paymentRefNo, paymentRefNo) ||
                other.paymentRefNo == paymentRefNo) &&
            (identical(other.divisionRate, divisionRate) ||
                other.divisionRate == divisionRate) &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.isMobileTxn, isMobileTxn) ||
                other.isMobileTxn == isMobileTxn) &&
            (identical(other.isCorrespondentActive, isCorrespondentActive) ||
                other.isCorrespondentActive == isCorrespondentActive) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.purpose, purpose) || other.purpose == purpose) &&
            (identical(other.ifscCode, ifscCode) ||
                other.ifscCode == ifscCode) &&
            (identical(other.rebate, rebate) || other.rebate == rebate) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.taxCard, taxCard) || other.taxCard == taxCard) &&
            (identical(other.customerVatin, customerVatin) ||
                other.customerVatin == customerVatin) &&
            (identical(other.arieEmployeeFlag, arieEmployeeFlag) ||
                other.arieEmployeeFlag == arieEmployeeFlag) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship) &&
            (identical(other.destinationCountryCode, destinationCountryCode) || other.destinationCountryCode == destinationCountryCode) &&
            (identical(other.destinationCountry, destinationCountry) || other.destinationCountry == destinationCountry) &&
            (identical(other.cr, cr) || other.cr == cr) &&
            (identical(other.customerNationality, customerNationality) || other.customerNationality == customerNationality) &&
            (identical(other.customerNationalityCode, customerNationalityCode) || other.customerNationalityCode == customerNationalityCode) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.beneficiaryNationality, beneficiaryNationality) || other.beneficiaryNationality == beneficiaryNationality) &&
            (identical(other.beneficiaryAddress, beneficiaryAddress) || other.beneficiaryAddress == beneficiaryAddress) &&
            (identical(other.beneficiaryCountryCode, beneficiaryCountryCode) || other.beneficiaryCountryCode == beneficiaryCountryCode) &&
            (identical(other.correspondent, correspondent) || other.correspondent == correspondent) &&
            (identical(other.profession, profession) || other.profession == profession) &&
            (identical(other.beneficiaryType, beneficiaryType) || other.beneficiaryType == beneficiaryType) &&
            (identical(other.customerIdDescription, customerIdDescription) || other.customerIdDescription == customerIdDescription) &&
            (identical(other.visaType, visaType) || other.visaType == visaType) &&
            (identical(other.customerType, customerType) || other.customerType == customerType) &&
            (identical(other.branchId, branchId) || other.branchId == branchId) &&
            (identical(other.birthCountryCode, birthCountryCode) || other.birthCountryCode == birthCountryCode) &&
            (identical(other.birthCountry, birthCountry) || other.birthCountry == birthCountry) &&
            (identical(other.customerIdNo, customerIdNo) || other.customerIdNo == customerIdNo) &&
            (identical(other.customerCode, customerCode) || other.customerCode == customerCode) &&
            (identical(other.isPep, isPep) || other.isPep == isPep) &&
            (identical(other.idCode, idCode) || other.idCode == idCode) &&
            (identical(other.paymentType, paymentType) || other.paymentType == paymentType) &&
            (identical(other.customerDob, customerDob) || other.customerDob == customerDob) &&
            (identical(other.idIssuePlace, idIssuePlace) || other.idIssuePlace == idIssuePlace) &&
            (identical(other.idIssueDate, idIssueDate) || other.idIssueDate == idIssueDate) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idDescription, idDescription) || other.idDescription == idDescription) &&
            (identical(other.idExpiry, idExpiry) || other.idExpiry == idExpiry) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.companyName, companyName) || other.companyName == companyName) &&
            (identical(other.transactionService, transactionService) || other.transactionService == transactionService) &&
            (identical(other.isIntegration, isIntegration) || other.isIntegration == isIntegration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        transactionReference,
        chqNo,
        transactionDate,
        customerName,
        custFirstName,
        custMiddleName,
        custLastName,
        beneficiaryName,
        benfFirstName,
        benfMiddleName,
        benfLastName,
        benfCountry,
        toCurrencyCode,
        fromCurrencyCode,
        accountNumber,
        bankName,
        paymentAmount,
        receivedAmount,
        charge,
        taxAmount,
        netAmount,
        multiplicationRate,
        beneficiaryMobile,
        servMode,
        pinNumber,
        payMode,
        payModeDesc,
        paymentStatus,
        bneficiaryId,
        serviceCode,
        serviceType,
        benfActiveStatus,
        readyForCancel,
        transactionStatus,
        serviceProvider,
        paymentRefNo,
        divisionRate,
        header,
        isMobileTxn,
        isCorrespondentActive,
        branchName,
        purpose,
        ifscCode,
        rebate,
        branchCode,
        customer,
        email,
        taxCard,
        customerVatin,
        arieEmployeeFlag,
        relationship,
        destinationCountryCode,
        destinationCountry,
        cr,
        customerNationality,
        customerNationalityCode,
        source,
        beneficiaryNationality,
        beneficiaryAddress,
        beneficiaryCountryCode,
        correspondent,
        profession,
        beneficiaryType,
        customerIdDescription,
        visaType,
        customerType,
        branchId,
        birthCountryCode,
        birthCountry,
        customerIdNo,
        customerCode,
        isPep,
        idCode,
        paymentType,
        customerDob,
        idIssuePlace,
        idIssueDate,
        idType,
        idDescription,
        idExpiry,
        phone,
        address,
        companyName,
        transactionService,
        isIntegration
      ]);

  @override
  String toString() {
    return 'TransactionDetailsFz(transactionReference: $transactionReference, chqNo: $chqNo, transactionDate: $transactionDate, customerName: $customerName, custFirstName: $custFirstName, custMiddleName: $custMiddleName, custLastName: $custLastName, beneficiaryName: $beneficiaryName, benfFirstName: $benfFirstName, benfMiddleName: $benfMiddleName, benfLastName: $benfLastName, benfCountry: $benfCountry, toCurrencyCode: $toCurrencyCode, fromCurrencyCode: $fromCurrencyCode, accountNumber: $accountNumber, bankName: $bankName, paymentAmount: $paymentAmount, receivedAmount: $receivedAmount, charge: $charge, taxAmount: $taxAmount, netAmount: $netAmount, multiplicationRate: $multiplicationRate, beneficiaryMobile: $beneficiaryMobile, servMode: $servMode, pinNumber: $pinNumber, payMode: $payMode, payModeDesc: $payModeDesc, paymentStatus: $paymentStatus, bneficiaryId: $bneficiaryId, serviceCode: $serviceCode, serviceType: $serviceType, benfActiveStatus: $benfActiveStatus, readyForCancel: $readyForCancel, transactionStatus: $transactionStatus, serviceProvider: $serviceProvider, paymentRefNo: $paymentRefNo, divisionRate: $divisionRate, header: $header, isMobileTxn: $isMobileTxn, isCorrespondentActive: $isCorrespondentActive, branchName: $branchName, purpose: $purpose, ifscCode: $ifscCode, rebate: $rebate, branchCode: $branchCode, customer: $customer, email: $email, taxCard: $taxCard, customerVatin: $customerVatin, arieEmployeeFlag: $arieEmployeeFlag, relationship: $relationship, destinationCountryCode: $destinationCountryCode, destinationCountry: $destinationCountry, cr: $cr, customerNationality: $customerNationality, customerNationalityCode: $customerNationalityCode, source: $source, beneficiaryNationality: $beneficiaryNationality, beneficiaryAddress: $beneficiaryAddress, beneficiaryCountryCode: $beneficiaryCountryCode, correspondent: $correspondent, profession: $profession, beneficiaryType: $beneficiaryType, customerIdDescription: $customerIdDescription, visaType: $visaType, customerType: $customerType, branchId: $branchId, birthCountryCode: $birthCountryCode, birthCountry: $birthCountry, customerIdNo: $customerIdNo, customerCode: $customerCode, isPep: $isPep, idCode: $idCode, paymentType: $paymentType, customerDob: $customerDob, idIssuePlace: $idIssuePlace, idIssueDate: $idIssueDate, idType: $idType, idDescription: $idDescription, idExpiry: $idExpiry, phone: $phone, address: $address, companyName: $companyName, transactionService: $transactionService, isIntegration: $isIntegration)';
  }
}

/// @nodoc
abstract mixin class _$TransactionDetailsFzCopyWith<$Res>
    implements $TransactionDetailsFzCopyWith<$Res> {
  factory _$TransactionDetailsFzCopyWith(_TransactionDetailsFz value,
          $Res Function(_TransactionDetailsFz) _then) =
      __$TransactionDetailsFzCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ReferenceNo') String? transactionReference,
      @JsonKey(name: 'ChqNo') String? chqNo,
      @JsonKey(
          name: 'TranDate',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      DateTime? transactionDate,
      @JsonKey(name: "CustomerName", readValue: _readCustName)
      String? customerName,
      @JsonKey(name: 'CustomerFirstName') String? custFirstName,
      @JsonKey(name: 'CustomerMiddleName') String? custMiddleName,
      @JsonKey(name: 'CustomerLastName') String? custLastName,
      @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
      String? beneficiaryName,
      @JsonKey(name: 'BenfName') String? benfFirstName,
      @JsonKey(name: 'BenfName2') String? benfMiddleName,
      @JsonKey(name: 'BenfName3') String? benfLastName,
      @JsonKey(name: 'BenfCountry') String? benfCountry,
      @JsonKey(name: 'BenfCurrencyCode') String? toCurrencyCode,
      @JsonKey(name: 'CurrencyCode') String? fromCurrencyCode,
      @JsonKey(name: 'AccountNo') String? accountNumber,
      @JsonKey(name: 'BankName') String? bankName,
      @JsonKey(name: 'FcyAmount') double? paymentAmount,
      @JsonKey(name: 'LcyAmount') String? receivedAmount,
      @JsonKey(name: 'Charges') String? charge,
      @JsonKey(name: 'TaxAmount') double? taxAmount,
      @JsonKey(name: 'NetAmount') double? netAmount,
      @JsonKey(name: 'MultiplicationRate') double? multiplicationRate,
      @JsonKey(name: 'BeneficiaryMobile') String? beneficiaryMobile,
      @JsonKey(name: 'ServMode') String? servMode,
      @JsonKey(name: 'PinNumber') String? pinNumber,
      @JsonKey(name: 'PayMode') String? payMode,
      @JsonKey(name: 'PayModeDesc') String? payModeDesc,
      @JsonKey(name: 'PaymentStatus') String? paymentStatus,
      @JsonKey(name: 'BneficiaryId') String? bneficiaryId,
      @JsonKey(name: 'ServiceCode') String? serviceCode,
      @JsonKey(name: 'ServiceType') String? serviceType,
      @JsonKey(name: 'BenfActiveStatus') String? benfActiveStatus,
      @JsonKey(name: 'ReadyForCancel') String? readyForCancel,
      @JsonKey(name: 'TransactionStatus') String? transactionStatus,
      @JsonKey(name: 'ServiceProvider') String? serviceProvider,
      @JsonKey(name: 'PaymentRefNo') String? paymentRefNo,
      @JsonKey(name: 'DivisionRate') double? divisionRate,
      @JsonKey(name: 'Header') String? header,
      @JsonKey(name: 'IsMobileTxn') bool? isMobileTxn,
      @JsonKey(name: 'IsCorrespondentActive') String? isCorrespondentActive,
      @JsonKey(name: 'BranchName') String? branchName,
      @JsonKey(name: 'Purpose') String? purpose,
      @JsonKey(name: 'IfscCode') String? ifscCode,
      @JsonKey(name: 'Rebate') String? rebate,
      @JsonKey(name: 'BranchCode') String? branchCode,
      @JsonKey(name: 'Customer') String? customer,
      @JsonKey(name: 'Email') String? email,
      @JsonKey(name: 'TaxCard') String? taxCard,
      @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin)
      double? customerVatin,
      @JsonKey(name: 'ArieEmployeeFlag') String? arieEmployeeFlag,
      @JsonKey(name: 'Relationship') String? relationship,
      @JsonKey(name: 'DestinationCountryCode') String? destinationCountryCode,
      @JsonKey(name: 'DestinationCountry') String? destinationCountry,
      @JsonKey(name: 'CR') String? cr,
      @JsonKey(name: 'CustomerNationality') String? customerNationality,
      @JsonKey(name: 'CustomerNationalityCode') String? customerNationalityCode,
      @JsonKey(name: 'Source') String? source,
      @JsonKey(name: 'BeneficiaryNationality') String? beneficiaryNationality,
      @JsonKey(name: 'BeneficiaryAddress') String? beneficiaryAddress,
      @JsonKey(name: 'BeneficiaryCountryCode') String? beneficiaryCountryCode,
      @JsonKey(name: 'Correspondent') String? correspondent,
      @JsonKey(name: 'Profession') String? profession,
      @JsonKey(name: 'BeneficiaryType') String? beneficiaryType,
      @JsonKey(name: 'CustomerIdDescription') String? customerIdDescription,
      @JsonKey(name: 'VisaType') String? visaType,
      @JsonKey(name: 'CustomerType') String? customerType,
      @JsonKey(name: 'BranchId') String? branchId,
      @JsonKey(name: 'BirthCountryCode') String? birthCountryCode,
      @JsonKey(name: 'BirthCountry') String? birthCountry,
      @JsonKey(name: 'CustomerIdNo') String? customerIdNo,
      @JsonKey(name: 'CustomerCode') String? customerCode,
      @JsonKey(name: 'IsPep') String? isPep,
      @JsonKey(name: 'IdCode') String? idCode,
      @JsonKey(name: 'PaymentType') String? paymentType,
      @JsonKey(name: 'CustomerDob') String? customerDob,
      @JsonKey(name: 'IdIssuePlace') String? idIssuePlace,
      @JsonKey(
          name: 'IdIssueDate',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      DateTime? idIssueDate,
      @JsonKey(name: 'IdType') String? idType,
      @JsonKey(name: 'IdDescription') String? idDescription,
      @JsonKey(
          name: 'IdExpiry',
          fromJson: _fromJsonDateTime,
          toJson: _toJsonDateTime)
      DateTime? idExpiry,
      @JsonKey(name: 'Phone') String? phone,
      @JsonKey(name: 'Address') String? address,
      @JsonKey(name: 'CompanyName') String? companyName,
      @JsonKey(name: 'TransactionService') String? transactionService,
      @JsonKey(name: 'IsIntegration') String? isIntegration});
}

/// @nodoc
class __$TransactionDetailsFzCopyWithImpl<$Res>
    implements _$TransactionDetailsFzCopyWith<$Res> {
  __$TransactionDetailsFzCopyWithImpl(this._self, this._then);

  final _TransactionDetailsFz _self;
  final $Res Function(_TransactionDetailsFz) _then;

  /// Create a copy of TransactionDetailsFz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transactionReference = freezed,
    Object? chqNo = freezed,
    Object? transactionDate = freezed,
    Object? customerName = freezed,
    Object? custFirstName = freezed,
    Object? custMiddleName = freezed,
    Object? custLastName = freezed,
    Object? beneficiaryName = freezed,
    Object? benfFirstName = freezed,
    Object? benfMiddleName = freezed,
    Object? benfLastName = freezed,
    Object? benfCountry = freezed,
    Object? toCurrencyCode = freezed,
    Object? fromCurrencyCode = freezed,
    Object? accountNumber = freezed,
    Object? bankName = freezed,
    Object? paymentAmount = freezed,
    Object? receivedAmount = freezed,
    Object? charge = freezed,
    Object? taxAmount = freezed,
    Object? netAmount = freezed,
    Object? multiplicationRate = freezed,
    Object? beneficiaryMobile = freezed,
    Object? servMode = freezed,
    Object? pinNumber = freezed,
    Object? payMode = freezed,
    Object? payModeDesc = freezed,
    Object? paymentStatus = freezed,
    Object? bneficiaryId = freezed,
    Object? serviceCode = freezed,
    Object? serviceType = freezed,
    Object? benfActiveStatus = freezed,
    Object? readyForCancel = freezed,
    Object? transactionStatus = freezed,
    Object? serviceProvider = freezed,
    Object? paymentRefNo = freezed,
    Object? divisionRate = freezed,
    Object? header = freezed,
    Object? isMobileTxn = freezed,
    Object? isCorrespondentActive = freezed,
    Object? branchName = freezed,
    Object? purpose = freezed,
    Object? ifscCode = freezed,
    Object? rebate = freezed,
    Object? branchCode = freezed,
    Object? customer = freezed,
    Object? email = freezed,
    Object? taxCard = freezed,
    Object? customerVatin = freezed,
    Object? arieEmployeeFlag = freezed,
    Object? relationship = freezed,
    Object? destinationCountryCode = freezed,
    Object? destinationCountry = freezed,
    Object? cr = freezed,
    Object? customerNationality = freezed,
    Object? customerNationalityCode = freezed,
    Object? source = freezed,
    Object? beneficiaryNationality = freezed,
    Object? beneficiaryAddress = freezed,
    Object? beneficiaryCountryCode = freezed,
    Object? correspondent = freezed,
    Object? profession = freezed,
    Object? beneficiaryType = freezed,
    Object? customerIdDescription = freezed,
    Object? visaType = freezed,
    Object? customerType = freezed,
    Object? branchId = freezed,
    Object? birthCountryCode = freezed,
    Object? birthCountry = freezed,
    Object? customerIdNo = freezed,
    Object? customerCode = freezed,
    Object? isPep = freezed,
    Object? idCode = freezed,
    Object? paymentType = freezed,
    Object? customerDob = freezed,
    Object? idIssuePlace = freezed,
    Object? idIssueDate = freezed,
    Object? idType = freezed,
    Object? idDescription = freezed,
    Object? idExpiry = freezed,
    Object? phone = freezed,
    Object? address = freezed,
    Object? companyName = freezed,
    Object? transactionService = freezed,
    Object? isIntegration = freezed,
  }) {
    return _then(_TransactionDetailsFz(
      transactionReference: freezed == transactionReference
          ? _self.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      chqNo: freezed == chqNo
          ? _self.chqNo
          : chqNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _self.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      customerName: freezed == customerName
          ? _self.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      custFirstName: freezed == custFirstName
          ? _self.custFirstName
          : custFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      custMiddleName: freezed == custMiddleName
          ? _self.custMiddleName
          : custMiddleName // ignore: cast_nullable_to_non_nullable
              as String?,
      custLastName: freezed == custLastName
          ? _self.custLastName
          : custLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryName: freezed == beneficiaryName
          ? _self.beneficiaryName
          : beneficiaryName // ignore: cast_nullable_to_non_nullable
              as String?,
      benfFirstName: freezed == benfFirstName
          ? _self.benfFirstName
          : benfFirstName // ignore: cast_nullable_to_non_nullable
              as String?,
      benfMiddleName: freezed == benfMiddleName
          ? _self.benfMiddleName
          : benfMiddleName // ignore: cast_nullable_to_non_nullable
              as String?,
      benfLastName: freezed == benfLastName
          ? _self.benfLastName
          : benfLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      benfCountry: freezed == benfCountry
          ? _self.benfCountry
          : benfCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      toCurrencyCode: freezed == toCurrencyCode
          ? _self.toCurrencyCode
          : toCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      fromCurrencyCode: freezed == fromCurrencyCode
          ? _self.fromCurrencyCode
          : fromCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentAmount: freezed == paymentAmount
          ? _self.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      receivedAmount: freezed == receivedAmount
          ? _self.receivedAmount
          : receivedAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      charge: freezed == charge
          ? _self.charge
          : charge // ignore: cast_nullable_to_non_nullable
              as String?,
      taxAmount: freezed == taxAmount
          ? _self.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      netAmount: freezed == netAmount
          ? _self.netAmount
          : netAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      multiplicationRate: freezed == multiplicationRate
          ? _self.multiplicationRate
          : multiplicationRate // ignore: cast_nullable_to_non_nullable
              as double?,
      beneficiaryMobile: freezed == beneficiaryMobile
          ? _self.beneficiaryMobile
          : beneficiaryMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      servMode: freezed == servMode
          ? _self.servMode
          : servMode // ignore: cast_nullable_to_non_nullable
              as String?,
      pinNumber: freezed == pinNumber
          ? _self.pinNumber
          : pinNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      payMode: freezed == payMode
          ? _self.payMode
          : payMode // ignore: cast_nullable_to_non_nullable
              as String?,
      payModeDesc: freezed == payModeDesc
          ? _self.payModeDesc
          : payModeDesc // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: freezed == paymentStatus
          ? _self.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      bneficiaryId: freezed == bneficiaryId
          ? _self.bneficiaryId
          : bneficiaryId // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCode: freezed == serviceCode
          ? _self.serviceCode
          : serviceCode // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: freezed == serviceType
          ? _self.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String?,
      benfActiveStatus: freezed == benfActiveStatus
          ? _self.benfActiveStatus
          : benfActiveStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      readyForCancel: freezed == readyForCancel
          ? _self.readyForCancel
          : readyForCancel // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionStatus: freezed == transactionStatus
          ? _self.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceProvider: freezed == serviceProvider
          ? _self.serviceProvider
          : serviceProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentRefNo: freezed == paymentRefNo
          ? _self.paymentRefNo
          : paymentRefNo // ignore: cast_nullable_to_non_nullable
              as String?,
      divisionRate: freezed == divisionRate
          ? _self.divisionRate
          : divisionRate // ignore: cast_nullable_to_non_nullable
              as double?,
      header: freezed == header
          ? _self.header
          : header // ignore: cast_nullable_to_non_nullable
              as String?,
      isMobileTxn: freezed == isMobileTxn
          ? _self.isMobileTxn
          : isMobileTxn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCorrespondentActive: freezed == isCorrespondentActive
          ? _self.isCorrespondentActive
          : isCorrespondentActive // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _self.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      purpose: freezed == purpose
          ? _self.purpose
          : purpose // ignore: cast_nullable_to_non_nullable
              as String?,
      ifscCode: freezed == ifscCode
          ? _self.ifscCode
          : ifscCode // ignore: cast_nullable_to_non_nullable
              as String?,
      rebate: freezed == rebate
          ? _self.rebate
          : rebate // ignore: cast_nullable_to_non_nullable
              as String?,
      branchCode: freezed == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      taxCard: freezed == taxCard
          ? _self.taxCard
          : taxCard // ignore: cast_nullable_to_non_nullable
              as String?,
      customerVatin: freezed == customerVatin
          ? _self.customerVatin
          : customerVatin // ignore: cast_nullable_to_non_nullable
              as double?,
      arieEmployeeFlag: freezed == arieEmployeeFlag
          ? _self.arieEmployeeFlag
          : arieEmployeeFlag // ignore: cast_nullable_to_non_nullable
              as String?,
      relationship: freezed == relationship
          ? _self.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationCountryCode: freezed == destinationCountryCode
          ? _self.destinationCountryCode
          : destinationCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      destinationCountry: freezed == destinationCountry
          ? _self.destinationCountry
          : destinationCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      cr: freezed == cr
          ? _self.cr
          : cr // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNationality: freezed == customerNationality
          ? _self.customerNationality
          : customerNationality // ignore: cast_nullable_to_non_nullable
              as String?,
      customerNationalityCode: freezed == customerNationalityCode
          ? _self.customerNationalityCode
          : customerNationalityCode // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryNationality: freezed == beneficiaryNationality
          ? _self.beneficiaryNationality
          : beneficiaryNationality // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryAddress: freezed == beneficiaryAddress
          ? _self.beneficiaryAddress
          : beneficiaryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryCountryCode: freezed == beneficiaryCountryCode
          ? _self.beneficiaryCountryCode
          : beneficiaryCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      correspondent: freezed == correspondent
          ? _self.correspondent
          : correspondent // ignore: cast_nullable_to_non_nullable
              as String?,
      profession: freezed == profession
          ? _self.profession
          : profession // ignore: cast_nullable_to_non_nullable
              as String?,
      beneficiaryType: freezed == beneficiaryType
          ? _self.beneficiaryType
          : beneficiaryType // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdDescription: freezed == customerIdDescription
          ? _self.customerIdDescription
          : customerIdDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      visaType: freezed == visaType
          ? _self.visaType
          : visaType // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: freezed == customerType
          ? _self.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String?,
      branchId: freezed == branchId
          ? _self.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String?,
      birthCountryCode: freezed == birthCountryCode
          ? _self.birthCountryCode
          : birthCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      birthCountry: freezed == birthCountry
          ? _self.birthCountry
          : birthCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      customerIdNo: freezed == customerIdNo
          ? _self.customerIdNo
          : customerIdNo // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCode: freezed == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPep: freezed == isPep
          ? _self.isPep
          : isPep // ignore: cast_nullable_to_non_nullable
              as String?,
      idCode: freezed == idCode
          ? _self.idCode
          : idCode // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: freezed == paymentType
          ? _self.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      customerDob: freezed == customerDob
          ? _self.customerDob
          : customerDob // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssuePlace: freezed == idIssuePlace
          ? _self.idIssuePlace
          : idIssuePlace // ignore: cast_nullable_to_non_nullable
              as String?,
      idIssueDate: freezed == idIssueDate
          ? _self.idIssueDate
          : idIssueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idType: freezed == idType
          ? _self.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as String?,
      idDescription: freezed == idDescription
          ? _self.idDescription
          : idDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      idExpiry: freezed == idExpiry
          ? _self.idExpiry
          : idExpiry // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionService: freezed == transactionService
          ? _self.transactionService
          : transactionService // ignore: cast_nullable_to_non_nullable
              as String?,
      isIntegration: freezed == isIntegration
          ? _self.isIntegration
          : isIntegration // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
