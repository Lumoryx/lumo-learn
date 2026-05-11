import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../shared/widgets/lumo_button.dart';
import '../../../shared/widgets/radial_glow.dart';

const _sampleArticle = (
  title: 'Why Habits Stick',
  level: 'Intermediate',
  readMin: 3,
  body: '''Habits are the invisible architecture of our daily lives.

Scientists estimate that about 40% of our actions on any given day are not actual decisions, but habits. This means that nearly half of what we do every day runs on autopilot.

The key to forming a new habit lies in a neurological loop: a cue triggers a routine, which produces a reward. When this loop is repeated consistently, it becomes embedded in the brain's basal ganglia — the region associated with automatic behaviors.

Researchers at MIT discovered that as a behavior becomes habitual, brain activity shifts. Initially, the entire brain is active as we learn something new. Over time, activity decreases and consolidates into the basal ganglia, freeing up cognitive resources for other tasks.

This is why habit formation feels effortful at first but eventually becomes effortless. The challenge is persisting through the initial phase, where the brain is still building the neural pathways that will eventually make the behavior automatic.

Understanding this process can help us design better systems for learning — including language acquisition. By connecting new vocabulary to emotional experiences and consistent routines, we create the optimal conditions for words to move from conscious effort to automatic recall.''',
);

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool _isReading = false;
  double _scrollProgress = 0;
  final _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.maxScrollExtent > 0) {
        setState(() {
          _scrollProgress = _scrollCtrl.offset / _scrollCtrl.position.maxScrollExtent;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 100, right: -80, child: RadialGlow(color: tokens.primary, radius: 160, opacity: 0.2)),

          // Reading progress bar (top)
          Positioned(
            top: 0, left: 0, right: 0,
            child: LinearProgressIndicator(
              value: _scrollProgress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(tokens.primary),
              minHeight: 3,
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                // App bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Icon(Icons.arrow_back_ios_new, color: tokens.onSurfaceMuted, size: 20),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: tokens.surface,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white.withOpacity(0.1)),
                        ),
                        child: GestureDetector(
                          onTap: () => setState(() => _isReading = !_isReading),
                          child: Text(
                            _isReading ? '⏸ Stop' : '🔊 Listen',
                            style: TextStyle(color: tokens.primary, fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView(
                    controller: _scrollCtrl,
                    padding: const EdgeInsets.all(20),
                    children: [
                      // Hero scene image — atmospheric, related to article topic
                      _HeroSceneImage(tokens: tokens),
                      const SizedBox(height: 20),

                      // Level chip + read time
                      Row(
                        children: [
                          _Chip(label: _sampleArticle.level, color: tokens.primary, tokens: tokens),
                          const SizedBox(width: 8),
                          _Chip(label: '~${_sampleArticle.readMin} min read', color: tokens.onSurfaceMuted, tokens: tokens),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Title
                      Text(
                        _sampleArticle.title,
                        style: TextStyle(
                          color: tokens.onSurface,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Body — with selectable highlighted words
                      _ArticleBody(body: _sampleArticle.body, tokens: tokens),

                      const SizedBox(height: 32),

                      LumoButton(
                        label: 'Done Reading ✓',
                        onTap: () => context.go(AppRoutes.celebrate),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSceneImage extends StatelessWidget {
  const _HeroSceneImage({required this.tokens});
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.0, 0.4, 1.0],
          colors: [
            tokens.sceneGradientStart,
            tokens.primary.withOpacity(0.2),
            tokens.sceneGradientEnd,
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(top: 30, right: 40, child: Container(
            width: 80, height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: tokens.primary.withOpacity(0.12),
            ),
          )),
          Positioned(bottom: 20, left: 60, child: Container(
            width: 50, height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: tokens.error.withOpacity(0.1),
            ),
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_stories, color: tokens.primary.withOpacity(0.5), size: 36),
                const SizedBox(height: 8),
                Text(
                  'Scene · "Why Habits Stick"',
                  style: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.label, required this.color, required this.tokens});
  final String label;
  final Color color;
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }
}

class _ArticleBody extends StatelessWidget {
  const _ArticleBody({required this.body, required this.tokens});
  final String body;
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      style: TextStyle(
        color: tokens.onSurface.withOpacity(0.88),
        fontSize: 16,
        height: 1.7,
        letterSpacing: 0.1,
      ),
    );
  }
}
