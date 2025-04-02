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
  });

  @override
  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: colors,
        stops: stops,
        begin: begin,
        end: end,
      ),
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: colors[0].withAlpha((glowIntensity * 255).round()),
          blurRadius: 20,
          spreadRadius: glowSpread,
        ),
        BoxShadow(
          color: colors[1].withAlpha((glowIntensity * 255).round()),
          blurRadius: 20,
          spreadRadius: glowSpread,
        ),
      ],
    );
  }
} 