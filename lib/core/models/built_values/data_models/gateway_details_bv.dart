library;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers.dart';

part 'gateway_details_bv.g.dart';

abstract class GatewayDetailsBV implements Built<GatewayDetailsBV, GatewayDetailsBVBuilder> {
  @BuiltValueField(wireName: "PG_REDIRECT_URL")
  String get pgRedcirectURL;

  @BuiltValueField(wireName: "Amount")
  String get amount;

  @BuiltValueField(wireName: "CurrencyCode")
  String get currencyCode;

  @BuiltValueField(wireName: "PUN")
  String get pun;

  @BuiltValueField(wireName: "MerchantModuleSessionID")
  String get merchantModuleSessionID;

  @BuiltValueField(wireName: "PaymentDescription")
  String get paymentDescription;

  @BuiltValueField(wireName: "NationalID")
  String get nationalID;

  @BuiltValueField(wireName: "MerchantID")
  String get merchantID;

  @BuiltValueField(wireName: "BankID")
  String get bankID;

  @BuiltValueField(wireName: "Action")
  String get action;

  @BuiltValueField(wireName: "Lang")
  String get lang;

  @BuiltValueField(wireName: "SecureHash")
  String get secureHash;

  @BuiltValueField(wireName: "TransactionRequestDate")
  String get transactionRequestDate;

  @BuiltValueField(wireName: "ExtraFields_f3")
  String get extraFieldsF3;

  @BuiltValueField(wireName: "ExtraFields_f14")
  String get extraFieldsF14;

  @BuiltValueField(wireName: "Quantity")
  String get quantity;

  GatewayDetailsBV._();

  factory GatewayDetailsBV([void Function(GatewayDetailsBVBuilder) updates]) = _$GatewayDetailsBV;

  String toJson() {
    return json.encode(serializers.serializeWith(GatewayDetailsBV.serializer, this));
  }

  static GatewayDetailsBV? fromJson(String jsonString) {
    return serializers.deserializeWith(GatewayDetailsBV.serializer, json.decode(jsonString));
  }

  static GatewayDetailsBV? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(GatewayDetailsBV.serializer, map);
  }

  static Serializer<GatewayDetailsBV> get serializer => _$gatewayDetailsBVSerializer;
}
