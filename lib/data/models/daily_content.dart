import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_content.freezed.dart';
part 'daily_content.g.dart';

@freezed
class VocabWord with _$VocabWord {
  const factory VocabWord({
    required String word,
    required String phonetic,
    required String meaningCn,
    required String meaningEn,
    required String example,
    @Default('medium') String difficulty,
  }) = _VocabWord;

  factory VocabWord.fromJson(Map<String, dynamic> json) =>
      _$VocabWordFromJson(json);
}

@freezed
class DailyContent with _$DailyContent {
  const factory DailyContent({
    required String id,
    required String userId,
    required DateTime date,
    required String topicTheme,
    required List<VocabWord> words,
    required String articleTitle,
    required String articleBody,
    required String articleLevel,
    required DateTime generatedAt,
  }) = _DailyContent;

  factory DailyContent.fromJson(Map<String, dynamic> json) =>
      _$DailyContentFromJson(json);
}
