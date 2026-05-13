import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/color_tokens.dart';
import '../../shared/widgets/lumo_button.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/radial_glow.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  bool _isAnnual = true;

  static const _features = [
    ('✨', 'Full AI-personalized daily content'),
    ('🔥', 'Streak freeze cards (3/month)'),
    ('🎨', 'All 4 premium themes'),
    ('📊', 'Complete learning analytics'),
    ('📚', 'Unlimited vocabulary book'),
    ('🚫', 'Zero ads'),
    ('🎁', 'Earn FREE months by streak'),
  ];

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 80,
              right: -60,
              child: RadialGlow(
                  color: tokens.primary, radius: 200, opacity: 0.25)),
          Positioned(
              bottom: 120,
              left: -60,
              child: RadialGlow(
                  color: tokens.proGold, radius: 160, opacity: 0.15)),
          SafeArea(
            child: Column(
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: Icon(Icons.close,
                            color: tokens.onSurfaceMuted, size: 16),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      // Trial badge
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              tokens.primary,
                              tokens.primaryGradientEnd
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('14-day free trial',
                              style: TextStyle(
                                  color: tokens.onPrimary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Title
                      Text(
                        'Unlock Your Full\nLearning Potential',
                        style: TextStyle(
                          color: tokens.onSurface,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 28),

                      // Plan toggle
                      Row(
                        children: [
                          Expanded(
                              child: _PlanCard(
                            label: 'Monthly',
                            price: '\$6.99',
                            period: 'per month',
                            badge: null,
                            isSelected: !_isAnnual,
                            onTap: () => setState(() => _isAnnual = false),
                            tokens: tokens,
                          )),
                          const SizedBox(width: 12),
                          Expanded(
                              child: _PlanCard(
                            label: 'Annual',
                            price: '\$39.99',
                            period: 'per year',
                            badge: 'Save 52%',
                            isSelected: _isAnnual,
                            onTap: () => setState(() => _isAnnual = true),
                            tokens: tokens,
                          )),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Feature list
                      GlassCard(
                        child: Column(
                          children: _features
                              .map((f) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Row(
                                      children: [
                                        Text(f.$1,
                                            style:
                                                const TextStyle(fontSize: 18)),
                                        const SizedBox(width: 12),
                                        Text(f.$2,
                                            style: TextStyle(
                                                color: tokens.onSurface,
                                                fontSize: 14)),
                                        const Spacer(),
                                        Icon(Icons.check,
                                            color: tokens.success, size: 16),
                                      ],
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),

                      const SizedBox(height: 28),

                      LumoButton(
                        label: 'Start Free Trial',
                        onTap: () => context.go(AppRoutes.welcomePro),
                      ),

                      const SizedBox(height: 12),
                      Text(
                        'Cancel anytime · No charge during trial',
                        style: TextStyle(
                            color: tokens.onSurfaceMuted, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // TODO: RevenueCat restorePurchases
                          },
                          child: Text('Restore Purchase',
                              style: TextStyle(
                                  color: tokens.onSurfaceMuted,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline)),
                        ),
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

class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.label,
    required this.price,
    required this.period,
    required this.badge,
    required this.isSelected,
    required this.onTap,
    required this.tokens,
  });

  final String label;
  final String price;
  final String period;
  final String? badge;
  final bool isSelected;
  final VoidCallback onTap;
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? tokens.primary.withOpacity(0.12) : tokens.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? tokens.primary : Colors.white.withOpacity(0.1),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: tokens.proGold.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(badge!,
                    style: TextStyle(
                        color: tokens.proGold,
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
              ),
            Text(label,
                style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 13)),
            const SizedBox(height: 4),
            Text(price,
                style: TextStyle(
                    color: tokens.onSurface,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            Text(period,
                style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
