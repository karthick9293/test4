library;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializers.dart';

part 'notification_bv.g.dart';

abstract class NotificationBV implements Built<NotificationBV, NotificationBVBuilder> {
  @BuiltValueField(wireName: "heading")
  String get heading;

  @BuiltValueField(wireName: "content")
  String get content;

  @BuiltValueField(wireName: "videoType")
  String get videoType;

  @BuiltValueField(wireName: "videoUrl")
  String? get videoUrl;

  @BuiltValueField(wireName: "isRead")
  bool get isRead;

  @BuiltValueField(wireName: "addedDate")
  String? get addedDate;

  @BuiltValueField(wireName: "notificationId")
  String? get notificationId;

  NotificationBV._();

  factory NotificationBV([void Function(NotificationBVBuilder) updates]) = _$NotificationBV;

  String toJson() {
    return json.encode(serializers.serializeWith(NotificationBV.serializer, this));
  }

  static NotificationBV? fromJson(String jsonString) {
    return serializers.deserializeWith(NotificationBV.serializer, json.decode(jsonString));
  }

  static NotificationBV? fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      NotificationBV.serializer,
      map,
    );
  }

  static Serializer<NotificationBV> get serializer => _$notificationBVSerializer;
}
