// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearningRecord _$LearningRecordFromJson(Map<String, dynamic> json) {
  return _LearningRecord.fromJson(json);
}

/// @nodoc
mixin _$LearningRecord {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  bool get wordsCompleted => throw _privateConstructorUsedError;
  int get wordsCount => throw _privateConstructorUsedError;
  bool get articleDone => throw _privateConstructorUsedError;
  bool get streakUsedFreeze => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearningRecordCopyWith<LearningRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningRecordCopyWith<$Res> {
  factory $LearningRecordCopyWith(
          LearningRecord value, $Res Function(LearningRecord) then) =
      _$LearningRecordCopyWithImpl<$Res, LearningRecord>;
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      bool wordsCompleted,
      int wordsCount,
      bool articleDone,
      bool streakUsedFreeze,
      DateTime? completedAt});
}

/// @nodoc
class _$LearningRecordCopyWithImpl<$Res, $Val extends LearningRecord>
    implements $LearningRecordCopyWith<$Res> {
  _$LearningRecordCopyWithImpl(this._value, this._then);

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
    Object? wordsCompleted = null,
    Object? wordsCount = null,
    Object? articleDone = null,
    Object? streakUsedFreeze = null,
    Object? completedAt = freezed,
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
      wordsCompleted: null == wordsCompleted
          ? _value.wordsCompleted
          : wordsCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      wordsCount: null == wordsCount
          ? _value.wordsCount
          : wordsCount // ignore: cast_nullable_to_non_nullable
              as int,
      articleDone: null == articleDone
          ? _value.articleDone
          : articleDone // ignore: cast_nullable_to_non_nullable
              as bool,
      streakUsedFreeze: null == streakUsedFreeze
          ? _value.streakUsedFreeze
          : streakUsedFreeze // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningRecordImplCopyWith<$Res>
    implements $LearningRecordCopyWith<$Res> {
  factory _$$LearningRecordImplCopyWith(_$LearningRecordImpl value,
          $Res Function(_$LearningRecordImpl) then) =
      __$$LearningRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      DateTime date,
      bool wordsCompleted,
      int wordsCount,
      bool articleDone,
      bool streakUsedFreeze,
      DateTime? completedAt});
}

/// @nodoc
class __$$LearningRecordImplCopyWithImpl<$Res>
    extends _$LearningRecordCopyWithImpl<$Res, _$LearningRecordImpl>
    implements _$$LearningRecordImplCopyWith<$Res> {
  __$$LearningRecordImplCopyWithImpl(
      _$LearningRecordImpl _value, $Res Function(_$LearningRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? wordsCompleted = null,
    Object? wordsCount = null,
    Object? articleDone = null,
    Object? streakUsedFreeze = null,
    Object? completedAt = freezed,
  }) {
    return _then(_$LearningRecordImpl(
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
      wordsCompleted: null == wordsCompleted
          ? _value.wordsCompleted
          : wordsCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      wordsCount: null == wordsCount
          ? _value.wordsCount
          : wordsCount // ignore: cast_nullable_to_non_nullable
              as int,
      articleDone: null == articleDone
          ? _value.articleDone
          : articleDone // ignore: cast_nullable_to_non_nullable
              as bool,
      streakUsedFreeze: null == streakUsedFreeze
          ? _value.streakUsedFreeze
          : streakUsedFreeze // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningRecordImpl implements _LearningRecord {
  const _$LearningRecordImpl(
      {required this.id,
      required this.userId,
      required this.date,
      this.wordsCompleted = false,
      this.wordsCount = 0,
      this.articleDone = false,
      this.streakUsedFreeze = false,
      this.completedAt});

  factory _$LearningRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final bool wordsCompleted;
  @override
  @JsonKey()
  final int wordsCount;
  @override
  @JsonKey()
  final bool articleDone;
  @override
  @JsonKey()
  final bool streakUsedFreeze;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'LearningRecord(id: $id, userId: $userId, date: $date, wordsCompleted: $wordsCompleted, wordsCount: $wordsCount, articleDone: $articleDone, streakUsedFreeze: $streakUsedFreeze, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.wordsCompleted, wordsCompleted) ||
                other.wordsCompleted == wordsCompleted) &&
            (identical(other.wordsCount, wordsCount) ||
                other.wordsCount == wordsCount) &&
            (identical(other.articleDone, articleDone) ||
                other.articleDone == articleDone) &&
            (identical(other.streakUsedFreeze, streakUsedFreeze) ||
                other.streakUsedFreeze == streakUsedFreeze) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, date, wordsCompleted,
      wordsCount, articleDone, streakUsedFreeze, completedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningRecordImplCopyWith<_$LearningRecordImpl> get copyWith =>
      __$$LearningRecordImplCopyWithImpl<_$LearningRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningRecordImplToJson(
      this,
    );
  }
}

abstract class _LearningRecord implements LearningRecord {
  const factory _LearningRecord(
      {required final String id,
      required final String userId,
      required final DateTime date,
      final bool wordsCompleted,
      final int wordsCount,
      final bool articleDone,
      final bool streakUsedFreeze,
      final DateTime? completedAt}) = _$LearningRecordImpl;

  factory _LearningRecord.fromJson(Map<String, dynamic> json) =
      _$LearningRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  bool get wordsCompleted;
  @override
  int get wordsCount;
  @override
  bool get articleDone;
  @override
  bool get streakUsedFreeze;
  @override
  DateTime? get completedAt;
  @override
  @JsonKey(ignore: true)
  _$$LearningRecordImplCopyWith<_$LearningRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
