import 'package:flutter/material.dart';
import '../base/gradient_container_base.dart';

/// A container with a gradient border and optional solid or transparent background
class GradientBorderContainer extends GradientContainerBase {
  /// The gradient colors for the border
  final List<Color> colors;

  /// The stops for the gradient colors
  final List<double>? stops;

  /// The begin alignment of the gradient
  final AlignmentGeometry begin;

  /// The end alignment of the gradient
  final AlignmentGeometry end;

  /// The width of the border
  final double borderWidth;

  /// The background color of the container (transparent by default)
  final Color? backgroundColor;

  const GradientBorderContainer({
    super.key,
    super.child,
    super.borderRadius,
    super.width,
    super.height,
    super.padding,
    super.margin,
    super.shape,
    super.onTap,
    super.mouseCursor,
    this.colors = const [Colors.blue, Colors.purple],
    this.stops,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.borderWidth = 2.0,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width ?? double.infinity,
      height: height ?? 150,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          stops: stops,
          begin: begin,
          end: end,
        ),
        shape: shape,
        borderRadius: shape == BoxShape.rectangle ? (borderRadius ?? BorderRadius.circular(12)) : null,
      ),
      child: Container(
        margin: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle 
              ? (borderRadius != null
                  ? BorderRadius.circular(
                      borderRadius!.topLeft.x - borderWidth,
                    )
                  : BorderRadius.circular(10))
              : null,
        ),
        child: child,
      ),
    );

    if (onTap != null) {
      return MouseRegion(
        cursor: mouseCursor ?? SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: container,
        ),
      );
    }

    return container;
  }

  @override
  BoxDecoration buildDecoration(BuildContext context) {
    // This method is not used since we need a nested container structure
    throw UnimplementedError();
  }
}