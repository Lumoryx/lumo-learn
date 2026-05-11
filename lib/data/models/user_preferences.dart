import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/theme/app_theme.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

enum LearningGoal { travel, career, exam, immigration, interest }

enum EnglishLevel { beginner, elementary, intermediate, advanced }

enum InterestTopic { tech, business, culture, sports, entertainment, travel, science, food }

enum AppearanceMode { system, light, dark }

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required String id,
    required String userId,
    @Default([]) List<LearningGoal> learningGoals,
    @Default(EnglishLevel.beginner) EnglishLevel currentLevel,
    @Default([]) List<InterestTopic> interests,
    @Default('zh') String uiLanguage,
    @Default(LumoTheme.midnight) LumoTheme theme,
    @Default(AppearanceMode.system) AppearanceMode darkMode,
    @Default(true) bool notifyEnabled,
    String? notifyTime,
    @Default(false) bool onboardingDone,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}
