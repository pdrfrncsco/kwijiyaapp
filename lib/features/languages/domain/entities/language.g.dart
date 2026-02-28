// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageImpl _$$LanguageImplFromJson(Map<String, dynamic> json) =>
    _$LanguageImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String?,
      region: json['region'] as String?,
      difficultyLevel: json['difficulty_level'] as String,
      numSpeakers: json['num_speakers'] as String?,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$$LanguageImplToJson(_$LanguageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'region': instance.region,
      'difficulty_level': instance.difficultyLevel,
      'num_speakers': instance.numSpeakers,
      'is_active': instance.isActive,
    };
