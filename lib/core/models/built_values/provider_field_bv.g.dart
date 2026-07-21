// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_field_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProviderFieldBV> _$providerFieldBVSerializer =
    _$ProviderFieldBVSerializer();

class _$ProviderFieldBVSerializer
    implements StructuredSerializer<ProviderFieldBV> {
  @override
  final Iterable<Type> types = const [ProviderFieldBV, _$ProviderFieldBV];
  @override
  final String wireName = 'ProviderFieldBV';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProviderFieldBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'countryCode',
      serializers.serialize(object.countryCode,
          specifiedType: const FullType(String)),
      'serviceProviderCode',
      serializers.serialize(object.serviceProviderCode,
          specifiedType: const FullType(String)),
      'fieldName',
      serializers.serialize(object.fieldName,
          specifiedType: const FullType(String)),
      'fieldType',
      serializers.serialize(object.fieldType,
          specifiedType: const FullType(String)),
      'dataType',
      serializers.serialize(object.dataType,
          specifiedType: const FullType(String)),
      'dataService',
      serializers.serialize(object.dataService,
          specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ProviderFieldBV deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ProviderFieldBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'countryCode':
          result.countryCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'serviceProviderCode':
          result.serviceProviderCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'fieldName':
          result.fieldName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'fieldType':
          result.fieldType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'dataType':
          result.dataType = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'dataService':
          result.dataService = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProviderFieldBV extends ProviderFieldBV {
  @override
  final String countryCode;
  @override
  final String serviceProviderCode;
  @override
  final String fieldName;
  @override
  final String fieldType;
  @override
  final String dataType;
  @override
  final String dataService;
  @override
  final String displayName;

  factory _$ProviderFieldBV([void Function(ProviderFieldBVBuilder)? updates]) =>
      (ProviderFieldBVBuilder()..update(updates))._build();

  _$ProviderFieldBV._(
      {required this.countryCode,
      required this.serviceProviderCode,
      required this.fieldName,
      required this.fieldType,
      required this.dataType,
      required this.dataService,
      required this.displayName})
      : super._();
  @override
  ProviderFieldBV rebuild(void Function(ProviderFieldBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProviderFieldBVBuilder toBuilder() => ProviderFieldBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProviderFieldBV &&
        countryCode == other.countryCode &&
        serviceProviderCode == other.serviceProviderCode &&
        fieldName == other.fieldName &&
        fieldType == other.fieldType &&
        dataType == other.dataType &&
        dataService == other.dataService &&
        displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, countryCode.hashCode);
    _$hash = $jc(_$hash, serviceProviderCode.hashCode);
    _$hash = $jc(_$hash, fieldName.hashCode);
    _$hash = $jc(_$hash, fieldType.hashCode);
    _$hash = $jc(_$hash, dataType.hashCode);
    _$hash = $jc(_$hash, dataService.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProviderFieldBV')
          ..add('countryCode', countryCode)
          ..add('serviceProviderCode', serviceProviderCode)
          ..add('fieldName', fieldName)
          ..add('fieldType', fieldType)
          ..add('dataType', dataType)
          ..add('dataService', dataService)
          ..add('displayName', displayName))
        .toString();
  }
}

class ProviderFieldBVBuilder
    implements Builder<ProviderFieldBV, ProviderFieldBVBuilder> {
  _$ProviderFieldBV? _$v;

  String? _countryCode;
  String? get countryCode => _$this._countryCode;
  set countryCode(String? countryCode) => _$this._countryCode = countryCode;

  String? _serviceProviderCode;
  String? get serviceProviderCode => _$this._serviceProviderCode;
  set serviceProviderCode(String? serviceProviderCode) =>
      _$this._serviceProviderCode = serviceProviderCode;

  String? _fieldName;
  String? get fieldName => _$this._fieldName;
  set fieldName(String? fieldName) => _$this._fieldName = fieldName;

  String? _fieldType;
  String? get fieldType => _$this._fieldType;
  set fieldType(String? fieldType) => _$this._fieldType = fieldType;

  String? _dataType;
  String? get dataType => _$this._dataType;
  set dataType(String? dataType) => _$this._dataType = dataType;

  String? _dataService;
  String? get dataService => _$this._dataService;
  set dataService(String? dataService) => _$this._dataService = dataService;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  ProviderFieldBVBuilder();

  ProviderFieldBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _countryCode = $v.countryCode;
      _serviceProviderCode = $v.serviceProviderCode;
      _fieldName = $v.fieldName;
      _fieldType = $v.fieldType;
      _dataType = $v.dataType;
      _dataService = $v.dataService;
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProviderFieldBV other) {
    _$v = other as _$ProviderFieldBV;
  }

  @override
  void update(void Function(ProviderFieldBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProviderFieldBV build() => _build();

  _$ProviderFieldBV _build() {
    final _$result = _$v ??
        _$ProviderFieldBV._(
          countryCode: BuiltValueNullFieldError.checkNotNull(
              countryCode, r'ProviderFieldBV', 'countryCode'),
          serviceProviderCode: BuiltValueNullFieldError.checkNotNull(
              serviceProviderCode, r'ProviderFieldBV', 'serviceProviderCode'),
          fieldName: BuiltValueNullFieldError.checkNotNull(
              fieldName, r'ProviderFieldBV', 'fieldName'),
          fieldType: BuiltValueNullFieldError.checkNotNull(
              fieldType, r'ProviderFieldBV', 'fieldType'),
          dataType: BuiltValueNullFieldError.checkNotNull(
              dataType, r'ProviderFieldBV', 'dataType'),
          dataService: BuiltValueNullFieldError.checkNotNull(
              dataService, r'ProviderFieldBV', 'dataService'),
          displayName: BuiltValueNullFieldError.checkNotNull(
              displayName, r'ProviderFieldBV', 'displayName'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
