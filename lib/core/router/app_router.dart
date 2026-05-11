import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/auth_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/onboarding/welcome_pro_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/learn/words/flashcard_screen.dart';
import '../../features/learn/article/article_screen.dart';
import '../../features/celebrate/celebrate_screen.dart';
import '../../features/paywall/paywall_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/settings/theme/theme_picker_screen.dart';
import '../constants/app_routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: _SplashRedirect()),
      ),
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.welcomePro,
        builder: (context, state) => const WelcomeProScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.learnWords,
        builder: (context, state) => const FlashcardScreen(),
      ),
      GoRoute(
        path: AppRoutes.learnArticle,
        builder: (context, state) => const ArticleScreen(),
      ),
      GoRoute(
        path: AppRoutes.celebrate,
        builder: (context, state) => const CelebrateScreen(),
      ),
      GoRoute(
        path: AppRoutes.paywall,
        builder: (context, state) => const PaywallScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            path: 'theme',
            builder: (context, state) => const ThemePickerScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.uri}')),
    ),
  );
});

/// Handles splash → auth or home redirect based on auth state.
class _SplashRedirect extends ConsumerWidget {
  const _SplashRedirect();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: watch authStateProvider and redirect
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(AppRoutes.auth);
    });
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
