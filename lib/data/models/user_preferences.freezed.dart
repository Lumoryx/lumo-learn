// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<LearningGoal> get learningGoals => throw _privateConstructorUsedError;
  EnglishLevel get currentLevel => throw _privateConstructorUsedError;
  List<InterestTopic> get interests => throw _privateConstructorUsedError;
  String get uiLanguage => throw _privateConstructorUsedError;
  LumoTheme get theme => throw _privateConstructorUsedError;
  AppearanceMode get darkMode => throw _privateConstructorUsedError;
  bool get notifyEnabled => throw _privateConstructorUsedError;
  String? get notifyTime => throw _privateConstructorUsedError;
  bool get onboardingDone => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {String id,
      String userId,
      List<LearningGoal> learningGoals,
      EnglishLevel currentLevel,
      List<InterestTopic> interests,
      String uiLanguage,
      LumoTheme theme,
      AppearanceMode darkMode,
      bool notifyEnabled,
      String? notifyTime,
      bool onboardingDone,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? learningGoals = null,
    Object? currentLevel = null,
    Object? interests = null,
    Object? uiLanguage = null,
    Object? theme = null,
    Object? darkMode = null,
    Object? notifyEnabled = null,
    Object? notifyTime = freezed,
    Object? onboardingDone = null,
    Object? createdAt = null,
    Object? updatedAt = null,
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
      learningGoals: null == learningGoals
          ? _value.learningGoals
          : learningGoals // ignore: cast_nullable_to_non_nullable
              as List<LearningGoal>,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as EnglishLevel,
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestTopic>,
      uiLanguage: null == uiLanguage
          ? _value.uiLanguage
          : uiLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as LumoTheme,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as AppearanceMode,
      notifyEnabled: null == notifyEnabled
          ? _value.notifyEnabled
          : notifyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyTime: freezed == notifyTime
          ? _value.notifyTime
          : notifyTime // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingDone: null == onboardingDone
          ? _value.onboardingDone
          : onboardingDone // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      List<LearningGoal> learningGoals,
      EnglishLevel currentLevel,
      List<InterestTopic> interests,
      String uiLanguage,
      LumoTheme theme,
      AppearanceMode darkMode,
      bool notifyEnabled,
      String? notifyTime,
      bool onboardingDone,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? learningGoals = null,
    Object? currentLevel = null,
    Object? interests = null,
    Object? uiLanguage = null,
    Object? theme = null,
    Object? darkMode = null,
    Object? notifyEnabled = null,
    Object? notifyTime = freezed,
    Object? onboardingDone = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserPreferencesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      learningGoals: null == learningGoals
          ? _value._learningGoals
          : learningGoals // ignore: cast_nullable_to_non_nullable
              as List<LearningGoal>,
      currentLevel: null == currentLevel
          ? _value.currentLevel
          : currentLevel // ignore: cast_nullable_to_non_nullable
              as EnglishLevel,
      interests: null == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestTopic>,
      uiLanguage: null == uiLanguage
          ? _value.uiLanguage
          : uiLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as LumoTheme,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as AppearanceMode,
      notifyEnabled: null == notifyEnabled
          ? _value.notifyEnabled
          : notifyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyTime: freezed == notifyTime
          ? _value.notifyTime
          : notifyTime // ignore: cast_nullable_to_non_nullable
              as String?,
      onboardingDone: null == onboardingDone
          ? _value.onboardingDone
          : onboardingDone // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {required this.id,
      required this.userId,
      final List<LearningGoal> learningGoals = const [],
      this.currentLevel = EnglishLevel.beginner,
      final List<InterestTopic> interests = const [],
      this.uiLanguage = 'zh',
      this.theme = LumoTheme.midnight,
      this.darkMode = AppearanceMode.system,
      this.notifyEnabled = true,
      this.notifyTime,
      this.onboardingDone = false,
      required this.createdAt,
      required this.updatedAt})
      : _learningGoals = learningGoals,
        _interests = interests;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<LearningGoal> _learningGoals;
  @override
  @JsonKey()
  List<LearningGoal> get learningGoals {
    if (_learningGoals is EqualUnmodifiableListView) return _learningGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_learningGoals);
  }

  @override
  @JsonKey()
  final EnglishLevel currentLevel;
  final List<InterestTopic> _interests;
  @override
  @JsonKey()
  List<InterestTopic> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  @JsonKey()
  final String uiLanguage;
  @override
  @JsonKey()
  final LumoTheme theme;
  @override
  @JsonKey()
  final AppearanceMode darkMode;
  @override
  @JsonKey()
  final bool notifyEnabled;
  @override
  final String? notifyTime;
  @override
  @JsonKey()
  final bool onboardingDone;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserPreferences(id: $id, userId: $userId, learningGoals: $learningGoals, currentLevel: $currentLevel, interests: $interests, uiLanguage: $uiLanguage, theme: $theme, darkMode: $darkMode, notifyEnabled: $notifyEnabled, notifyTime: $notifyTime, onboardingDone: $onboardingDone, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._learningGoals, _learningGoals) &&
            (identical(other.currentLevel, currentLevel) ||
                other.currentLevel == currentLevel) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.uiLanguage, uiLanguage) ||
                other.uiLanguage == uiLanguage) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.notifyEnabled, notifyEnabled) ||
                other.notifyEnabled == notifyEnabled) &&
            (identical(other.notifyTime, notifyTime) ||
                other.notifyTime == notifyTime) &&
            (identical(other.onboardingDone, onboardingDone) ||
                other.onboardingDone == onboardingDone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      const DeepCollectionEquality().hash(_learningGoals),
      currentLevel,
      const DeepCollectionEquality().hash(_interests),
      uiLanguage,
      theme,
      darkMode,
      notifyEnabled,
      notifyTime,
      onboardingDone,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {required final String id,
      required final String userId,
      final List<LearningGoal> learningGoals,
      final EnglishLevel currentLevel,
      final List<InterestTopic> interests,
      final String uiLanguage,
      final LumoTheme theme,
      final AppearanceMode darkMode,
      final bool notifyEnabled,
      final String? notifyTime,
      final bool onboardingDone,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<LearningGoal> get learningGoals;
  @override
  EnglishLevel get currentLevel;
  @override
  List<InterestTopic> get interests;
  @override
  String get uiLanguage;
  @override
  LumoTheme get theme;
  @override
  AppearanceMode get darkMode;
  @override
  bool get notifyEnabled;
  @override
  String? get notifyTime;
  @override
  bool get onboardingDone;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
