library;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers.dart';

part 'pay_account_number_bv.g.dart';

abstract class PayAccountNumberBV implements Built<PayAccountNumberBV, PayAccountNumberBVBuilder> {
  @BuiltValueField(wireName: "payAccountNumber")
  String get payAccountNumber;

  PayAccountNumberBV._();

  factory PayAccountNumberBV([void Function(PayAccountNumberBVBuilder) updates]) = _$PayAccountNumberBV;

  String toJson() {
    return json.encode(serializers.serializeWith(PayAccountNumberBV.serializer, this));
  }

  static PayAccountNumberBV? fromJson(String jsonString) {
    return serializers.deserializeWith(PayAccountNumberBV.serializer, json.decode(jsonString));
  }

  static PayAccountNumberBV? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      PayAccountNumberBV.serializer,
      map,
    );
  }

  static Serializer<PayAccountNumberBV> get serializer => _$payAccountNumberBVSerializer;
}
