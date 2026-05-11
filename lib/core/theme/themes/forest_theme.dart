import 'package:flutter/material.dart';
import '../color_tokens.dart';

/// Forest — emerald green + mint. Natural, relaxed daytime feel.
class ForestTheme {
  ForestTheme._();

  static const tokens = AppColorTokens(
    primary: Color(0xFF43E97B),
    primaryGradientEnd: Color(0xFF38F9D7),
    surface: Color(0xFF0F1E30),
    surfaceElevated: Color(0xFF162638),
    background: Color(0xFF0A1628),
    onPrimary: Color(0xFF0A1628),
    onSurface: Color(0xFFFFFFFF),
    onSurfaceMuted: Color(0x73FFFFFF),
    streak: Color(0xFFFF9500),
    success: Color(0xFF43E97B),
    error: Color(0xFFFF3B30),
    proGold: Color(0xFFE6A817),
    sceneGradientStart: Color(0xFF002211),
    sceneGradientEnd: Color(0xFF0A1628),
  );

  static ThemeData build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF0A1628) : const Color(0xFFF0FFF6);
    final surf = isDark ? const Color(0xFF0F1E30) : const Color(0xFFFFFFFF);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: const Color(0xFF43E97B),
        onPrimary: isDark ? const Color(0xFF0A1628) : Colors.white,
        secondary: const Color(0xFF38F9D7),
        onSecondary: const Color(0xFF0A1628),
        surface: surf,
        onSurface: isDark ? Colors.white : const Color(0xFF0A1628),
        error: const Color(0xFFFF3B30),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: bg,
      extensions: [tokens.copyWith(background: bg, surface: surf)],
    );
  }
}
