// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuizOption _$QuizOptionFromJson(Map<String, dynamic> json) {
  return _QuizOption.fromJson(json);
}

/// @nodoc
mixin _$QuizOption {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_correct')
  bool? get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this QuizOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizOptionCopyWith<QuizOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizOptionCopyWith<$Res> {
  factory $QuizOptionCopyWith(
    QuizOption value,
    $Res Function(QuizOption) then,
  ) = _$QuizOptionCopyWithImpl<$Res, QuizOption>;
  @useResult
  $Res call({
    String id,
    String text,
    @JsonKey(name: 'is_correct') bool? isCorrect,
  });
}

/// @nodoc
class _$QuizOptionCopyWithImpl<$Res, $Val extends QuizOption>
    implements $QuizOptionCopyWith<$Res> {
  _$QuizOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isCorrect = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            isCorrect: freezed == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizOptionImplCopyWith<$Res>
    implements $QuizOptionCopyWith<$Res> {
  factory _$$QuizOptionImplCopyWith(
    _$QuizOptionImpl value,
    $Res Function(_$QuizOptionImpl) then,
  ) = __$$QuizOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String text,
    @JsonKey(name: 'is_correct') bool? isCorrect,
  });
}

/// @nodoc
class __$$QuizOptionImplCopyWithImpl<$Res>
    extends _$QuizOptionCopyWithImpl<$Res, _$QuizOptionImpl>
    implements _$$QuizOptionImplCopyWith<$Res> {
  __$$QuizOptionImplCopyWithImpl(
    _$QuizOptionImpl _value,
    $Res Function(_$QuizOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? isCorrect = freezed,
  }) {
    return _then(
      _$QuizOptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        isCorrect: freezed == isCorrect
            ? _value.isCorrect
            : isCorrect // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizOptionImpl implements _QuizOption {
  const _$QuizOptionImpl({
    required this.id,
    required this.text,
    @JsonKey(name: 'is_correct') this.isCorrect,
  });

  factory _$QuizOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  @JsonKey(name: 'is_correct')
  final bool? isCorrect;

  @override
  String toString() {
    return 'QuizOption(id: $id, text: $text, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, isCorrect);

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizOptionImplCopyWith<_$QuizOptionImpl> get copyWith =>
      __$$QuizOptionImplCopyWithImpl<_$QuizOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizOptionImplToJson(this);
  }
}

abstract class _QuizOption implements QuizOption {
  const factory _QuizOption({
    required final String id,
    required final String text,
    @JsonKey(name: 'is_correct') final bool? isCorrect,
  }) = _$QuizOptionImpl;

  factory _QuizOption.fromJson(Map<String, dynamic> json) =
      _$QuizOptionImpl.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  @JsonKey(name: 'is_correct')
  bool? get isCorrect;

  /// Create a copy of QuizOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizOptionImplCopyWith<_$QuizOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestion {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_type')
  String get questionType => throw _privateConstructorUsedError;
  int get difficulty => throw _privateConstructorUsedError;
  @JsonKey(name: 'question_text')
  String get questionText => throw _privateConstructorUsedError;
  @JsonKey(name: 'timer_seconds')
  int get timerSeconds => throw _privateConstructorUsedError;
  @JsonKey(name: 'xp_value')
  int get xpValue => throw _privateConstructorUsedError;
  List<QuizOption> get options => throw _privateConstructorUsedError;

  /// Serializes this QuizQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
    QuizQuestion value,
    $Res Function(QuizQuestion) then,
  ) = _$QuizQuestionCopyWithImpl<$Res, QuizQuestion>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'question_type') String questionType,
    int difficulty,
    @JsonKey(name: 'question_text') String questionText,
    @JsonKey(name: 'timer_seconds') int timerSeconds,
    @JsonKey(name: 'xp_value') int xpValue,
    List<QuizOption> options,
  });
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res, $Val extends QuizQuestion>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionType = null,
    Object? difficulty = null,
    Object? questionText = null,
    Object? timerSeconds = null,
    Object? xpValue = null,
    Object? options = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            questionType: null == questionType
                ? _value.questionType
                : questionType // ignore: cast_nullable_to_non_nullable
                      as String,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as int,
            questionText: null == questionText
                ? _value.questionText
                : questionText // ignore: cast_nullable_to_non_nullable
                      as String,
            timerSeconds: null == timerSeconds
                ? _value.timerSeconds
                : timerSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            xpValue: null == xpValue
                ? _value.xpValue
                : xpValue // ignore: cast_nullable_to_non_nullable
                      as int,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<QuizOption>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizQuestionImplCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$$QuizQuestionImplCopyWith(
    _$QuizQuestionImpl value,
    $Res Function(_$QuizQuestionImpl) then,
  ) = __$$QuizQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'question_type') String questionType,
    int difficulty,
    @JsonKey(name: 'question_text') String questionText,
    @JsonKey(name: 'timer_seconds') int timerSeconds,
    @JsonKey(name: 'xp_value') int xpValue,
    List<QuizOption> options,
  });
}

/// @nodoc
class __$$QuizQuestionImplCopyWithImpl<$Res>
    extends _$QuizQuestionCopyWithImpl<$Res, _$QuizQuestionImpl>
    implements _$$QuizQuestionImplCopyWith<$Res> {
  __$$QuizQuestionImplCopyWithImpl(
    _$QuizQuestionImpl _value,
    $Res Function(_$QuizQuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionType = null,
    Object? difficulty = null,
    Object? questionText = null,
    Object? timerSeconds = null,
    Object? xpValue = null,
    Object? options = null,
  }) {
    return _then(
      _$QuizQuestionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        questionType: null == questionType
            ? _value.questionType
            : questionType // ignore: cast_nullable_to_non_nullable
                  as String,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as int,
        questionText: null == questionText
            ? _value.questionText
            : questionText // ignore: cast_nullable_to_non_nullable
                  as String,
        timerSeconds: null == timerSeconds
            ? _value.timerSeconds
            : timerSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        xpValue: null == xpValue
            ? _value.xpValue
            : xpValue // ignore: cast_nullable_to_non_nullable
                  as int,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<QuizOption>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizQuestionImpl implements _QuizQuestion {
  const _$QuizQuestionImpl({
    required this.id,
    @JsonKey(name: 'question_type') required this.questionType,
    required this.difficulty,
    @JsonKey(name: 'question_text') required this.questionText,
    @JsonKey(name: 'timer_seconds') required this.timerSeconds,
    @JsonKey(name: 'xp_value') required this.xpValue,
    required final List<QuizOption> options,
  }) : _options = options;

  factory _$QuizQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizQuestionImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'question_type')
  final String questionType;
  @override
  final int difficulty;
  @override
  @JsonKey(name: 'question_text')
  final String questionText;
  @override
  @JsonKey(name: 'timer_seconds')
  final int timerSeconds;
  @override
  @JsonKey(name: 'xp_value')
  final int xpValue;
  final List<QuizOption> _options;
  @override
  List<QuizOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'QuizQuestion(id: $id, questionType: $questionType, difficulty: $difficulty, questionText: $questionText, timerSeconds: $timerSeconds, xpValue: $xpValue, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionType, questionType) ||
                other.questionType == questionType) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.questionText, questionText) ||
                other.questionText == questionText) &&
            (identical(other.timerSeconds, timerSeconds) ||
                other.timerSeconds == timerSeconds) &&
            (identical(other.xpValue, xpValue) || other.xpValue == xpValue) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    questionType,
    difficulty,
    questionText,
    timerSeconds,
    xpValue,
    const DeepCollectionEquality().hash(_options),
  );

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      __$$QuizQuestionImplCopyWithImpl<_$QuizQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizQuestionImplToJson(this);
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  const factory _QuizQuestion({
    required final String id,
    @JsonKey(name: 'question_type') required final String questionType,
    required final int difficulty,
    @JsonKey(name: 'question_text') required final String questionText,
    @JsonKey(name: 'timer_seconds') required final int timerSeconds,
    @JsonKey(name: 'xp_value') required final int xpValue,
    required final List<QuizOption> options,
  }) = _$QuizQuestionImpl;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$QuizQuestionImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'question_type')
  String get questionType;
  @override
  int get difficulty;
  @override
  @JsonKey(name: 'question_text')
  String get questionText;
  @override
  @JsonKey(name: 'timer_seconds')
  int get timerSeconds;
  @override
  @JsonKey(name: 'xp_value')
  int get xpValue;
  @override
  List<QuizOption> get options;

  /// Create a copy of QuizQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizQuestionImplCopyWith<_$QuizQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizSession _$QuizSessionFromJson(Map<String, dynamic> json) {
  return _QuizSession.fromJson(json);
}

/// @nodoc
mixin _$QuizSession {
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_questions')
  int get totalQuestions => throw _privateConstructorUsedError;
  List<QuizQuestion> get questions => throw _privateConstructorUsedError;

  /// Serializes this QuizSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizSessionCopyWith<QuizSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizSessionCopyWith<$Res> {
  factory $QuizSessionCopyWith(
    QuizSession value,
    $Res Function(QuizSession) then,
  ) = _$QuizSessionCopyWithImpl<$Res, QuizSession>;
  @useResult
  $Res call({
    @JsonKey(name: 'session_id') String sessionId,
    String language,
    int level,
    @JsonKey(name: 'total_questions') int totalQuestions,
    List<QuizQuestion> questions,
  });
}

/// @nodoc
class _$QuizSessionCopyWithImpl<$Res, $Val extends QuizSession>
    implements $QuizSessionCopyWith<$Res> {
  _$QuizSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? language = null,
    Object? level = null,
    Object? totalQuestions = null,
    Object? questions = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            totalQuestions: null == totalQuestions
                ? _value.totalQuestions
                : totalQuestions // ignore: cast_nullable_to_non_nullable
                      as int,
            questions: null == questions
                ? _value.questions
                : questions // ignore: cast_nullable_to_non_nullable
                      as List<QuizQuestion>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizSessionImplCopyWith<$Res>
    implements $QuizSessionCopyWith<$Res> {
  factory _$$QuizSessionImplCopyWith(
    _$QuizSessionImpl value,
    $Res Function(_$QuizSessionImpl) then,
  ) = __$$QuizSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'session_id') String sessionId,
    String language,
    int level,
    @JsonKey(name: 'total_questions') int totalQuestions,
    List<QuizQuestion> questions,
  });
}

/// @nodoc
class __$$QuizSessionImplCopyWithImpl<$Res>
    extends _$QuizSessionCopyWithImpl<$Res, _$QuizSessionImpl>
    implements _$$QuizSessionImplCopyWith<$Res> {
  __$$QuizSessionImplCopyWithImpl(
    _$QuizSessionImpl _value,
    $Res Function(_$QuizSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? language = null,
    Object? level = null,
    Object? totalQuestions = null,
    Object? questions = null,
  }) {
    return _then(
      _$QuizSessionImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        totalQuestions: null == totalQuestions
            ? _value.totalQuestions
            : totalQuestions // ignore: cast_nullable_to_non_nullable
                  as int,
        questions: null == questions
            ? _value._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<QuizQuestion>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizSessionImpl implements _QuizSession {
  const _$QuizSessionImpl({
    @JsonKey(name: 'session_id') required this.sessionId,
    required this.language,
    required this.level,
    @JsonKey(name: 'total_questions') required this.totalQuestions,
    required final List<QuizQuestion> questions,
  }) : _questions = questions;

  factory _$QuizSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizSessionImplFromJson(json);

  @override
  @JsonKey(name: 'session_id')
  final String sessionId;
  @override
  final String language;
  @override
  final int level;
  @override
  @JsonKey(name: 'total_questions')
  final int totalQuestions;
  final List<QuizQuestion> _questions;
  @override
  List<QuizQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuizSession(sessionId: $sessionId, language: $language, level: $level, totalQuestions: $totalQuestions, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.totalQuestions, totalQuestions) ||
                other.totalQuestions == totalQuestions) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessionId,
    language,
    level,
    totalQuestions,
    const DeepCollectionEquality().hash(_questions),
  );

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizSessionImplCopyWith<_$QuizSessionImpl> get copyWith =>
      __$$QuizSessionImplCopyWithImpl<_$QuizSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizSessionImplToJson(this);
  }
}

abstract class _QuizSession implements QuizSession {
  const factory _QuizSession({
    @JsonKey(name: 'session_id') required final String sessionId,
    required final String language,
    required final int level,
    @JsonKey(name: 'total_questions') required final int totalQuestions,
    required final List<QuizQuestion> questions,
  }) = _$QuizSessionImpl;

  factory _QuizSession.fromJson(Map<String, dynamic> json) =
      _$QuizSessionImpl.fromJson;

  @override
  @JsonKey(name: 'session_id')
  String get sessionId;
  @override
  String get language;
  @override
  int get level;
  @override
  @JsonKey(name: 'total_questions')
  int get totalQuestions;
  @override
  List<QuizQuestion> get questions;

  /// Create a copy of QuizSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizSessionImplCopyWith<_$QuizSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QuizResult _$QuizResultFromJson(Map<String, dynamic> json) {
  return _QuizResult.fromJson(json);
}

/// @nodoc
mixin _$QuizResult {
  @JsonKey(name: 'is_correct')
  bool get isCorrect => throw _privateConstructorUsedError;
  @JsonKey(name: 'xp_earned')
  int get xpEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'makuta_earned')
  int get makutaEarned => throw _privateConstructorUsedError;
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  @JsonKey(name: 'cultural_note')
  String? get culturalNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_progress')
  Map<String, dynamic> get sessionProgress =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'session_summary')
  Map<String, dynamic>? get sessionSummary =>
      throw _privateConstructorUsedError;

  /// Serializes this QuizResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuizResultCopyWith<QuizResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizResultCopyWith<$Res> {
  factory $QuizResultCopyWith(
    QuizResult value,
    $Res Function(QuizResult) then,
  ) = _$QuizResultCopyWithImpl<$Res, QuizResult>;
  @useResult
  $Res call({
    @JsonKey(name: 'is_correct') bool isCorrect,
    @JsonKey(name: 'xp_earned') int xpEarned,
    @JsonKey(name: 'makuta_earned') int makutaEarned,
    @JsonKey(name: 'correct_answer') String? correctAnswer,
    String? explanation,
    @JsonKey(name: 'cultural_note') String? culturalNote,
    @JsonKey(name: 'session_progress') Map<String, dynamic> sessionProgress,
    @JsonKey(name: 'session_summary') Map<String, dynamic>? sessionSummary,
  });
}

/// @nodoc
class _$QuizResultCopyWithImpl<$Res, $Val extends QuizResult>
    implements $QuizResultCopyWith<$Res> {
  _$QuizResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCorrect = null,
    Object? xpEarned = null,
    Object? makutaEarned = null,
    Object? correctAnswer = freezed,
    Object? explanation = freezed,
    Object? culturalNote = freezed,
    Object? sessionProgress = null,
    Object? sessionSummary = freezed,
  }) {
    return _then(
      _value.copyWith(
            isCorrect: null == isCorrect
                ? _value.isCorrect
                : isCorrect // ignore: cast_nullable_to_non_nullable
                      as bool,
            xpEarned: null == xpEarned
                ? _value.xpEarned
                : xpEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            makutaEarned: null == makutaEarned
                ? _value.makutaEarned
                : makutaEarned // ignore: cast_nullable_to_non_nullable
                      as int,
            correctAnswer: freezed == correctAnswer
                ? _value.correctAnswer
                : correctAnswer // ignore: cast_nullable_to_non_nullable
                      as String?,
            explanation: freezed == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            culturalNote: freezed == culturalNote
                ? _value.culturalNote
                : culturalNote // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessionProgress: null == sessionProgress
                ? _value.sessionProgress
                : sessionProgress // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            sessionSummary: freezed == sessionSummary
                ? _value.sessionSummary
                : sessionSummary // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuizResultImplCopyWith<$Res>
    implements $QuizResultCopyWith<$Res> {
  factory _$$QuizResultImplCopyWith(
    _$QuizResultImpl value,
    $Res Function(_$QuizResultImpl) then,
  ) = __$$QuizResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'is_correct') bool isCorrect,
    @JsonKey(name: 'xp_earned') int xpEarned,
    @JsonKey(name: 'makuta_earned') int makutaEarned,
    @JsonKey(name: 'correct_answer') String? correctAnswer,
    String? explanation,
    @JsonKey(name: 'cultural_note') String? culturalNote,
    @JsonKey(name: 'session_progress') Map<String, dynamic> sessionProgress,
    @JsonKey(name: 'session_summary') Map<String, dynamic>? sessionSummary,
  });
}

/// @nodoc
class __$$QuizResultImplCopyWithImpl<$Res>
    extends _$QuizResultCopyWithImpl<$Res, _$QuizResultImpl>
    implements _$$QuizResultImplCopyWith<$Res> {
  __$$QuizResultImplCopyWithImpl(
    _$QuizResultImpl _value,
    $Res Function(_$QuizResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCorrect = null,
    Object? xpEarned = null,
    Object? makutaEarned = null,
    Object? correctAnswer = freezed,
    Object? explanation = freezed,
    Object? culturalNote = freezed,
    Object? sessionProgress = null,
    Object? sessionSummary = freezed,
  }) {
    return _then(
      _$QuizResultImpl(
        isCorrect: null == isCorrect
            ? _value.isCorrect
            : isCorrect // ignore: cast_nullable_to_non_nullable
                  as bool,
        xpEarned: null == xpEarned
            ? _value.xpEarned
            : xpEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        makutaEarned: null == makutaEarned
            ? _value.makutaEarned
            : makutaEarned // ignore: cast_nullable_to_non_nullable
                  as int,
        correctAnswer: freezed == correctAnswer
            ? _value.correctAnswer
            : correctAnswer // ignore: cast_nullable_to_non_nullable
                  as String?,
        explanation: freezed == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        culturalNote: freezed == culturalNote
            ? _value.culturalNote
            : culturalNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionProgress: null == sessionProgress
            ? _value._sessionProgress
            : sessionProgress // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        sessionSummary: freezed == sessionSummary
            ? _value._sessionSummary
            : sessionSummary // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuizResultImpl implements _QuizResult {
  const _$QuizResultImpl({
    @JsonKey(name: 'is_correct') required this.isCorrect,
    @JsonKey(name: 'xp_earned') required this.xpEarned,
    @JsonKey(name: 'makuta_earned') required this.makutaEarned,
    @JsonKey(name: 'correct_answer') this.correctAnswer,
    this.explanation,
    @JsonKey(name: 'cultural_note') this.culturalNote,
    @JsonKey(name: 'session_progress')
    required final Map<String, dynamic> sessionProgress,
    @JsonKey(name: 'session_summary')
    final Map<String, dynamic>? sessionSummary,
  }) : _sessionProgress = sessionProgress,
       _sessionSummary = sessionSummary;

  factory _$QuizResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuizResultImplFromJson(json);

  @override
  @JsonKey(name: 'is_correct')
  final bool isCorrect;
  @override
  @JsonKey(name: 'xp_earned')
  final int xpEarned;
  @override
  @JsonKey(name: 'makuta_earned')
  final int makutaEarned;
  @override
  @JsonKey(name: 'correct_answer')
  final String? correctAnswer;
  @override
  final String? explanation;
  @override
  @JsonKey(name: 'cultural_note')
  final String? culturalNote;
  final Map<String, dynamic> _sessionProgress;
  @override
  @JsonKey(name: 'session_progress')
  Map<String, dynamic> get sessionProgress {
    if (_sessionProgress is EqualUnmodifiableMapView) return _sessionProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sessionProgress);
  }

  final Map<String, dynamic>? _sessionSummary;
  @override
  @JsonKey(name: 'session_summary')
  Map<String, dynamic>? get sessionSummary {
    final value = _sessionSummary;
    if (value == null) return null;
    if (_sessionSummary is EqualUnmodifiableMapView) return _sessionSummary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'QuizResult(isCorrect: $isCorrect, xpEarned: $xpEarned, makutaEarned: $makutaEarned, correctAnswer: $correctAnswer, explanation: $explanation, culturalNote: $culturalNote, sessionProgress: $sessionProgress, sessionSummary: $sessionSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizResultImpl &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect) &&
            (identical(other.xpEarned, xpEarned) ||
                other.xpEarned == xpEarned) &&
            (identical(other.makutaEarned, makutaEarned) ||
                other.makutaEarned == makutaEarned) &&
            (identical(other.correctAnswer, correctAnswer) ||
                other.correctAnswer == correctAnswer) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.culturalNote, culturalNote) ||
                other.culturalNote == culturalNote) &&
            const DeepCollectionEquality().equals(
              other._sessionProgress,
              _sessionProgress,
            ) &&
            const DeepCollectionEquality().equals(
              other._sessionSummary,
              _sessionSummary,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isCorrect,
    xpEarned,
    makutaEarned,
    correctAnswer,
    explanation,
    culturalNote,
    const DeepCollectionEquality().hash(_sessionProgress),
    const DeepCollectionEquality().hash(_sessionSummary),
  );

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizResultImplCopyWith<_$QuizResultImpl> get copyWith =>
      __$$QuizResultImplCopyWithImpl<_$QuizResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuizResultImplToJson(this);
  }
}

abstract class _QuizResult implements QuizResult {
  const factory _QuizResult({
    @JsonKey(name: 'is_correct') required final bool isCorrect,
    @JsonKey(name: 'xp_earned') required final int xpEarned,
    @JsonKey(name: 'makuta_earned') required final int makutaEarned,
    @JsonKey(name: 'correct_answer') final String? correctAnswer,
    final String? explanation,
    @JsonKey(name: 'cultural_note') final String? culturalNote,
    @JsonKey(name: 'session_progress')
    required final Map<String, dynamic> sessionProgress,
    @JsonKey(name: 'session_summary')
    final Map<String, dynamic>? sessionSummary,
  }) = _$QuizResultImpl;

  factory _QuizResult.fromJson(Map<String, dynamic> json) =
      _$QuizResultImpl.fromJson;

  @override
  @JsonKey(name: 'is_correct')
  bool get isCorrect;
  @override
  @JsonKey(name: 'xp_earned')
  int get xpEarned;
  @override
  @JsonKey(name: 'makuta_earned')
  int get makutaEarned;
  @override
  @JsonKey(name: 'correct_answer')
  String? get correctAnswer;
  @override
  String? get explanation;
  @override
  @JsonKey(name: 'cultural_note')
  String? get culturalNote;
  @override
  @JsonKey(name: 'session_progress')
  Map<String, dynamic> get sessionProgress;
  @override
  @JsonKey(name: 'session_summary')
  Map<String, dynamic>? get sessionSummary;

  /// Create a copy of QuizResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuizResultImplCopyWith<_$QuizResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
