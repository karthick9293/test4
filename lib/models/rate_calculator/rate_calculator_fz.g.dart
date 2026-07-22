// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_calculator_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateCalculatorFz _$RateCalculatorFzFromJson(Map<String, dynamic> json) =>
    _RateCalculatorFz(
      currencyCode: json['CurrencyCode'] as String?,
      sellMultiplicationRate:
          (json['SellMultiplicationRate'] as num?)?.toDouble(),
      sellDivisionRate: (json['SellDivisionRate'] as num?)?.toDouble(),
      buyMultiplicationRate:
          (json['BuyMultiplicationRate'] as num?)?.toDouble(),
      buyDivisionRate: (json['BuyDivisionRate'] as num?)?.toDouble(),
      factor: json['Factor'] as String?,
      maskMultiplication: json['MaskMultiplication'] as String?,
      maskDivision: json['MaskDivision'] as String?,
      fcyAmount: (json['FcyAmount'] as num?)?.toDouble(),
      lcyAmount: (json['LcyAmount'] as num?)?.toDouble(),
      fcyCurrencyDecimal: (json['FcyCurrencyDecimal'] as num?)?.toDouble(),
      lcyCurrencyDecimal: (json['LcyCurrencyDecimal'] as num?)?.toDouble(),
      branchZoneType: json['BranchZoneType'],
      activityCode: json['ActivityCode'],
    );

Map<String, dynamic> _$RateCalculatorFzToJson(_RateCalculatorFz instance) =>
    <String, dynamic>{
      'CurrencyCode': instance.currencyCode,
      'SellMultiplicationRate': instance.sellMultiplicationRate,
      'SellDivisionRate': instance.sellDivisionRate,
      'BuyMultiplicationRate': instance.buyMultiplicationRate,
      'BuyDivisionRate': instance.buyDivisionRate,
      'Factor': instance.factor,
      'MaskMultiplication': instance.maskMultiplication,
      'MaskDivision': instance.maskDivision,
      'FcyAmount': instance.fcyAmount,
      'LcyAmount': instance.lcyAmount,
      'FcyCurrencyDecimal': instance.fcyCurrencyDecimal,
      'LcyCurrencyDecimal': instance.lcyCurrencyDecimal,
      'BranchZoneType': instance.branchZoneType,
      'ActivityCode': instance.activityCode,
    };
