// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LearningRecordImpl _$$LearningRecordImplFromJson(Map<String, dynamic> json) =>
    _$LearningRecordImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      wordsCompleted: json['wordsCompleted'] as bool? ?? false,
      wordsCount: (json['wordsCount'] as num?)?.toInt() ?? 0,
      articleDone: json['articleDone'] as bool? ?? false,
      streakUsedFreeze: json['streakUsedFreeze'] as bool? ?? false,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$LearningRecordImplToJson(
        _$LearningRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'wordsCompleted': instance.wordsCompleted,
      'wordsCount': instance.wordsCount,
      'articleDone': instance.articleDone,
      'streakUsedFreeze': instance.streakUsedFreeze,
      'completedAt': instance.completedAt?.toIso8601String(),
    };
