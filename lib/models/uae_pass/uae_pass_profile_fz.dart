import 'package:freezed_annotation/freezed_annotation.dart';

part 'uae_pass_profile_fz.freezed.dart';
part 'uae_pass_profile_fz.g.dart';

@freezed
abstract class UaePassProfileFz with _$UaePassProfileFz {
  factory UaePassProfileFz({
    @JsonKey(name: "sub") String? sub,
    @JsonKey(name: "fullnameAR") String? fullnameAR,
    @JsonKey(name: "firstnameAR") String? firstnameAR,
    @JsonKey(name: "lastnameAR") String? lastnameAR,
    @JsonKey(name: "fullnameEN") String? fullnameEN,
    @JsonKey(name: "firstnameEN") String? firstnameEN,
    @JsonKey(name: "lastnameEN") String? lastnameEN,
    @JsonKey(name: "gender") String? gender,
    @JsonKey(name: "mobile") String? mobile,
    @JsonKey(name: "uuid") String? uuid,
    @JsonKey(name: "idn") String? idn,
    @JsonKey(name: "nationalityAR") String? nationalityAR,
    @JsonKey(name: "nationalityEN") String? nationalityEN,
    @JsonKey(name: "userType") String? userType,
    @JsonKey(name: "email") String? email,
  }) = _UaePassProfileFz;

  factory UaePassProfileFz.fromJson(Map<String, dynamic> json) => _$UaePassProfileFzFromJson(json);
}
