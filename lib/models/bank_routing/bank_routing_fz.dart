import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobiremit/models/masters/master_response_fz.dart';

part 'bank_routing_fz.freezed.dart';
part 'bank_routing_fz.g.dart';

@freezed
abstract class BankRoutingFz with _$BankRoutingFz {
  const factory BankRoutingFz({
    @JsonKey(name: "StatusCode") String? statusCode,
    @JsonKey(name: "StatusMessage") String? statusMessage,
    @JsonKey(name: "Data") Data? data,
  }) = _BankRoutingFz;

  factory BankRoutingFz.fromJson(Map<String, Object?> json) => _$BankRoutingFzFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: "CategoryList") @Default([]) List<MasterResponseFZ>? categoryList,
    @JsonKey(name: "CountryList") @Default([]) List<MasterResponseFZ>? countryList,
    @JsonKey(name: "CurrencyList") @Default([]) List<MasterResponseFZ>? currencyList,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}
