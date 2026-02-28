// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';
part 'language.g.dart';

@freezed
class Language with _$Language {
  const factory Language({
    required String id,
    required String name,
    required String code,
    String? description,
    String? region,
    @JsonKey(name: 'difficulty_level') required String difficultyLevel,
    @JsonKey(name: 'num_speakers') String? numSpeakers,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}
