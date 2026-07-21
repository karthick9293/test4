// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debit_bank_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DebitBankBV> _$debitBankBVSerializer = _$DebitBankBVSerializer();

class _$DebitBankBVSerializer implements StructuredSerializer<DebitBankBV> {
  @override
  final Iterable<Type> types = const [DebitBankBV, _$DebitBankBV];
  @override
  final String wireName = 'DebitBankBV';

  @override
  Iterable<Object?> serialize(Serializers serializers, DebitBankBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'paymentModeKey',
      serializers.serialize(object.paymentModeKey,
          specifiedType: const FullType(String)),
      'debitBankRefCode',
      serializers.serialize(object.debitBankRefCode,
          specifiedType: const FullType(String)),
      'bankDescription',
      serializers.serialize(object.bankDescription,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.corrOrgCode;
    if (value != null) {
      result
        ..add('corrOrgCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mobPayServCode;
    if (value != null) {
      result
        ..add('mobPayServCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DebitBankBV deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DebitBankBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'paymentModeKey':
          result.paymentModeKey = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'debitBankRefCode':
          result.debitBankRefCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'bankDescription':
          result.bankDescription = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'corrOrgCode':
          result.corrOrgCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mobPayServCode':
          result.mobPayServCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DebitBankBV extends DebitBankBV {
  @override
  final String paymentModeKey;
  @override
  final String debitBankRefCode;
  @override
  final String bankDescription;
  @override
  final String? corrOrgCode;
  @override
  final String? mobPayServCode;

  factory _$DebitBankBV([void Function(DebitBankBVBuilder)? updates]) =>
      (DebitBankBVBuilder()..update(updates))._build();

  _$DebitBankBV._(
      {required this.paymentModeKey,
      required this.debitBankRefCode,
      required this.bankDescription,
      this.corrOrgCode,
      this.mobPayServCode})
      : super._();
  @override
  DebitBankBV rebuild(void Function(DebitBankBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DebitBankBVBuilder toBuilder() => DebitBankBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DebitBankBV &&
        paymentModeKey == other.paymentModeKey &&
        debitBankRefCode == other.debitBankRefCode &&
        bankDescription == other.bankDescription &&
        corrOrgCode == other.corrOrgCode &&
        mobPayServCode == other.mobPayServCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, paymentModeKey.hashCode);
    _$hash = $jc(_$hash, debitBankRefCode.hashCode);
    _$hash = $jc(_$hash, bankDescription.hashCode);
    _$hash = $jc(_$hash, corrOrgCode.hashCode);
    _$hash = $jc(_$hash, mobPayServCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DebitBankBV')
          ..add('paymentModeKey', paymentModeKey)
          ..add('debitBankRefCode', debitBankRefCode)
          ..add('bankDescription', bankDescription)
          ..add('corrOrgCode', corrOrgCode)
          ..add('mobPayServCode', mobPayServCode))
        .toString();
  }
}

class DebitBankBVBuilder implements Builder<DebitBankBV, DebitBankBVBuilder> {
  _$DebitBankBV? _$v;

  String? _paymentModeKey;
  String? get paymentModeKey => _$this._paymentModeKey;
  set paymentModeKey(String? paymentModeKey) =>
      _$this._paymentModeKey = paymentModeKey;

  String? _debitBankRefCode;
  String? get debitBankRefCode => _$this._debitBankRefCode;
  set debitBankRefCode(String? debitBankRefCode) =>
      _$this._debitBankRefCode = debitBankRefCode;

  String? _bankDescription;
  String? get bankDescription => _$this._bankDescription;
  set bankDescription(String? bankDescription) =>
      _$this._bankDescription = bankDescription;

  String? _corrOrgCode;
  String? get corrOrgCode => _$this._corrOrgCode;
  set corrOrgCode(String? corrOrgCode) => _$this._corrOrgCode = corrOrgCode;

  String? _mobPayServCode;
  String? get mobPayServCode => _$this._mobPayServCode;
  set mobPayServCode(String? mobPayServCode) =>
      _$this._mobPayServCode = mobPayServCode;

  DebitBankBVBuilder();

  DebitBankBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _paymentModeKey = $v.paymentModeKey;
      _debitBankRefCode = $v.debitBankRefCode;
      _bankDescription = $v.bankDescription;
      _corrOrgCode = $v.corrOrgCode;
      _mobPayServCode = $v.mobPayServCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DebitBankBV other) {
    _$v = other as _$DebitBankBV;
  }

  @override
  void update(void Function(DebitBankBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DebitBankBV build() => _build();

  _$DebitBankBV _build() {
    final _$result = _$v ??
        _$DebitBankBV._(
          paymentModeKey: BuiltValueNullFieldError.checkNotNull(
              paymentModeKey, r'DebitBankBV', 'paymentModeKey'),
          debitBankRefCode: BuiltValueNullFieldError.checkNotNull(
              debitBankRefCode, r'DebitBankBV', 'debitBankRefCode'),
          bankDescription: BuiltValueNullFieldError.checkNotNull(
              bankDescription, r'DebitBankBV', 'bankDescription'),
          corrOrgCode: corrOrgCode,
          mobPayServCode: mobPayServCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
