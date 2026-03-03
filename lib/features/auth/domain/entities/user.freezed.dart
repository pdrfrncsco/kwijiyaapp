// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_guest')
  bool get isGuest => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_xp')
  int get totalXp => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get coins => throw _privateConstructorUsedError; // Makuta
  @JsonKey(name: 'streak_days')
  int get streakDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_group')
  String? get ageGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'placement_test_completed')
  bool get placementTestCompleted => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get badges => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    String id,
    String? email,
    String? username,
    @JsonKey(name: 'is_guest') bool isGuest,
    @JsonKey(name: 'total_xp') int totalXp,
    int level,
    int coins,
    @JsonKey(name: 'streak_days') int streakDays,
    @JsonKey(name: 'age_group') String? ageGroup,
    @JsonKey(name: 'placement_test_completed') bool placementTestCompleted,
    String? avatar,
    List<Map<String, dynamic>>? badges,
  });
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? username = freezed,
    Object? isGuest = null,
    Object? totalXp = null,
    Object? level = null,
    Object? coins = null,
    Object? streakDays = null,
    Object? ageGroup = freezed,
    Object? placementTestCompleted = null,
    Object? avatar = freezed,
    Object? badges = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
            isGuest: null == isGuest
                ? _value.isGuest
                : isGuest // ignore: cast_nullable_to_non_nullable
                      as bool,
            totalXp: null == totalXp
                ? _value.totalXp
                : totalXp // ignore: cast_nullable_to_non_nullable
                      as int,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            coins: null == coins
                ? _value.coins
                : coins // ignore: cast_nullable_to_non_nullable
                      as int,
            streakDays: null == streakDays
                ? _value.streakDays
                : streakDays // ignore: cast_nullable_to_non_nullable
                      as int,
            ageGroup: freezed == ageGroup
                ? _value.ageGroup
                : ageGroup // ignore: cast_nullable_to_non_nullable
                      as String?,
            placementTestCompleted: null == placementTestCompleted
                ? _value.placementTestCompleted
                : placementTestCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            badges: freezed == badges
                ? _value.badges
                : badges // ignore: cast_nullable_to_non_nullable
                      as List<Map<String, dynamic>>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? email,
    String? username,
    @JsonKey(name: 'is_guest') bool isGuest,
    @JsonKey(name: 'total_xp') int totalXp,
    int level,
    int coins,
    @JsonKey(name: 'streak_days') int streakDays,
    @JsonKey(name: 'age_group') String? ageGroup,
    @JsonKey(name: 'placement_test_completed') bool placementTestCompleted,
    String? avatar,
    List<Map<String, dynamic>>? badges,
  });
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? username = freezed,
    Object? isGuest = null,
    Object? totalXp = null,
    Object? level = null,
    Object? coins = null,
    Object? streakDays = null,
    Object? ageGroup = freezed,
    Object? placementTestCompleted = null,
    Object? avatar = freezed,
    Object? badges = freezed,
  }) {
    return _then(
      _$UserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
        isGuest: null == isGuest
            ? _value.isGuest
            : isGuest // ignore: cast_nullable_to_non_nullable
                  as bool,
        totalXp: null == totalXp
            ? _value.totalXp
            : totalXp // ignore: cast_nullable_to_non_nullable
                  as int,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        coins: null == coins
            ? _value.coins
            : coins // ignore: cast_nullable_to_non_nullable
                  as int,
        streakDays: null == streakDays
            ? _value.streakDays
            : streakDays // ignore: cast_nullable_to_non_nullable
                  as int,
        ageGroup: freezed == ageGroup
            ? _value.ageGroup
            : ageGroup // ignore: cast_nullable_to_non_nullable
                  as String?,
        placementTestCompleted: null == placementTestCompleted
            ? _value.placementTestCompleted
            : placementTestCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        badges: freezed == badges
            ? _value._badges
            : badges // ignore: cast_nullable_to_non_nullable
                  as List<Map<String, dynamic>>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
    required this.id,
    this.email,
    this.username,
    @JsonKey(name: 'is_guest') required this.isGuest,
    @JsonKey(name: 'total_xp') required this.totalXp,
    required this.level,
    required this.coins,
    @JsonKey(name: 'streak_days') required this.streakDays,
    @JsonKey(name: 'age_group') this.ageGroup,
    @JsonKey(name: 'placement_test_completed')
    this.placementTestCompleted = false,
    this.avatar,
    final List<Map<String, dynamic>>? badges = const [],
  }) : _badges = badges;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? username;
  @override
  @JsonKey(name: 'is_guest')
  final bool isGuest;
  @override
  @JsonKey(name: 'total_xp')
  final int totalXp;
  @override
  final int level;
  @override
  final int coins;
  // Makuta
  @override
  @JsonKey(name: 'streak_days')
  final int streakDays;
  @override
  @JsonKey(name: 'age_group')
  final String? ageGroup;
  @override
  @JsonKey(name: 'placement_test_completed')
  final bool placementTestCompleted;
  @override
  final String? avatar;
  final List<Map<String, dynamic>>? _badges;
  @override
  @JsonKey()
  List<Map<String, dynamic>>? get badges {
    final value = _badges;
    if (value == null) return null;
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'User(id: $id, email: $email, username: $username, isGuest: $isGuest, totalXp: $totalXp, level: $level, coins: $coins, streakDays: $streakDays, ageGroup: $ageGroup, placementTestCompleted: $placementTestCompleted, avatar: $avatar, badges: $badges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isGuest, isGuest) || other.isGuest == isGuest) &&
            (identical(other.totalXp, totalXp) || other.totalXp == totalXp) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.streakDays, streakDays) ||
                other.streakDays == streakDays) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.placementTestCompleted, placementTestCompleted) ||
                other.placementTestCompleted == placementTestCompleted) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._badges, _badges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    username,
    isGuest,
    totalXp,
    level,
    coins,
    streakDays,
    ageGroup,
    placementTestCompleted,
    avatar,
    const DeepCollectionEquality().hash(_badges),
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    required final String id,
    final String? email,
    final String? username,
    @JsonKey(name: 'is_guest') required final bool isGuest,
    @JsonKey(name: 'total_xp') required final int totalXp,
    required final int level,
    required final int coins,
    @JsonKey(name: 'streak_days') required final int streakDays,
    @JsonKey(name: 'age_group') final String? ageGroup,
    @JsonKey(name: 'placement_test_completed')
    final bool placementTestCompleted,
    final String? avatar,
    final List<Map<String, dynamic>>? badges,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get username;
  @override
  @JsonKey(name: 'is_guest')
  bool get isGuest;
  @override
  @JsonKey(name: 'total_xp')
  int get totalXp;
  @override
  int get level;
  @override
  int get coins; // Makuta
  @override
  @JsonKey(name: 'streak_days')
  int get streakDays;
  @override
  @JsonKey(name: 'age_group')
  String? get ageGroup;
  @override
  @JsonKey(name: 'placement_test_completed')
  bool get placementTestCompleted;
  @override
  String? get avatar;
  @override
  List<Map<String, dynamic>>? get badges;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
