import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_charge_fz.freezed.dart';
part 'rate_charge_fz.g.dart';

@freezed
abstract class RateChargeFz with _$RateChargeFz {
  const factory RateChargeFz({
    @JsonKey(name: "SessionId") String? sessionId,
    @JsonKey(name: "RoutingBankCode") String? routingBankCode,
    @JsonKey(name: "CurrencyCode") String? currencyCode,
    @JsonKey(name: "ServiceCode") String? serviceCode,
    @JsonKey(name: "ServiceType") String? serviceType,
    @JsonKey(name: "ChargeDetails") ChargeDetails? chargeDetails,
    @JsonKey(name: "StatusCode") String? statusCode,
    @JsonKey(name: "StatusMessage") String? statusMessage,
    @JsonKey(name: "CustomMessageDetails")
    CustomMessageDetails? customMessageDetails,
  }) = _RateChargeFz;

  factory RateChargeFz.fromJson(Map<String, Object?> json) =>
      _$RateChargeFzFromJson(json);
}

@freezed
abstract class ChargeDetails with _$ChargeDetails {
  const factory ChargeDetails({
    @JsonKey(name: "CorrorgCode") String? corrorgCode,
    @JsonKey(name: "CurCode") String? curCode,
    @JsonKey(name: "ServiceCode") String? serviceCode,
    @JsonKey(name: "FcyAmount") double? fcyAmount,
    @JsonKey(name: "Rate") double? rate,
    @JsonKey(name: "DivisionRate") double? divisionRate,
    @JsonKey(name: "LcyAmount") double? lcyAmount,
    @JsonKey(name: "Commission") double? commission,
    @JsonKey(name: "BankChargesFcy") double? bankChargesFcy,
    @JsonKey(name: "BankChargesLcy") double? bankChargesLcy,
    @JsonKey(name: "Discounts") double? discounts,
    @JsonKey(name: "NetAmount") double? netAmount,
    @JsonKey(name: "Tax") double? tax,
    @JsonKey(name: "BranchCost") double? branchCost,
    @JsonKey(name: "CurrencyDecimal") int? currencyDecimal,
    @JsonKey(name: "FxCurrencyDecimal") int? fxCurrencyDecimal,
  }) = _ChargeDetails;

  factory ChargeDetails.fromJson(Map<String, Object?> json) =>
      _$ChargeDetailsFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: "MessageCode") String? messageCode,
    @JsonKey(name: "MessageType") String? messageType,
    @JsonKey(name: "MessageHeader") String? messageHeader,
    @JsonKey(name: "MessageDescription") String? messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) =>
      _$CustomMessageDetailsFromJson(json);
}
