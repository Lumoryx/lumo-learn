import 'package:flutter/material.dart';
import 'themes/midnight_theme.dart';
import 'themes/ocean_theme.dart';
import 'themes/forest_theme.dart';
import 'themes/sand_theme.dart';

enum LumoTheme { midnight, ocean, forest, sand }

extension LumoThemeExt on LumoTheme {
  String get label => switch (this) {
        LumoTheme.midnight => 'Midnight',
        LumoTheme.ocean => 'Ocean',
        LumoTheme.forest => 'Forest',
        LumoTheme.sand => 'Sand',
      };

  ThemeData light() => switch (this) {
        LumoTheme.midnight => MidnightTheme.build(Brightness.light),
        LumoTheme.ocean => OceanTheme.build(Brightness.light),
        LumoTheme.forest => ForestTheme.build(Brightness.light),
        LumoTheme.sand => SandTheme.build(Brightness.light),
      };

  ThemeData dark() => switch (this) {
        LumoTheme.midnight => MidnightTheme.build(Brightness.dark),
        LumoTheme.ocean => OceanTheme.build(Brightness.dark),
        LumoTheme.forest => ForestTheme.build(Brightness.dark),
        LumoTheme.sand => SandTheme.build(Brightness.dark),
      };
}
