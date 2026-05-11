import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/color_tokens.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/lumo_button.dart';
import '../../shared/widgets/radial_glow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _greeting() {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning ☀️';
    if (h < 18) return 'Good afternoon 🌤';
    return 'Good evening 🌙';
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    // TODO: replace with real data from providers
    const streakCount = 23;
    const todayTheme = 'The Psychology of Habits';
    const wordsCount = 10;
    const wordsProgress = 0.0;
    const articleTitle = 'Why Habits Stick';
    const articleLevel = 'Intermediate';
    const loyaltyDone = 22;
    const loyaltyTotal = 30;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -40,
              left: -60,
              child:
                  RadialGlow(color: tokens.primary, radius: 200, opacity: 0.2)),
          Positioned(
              bottom: 100,
              right: -60,
              child:
                  RadialGlow(color: tokens.error, radius: 150, opacity: 0.12)),
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const SizedBox(height: 20),

                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_greeting(),
                            style: TextStyle(
                                color: tokens.onSurface,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        _StreakBadge(count: streakCount, tokens: tokens),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => context.push(AppRoutes.settings),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: tokens.surface,
                          border:
                              Border.all(color: Colors.white.withOpacity(0.1)),
                        ),
                        child: Icon(Icons.person_outline,
                            color: tokens.onSurfaceMuted, size: 20),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // Words card
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: tokens.primary.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('Today\'s Theme',
                                style: TextStyle(
                                    color: tokens.primary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(todayTheme,
                          style: TextStyle(
                              color: tokens.onSurface,
                              fontSize: 17,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Text('📚', style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 8),
                          Text('$wordsCount Words',
                              style: TextStyle(
                                  color: tokens.onSurface,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          const Spacer(),
                          Text('${(wordsProgress * 100).toInt()}%',
                              style: TextStyle(
                                  color: tokens.onSurfaceMuted, fontSize: 13)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: wordsProgress,
                          backgroundColor: Colors.white.withOpacity(0.1),
                          valueColor: AlwaysStoppedAnimation(tokens.primary),
                          minHeight: 5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      LumoButton(
                        label: 'Start Learning →',
                        onTap: () => context.push(AppRoutes.learnWords),
                        height: 48,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // Article card
                GlassCard(
                  child: Row(
                    children: [
                      // Scene thumbnail
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              tokens.primary.withOpacity(0.3),
                              tokens.error.withOpacity(0.2)
                            ],
                          ),
                        ),
                        child: const Center(
                            child: Text('📖', style: TextStyle(fontSize: 28))),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Article',
                                style: TextStyle(
                                    color: tokens.primary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text(articleTitle,
                                style: TextStyle(
                                    color: tokens.onSurface,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 4),
                            Text('~3 min · $articleLevel',
                                style: TextStyle(
                                    color: tokens.onSurfaceMuted,
                                    fontSize: 12)),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () => context.push(AppRoutes.learnArticle),
                              child: Text('Read Now →',
                                  style: TextStyle(
                                      color: tokens.primary,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Weekly calendar
                Text('This Week',
                    style: TextStyle(
                        color: tokens.onSurface,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 12),
                _WeekCalendar(tokens: tokens),

                const SizedBox(height: 20),

                // Loyalty reward card (Pro only)
                GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('🎁', style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 8),
                          Text('Loyalty Reward',
                              style: TextStyle(
                                  color: tokens.proGold,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Keep going for ${loyaltyTotal - loyaltyDone} more days to earn your FREE month!',
                        style: TextStyle(color: tokens.onSurface, fontSize: 13),
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: loyaltyDone / loyaltyTotal,
                          backgroundColor: Colors.white.withOpacity(0.1),
                          valueColor: AlwaysStoppedAnimation(tokens.proGold),
                          minHeight: 6,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text('$loyaltyDone/$loyaltyTotal days',
                          style: TextStyle(
                              color: tokens.onSurfaceMuted, fontSize: 12)),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StreakBadge extends StatelessWidget {
  const _StreakBadge({required this.count, required this.tokens});
  final int count;
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('🔥', style: TextStyle(fontSize: 18)),
        const SizedBox(width: 4),
        Text(
          'Day $count streak',
          style: TextStyle(
              color: tokens.streak, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _WeekCalendar extends StatelessWidget {
  const _WeekCalendar({required this.tokens});
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    const days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    // TODO: populate from real learning records
    const done = [true, true, true, false, false, false, false];
    final today = DateTime.now().weekday - 1; // 0=Mon

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (i) {
        final isDone = done[i];
        final isToday = i == today;
        return Column(
          children: [
            Text(days[i],
                style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 12)),
            const SizedBox(height: 6),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isDone ? tokens.primary.withOpacity(0.2) : tokens.surface,
                border: Border.all(
                  color:
                      isToday ? tokens.primary : Colors.white.withOpacity(0.08),
                  width: isToday ? 2 : 1,
                ),
              ),
              child: Center(
                child: Text(
                  isDone ? '✓' : '',
                  style: TextStyle(
                      color: tokens.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
