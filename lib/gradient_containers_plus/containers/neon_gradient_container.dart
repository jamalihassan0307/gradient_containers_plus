import 'package:flutter/material.dart';
import '../base/gradient_container_base.dart';

/// A container with a neon gradient background
class NeonGradientContainer extends GradientContainerBase {
  /// The colors for the gradient
  final List<Color> colors;

  /// The stops for the gradient colors
  final List<double>? stops;

  /// The begin alignment of the gradient
  final AlignmentGeometry begin;

  /// The end alignment of the gradient
  final AlignmentGeometry end;

  /// The glow intensity
  final double glowIntensity;

  /// The glow spread
  final double glowSpread;

  /// The gradient to be used for the container background.
  /// If this is provided, the `colors`, `stops`, `begin`, and `end` properties will be ignored.
  final Gradient? gradient;

  const NeonGradientContainer({
    super.key,
    super.child,
    super.borderRadius,
    super.width,
    super.height,
    super.padding,
    super.margin,
    this.colors = const [Color(0xFF00FF87), Color(0xFF60EFFF)],
    this.stops,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.glowIntensity = 0.5,
    this.glowSpread = 2,
    this.gradient,
  });

  @override
  BoxDecoration buildDecoration(BuildContext context) {
    final gradientToUse = gradient ??
        LinearGradient(
          colors: colors,
          stops: stops,
          begin: begin,
          end: end,
        );

    List<Color> shadowColors = [];
    if (gradientToUse is LinearGradient) {
      shadowColors = gradientToUse.colors;
    } else if (gradientToUse is RadialGradient) {
      shadowColors = gradientToUse.colors;
    } else if (gradientToUse is SweepGradient) {
      shadowColors = gradientToUse.colors;
    } else {
      shadowColors = colors;
    }

    return BoxDecoration(
      gradient: gradientToUse,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: (shadowColors.isNotEmpty ? shadowColors[0] : colors[0])
              .withAlpha((glowIntensity * 255).round()),
          blurRadius: 20,
          spreadRadius: glowSpread,
        ),
        BoxShadow(
          color: (shadowColors.length > 1 ? shadowColors[1] : colors[1])
              .withAlpha((glowIntensity * 255).round()),
          blurRadius: 20,
          spreadRadius: glowSpread,
        ),
      ],
    );
  }
}
