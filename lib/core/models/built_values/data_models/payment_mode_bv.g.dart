// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_mode_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaymentModeBV> _$paymentModeBVSerializer =
    _$PaymentModeBVSerializer();

class _$PaymentModeBVSerializer implements StructuredSerializer<PaymentModeBV> {
  @override
  final Iterable<Type> types = const [PaymentModeBV, _$PaymentModeBV];
  @override
  final String wireName = 'PaymentModeBV';

  @override
  Iterable<Object?> serialize(Serializers serializers, PaymentModeBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'baseUrl',
      serializers.serialize(object.baseUrl,
          specifiedType: const FullType(String)),
      'imagePath',
      serializers.serialize(object.imagePath,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.currencyFlagPath;
    if (value != null) {
      result
        ..add('currencyFlagPath')
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
    value = object.paymentKey;
    if (value != null) {
      result
        ..add('paymentKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.recommended;
    if (value != null) {
      result
        ..add('recommended')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PaymentModeBV deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PaymentModeBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'baseUrl':
          result.baseUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'currencyFlagPath':
          result.currencyFlagPath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'imagePath':
          result.imagePath = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'mobPayServCode':
          result.mobPayServCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'paymentKey':
          result.paymentKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'recommended':
          result.recommended = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PaymentModeBV extends PaymentModeBV {
  @override
  final String id;
  @override
  final String type;
  @override
  final String description;
  @override
  final String baseUrl;
  @override
  final String? currencyFlagPath;
  @override
  final String imagePath;
  @override
  final String? mobPayServCode;
  @override
  final String? paymentKey;
  @override
  final String? recommended;

  factory _$PaymentModeBV([void Function(PaymentModeBVBuilder)? updates]) =>
      (PaymentModeBVBuilder()..update(updates))._build();

  _$PaymentModeBV._(
      {required this.id,
      required this.type,
      required this.description,
      required this.baseUrl,
      this.currencyFlagPath,
      required this.imagePath,
      this.mobPayServCode,
      this.paymentKey,
      this.recommended})
      : super._();
  @override
  PaymentModeBV rebuild(void Function(PaymentModeBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaymentModeBVBuilder toBuilder() => PaymentModeBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaymentModeBV &&
        id == other.id &&
        type == other.type &&
        description == other.description &&
        baseUrl == other.baseUrl &&
        currencyFlagPath == other.currencyFlagPath &&
        imagePath == other.imagePath &&
        mobPayServCode == other.mobPayServCode &&
        paymentKey == other.paymentKey &&
        recommended == other.recommended;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, baseUrl.hashCode);
    _$hash = $jc(_$hash, currencyFlagPath.hashCode);
    _$hash = $jc(_$hash, imagePath.hashCode);
    _$hash = $jc(_$hash, mobPayServCode.hashCode);
    _$hash = $jc(_$hash, paymentKey.hashCode);
    _$hash = $jc(_$hash, recommended.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaymentModeBV')
          ..add('id', id)
          ..add('type', type)
          ..add('description', description)
          ..add('baseUrl', baseUrl)
          ..add('currencyFlagPath', currencyFlagPath)
          ..add('imagePath', imagePath)
          ..add('mobPayServCode', mobPayServCode)
          ..add('paymentKey', paymentKey)
          ..add('recommended', recommended))
        .toString();
  }
}

class PaymentModeBVBuilder
    implements Builder<PaymentModeBV, PaymentModeBVBuilder> {
  _$PaymentModeBV? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _baseUrl;
  String? get baseUrl => _$this._baseUrl;
  set baseUrl(String? baseUrl) => _$this._baseUrl = baseUrl;

  String? _currencyFlagPath;
  String? get currencyFlagPath => _$this._currencyFlagPath;
  set currencyFlagPath(String? currencyFlagPath) =>
      _$this._currencyFlagPath = currencyFlagPath;

  String? _imagePath;
  String? get imagePath => _$this._imagePath;
  set imagePath(String? imagePath) => _$this._imagePath = imagePath;

  String? _mobPayServCode;
  String? get mobPayServCode => _$this._mobPayServCode;
  set mobPayServCode(String? mobPayServCode) =>
      _$this._mobPayServCode = mobPayServCode;

  String? _paymentKey;
  String? get paymentKey => _$this._paymentKey;
  set paymentKey(String? paymentKey) => _$this._paymentKey = paymentKey;

  String? _recommended;
  String? get recommended => _$this._recommended;
  set recommended(String? recommended) => _$this._recommended = recommended;

  PaymentModeBVBuilder();

  PaymentModeBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _type = $v.type;
      _description = $v.description;
      _baseUrl = $v.baseUrl;
      _currencyFlagPath = $v.currencyFlagPath;
      _imagePath = $v.imagePath;
      _mobPayServCode = $v.mobPayServCode;
      _paymentKey = $v.paymentKey;
      _recommended = $v.recommended;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaymentModeBV other) {
    _$v = other as _$PaymentModeBV;
  }

  @override
  void update(void Function(PaymentModeBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaymentModeBV build() => _build();

  _$PaymentModeBV _build() {
    final _$result = _$v ??
        _$PaymentModeBV._(
          id: BuiltValueNullFieldError.checkNotNull(id, r'PaymentModeBV', 'id'),
          type: BuiltValueNullFieldError.checkNotNull(
              type, r'PaymentModeBV', 'type'),
          description: BuiltValueNullFieldError.checkNotNull(
              description, r'PaymentModeBV', 'description'),
          baseUrl: BuiltValueNullFieldError.checkNotNull(
              baseUrl, r'PaymentModeBV', 'baseUrl'),
          currencyFlagPath: currencyFlagPath,
          imagePath: BuiltValueNullFieldError.checkNotNull(
              imagePath, r'PaymentModeBV', 'imagePath'),
          mobPayServCode: mobPayServCode,
          paymentKey: paymentKey,
          recommended: recommended,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
