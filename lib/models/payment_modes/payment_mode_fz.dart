import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_mode_fz.freezed.dart';
part 'payment_mode_fz.g.dart';

Object? _readCode(Map json, String key) {
  final code = json['Code'];

  if (code is String && code.isNotEmpty) {
    return code;
  } else if (json['PayType'] != null && json['PayType'].toString().isNotEmpty) {
    return json['PayType'].toString();
  }

  return json[key];
}

Object? _readName(Map json, String key) {
  if (json['CodeName'] != null && json['CodeName'] != "") {
    return json['CodeName'];
  } else if (json['PaymentMode'] != null && json['PaymentMode'] != "") {
    return json['PaymentMode'];
  }
  return json[key];
}

@freezed
abstract class PaymentMode with _$PaymentMode {
  const factory PaymentMode({
    @JsonKey(name: 'Code', readValue: _readCode) @Default('') String? type,
    @JsonKey(name: 'CodeName', readValue: _readName) @Default('') String? description,
    @JsonKey(name: "PaymentModeImage") @Default('') String? paymentModeImage,
    @JsonKey(name: "PaymentModeKey") @Default('') String? paymentModeKey,
    @JsonKey(name: "Status") @Default('') String? status,
  }) = _PaymentMode;

  factory PaymentMode.fromJson(Map<String, dynamic> json) => _$PaymentModeFromJson(json);
}
