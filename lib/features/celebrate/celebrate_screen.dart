import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/color_tokens.dart';
import '../../shared/widgets/lumo_button.dart';
import '../../shared/widgets/glass_card.dart';

class CelebrateScreen extends StatefulWidget {
  const CelebrateScreen({super.key});

  @override
  State<CelebrateScreen> createState() => _CelebrateScreenState();
}

class _CelebrateScreenState extends State<CelebrateScreen>
    with TickerProviderStateMixin {
  late AnimationController _streakCtrl;
  late Animation<double> _streakScale;
  late AnimationController _fadeCtrl;
  late Animation<double> _fade;

  static const _streakDay = 23;
  static const _wordsLearned = 10;
  static const _sampleWords = ['ephemeral', 'resilient', 'meticulous'];

  @override
  void initState() {
    super.initState();
    _streakCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _streakScale = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _streakCtrl, curve: Curves.easeInOut));

    _fadeCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _fade = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);

    Future.delayed(const Duration(milliseconds: 300), () {
      _streakCtrl.forward();
      _fadeCtrl.forward();
    });
  }

  @override
  void dispose() {
    _streakCtrl.dispose();
    _fadeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Scaffold(
      body: Stack(
        children: [
          // Glow burst from center
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 360,
                height: 360,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    tokens.primary.withOpacity(0.25),
                    tokens.error.withOpacity(0.1),
                    Colors.transparent,
                  ]),
                ),
              ),
            ),
          ),

          // Confetti-like floating dots
          ..._buildParticles(tokens),

          SafeArea(
            child: FadeTransition(
              opacity: _fade,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 48),

                    // Streak number — animated bounce
                    ScaleTransition(
                      scale: _streakScale,
                      child: Column(
                        children: [
                          const Text('🔥', style: TextStyle(fontSize: 52)),
                          const SizedBox(height: 12),
                          Text(
                            'Day $_streakDay Complete!',
                            style: TextStyle(
                              color: tokens.onSurface,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),
                    Text(
                      'You learned $_wordsLearned words today\nand read 1 article.',
                      style: TextStyle(
                          color: tokens.onSurfaceMuted,
                          fontSize: 16,
                          height: 1.5),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 32),

                    // Share card preview
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('🔥', style: TextStyle(fontSize: 18)),
                              const SizedBox(width: 6),
                              Text(
                                'Day $_streakDay · Lumo Learn',
                                style: TextStyle(
                                    color: tokens.onSurface,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('Today I learned:',
                              style: TextStyle(
                                  color: tokens.onSurfaceMuted, fontSize: 12)),
                          const SizedBox(height: 6),
                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            children: _sampleWords
                                .map((w) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: tokens.primary.withOpacity(0.12),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(w,
                                          style: TextStyle(
                                              color: tokens.primary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: 8),
                          Text('+ Read an article on Psychology',
                              style: TextStyle(
                                  color: tokens.onSurfaceMuted, fontSize: 12)),
                          const SizedBox(height: 10),
                          Divider(color: Colors.white.withOpacity(0.08)),
                          const SizedBox(height: 6),
                          Text('lumolearn.app',
                              style: TextStyle(
                                  color: tokens.onSurfaceMuted.withOpacity(0.5),
                                  fontSize: 11)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    LumoButton(
                      label: '📤   Share Your Progress',
                      onTap: () {
                        // TODO: screenshot + share_plus
                      },
                    ),
                    const SizedBox(height: 12),

                    GestureDetector(
                      onTap: () => context.go(AppRoutes.home),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          '→ Continue to Home',
                          style: TextStyle(
                            color: tokens.onSurfaceMuted,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildParticles(AppColorTokens tokens) {
    final positions = [
      (40.0, 120.0, tokens.primary),
      (320.0, 90.0, tokens.error),
      (60.0, 500.0, tokens.proGold),
      (340.0, 450.0, tokens.primary),
      (180.0, 80.0, tokens.success),
      (240.0, 600.0, tokens.error),
    ];
    return positions
        .map((p) => Positioned(
              left: p.$1,
              top: p.$2,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: p.$3.withOpacity(0.6)),
              ),
            ))
        .toList();
  }
}
