// library;
//
// import 'dart:convert';
//
// import 'package:built_value/built_value.dart';
// import 'package:built_value/serializer.dart';
//
// import '../serializers.dart';
//
// part 'language_bv.g.dart';
//
// abstract class LanguageBV implements Built<LanguageBV, LanguageBVBuilder> {
//   @BuiltValueField(wireName: "language_code")
//   String get languageCode;
//
//   @BuiltValueField(wireName: "country_code")
//   String get countryCode;
//
//   @BuiltValueField(wireName: "description")
//   String get description;
//
//   @BuiltValueField(wireName: "main_code")
//   String get mainCode;
//
//   LanguageBV._();
//
//   factory LanguageBV([void Function(LanguageBVBuilder) updates]) = _$LanguageBV;
//
//   String toJson() {
//     return json.encode(serializers.serializeWith(LanguageBV.serializer, this));
//   }
//
//   static LanguageBV? fromJson(String jsonString) {
//     return serializers.deserializeWith(LanguageBV.serializer, json.decode(jsonString));
//   }
//
//   static LanguageBV? fromMap(Map<String, dynamic> map) {
//     return serializers.deserializeWith(
//       LanguageBV.serializer,
//       map,
//     );
//   }
//
//   static Serializer<LanguageBV> get serializer => _$languageBVSerializer;
// }
