import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/color_tokens.dart';
import '../../shared/widgets/lumo_button.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/radial_glow.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageCtrl = PageController();
  int _step = 0;

  // Step 1: goal
  String? _selectedGoal;
  // Step 2: level
  int _levelIndex = 1;
  // Step 3: interests
  final Set<String> _selectedInterests = {};

  static const _goals = [
    ('✈️', 'Travel', 'Explore the world'),
    ('💼', 'Career', 'Advance professionally'),
    ('📝', 'Exam Prep', 'Ace your tests'),
    ('🌍', 'Immigration', 'Move abroad'),
    ('😊', 'Just for fun', 'Learn for pleasure'),
  ];

  static const _levels = [
    ('🌱', 'Beginner', 'Just starting out'),
    ('💬', 'Elementary', 'Basic conversations'),
    ('📚', 'Intermediate', 'Read & write well'),
    ('🎓', 'Advanced', 'Near native'),
  ];

  static const _interests = [
    ('💻', 'Technology'), ('💼', 'Business'), ('🎨', 'Culture'),
    ('⚽', 'Sports'), ('🎬', 'Entertainment'), ('✈️', 'Travel'),
    ('🔬', 'Science'), ('🍳', 'Food & Cooking'),
  ];

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  void _next() {
    if (_step < 2) {
      _pageCtrl.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() => _step++);
    } else {
      context.go(AppRoutes.welcomePro);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 60, right: -40, child: RadialGlow(color: tokens.primary, radius: 160, opacity: 0.25)),

          SafeArea(
            child: Column(
              children: [
                // Progress bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Step ${_step + 1} of 3',
                        style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: LinearProgressIndicator(
                          value: (_step + 1) / 3,
                          backgroundColor: Colors.white.withOpacity(0.1),
                          valueColor: AlwaysStoppedAnimation(tokens.primary),
                          minHeight: 4,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                Expanded(
                  child: PageView(
                    controller: _pageCtrl,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [_buildGoalStep(tokens), _buildLevelStep(tokens), _buildInterestsStep(tokens)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalStep(AppColorTokens tokens) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text('Why are you learning English?',
              style: TextStyle(color: tokens.onSurface, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('We\'ll personalize your daily content',
              style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 13)),
          const SizedBox(height: 28),
          ...(_goals.map((g) {
            final isSelected = _selectedGoal == g.$2;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => setState(() => _selectedGoal = g.$2),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected ? tokens.primary.withOpacity(0.15) : tokens.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? tokens.primary : Colors.white.withOpacity(0.1),
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(g.$1, style: const TextStyle(fontSize: 24)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(g.$2, style: TextStyle(color: tokens.onSurface, fontSize: 15, fontWeight: FontWeight.w600)),
                            Text(g.$3, style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 12)),
                          ],
                        ),
                      ),
                      if (isSelected) Icon(Icons.check_circle, color: tokens.primary, size: 20),
                    ],
                  ),
                ),
              ),
            );
          })),
          const Spacer(),
          LumoButton(label: 'Continue', onTap: _selectedGoal != null ? _next : null),
          const SizedBox(height: 12),
          Center(child: Text('🔒 Your data is private and never sold',
              style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 12))),
        ],
      ),
    );
  }

  Widget _buildLevelStep(AppColorTokens tokens) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text("What's your English level?",
              style: TextStyle(color: tokens.onSurface, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text("We'll match content to your current skills",
              style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 13)),
          const SizedBox(height: 28),
          ...(_levels.asMap().entries.map((e) {
            final i = e.key;
            final g = e.value;
            final isSelected = _levelIndex == i;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => setState(() => _levelIndex = i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected ? tokens.primary.withOpacity(0.15) : tokens.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? tokens.primary : Colors.white.withOpacity(0.1),
                      width: isSelected ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(g.$1, style: const TextStyle(fontSize: 24)),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(g.$2, style: TextStyle(color: tokens.onSurface, fontSize: 15, fontWeight: FontWeight.w600)),
                            Text(g.$3, style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 12)),
                          ],
                        ),
                      ),
                      if (isSelected) Icon(Icons.check_circle, color: tokens.primary, size: 20),
                    ],
                  ),
                ),
              ),
            );
          })),
          const Spacer(),
          LumoButton(label: 'Continue', onTap: _next),
        ],
      ),
    );
  }

  Widget _buildInterestsStep(AppColorTokens tokens) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text('Pick your favorite topics',
              style: TextStyle(color: tokens.onSurface, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Choose up to 3',
              style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 13)),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.2,
              children: _interests.map((t) {
                final isSelected = _selectedInterests.contains(t.$2);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedInterests.remove(t.$2);
                      } else if (_selectedInterests.length < 3) {
                        _selectedInterests.add(t.$2);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isSelected ? tokens.primary.withOpacity(0.15) : tokens.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected ? tokens.primary : Colors.white.withOpacity(0.1),
                        width: isSelected ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(t.$1, style: const TextStyle(fontSize: 20)),
                        const SizedBox(width: 8),
                        Text(t.$2, style: TextStyle(
                          color: isSelected ? tokens.onSurface : tokens.onSurfaceMuted,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        )),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          LumoButton(
            label: 'Continue',
            onTap: _selectedInterests.isNotEmpty ? _next : null,
          ),
        ],
      ),
    );
  }
}
