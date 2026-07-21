import 'package:freezed_annotation/freezed_annotation.dart';

// ignore_for_file: non_constant_identifier_names

part 'custom_message_details_fz.freezed.dart';
part 'custom_message_details_fz.g.dart';

@freezed
abstract class CustomMessageDetailsFZ with _$CustomMessageDetailsFZ {
  const factory CustomMessageDetailsFZ({
    @JsonKey(name: 'MessageCode') @Default('') String MessageCode,
    @JsonKey(name: 'MessageType') @Default('') String MessageType,
    @JsonKey(name: 'MessageHeader') @Default('') String MessageHeader,
    @JsonKey(name: 'MessageDescription') @Default('') String MessageDescription,
  }) = _CustomMessageDetailsFZ;

  factory CustomMessageDetailsFZ.fromJson(Map<String, Object?> json) =>
      _$CustomMessageDetailsFZFromJson(
          json.map((key, value) => MapEntry(key.trim(), value)));

  Map<String, dynamic> toJson();
}
