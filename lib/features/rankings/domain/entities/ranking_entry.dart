// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_entry.freezed.dart';
part 'ranking_entry.g.dart';

@freezed
class RankingEntry with _$RankingEntry {
  const factory RankingEntry({
    required int rank,
    @JsonKey(name: 'user_id') required String userId,
    required String username,
    String? avatar,
    String? title,
    @JsonKey(name: 'total_xp') required int totalXp,
    required int level,
    @JsonKey(name: 'streak_days') required int streakDays,
  }) = _RankingEntry;

  factory RankingEntry.fromJson(Map<String, dynamic> json) =>
      _$RankingEntryFromJson(json);
}
