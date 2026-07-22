import 'package:freezed_annotation/freezed_annotation.dart';

part 'cblimit_fz.freezed.dart';
part 'cblimit_fz.g.dart';

@freezed
abstract class CBLimitFz with _$CBLimitFz {
  const factory CBLimitFz({
    @JsonKey(name: 'PerTrnAmtLimit') String? perTrnAmtLimit,
    @JsonKey(name: 'PerTrnAmtLimitBlockMessage') String? perTrnAmtLimitBlockMessage,
    @JsonKey(name: 'PerTrnAmtLimitStatus') LimitStatus? perTrnAmtLimitStatus,
    @JsonKey(name: 'TrnLimitPerDay') String? perDayTrnAmtLimit,
    @JsonKey(name: 'TrnLimitPerDayBlockMessage') String? perDayTrnAmtLimitBlockMessage,
    @JsonKey(name: 'TrnLimitPerDayStatus') LimitStatus? perDayTrnAmtLimitStatus,
    @JsonKey(name: 'TrnAmtLmtMonthly') String? trnAmtLmtMonthly,
    @JsonKey(name: 'TrnAmtLmtMonthlyBlockMessage') String? trnAmtLmtMonthlyBlockMessage,
    @JsonKey(name: 'TrnAmtLmtMonthlyStatus') LimitStatus? trnAmtLmtMonthlyStatus,
    @JsonKey(name: 'TrnAmtLmtYearly') String? trnAmtLmtYearly,
    @JsonKey(name: 'TrnAmtLmtYearlyBlockMessage') String? trnAmtLmtYearlyBlockMessage,
    @JsonKey(name: 'TrnAmtLmtYearlyStatus') LimitStatus? trnAmtLmtYearlyStatus,
    @JsonKey(name: 'TrnAmtToBenfPerMonth') String? trnAmtToBenfPerMonth,
    @JsonKey(name: 'TrnAmtToBenfPerMonthBlockMessage') String? trnAmtToBenfPerMonthBlockMessage,
    @JsonKey(name: 'TrnAmtToBenfPerMonthStatus') LimitStatus? trnAmtToBenfPerMonthStatus,
    @JsonKey(name: 'BenefCoolingPeriodInMins') String? benefCoolingPeriodInMins,
    @JsonKey(name: 'BenefCoolingPeriodInMinsBlockMessage') String? benefCoolingPeriodInMinsBlockMessage,
    @JsonKey(name: 'BenefCoolingPeriodInMinsStatus') LimitStatus? benefCoolingPeriodInMinsStatus,
    @JsonKey(name: 'BenefCoolingPeriodAmt') String? benefCoolingPeriodAmt,
    @JsonKey(name: 'BenefCoolingPeriodAmtBlockMessage') String? benefCoolingPeriodAmtBlockMessage,
    @JsonKey(name: 'BenefCoolingPeriodAmtStatus') LimitStatus? benefCoolingPeriodAmtStatus,
    @JsonKey(name: 'MaxBenefLimit') String? maxBenefLimit,
    @JsonKey(name: 'MaxBenefLimitBlockMessage') String? maxBenefLimitBlockMessage,
    @JsonKey(name: 'MaxBenefLimitStatus') LimitStatus? maxBenefLimitStatus,
    @JsonKey(name: 'MaxTrnCountToBenefPerDay') String? maxTrnCountToBenefPerDay,
    @JsonKey(name: 'MaxTrnCountToBenefPerDayBlockMessage') String? maxTrnCountToBenefPerDayBlockMessage,
    @JsonKey(name: 'MaxTrnCountToBenefPerDayStatus') LimitStatus? maxTrnCountToBenefPerDayStatus,
    @JsonKey(name: 'MaxTrnCountPerDay') String? maxTrnCountPerDay,
    @JsonKey(name: 'MaxTrnCountPerDayBlockMessage') String? maxTrnCountPerDayBlockMessage,
    @JsonKey(name: 'MaxTrnCountPerDayStatus') LimitStatus? maxTrnCountPerDayStatus,
    @JsonKey(name: 'MaxTrnCountPerMonth') String? maxTrnCountPerMonth,
    @JsonKey(name: 'MaxTrnCountPerMonthBlockMessage') String? maxTrnCountPerMonthBlockMessage,
    @JsonKey(name: 'MaxTrnCountPerMonthStatus') LimitStatus? maxTrnCountPerMonthStatus,
  }) = _CBLimitFz;

  factory CBLimitFz.fromJson(Map<String, dynamic> json) => _$CBLimitFzFromJson(json);
}

enum LimitStatus {
  @JsonValue('Active')
  active,
  @JsonValue('Inactive')
  inactive,
  @JsonValue('')
  empty;

  static LimitStatus fromJson(String? value) {
    if (value == null || value.isEmpty) {
      return LimitStatus.inactive;
    }

    switch (value) {
      case 'Active':
        return LimitStatus.active;
      case 'Inactive':
        return LimitStatus.inactive;
      default:
        return LimitStatus.inactive;
    }
  }
}

class CBLimitCheckResult {
  final bool isLimitExceeded;
  final String limit;
  final String message;
  final CBLimitType limitType;

  CBLimitCheckResult({
    required this.isLimitExceeded,
    this.message = '',
    this.limit = '',
    this.limitType = CBLimitType.amount,
  });
}

enum CBLimitType { count, amount }
