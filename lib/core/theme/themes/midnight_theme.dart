import 'package:flutter/material.dart';
import '../color_tokens.dart';

/// Midnight — default dark theme. Deep navy + aurora purple.
class MidnightTheme {
  MidnightTheme._();

  static const tokens = AppColorTokens(
    primary: Color(0xFF6C63FF),
    primaryGradientEnd: Color(0xFF9D97FF),
    surface: Color(0xFF16162A),
    surfaceElevated: Color(0xFF1E1E38),
    background: Color(0xFF0D0D1A),
    onPrimary: Color(0xFFFFFFFF),
    onSurface: Color(0xFFFFFFFF),
    onSurfaceMuted: Color(0x73FFFFFF),
    streak: Color(0xFFFF9500),
    success: Color(0xFF34C759),
    error: Color(0xFFFF3B30),
    proGold: Color(0xFFE6A817),
    sceneGradientStart: Color(0xFF1A0533),
    sceneGradientEnd: Color(0xFF0D0D1A),
  );

  static ThemeData build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF0D0D1A) : const Color(0xFFF5F5FF);
    final surf = isDark ? const Color(0xFF16162A) : const Color(0xFFFFFFFF);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: const Color(0xFF6C63FF),
        onPrimary: Colors.white,
        secondary: const Color(0xFFFF6584),
        onSecondary: Colors.white,
        surface: surf,
        onSurface: isDark ? Colors.white : const Color(0xFF0D0D1A),
        error: const Color(0xFFFF3B30),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: bg,
      extensions: [if (isDark) tokens else tokens.copyWith(background: bg, surface: surf)],
    );
  }
}
