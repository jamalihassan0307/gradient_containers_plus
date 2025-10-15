import 'package:flutter/material.dart';

/// Base abstract class for all gradient containers
abstract class GradientContainerBase extends StatelessWidget {
  /// The child widget to be displayed inside the container
  final Widget? child;

  /// The border radius of the container (ignored if shape is BoxShape.circle)
  final BorderRadius? borderRadius;

  /// The width of the container
  final double? width;

  /// The height of the container
  final double? height;

  /// The padding of the container
  final EdgeInsetsGeometry? padding;

  /// The margin of the container
  final EdgeInsetsGeometry? margin;

  /// The shape of the container (rectangle or circle)
  final BoxShape shape;

  /// Callback function when the container is tapped
  final VoidCallback? onTap;

  /// The cursor type to show when hovering over the container (if onTap is provided)
  final MouseCursor? mouseCursor;

  const GradientContainerBase({
    super.key,
    this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.shape = BoxShape.rectangle,
    this.onTap,
    this.mouseCursor,
  });

  /// Build the decoration for the container
  BoxDecoration buildDecoration(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width ?? double.infinity,
      height: height ?? 150,
      padding: padding,
      margin: margin,
      decoration: buildDecoration(context),
      child: child,
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
}
