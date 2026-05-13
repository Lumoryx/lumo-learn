import 'package:flutter/material.dart';
import '../color_tokens.dart';

/// Ocean — deep sea cyan + purple. Transparent, high-efficiency.
class OceanTheme {
  OceanTheme._();

  static const tokens = AppColorTokens(
    primary: Color(0xFF21D4FD),
    primaryGradientEnd: Color(0xFF60E0FF),
    surface: Color(0xFF0C2340),
    surfaceElevated: Color(0xFF122B4D),
    background: Color(0xFF071E3D),
    onPrimary: Color(0xFF071E3D),
    onSurface: Color(0xFFFFFFFF),
    onSurfaceMuted: Color(0x73FFFFFF),
    streak: Color(0xFFFF9500),
    success: Color(0xFF34C759),
    error: Color(0xFFFF3B30),
    proGold: Color(0xFFE6A817),
    sceneGradientStart: Color(0xFF001F3D),
    sceneGradientEnd: Color(0xFF071E3D),
  );

  static ThemeData build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF071E3D) : const Color(0xFFF0FBFF);
    final surf = isDark ? const Color(0xFF0C2340) : const Color(0xFFFFFFFF);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: const Color(0xFF21D4FD),
        onPrimary: isDark ? const Color(0xFF071E3D) : Colors.white,
        secondary: const Color(0xFFB721FF),
        onSecondary: Colors.white,
        surface: surf,
        onSurface: isDark ? Colors.white : const Color(0xFF071E3D),
        error: const Color(0xFFFF3B30),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: bg,
      extensions: [tokens.copyWith(background: bg, surface: surf)],
    );
  }
}
