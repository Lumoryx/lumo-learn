import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../shared/widgets/glass_card.dart';

class ThemePickerScreen extends StatefulWidget {
  const ThemePickerScreen({super.key});

  @override
  State<ThemePickerScreen> createState() => _ThemePickerScreenState();
}

class _ThemePickerScreenState extends State<ThemePickerScreen> {
  LumoTheme _selected = LumoTheme.midnight;
  String _appearance = 'Dark';

  static const _milestoneThemes = [
    ('Aurora', 'Streak 7 days', 7, false),
    ('Crimson', 'Streak 30 days', 30, false),
    ('Obsidian', 'Streak 100 days', 100, false),
  ];

  static const _themeColors = {
    LumoTheme.midnight: (Color(0xFF6C63FF), Color(0xFF0D0D1A)),
    LumoTheme.ocean: (Color(0xFF21D4FD), Color(0xFF071E3D)),
    LumoTheme.forest: (Color(0xFF43E97B), Color(0xFF0A1628)),
    LumoTheme.sand: (Color(0xFFE6A817), Color(0xFF1A120B)),
  };

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new, color: tokens.onSurfaceMuted, size: 20),
        ),
        title: Text('Theme', style: TextStyle(color: tokens.onSurface, fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          // Main themes grid
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: LumoTheme.values.map((theme) {
              final colors = _themeColors[theme]!;
              final isSelected = _selected == theme;
              return GestureDetector(
                onTap: () => setState(() => _selected = theme),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? colors.$1 : Colors.white.withOpacity(0.1),
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        // Color preview
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [colors.$2, colors.$1.withOpacity(0.6)],
                            ),
                          ),
                        ),
                        // Dots
                        Positioned(top: 16, right: 16, child: Container(
                          width: 20, height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors.$1.withOpacity(0.8),
                          ),
                        )),
                        Positioned(bottom: 36, left: 16, child: Container(
                          width: 12, height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                        )),
                        // Label
                        Positioned(
                          bottom: 12, left: 12, right: 12,
                          child: Row(
                            children: [
                              Text(theme.label,
                                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600)),
                              const Spacer(),
                              if (isSelected)
                                Icon(Icons.check_circle, color: colors.$1, size: 18),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Milestone-unlocked themes
          Text('UNLOCKED BY STREAKS',
              style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1)),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: _milestoneThemes.map((t) {
              return Container(
                decoration: BoxDecoration(
                  color: tokens.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white.withOpacity(0.08)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline, color: tokens.onSurfaceMuted, size: 20),
                    const SizedBox(height: 6),
                    Text(t.$1, style: TextStyle(color: tokens.onSurface, fontSize: 12, fontWeight: FontWeight.w600)),
                    Text(t.$2, style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 10)),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Appearance mode
          Text('APPEARANCE',
              style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1)),
          const SizedBox(height: 12),
          GlassCard(
            child: Row(
              children: ['System', 'Light', 'Dark'].map((mode) {
                final isSelected = _appearance == mode;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _appearance = mode),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: mode == 'Light' ? 6 : 0),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? tokens.primary.withOpacity(0.2) : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: isSelected ? Border.all(color: tokens.primary.withOpacity(0.5)) : null,
                      ),
                      child: Text(
                        mode,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isSelected ? tokens.primary : tokens.onSurfaceMuted,
                          fontSize: 13,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
