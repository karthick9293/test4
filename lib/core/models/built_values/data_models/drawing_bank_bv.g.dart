// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawing_bank_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DrawingBankBV> _$drawingBankBVSerializer =
    _$DrawingBankBVSerializer();

class _$DrawingBankBVSerializer implements StructuredSerializer<DrawingBankBV> {
  @override
  final Iterable<Type> types = const [DrawingBankBV, _$DrawingBankBV];
  @override
  final String wireName = 'DrawingBankBV';

  @override
  Iterable<Object?> serialize(Serializers serializers, DrawingBankBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'payBankCode',
      serializers.serialize(object.payBankCode,
          specifiedType: const FullType(String)),
      'payBankName',
      serializers.serialize(object.payBankName,
          specifiedType: const FullType(String)),
      'payAccountNumbers',
      serializers.serialize(object.payAccountNumbers,
          specifiedType: const FullType(
              BuiltList, const [const FullType(PayAccountNumberBV)])),
    ];

    return result;
  }

  @override
  DrawingBankBV deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = DrawingBankBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'payBankCode':
          result.payBankCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'payBankName':
          result.payBankName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'payAccountNumbers':
          result.payAccountNumbers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PayAccountNumberBV)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$DrawingBankBV extends DrawingBankBV {
  @override
  final String payBankCode;
  @override
  final String payBankName;
  @override
  final BuiltList<PayAccountNumberBV> payAccountNumbers;

  factory _$DrawingBankBV([void Function(DrawingBankBVBuilder)? updates]) =>
      (DrawingBankBVBuilder()..update(updates))._build();

  _$DrawingBankBV._(
      {required this.payBankCode,
      required this.payBankName,
      required this.payAccountNumbers})
      : super._();
  @override
  DrawingBankBV rebuild(void Function(DrawingBankBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DrawingBankBVBuilder toBuilder() => DrawingBankBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DrawingBankBV &&
        payBankCode == other.payBankCode &&
        payBankName == other.payBankName &&
        payAccountNumbers == other.payAccountNumbers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, payBankCode.hashCode);
    _$hash = $jc(_$hash, payBankName.hashCode);
    _$hash = $jc(_$hash, payAccountNumbers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DrawingBankBV')
          ..add('payBankCode', payBankCode)
          ..add('payBankName', payBankName)
          ..add('payAccountNumbers', payAccountNumbers))
        .toString();
  }
}

class DrawingBankBVBuilder
    implements Builder<DrawingBankBV, DrawingBankBVBuilder> {
  _$DrawingBankBV? _$v;

  String? _payBankCode;
  String? get payBankCode => _$this._payBankCode;
  set payBankCode(String? payBankCode) => _$this._payBankCode = payBankCode;

  String? _payBankName;
  String? get payBankName => _$this._payBankName;
  set payBankName(String? payBankName) => _$this._payBankName = payBankName;

  ListBuilder<PayAccountNumberBV>? _payAccountNumbers;
  ListBuilder<PayAccountNumberBV> get payAccountNumbers =>
      _$this._payAccountNumbers ??= ListBuilder<PayAccountNumberBV>();
  set payAccountNumbers(ListBuilder<PayAccountNumberBV>? payAccountNumbers) =>
      _$this._payAccountNumbers = payAccountNumbers;

  DrawingBankBVBuilder();

  DrawingBankBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _payBankCode = $v.payBankCode;
      _payBankName = $v.payBankName;
      _payAccountNumbers = $v.payAccountNumbers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DrawingBankBV other) {
    _$v = other as _$DrawingBankBV;
  }

  @override
  void update(void Function(DrawingBankBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DrawingBankBV build() => _build();

  _$DrawingBankBV _build() {
    _$DrawingBankBV _$result;
    try {
      _$result = _$v ??
          _$DrawingBankBV._(
            payBankCode: BuiltValueNullFieldError.checkNotNull(
                payBankCode, r'DrawingBankBV', 'payBankCode'),
            payBankName: BuiltValueNullFieldError.checkNotNull(
                payBankName, r'DrawingBankBV', 'payBankName'),
            payAccountNumbers: payAccountNumbers.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'payAccountNumbers';
        payAccountNumbers.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DrawingBankBV', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
