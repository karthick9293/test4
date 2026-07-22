import 'package:freezed_annotation/freezed_annotation.dart';

part 'cms_fz.freezed.dart';
part 'cms_fz.g.dart';

@freezed
abstract class Cms with _$Cms {
  const factory Cms({
    @JsonKey(name: "MessageCode") String? messageCode,
    @JsonKey(name: "MessageDetails") String? messageDetails,
    @JsonKey(name: "CMSList") List<CmsList>? cmsList,
  }) = _Cms;

  factory Cms.fromJson(Map<String, Object?> json) => _$CmsFromJson(json);
}

@freezed
abstract class CmsList with _$CmsList {
  const factory CmsList({
    @JsonKey(name: "Code") int? code,
    @JsonKey(name: "ScreenName") String? screenName,
    @JsonKey(name: "Image") String? image,
    @JsonKey(name: "FileUrl") String? fileUrl,
    @JsonKey(name: "ParameterName") String? parameterName,
    @JsonKey(name: "TextHeading") String? textHeading,
    @JsonKey(name: "Description") String? description,
    @JsonKey(name: "Note") String? note,
    @JsonKey(name: "Status") String? status,
    @JsonKey(name: "LanguageCode") String? languageCode,
    @JsonKey(name: "UserId") String? userId,
  }) = _CmsList;

  factory CmsList.fromJson(Map<String, Object?> json) => _$CmsListFromJson(json);
}
