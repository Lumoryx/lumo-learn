// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VocabWordImpl _$$VocabWordImplFromJson(Map<String, dynamic> json) =>
    _$VocabWordImpl(
      word: json['word'] as String,
      phonetic: json['phonetic'] as String,
      meaningCn: json['meaningCn'] as String,
      meaningEn: json['meaningEn'] as String,
      example: json['example'] as String,
      difficulty: json['difficulty'] as String? ?? 'medium',
    );

Map<String, dynamic> _$$VocabWordImplToJson(_$VocabWordImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'meaningCn': instance.meaningCn,
      'meaningEn': instance.meaningEn,
      'example': instance.example,
      'difficulty': instance.difficulty,
    };

_$DailyContentImpl _$$DailyContentImplFromJson(Map<String, dynamic> json) =>
    _$DailyContentImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      topicTheme: json['topicTheme'] as String,
      words: (json['words'] as List<dynamic>)
          .map((e) => VocabWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      articleTitle: json['articleTitle'] as String,
      articleBody: json['articleBody'] as String,
      articleLevel: json['articleLevel'] as String,
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$$DailyContentImplToJson(_$DailyContentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'date': instance.date.toIso8601String(),
      'topicTheme': instance.topicTheme,
      'words': instance.words,
      'articleTitle': instance.articleTitle,
      'articleBody': instance.articleBody,
      'articleLevel': instance.articleLevel,
      'generatedAt': instance.generatedAt.toIso8601String(),
    };
