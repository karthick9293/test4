import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_calculator_fz.freezed.dart';
part 'rate_calculator_fz.g.dart';

@freezed
abstract class RateCalculatorFz with _$RateCalculatorFz {
  const factory RateCalculatorFz({
    @JsonKey(name: "CurrencyCode") String? currencyCode,
    @JsonKey(name: "SellMultiplicationRate") double? sellMultiplicationRate,
    @JsonKey(name: "SellDivisionRate") double? sellDivisionRate,
    @JsonKey(name: "BuyMultiplicationRate") double? buyMultiplicationRate,
    @JsonKey(name: "BuyDivisionRate") double? buyDivisionRate,
    @JsonKey(name: "Factor") String? factor,
    @JsonKey(name: "MaskMultiplication") String? maskMultiplication,
    @JsonKey(name: "MaskDivision") String? maskDivision,
    @JsonKey(name: "FcyAmount") double? fcyAmount,
    @JsonKey(name: "LcyAmount") double? lcyAmount,
    @JsonKey(name: "FcyCurrencyDecimal") double? fcyCurrencyDecimal,
    @JsonKey(name: "LcyCurrencyDecimal") double? lcyCurrencyDecimal,
    @JsonKey(name: "BranchZoneType") dynamic branchZoneType,
    @JsonKey(name: "ActivityCode") dynamic activityCode,
  }) = _RateCalculatorFz;

  factory RateCalculatorFz.fromJson(Map<String, Object?> json) => _$RateCalculatorFzFromJson(json);
}
