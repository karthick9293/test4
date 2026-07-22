import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_rates_fz.freezed.dart';
part 'all_rates_fz.g.dart';

@freezed
abstract class AllRateFz with _$AllRateFz {
  const factory AllRateFz({
    @JsonKey(name: "StatusCode") required String statusCode,
    @JsonKey(name: "StatusMessage") required String statusMessage,
    @JsonKey(name: "Data") required Data data,
    @JsonKey(name: "CustomMessageDetails") required CustomMessageDetails customMessageDetails,
  }) = _AllRateFz;

  factory AllRateFz.fromJson(Map<String, Object?> json) => _$AllRateFzFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: "MessageCode") required String messageCode,
    @JsonKey(name: "MessageType") required String messageType,
    @JsonKey(name: "MessageHeader") required String messageHeader,
    @JsonKey(name: "MessageDescription") required String messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) => _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: "CurrencyRateList") required List<CurrencyRateList> currencyRateList,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class CurrencyRateList with _$CurrencyRateList {
  const factory CurrencyRateList({
    @JsonKey(name: "CurrencyCode") required String currencyCode,
    @JsonKey(name: "Currency") required String currency,
    @JsonKey(name: "CashRateBuy") required double cashRateBuy,
    @JsonKey(name: "CashRateSell") required double cashRateSell,
    @JsonKey(name: "TransferRateSell") required double transferRateSell,
    @JsonKey(name: "CurrencyFlagPath") required dynamic currencyFlagPath,
  }) = _CurrencyRateList;

  factory CurrencyRateList.fromJson(Map<String, Object?> json) => _$CurrencyRateListFromJson(json);
}
