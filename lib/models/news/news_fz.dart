import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_fz.freezed.dart';
part 'news_fz.g.dart';

@freezed
abstract class NewsFZ with _$NewsFZ {
  const factory NewsFZ(
      {@JsonKey(name: 'Code') String? code,
      @JsonKey(name: 'NewsTitle') String? newsTitle,
      @JsonKey(name: 'NewsContent') String? newsContent,
      @JsonKey(name: 'LanguageCode') String? languageCode}) = _NewsFZ;

  factory NewsFZ.fromJson(Map<String, Object?> json) => _$NewsFZFromJson(json);
}
