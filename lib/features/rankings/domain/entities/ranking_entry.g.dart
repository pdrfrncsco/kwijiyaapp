// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingEntryImpl _$$RankingEntryImplFromJson(Map<String, dynamic> json) =>
    _$RankingEntryImpl(
      rank: (json['rank'] as num).toInt(),
      userId: json['user_id'] as String,
      username: json['username'] as String,
      avatar: json['avatar'] as String?,
      title: json['title'] as String?,
      totalXp: (json['total_xp'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      streakDays: (json['streak_days'] as num).toInt(),
    );

Map<String, dynamic> _$$RankingEntryImplToJson(_$RankingEntryImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'user_id': instance.userId,
      'username': instance.username,
      'avatar': instance.avatar,
      'title': instance.title,
      'total_xp': instance.totalXp,
      'level': instance.level,
      'streak_days': instance.streakDays,
    };
