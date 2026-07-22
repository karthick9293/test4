import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_web_fz.freezed.dart';
part 'payment_web_fz.g.dart';

@freezed
abstract class PaymentWebFZ with _$PaymentWebFZ {
  const factory PaymentWebFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'CustomMessageDetails') CustomMessageDetails? customMessageDetails,
    @JsonKey(name: 'Data') Data? data,
  }) = _PaymentWebFZ;

  factory PaymentWebFZ.fromJson(Map<String, Object?> json) => _$PaymentWebFZFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: 'WebView') @Default('') String webView,
    @JsonKey(name: 'CustomerCode') @Default('') String customerCode,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: 'MessageCode') @Default('') String messageCode,
    @JsonKey(name: 'MessageType') @Default('') String messageType,
    @JsonKey(name: 'MessageHeader') @Default('') String messageHeader,
    @JsonKey(name: 'MessageDescription') @Default('') String messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) => _$CustomMessageDetailsFromJson(json);
}
