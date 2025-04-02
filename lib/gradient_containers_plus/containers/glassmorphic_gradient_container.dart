import 'package:flutter/material.dart';
import 'dart:ui';
import '../base/gradient_container_base.dart';

/// A container with a glassmorphic gradient background
class GlassmorphicGradientContainer extends GradientContainerBase {
  /// The colors for the gradient
  final List<Color> colors;
  
  /// The stops for the gradient colors
  final List<double>? stops;
  
  /// The begin alignment of the gradient
  final AlignmentGeometry begin;
  
  /// The end alignment of the gradient
  final AlignmentGeometry end;
  
  /// The blur sigma for the glassmorphic effect
  final double blurSigma;
  
  /// The border color for the glassmorphic effect
  final Color borderColor;
  
  /// The border width for the glassmorphic effect
  final double borderWidth;

  const GlassmorphicGradientContainer({
    super.key,
    super.child,
    super.borderRadius,
    super.width,
    super.height,
    super.padding,
    super.margin,
    this.colors = const [Colors.white, Colors.white],
    this.stops,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.blurSigma = 10,
    this.borderColor = Colors.white,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 150,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors.map((color) => color.withOpacity(0.2)).toList(),
              stops: stops,
              begin: begin,
              end: end,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            border: Border.all(
              color: borderColor.withOpacity(0.2),
              width: borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }

  @override
  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: colors.map((color) => color.withOpacity(0.2)).toList(),
        stops: stops,
        begin: begin,
        end: end,
      ),
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      border: Border.all(
        color: borderColor.withOpacity(0.2),
        width: borderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
} 