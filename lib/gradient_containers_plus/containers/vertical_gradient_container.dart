import 'package:flutter/material.dart';
import '../base/gradient_container_base.dart';

/// A container with a vertical gradient background
class VerticalGradientContainer extends GradientContainerBase {
  /// The colors for the gradient
  final List<Color> colors;

  /// The stops for the gradient colors
  final List<double>? stops;

  /// The begin alignment of the gradient
  final AlignmentGeometry begin;

  /// The end alignment of the gradient
  final AlignmentGeometry end;

  /// The gradient to be used for the container background.
  /// If this is provided, the `colors`, `stops`, `begin`, and `end` properties will be ignored.
  final Gradient? gradient;

  const VerticalGradientContainer({
    super.key,
    super.child,
    super.borderRadius,
    super.width,
    super.height,
    super.padding,
    super.margin,
    this.colors = const [Colors.blue, Colors.purple],
    this.stops,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.gradient,
  });

  @override
  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: gradient ??
          LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin,
            end: end,
          ),
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(51),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }
}
