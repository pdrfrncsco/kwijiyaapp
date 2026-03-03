// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? email,
    String? username,
    @JsonKey(name: 'is_guest') required bool isGuest,
    @JsonKey(name: 'total_xp') required int totalXp,
    required int level,
    required int coins, // Makuta
    @JsonKey(name: 'streak_days') required int streakDays,
    @JsonKey(name: 'age_group') String? ageGroup,
    @JsonKey(name: 'placement_test_completed')
    @Default(false)
    bool placementTestCompleted,
    String? avatar,
    @Default([]) List<Map<String, dynamic>>? badges,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
