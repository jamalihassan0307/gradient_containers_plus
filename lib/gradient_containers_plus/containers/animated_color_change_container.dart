import 'dart:async';
import 'package:flutter/material.dart';

/// A container that smoothly animates between a list of gradient color sets.
class AnimatedColorChangeContainer extends StatefulWidget {
  /// A list of color lists to animate through. Each inner list represents a gradient.
  final List<List<Color>> colorSets;

  /// The duration of the transition between two color sets.
  final Duration transitionDuration;

  /// The duration to pause on a color set before transitioning to the next one.
  final Duration pauseDuration;

  /// The stops for the gradient colors.
  final List<double>? stops;

  /// The begin alignment of the gradient.
  final AlignmentGeometry begin;

  /// The end alignment of the gradient.
  final AlignmentGeometry end;

  /// The child widget to be displayed inside the container.
  final Widget? child;

  /// The border radius of the container.
  final BorderRadius? borderRadius;

  /// The width of the container.
  final double? width;

  /// The height of the container.
  final double? height;

  /// The padding of the container.
  final EdgeInsetsGeometry? padding;

  /// The margin of the container.
  final EdgeInsetsGeometry? margin;

  const AnimatedColorChangeContainer({
    super.key,
    required this.colorSets,
    this.transitionDuration = const Duration(seconds: 2),
    this.pauseDuration = const Duration(seconds: 1),
    this.stops,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
  }) : assert(colorSets.length >= 2, 'colorSets must contain at least two color lists.');

  @override
  State<AnimatedColorChangeContainer> createState() => _AnimatedColorChangeContainerState();
}

class _AnimatedColorChangeContainerState extends State<AnimatedColorChangeContainer> with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Color?>> _colorAnimations;
  int _currentColorSetIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.transitionDuration,
      vsync: this,
    );

    _setupAnimations();
    _startAnimationCycle();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _setupAnimations() {
    final int nextColorSetIndex = (_currentColorSetIndex + 1) % widget.colorSets.length;
    final List<Color> beginColors = widget.colorSets[_currentColorSetIndex];
    final List<Color> endColors = widget.colorSets[nextColorSetIndex];

    // Ensure both lists have the same length for tweening
    final int maxLength = beginColors.length > endColors.length ? beginColors.length : endColors.length;
    final List<Color> safeBeginColors = _padColorList(beginColors, maxLength);
    final List<Color> safeEndColors = _padColorList(endColors, maxLength);

    _colorAnimations = List.generate(maxLength, (index) {
      return ColorTween(
        begin: safeBeginColors[index],
        end: safeEndColors[index],
      ).animate(_controller);
    });
  }

  List<Color> _padColorList(List<Color> colors, int length) {
    if (colors.length >= length) {
      return colors.sublist(0, length);
    }
    List<Color> paddedList = List.from(colors);
    while (paddedList.length < length) {
      paddedList.add(paddedList.last); // Pad with the last color
    }
    return paddedList;
  }

  void _startAnimationCycle() {
    _timer = Timer(widget.pauseDuration, () {
      _controller.forward(from: 0.0);
      _timer = Timer(widget.transitionDuration + widget.pauseDuration, () {
        setState(() {
          _currentColorSetIndex = (_currentColorSetIndex + 1) % widget.colorSets.length;
          _setupAnimations();
          _startAnimationCycle();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          margin: widget.margin,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _colorAnimations.map((anim) => anim.value!).toList(),
              stops: widget.stops,
              begin: widget.begin,
              end: widget.end,
            ),
            borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
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
