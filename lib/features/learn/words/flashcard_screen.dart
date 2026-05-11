import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../shared/widgets/radial_glow.dart';

// Placeholder words — will be replaced by real DailyContent from provider
final _sampleWords = [
  (
    'ephemeral',
    '/ɪˈfem.ər.əl/',
    '短暂的；转瞬即逝的',
    'adj. lasting for only a short time',
    '"Fame is ephemeral, but character endures."'
  ),
  (
    'resilient',
    '/rɪˈzɪl.i.ənt/',
    '有弹性的；适应力强的',
    'adj. able to recover quickly from difficulties',
    '"She remained resilient through every challenge."'
  ),
  (
    'meticulous',
    '/məˈtɪk.jʊ.ləs/',
    '一丝不苟的；极其细心的',
    'adj. very careful and precise',
    '"He was meticulous in his research."'
  ),
];

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen>
    with TickerProviderStateMixin {
  int _current = 0;
  bool _isFlipped = false;
  late AnimationController _flipCtrl;
  late Animation<double> _flipAnim;

  @override
  void initState() {
    super.initState();
    _flipCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _flipAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipCtrl.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFlipped) {
      _flipCtrl.reverse();
    } else {
      _flipCtrl.forward();
    }
    setState(() => _isFlipped = !_isFlipped);
  }

  void _next(bool knew) {
    // TODO: record result to learning record
    if (_current < _sampleWords.length - 1) {
      _flipCtrl.reset();
      setState(() {
        _isFlipped = false;
        _current++;
      });
    } else {
      context.go(AppRoutes.celebrate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    final word = _sampleWords[_current];

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 60,
              left: -80,
              child: RadialGlow(
                  color: tokens.primary, radius: 180, opacity: 0.25)),
          Positioned(
              bottom: 200,
              right: -60,
              child:
                  RadialGlow(color: tokens.error, radius: 120, opacity: 0.18)),
          SafeArea(
            child: Column(
              children: [
                // Top bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: tokens.onSurfaceMuted, size: 20),
                      ),
                      const Spacer(),
                      Text(
                        '${_current + 1} / ${_sampleWords.length}',
                        style: TextStyle(
                            color: tokens.onSurfaceMuted,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Progress
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: (_current + 1) / _sampleWords.length,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation(tokens.primary),
                      minHeight: 3,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Scene image — AI-generated contextual image placeholder
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _SceneImage(word: word.$1, tokens: tokens),
                ),

                const SizedBox(height: 24),

                // Flip card
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: _flipCard,
                      child: AnimatedBuilder(
                        animation: _flipAnim,
                        builder: (_, __) {
                          final angle = _flipAnim.value * pi;
                          final isBack = angle > pi / 2;
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..setEntry(3, 2, 0.001)
                              ..rotateY(angle),
                            child: isBack
                                ? Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.identity()..rotateY(pi),
                                    child:
                                        _CardBack(word: word, tokens: tokens),
                                  )
                                : _CardFront(word: word, tokens: tokens),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Action buttons (only when flipped)
                AnimatedOpacity(
                  opacity: _isFlipped ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _next(false),
                            child: Container(
                              height: 52,
                              decoration: BoxDecoration(
                                color: tokens.error.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                    color: tokens.error.withOpacity(0.4)),
                              ),
                              alignment: Alignment.center,
                              child: Text('✗  Forgot',
                                  style: TextStyle(
                                      color: tokens.error,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _next(true),
                            child: Container(
                              height: 52,
                              decoration: BoxDecoration(
                                color: tokens.success.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                    color: tokens.success.withOpacity(0.4)),
                              ),
                              alignment: Alignment.center,
                              child: Text('✓  Got it!',
                                  style: TextStyle(
                                      color: tokens.success,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                      ],
                    ),
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

/// AI-generated scene image placeholder with atmospheric gradient.
class _SceneImage extends StatelessWidget {
  const _SceneImage({required this.word, required this.tokens});
  final String word;
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            tokens.sceneGradientStart,
            tokens.primary.withOpacity(0.3),
            tokens.sceneGradientEnd,
          ],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Stack(
        children: [
          // Bokeh dots
          for (final pos in [(0.2, 0.3), (0.7, 0.5), (0.5, 0.8), (0.9, 0.2)])
            Positioned(
              left: MediaQuery.of(context).size.width * pos.$1 - 40,
              top: 160 * pos.$2,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: tokens.primary.withOpacity(0.1),
                ),
              ),
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome,
                    color: tokens.primary.withOpacity(0.6), size: 28),
                const SizedBox(height: 6),
                Text(
                  'Scene · "$word"',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CardFront extends StatelessWidget {
  const _CardFront({required this.word, required this.tokens});
  final (String, String, String, String, String) word;
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            word.$1,
            style: TextStyle(
              color: tokens.onSurface,
              fontSize: 38,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            word.$2,
            style: TextStyle(
              color: tokens.primary,
              fontSize: 17,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 24),
          Divider(
              color: Colors.white.withOpacity(0.08), indent: 40, endIndent: 40),
          const SizedBox(height: 16),
          Text(
            'Tap to reveal',
            style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 13),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: tokens.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text('🔊 Listen',
                style: TextStyle(
                    color: tokens.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}

class _CardBack extends StatelessWidget {
  const _CardBack({required this.word, required this.tokens});
  final (String, String, String, String, String) word;
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: tokens.primary.withOpacity(0.3)),
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(word.$3,
              style: TextStyle(
                  color: tokens.onSurface,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.3)),
          const SizedBox(height: 8),
          Text(word.$4,
              style: TextStyle(
                  color: tokens.onSurfaceMuted, fontSize: 15, height: 1.4)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withOpacity(0.06)),
            ),
            child: Text(
              word.$5,
              style: TextStyle(
                color: tokens.onSurface.withOpacity(0.85),
                fontSize: 14,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
