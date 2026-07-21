library;

// import 'dart:convert';

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

// import '../serializers.dart';

part 'provider_field_bv.g.dart';

abstract class ProviderFieldBV implements Built<ProviderFieldBV, ProviderFieldBVBuilder> {
  @BuiltValueField(wireName: "countryCode")
  String get countryCode;

  @BuiltValueField(wireName: "serviceProviderCode")
  String get serviceProviderCode;

  @BuiltValueField(wireName: "fieldName")
  String get fieldName;

  @BuiltValueField(wireName: "fieldType")
  String get fieldType;

  @BuiltValueField(wireName: "dataType")
  String get dataType;

  @BuiltValueField(wireName: "dataService")
  String get dataService;

  @BuiltValueField(wireName: "displayName")
  String get displayName;

  ProviderFieldBV._();

  factory ProviderFieldBV([void Function(ProviderFieldBVBuilder) updates]) = _$ProviderFieldBV;

  String toJson() {
    return json.encode(serializers.serializeWith(ProviderFieldBV.serializer, this));
  }

  static ProviderFieldBV? fromJson(String jsonString) {
    return serializers.deserializeWith(ProviderFieldBV.serializer, json.decode(jsonString));
  }

  static ProviderFieldBV? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      ProviderFieldBV.serializer,
      map,
    );
  }

  static Serializer<ProviderFieldBV> get serializer => _$providerFieldBVSerializer;
}
