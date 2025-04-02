import 'package:flutter/material.dart';
import '../base/gradient_container_base.dart';

/// A container with a radial gradient background
class RadialGradientContainer extends GradientContainerBase {
  /// The colors for the gradient
  final List<Color> colors;
  
  /// The stops for the gradient colors
  final List<double>? stops;
  
  /// The center point of the radial gradient
  final AlignmentGeometry center;
  
  /// The radius of the radial gradient
  final double radius;

  const RadialGradientContainer({
    super.key,
    super.child,
    super.borderRadius,
    super.width,
    super.height,
    super.padding,
    super.margin,
    this.colors = const [Colors.orange, Colors.red],
    this.stops,
    this.center = Alignment.center,
    this.radius = 0.85,
  });

  @override
  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: RadialGradient(
        colors: colors,
        stops: stops,
        center: center,
        radius: radius,
      ),
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(77),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
} 