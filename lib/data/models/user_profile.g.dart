// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      username: json['username'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      subscription: $enumDecodeNullable(
              _$SubscriptionTypeEnumMap, json['subscription']) ??
          SubscriptionType.free,
      trialEndsAt: json['trialEndsAt'] == null
          ? null
          : DateTime.parse(json['trialEndsAt'] as String),
      streakCount: (json['streakCount'] as num?)?.toInt() ?? 0,
      streakFreeze: (json['streakFreeze'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'subscription': _$SubscriptionTypeEnumMap[instance.subscription]!,
      'trialEndsAt': instance.trialEndsAt?.toIso8601String(),
      'streakCount': instance.streakCount,
      'streakFreeze': instance.streakFreeze,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.free: 'free',
  SubscriptionType.trial: 'trial',
  SubscriptionType.pro: 'pro',
};
