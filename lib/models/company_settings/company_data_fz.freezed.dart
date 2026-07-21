// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_data_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyDataFZ {
  @JsonKey(name: 'ClientCode')
  String get clientCode;
  @JsonKey(name: 'LicenseCountry')
  String get licenseCountry;
  @JsonKey(name: 'UserId')
  String? get userId;
  @JsonKey(name: 'CompanySettings')
  CompanySettings? get companySettings;
  @JsonKey(name: 'AccountsSettings')
  AccountsSettings? get accountsSettings;
  @JsonKey(name: 'ForexSettings')
  ForexSettings? get forexSettings;
  @JsonKey(name: 'IncomingSettings')
  IncomingSettings? get incomingSettings;
  @JsonKey(name: 'MobileSettings')
  MobileSettings? get mobileSettings;
  @JsonKey(name: 'RemittanceSettings')
  RemittanceSettings? get remittanceSettings;
  @JsonKey(name: 'PreciousMetalSettings')
  PreciousMetalSettings? get preciousMetalSettings;

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompanyDataFZCopyWith<CompanyDataFZ> get copyWith =>
      _$CompanyDataFZCopyWithImpl<CompanyDataFZ>(
          this as CompanyDataFZ, _$identity);

  /// Serializes this CompanyDataFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanyDataFZ &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.licenseCountry, licenseCountry) ||
                other.licenseCountry == licenseCountry) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.companySettings, companySettings) ||
                other.companySettings == companySettings) &&
            (identical(other.accountsSettings, accountsSettings) ||
                other.accountsSettings == accountsSettings) &&
            (identical(other.forexSettings, forexSettings) ||
                other.forexSettings == forexSettings) &&
            (identical(other.incomingSettings, incomingSettings) ||
                other.incomingSettings == incomingSettings) &&
            (identical(other.mobileSettings, mobileSettings) ||
                other.mobileSettings == mobileSettings) &&
            (identical(other.remittanceSettings, remittanceSettings) ||
                other.remittanceSettings == remittanceSettings) &&
            (identical(other.preciousMetalSettings, preciousMetalSettings) ||
                other.preciousMetalSettings == preciousMetalSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientCode,
      licenseCountry,
      userId,
      companySettings,
      accountsSettings,
      forexSettings,
      incomingSettings,
      mobileSettings,
      remittanceSettings,
      preciousMetalSettings);

  @override
  String toString() {
    return 'CompanyDataFZ(clientCode: $clientCode, licenseCountry: $licenseCountry, userId: $userId, companySettings: $companySettings, accountsSettings: $accountsSettings, forexSettings: $forexSettings, incomingSettings: $incomingSettings, mobileSettings: $mobileSettings, remittanceSettings: $remittanceSettings, preciousMetalSettings: $preciousMetalSettings)';
  }
}

/// @nodoc
abstract mixin class $CompanyDataFZCopyWith<$Res> {
  factory $CompanyDataFZCopyWith(
          CompanyDataFZ value, $Res Function(CompanyDataFZ) _then) =
      _$CompanyDataFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'ClientCode') String clientCode,
      @JsonKey(name: 'LicenseCountry') String licenseCountry,
      @JsonKey(name: 'UserId') String? userId,
      @JsonKey(name: 'CompanySettings') CompanySettings? companySettings,
      @JsonKey(name: 'AccountsSettings') AccountsSettings? accountsSettings,
      @JsonKey(name: 'ForexSettings') ForexSettings? forexSettings,
      @JsonKey(name: 'IncomingSettings') IncomingSettings? incomingSettings,
      @JsonKey(name: 'MobileSettings') MobileSettings? mobileSettings,
      @JsonKey(name: 'RemittanceSettings')
      RemittanceSettings? remittanceSettings,
      @JsonKey(name: 'PreciousMetalSettings')
      PreciousMetalSettings? preciousMetalSettings});

  $CompanySettingsCopyWith<$Res>? get companySettings;
  $AccountsSettingsCopyWith<$Res>? get accountsSettings;
  $ForexSettingsCopyWith<$Res>? get forexSettings;
  $IncomingSettingsCopyWith<$Res>? get incomingSettings;
  $MobileSettingsCopyWith<$Res>? get mobileSettings;
  $RemittanceSettingsCopyWith<$Res>? get remittanceSettings;
  $PreciousMetalSettingsCopyWith<$Res>? get preciousMetalSettings;
}

/// @nodoc
class _$CompanyDataFZCopyWithImpl<$Res>
    implements $CompanyDataFZCopyWith<$Res> {
  _$CompanyDataFZCopyWithImpl(this._self, this._then);

  final CompanyDataFZ _self;
  final $Res Function(CompanyDataFZ) _then;

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientCode = null,
    Object? licenseCountry = null,
    Object? userId = freezed,
    Object? companySettings = freezed,
    Object? accountsSettings = freezed,
    Object? forexSettings = freezed,
    Object? incomingSettings = freezed,
    Object? mobileSettings = freezed,
    Object? remittanceSettings = freezed,
    Object? preciousMetalSettings = freezed,
  }) {
    return _then(_self.copyWith(
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
      licenseCountry: null == licenseCountry
          ? _self.licenseCountry
          : licenseCountry // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      companySettings: freezed == companySettings
          ? _self.companySettings
          : companySettings // ignore: cast_nullable_to_non_nullable
              as CompanySettings?,
      accountsSettings: freezed == accountsSettings
          ? _self.accountsSettings
          : accountsSettings // ignore: cast_nullable_to_non_nullable
              as AccountsSettings?,
      forexSettings: freezed == forexSettings
          ? _self.forexSettings
          : forexSettings // ignore: cast_nullable_to_non_nullable
              as ForexSettings?,
      incomingSettings: freezed == incomingSettings
          ? _self.incomingSettings
          : incomingSettings // ignore: cast_nullable_to_non_nullable
              as IncomingSettings?,
      mobileSettings: freezed == mobileSettings
          ? _self.mobileSettings
          : mobileSettings // ignore: cast_nullable_to_non_nullable
              as MobileSettings?,
      remittanceSettings: freezed == remittanceSettings
          ? _self.remittanceSettings
          : remittanceSettings // ignore: cast_nullable_to_non_nullable
              as RemittanceSettings?,
      preciousMetalSettings: freezed == preciousMetalSettings
          ? _self.preciousMetalSettings
          : preciousMetalSettings // ignore: cast_nullable_to_non_nullable
              as PreciousMetalSettings?,
    ));
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanySettingsCopyWith<$Res>? get companySettings {
    if (_self.companySettings == null) {
      return null;
    }

    return $CompanySettingsCopyWith<$Res>(_self.companySettings!, (value) {
      return _then(_self.copyWith(companySettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountsSettingsCopyWith<$Res>? get accountsSettings {
    if (_self.accountsSettings == null) {
      return null;
    }

    return $AccountsSettingsCopyWith<$Res>(_self.accountsSettings!, (value) {
      return _then(_self.copyWith(accountsSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForexSettingsCopyWith<$Res>? get forexSettings {
    if (_self.forexSettings == null) {
      return null;
    }

    return $ForexSettingsCopyWith<$Res>(_self.forexSettings!, (value) {
      return _then(_self.copyWith(forexSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IncomingSettingsCopyWith<$Res>? get incomingSettings {
    if (_self.incomingSettings == null) {
      return null;
    }

    return $IncomingSettingsCopyWith<$Res>(_self.incomingSettings!, (value) {
      return _then(_self.copyWith(incomingSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MobileSettingsCopyWith<$Res>? get mobileSettings {
    if (_self.mobileSettings == null) {
      return null;
    }

    return $MobileSettingsCopyWith<$Res>(_self.mobileSettings!, (value) {
      return _then(_self.copyWith(mobileSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemittanceSettingsCopyWith<$Res>? get remittanceSettings {
    if (_self.remittanceSettings == null) {
      return null;
    }

    return $RemittanceSettingsCopyWith<$Res>(_self.remittanceSettings!,
        (value) {
      return _then(_self.copyWith(remittanceSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreciousMetalSettingsCopyWith<$Res>? get preciousMetalSettings {
    if (_self.preciousMetalSettings == null) {
      return null;
    }

    return $PreciousMetalSettingsCopyWith<$Res>(_self.preciousMetalSettings!,
        (value) {
      return _then(_self.copyWith(preciousMetalSettings: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CompanyDataFZ].
extension CompanyDataFZPatterns on CompanyDataFZ {
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
    TResult Function(_CompanyDataFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CompanyDataFZ() when $default != null:
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
    TResult Function(_CompanyDataFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanyDataFZ():
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
    TResult? Function(_CompanyDataFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanyDataFZ() when $default != null:
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'LicenseCountry') String licenseCountry,
            @JsonKey(name: 'UserId') String? userId,
            @JsonKey(name: 'CompanySettings') CompanySettings? companySettings,
            @JsonKey(name: 'AccountsSettings')
            AccountsSettings? accountsSettings,
            @JsonKey(name: 'ForexSettings') ForexSettings? forexSettings,
            @JsonKey(name: 'IncomingSettings')
            IncomingSettings? incomingSettings,
            @JsonKey(name: 'MobileSettings') MobileSettings? mobileSettings,
            @JsonKey(name: 'RemittanceSettings')
            RemittanceSettings? remittanceSettings,
            @JsonKey(name: 'PreciousMetalSettings')
            PreciousMetalSettings? preciousMetalSettings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CompanyDataFZ() when $default != null:
        return $default(
            _that.clientCode,
            _that.licenseCountry,
            _that.userId,
            _that.companySettings,
            _that.accountsSettings,
            _that.forexSettings,
            _that.incomingSettings,
            _that.mobileSettings,
            _that.remittanceSettings,
            _that.preciousMetalSettings);
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'LicenseCountry') String licenseCountry,
            @JsonKey(name: 'UserId') String? userId,
            @JsonKey(name: 'CompanySettings') CompanySettings? companySettings,
            @JsonKey(name: 'AccountsSettings')
            AccountsSettings? accountsSettings,
            @JsonKey(name: 'ForexSettings') ForexSettings? forexSettings,
            @JsonKey(name: 'IncomingSettings')
            IncomingSettings? incomingSettings,
            @JsonKey(name: 'MobileSettings') MobileSettings? mobileSettings,
            @JsonKey(name: 'RemittanceSettings')
            RemittanceSettings? remittanceSettings,
            @JsonKey(name: 'PreciousMetalSettings')
            PreciousMetalSettings? preciousMetalSettings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanyDataFZ():
        return $default(
            _that.clientCode,
            _that.licenseCountry,
            _that.userId,
            _that.companySettings,
            _that.accountsSettings,
            _that.forexSettings,
            _that.incomingSettings,
            _that.mobileSettings,
            _that.remittanceSettings,
            _that.preciousMetalSettings);
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'LicenseCountry') String licenseCountry,
            @JsonKey(name: 'UserId') String? userId,
            @JsonKey(name: 'CompanySettings') CompanySettings? companySettings,
            @JsonKey(name: 'AccountsSettings')
            AccountsSettings? accountsSettings,
            @JsonKey(name: 'ForexSettings') ForexSettings? forexSettings,
            @JsonKey(name: 'IncomingSettings')
            IncomingSettings? incomingSettings,
            @JsonKey(name: 'MobileSettings') MobileSettings? mobileSettings,
            @JsonKey(name: 'RemittanceSettings')
            RemittanceSettings? remittanceSettings,
            @JsonKey(name: 'PreciousMetalSettings')
            PreciousMetalSettings? preciousMetalSettings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanyDataFZ() when $default != null:
        return $default(
            _that.clientCode,
            _that.licenseCountry,
            _that.userId,
            _that.companySettings,
            _that.accountsSettings,
            _that.forexSettings,
            _that.incomingSettings,
            _that.mobileSettings,
            _that.remittanceSettings,
            _that.preciousMetalSettings);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CompanyDataFZ implements CompanyDataFZ {
  const _CompanyDataFZ(
      {@JsonKey(name: 'ClientCode') this.clientCode = '',
      @JsonKey(name: 'LicenseCountry') this.licenseCountry = '',
      @JsonKey(name: 'UserId') this.userId,
      @JsonKey(name: 'CompanySettings') this.companySettings,
      @JsonKey(name: 'AccountsSettings') this.accountsSettings,
      @JsonKey(name: 'ForexSettings') this.forexSettings,
      @JsonKey(name: 'IncomingSettings') this.incomingSettings,
      @JsonKey(name: 'MobileSettings') this.mobileSettings,
      @JsonKey(name: 'RemittanceSettings') this.remittanceSettings,
      @JsonKey(name: 'PreciousMetalSettings') this.preciousMetalSettings});
  factory _CompanyDataFZ.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFZFromJson(json);

  @override
  @JsonKey(name: 'ClientCode')
  final String clientCode;
  @override
  @JsonKey(name: 'LicenseCountry')
  final String licenseCountry;
  @override
  @JsonKey(name: 'UserId')
  final String? userId;
  @override
  @JsonKey(name: 'CompanySettings')
  final CompanySettings? companySettings;
  @override
  @JsonKey(name: 'AccountsSettings')
  final AccountsSettings? accountsSettings;
  @override
  @JsonKey(name: 'ForexSettings')
  final ForexSettings? forexSettings;
  @override
  @JsonKey(name: 'IncomingSettings')
  final IncomingSettings? incomingSettings;
  @override
  @JsonKey(name: 'MobileSettings')
  final MobileSettings? mobileSettings;
  @override
  @JsonKey(name: 'RemittanceSettings')
  final RemittanceSettings? remittanceSettings;
  @override
  @JsonKey(name: 'PreciousMetalSettings')
  final PreciousMetalSettings? preciousMetalSettings;

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompanyDataFZCopyWith<_CompanyDataFZ> get copyWith =>
      __$CompanyDataFZCopyWithImpl<_CompanyDataFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CompanyDataFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanyDataFZ &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.licenseCountry, licenseCountry) ||
                other.licenseCountry == licenseCountry) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.companySettings, companySettings) ||
                other.companySettings == companySettings) &&
            (identical(other.accountsSettings, accountsSettings) ||
                other.accountsSettings == accountsSettings) &&
            (identical(other.forexSettings, forexSettings) ||
                other.forexSettings == forexSettings) &&
            (identical(other.incomingSettings, incomingSettings) ||
                other.incomingSettings == incomingSettings) &&
            (identical(other.mobileSettings, mobileSettings) ||
                other.mobileSettings == mobileSettings) &&
            (identical(other.remittanceSettings, remittanceSettings) ||
                other.remittanceSettings == remittanceSettings) &&
            (identical(other.preciousMetalSettings, preciousMetalSettings) ||
                other.preciousMetalSettings == preciousMetalSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientCode,
      licenseCountry,
      userId,
      companySettings,
      accountsSettings,
      forexSettings,
      incomingSettings,
      mobileSettings,
      remittanceSettings,
      preciousMetalSettings);

  @override
  String toString() {
    return 'CompanyDataFZ(clientCode: $clientCode, licenseCountry: $licenseCountry, userId: $userId, companySettings: $companySettings, accountsSettings: $accountsSettings, forexSettings: $forexSettings, incomingSettings: $incomingSettings, mobileSettings: $mobileSettings, remittanceSettings: $remittanceSettings, preciousMetalSettings: $preciousMetalSettings)';
  }
}

/// @nodoc
abstract mixin class _$CompanyDataFZCopyWith<$Res>
    implements $CompanyDataFZCopyWith<$Res> {
  factory _$CompanyDataFZCopyWith(
          _CompanyDataFZ value, $Res Function(_CompanyDataFZ) _then) =
      __$CompanyDataFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ClientCode') String clientCode,
      @JsonKey(name: 'LicenseCountry') String licenseCountry,
      @JsonKey(name: 'UserId') String? userId,
      @JsonKey(name: 'CompanySettings') CompanySettings? companySettings,
      @JsonKey(name: 'AccountsSettings') AccountsSettings? accountsSettings,
      @JsonKey(name: 'ForexSettings') ForexSettings? forexSettings,
      @JsonKey(name: 'IncomingSettings') IncomingSettings? incomingSettings,
      @JsonKey(name: 'MobileSettings') MobileSettings? mobileSettings,
      @JsonKey(name: 'RemittanceSettings')
      RemittanceSettings? remittanceSettings,
      @JsonKey(name: 'PreciousMetalSettings')
      PreciousMetalSettings? preciousMetalSettings});

  @override
  $CompanySettingsCopyWith<$Res>? get companySettings;
  @override
  $AccountsSettingsCopyWith<$Res>? get accountsSettings;
  @override
  $ForexSettingsCopyWith<$Res>? get forexSettings;
  @override
  $IncomingSettingsCopyWith<$Res>? get incomingSettings;
  @override
  $MobileSettingsCopyWith<$Res>? get mobileSettings;
  @override
  $RemittanceSettingsCopyWith<$Res>? get remittanceSettings;
  @override
  $PreciousMetalSettingsCopyWith<$Res>? get preciousMetalSettings;
}

/// @nodoc
class __$CompanyDataFZCopyWithImpl<$Res>
    implements _$CompanyDataFZCopyWith<$Res> {
  __$CompanyDataFZCopyWithImpl(this._self, this._then);

  final _CompanyDataFZ _self;
  final $Res Function(_CompanyDataFZ) _then;

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientCode = null,
    Object? licenseCountry = null,
    Object? userId = freezed,
    Object? companySettings = freezed,
    Object? accountsSettings = freezed,
    Object? forexSettings = freezed,
    Object? incomingSettings = freezed,
    Object? mobileSettings = freezed,
    Object? remittanceSettings = freezed,
    Object? preciousMetalSettings = freezed,
  }) {
    return _then(_CompanyDataFZ(
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
      licenseCountry: null == licenseCountry
          ? _self.licenseCountry
          : licenseCountry // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      companySettings: freezed == companySettings
          ? _self.companySettings
          : companySettings // ignore: cast_nullable_to_non_nullable
              as CompanySettings?,
      accountsSettings: freezed == accountsSettings
          ? _self.accountsSettings
          : accountsSettings // ignore: cast_nullable_to_non_nullable
              as AccountsSettings?,
      forexSettings: freezed == forexSettings
          ? _self.forexSettings
          : forexSettings // ignore: cast_nullable_to_non_nullable
              as ForexSettings?,
      incomingSettings: freezed == incomingSettings
          ? _self.incomingSettings
          : incomingSettings // ignore: cast_nullable_to_non_nullable
              as IncomingSettings?,
      mobileSettings: freezed == mobileSettings
          ? _self.mobileSettings
          : mobileSettings // ignore: cast_nullable_to_non_nullable
              as MobileSettings?,
      remittanceSettings: freezed == remittanceSettings
          ? _self.remittanceSettings
          : remittanceSettings // ignore: cast_nullable_to_non_nullable
              as RemittanceSettings?,
      preciousMetalSettings: freezed == preciousMetalSettings
          ? _self.preciousMetalSettings
          : preciousMetalSettings // ignore: cast_nullable_to_non_nullable
              as PreciousMetalSettings?,
    ));
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanySettingsCopyWith<$Res>? get companySettings {
    if (_self.companySettings == null) {
      return null;
    }

    return $CompanySettingsCopyWith<$Res>(_self.companySettings!, (value) {
      return _then(_self.copyWith(companySettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountsSettingsCopyWith<$Res>? get accountsSettings {
    if (_self.accountsSettings == null) {
      return null;
    }

    return $AccountsSettingsCopyWith<$Res>(_self.accountsSettings!, (value) {
      return _then(_self.copyWith(accountsSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ForexSettingsCopyWith<$Res>? get forexSettings {
    if (_self.forexSettings == null) {
      return null;
    }

    return $ForexSettingsCopyWith<$Res>(_self.forexSettings!, (value) {
      return _then(_self.copyWith(forexSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IncomingSettingsCopyWith<$Res>? get incomingSettings {
    if (_self.incomingSettings == null) {
      return null;
    }

    return $IncomingSettingsCopyWith<$Res>(_self.incomingSettings!, (value) {
      return _then(_self.copyWith(incomingSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MobileSettingsCopyWith<$Res>? get mobileSettings {
    if (_self.mobileSettings == null) {
      return null;
    }

    return $MobileSettingsCopyWith<$Res>(_self.mobileSettings!, (value) {
      return _then(_self.copyWith(mobileSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RemittanceSettingsCopyWith<$Res>? get remittanceSettings {
    if (_self.remittanceSettings == null) {
      return null;
    }

    return $RemittanceSettingsCopyWith<$Res>(_self.remittanceSettings!,
        (value) {
      return _then(_self.copyWith(remittanceSettings: value));
    });
  }

  /// Create a copy of CompanyDataFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PreciousMetalSettingsCopyWith<$Res>? get preciousMetalSettings {
    if (_self.preciousMetalSettings == null) {
      return null;
    }

    return $PreciousMetalSettingsCopyWith<$Res>(_self.preciousMetalSettings!,
        (value) {
      return _then(_self.copyWith(preciousMetalSettings: value));
    });
  }
}

/// @nodoc
mixin _$PreciousMetalSettings {
  @JsonKey(name: 'ClientCode')
  String get clientCode;
  @JsonKey(name: 'PrefixForPreciousMetalNumber')
  String get prefixForPreciousMetalNumber;
  @JsonKey(name: 'RatePerOunce')
  String get ratePerOunce;
  @JsonKey(name: 'PerOunceInGram')
  String get perOunceInGram;
  @JsonKey(name: 'DualCounter')
  dynamic get dualCounter;
  @JsonKey(name: 'UpdatedOn')
  String get updatedOn;

  /// Create a copy of PreciousMetalSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PreciousMetalSettingsCopyWith<PreciousMetalSettings> get copyWith =>
      _$PreciousMetalSettingsCopyWithImpl<PreciousMetalSettings>(
          this as PreciousMetalSettings, _$identity);

  /// Serializes this PreciousMetalSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PreciousMetalSettings &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.prefixForPreciousMetalNumber,
                    prefixForPreciousMetalNumber) ||
                other.prefixForPreciousMetalNumber ==
                    prefixForPreciousMetalNumber) &&
            (identical(other.ratePerOunce, ratePerOunce) ||
                other.ratePerOunce == ratePerOunce) &&
            (identical(other.perOunceInGram, perOunceInGram) ||
                other.perOunceInGram == perOunceInGram) &&
            const DeepCollectionEquality()
                .equals(other.dualCounter, dualCounter) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientCode,
      prefixForPreciousMetalNumber,
      ratePerOunce,
      perOunceInGram,
      const DeepCollectionEquality().hash(dualCounter),
      updatedOn);

  @override
  String toString() {
    return 'PreciousMetalSettings(clientCode: $clientCode, prefixForPreciousMetalNumber: $prefixForPreciousMetalNumber, ratePerOunce: $ratePerOunce, perOunceInGram: $perOunceInGram, dualCounter: $dualCounter, updatedOn: $updatedOn)';
  }
}

/// @nodoc
abstract mixin class $PreciousMetalSettingsCopyWith<$Res> {
  factory $PreciousMetalSettingsCopyWith(PreciousMetalSettings value,
          $Res Function(PreciousMetalSettings) _then) =
      _$PreciousMetalSettingsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'ClientCode') String clientCode,
      @JsonKey(name: 'PrefixForPreciousMetalNumber')
      String prefixForPreciousMetalNumber,
      @JsonKey(name: 'RatePerOunce') String ratePerOunce,
      @JsonKey(name: 'PerOunceInGram') String perOunceInGram,
      @JsonKey(name: 'DualCounter') dynamic dualCounter,
      @JsonKey(name: 'UpdatedOn') String updatedOn});
}

/// @nodoc
class _$PreciousMetalSettingsCopyWithImpl<$Res>
    implements $PreciousMetalSettingsCopyWith<$Res> {
  _$PreciousMetalSettingsCopyWithImpl(this._self, this._then);

  final PreciousMetalSettings _self;
  final $Res Function(PreciousMetalSettings) _then;

  /// Create a copy of PreciousMetalSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientCode = null,
    Object? prefixForPreciousMetalNumber = null,
    Object? ratePerOunce = null,
    Object? perOunceInGram = null,
    Object? dualCounter = freezed,
    Object? updatedOn = null,
  }) {
    return _then(_self.copyWith(
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
      prefixForPreciousMetalNumber: null == prefixForPreciousMetalNumber
          ? _self.prefixForPreciousMetalNumber
          : prefixForPreciousMetalNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ratePerOunce: null == ratePerOunce
          ? _self.ratePerOunce
          : ratePerOunce // ignore: cast_nullable_to_non_nullable
              as String,
      perOunceInGram: null == perOunceInGram
          ? _self.perOunceInGram
          : perOunceInGram // ignore: cast_nullable_to_non_nullable
              as String,
      dualCounter: freezed == dualCounter
          ? _self.dualCounter
          : dualCounter // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedOn: null == updatedOn
          ? _self.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PreciousMetalSettings].
extension PreciousMetalSettingsPatterns on PreciousMetalSettings {
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
    TResult Function(_PreciousMetalSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PreciousMetalSettings() when $default != null:
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
    TResult Function(_PreciousMetalSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreciousMetalSettings():
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
    TResult? Function(_PreciousMetalSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreciousMetalSettings() when $default != null:
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'PrefixForPreciousMetalNumber')
            String prefixForPreciousMetalNumber,
            @JsonKey(name: 'RatePerOunce') String ratePerOunce,
            @JsonKey(name: 'PerOunceInGram') String perOunceInGram,
            @JsonKey(name: 'DualCounter') dynamic dualCounter,
            @JsonKey(name: 'UpdatedOn') String updatedOn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PreciousMetalSettings() when $default != null:
        return $default(
            _that.clientCode,
            _that.prefixForPreciousMetalNumber,
            _that.ratePerOunce,
            _that.perOunceInGram,
            _that.dualCounter,
            _that.updatedOn);
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'PrefixForPreciousMetalNumber')
            String prefixForPreciousMetalNumber,
            @JsonKey(name: 'RatePerOunce') String ratePerOunce,
            @JsonKey(name: 'PerOunceInGram') String perOunceInGram,
            @JsonKey(name: 'DualCounter') dynamic dualCounter,
            @JsonKey(name: 'UpdatedOn') String updatedOn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreciousMetalSettings():
        return $default(
            _that.clientCode,
            _that.prefixForPreciousMetalNumber,
            _that.ratePerOunce,
            _that.perOunceInGram,
            _that.dualCounter,
            _that.updatedOn);
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'PrefixForPreciousMetalNumber')
            String prefixForPreciousMetalNumber,
            @JsonKey(name: 'RatePerOunce') String ratePerOunce,
            @JsonKey(name: 'PerOunceInGram') String perOunceInGram,
            @JsonKey(name: 'DualCounter') dynamic dualCounter,
            @JsonKey(name: 'UpdatedOn') String updatedOn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PreciousMetalSettings() when $default != null:
        return $default(
            _that.clientCode,
            _that.prefixForPreciousMetalNumber,
            _that.ratePerOunce,
            _that.perOunceInGram,
            _that.dualCounter,
            _that.updatedOn);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PreciousMetalSettings implements PreciousMetalSettings {
  const _PreciousMetalSettings(
      {@JsonKey(name: 'ClientCode') this.clientCode = '',
      @JsonKey(name: 'PrefixForPreciousMetalNumber')
      this.prefixForPreciousMetalNumber = '',
      @JsonKey(name: 'RatePerOunce') this.ratePerOunce = '',
      @JsonKey(name: 'PerOunceInGram') this.perOunceInGram = '',
      @JsonKey(name: 'DualCounter') this.dualCounter,
      @JsonKey(name: 'UpdatedOn') this.updatedOn = ''});
  factory _PreciousMetalSettings.fromJson(Map<String, dynamic> json) =>
      _$PreciousMetalSettingsFromJson(json);

  @override
  @JsonKey(name: 'ClientCode')
  final String clientCode;
  @override
  @JsonKey(name: 'PrefixForPreciousMetalNumber')
  final String prefixForPreciousMetalNumber;
  @override
  @JsonKey(name: 'RatePerOunce')
  final String ratePerOunce;
  @override
  @JsonKey(name: 'PerOunceInGram')
  final String perOunceInGram;
  @override
  @JsonKey(name: 'DualCounter')
  final dynamic dualCounter;
  @override
  @JsonKey(name: 'UpdatedOn')
  final String updatedOn;

  /// Create a copy of PreciousMetalSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PreciousMetalSettingsCopyWith<_PreciousMetalSettings> get copyWith =>
      __$PreciousMetalSettingsCopyWithImpl<_PreciousMetalSettings>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PreciousMetalSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PreciousMetalSettings &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.prefixForPreciousMetalNumber,
                    prefixForPreciousMetalNumber) ||
                other.prefixForPreciousMetalNumber ==
                    prefixForPreciousMetalNumber) &&
            (identical(other.ratePerOunce, ratePerOunce) ||
                other.ratePerOunce == ratePerOunce) &&
            (identical(other.perOunceInGram, perOunceInGram) ||
                other.perOunceInGram == perOunceInGram) &&
            const DeepCollectionEquality()
                .equals(other.dualCounter, dualCounter) &&
            (identical(other.updatedOn, updatedOn) ||
                other.updatedOn == updatedOn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientCode,
      prefixForPreciousMetalNumber,
      ratePerOunce,
      perOunceInGram,
      const DeepCollectionEquality().hash(dualCounter),
      updatedOn);

  @override
  String toString() {
    return 'PreciousMetalSettings(clientCode: $clientCode, prefixForPreciousMetalNumber: $prefixForPreciousMetalNumber, ratePerOunce: $ratePerOunce, perOunceInGram: $perOunceInGram, dualCounter: $dualCounter, updatedOn: $updatedOn)';
  }
}

/// @nodoc
abstract mixin class _$PreciousMetalSettingsCopyWith<$Res>
    implements $PreciousMetalSettingsCopyWith<$Res> {
  factory _$PreciousMetalSettingsCopyWith(_PreciousMetalSettings value,
          $Res Function(_PreciousMetalSettings) _then) =
      __$PreciousMetalSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ClientCode') String clientCode,
      @JsonKey(name: 'PrefixForPreciousMetalNumber')
      String prefixForPreciousMetalNumber,
      @JsonKey(name: 'RatePerOunce') String ratePerOunce,
      @JsonKey(name: 'PerOunceInGram') String perOunceInGram,
      @JsonKey(name: 'DualCounter') dynamic dualCounter,
      @JsonKey(name: 'UpdatedOn') String updatedOn});
}

/// @nodoc
class __$PreciousMetalSettingsCopyWithImpl<$Res>
    implements _$PreciousMetalSettingsCopyWith<$Res> {
  __$PreciousMetalSettingsCopyWithImpl(this._self, this._then);

  final _PreciousMetalSettings _self;
  final $Res Function(_PreciousMetalSettings) _then;

  /// Create a copy of PreciousMetalSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientCode = null,
    Object? prefixForPreciousMetalNumber = null,
    Object? ratePerOunce = null,
    Object? perOunceInGram = null,
    Object? dualCounter = freezed,
    Object? updatedOn = null,
  }) {
    return _then(_PreciousMetalSettings(
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
      prefixForPreciousMetalNumber: null == prefixForPreciousMetalNumber
          ? _self.prefixForPreciousMetalNumber
          : prefixForPreciousMetalNumber // ignore: cast_nullable_to_non_nullable
              as String,
      ratePerOunce: null == ratePerOunce
          ? _self.ratePerOunce
          : ratePerOunce // ignore: cast_nullable_to_non_nullable
              as String,
      perOunceInGram: null == perOunceInGram
          ? _self.perOunceInGram
          : perOunceInGram // ignore: cast_nullable_to_non_nullable
              as String,
      dualCounter: freezed == dualCounter
          ? _self.dualCounter
          : dualCounter // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedOn: null == updatedOn
          ? _self.updatedOn
          : updatedOn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$RemittanceSettings {
  @JsonKey(name: 'ClientCode')
  String get clientCode;
  @JsonKey(name: 'RequiredDualCounter')
  String get requiredDualCounter;
  @JsonKey(name: 'PrefixForRemittanceRefNo')
  String get prefixForRemittanceRefNo;
  @JsonKey(name: 'CorrespondentRouting')
  String get correspondentRouting;
  @JsonKey(name: 'AutoRoutingTypeCode')
  bool get autoRoutingTypeCode;
  @JsonKey(name: 'ShowRateViewInRemittance')
  String get showRateViewInRemittance;
  @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance')
  String get allowNewCustomerAdditionFromRemittance;
  @JsonKey(name: 'AllowCustomerProfileEditFromRemittance')
  String get allowCustomerProfileEditFromRemittance;
  @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance')
  String get allowBeneficiaryProfileEditFromRemittance;
  @JsonKey(name: 'AllowSpecialRateRequestFromRemittance')
  String get allowSpecialRateRequestFromRemittance;
  @JsonKey(name: 'AllowBufferInRateToTeller')
  String get allowBufferInRateToTeller;
  @JsonKey(name: 'AllowOnAccountFacility')
  String get allowOnAccountFacility;
  @JsonKey(name: 'AllowSpecialDiscountRate')
  String get allowSpecialDiscountRate;
  @JsonKey(name: 'AllowCreditFacility')
  String get allowCreditFacility;

  /// Create a copy of RemittanceSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemittanceSettingsCopyWith<RemittanceSettings> get copyWith =>
      _$RemittanceSettingsCopyWithImpl<RemittanceSettings>(
          this as RemittanceSettings, _$identity);

  /// Serializes this RemittanceSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemittanceSettings &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.requiredDualCounter, requiredDualCounter) ||
                other.requiredDualCounter == requiredDualCounter) &&
            (identical(other.prefixForRemittanceRefNo, prefixForRemittanceRefNo) ||
                other.prefixForRemittanceRefNo == prefixForRemittanceRefNo) &&
            (identical(other.correspondentRouting, correspondentRouting) ||
                other.correspondentRouting == correspondentRouting) &&
            (identical(other.autoRoutingTypeCode, autoRoutingTypeCode) ||
                other.autoRoutingTypeCode == autoRoutingTypeCode) &&
            (identical(other.showRateViewInRemittance, showRateViewInRemittance) ||
                other.showRateViewInRemittance == showRateViewInRemittance) &&
            (identical(other.allowNewCustomerAdditionFromRemittance, allowNewCustomerAdditionFromRemittance) ||
                other.allowNewCustomerAdditionFromRemittance ==
                    allowNewCustomerAdditionFromRemittance) &&
            (identical(other.allowCustomerProfileEditFromRemittance,
                    allowCustomerProfileEditFromRemittance) ||
                other.allowCustomerProfileEditFromRemittance ==
                    allowCustomerProfileEditFromRemittance) &&
            (identical(other.allowBeneficiaryProfileEditFromRemittance,
                    allowBeneficiaryProfileEditFromRemittance) ||
                other.allowBeneficiaryProfileEditFromRemittance ==
                    allowBeneficiaryProfileEditFromRemittance) &&
            (identical(other.allowSpecialRateRequestFromRemittance, allowSpecialRateRequestFromRemittance) ||
                other.allowSpecialRateRequestFromRemittance ==
                    allowSpecialRateRequestFromRemittance) &&
            (identical(other.allowBufferInRateToTeller, allowBufferInRateToTeller) ||
                other.allowBufferInRateToTeller == allowBufferInRateToTeller) &&
            (identical(other.allowOnAccountFacility, allowOnAccountFacility) ||
                other.allowOnAccountFacility == allowOnAccountFacility) &&
            (identical(
                    other.allowSpecialDiscountRate, allowSpecialDiscountRate) ||
                other.allowSpecialDiscountRate == allowSpecialDiscountRate) &&
            (identical(other.allowCreditFacility, allowCreditFacility) ||
                other.allowCreditFacility == allowCreditFacility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientCode,
      requiredDualCounter,
      prefixForRemittanceRefNo,
      correspondentRouting,
      autoRoutingTypeCode,
      showRateViewInRemittance,
      allowNewCustomerAdditionFromRemittance,
      allowCustomerProfileEditFromRemittance,
      allowBeneficiaryProfileEditFromRemittance,
      allowSpecialRateRequestFromRemittance,
      allowBufferInRateToTeller,
      allowOnAccountFacility,
      allowSpecialDiscountRate,
      allowCreditFacility);

  @override
  String toString() {
    return 'RemittanceSettings(clientCode: $clientCode, requiredDualCounter: $requiredDualCounter, prefixForRemittanceRefNo: $prefixForRemittanceRefNo, correspondentRouting: $correspondentRouting, autoRoutingTypeCode: $autoRoutingTypeCode, showRateViewInRemittance: $showRateViewInRemittance, allowNewCustomerAdditionFromRemittance: $allowNewCustomerAdditionFromRemittance, allowCustomerProfileEditFromRemittance: $allowCustomerProfileEditFromRemittance, allowBeneficiaryProfileEditFromRemittance: $allowBeneficiaryProfileEditFromRemittance, allowSpecialRateRequestFromRemittance: $allowSpecialRateRequestFromRemittance, allowBufferInRateToTeller: $allowBufferInRateToTeller, allowOnAccountFacility: $allowOnAccountFacility, allowSpecialDiscountRate: $allowSpecialDiscountRate, allowCreditFacility: $allowCreditFacility)';
  }
}

/// @nodoc
abstract mixin class $RemittanceSettingsCopyWith<$Res> {
  factory $RemittanceSettingsCopyWith(
          RemittanceSettings value, $Res Function(RemittanceSettings) _then) =
      _$RemittanceSettingsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'ClientCode') String clientCode,
      @JsonKey(name: 'RequiredDualCounter') String requiredDualCounter,
      @JsonKey(name: 'PrefixForRemittanceRefNo')
      String prefixForRemittanceRefNo,
      @JsonKey(name: 'CorrespondentRouting') String correspondentRouting,
      @JsonKey(name: 'AutoRoutingTypeCode') bool autoRoutingTypeCode,
      @JsonKey(name: 'ShowRateViewInRemittance')
      String showRateViewInRemittance,
      @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance')
      String allowNewCustomerAdditionFromRemittance,
      @JsonKey(name: 'AllowCustomerProfileEditFromRemittance')
      String allowCustomerProfileEditFromRemittance,
      @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance')
      String allowBeneficiaryProfileEditFromRemittance,
      @JsonKey(name: 'AllowSpecialRateRequestFromRemittance')
      String allowSpecialRateRequestFromRemittance,
      @JsonKey(name: 'AllowBufferInRateToTeller')
      String allowBufferInRateToTeller,
      @JsonKey(name: 'AllowOnAccountFacility') String allowOnAccountFacility,
      @JsonKey(name: 'AllowSpecialDiscountRate')
      String allowSpecialDiscountRate,
      @JsonKey(name: 'AllowCreditFacility') String allowCreditFacility});
}

/// @nodoc
class _$RemittanceSettingsCopyWithImpl<$Res>
    implements $RemittanceSettingsCopyWith<$Res> {
  _$RemittanceSettingsCopyWithImpl(this._self, this._then);

  final RemittanceSettings _self;
  final $Res Function(RemittanceSettings) _then;

  /// Create a copy of RemittanceSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientCode = null,
    Object? requiredDualCounter = null,
    Object? prefixForRemittanceRefNo = null,
    Object? correspondentRouting = null,
    Object? autoRoutingTypeCode = null,
    Object? showRateViewInRemittance = null,
    Object? allowNewCustomerAdditionFromRemittance = null,
    Object? allowCustomerProfileEditFromRemittance = null,
    Object? allowBeneficiaryProfileEditFromRemittance = null,
    Object? allowSpecialRateRequestFromRemittance = null,
    Object? allowBufferInRateToTeller = null,
    Object? allowOnAccountFacility = null,
    Object? allowSpecialDiscountRate = null,
    Object? allowCreditFacility = null,
  }) {
    return _then(_self.copyWith(
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
      requiredDualCounter: null == requiredDualCounter
          ? _self.requiredDualCounter
          : requiredDualCounter // ignore: cast_nullable_to_non_nullable
              as String,
      prefixForRemittanceRefNo: null == prefixForRemittanceRefNo
          ? _self.prefixForRemittanceRefNo
          : prefixForRemittanceRefNo // ignore: cast_nullable_to_non_nullable
              as String,
      correspondentRouting: null == correspondentRouting
          ? _self.correspondentRouting
          : correspondentRouting // ignore: cast_nullable_to_non_nullable
              as String,
      autoRoutingTypeCode: null == autoRoutingTypeCode
          ? _self.autoRoutingTypeCode
          : autoRoutingTypeCode // ignore: cast_nullable_to_non_nullable
              as bool,
      showRateViewInRemittance: null == showRateViewInRemittance
          ? _self.showRateViewInRemittance
          : showRateViewInRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowNewCustomerAdditionFromRemittance: null ==
              allowNewCustomerAdditionFromRemittance
          ? _self.allowNewCustomerAdditionFromRemittance
          : allowNewCustomerAdditionFromRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowCustomerProfileEditFromRemittance: null ==
              allowCustomerProfileEditFromRemittance
          ? _self.allowCustomerProfileEditFromRemittance
          : allowCustomerProfileEditFromRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowBeneficiaryProfileEditFromRemittance: null ==
              allowBeneficiaryProfileEditFromRemittance
          ? _self.allowBeneficiaryProfileEditFromRemittance
          : allowBeneficiaryProfileEditFromRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowSpecialRateRequestFromRemittance: null ==
              allowSpecialRateRequestFromRemittance
          ? _self.allowSpecialRateRequestFromRemittance
          : allowSpecialRateRequestFromRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowBufferInRateToTeller: null == allowBufferInRateToTeller
          ? _self.allowBufferInRateToTeller
          : allowBufferInRateToTeller // ignore: cast_nullable_to_non_nullable
              as String,
      allowOnAccountFacility: null == allowOnAccountFacility
          ? _self.allowOnAccountFacility
          : allowOnAccountFacility // ignore: cast_nullable_to_non_nullable
              as String,
      allowSpecialDiscountRate: null == allowSpecialDiscountRate
          ? _self.allowSpecialDiscountRate
          : allowSpecialDiscountRate // ignore: cast_nullable_to_non_nullable
              as String,
      allowCreditFacility: null == allowCreditFacility
          ? _self.allowCreditFacility
          : allowCreditFacility // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [RemittanceSettings].
extension RemittanceSettingsPatterns on RemittanceSettings {
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
    TResult Function(_RemittanceSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemittanceSettings() when $default != null:
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
    TResult Function(_RemittanceSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemittanceSettings():
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
    TResult? Function(_RemittanceSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemittanceSettings() when $default != null:
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'RequiredDualCounter') String requiredDualCounter,
            @JsonKey(name: 'PrefixForRemittanceRefNo')
            String prefixForRemittanceRefNo,
            @JsonKey(name: 'CorrespondentRouting') String correspondentRouting,
            @JsonKey(name: 'AutoRoutingTypeCode') bool autoRoutingTypeCode,
            @JsonKey(name: 'ShowRateViewInRemittance')
            String showRateViewInRemittance,
            @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance')
            String allowNewCustomerAdditionFromRemittance,
            @JsonKey(name: 'AllowCustomerProfileEditFromRemittance')
            String allowCustomerProfileEditFromRemittance,
            @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance')
            String allowBeneficiaryProfileEditFromRemittance,
            @JsonKey(name: 'AllowSpecialRateRequestFromRemittance')
            String allowSpecialRateRequestFromRemittance,
            @JsonKey(name: 'AllowBufferInRateToTeller')
            String allowBufferInRateToTeller,
            @JsonKey(name: 'AllowOnAccountFacility')
            String allowOnAccountFacility,
            @JsonKey(name: 'AllowSpecialDiscountRate')
            String allowSpecialDiscountRate,
            @JsonKey(name: 'AllowCreditFacility') String allowCreditFacility)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _RemittanceSettings() when $default != null:
        return $default(
            _that.clientCode,
            _that.requiredDualCounter,
            _that.prefixForRemittanceRefNo,
            _that.correspondentRouting,
            _that.autoRoutingTypeCode,
            _that.showRateViewInRemittance,
            _that.allowNewCustomerAdditionFromRemittance,
            _that.allowCustomerProfileEditFromRemittance,
            _that.allowBeneficiaryProfileEditFromRemittance,
            _that.allowSpecialRateRequestFromRemittance,
            _that.allowBufferInRateToTeller,
            _that.allowOnAccountFacility,
            _that.allowSpecialDiscountRate,
            _that.allowCreditFacility);
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'RequiredDualCounter') String requiredDualCounter,
            @JsonKey(name: 'PrefixForRemittanceRefNo')
            String prefixForRemittanceRefNo,
            @JsonKey(name: 'CorrespondentRouting') String correspondentRouting,
            @JsonKey(name: 'AutoRoutingTypeCode') bool autoRoutingTypeCode,
            @JsonKey(name: 'ShowRateViewInRemittance')
            String showRateViewInRemittance,
            @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance')
            String allowNewCustomerAdditionFromRemittance,
            @JsonKey(name: 'AllowCustomerProfileEditFromRemittance')
            String allowCustomerProfileEditFromRemittance,
            @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance')
            String allowBeneficiaryProfileEditFromRemittance,
            @JsonKey(name: 'AllowSpecialRateRequestFromRemittance')
            String allowSpecialRateRequestFromRemittance,
            @JsonKey(name: 'AllowBufferInRateToTeller')
            String allowBufferInRateToTeller,
            @JsonKey(name: 'AllowOnAccountFacility')
            String allowOnAccountFacility,
            @JsonKey(name: 'AllowSpecialDiscountRate')
            String allowSpecialDiscountRate,
            @JsonKey(name: 'AllowCreditFacility') String allowCreditFacility)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemittanceSettings():
        return $default(
            _that.clientCode,
            _that.requiredDualCounter,
            _that.prefixForRemittanceRefNo,
            _that.correspondentRouting,
            _that.autoRoutingTypeCode,
            _that.showRateViewInRemittance,
            _that.allowNewCustomerAdditionFromRemittance,
            _that.allowCustomerProfileEditFromRemittance,
            _that.allowBeneficiaryProfileEditFromRemittance,
            _that.allowSpecialRateRequestFromRemittance,
            _that.allowBufferInRateToTeller,
            _that.allowOnAccountFacility,
            _that.allowSpecialDiscountRate,
            _that.allowCreditFacility);
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
            @JsonKey(name: 'ClientCode') String clientCode,
            @JsonKey(name: 'RequiredDualCounter') String requiredDualCounter,
            @JsonKey(name: 'PrefixForRemittanceRefNo')
            String prefixForRemittanceRefNo,
            @JsonKey(name: 'CorrespondentRouting') String correspondentRouting,
            @JsonKey(name: 'AutoRoutingTypeCode') bool autoRoutingTypeCode,
            @JsonKey(name: 'ShowRateViewInRemittance')
            String showRateViewInRemittance,
            @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance')
            String allowNewCustomerAdditionFromRemittance,
            @JsonKey(name: 'AllowCustomerProfileEditFromRemittance')
            String allowCustomerProfileEditFromRemittance,
            @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance')
            String allowBeneficiaryProfileEditFromRemittance,
            @JsonKey(name: 'AllowSpecialRateRequestFromRemittance')
            String allowSpecialRateRequestFromRemittance,
            @JsonKey(name: 'AllowBufferInRateToTeller')
            String allowBufferInRateToTeller,
            @JsonKey(name: 'AllowOnAccountFacility')
            String allowOnAccountFacility,
            @JsonKey(name: 'AllowSpecialDiscountRate')
            String allowSpecialDiscountRate,
            @JsonKey(name: 'AllowCreditFacility') String allowCreditFacility)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _RemittanceSettings() when $default != null:
        return $default(
            _that.clientCode,
            _that.requiredDualCounter,
            _that.prefixForRemittanceRefNo,
            _that.correspondentRouting,
            _that.autoRoutingTypeCode,
            _that.showRateViewInRemittance,
            _that.allowNewCustomerAdditionFromRemittance,
            _that.allowCustomerProfileEditFromRemittance,
            _that.allowBeneficiaryProfileEditFromRemittance,
            _that.allowSpecialRateRequestFromRemittance,
            _that.allowBufferInRateToTeller,
            _that.allowOnAccountFacility,
            _that.allowSpecialDiscountRate,
            _that.allowCreditFacility);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _RemittanceSettings implements RemittanceSettings {
  const _RemittanceSettings(
      {@JsonKey(name: 'ClientCode') this.clientCode = '',
      @JsonKey(name: 'RequiredDualCounter') this.requiredDualCounter = '',
      @JsonKey(name: 'PrefixForRemittanceRefNo')
      this.prefixForRemittanceRefNo = '',
      @JsonKey(name: 'CorrespondentRouting') this.correspondentRouting = '',
      @JsonKey(name: 'AutoRoutingTypeCode') this.autoRoutingTypeCode = false,
      @JsonKey(name: 'ShowRateViewInRemittance')
      this.showRateViewInRemittance = '',
      @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance')
      this.allowNewCustomerAdditionFromRemittance = '',
      @JsonKey(name: 'AllowCustomerProfileEditFromRemittance')
      this.allowCustomerProfileEditFromRemittance = '',
      @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance')
      this.allowBeneficiaryProfileEditFromRemittance = '',
      @JsonKey(name: 'AllowSpecialRateRequestFromRemittance')
      this.allowSpecialRateRequestFromRemittance = '',
      @JsonKey(name: 'AllowBufferInRateToTeller')
      this.allowBufferInRateToTeller = '',
      @JsonKey(name: 'AllowOnAccountFacility') this.allowOnAccountFacility = '',
      @JsonKey(name: 'AllowSpecialDiscountRate')
      this.allowSpecialDiscountRate = '',
      @JsonKey(name: 'AllowCreditFacility') this.allowCreditFacility = ''});
  factory _RemittanceSettings.fromJson(Map<String, dynamic> json) =>
      _$RemittanceSettingsFromJson(json);

  @override
  @JsonKey(name: 'ClientCode')
  final String clientCode;
  @override
  @JsonKey(name: 'RequiredDualCounter')
  final String requiredDualCounter;
  @override
  @JsonKey(name: 'PrefixForRemittanceRefNo')
  final String prefixForRemittanceRefNo;
  @override
  @JsonKey(name: 'CorrespondentRouting')
  final String correspondentRouting;
  @override
  @JsonKey(name: 'AutoRoutingTypeCode')
  final bool autoRoutingTypeCode;
  @override
  @JsonKey(name: 'ShowRateViewInRemittance')
  final String showRateViewInRemittance;
  @override
  @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance')
  final String allowNewCustomerAdditionFromRemittance;
  @override
  @JsonKey(name: 'AllowCustomerProfileEditFromRemittance')
  final String allowCustomerProfileEditFromRemittance;
  @override
  @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance')
  final String allowBeneficiaryProfileEditFromRemittance;
  @override
  @JsonKey(name: 'AllowSpecialRateRequestFromRemittance')
  final String allowSpecialRateRequestFromRemittance;
  @override
  @JsonKey(name: 'AllowBufferInRateToTeller')
  final String allowBufferInRateToTeller;
  @override
  @JsonKey(name: 'AllowOnAccountFacility')
  final String allowOnAccountFacility;
  @override
  @JsonKey(name: 'AllowSpecialDiscountRate')
  final String allowSpecialDiscountRate;
  @override
  @JsonKey(name: 'AllowCreditFacility')
  final String allowCreditFacility;

  /// Create a copy of RemittanceSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemittanceSettingsCopyWith<_RemittanceSettings> get copyWith =>
      __$RemittanceSettingsCopyWithImpl<_RemittanceSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RemittanceSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemittanceSettings &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode) &&
            (identical(other.requiredDualCounter, requiredDualCounter) ||
                other.requiredDualCounter == requiredDualCounter) &&
            (identical(other.prefixForRemittanceRefNo, prefixForRemittanceRefNo) ||
                other.prefixForRemittanceRefNo == prefixForRemittanceRefNo) &&
            (identical(other.correspondentRouting, correspondentRouting) ||
                other.correspondentRouting == correspondentRouting) &&
            (identical(other.autoRoutingTypeCode, autoRoutingTypeCode) ||
                other.autoRoutingTypeCode == autoRoutingTypeCode) &&
            (identical(other.showRateViewInRemittance, showRateViewInRemittance) ||
                other.showRateViewInRemittance == showRateViewInRemittance) &&
            (identical(other.allowNewCustomerAdditionFromRemittance, allowNewCustomerAdditionFromRemittance) ||
                other.allowNewCustomerAdditionFromRemittance ==
                    allowNewCustomerAdditionFromRemittance) &&
            (identical(other.allowCustomerProfileEditFromRemittance,
                    allowCustomerProfileEditFromRemittance) ||
                other.allowCustomerProfileEditFromRemittance ==
                    allowCustomerProfileEditFromRemittance) &&
            (identical(other.allowBeneficiaryProfileEditFromRemittance,
                    allowBeneficiaryProfileEditFromRemittance) ||
                other.allowBeneficiaryProfileEditFromRemittance ==
                    allowBeneficiaryProfileEditFromRemittance) &&
            (identical(other.allowSpecialRateRequestFromRemittance, allowSpecialRateRequestFromRemittance) ||
                other.allowSpecialRateRequestFromRemittance ==
                    allowSpecialRateRequestFromRemittance) &&
            (identical(other.allowBufferInRateToTeller, allowBufferInRateToTeller) ||
                other.allowBufferInRateToTeller == allowBufferInRateToTeller) &&
            (identical(other.allowOnAccountFacility, allowOnAccountFacility) ||
                other.allowOnAccountFacility == allowOnAccountFacility) &&
            (identical(
                    other.allowSpecialDiscountRate, allowSpecialDiscountRate) ||
                other.allowSpecialDiscountRate == allowSpecialDiscountRate) &&
            (identical(other.allowCreditFacility, allowCreditFacility) ||
                other.allowCreditFacility == allowCreditFacility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clientCode,
      requiredDualCounter,
      prefixForRemittanceRefNo,
      correspondentRouting,
      autoRoutingTypeCode,
      showRateViewInRemittance,
      allowNewCustomerAdditionFromRemittance,
      allowCustomerProfileEditFromRemittance,
      allowBeneficiaryProfileEditFromRemittance,
      allowSpecialRateRequestFromRemittance,
      allowBufferInRateToTeller,
      allowOnAccountFacility,
      allowSpecialDiscountRate,
      allowCreditFacility);

  @override
  String toString() {
    return 'RemittanceSettings(clientCode: $clientCode, requiredDualCounter: $requiredDualCounter, prefixForRemittanceRefNo: $prefixForRemittanceRefNo, correspondentRouting: $correspondentRouting, autoRoutingTypeCode: $autoRoutingTypeCode, showRateViewInRemittance: $showRateViewInRemittance, allowNewCustomerAdditionFromRemittance: $allowNewCustomerAdditionFromRemittance, allowCustomerProfileEditFromRemittance: $allowCustomerProfileEditFromRemittance, allowBeneficiaryProfileEditFromRemittance: $allowBeneficiaryProfileEditFromRemittance, allowSpecialRateRequestFromRemittance: $allowSpecialRateRequestFromRemittance, allowBufferInRateToTeller: $allowBufferInRateToTeller, allowOnAccountFacility: $allowOnAccountFacility, allowSpecialDiscountRate: $allowSpecialDiscountRate, allowCreditFacility: $allowCreditFacility)';
  }
}

/// @nodoc
abstract mixin class _$RemittanceSettingsCopyWith<$Res>
    implements $RemittanceSettingsCopyWith<$Res> {
  factory _$RemittanceSettingsCopyWith(
          _RemittanceSettings value, $Res Function(_RemittanceSettings) _then) =
      __$RemittanceSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ClientCode') String clientCode,
      @JsonKey(name: 'RequiredDualCounter') String requiredDualCounter,
      @JsonKey(name: 'PrefixForRemittanceRefNo')
      String prefixForRemittanceRefNo,
      @JsonKey(name: 'CorrespondentRouting') String correspondentRouting,
      @JsonKey(name: 'AutoRoutingTypeCode') bool autoRoutingTypeCode,
      @JsonKey(name: 'ShowRateViewInRemittance')
      String showRateViewInRemittance,
      @JsonKey(name: 'AllowNewCustomerAdditionFromRemittance')
      String allowNewCustomerAdditionFromRemittance,
      @JsonKey(name: 'AllowCustomerProfileEditFromRemittance')
      String allowCustomerProfileEditFromRemittance,
      @JsonKey(name: 'AllowBeneficiaryProfileEditFromRemittance')
      String allowBeneficiaryProfileEditFromRemittance,
      @JsonKey(name: 'AllowSpecialRateRequestFromRemittance')
      String allowSpecialRateRequestFromRemittance,
      @JsonKey(name: 'AllowBufferInRateToTeller')
      String allowBufferInRateToTeller,
      @JsonKey(name: 'AllowOnAccountFacility') String allowOnAccountFacility,
      @JsonKey(name: 'AllowSpecialDiscountRate')
      String allowSpecialDiscountRate,
      @JsonKey(name: 'AllowCreditFacility') String allowCreditFacility});
}

/// @nodoc
class __$RemittanceSettingsCopyWithImpl<$Res>
    implements _$RemittanceSettingsCopyWith<$Res> {
  __$RemittanceSettingsCopyWithImpl(this._self, this._then);

  final _RemittanceSettings _self;
  final $Res Function(_RemittanceSettings) _then;

  /// Create a copy of RemittanceSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientCode = null,
    Object? requiredDualCounter = null,
    Object? prefixForRemittanceRefNo = null,
    Object? correspondentRouting = null,
    Object? autoRoutingTypeCode = null,
    Object? showRateViewInRemittance = null,
    Object? allowNewCustomerAdditionFromRemittance = null,
    Object? allowCustomerProfileEditFromRemittance = null,
    Object? allowBeneficiaryProfileEditFromRemittance = null,
    Object? allowSpecialRateRequestFromRemittance = null,
    Object? allowBufferInRateToTeller = null,
    Object? allowOnAccountFacility = null,
    Object? allowSpecialDiscountRate = null,
    Object? allowCreditFacility = null,
  }) {
    return _then(_RemittanceSettings(
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
      requiredDualCounter: null == requiredDualCounter
          ? _self.requiredDualCounter
          : requiredDualCounter // ignore: cast_nullable_to_non_nullable
              as String,
      prefixForRemittanceRefNo: null == prefixForRemittanceRefNo
          ? _self.prefixForRemittanceRefNo
          : prefixForRemittanceRefNo // ignore: cast_nullable_to_non_nullable
              as String,
      correspondentRouting: null == correspondentRouting
          ? _self.correspondentRouting
          : correspondentRouting // ignore: cast_nullable_to_non_nullable
              as String,
      autoRoutingTypeCode: null == autoRoutingTypeCode
          ? _self.autoRoutingTypeCode
          : autoRoutingTypeCode // ignore: cast_nullable_to_non_nullable
              as bool,
      showRateViewInRemittance: null == showRateViewInRemittance
          ? _self.showRateViewInRemittance
          : showRateViewInRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowNewCustomerAdditionFromRemittance: null ==
              allowNewCustomerAdditionFromRemittance
          ? _self.allowNewCustomerAdditionFromRemittance
          : allowNewCustomerAdditionFromRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowCustomerProfileEditFromRemittance: null ==
              allowCustomerProfileEditFromRemittance
          ? _self.allowCustomerProfileEditFromRemittance
          : allowCustomerProfileEditFromRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowBeneficiaryProfileEditFromRemittance: null ==
              allowBeneficiaryProfileEditFromRemittance
          ? _self.allowBeneficiaryProfileEditFromRemittance
          : allowBeneficiaryProfileEditFromRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowSpecialRateRequestFromRemittance: null ==
              allowSpecialRateRequestFromRemittance
          ? _self.allowSpecialRateRequestFromRemittance
          : allowSpecialRateRequestFromRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      allowBufferInRateToTeller: null == allowBufferInRateToTeller
          ? _self.allowBufferInRateToTeller
          : allowBufferInRateToTeller // ignore: cast_nullable_to_non_nullable
              as String,
      allowOnAccountFacility: null == allowOnAccountFacility
          ? _self.allowOnAccountFacility
          : allowOnAccountFacility // ignore: cast_nullable_to_non_nullable
              as String,
      allowSpecialDiscountRate: null == allowSpecialDiscountRate
          ? _self.allowSpecialDiscountRate
          : allowSpecialDiscountRate // ignore: cast_nullable_to_non_nullable
              as String,
      allowCreditFacility: null == allowCreditFacility
          ? _self.allowCreditFacility
          : allowCreditFacility // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$MobileSettings {
  @JsonKey(name: 'ClientCode')
  String get clientCode;

  /// Create a copy of MobileSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MobileSettingsCopyWith<MobileSettings> get copyWith =>
      _$MobileSettingsCopyWithImpl<MobileSettings>(
          this as MobileSettings, _$identity);

  /// Serializes this MobileSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MobileSettings &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clientCode);

  @override
  String toString() {
    return 'MobileSettings(clientCode: $clientCode)';
  }
}

/// @nodoc
abstract mixin class $MobileSettingsCopyWith<$Res> {
  factory $MobileSettingsCopyWith(
          MobileSettings value, $Res Function(MobileSettings) _then) =
      _$MobileSettingsCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'ClientCode') String clientCode});
}

/// @nodoc
class _$MobileSettingsCopyWithImpl<$Res>
    implements $MobileSettingsCopyWith<$Res> {
  _$MobileSettingsCopyWithImpl(this._self, this._then);

  final MobileSettings _self;
  final $Res Function(MobileSettings) _then;

  /// Create a copy of MobileSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientCode = null,
  }) {
    return _then(_self.copyWith(
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [MobileSettings].
extension MobileSettingsPatterns on MobileSettings {
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
    TResult Function(_MobileSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MobileSettings() when $default != null:
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
    TResult Function(_MobileSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MobileSettings():
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
    TResult? Function(_MobileSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MobileSettings() when $default != null:
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
    TResult Function(@JsonKey(name: 'ClientCode') String clientCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MobileSettings() when $default != null:
        return $default(_that.clientCode);
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
    TResult Function(@JsonKey(name: 'ClientCode') String clientCode) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MobileSettings():
        return $default(_that.clientCode);
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
    TResult? Function(@JsonKey(name: 'ClientCode') String clientCode)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MobileSettings() when $default != null:
        return $default(_that.clientCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _MobileSettings implements MobileSettings {
  const _MobileSettings({@JsonKey(name: 'ClientCode') this.clientCode = ''});
  factory _MobileSettings.fromJson(Map<String, dynamic> json) =>
      _$MobileSettingsFromJson(json);

  @override
  @JsonKey(name: 'ClientCode')
  final String clientCode;

  /// Create a copy of MobileSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MobileSettingsCopyWith<_MobileSettings> get copyWith =>
      __$MobileSettingsCopyWithImpl<_MobileSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MobileSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MobileSettings &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, clientCode);

  @override
  String toString() {
    return 'MobileSettings(clientCode: $clientCode)';
  }
}

/// @nodoc
abstract mixin class _$MobileSettingsCopyWith<$Res>
    implements $MobileSettingsCopyWith<$Res> {
  factory _$MobileSettingsCopyWith(
          _MobileSettings value, $Res Function(_MobileSettings) _then) =
      __$MobileSettingsCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'ClientCode') String clientCode});
}

/// @nodoc
class __$MobileSettingsCopyWithImpl<$Res>
    implements _$MobileSettingsCopyWith<$Res> {
  __$MobileSettingsCopyWithImpl(this._self, this._then);

  final _MobileSettings _self;
  final $Res Function(_MobileSettings) _then;

  /// Create a copy of MobileSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? clientCode = null,
  }) {
    return _then(_MobileSettings(
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$IncomingSettings {
  @JsonKey(name: 'PrefixForIncomingRefNo')
  String get prefixForIncomingRefNo;

  /// Create a copy of IncomingSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncomingSettingsCopyWith<IncomingSettings> get copyWith =>
      _$IncomingSettingsCopyWithImpl<IncomingSettings>(
          this as IncomingSettings, _$identity);

  /// Serializes this IncomingSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncomingSettings &&
            (identical(other.prefixForIncomingRefNo, prefixForIncomingRefNo) ||
                other.prefixForIncomingRefNo == prefixForIncomingRefNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prefixForIncomingRefNo);

  @override
  String toString() {
    return 'IncomingSettings(prefixForIncomingRefNo: $prefixForIncomingRefNo)';
  }
}

/// @nodoc
abstract mixin class $IncomingSettingsCopyWith<$Res> {
  factory $IncomingSettingsCopyWith(
          IncomingSettings value, $Res Function(IncomingSettings) _then) =
      _$IncomingSettingsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'PrefixForIncomingRefNo') String prefixForIncomingRefNo});
}

/// @nodoc
class _$IncomingSettingsCopyWithImpl<$Res>
    implements $IncomingSettingsCopyWith<$Res> {
  _$IncomingSettingsCopyWithImpl(this._self, this._then);

  final IncomingSettings _self;
  final $Res Function(IncomingSettings) _then;

  /// Create a copy of IncomingSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefixForIncomingRefNo = null,
  }) {
    return _then(_self.copyWith(
      prefixForIncomingRefNo: null == prefixForIncomingRefNo
          ? _self.prefixForIncomingRefNo
          : prefixForIncomingRefNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [IncomingSettings].
extension IncomingSettingsPatterns on IncomingSettings {
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
    TResult Function(_IncomingSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncomingSettings() when $default != null:
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
    TResult Function(_IncomingSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomingSettings():
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
    TResult? Function(_IncomingSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomingSettings() when $default != null:
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
            @JsonKey(name: 'PrefixForIncomingRefNo')
            String prefixForIncomingRefNo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncomingSettings() when $default != null:
        return $default(_that.prefixForIncomingRefNo);
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
            @JsonKey(name: 'PrefixForIncomingRefNo')
            String prefixForIncomingRefNo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomingSettings():
        return $default(_that.prefixForIncomingRefNo);
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
            @JsonKey(name: 'PrefixForIncomingRefNo')
            String prefixForIncomingRefNo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncomingSettings() when $default != null:
        return $default(_that.prefixForIncomingRefNo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IncomingSettings implements IncomingSettings {
  const _IncomingSettings(
      {@JsonKey(name: 'PrefixForIncomingRefNo')
      this.prefixForIncomingRefNo = ''});
  factory _IncomingSettings.fromJson(Map<String, dynamic> json) =>
      _$IncomingSettingsFromJson(json);

  @override
  @JsonKey(name: 'PrefixForIncomingRefNo')
  final String prefixForIncomingRefNo;

  /// Create a copy of IncomingSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncomingSettingsCopyWith<_IncomingSettings> get copyWith =>
      __$IncomingSettingsCopyWithImpl<_IncomingSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IncomingSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncomingSettings &&
            (identical(other.prefixForIncomingRefNo, prefixForIncomingRefNo) ||
                other.prefixForIncomingRefNo == prefixForIncomingRefNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prefixForIncomingRefNo);

  @override
  String toString() {
    return 'IncomingSettings(prefixForIncomingRefNo: $prefixForIncomingRefNo)';
  }
}

/// @nodoc
abstract mixin class _$IncomingSettingsCopyWith<$Res>
    implements $IncomingSettingsCopyWith<$Res> {
  factory _$IncomingSettingsCopyWith(
          _IncomingSettings value, $Res Function(_IncomingSettings) _then) =
      __$IncomingSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PrefixForIncomingRefNo') String prefixForIncomingRefNo});
}

/// @nodoc
class __$IncomingSettingsCopyWithImpl<$Res>
    implements _$IncomingSettingsCopyWith<$Res> {
  __$IncomingSettingsCopyWithImpl(this._self, this._then);

  final _IncomingSettings _self;
  final $Res Function(_IncomingSettings) _then;

  /// Create a copy of IncomingSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? prefixForIncomingRefNo = null,
  }) {
    return _then(_IncomingSettings(
      prefixForIncomingRefNo: null == prefixForIncomingRefNo
          ? _self.prefixForIncomingRefNo
          : prefixForIncomingRefNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ForexSettings {
  @JsonKey(name: 'PrefixForForexRefNo')
  String get prefixForForexRefNo;

  /// Create a copy of ForexSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForexSettingsCopyWith<ForexSettings> get copyWith =>
      _$ForexSettingsCopyWithImpl<ForexSettings>(
          this as ForexSettings, _$identity);

  /// Serializes this ForexSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForexSettings &&
            (identical(other.prefixForForexRefNo, prefixForForexRefNo) ||
                other.prefixForForexRefNo == prefixForForexRefNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prefixForForexRefNo);

  @override
  String toString() {
    return 'ForexSettings(prefixForForexRefNo: $prefixForForexRefNo)';
  }
}

/// @nodoc
abstract mixin class $ForexSettingsCopyWith<$Res> {
  factory $ForexSettingsCopyWith(
          ForexSettings value, $Res Function(ForexSettings) _then) =
      _$ForexSettingsCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'PrefixForForexRefNo') String prefixForForexRefNo});
}

/// @nodoc
class _$ForexSettingsCopyWithImpl<$Res>
    implements $ForexSettingsCopyWith<$Res> {
  _$ForexSettingsCopyWithImpl(this._self, this._then);

  final ForexSettings _self;
  final $Res Function(ForexSettings) _then;

  /// Create a copy of ForexSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefixForForexRefNo = null,
  }) {
    return _then(_self.copyWith(
      prefixForForexRefNo: null == prefixForForexRefNo
          ? _self.prefixForForexRefNo
          : prefixForForexRefNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ForexSettings].
extension ForexSettingsPatterns on ForexSettings {
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
    TResult Function(_ForexSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForexSettings() when $default != null:
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
    TResult Function(_ForexSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForexSettings():
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
    TResult? Function(_ForexSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForexSettings() when $default != null:
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
            @JsonKey(name: 'PrefixForForexRefNo') String prefixForForexRefNo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ForexSettings() when $default != null:
        return $default(_that.prefixForForexRefNo);
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
            @JsonKey(name: 'PrefixForForexRefNo') String prefixForForexRefNo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForexSettings():
        return $default(_that.prefixForForexRefNo);
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
            @JsonKey(name: 'PrefixForForexRefNo') String prefixForForexRefNo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ForexSettings() when $default != null:
        return $default(_that.prefixForForexRefNo);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ForexSettings implements ForexSettings {
  const _ForexSettings(
      {@JsonKey(name: 'PrefixForForexRefNo') this.prefixForForexRefNo = ''});
  factory _ForexSettings.fromJson(Map<String, dynamic> json) =>
      _$ForexSettingsFromJson(json);

  @override
  @JsonKey(name: 'PrefixForForexRefNo')
  final String prefixForForexRefNo;

  /// Create a copy of ForexSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForexSettingsCopyWith<_ForexSettings> get copyWith =>
      __$ForexSettingsCopyWithImpl<_ForexSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForexSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForexSettings &&
            (identical(other.prefixForForexRefNo, prefixForForexRefNo) ||
                other.prefixForForexRefNo == prefixForForexRefNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prefixForForexRefNo);

  @override
  String toString() {
    return 'ForexSettings(prefixForForexRefNo: $prefixForForexRefNo)';
  }
}

/// @nodoc
abstract mixin class _$ForexSettingsCopyWith<$Res>
    implements $ForexSettingsCopyWith<$Res> {
  factory _$ForexSettingsCopyWith(
          _ForexSettings value, $Res Function(_ForexSettings) _then) =
      __$ForexSettingsCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'PrefixForForexRefNo') String prefixForForexRefNo});
}

/// @nodoc
class __$ForexSettingsCopyWithImpl<$Res>
    implements _$ForexSettingsCopyWith<$Res> {
  __$ForexSettingsCopyWithImpl(this._self, this._then);

  final _ForexSettings _self;
  final $Res Function(_ForexSettings) _then;

  /// Create a copy of ForexSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? prefixForForexRefNo = null,
  }) {
    return _then(_ForexSettings(
      prefixForForexRefNo: null == prefixForForexRefNo
          ? _self.prefixForForexRefNo
          : prefixForForexRefNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AccountsSettings {
  @JsonKey(name: 'PrefixForBankVoucherNumber')
  String get prefixForBankVoucherNumber;
  @JsonKey(name: 'PrefixForCashVoucherNumber')
  String get prefixForCashVoucherNumber;
  @JsonKey(name: 'FinancialYear')
  String get financialYear;
  @JsonKey(name: 'Accounting')
  String get accounting;
  @JsonKey(name: 'TaxPercentage')
  String get taxPercentage;
  @JsonKey(name: 'ClientCode')
  String get clientCode;

  /// Create a copy of AccountsSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountsSettingsCopyWith<AccountsSettings> get copyWith =>
      _$AccountsSettingsCopyWithImpl<AccountsSettings>(
          this as AccountsSettings, _$identity);

  /// Serializes this AccountsSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountsSettings &&
            (identical(other.prefixForBankVoucherNumber,
                    prefixForBankVoucherNumber) ||
                other.prefixForBankVoucherNumber ==
                    prefixForBankVoucherNumber) &&
            (identical(other.prefixForCashVoucherNumber,
                    prefixForCashVoucherNumber) ||
                other.prefixForCashVoucherNumber ==
                    prefixForCashVoucherNumber) &&
            (identical(other.financialYear, financialYear) ||
                other.financialYear == financialYear) &&
            (identical(other.accounting, accounting) ||
                other.accounting == accounting) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage) &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      prefixForBankVoucherNumber,
      prefixForCashVoucherNumber,
      financialYear,
      accounting,
      taxPercentage,
      clientCode);

  @override
  String toString() {
    return 'AccountsSettings(prefixForBankVoucherNumber: $prefixForBankVoucherNumber, prefixForCashVoucherNumber: $prefixForCashVoucherNumber, financialYear: $financialYear, accounting: $accounting, taxPercentage: $taxPercentage, clientCode: $clientCode)';
  }
}

/// @nodoc
abstract mixin class $AccountsSettingsCopyWith<$Res> {
  factory $AccountsSettingsCopyWith(
          AccountsSettings value, $Res Function(AccountsSettings) _then) =
      _$AccountsSettingsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'PrefixForBankVoucherNumber')
      String prefixForBankVoucherNumber,
      @JsonKey(name: 'PrefixForCashVoucherNumber')
      String prefixForCashVoucherNumber,
      @JsonKey(name: 'FinancialYear') String financialYear,
      @JsonKey(name: 'Accounting') String accounting,
      @JsonKey(name: 'TaxPercentage') String taxPercentage,
      @JsonKey(name: 'ClientCode') String clientCode});
}

/// @nodoc
class _$AccountsSettingsCopyWithImpl<$Res>
    implements $AccountsSettingsCopyWith<$Res> {
  _$AccountsSettingsCopyWithImpl(this._self, this._then);

  final AccountsSettings _self;
  final $Res Function(AccountsSettings) _then;

  /// Create a copy of AccountsSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prefixForBankVoucherNumber = null,
    Object? prefixForCashVoucherNumber = null,
    Object? financialYear = null,
    Object? accounting = null,
    Object? taxPercentage = null,
    Object? clientCode = null,
  }) {
    return _then(_self.copyWith(
      prefixForBankVoucherNumber: null == prefixForBankVoucherNumber
          ? _self.prefixForBankVoucherNumber
          : prefixForBankVoucherNumber // ignore: cast_nullable_to_non_nullable
              as String,
      prefixForCashVoucherNumber: null == prefixForCashVoucherNumber
          ? _self.prefixForCashVoucherNumber
          : prefixForCashVoucherNumber // ignore: cast_nullable_to_non_nullable
              as String,
      financialYear: null == financialYear
          ? _self.financialYear
          : financialYear // ignore: cast_nullable_to_non_nullable
              as String,
      accounting: null == accounting
          ? _self.accounting
          : accounting // ignore: cast_nullable_to_non_nullable
              as String,
      taxPercentage: null == taxPercentage
          ? _self.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AccountsSettings].
extension AccountsSettingsPatterns on AccountsSettings {
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
    TResult Function(_AccountsSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccountsSettings() when $default != null:
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
    TResult Function(_AccountsSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountsSettings():
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
    TResult? Function(_AccountsSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountsSettings() when $default != null:
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
            @JsonKey(name: 'PrefixForBankVoucherNumber')
            String prefixForBankVoucherNumber,
            @JsonKey(name: 'PrefixForCashVoucherNumber')
            String prefixForCashVoucherNumber,
            @JsonKey(name: 'FinancialYear') String financialYear,
            @JsonKey(name: 'Accounting') String accounting,
            @JsonKey(name: 'TaxPercentage') String taxPercentage,
            @JsonKey(name: 'ClientCode') String clientCode)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AccountsSettings() when $default != null:
        return $default(
            _that.prefixForBankVoucherNumber,
            _that.prefixForCashVoucherNumber,
            _that.financialYear,
            _that.accounting,
            _that.taxPercentage,
            _that.clientCode);
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
            @JsonKey(name: 'PrefixForBankVoucherNumber')
            String prefixForBankVoucherNumber,
            @JsonKey(name: 'PrefixForCashVoucherNumber')
            String prefixForCashVoucherNumber,
            @JsonKey(name: 'FinancialYear') String financialYear,
            @JsonKey(name: 'Accounting') String accounting,
            @JsonKey(name: 'TaxPercentage') String taxPercentage,
            @JsonKey(name: 'ClientCode') String clientCode)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountsSettings():
        return $default(
            _that.prefixForBankVoucherNumber,
            _that.prefixForCashVoucherNumber,
            _that.financialYear,
            _that.accounting,
            _that.taxPercentage,
            _that.clientCode);
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
            @JsonKey(name: 'PrefixForBankVoucherNumber')
            String prefixForBankVoucherNumber,
            @JsonKey(name: 'PrefixForCashVoucherNumber')
            String prefixForCashVoucherNumber,
            @JsonKey(name: 'FinancialYear') String financialYear,
            @JsonKey(name: 'Accounting') String accounting,
            @JsonKey(name: 'TaxPercentage') String taxPercentage,
            @JsonKey(name: 'ClientCode') String clientCode)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AccountsSettings() when $default != null:
        return $default(
            _that.prefixForBankVoucherNumber,
            _that.prefixForCashVoucherNumber,
            _that.financialYear,
            _that.accounting,
            _that.taxPercentage,
            _that.clientCode);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AccountsSettings implements AccountsSettings {
  const _AccountsSettings(
      {@JsonKey(name: 'PrefixForBankVoucherNumber')
      this.prefixForBankVoucherNumber = '',
      @JsonKey(name: 'PrefixForCashVoucherNumber')
      this.prefixForCashVoucherNumber = '',
      @JsonKey(name: 'FinancialYear') this.financialYear = '',
      @JsonKey(name: 'Accounting') this.accounting = '',
      @JsonKey(name: 'TaxPercentage') this.taxPercentage = '',
      @JsonKey(name: 'ClientCode') this.clientCode = ''});
  factory _AccountsSettings.fromJson(Map<String, dynamic> json) =>
      _$AccountsSettingsFromJson(json);

  @override
  @JsonKey(name: 'PrefixForBankVoucherNumber')
  final String prefixForBankVoucherNumber;
  @override
  @JsonKey(name: 'PrefixForCashVoucherNumber')
  final String prefixForCashVoucherNumber;
  @override
  @JsonKey(name: 'FinancialYear')
  final String financialYear;
  @override
  @JsonKey(name: 'Accounting')
  final String accounting;
  @override
  @JsonKey(name: 'TaxPercentage')
  final String taxPercentage;
  @override
  @JsonKey(name: 'ClientCode')
  final String clientCode;

  /// Create a copy of AccountsSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountsSettingsCopyWith<_AccountsSettings> get copyWith =>
      __$AccountsSettingsCopyWithImpl<_AccountsSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountsSettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountsSettings &&
            (identical(other.prefixForBankVoucherNumber,
                    prefixForBankVoucherNumber) ||
                other.prefixForBankVoucherNumber ==
                    prefixForBankVoucherNumber) &&
            (identical(other.prefixForCashVoucherNumber,
                    prefixForCashVoucherNumber) ||
                other.prefixForCashVoucherNumber ==
                    prefixForCashVoucherNumber) &&
            (identical(other.financialYear, financialYear) ||
                other.financialYear == financialYear) &&
            (identical(other.accounting, accounting) ||
                other.accounting == accounting) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage) &&
            (identical(other.clientCode, clientCode) ||
                other.clientCode == clientCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      prefixForBankVoucherNumber,
      prefixForCashVoucherNumber,
      financialYear,
      accounting,
      taxPercentage,
      clientCode);

  @override
  String toString() {
    return 'AccountsSettings(prefixForBankVoucherNumber: $prefixForBankVoucherNumber, prefixForCashVoucherNumber: $prefixForCashVoucherNumber, financialYear: $financialYear, accounting: $accounting, taxPercentage: $taxPercentage, clientCode: $clientCode)';
  }
}

/// @nodoc
abstract mixin class _$AccountsSettingsCopyWith<$Res>
    implements $AccountsSettingsCopyWith<$Res> {
  factory _$AccountsSettingsCopyWith(
          _AccountsSettings value, $Res Function(_AccountsSettings) _then) =
      __$AccountsSettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PrefixForBankVoucherNumber')
      String prefixForBankVoucherNumber,
      @JsonKey(name: 'PrefixForCashVoucherNumber')
      String prefixForCashVoucherNumber,
      @JsonKey(name: 'FinancialYear') String financialYear,
      @JsonKey(name: 'Accounting') String accounting,
      @JsonKey(name: 'TaxPercentage') String taxPercentage,
      @JsonKey(name: 'ClientCode') String clientCode});
}

/// @nodoc
class __$AccountsSettingsCopyWithImpl<$Res>
    implements _$AccountsSettingsCopyWith<$Res> {
  __$AccountsSettingsCopyWithImpl(this._self, this._then);

  final _AccountsSettings _self;
  final $Res Function(_AccountsSettings) _then;

  /// Create a copy of AccountsSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? prefixForBankVoucherNumber = null,
    Object? prefixForCashVoucherNumber = null,
    Object? financialYear = null,
    Object? accounting = null,
    Object? taxPercentage = null,
    Object? clientCode = null,
  }) {
    return _then(_AccountsSettings(
      prefixForBankVoucherNumber: null == prefixForBankVoucherNumber
          ? _self.prefixForBankVoucherNumber
          : prefixForBankVoucherNumber // ignore: cast_nullable_to_non_nullable
              as String,
      prefixForCashVoucherNumber: null == prefixForCashVoucherNumber
          ? _self.prefixForCashVoucherNumber
          : prefixForCashVoucherNumber // ignore: cast_nullable_to_non_nullable
              as String,
      financialYear: null == financialYear
          ? _self.financialYear
          : financialYear // ignore: cast_nullable_to_non_nullable
              as String,
      accounting: null == accounting
          ? _self.accounting
          : accounting // ignore: cast_nullable_to_non_nullable
              as String,
      taxPercentage: null == taxPercentage
          ? _self.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      clientCode: null == clientCode
          ? _self.clientCode
          : clientCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$CompanySettings {
  @JsonKey(name: 'CompanyName')
  String get companyName;
  @JsonKey(name: 'Country')
  String get country;
  @JsonKey(name: 'BuildingNumber')
  String get buildingNumber;
  @JsonKey(name: 'BlockNumber')
  String get blockNumber;
  @JsonKey(name: 'StreetName')
  String get streetName;
  @JsonKey(name: 'PinCode')
  String get pinCode;
  @JsonKey(name: 'TimeZone')
  String get timeZone;
  @JsonKey(name: 'EmailId')
  String get emailId;
  @JsonKey(name: 'MobileNumber')
  String get mobileNumber;
  @JsonKey(name: 'PhoneNumber')
  String get phoneNumber;
  @JsonKey(name: 'CompanyLogo')
  String get companyLogo;
  @JsonKey(name: 'BaseCurrency')
  String get baseCurrency;
  @JsonKey(name: 'PrimaryBaseCurrency')
  String get primaryBaseCurrency;
  @JsonKey(name: 'CrossCurrency')
  String get crossCurrency;
  @JsonKey(name: 'NumberFormat')
  String get numberFormat;
  @JsonKey(name: 'DateFormat')
  String get dateFormat;
  @JsonKey(name: 'PrimaryLanguage')
  String get primaryLanguage;
  @JsonKey(name: 'Themes')
  int get themes;
  @JsonKey(name: 'CompanyLogoName')
  String get companyLogoName;
  @JsonKey(name: 'CrossCurrencyRate')
  String get crossCurrencyRate;
  @JsonKey(name: 'TrnNo')
  String get trnNo;
  @JsonKey(name: 'Status')
  String get status;
  @JsonKey(name: 'CreatedByUser')
  String get createdByUser;
  @JsonKey(name: 'CreatedDateTime')
  String get createdDateTime;
  @JsonKey(name: 'UpdatedByUser')
  String get updatedByUser;
  @JsonKey(name: 'UpdatedDateTime')
  String get updatedDateTime;

  /// Create a copy of CompanySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CompanySettingsCopyWith<CompanySettings> get copyWith =>
      _$CompanySettingsCopyWithImpl<CompanySettings>(
          this as CompanySettings, _$identity);

  /// Serializes this CompanySettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompanySettings &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.buildingNumber, buildingNumber) ||
                other.buildingNumber == buildingNumber) &&
            (identical(other.blockNumber, blockNumber) ||
                other.blockNumber == blockNumber) &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.companyLogo, companyLogo) ||
                other.companyLogo == companyLogo) &&
            (identical(other.baseCurrency, baseCurrency) ||
                other.baseCurrency == baseCurrency) &&
            (identical(other.primaryBaseCurrency, primaryBaseCurrency) ||
                other.primaryBaseCurrency == primaryBaseCurrency) &&
            (identical(other.crossCurrency, crossCurrency) ||
                other.crossCurrency == crossCurrency) &&
            (identical(other.numberFormat, numberFormat) ||
                other.numberFormat == numberFormat) &&
            (identical(other.dateFormat, dateFormat) ||
                other.dateFormat == dateFormat) &&
            (identical(other.primaryLanguage, primaryLanguage) ||
                other.primaryLanguage == primaryLanguage) &&
            (identical(other.themes, themes) || other.themes == themes) &&
            (identical(other.companyLogoName, companyLogoName) ||
                other.companyLogoName == companyLogoName) &&
            (identical(other.crossCurrencyRate, crossCurrencyRate) ||
                other.crossCurrencyRate == crossCurrencyRate) &&
            (identical(other.trnNo, trnNo) || other.trnNo == trnNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdByUser, createdByUser) ||
                other.createdByUser == createdByUser) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedByUser, updatedByUser) ||
                other.updatedByUser == updatedByUser) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        companyName,
        country,
        buildingNumber,
        blockNumber,
        streetName,
        pinCode,
        timeZone,
        emailId,
        mobileNumber,
        phoneNumber,
        companyLogo,
        baseCurrency,
        primaryBaseCurrency,
        crossCurrency,
        numberFormat,
        dateFormat,
        primaryLanguage,
        themes,
        companyLogoName,
        crossCurrencyRate,
        trnNo,
        status,
        createdByUser,
        createdDateTime,
        updatedByUser,
        updatedDateTime
      ]);

  @override
  String toString() {
    return 'CompanySettings(companyName: $companyName, country: $country, buildingNumber: $buildingNumber, blockNumber: $blockNumber, streetName: $streetName, pinCode: $pinCode, timeZone: $timeZone, emailId: $emailId, mobileNumber: $mobileNumber, phoneNumber: $phoneNumber, companyLogo: $companyLogo, baseCurrency: $baseCurrency, primaryBaseCurrency: $primaryBaseCurrency, crossCurrency: $crossCurrency, numberFormat: $numberFormat, dateFormat: $dateFormat, primaryLanguage: $primaryLanguage, themes: $themes, companyLogoName: $companyLogoName, crossCurrencyRate: $crossCurrencyRate, trnNo: $trnNo, status: $status, createdByUser: $createdByUser, createdDateTime: $createdDateTime, updatedByUser: $updatedByUser, updatedDateTime: $updatedDateTime)';
  }
}

/// @nodoc
abstract mixin class $CompanySettingsCopyWith<$Res> {
  factory $CompanySettingsCopyWith(
          CompanySettings value, $Res Function(CompanySettings) _then) =
      _$CompanySettingsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'CompanyName') String companyName,
      @JsonKey(name: 'Country') String country,
      @JsonKey(name: 'BuildingNumber') String buildingNumber,
      @JsonKey(name: 'BlockNumber') String blockNumber,
      @JsonKey(name: 'StreetName') String streetName,
      @JsonKey(name: 'PinCode') String pinCode,
      @JsonKey(name: 'TimeZone') String timeZone,
      @JsonKey(name: 'EmailId') String emailId,
      @JsonKey(name: 'MobileNumber') String mobileNumber,
      @JsonKey(name: 'PhoneNumber') String phoneNumber,
      @JsonKey(name: 'CompanyLogo') String companyLogo,
      @JsonKey(name: 'BaseCurrency') String baseCurrency,
      @JsonKey(name: 'PrimaryBaseCurrency') String primaryBaseCurrency,
      @JsonKey(name: 'CrossCurrency') String crossCurrency,
      @JsonKey(name: 'NumberFormat') String numberFormat,
      @JsonKey(name: 'DateFormat') String dateFormat,
      @JsonKey(name: 'PrimaryLanguage') String primaryLanguage,
      @JsonKey(name: 'Themes') int themes,
      @JsonKey(name: 'CompanyLogoName') String companyLogoName,
      @JsonKey(name: 'CrossCurrencyRate') String crossCurrencyRate,
      @JsonKey(name: 'TrnNo') String trnNo,
      @JsonKey(name: 'Status') String status,
      @JsonKey(name: 'CreatedByUser') String createdByUser,
      @JsonKey(name: 'CreatedDateTime') String createdDateTime,
      @JsonKey(name: 'UpdatedByUser') String updatedByUser,
      @JsonKey(name: 'UpdatedDateTime') String updatedDateTime});
}

/// @nodoc
class _$CompanySettingsCopyWithImpl<$Res>
    implements $CompanySettingsCopyWith<$Res> {
  _$CompanySettingsCopyWithImpl(this._self, this._then);

  final CompanySettings _self;
  final $Res Function(CompanySettings) _then;

  /// Create a copy of CompanySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? country = null,
    Object? buildingNumber = null,
    Object? blockNumber = null,
    Object? streetName = null,
    Object? pinCode = null,
    Object? timeZone = null,
    Object? emailId = null,
    Object? mobileNumber = null,
    Object? phoneNumber = null,
    Object? companyLogo = null,
    Object? baseCurrency = null,
    Object? primaryBaseCurrency = null,
    Object? crossCurrency = null,
    Object? numberFormat = null,
    Object? dateFormat = null,
    Object? primaryLanguage = null,
    Object? themes = null,
    Object? companyLogoName = null,
    Object? crossCurrencyRate = null,
    Object? trnNo = null,
    Object? status = null,
    Object? createdByUser = null,
    Object? createdDateTime = null,
    Object? updatedByUser = null,
    Object? updatedDateTime = null,
  }) {
    return _then(_self.copyWith(
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      buildingNumber: null == buildingNumber
          ? _self.buildingNumber
          : buildingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      blockNumber: null == blockNumber
          ? _self.blockNumber
          : blockNumber // ignore: cast_nullable_to_non_nullable
              as String,
      streetName: null == streetName
          ? _self.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _self.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _self.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      companyLogo: null == companyLogo
          ? _self.companyLogo
          : companyLogo // ignore: cast_nullable_to_non_nullable
              as String,
      baseCurrency: null == baseCurrency
          ? _self.baseCurrency
          : baseCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      primaryBaseCurrency: null == primaryBaseCurrency
          ? _self.primaryBaseCurrency
          : primaryBaseCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      crossCurrency: null == crossCurrency
          ? _self.crossCurrency
          : crossCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      numberFormat: null == numberFormat
          ? _self.numberFormat
          : numberFormat // ignore: cast_nullable_to_non_nullable
              as String,
      dateFormat: null == dateFormat
          ? _self.dateFormat
          : dateFormat // ignore: cast_nullable_to_non_nullable
              as String,
      primaryLanguage: null == primaryLanguage
          ? _self.primaryLanguage
          : primaryLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      themes: null == themes
          ? _self.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as int,
      companyLogoName: null == companyLogoName
          ? _self.companyLogoName
          : companyLogoName // ignore: cast_nullable_to_non_nullable
              as String,
      crossCurrencyRate: null == crossCurrencyRate
          ? _self.crossCurrencyRate
          : crossCurrencyRate // ignore: cast_nullable_to_non_nullable
              as String,
      trnNo: null == trnNo
          ? _self.trnNo
          : trnNo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: null == createdByUser
          ? _self.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: null == createdDateTime
          ? _self.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      updatedByUser: null == updatedByUser
          ? _self.updatedByUser
          : updatedByUser // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDateTime: null == updatedDateTime
          ? _self.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [CompanySettings].
extension CompanySettingsPatterns on CompanySettings {
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
    TResult Function(_CompanySettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CompanySettings() when $default != null:
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
    TResult Function(_CompanySettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanySettings():
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
    TResult? Function(_CompanySettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanySettings() when $default != null:
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
            @JsonKey(name: 'CompanyName') String companyName,
            @JsonKey(name: 'Country') String country,
            @JsonKey(name: 'BuildingNumber') String buildingNumber,
            @JsonKey(name: 'BlockNumber') String blockNumber,
            @JsonKey(name: 'StreetName') String streetName,
            @JsonKey(name: 'PinCode') String pinCode,
            @JsonKey(name: 'TimeZone') String timeZone,
            @JsonKey(name: 'EmailId') String emailId,
            @JsonKey(name: 'MobileNumber') String mobileNumber,
            @JsonKey(name: 'PhoneNumber') String phoneNumber,
            @JsonKey(name: 'CompanyLogo') String companyLogo,
            @JsonKey(name: 'BaseCurrency') String baseCurrency,
            @JsonKey(name: 'PrimaryBaseCurrency') String primaryBaseCurrency,
            @JsonKey(name: 'CrossCurrency') String crossCurrency,
            @JsonKey(name: 'NumberFormat') String numberFormat,
            @JsonKey(name: 'DateFormat') String dateFormat,
            @JsonKey(name: 'PrimaryLanguage') String primaryLanguage,
            @JsonKey(name: 'Themes') int themes,
            @JsonKey(name: 'CompanyLogoName') String companyLogoName,
            @JsonKey(name: 'CrossCurrencyRate') String crossCurrencyRate,
            @JsonKey(name: 'TrnNo') String trnNo,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'CreatedByUser') String createdByUser,
            @JsonKey(name: 'CreatedDateTime') String createdDateTime,
            @JsonKey(name: 'UpdatedByUser') String updatedByUser,
            @JsonKey(name: 'UpdatedDateTime') String updatedDateTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CompanySettings() when $default != null:
        return $default(
            _that.companyName,
            _that.country,
            _that.buildingNumber,
            _that.blockNumber,
            _that.streetName,
            _that.pinCode,
            _that.timeZone,
            _that.emailId,
            _that.mobileNumber,
            _that.phoneNumber,
            _that.companyLogo,
            _that.baseCurrency,
            _that.primaryBaseCurrency,
            _that.crossCurrency,
            _that.numberFormat,
            _that.dateFormat,
            _that.primaryLanguage,
            _that.themes,
            _that.companyLogoName,
            _that.crossCurrencyRate,
            _that.trnNo,
            _that.status,
            _that.createdByUser,
            _that.createdDateTime,
            _that.updatedByUser,
            _that.updatedDateTime);
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
            @JsonKey(name: 'CompanyName') String companyName,
            @JsonKey(name: 'Country') String country,
            @JsonKey(name: 'BuildingNumber') String buildingNumber,
            @JsonKey(name: 'BlockNumber') String blockNumber,
            @JsonKey(name: 'StreetName') String streetName,
            @JsonKey(name: 'PinCode') String pinCode,
            @JsonKey(name: 'TimeZone') String timeZone,
            @JsonKey(name: 'EmailId') String emailId,
            @JsonKey(name: 'MobileNumber') String mobileNumber,
            @JsonKey(name: 'PhoneNumber') String phoneNumber,
            @JsonKey(name: 'CompanyLogo') String companyLogo,
            @JsonKey(name: 'BaseCurrency') String baseCurrency,
            @JsonKey(name: 'PrimaryBaseCurrency') String primaryBaseCurrency,
            @JsonKey(name: 'CrossCurrency') String crossCurrency,
            @JsonKey(name: 'NumberFormat') String numberFormat,
            @JsonKey(name: 'DateFormat') String dateFormat,
            @JsonKey(name: 'PrimaryLanguage') String primaryLanguage,
            @JsonKey(name: 'Themes') int themes,
            @JsonKey(name: 'CompanyLogoName') String companyLogoName,
            @JsonKey(name: 'CrossCurrencyRate') String crossCurrencyRate,
            @JsonKey(name: 'TrnNo') String trnNo,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'CreatedByUser') String createdByUser,
            @JsonKey(name: 'CreatedDateTime') String createdDateTime,
            @JsonKey(name: 'UpdatedByUser') String updatedByUser,
            @JsonKey(name: 'UpdatedDateTime') String updatedDateTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanySettings():
        return $default(
            _that.companyName,
            _that.country,
            _that.buildingNumber,
            _that.blockNumber,
            _that.streetName,
            _that.pinCode,
            _that.timeZone,
            _that.emailId,
            _that.mobileNumber,
            _that.phoneNumber,
            _that.companyLogo,
            _that.baseCurrency,
            _that.primaryBaseCurrency,
            _that.crossCurrency,
            _that.numberFormat,
            _that.dateFormat,
            _that.primaryLanguage,
            _that.themes,
            _that.companyLogoName,
            _that.crossCurrencyRate,
            _that.trnNo,
            _that.status,
            _that.createdByUser,
            _that.createdDateTime,
            _that.updatedByUser,
            _that.updatedDateTime);
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
            @JsonKey(name: 'CompanyName') String companyName,
            @JsonKey(name: 'Country') String country,
            @JsonKey(name: 'BuildingNumber') String buildingNumber,
            @JsonKey(name: 'BlockNumber') String blockNumber,
            @JsonKey(name: 'StreetName') String streetName,
            @JsonKey(name: 'PinCode') String pinCode,
            @JsonKey(name: 'TimeZone') String timeZone,
            @JsonKey(name: 'EmailId') String emailId,
            @JsonKey(name: 'MobileNumber') String mobileNumber,
            @JsonKey(name: 'PhoneNumber') String phoneNumber,
            @JsonKey(name: 'CompanyLogo') String companyLogo,
            @JsonKey(name: 'BaseCurrency') String baseCurrency,
            @JsonKey(name: 'PrimaryBaseCurrency') String primaryBaseCurrency,
            @JsonKey(name: 'CrossCurrency') String crossCurrency,
            @JsonKey(name: 'NumberFormat') String numberFormat,
            @JsonKey(name: 'DateFormat') String dateFormat,
            @JsonKey(name: 'PrimaryLanguage') String primaryLanguage,
            @JsonKey(name: 'Themes') int themes,
            @JsonKey(name: 'CompanyLogoName') String companyLogoName,
            @JsonKey(name: 'CrossCurrencyRate') String crossCurrencyRate,
            @JsonKey(name: 'TrnNo') String trnNo,
            @JsonKey(name: 'Status') String status,
            @JsonKey(name: 'CreatedByUser') String createdByUser,
            @JsonKey(name: 'CreatedDateTime') String createdDateTime,
            @JsonKey(name: 'UpdatedByUser') String updatedByUser,
            @JsonKey(name: 'UpdatedDateTime') String updatedDateTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CompanySettings() when $default != null:
        return $default(
            _that.companyName,
            _that.country,
            _that.buildingNumber,
            _that.blockNumber,
            _that.streetName,
            _that.pinCode,
            _that.timeZone,
            _that.emailId,
            _that.mobileNumber,
            _that.phoneNumber,
            _that.companyLogo,
            _that.baseCurrency,
            _that.primaryBaseCurrency,
            _that.crossCurrency,
            _that.numberFormat,
            _that.dateFormat,
            _that.primaryLanguage,
            _that.themes,
            _that.companyLogoName,
            _that.crossCurrencyRate,
            _that.trnNo,
            _that.status,
            _that.createdByUser,
            _that.createdDateTime,
            _that.updatedByUser,
            _that.updatedDateTime);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CompanySettings implements CompanySettings {
  const _CompanySettings(
      {@JsonKey(name: 'CompanyName') this.companyName = '',
      @JsonKey(name: 'Country') this.country = '',
      @JsonKey(name: 'BuildingNumber') this.buildingNumber = '',
      @JsonKey(name: 'BlockNumber') this.blockNumber = '',
      @JsonKey(name: 'StreetName') this.streetName = '',
      @JsonKey(name: 'PinCode') this.pinCode = '',
      @JsonKey(name: 'TimeZone') this.timeZone = '',
      @JsonKey(name: 'EmailId') this.emailId = '',
      @JsonKey(name: 'MobileNumber') this.mobileNumber = '',
      @JsonKey(name: 'PhoneNumber') this.phoneNumber = '',
      @JsonKey(name: 'CompanyLogo') this.companyLogo = '',
      @JsonKey(name: 'BaseCurrency') this.baseCurrency = '',
      @JsonKey(name: 'PrimaryBaseCurrency') this.primaryBaseCurrency = '',
      @JsonKey(name: 'CrossCurrency') this.crossCurrency = '',
      @JsonKey(name: 'NumberFormat') this.numberFormat = '',
      @JsonKey(name: 'DateFormat') this.dateFormat = '',
      @JsonKey(name: 'PrimaryLanguage') this.primaryLanguage = '',
      @JsonKey(name: 'Themes') this.themes = 0,
      @JsonKey(name: 'CompanyLogoName') this.companyLogoName = '',
      @JsonKey(name: 'CrossCurrencyRate') this.crossCurrencyRate = '',
      @JsonKey(name: 'TrnNo') this.trnNo = '',
      @JsonKey(name: 'Status') this.status = '',
      @JsonKey(name: 'CreatedByUser') this.createdByUser = '',
      @JsonKey(name: 'CreatedDateTime') this.createdDateTime = '',
      @JsonKey(name: 'UpdatedByUser') this.updatedByUser = '',
      @JsonKey(name: 'UpdatedDateTime') this.updatedDateTime = ''});
  factory _CompanySettings.fromJson(Map<String, dynamic> json) =>
      _$CompanySettingsFromJson(json);

  @override
  @JsonKey(name: 'CompanyName')
  final String companyName;
  @override
  @JsonKey(name: 'Country')
  final String country;
  @override
  @JsonKey(name: 'BuildingNumber')
  final String buildingNumber;
  @override
  @JsonKey(name: 'BlockNumber')
  final String blockNumber;
  @override
  @JsonKey(name: 'StreetName')
  final String streetName;
  @override
  @JsonKey(name: 'PinCode')
  final String pinCode;
  @override
  @JsonKey(name: 'TimeZone')
  final String timeZone;
  @override
  @JsonKey(name: 'EmailId')
  final String emailId;
  @override
  @JsonKey(name: 'MobileNumber')
  final String mobileNumber;
  @override
  @JsonKey(name: 'PhoneNumber')
  final String phoneNumber;
  @override
  @JsonKey(name: 'CompanyLogo')
  final String companyLogo;
  @override
  @JsonKey(name: 'BaseCurrency')
  final String baseCurrency;
  @override
  @JsonKey(name: 'PrimaryBaseCurrency')
  final String primaryBaseCurrency;
  @override
  @JsonKey(name: 'CrossCurrency')
  final String crossCurrency;
  @override
  @JsonKey(name: 'NumberFormat')
  final String numberFormat;
  @override
  @JsonKey(name: 'DateFormat')
  final String dateFormat;
  @override
  @JsonKey(name: 'PrimaryLanguage')
  final String primaryLanguage;
  @override
  @JsonKey(name: 'Themes')
  final int themes;
  @override
  @JsonKey(name: 'CompanyLogoName')
  final String companyLogoName;
  @override
  @JsonKey(name: 'CrossCurrencyRate')
  final String crossCurrencyRate;
  @override
  @JsonKey(name: 'TrnNo')
  final String trnNo;
  @override
  @JsonKey(name: 'Status')
  final String status;
  @override
  @JsonKey(name: 'CreatedByUser')
  final String createdByUser;
  @override
  @JsonKey(name: 'CreatedDateTime')
  final String createdDateTime;
  @override
  @JsonKey(name: 'UpdatedByUser')
  final String updatedByUser;
  @override
  @JsonKey(name: 'UpdatedDateTime')
  final String updatedDateTime;

  /// Create a copy of CompanySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CompanySettingsCopyWith<_CompanySettings> get copyWith =>
      __$CompanySettingsCopyWithImpl<_CompanySettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CompanySettingsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompanySettings &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.buildingNumber, buildingNumber) ||
                other.buildingNumber == buildingNumber) &&
            (identical(other.blockNumber, blockNumber) ||
                other.blockNumber == blockNumber) &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.companyLogo, companyLogo) ||
                other.companyLogo == companyLogo) &&
            (identical(other.baseCurrency, baseCurrency) ||
                other.baseCurrency == baseCurrency) &&
            (identical(other.primaryBaseCurrency, primaryBaseCurrency) ||
                other.primaryBaseCurrency == primaryBaseCurrency) &&
            (identical(other.crossCurrency, crossCurrency) ||
                other.crossCurrency == crossCurrency) &&
            (identical(other.numberFormat, numberFormat) ||
                other.numberFormat == numberFormat) &&
            (identical(other.dateFormat, dateFormat) ||
                other.dateFormat == dateFormat) &&
            (identical(other.primaryLanguage, primaryLanguage) ||
                other.primaryLanguage == primaryLanguage) &&
            (identical(other.themes, themes) || other.themes == themes) &&
            (identical(other.companyLogoName, companyLogoName) ||
                other.companyLogoName == companyLogoName) &&
            (identical(other.crossCurrencyRate, crossCurrencyRate) ||
                other.crossCurrencyRate == crossCurrencyRate) &&
            (identical(other.trnNo, trnNo) || other.trnNo == trnNo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdByUser, createdByUser) ||
                other.createdByUser == createdByUser) &&
            (identical(other.createdDateTime, createdDateTime) ||
                other.createdDateTime == createdDateTime) &&
            (identical(other.updatedByUser, updatedByUser) ||
                other.updatedByUser == updatedByUser) &&
            (identical(other.updatedDateTime, updatedDateTime) ||
                other.updatedDateTime == updatedDateTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        companyName,
        country,
        buildingNumber,
        blockNumber,
        streetName,
        pinCode,
        timeZone,
        emailId,
        mobileNumber,
        phoneNumber,
        companyLogo,
        baseCurrency,
        primaryBaseCurrency,
        crossCurrency,
        numberFormat,
        dateFormat,
        primaryLanguage,
        themes,
        companyLogoName,
        crossCurrencyRate,
        trnNo,
        status,
        createdByUser,
        createdDateTime,
        updatedByUser,
        updatedDateTime
      ]);

  @override
  String toString() {
    return 'CompanySettings(companyName: $companyName, country: $country, buildingNumber: $buildingNumber, blockNumber: $blockNumber, streetName: $streetName, pinCode: $pinCode, timeZone: $timeZone, emailId: $emailId, mobileNumber: $mobileNumber, phoneNumber: $phoneNumber, companyLogo: $companyLogo, baseCurrency: $baseCurrency, primaryBaseCurrency: $primaryBaseCurrency, crossCurrency: $crossCurrency, numberFormat: $numberFormat, dateFormat: $dateFormat, primaryLanguage: $primaryLanguage, themes: $themes, companyLogoName: $companyLogoName, crossCurrencyRate: $crossCurrencyRate, trnNo: $trnNo, status: $status, createdByUser: $createdByUser, createdDateTime: $createdDateTime, updatedByUser: $updatedByUser, updatedDateTime: $updatedDateTime)';
  }
}

/// @nodoc
abstract mixin class _$CompanySettingsCopyWith<$Res>
    implements $CompanySettingsCopyWith<$Res> {
  factory _$CompanySettingsCopyWith(
          _CompanySettings value, $Res Function(_CompanySettings) _then) =
      __$CompanySettingsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CompanyName') String companyName,
      @JsonKey(name: 'Country') String country,
      @JsonKey(name: 'BuildingNumber') String buildingNumber,
      @JsonKey(name: 'BlockNumber') String blockNumber,
      @JsonKey(name: 'StreetName') String streetName,
      @JsonKey(name: 'PinCode') String pinCode,
      @JsonKey(name: 'TimeZone') String timeZone,
      @JsonKey(name: 'EmailId') String emailId,
      @JsonKey(name: 'MobileNumber') String mobileNumber,
      @JsonKey(name: 'PhoneNumber') String phoneNumber,
      @JsonKey(name: 'CompanyLogo') String companyLogo,
      @JsonKey(name: 'BaseCurrency') String baseCurrency,
      @JsonKey(name: 'PrimaryBaseCurrency') String primaryBaseCurrency,
      @JsonKey(name: 'CrossCurrency') String crossCurrency,
      @JsonKey(name: 'NumberFormat') String numberFormat,
      @JsonKey(name: 'DateFormat') String dateFormat,
      @JsonKey(name: 'PrimaryLanguage') String primaryLanguage,
      @JsonKey(name: 'Themes') int themes,
      @JsonKey(name: 'CompanyLogoName') String companyLogoName,
      @JsonKey(name: 'CrossCurrencyRate') String crossCurrencyRate,
      @JsonKey(name: 'TrnNo') String trnNo,
      @JsonKey(name: 'Status') String status,
      @JsonKey(name: 'CreatedByUser') String createdByUser,
      @JsonKey(name: 'CreatedDateTime') String createdDateTime,
      @JsonKey(name: 'UpdatedByUser') String updatedByUser,
      @JsonKey(name: 'UpdatedDateTime') String updatedDateTime});
}

/// @nodoc
class __$CompanySettingsCopyWithImpl<$Res>
    implements _$CompanySettingsCopyWith<$Res> {
  __$CompanySettingsCopyWithImpl(this._self, this._then);

  final _CompanySettings _self;
  final $Res Function(_CompanySettings) _then;

  /// Create a copy of CompanySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? companyName = null,
    Object? country = null,
    Object? buildingNumber = null,
    Object? blockNumber = null,
    Object? streetName = null,
    Object? pinCode = null,
    Object? timeZone = null,
    Object? emailId = null,
    Object? mobileNumber = null,
    Object? phoneNumber = null,
    Object? companyLogo = null,
    Object? baseCurrency = null,
    Object? primaryBaseCurrency = null,
    Object? crossCurrency = null,
    Object? numberFormat = null,
    Object? dateFormat = null,
    Object? primaryLanguage = null,
    Object? themes = null,
    Object? companyLogoName = null,
    Object? crossCurrencyRate = null,
    Object? trnNo = null,
    Object? status = null,
    Object? createdByUser = null,
    Object? createdDateTime = null,
    Object? updatedByUser = null,
    Object? updatedDateTime = null,
  }) {
    return _then(_CompanySettings(
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      buildingNumber: null == buildingNumber
          ? _self.buildingNumber
          : buildingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      blockNumber: null == blockNumber
          ? _self.blockNumber
          : blockNumber // ignore: cast_nullable_to_non_nullable
              as String,
      streetName: null == streetName
          ? _self.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String,
      pinCode: null == pinCode
          ? _self.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _self.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      emailId: null == emailId
          ? _self.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      companyLogo: null == companyLogo
          ? _self.companyLogo
          : companyLogo // ignore: cast_nullable_to_non_nullable
              as String,
      baseCurrency: null == baseCurrency
          ? _self.baseCurrency
          : baseCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      primaryBaseCurrency: null == primaryBaseCurrency
          ? _self.primaryBaseCurrency
          : primaryBaseCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      crossCurrency: null == crossCurrency
          ? _self.crossCurrency
          : crossCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      numberFormat: null == numberFormat
          ? _self.numberFormat
          : numberFormat // ignore: cast_nullable_to_non_nullable
              as String,
      dateFormat: null == dateFormat
          ? _self.dateFormat
          : dateFormat // ignore: cast_nullable_to_non_nullable
              as String,
      primaryLanguage: null == primaryLanguage
          ? _self.primaryLanguage
          : primaryLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      themes: null == themes
          ? _self.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as int,
      companyLogoName: null == companyLogoName
          ? _self.companyLogoName
          : companyLogoName // ignore: cast_nullable_to_non_nullable
              as String,
      crossCurrencyRate: null == crossCurrencyRate
          ? _self.crossCurrencyRate
          : crossCurrencyRate // ignore: cast_nullable_to_non_nullable
              as String,
      trnNo: null == trnNo
          ? _self.trnNo
          : trnNo // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdByUser: null == createdByUser
          ? _self.createdByUser
          : createdByUser // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateTime: null == createdDateTime
          ? _self.createdDateTime
          : createdDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      updatedByUser: null == updatedByUser
          ? _self.updatedByUser
          : updatedByUser // ignore: cast_nullable_to_non_nullable
              as String,
      updatedDateTime: null == updatedDateTime
          ? _self.updatedDateTime
          : updatedDateTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
