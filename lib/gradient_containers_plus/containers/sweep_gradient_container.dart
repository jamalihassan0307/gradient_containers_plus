import 'package:flutter/material.dart';
import '../base/gradient_container_base.dart';

/// A container with a sweep gradient background
class SweepGradientContainer extends GradientContainerBase {
  /// The colors for the gradient
  final List<Color> colors;
  
  /// The stops for the gradient colors
  final List<double>? stops;
  
  /// The center point of the sweep gradient
  final AlignmentGeometry center;
  
  /// The start angle of the sweep gradient
  final double startAngle;
  
  /// The end angle of the sweep gradient
  final double endAngle;

  const SweepGradientContainer({
    super.key,
    super.child,
    super.borderRadius,
    super.width,
    super.height,
    super.padding,
    super.margin,
    this.colors = const [Colors.green, Colors.teal, Colors.blue],
    this.stops,
    this.center = Alignment.center,
    this.startAngle = 0,
    this.endAngle = 2 * 3.14159,
  });

  @override
  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: SweepGradient(
        colors: colors,
        stops: stops,
        center: center,
        startAngle: startAngle,
        endAngle: endAngle,
      ),
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(51),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
} 