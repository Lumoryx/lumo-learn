import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/color_tokens.dart';
import '../../shared/widgets/lumo_button.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/radial_glow.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Scaffold(
      body: Stack(
        children: [
          // Background glows
          Positioned(top: 80, left: -60, child: RadialGlow(color: tokens.primary, radius: 180, opacity: 0.3)),
          Positioned(bottom: 200, right: -80, child: RadialGlow(color: tokens.error, radius: 150, opacity: 0.2)),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),

                  // Title
                  Text(
                    'Welcome to\nLumo Learn',
                    style: TextStyle(
                      color: tokens.onSurface,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Start your 14-day free Pro trial',
                    style: TextStyle(
                      color: tokens.primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 48),

                  // Apple login
                  LumoOutlineButton(
                    label: '🍎   Continue with Apple',
                    onTap: _loading ? null : _signInWithApple,
                    height: 56,
                  ),
                  const SizedBox(height: 12),

                  // Google login
                  LumoOutlineButton(
                    label: 'G   Continue with Google',
                    onTap: _loading ? null : _signInWithGoogle,
                    height: 56,
                  ),

                  const SizedBox(height: 28),

                  // Divider
                  Row(children: [
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('or', style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 13)),
                    ),
                    Expanded(child: Divider(color: Colors.white.withOpacity(0.1))),
                  ]),

                  const SizedBox(height: 20),

                  // Email input
                  _InputField(controller: _emailCtrl, hint: 'Email address', isPassword: false),
                  const SizedBox(height: 12),
                  _InputField(controller: _passCtrl, hint: 'Password', isPassword: true),

                  const SizedBox(height: 24),
                  LumoButton(
                    label: 'Sign in with Email',
                    onTap: _loading ? null : _signInWithEmail,
                    isLoading: _loading,
                  ),

                  const SizedBox(height: 24),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Don't have an account? Sign up",
                        style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 13),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      'By continuing you agree to our Terms of Service',
                      style: TextStyle(color: tokens.onSurfaceMuted.withOpacity(0.5), fontSize: 11),
                      textAlign: TextAlign.center,
                    ),
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

  void _signInWithApple() {
    // TODO: implement Apple sign-in via Supabase
    _navigateNext();
  }

  void _signInWithGoogle() {
    // TODO: implement Google sign-in via Supabase
    _navigateNext();
  }

  void _signInWithEmail() {
    // TODO: implement email sign-in via Supabase
    _navigateNext();
  }

  void _navigateNext() {
    // TODO: check if onboarding done → home, else → onboarding
    context.go(AppRoutes.onboarding);
  }
}

class _InputField extends StatelessWidget {
  const _InputField({required this.controller, required this.hint, required this.isPassword});

  final TextEditingController controller;
  final String hint;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      borderRadius: 14,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(color: tokens.onSurface, fontSize: 15),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: tokens.onSurfaceMuted, fontSize: 15),
        ),
      ),
    );
  }
}
