import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawing_bank_fz.freezed.dart';
part 'drawing_bank_fz.g.dart';

@freezed
abstract class DrawingBankFz with _$DrawingBankFz {
  const factory DrawingBankFz({
    @JsonKey(name: 'BankCode') @Default('') String bankCode,
    @JsonKey(name: 'BankName') @Default('') String bankName,
    @JsonKey(name: 'BankAccountNumber') @Default([]) List<PayAccountNumberFZ> payAccountNumbers,
  }) = _DrawingBankFz;

  factory DrawingBankFz.fromJson(Map<String, dynamic> json) => _$DrawingBankFzFromJson(json);
}

@freezed
abstract class PayAccountNumberFZ with _$PayAccountNumberFZ {
  const factory PayAccountNumberFZ({
    @JsonKey(name: 'BankAccountNumber') @Default('') String accountNumber,
  }) = _PayAccountNumberFZ;

  factory PayAccountNumberFZ.fromJson(Map<String, dynamic> json) => _$PayAccountNumberFZFromJson(json);
}
