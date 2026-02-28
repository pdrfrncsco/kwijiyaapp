// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RankingEntry _$RankingEntryFromJson(Map<String, dynamic> json) {
  return _RankingEntry.fromJson(json);
}

/// @nodoc
mixin _$RankingEntry {
  int get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_xp')
  int get totalXp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'streak_days')
  int get streakDays => throw _privateConstructorUsedError;

  /// Serializes this RankingEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingEntryCopyWith<RankingEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingEntryCopyWith<$Res> {
  factory $RankingEntryCopyWith(
    RankingEntry value,
    $Res Function(RankingEntry) then,
  ) = _$RankingEntryCopyWithImpl<$Res, RankingEntry>;
  @useResult
  $Res call({
    int rank,
    @JsonKey(name: 'user_id') String userId,
    String username,
    String? avatar,
    String? title,
    @JsonKey(name: 'total_xp') int totalXp,
    int level,
    @JsonKey(name: 'streak_days') int streakDays,
  });
}

/// @nodoc
class _$RankingEntryCopyWithImpl<$Res, $Val extends RankingEntry>
    implements $RankingEntryCopyWith<$Res> {
  _$RankingEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? userId = null,
    Object? username = null,
    Object? avatar = freezed,
    Object? title = freezed,
    Object? totalXp = null,
    Object? level = null,
    Object? streakDays = null,
  }) {
    return _then(
      _value.copyWith(
            rank: null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalXp: null == totalXp
                ? _value.totalXp
                : totalXp // ignore: cast_nullable_to_non_nullable
                      as int,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            streakDays: null == streakDays
                ? _value.streakDays
                : streakDays // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RankingEntryImplCopyWith<$Res>
    implements $RankingEntryCopyWith<$Res> {
  factory _$$RankingEntryImplCopyWith(
    _$RankingEntryImpl value,
    $Res Function(_$RankingEntryImpl) then,
  ) = __$$RankingEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int rank,
    @JsonKey(name: 'user_id') String userId,
    String username,
    String? avatar,
    String? title,
    @JsonKey(name: 'total_xp') int totalXp,
    int level,
    @JsonKey(name: 'streak_days') int streakDays,
  });
}

/// @nodoc
class __$$RankingEntryImplCopyWithImpl<$Res>
    extends _$RankingEntryCopyWithImpl<$Res, _$RankingEntryImpl>
    implements _$$RankingEntryImplCopyWith<$Res> {
  __$$RankingEntryImplCopyWithImpl(
    _$RankingEntryImpl _value,
    $Res Function(_$RankingEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? userId = null,
    Object? username = null,
    Object? avatar = freezed,
    Object? title = freezed,
    Object? totalXp = null,
    Object? level = null,
    Object? streakDays = null,
  }) {
    return _then(
      _$RankingEntryImpl(
        rank: null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalXp: null == totalXp
            ? _value.totalXp
            : totalXp // ignore: cast_nullable_to_non_nullable
                  as int,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        streakDays: null == streakDays
            ? _value.streakDays
            : streakDays // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RankingEntryImpl implements _RankingEntry {
  const _$RankingEntryImpl({
    required this.rank,
    @JsonKey(name: 'user_id') required this.userId,
    required this.username,
    this.avatar,
    this.title,
    @JsonKey(name: 'total_xp') required this.totalXp,
    required this.level,
    @JsonKey(name: 'streak_days') required this.streakDays,
  });

  factory _$RankingEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankingEntryImplFromJson(json);

  @override
  final int rank;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String username;
  @override
  final String? avatar;
  @override
  final String? title;
  @override
  @JsonKey(name: 'total_xp')
  final int totalXp;
  @override
  final int level;
  @override
  @JsonKey(name: 'streak_days')
  final int streakDays;

  @override
  String toString() {
    return 'RankingEntry(rank: $rank, userId: $userId, username: $username, avatar: $avatar, title: $title, totalXp: $totalXp, level: $level, streakDays: $streakDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingEntryImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    rank,
    userId,
    username,
    avatar,
    title,
    totalXp,
    level,
    streakDays,
  );

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingEntryImplCopyWith<_$RankingEntryImpl> get copyWith =>
      __$$RankingEntryImplCopyWithImpl<_$RankingEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankingEntryImplToJson(this);
  }
}

abstract class _RankingEntry implements RankingEntry {
  const factory _RankingEntry({
    required final int rank,
    @JsonKey(name: 'user_id') required final String userId,
    required final String username,
    final String? avatar,
    final String? title,
    @JsonKey(name: 'total_xp') required final int totalXp,
    required final int level,
    @JsonKey(name: 'streak_days') required final int streakDays,
  }) = _$RankingEntryImpl;

  factory _RankingEntry.fromJson(Map<String, dynamic> json) =
      _$RankingEntryImpl.fromJson;

  @override
  int get rank;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  String get username;
  @override
  String? get avatar;
  @override
  String? get title;
  @override
  @JsonKey(name: 'total_xp')
  int get totalXp;
  @override
  int get level;
  @override
  @JsonKey(name: 'streak_days')
  int get streakDays;

  /// Create a copy of RankingEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingEntryImplCopyWith<_$RankingEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
