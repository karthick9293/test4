// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_charge_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RateChargeFz _$RateChargeFzFromJson(Map<String, dynamic> json) =>
    _RateChargeFz(
      sessionId: json['SessionId'] as String?,
      routingBankCode: json['RoutingBankCode'] as String?,
      currencyCode: json['CurrencyCode'] as String?,
      serviceCode: json['ServiceCode'] as String?,
      serviceType: json['ServiceType'] as String?,
      chargeDetails: json['ChargeDetails'] == null
          ? null
          : ChargeDetails.fromJson(
              json['ChargeDetails'] as Map<String, dynamic>),
      statusCode: json['StatusCode'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateChargeFzToJson(_RateChargeFz instance) =>
    <String, dynamic>{
      'SessionId': instance.sessionId,
      'RoutingBankCode': instance.routingBankCode,
      'CurrencyCode': instance.currencyCode,
      'ServiceCode': instance.serviceCode,
      'ServiceType': instance.serviceType,
      'ChargeDetails': instance.chargeDetails,
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'CustomMessageDetails': instance.customMessageDetails,
    };

_ChargeDetails _$ChargeDetailsFromJson(Map<String, dynamic> json) =>
    _ChargeDetails(
      corrorgCode: json['CorrorgCode'] as String?,
      curCode: json['CurCode'] as String?,
      serviceCode: json['ServiceCode'] as String?,
      fcyAmount: (json['FcyAmount'] as num?)?.toDouble(),
      rate: (json['Rate'] as num?)?.toDouble(),
      divisionRate: (json['DivisionRate'] as num?)?.toDouble(),
      lcyAmount: (json['LcyAmount'] as num?)?.toDouble(),
      commission: (json['Commission'] as num?)?.toDouble(),
      bankChargesFcy: (json['BankChargesFcy'] as num?)?.toDouble(),
      bankChargesLcy: (json['BankChargesLcy'] as num?)?.toDouble(),
      discounts: (json['Discounts'] as num?)?.toDouble(),
      netAmount: (json['NetAmount'] as num?)?.toDouble(),
      tax: (json['Tax'] as num?)?.toDouble(),
      branchCost: (json['BranchCost'] as num?)?.toDouble(),
      currencyDecimal: (json['CurrencyDecimal'] as num?)?.toInt(),
      fxCurrencyDecimal: (json['FxCurrencyDecimal'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChargeDetailsToJson(_ChargeDetails instance) =>
    <String, dynamic>{
      'CorrorgCode': instance.corrorgCode,
      'CurCode': instance.curCode,
      'ServiceCode': instance.serviceCode,
      'FcyAmount': instance.fcyAmount,
      'Rate': instance.rate,
      'DivisionRate': instance.divisionRate,
      'LcyAmount': instance.lcyAmount,
      'Commission': instance.commission,
      'BankChargesFcy': instance.bankChargesFcy,
      'BankChargesLcy': instance.bankChargesLcy,
      'Discounts': instance.discounts,
      'NetAmount': instance.netAmount,
      'Tax': instance.tax,
      'BranchCost': instance.branchCost,
      'CurrencyDecimal': instance.currencyDecimal,
      'FxCurrencyDecimal': instance.fxCurrencyDecimal,
    };

_CustomMessageDetails _$CustomMessageDetailsFromJson(
        Map<String, dynamic> json) =>
    _CustomMessageDetails(
      messageCode: json['MessageCode'] as String?,
      messageType: json['MessageType'] as String?,
      messageHeader: json['MessageHeader'] as String?,
      messageDescription: json['MessageDescription'] as String?,
    );

Map<String, dynamic> _$CustomMessageDetailsToJson(
        _CustomMessageDetails instance) =>
    <String, dynamic>{
      'MessageCode': instance.messageCode,
      'MessageType': instance.messageType,
      'MessageHeader': instance.messageHeader,
      'MessageDescription': instance.messageDescription,
    };
