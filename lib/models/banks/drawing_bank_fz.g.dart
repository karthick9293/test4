// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawing_bank_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DrawingBankFz _$DrawingBankFzFromJson(Map<String, dynamic> json) =>
    _DrawingBankFz(
      bankCode: json['BankCode'] as String? ?? '',
      bankName: json['BankName'] as String? ?? '',
      payAccountNumbers: (json['BankAccountNumber'] as List<dynamic>?)
              ?.map(
                  (e) => PayAccountNumberFZ.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DrawingBankFzToJson(_DrawingBankFz instance) =>
    <String, dynamic>{
      'BankCode': instance.bankCode,
      'BankName': instance.bankName,
      'BankAccountNumber': instance.payAccountNumbers,
    };

_PayAccountNumberFZ _$PayAccountNumberFZFromJson(Map<String, dynamic> json) =>
    _PayAccountNumberFZ(
      accountNumber: json['BankAccountNumber'] as String? ?? '',
    );

Map<String, dynamic> _$PayAccountNumberFZToJson(_PayAccountNumberFZ instance) =>
    <String, dynamic>{
      'BankAccountNumber': instance.accountNumber,
    };
