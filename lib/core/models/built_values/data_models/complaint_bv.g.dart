// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_bv.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ComplaintBV> _$complaintBVSerializer = _$ComplaintBVSerializer();

class _$ComplaintBVSerializer implements StructuredSerializer<ComplaintBV> {
  @override
  final Iterable<Type> types = const [ComplaintBV, _$ComplaintBV];
  @override
  final String wireName = 'ComplaintBV';

  @override
  Iterable<Object?> serialize(Serializers serializers, ComplaintBV object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'statusCode',
      serializers.serialize(object.statusCode,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ComplaintBV deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ComplaintBVBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'statusCode':
          result.statusCode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ComplaintBV extends ComplaintBV {
  @override
  final String statusCode;
  @override
  final String message;

  factory _$ComplaintBV([void Function(ComplaintBVBuilder)? updates]) =>
      (ComplaintBVBuilder()..update(updates))._build();

  _$ComplaintBV._({required this.statusCode, required this.message})
      : super._();
  @override
  ComplaintBV rebuild(void Function(ComplaintBVBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ComplaintBVBuilder toBuilder() => ComplaintBVBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ComplaintBV &&
        statusCode == other.statusCode &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, statusCode.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ComplaintBV')
          ..add('statusCode', statusCode)
          ..add('message', message))
        .toString();
  }
}

class ComplaintBVBuilder implements Builder<ComplaintBV, ComplaintBVBuilder> {
  _$ComplaintBV? _$v;

  String? _statusCode;
  String? get statusCode => _$this._statusCode;
  set statusCode(String? statusCode) => _$this._statusCode = statusCode;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ComplaintBVBuilder();

  ComplaintBVBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _statusCode = $v.statusCode;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ComplaintBV other) {
    _$v = other as _$ComplaintBV;
  }

  @override
  void update(void Function(ComplaintBVBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ComplaintBV build() => _build();

  _$ComplaintBV _build() {
    final _$result = _$v ??
        _$ComplaintBV._(
          statusCode: BuiltValueNullFieldError.checkNotNull(
              statusCode, r'ComplaintBV', 'statusCode'),
          message: BuiltValueNullFieldError.checkNotNull(
              message, r'ComplaintBV', 'message'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
