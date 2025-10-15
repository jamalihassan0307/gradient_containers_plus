import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

/// A container that creates a liquid-like animation effect when pressed
class LiquidPressContainer extends StatefulWidget {
  /// The colors for the gradient
  final List<Color> colors;

  /// The duration of the press animation
  final Duration animationDuration;

  /// The curve of the animation
  final Curve curve;

  /// The spring simulation configuration
  final SpringDescription springDescription;

  /// The child widget to display
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

  /// The shape of the container
  final BoxShape shape;

  /// Callback when the container is tapped
  final VoidCallback? onTap;

  /// The cursor to show when hovering
  final MouseCursor? mouseCursor;

  const LiquidPressContainer({
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
    this.colors = const [Colors.blue, Colors.purple],
    this.animationDuration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
    this.springDescription = const SpringDescription(
      mass: 1.0,
      stiffness: 500.0,
      damping: 20.0,
    ),
  });

  @override
  State<LiquidPressContainer> createState() => _LiquidPressContainerState();
}

class _LiquidPressContainerState extends State<LiquidPressContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pressAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _liquidAnimation;

  Offset _pressPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _setupAnimations();
  }

  void _setupAnimations() {
    _pressAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    ));

    _liquidAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const SpringCurve(),
    ));
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _pressPosition = details.localPosition;
    });
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap?.call();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.mouseCursor ?? SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: CustomPaint(
                painter: _LiquidPainter(
                  colors: widget.colors,
                  pressPosition: _pressPosition,
                  animationValue: _liquidAnimation.value,
                  pressAnimation: _pressAnimation.value,
                  shape: widget.shape,
                  borderRadius: widget.shape == BoxShape.rectangle
                      ? (widget.borderRadius ?? BorderRadius.circular(12))
                      : null,
                ),
                child: Container(
                  width: widget.width ?? double.infinity,
                  height: widget.height ?? 150,
                  padding: widget.padding,
                  margin: widget.margin,
                  child: widget.child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


}

class _LiquidPainter extends CustomPainter {
  final List<Color> colors;
  final Offset pressPosition;
  final double animationValue;
  final double pressAnimation;
  final BoxShape shape;
  final BorderRadius? borderRadius;

  _LiquidPainter({
    required this.colors,
    required this.pressPosition,
    required this.animationValue,
    required this.pressAnimation,
    required this.shape,
    this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()..style = PaintingStyle.fill;

    // Create gradient shader
    paint.shader = LinearGradient(
      colors: colors,
      stops: [0.0, animationValue],
      transform: GradientRotation(pressAnimation * 2 * 3.14159),
    ).createShader(rect);

    // Create path based on shape
    final path = Path();
    if (shape == BoxShape.circle) {
      path.addOval(rect);
    } else {
      path.addRRect(
        borderRadius?.toRRect(rect) ?? RRect.fromRectXY(rect, 12, 12),
      );
    }

    // Add liquid effect
    if (pressAnimation > 0) {
      final radius = size.width * 0.5 * pressAnimation;
      final liquidPath = Path()
        ..addOval(Rect.fromCircle(
          center: pressPosition,
          radius: radius,
        ));

      // Blend the liquid effect with the base shape
      path.addPath(liquidPath, Offset.zero);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_LiquidPainter oldDelegate) =>
      colors != oldDelegate.colors ||
      pressPosition != oldDelegate.pressPosition ||
      animationValue != oldDelegate.animationValue ||
      pressAnimation != oldDelegate.pressAnimation ||
      shape != oldDelegate.shape ||
      borderRadius != oldDelegate.borderRadius;
}

class SpringCurve extends Curve {
  const SpringCurve();

  @override
  double transform(double t) {
    return -15.0 * t * t + 16.0 * t;
  }
}