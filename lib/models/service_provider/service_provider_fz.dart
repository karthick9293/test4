import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_provider_fz.freezed.dart';
part 'service_provider_fz.g.dart';

@freezed
abstract class ServiceProviderFz with _$ServiceProviderFz {
  const factory ServiceProviderFz({
    @JsonKey(name: "StatusCode") String? statusCode,
    @JsonKey(name: "StatusMessaage") String? statusMessaage,
    @JsonKey(name: "Data") Data? data,
    @JsonKey(name: "CustomMessageDetails") CustomMessageDetails? customMessageDetails,
  }) = _ServiceProviderFz;

  factory ServiceProviderFz.fromJson(Map<String, Object?> json) => _$ServiceProviderFzFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: "MessageCode") String? messageCode,
    @JsonKey(name: "MessageType") String? messageType,
    @JsonKey(name: "MessageHeader") String? messageHeader,
    @JsonKey(name: "MessageDescription") String? messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, Object?> json) => _$CustomMessageDetailsFromJson(json);
}

@freezed
abstract class Data with _$Data {
  const factory Data({
    @JsonKey(name: "ServiceProvider") List<ServiceProvider>? serviceProvider,
    @JsonKey(name: "MessageCode") String? messageCode,
    @JsonKey(name: "MessageDetail") String? messageDetail,
  }) = _Data;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);
}

@freezed
abstract class ServiceProvider with _$ServiceProvider {
  const factory ServiceProvider({
    @JsonKey(name: "Code") String? code,
    @JsonKey(name: "Provider") String? provider,
    @JsonKey(name: "MappingCode") String? mappingCode,
    @JsonKey(name: "ImageContent") String? imageContent,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "ServiceCategory") String? serviceCategory,
  }) = _ServiceProvider;

  factory ServiceProvider.fromJson(Map<String, Object?> json) => _$ServiceProviderFromJson(json);
}
