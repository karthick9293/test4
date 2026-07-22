library;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers.dart';
import 'pay_account_number_bv.dart';

part 'drawing_bank_bv.g.dart';

abstract class DrawingBankBV implements Built<DrawingBankBV, DrawingBankBVBuilder> {
  @BuiltValueField(wireName: "payBankCode")
  String get payBankCode;

  @BuiltValueField(wireName: "payBankName")
  String get payBankName;

  @BuiltValueField(wireName: "payAccountNumbers")
  BuiltList<PayAccountNumberBV> get payAccountNumbers;

  DrawingBankBV._();

  factory DrawingBankBV([void Function(DrawingBankBVBuilder) updates]) = _$DrawingBankBV;

  String toJson() {
    return json.encode(serializers.serializeWith(DrawingBankBV.serializer, this));
  }

  static DrawingBankBV? fromJson(String jsonString) {
    return serializers.deserializeWith(DrawingBankBV.serializer, json.decode(jsonString));
  }

  static DrawingBankBV? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      DrawingBankBV.serializer,
      map,
    );
  }

  static Serializer<DrawingBankBV> get serializer => _$drawingBankBVSerializer;
}
