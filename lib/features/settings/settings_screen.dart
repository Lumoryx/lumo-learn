import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_routes.dart';
import '../../core/theme/color_tokens.dart';
import '../../shared/widgets/glass_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Icon(Icons.arrow_back_ios_new,
              color: tokens.onSurfaceMuted, size: 20),
        ),
        title: Text('Settings',
            style: TextStyle(
                color: tokens.onSurface,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        children: [
          // Profile card
          GlassCard(
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [tokens.primary, tokens.primaryGradientEnd]),
                  ),
                  child: const Center(
                      child: Text('👤', style: TextStyle(fontSize: 22))),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('User Name',
                          style: TextStyle(
                              color: tokens.onSurface,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      Text('user@example.com',
                          style: TextStyle(
                              color: tokens.onSurfaceMuted, fontSize: 13)),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: tokens.proGold.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text('PRO',
                      style: TextStyle(
                          color: tokens.proGold,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _SectionTitle(title: 'Preferences', tokens: tokens),
          const SizedBox(height: 8),
          GlassCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _SettingsTile(
                    icon: '🎨',
                    label: 'Theme & Appearance',
                    onTap: () => context.push(AppRoutes.settingsTheme),
                    tokens: tokens),
                _Divider(),
                _SettingsTile(
                    icon: '🌐',
                    label: 'Language',
                    trailing: 'English',
                    onTap: () {},
                    tokens: tokens),
                _Divider(),
                _SettingsTile(
                    icon: '🔔',
                    label: 'Notifications',
                    onTap: () {},
                    tokens: tokens),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _SectionTitle(title: 'Subscription', tokens: tokens),
          const SizedBox(height: 8),
          GlassCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _SettingsTile(
                    icon: '⭐',
                    label: 'Manage Subscription',
                    trailing: 'Pro',
                    onTap: () => context.push(AppRoutes.paywall),
                    tokens: tokens),
                _Divider(),
                _SettingsTile(
                    icon: '🎁',
                    label: 'Loyalty Reward Progress',
                    trailing: '22/30 days',
                    onTap: () {},
                    tokens: tokens),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _SectionTitle(title: 'Support', tokens: tokens),
          const SizedBox(height: 8),
          GlassCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _SettingsTile(
                    icon: '❓',
                    label: 'Help & Feedback',
                    onTap: () {},
                    tokens: tokens),
                _Divider(),
                _SettingsTile(
                    icon: '📜',
                    label: 'Terms of Service',
                    onTap: () {},
                    tokens: tokens),
                _Divider(),
                _SettingsTile(
                    icon: '🔒',
                    label: 'Privacy Policy',
                    onTap: () {},
                    tokens: tokens),
              ],
            ),
          ),

          const SizedBox(height: 20),

          GlassCard(
            padding: EdgeInsets.zero,
            child: _SettingsTile(
              icon: '🚪',
              label: 'Sign Out',
              onTap: () => context.go(AppRoutes.auth),
              tokens: tokens,
              labelColor: tokens.error,
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.tokens});
  final String title;
  final AppColorTokens tokens;

  @override
  Widget build(BuildContext context) {
    return Text(title.toUpperCase(),
        style: TextStyle(
            color: tokens.onSurfaceMuted,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1));
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.tokens,
    this.trailing,
    this.labelColor,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;
  final AppColorTokens tokens;
  final String? trailing;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Text(icon, style: const TextStyle(fontSize: 20)),
            const SizedBox(width: 14),
            Expanded(
                child: Text(label,
                    style: TextStyle(
                        color: labelColor ?? tokens.onSurface,
                        fontSize: 15,
                        fontWeight: FontWeight.w500))),
            if (trailing != null)
              Text(trailing!,
                  style: TextStyle(color: tokens.onSurfaceMuted, fontSize: 13)),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: tokens.onSurfaceMuted, size: 18),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
        height: 1, indent: 50, color: Colors.white.withOpacity(0.06));
  }
}
