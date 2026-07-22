import 'package:freezed_annotation/freezed_annotation.dart';

import '../custom_message/custom_message_details_fz.dart';

part 'deregister_device_fz.freezed.dart';
part 'deregister_device_fz.g.dart';
// ignore_for_file: non_constant_identifier_names

@freezed
abstract class DeregisterDeviceFZ with _$DeregisterDeviceFZ {
  const factory DeregisterDeviceFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetailsFZ? customMessageDetails,
    @JsonKey(name: 'Data') DeregisterData? deregisterData,
  }) = _DeregisterDeviceFZ;

  factory DeregisterDeviceFZ.fromJson(Map<String, Object?> json) => _$DeregisterDeviceFZFromJson(json);
}

@freezed
abstract class DeregisterData with _$DeregisterData {
  const factory DeregisterData({
    @JsonKey(name: 'MessageCode') @Default('') String MessageCode,
    @JsonKey(name: 'MessageDetail') @Default('') String MessageDetail,
  }) = _DeregisterData;

  factory DeregisterData.fromJson(Map<String, Object?> json) => _$DeregisterDataFromJson(json);
}
