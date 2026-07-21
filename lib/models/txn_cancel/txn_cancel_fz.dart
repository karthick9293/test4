import 'package:freezed_annotation/freezed_annotation.dart';

part 'txn_cancel_fz.freezed.dart';
part 'txn_cancel_fz.g.dart';

@freezed
abstract class TxnCancelFz with _$TxnCancelFz {
  const factory TxnCancelFz({
    @JsonKey(name: 'StatusCode') required String statusCode,
    @JsonKey(name: 'StatusMessage') required String statusMessage,
    @JsonKey(name: 'CustomMessageDetails') required CustomMessageDetails customMessageDetails,
  }) = _TxnCancelFz;

  factory TxnCancelFz.fromJson(Map<String, dynamic> json) => _$TxnCancelFzFromJson(json);
}

@freezed
abstract class CustomMessageDetails with _$CustomMessageDetails {
  const factory CustomMessageDetails({
    @JsonKey(name: 'MessageCode') required String messageCode,
    @JsonKey(name: 'MessageType') required String messageType,
    @JsonKey(name: 'MessageHeader') required String messageHeader,
    @JsonKey(name: 'MessageDescription') required String messageDescription,
  }) = _CustomMessageDetails;

  factory CustomMessageDetails.fromJson(Map<String, dynamic> json) => _$CustomMessageDetailsFromJson(json);
}
