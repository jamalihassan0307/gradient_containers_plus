import 'package:flutter/material.dart';

/// Base abstract class for all gradient containers
abstract class GradientContainerBase extends StatelessWidget {
  /// The child widget to be displayed inside the container
  final Widget? child;
  
  /// The border radius of the container
  final BorderRadius? borderRadius;
  
  /// The width of the container
  final double? width;
  
  /// The height of the container
  final double? height;
  
  /// The padding of the container
  final EdgeInsetsGeometry? padding;
  
  /// The margin of the container
  final EdgeInsetsGeometry? margin;

  const GradientContainerBase({
    super.key,
    this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
  });

  /// Build the decoration for the container
  BoxDecoration buildDecoration(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 150,
      padding: padding,
      margin: margin,
      decoration: buildDecoration(context),
      child: child,
    );
  }
} 