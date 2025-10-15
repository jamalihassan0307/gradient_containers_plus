import 'package:flutter/material.dart';
// import '../base/gradient_container_base.dart';

/// A container with an animated gradient background
class AnimatedGradientContainer extends StatefulWidget {
  /// The colors for the gradient
  final List<Color> colors;

  /// The stops for the gradient colors
  final List<double>? stops;

  /// The begin alignment of the gradient
  final AlignmentGeometry begin;

  /// The end alignment of the gradient
  final AlignmentGeometry end;

  /// The duration of the animation
  final Duration duration;

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

  /// Whether to animate the colors in addition to the gradient rotation.
  final bool animateColors;

  const AnimatedGradientContainer({
    super.key,
    this.colors = const [Colors.purple, Colors.blue, Colors.purple],
    this.stops = const [0.0, 0.5, 1.0],
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.duration = const Duration(seconds: 2),
    this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.animateColors = true,
  });

  @override
  State<AnimatedGradientContainer> createState() =>
      _AnimatedGradientContainerState();
}

class _AnimatedGradientContainerState extends State<AnimatedGradientContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Color?>> _colorAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);

    _setupColorAnimations();
  }

  @override
  void didUpdateWidget(covariant AnimatedGradientContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.colors != oldWidget.colors || widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
      _setupColorAnimations();
      _controller
        ..reset()
        ..repeat(reverse: true);
    }
  }

  void _setupColorAnimations() {
    if (!widget.animateColors || widget.colors.length < 2) {
      _colorAnimations = widget.colors.map((c) => AlwaysStoppedAnimation(c)).toList();
      return;
    }

    final List<Color> beginColors = widget.colors;
    final List<Color> endColors = List.from(widget.colors.reversed.toList());

    _colorAnimations = List.generate(
      beginColors.length,
      (index) => ColorTween(
        begin: beginColors[index],
        end: endColors[index],
      ).animate(_controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final gradientRotation = widget.animateColors ? Tween<double>(begin: 0.0, end: 1.0).animate(_controller) : const AlwaysStoppedAnimation(0.0);
        return Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 150,
          padding: widget.padding,
          margin: widget.margin,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _colorAnimations.map((a) => a.value!).toList(),
              stops: widget.stops,
              begin: widget.begin,
              end: widget.end,
              transform: GradientRotation(gradientRotation.value * 2 * 3.14159),
            ),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(51),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: widget.child,
        );
      },
    );
  }
}
