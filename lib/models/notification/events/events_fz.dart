import 'package:freezed_annotation/freezed_annotation.dart';

part 'events_fz.freezed.dart';
part 'events_fz.g.dart';

@freezed
abstract class EventsFZ with _$EventsFZ {
  const factory EventsFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'EventType') @Default([]) List<EventType> eventType,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetails? customMessageDetails,
  }) = _EventsFZ;

  factory EventsFZ.fromJson(Map<String, Object?> json) => _$EventsFZFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: 'MessageCode') @Default('') String MessageCode,
    @JsonKey(name: 'MessageType') @Default('') String MessageType,
    @JsonKey(name: 'MessageHeader') @Default('') String MessageHeader,
    @JsonKey(name: 'MessageDescription') @Default('') String MessageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) => _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class EventType with _$EventType {
  const factory EventType({
    @JsonKey(name: 'Code') @Default('') String Code,
    @JsonKey(name: 'Description') @Default('') String Description,
  }) = _EventType;

  factory EventType.fromJson(Map<String, Object?> json) => _$EventTypeFromJson(json);
}
