import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_symbol_fz.freezed.dart';
part 'currency_symbol_fz.g.dart';

@freezed
abstract class CurrencySymbolFz with _$CurrencySymbolFz {
  const factory CurrencySymbolFz({
    @JsonKey(name: "StatusCode") String? statusCode,
    @JsonKey(name: "StatusMessage") String? statusMessage,
    @JsonKey(name: "CurrencySymbol") List<CurrencySymbol>? currencySymbols,
    @JsonKey(name: "CustomMessageDetails") CustomMessageDetails? customMessageDetails,
  }) = _CurrencySymbolFz;

  factory CurrencySymbolFz.fromJson(Map<String, Object?> json) => _$CurrencySymbolFzFromJson(json);
}

@freezed
abstract class CurrencySymbol with _$CurrencySymbol {
  const factory CurrencySymbol({
    @JsonKey(name: "CurrencyCode") String? currencyCode,
    @JsonKey(name: "Base64String") String? base64String,
    @JsonKey(name: "CurrencyImage") String? currencyImage,
  }) = _CurrencySymbol;

  factory CurrencySymbol.fromJson(Map<String, Object?> json) => _$CurrencySymbolFromJson(json);
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
