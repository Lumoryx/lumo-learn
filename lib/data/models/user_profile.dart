import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

enum SubscriptionType { free, trial, pro }

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    String? username,
    String? avatarUrl,
    @Default(SubscriptionType.free) SubscriptionType subscription,
    DateTime? trialEndsAt,
    @Default(0) int streakCount,
    @Default(0) int streakFreeze,
    required DateTime createdAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
