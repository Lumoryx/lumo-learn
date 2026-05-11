import 'package:flutter/material.dart';

/// Background radial glow decorations for the premium dark aesthetic.
class RadialGlow extends StatelessWidget {
  const RadialGlow({
    super.key,
    required this.color,
    required this.radius,
    this.opacity = 0.3,
  });

  final Color color;
  final double radius;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            color.withOpacity(opacity),
            color.withOpacity(0),
          ],
        ),
      ),
    );
  }
}

/// Scene image placeholder — atmospheric gradient for word/article contexts.
/// Represents AI-generated contextual imagery.
class SceneImagePlaceholder extends StatelessWidget {
  const SceneImagePlaceholder({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 16,
    this.icon,
    this.label,
  });

  final double width;
  final double height;
  final double borderRadius;
  final String? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cs.primary.withOpacity(0.25),
            cs.secondary.withOpacity(0.15),
            Colors.black.withOpacity(0.4),
          ],
        ),
        border: Border.all(
          color: Colors.white.withOpacity(0.08),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Text(icon!, style: const TextStyle(fontSize: 32)),
          if (label != null) ...[
            const SizedBox(height: 8),
            Text(
              label!,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
