import 'package:freezed_annotation/freezed_annotation.dart';

part 'learning_record.freezed.dart';
part 'learning_record.g.dart';

@freezed
class LearningRecord with _$LearningRecord {
  const factory LearningRecord({
    required String id,
    required String userId,
    required DateTime date,
    @Default(false) bool wordsCompleted,
    @Default(0) int wordsCount,
    @Default(false) bool articleDone,
    @Default(false) bool streakUsedFreeze,
    DateTime? completedAt,
  }) = _LearningRecord;

  factory LearningRecord.fromJson(Map<String, dynamic> json) =>
      _$LearningRecordFromJson(json);
}
