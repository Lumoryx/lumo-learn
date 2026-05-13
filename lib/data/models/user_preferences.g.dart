// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      learningGoals: (json['learningGoals'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$LearningGoalEnumMap, e))
              .toList() ??
          const [],
      currentLevel:
          $enumDecodeNullable(_$EnglishLevelEnumMap, json['currentLevel']) ??
              EnglishLevel.beginner,
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$InterestTopicEnumMap, e))
              .toList() ??
          const [],
      uiLanguage: json['uiLanguage'] as String? ?? 'zh',
      theme: $enumDecodeNullable(_$LumoThemeEnumMap, json['theme']) ??
          LumoTheme.midnight,
      darkMode:
          $enumDecodeNullable(_$AppearanceModeEnumMap, json['darkMode']) ??
              AppearanceMode.system,
      notifyEnabled: json['notifyEnabled'] as bool? ?? true,
      notifyTime: json['notifyTime'] as String?,
      onboardingDone: json['onboardingDone'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'learningGoals':
          instance.learningGoals.map((e) => _$LearningGoalEnumMap[e]!).toList(),
      'currentLevel': _$EnglishLevelEnumMap[instance.currentLevel]!,
      'interests':
          instance.interests.map((e) => _$InterestTopicEnumMap[e]!).toList(),
      'uiLanguage': instance.uiLanguage,
      'theme': _$LumoThemeEnumMap[instance.theme]!,
      'darkMode': _$AppearanceModeEnumMap[instance.darkMode]!,
      'notifyEnabled': instance.notifyEnabled,
      'notifyTime': instance.notifyTime,
      'onboardingDone': instance.onboardingDone,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$LearningGoalEnumMap = {
  LearningGoal.travel: 'travel',
  LearningGoal.career: 'career',
  LearningGoal.exam: 'exam',
  LearningGoal.immigration: 'immigration',
  LearningGoal.interest: 'interest',
};

const _$EnglishLevelEnumMap = {
  EnglishLevel.beginner: 'beginner',
  EnglishLevel.elementary: 'elementary',
  EnglishLevel.intermediate: 'intermediate',
  EnglishLevel.advanced: 'advanced',
};

const _$InterestTopicEnumMap = {
  InterestTopic.tech: 'tech',
  InterestTopic.business: 'business',
  InterestTopic.culture: 'culture',
  InterestTopic.sports: 'sports',
  InterestTopic.entertainment: 'entertainment',
  InterestTopic.travel: 'travel',
  InterestTopic.science: 'science',
  InterestTopic.food: 'food',
};

const _$LumoThemeEnumMap = {
  LumoTheme.midnight: 'midnight',
  LumoTheme.ocean: 'ocean',
  LumoTheme.forest: 'forest',
  LumoTheme.sand: 'sand',
};

const _$AppearanceModeEnumMap = {
  AppearanceMode.system: 'system',
  AppearanceMode.light: 'light',
  AppearanceMode.dark: 'dark',
};
