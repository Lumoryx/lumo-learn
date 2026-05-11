import 'package:flutter/material.dart';
import '../../core/theme/color_tokens.dart';

/// Primary gradient button used throughout the app.
class LumoButton extends StatelessWidget {
  const LumoButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 56,
  });

  final String label;
  final VoidCallback? onTap;
  final bool isLoading;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimatedScale(
        scale: onTap == null ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [tokens.primary, tokens.primaryGradientEnd],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: tokens.primary.withOpacity(0.35),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: isLoading
              ? SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: tokens.onPrimary,
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                    color: tokens.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
        ),
      ),
    );
  }
}

/// Ghost/outline secondary button.
class LumoOutlineButton extends StatelessWidget {
  const LumoOutlineButton({
    super.key,
    required this.label,
    required this.onTap,
    this.width = double.infinity,
    this.height = 52,
  });

  final String label;
  final VoidCallback? onTap;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppColorTokens>()!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: tokens.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: tokens.onSurface,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
