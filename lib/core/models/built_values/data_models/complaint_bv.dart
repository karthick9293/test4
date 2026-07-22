library;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers.dart';

part 'complaint_bv.g.dart';

abstract class ComplaintBV implements Built<ComplaintBV, ComplaintBVBuilder> {
  ComplaintBV._();

  @BuiltValueField(wireName: 'statusCode')
  String get statusCode;

  @BuiltValueField(wireName: 'message')
  String get message;

  factory ComplaintBV([void Function(ComplaintBVBuilder) updates]) = _$ComplaintBV;

  String toJson() {
    return json.encode(serializers.serializeWith(ComplaintBV.serializer, this));
  }

  static ComplaintBV? fromJson(String jsonString) {
    return serializers.deserializeWith(ComplaintBV.serializer, json.decode(jsonString));
  }

  static ComplaintBV? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(ComplaintBV.serializer, map);
  }

  static Serializer<ComplaintBV> get serializer => _$complaintBVSerializer;
}
