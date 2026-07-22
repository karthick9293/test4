// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cblimit_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CBLimitFz _$CBLimitFzFromJson(Map<String, dynamic> json) => _CBLimitFz(
      perTrnAmtLimit: json['PerTrnAmtLimit'] as String?,
      perTrnAmtLimitBlockMessage: json['PerTrnAmtLimitBlockMessage'] as String?,
      perTrnAmtLimitStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['PerTrnAmtLimitStatus']),
      perDayTrnAmtLimit: json['TrnLimitPerDay'] as String?,
      perDayTrnAmtLimitBlockMessage:
          json['TrnLimitPerDayBlockMessage'] as String?,
      perDayTrnAmtLimitStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['TrnLimitPerDayStatus']),
      trnAmtLmtMonthly: json['TrnAmtLmtMonthly'] as String?,
      trnAmtLmtMonthlyBlockMessage:
          json['TrnAmtLmtMonthlyBlockMessage'] as String?,
      trnAmtLmtMonthlyStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['TrnAmtLmtMonthlyStatus']),
      trnAmtLmtYearly: json['TrnAmtLmtYearly'] as String?,
      trnAmtLmtYearlyBlockMessage:
          json['TrnAmtLmtYearlyBlockMessage'] as String?,
      trnAmtLmtYearlyStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['TrnAmtLmtYearlyStatus']),
      trnAmtToBenfPerMonth: json['TrnAmtToBenfPerMonth'] as String?,
      trnAmtToBenfPerMonthBlockMessage:
          json['TrnAmtToBenfPerMonthBlockMessage'] as String?,
      trnAmtToBenfPerMonthStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['TrnAmtToBenfPerMonthStatus']),
      benefCoolingPeriodInMins: json['BenefCoolingPeriodInMins'] as String?,
      benefCoolingPeriodInMinsBlockMessage:
          json['BenefCoolingPeriodInMinsBlockMessage'] as String?,
      benefCoolingPeriodInMinsStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['BenefCoolingPeriodInMinsStatus']),
      benefCoolingPeriodAmt: json['BenefCoolingPeriodAmt'] as String?,
      benefCoolingPeriodAmtBlockMessage:
          json['BenefCoolingPeriodAmtBlockMessage'] as String?,
      benefCoolingPeriodAmtStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['BenefCoolingPeriodAmtStatus']),
      maxBenefLimit: json['MaxBenefLimit'] as String?,
      maxBenefLimitBlockMessage: json['MaxBenefLimitBlockMessage'] as String?,
      maxBenefLimitStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['MaxBenefLimitStatus']),
      maxTrnCountToBenefPerDay: json['MaxTrnCountToBenefPerDay'] as String?,
      maxTrnCountToBenefPerDayBlockMessage:
          json['MaxTrnCountToBenefPerDayBlockMessage'] as String?,
      maxTrnCountToBenefPerDayStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['MaxTrnCountToBenefPerDayStatus']),
      maxTrnCountPerDay: json['MaxTrnCountPerDay'] as String?,
      maxTrnCountPerDayBlockMessage:
          json['MaxTrnCountPerDayBlockMessage'] as String?,
      maxTrnCountPerDayStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['MaxTrnCountPerDayStatus']),
      maxTrnCountPerMonth: json['MaxTrnCountPerMonth'] as String?,
      maxTrnCountPerMonthBlockMessage:
          json['MaxTrnCountPerMonthBlockMessage'] as String?,
      maxTrnCountPerMonthStatus: $enumDecodeNullable(
          _$LimitStatusEnumMap, json['MaxTrnCountPerMonthStatus']),
    );

Map<String, dynamic> _$CBLimitFzToJson(_CBLimitFz instance) =>
    <String, dynamic>{
      'PerTrnAmtLimit': instance.perTrnAmtLimit,
      'PerTrnAmtLimitBlockMessage': instance.perTrnAmtLimitBlockMessage,
      'PerTrnAmtLimitStatus':
          _$LimitStatusEnumMap[instance.perTrnAmtLimitStatus],
      'TrnLimitPerDay': instance.perDayTrnAmtLimit,
      'TrnLimitPerDayBlockMessage': instance.perDayTrnAmtLimitBlockMessage,
      'TrnLimitPerDayStatus':
          _$LimitStatusEnumMap[instance.perDayTrnAmtLimitStatus],
      'TrnAmtLmtMonthly': instance.trnAmtLmtMonthly,
      'TrnAmtLmtMonthlyBlockMessage': instance.trnAmtLmtMonthlyBlockMessage,
      'TrnAmtLmtMonthlyStatus':
          _$LimitStatusEnumMap[instance.trnAmtLmtMonthlyStatus],
      'TrnAmtLmtYearly': instance.trnAmtLmtYearly,
      'TrnAmtLmtYearlyBlockMessage': instance.trnAmtLmtYearlyBlockMessage,
      'TrnAmtLmtYearlyStatus':
          _$LimitStatusEnumMap[instance.trnAmtLmtYearlyStatus],
      'TrnAmtToBenfPerMonth': instance.trnAmtToBenfPerMonth,
      'TrnAmtToBenfPerMonthBlockMessage':
          instance.trnAmtToBenfPerMonthBlockMessage,
      'TrnAmtToBenfPerMonthStatus':
          _$LimitStatusEnumMap[instance.trnAmtToBenfPerMonthStatus],
      'BenefCoolingPeriodInMins': instance.benefCoolingPeriodInMins,
      'BenefCoolingPeriodInMinsBlockMessage':
          instance.benefCoolingPeriodInMinsBlockMessage,
      'BenefCoolingPeriodInMinsStatus':
          _$LimitStatusEnumMap[instance.benefCoolingPeriodInMinsStatus],
      'BenefCoolingPeriodAmt': instance.benefCoolingPeriodAmt,
      'BenefCoolingPeriodAmtBlockMessage':
          instance.benefCoolingPeriodAmtBlockMessage,
      'BenefCoolingPeriodAmtStatus':
          _$LimitStatusEnumMap[instance.benefCoolingPeriodAmtStatus],
      'MaxBenefLimit': instance.maxBenefLimit,
      'MaxBenefLimitBlockMessage': instance.maxBenefLimitBlockMessage,
      'MaxBenefLimitStatus': _$LimitStatusEnumMap[instance.maxBenefLimitStatus],
      'MaxTrnCountToBenefPerDay': instance.maxTrnCountToBenefPerDay,
      'MaxTrnCountToBenefPerDayBlockMessage':
          instance.maxTrnCountToBenefPerDayBlockMessage,
      'MaxTrnCountToBenefPerDayStatus':
          _$LimitStatusEnumMap[instance.maxTrnCountToBenefPerDayStatus],
      'MaxTrnCountPerDay': instance.maxTrnCountPerDay,
      'MaxTrnCountPerDayBlockMessage': instance.maxTrnCountPerDayBlockMessage,
      'MaxTrnCountPerDayStatus':
          _$LimitStatusEnumMap[instance.maxTrnCountPerDayStatus],
      'MaxTrnCountPerMonth': instance.maxTrnCountPerMonth,
      'MaxTrnCountPerMonthBlockMessage':
          instance.maxTrnCountPerMonthBlockMessage,
      'MaxTrnCountPerMonthStatus':
          _$LimitStatusEnumMap[instance.maxTrnCountPerMonthStatus],
    };

const _$LimitStatusEnumMap = {
  LimitStatus.active: 'Active',
  LimitStatus.inactive: 'Inactive',
  LimitStatus.empty: '',
};
