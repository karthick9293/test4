import 'package:freezed_annotation/freezed_annotation.dart';

part 'modules_fz.freezed.dart';
part 'modules_fz.g.dart';

@freezed
abstract class ModulesFZ with _$ModulesFZ {
  const factory ModulesFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetails? customMessageDetails,
    @JsonKey(name: 'ModuleList') @Default([]) List<ModuleList> moduleList,
  }) = _ModulesFZ;

  factory ModulesFZ.fromJson(Map<String, Object?> json) => _$ModulesFZFromJson(json);
}

@freezed
abstract class ModuleList with _$ModuleList {
  const factory ModuleList({
    @JsonKey(name: 'ModuleCode') @Default('') String ModuleCode,
    @JsonKey(name: 'ModuleName') @Default('') String ModuleName,
    @JsonKey(name: 'Status') @Default('') String Status,
  }) = _ModuleList;

  factory ModuleList.fromJson(Map<String, Object?> json) => _$ModuleListFromJson(json);
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
