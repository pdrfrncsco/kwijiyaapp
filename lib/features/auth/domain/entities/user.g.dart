// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
  id: json['id'] as String,
  email: json['email'] as String?,
  username: json['username'] as String?,
  isGuest: json['is_guest'] as bool,
  totalXp: (json['total_xp'] as num).toInt(),
  level: (json['level'] as num).toInt(),
  coins: (json['coins'] as num).toInt(),
  streakDays: (json['streak_days'] as num).toInt(),
  ageGroup: json['age_group'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  placementTestCompleted: json['placement_test_completed'] as bool? ?? false,
  avatar: json['avatar'] as String?,
  badges:
      (json['badges'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'is_guest': instance.isGuest,
      'total_xp': instance.totalXp,
      'level': instance.level,
      'coins': instance.coins,
      'streak_days': instance.streakDays,
      'age_group': instance.ageGroup,
      'date_of_birth': instance.dateOfBirth,
      'placement_test_completed': instance.placementTestCompleted,
      'avatar': instance.avatar,
      'badges': instance.badges,
    };
