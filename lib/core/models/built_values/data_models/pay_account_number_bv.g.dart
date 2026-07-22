// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_account_number_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PayAccountNumberBV> _$payAccountNumberBVSerializer =
    _$PayAccountNumberBVSerializer();

class _$PayAccountNumberBVSerializer
    implements StructuredSerializer<PayAccountNumberBV> {
  @override
  final Iterable<Type> types = const [PayAccountNumberBV, _$PayAccountNumberBV];
  @override
  final String wireName = 'PayAccountNumberBV';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PayAccountNumberBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'payAccountNumber',
      serializers.serialize(object.payAccountNumber,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PayAccountNumberBV deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PayAccountNumberBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'payAccountNumber':
          result.payAccountNumber = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PayAccountNumberBV extends PayAccountNumberBV {
  @override
  final String payAccountNumber;

  factory _$PayAccountNumberBV(
          [void Function(PayAccountNumberBVBuilder)? updates]) =>
      (PayAccountNumberBVBuilder()..update(updates))._build();

  _$PayAccountNumberBV._({required this.payAccountNumber}) : super._();
  @override
  PayAccountNumberBV rebuild(
          void Function(PayAccountNumberBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PayAccountNumberBVBuilder toBuilder() =>
      PayAccountNumberBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PayAccountNumberBV &&
        payAccountNumber == other.payAccountNumber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, payAccountNumber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PayAccountNumberBV')
          ..add('payAccountNumber', payAccountNumber))
        .toString();
  }
}

class PayAccountNumberBVBuilder
    implements Builder<PayAccountNumberBV, PayAccountNumberBVBuilder> {
  _$PayAccountNumberBV? _$v;

  String? _payAccountNumber;
  String? get payAccountNumber => _$this._payAccountNumber;
  set payAccountNumber(String? payAccountNumber) =>
      _$this._payAccountNumber = payAccountNumber;

  PayAccountNumberBVBuilder();

  PayAccountNumberBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _payAccountNumber = $v.payAccountNumber;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PayAccountNumberBV other) {
    _$v = other as _$PayAccountNumberBV;
  }

  @override
  void update(void Function(PayAccountNumberBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PayAccountNumberBV build() => _build();

  _$PayAccountNumberBV _build() {
    final _$result = _$v ??
        _$PayAccountNumberBV._(
          payAccountNumber: BuiltValueNullFieldError.checkNotNull(
              payAccountNumber, r'PayAccountNumberBV', 'payAccountNumber'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
