library;

// import 'dart:convert';

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

// import '../serializers.dart';

part 'debit_bank_bv.g.dart';

abstract class DebitBankBV implements Built<DebitBankBV, DebitBankBVBuilder> {
  @BuiltValueField(wireName: "paymentModeKey")
  String get paymentModeKey;

  @BuiltValueField(wireName: "debitBankRefCode")
  String get debitBankRefCode;

  @BuiltValueField(wireName: "bankDescription")
  String get bankDescription;

  @BuiltValueField(wireName: "corrOrgCode")
  String? get corrOrgCode;

  @BuiltValueField(wireName: "mobPayServCode")
  String? get mobPayServCode;

  DebitBankBV._();

  factory DebitBankBV([void Function(DebitBankBVBuilder) updates]) = _$DebitBankBV;

  String toJson() {
    return json.encode(serializers.serializeWith(DebitBankBV.serializer, this));
  }

  static DebitBankBV? fromJson(String jsonString) {
    return serializers.deserializeWith(DebitBankBV.serializer, json.decode(jsonString));
  }

  static DebitBankBV? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      DebitBankBV.serializer,
      map,
    );
  }

  static Serializer<DebitBankBV> get serializer => _$debitBankBVSerializer;
}
