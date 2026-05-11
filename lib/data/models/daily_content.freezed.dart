// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VocabWord _$VocabWordFromJson(Map<String, dynamic> json) {
  return _VocabWord.fromJson(json);
}

/// @nodoc
mixin _$VocabWord {
  String get word => throw _privateConstructorUsedError;
  String get phonetic => throw _privateConstructorUsedError;
  String get meaningCn => throw _privateConstructorUsedError;
  String get meaningEn => throw _privateConstructorUsedError;
  String get example => throw _privateConstructorUsedError;
  String get difficulty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VocabWordCopyWith<VocabWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VocabWordCopyWith<$Res> {
  factory $VocabWordCopyWith(VocabWord value, $Res Function(VocabWord) then) =
      _$VocabWordCopyWithImpl<$Res, VocabWord>;
  @useResult
  $Res call(
      {String word,
      String phonetic,
      String meaningCn,
      String meaningEn,
      String example,
      String difficulty});
}

/// @nodoc
class _$VocabWordCopyWithImpl<$Res, $Val extends VocabWord>
    implements $VocabWordCopyWith<$Res> {
  _$VocabWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? phonetic = null,
    Object? meaningCn = null,
    Object? meaningEn = null,
    Object? example = null,
    Object? difficulty = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      phonetic: null == phonetic
          ? _value.phonetic
          : phonetic // ignore: cast_nullable_to_non_nullable
              as String,
      meaningCn: null == meaningCn
          ? _value.meaningCn
          : meaningCn // ignore: cast_nullable_to_non_nullable
              as String,
      meaningEn: null == meaningEn
          ? _value.meaningEn
          : meaningEn // ignore: cast_nullable_to_non_nullable
              as String,
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VocabWordImplCopyWith<$Res>
    implements $VocabWordCopyWith<$Res> {
  factory _$$VocabWordImplCopyWith(
          _$VocabWordImpl value, $Res Function(_$VocabWordImpl) then) =
      __$$VocabWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String word,
      String phonetic,
      String meaningCn,
      String meaningEn,
      String example,
      String difficulty});
}

/// @nodoc
class __$$VocabWordImplCopyWithImpl<$Res>
    extends _$VocabWordCopyWithImpl<$Res, _$VocabWordImpl>
    implements _$$VocabWordImplCopyWith<$Res> {
  __$$VocabWordImplCopyWithImpl(
      _$VocabWordImpl _value, $Res Function(_$VocabWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? phonetic = null,
    Object? meaningCn = null,
    Object? meaningEn = null,
    Object? example = null,
    Object? difficulty = null,
  }) {
    return _then(_$VocabWordImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      phonetic: null == phonetic
          ? _value.phonetic
          : phonetic // ignore: cast_nullable_to_non_nullable
              as String,
      meaningCn: null == meaningCn
          ? _value.meaningCn
          : meaningCn // ignore: cast_nullable_to_non_nullable
              as String,
      meaningEn: null == meaningEn
          ? _value.meaningEn
          : meaningEn // ignore: cast_nullable_to_non_nullable
              as String,
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VocabWordImpl implements _VocabWord {
  const _$VocabWordImpl(
      {required this.word,
      required this.phonetic,
      required this.meaningCn,
      required this.meaningEn,
      required this.example,
      this.difficulty = 'medium'});

  factory _$VocabWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VocabWordImplFromJson(json);

  @override
  final String word;
  @override
  final String phonetic;
  @override
  final String meaningCn;
  @override
  final String meaningEn;
  @override
  final String example;
  @override
  @JsonKey()
  final String difficulty;

  @override
  String toString() {
    return 'VocabWord(word: $word, phonetic: $phonetic, meaningCn: $meaningCn, meaningEn: $meaningEn, example: $example, difficulty: $difficulty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VocabWordImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.phonetic, phonetic) ||
                other.phonetic == phonetic) &&
            (identical(other.meaningCn, meaningCn) ||
                other.meaningCn == meaningCn) &&
            (identical(other.meaningEn, meaningEn) ||
                other.meaningEn == meaningEn) &&
            (identical(other.example, example) || other.example == example) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, word, phonetic, meaningCn, meaningEn, example, difficulty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VocabWordImplCopyWith<_$VocabWordImpl> get copyWith =>
      __$$VocabWordImplCopyWithImpl<_$VocabWordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VocabWordImplToJson(
      this,
    );
  }
}

abstract class _VocabWord implements VocabWord {
  const factory _VocabWord(
      {required final String word,
      required final String phonetic,
      required final String meaningCn,
      required final String meaningEn,
      required final String example,
      final String difficulty}) = _$VocabWordImpl;

  factory _VocabWord.fromJson(Map<String, dynamic> json) =
      _$VocabWordImpl.fromJson;

  @override
  String get word;
  @override
  String get phonetic;
  @override
  String get meaningCn;
  @override
  String get meaningEn;
  @override
  String get example;
  @override
  String get difficulty;
  @override
  @JsonKey(ignore: true)
  _$$VocabWordImplCopyWith<_$VocabWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyContent _$DailyContentFromJson(Map<String, dynamic> json) {
  return _DailyContent.fromJson(json);
}

/// @nodoc
mixin _$DailyContent {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get topicTheme => throw _privateConstructorUsedError;
  List<VocabWord> get words => throw _privateConstructorUsedError;
  String get articleTitle => throw _privateConstructorUsedError;
  String get articleBody => throw _privateConstructorUsedError;
  String get articleLevel => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyContentCopyWith<DailyContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyContentCopyWith<$Res> {
  factory $DailyContentCopyWith(
          DailyContent value, $Res Function(DailyContent) then) =
      _$DailyContentCopyWithImpl<$Res, DailyContent>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      String topicTheme,
      List<VocabWord> words,
      String articleTitle,
      String articleBody,
      String articleLevel,
      DateTime generatedAt});
}

/// @nodoc
class _$DailyContentCopyWithImpl<$Res, $Val extends DailyContent>
    implements $DailyContentCopyWith<$Res> {
  _$DailyContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? topicTheme = null,
    Object? words = null,
    Object? articleTitle = null,
    Object? articleBody = null,
    Object? articleLevel = null,
    Object? generatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      topicTheme: null == topicTheme
          ? _value.topicTheme
          : topicTheme // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<VocabWord>,
      articleTitle: null == articleTitle
          ? _value.articleTitle
          : articleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      articleBody: null == articleBody
          ? _value.articleBody
          : articleBody // ignore: cast_nullable_to_non_nullable
              as String,
      articleLevel: null == articleLevel
          ? _value.articleLevel
          : articleLevel // ignore: cast_nullable_to_non_nullable
              as String,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyContentImplCopyWith<$Res>
    implements $DailyContentCopyWith<$Res> {
  factory _$$DailyContentImplCopyWith(
          _$DailyContentImpl value, $Res Function(_$DailyContentImpl) then) =
      __$$DailyContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      String topicTheme,
      List<VocabWord> words,
      String articleTitle,
      String articleBody,
      String articleLevel,
      DateTime generatedAt});
}

/// @nodoc
class __$$DailyContentImplCopyWithImpl<$Res>
    extends _$DailyContentCopyWithImpl<$Res, _$DailyContentImpl>
    implements _$$DailyContentImplCopyWith<$Res> {
  __$$DailyContentImplCopyWithImpl(
      _$DailyContentImpl _value, $Res Function(_$DailyContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? topicTheme = null,
    Object? words = null,
    Object? articleTitle = null,
    Object? articleBody = null,
    Object? articleLevel = null,
    Object? generatedAt = null,
  }) {
    return _then(_$DailyContentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      topicTheme: null == topicTheme
          ? _value.topicTheme
          : topicTheme // ignore: cast_nullable_to_non_nullable
              as String,
      words: null == words
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<VocabWord>,
      articleTitle: null == articleTitle
          ? _value.articleTitle
          : articleTitle // ignore: cast_nullable_to_non_nullable
              as String,
      articleBody: null == articleBody
          ? _value.articleBody
          : articleBody // ignore: cast_nullable_to_non_nullable
              as String,
      articleLevel: null == articleLevel
          ? _value.articleLevel
          : articleLevel // ignore: cast_nullable_to_non_nullable
              as String,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyContentImpl implements _DailyContent {
  const _$DailyContentImpl(
      {required this.id,
      required this.userId,
      required this.date,
      required this.topicTheme,
      required final List<VocabWord> words,
      required this.articleTitle,
      required this.articleBody,
      required this.articleLevel,
      required this.generatedAt})
      : _words = words;

  factory _$DailyContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyContentImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  final String topicTheme;
  final List<VocabWord> _words;
  @override
  List<VocabWord> get words {
    if (_words is EqualUnmodifiableListView) return _words;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  final String articleTitle;
  @override
  final String articleBody;
  @override
  final String articleLevel;
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'DailyContent(id: $id, userId: $userId, date: $date, topicTheme: $topicTheme, words: $words, articleTitle: $articleTitle, articleBody: $articleBody, articleLevel: $articleLevel, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyContentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.topicTheme, topicTheme) ||
                other.topicTheme == topicTheme) &&
            const DeepCollectionEquality().equals(other._words, _words) &&
            (identical(other.articleTitle, articleTitle) ||
                other.articleTitle == articleTitle) &&
            (identical(other.articleBody, articleBody) ||
                other.articleBody == articleBody) &&
            (identical(other.articleLevel, articleLevel) ||
                other.articleLevel == articleLevel) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      date,
      topicTheme,
      const DeepCollectionEquality().hash(_words),
      articleTitle,
      articleBody,
      articleLevel,
      generatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyContentImplCopyWith<_$DailyContentImpl> get copyWith =>
      __$$DailyContentImplCopyWithImpl<_$DailyContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyContentImplToJson(
      this,
    );
  }
}

abstract class _DailyContent implements DailyContent {
  const factory _DailyContent(
      {required final String id,
      required final String userId,
      required final DateTime date,
      required final String topicTheme,
      required final List<VocabWord> words,
      required final String articleTitle,
      required final String articleBody,
      required final String articleLevel,
      required final DateTime generatedAt}) = _$DailyContentImpl;

  factory _DailyContent.fromJson(Map<String, dynamic> json) =
      _$DailyContentImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  String get topicTheme;
  @override
  List<VocabWord> get words;
  @override
  String get articleTitle;
  @override
  String get articleBody;
  @override
  String get articleLevel;
  @override
  DateTime get generatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DailyContentImplCopyWith<_$DailyContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
