import 'package:flutter/material.dart';
import '../color_tokens.dart';

/// Sand — warm gold + coral. Elegant, café aesthetic.
class SandTheme {
  SandTheme._();

  static const tokens = AppColorTokens(
    primary: Color(0xFFE6A817),
    primaryGradientEnd: Color(0xFFF5C842),
    surface: Color(0xFF261A0E),
    surfaceElevated: Color(0xFF2F2014),
    background: Color(0xFF1A120B),
    onPrimary: Color(0xFF1A120B),
    onSurface: Color(0xFFFFFFFF),
    onSurfaceMuted: Color(0x73FFFFFF),
    streak: Color(0xFFFF9500),
    success: Color(0xFF34C759),
    error: Color(0xFFFF3B30),
    proGold: Color(0xFFE6A817),
    sceneGradientStart: Color(0xFF2D1800),
    sceneGradientEnd: Color(0xFF1A120B),
  );

  static ThemeData build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF1A120B) : const Color(0xFFFFF8F0);
    final surf = isDark ? const Color(0xFF261A0E) : const Color(0xFFFFFFFF);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: const Color(0xFFE6A817),
        onPrimary: isDark ? const Color(0xFF1A120B) : Colors.white,
        secondary: const Color(0xFFFF7043),
        onSecondary: Colors.white,
        surface: surf,
        onSurface: isDark ? Colors.white : const Color(0xFF1A120B),
        error: const Color(0xFFFF3B30),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: bg,
      extensions: [tokens.copyWith(background: bg, surface: surf)],
    );
  }
}
