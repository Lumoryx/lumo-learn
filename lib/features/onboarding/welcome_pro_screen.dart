import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/color_tokens.dart';
import '../../shared/widgets/lumo_button.dart';
import '../../shared/widgets/glass_card.dart';

class WelcomeProScreen extends StatefulWidget {
  const WelcomeProScreen({super.key});

  @override
  State<WelcomeProScreen> createState() => _WelcomeProScreenState();
}

class _WelcomeProScreenState extends State<WelcomeProScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  static const _features = [
    ('✨', 'Full AI-personalized content'),
    ('🔥', 'Streak freeze cards (3/month)'),
    ('🎨', 'All 4 premium themes'),
    ('📊', 'Complete learning analytics'),
    ('🚫', 'Zero ads, ever'),
  ];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _scale = CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut);
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Scaffold(
      body: Stack(
        children: [
          // Gold glow bg
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    tokens.proGold.withOpacity(0.18),
                    tokens.primary.withOpacity(0.12),
                    Colors.transparent,
                  ]),
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 60),

                  // Emoji + title
                  ScaleTransition(
                    scale: _scale,
                    child: Column(
                      children: [
                        const Text('🎉', style: TextStyle(fontSize: 56)),
                        const SizedBox(height: 16),
                        Text(
                          "You're Pro!",
                          style: TextStyle(
                            color: tokens.onSurface,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '14-day free trial activated',
                          style: TextStyle(
                            color: tokens.proGold,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Feature list card
                  GlassCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('What you unlocked:',
                            style: TextStyle(
                                color: tokens.onSurfaceMuted, fontSize: 13)),
                        const SizedBox(height: 16),
                        ..._features.map((f) => Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: Row(
                                children: [
                                  Text(f.$1,
                                      style: const TextStyle(fontSize: 20)),
                                  const SizedBox(width: 14),
                                  Text(f.$2,
                                      style: TextStyle(
                                        color: tokens.onSurface,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),

                  const SizedBox(height: 36),

                  LumoButton(
                    label: 'Start Learning →',
                    onTap: () => context.go(AppRoutes.home),
                  ),

                  const SizedBox(height: 16),
                  Text(
                    'No credit card needed · Cancel anytime',
                    style:
                        TextStyle(color: tokens.onSurfaceMuted, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
