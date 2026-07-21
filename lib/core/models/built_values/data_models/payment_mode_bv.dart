library;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers.dart';

part 'payment_mode_bv.g.dart';

abstract class PaymentModeBV implements Built<PaymentModeBV, PaymentModeBVBuilder> {
  @BuiltValueField(wireName: "id")
  String get id;

  @BuiltValueField(wireName: "type")
  String get type;

  @BuiltValueField(wireName: "description")
  String get description;

  @BuiltValueField(wireName: "baseUrl")
  String get baseUrl;

  @BuiltValueField(wireName: "currencyFlagPath")
  String? get currencyFlagPath;

  @BuiltValueField(wireName: "imagePath")
  String get imagePath;

  @BuiltValueField(wireName: "mobPayServCode")
  String? get mobPayServCode;

  @BuiltValueField(wireName: "paymentKey")
  String? get paymentKey;

  @BuiltValueField(wireName: "recommended")
  String? get recommended;

  PaymentModeBV._();

  factory PaymentModeBV([void Function(PaymentModeBVBuilder) updates]) = _$PaymentModeBV;

  String toJson() {
    return json.encode(serializers.serializeWith(PaymentModeBV.serializer, this));
  }

  static PaymentModeBV? fromJson(String jsonString) {
    return serializers.deserializeWith(PaymentModeBV.serializer, json.decode(jsonString));
  }

  static PaymentModeBV? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      PaymentModeBV.serializer,
      map,
    );
  }

  static Serializer<PaymentModeBV> get serializer => _$paymentModeBVSerializer;
}
