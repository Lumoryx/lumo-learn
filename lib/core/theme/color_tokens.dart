import 'package:flutter/material.dart';

/// Semantic color tokens injected via ThemeExtension.
/// Access via: Theme.of(context).extension<AppColorTokens>()!
class AppColorTokens extends ThemeExtension<AppColorTokens> {
  const AppColorTokens({
    required this.primary,
    required this.primaryGradientEnd,
    required this.surface,
    required this.surfaceElevated,
    required this.background,
    required this.onPrimary,
    required this.onSurface,
    required this.onSurfaceMuted,
    required this.streak,
    required this.success,
    required this.error,
    required this.proGold,
    required this.sceneGradientStart,
    required this.sceneGradientEnd,
  });

  final Color primary;
  final Color primaryGradientEnd;
  final Color surface;
  final Color surfaceElevated;
  final Color background;
  final Color onPrimary;
  final Color onSurface;
  final Color onSurfaceMuted;
  final Color streak;
  final Color success;
  final Color error;
  final Color proGold;
  final Color sceneGradientStart;
  final Color sceneGradientEnd;

  @override
  AppColorTokens copyWith({
    Color? primary,
    Color? primaryGradientEnd,
    Color? surface,
    Color? surfaceElevated,
    Color? background,
    Color? onPrimary,
    Color? onSurface,
    Color? onSurfaceMuted,
    Color? streak,
    Color? success,
    Color? error,
    Color? proGold,
    Color? sceneGradientStart,
    Color? sceneGradientEnd,
  }) {
    return AppColorTokens(
      primary: primary ?? this.primary,
      primaryGradientEnd: primaryGradientEnd ?? this.primaryGradientEnd,
      surface: surface ?? this.surface,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      background: background ?? this.background,
      onPrimary: onPrimary ?? this.onPrimary,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceMuted: onSurfaceMuted ?? this.onSurfaceMuted,
      streak: streak ?? this.streak,
      success: success ?? this.success,
      error: error ?? this.error,
      proGold: proGold ?? this.proGold,
      sceneGradientStart: sceneGradientStart ?? this.sceneGradientStart,
      sceneGradientEnd: sceneGradientEnd ?? this.sceneGradientEnd,
    );
  }

  @override
  AppColorTokens lerp(AppColorTokens? other, double t) {
    if (other == null) return this;
    return AppColorTokens(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryGradientEnd:
          Color.lerp(primaryGradientEnd, other.primaryGradientEnd, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      background: Color.lerp(background, other.background, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceMuted: Color.lerp(onSurfaceMuted, other.onSurfaceMuted, t)!,
      streak: Color.lerp(streak, other.streak, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      proGold: Color.lerp(proGold, other.proGold, t)!,
      sceneGradientStart:
          Color.lerp(sceneGradientStart, other.sceneGradientStart, t)!,
      sceneGradientEnd:
          Color.lerp(sceneGradientEnd, other.sceneGradientEnd, t)!,
    );
  }
}
