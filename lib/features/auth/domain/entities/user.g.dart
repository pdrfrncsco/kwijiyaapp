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
  avatar: json['avatar'] as String?,
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
      'avatar': instance.avatar,
    };
