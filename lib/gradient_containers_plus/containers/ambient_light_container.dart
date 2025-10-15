import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/ambient_light_customizer.dart';

/// A container that creates an ambient light effect with customizable glow
class AmbientLightContainer extends StatefulWidget {
  /// The colors for the gradient and ambient light
  final List<Color> colors;

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

  /// The intensity of the ambient light (0.0 to 1.0)
  final double ambientIntensity;

  /// The spread radius of the ambient light
  final double spreadRadius;

  /// The blur radius of the ambient light
  final double blurRadius;

  /// The speed of the ambient light animation
  final Duration animationDuration;

  /// Whether the ambient light should pulse
  final bool isPulsing;

  /// The scale factor for the pulse effect (1.0 means no scaling)
  final double pulseScaleFactor;

  const AmbientLightContainer({
    super.key,
    this.colors = const [Colors.blue, Colors.purple],
    this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.shape = BoxShape.rectangle,
    this.onTap,
    this.mouseCursor,
    this.ambientIntensity = 0.5,
    this.spreadRadius = 20,
    this.blurRadius = 30,
    this.animationDuration = const Duration(seconds: 2),
    this.isPulsing = true,
    this.pulseScaleFactor = 1.2,
  })  : assert(ambientIntensity >= 0.0 && ambientIntensity <= 1.0),
        assert(pulseScaleFactor >= 1.0);

  @override
  State<AmbientLightContainer> createState() => _AmbientLightContainerState();
}

class _AmbientLightContainerState extends State<AmbientLightContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );

    _setupAnimations();

    if (widget.isPulsing) {
      _controller.repeat(reverse: true);
    }
  }

  void _setupAnimations() {
    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: widget.pulseScaleFactor)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: widget.pulseScaleFactor, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50.0,
      ),
    ]).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  void _showCustomizer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Customize Ambient Light',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AmbientLightCustomizer(
                      initialColors: widget.colors,
                      initialIntensity: widget.ambientIntensity,
                      initialSpread: widget.spreadRadius,
                      initialBlur: widget.blurRadius,
                      initialPulsing: widget.isPulsing,
                      initialPulseScale: widget.pulseScaleFactor,
                      initialDuration: widget.animationDuration,
                      onSettingsChanged: (settings) {
                        if (mounted) {
                          setState(() {
                            _controller.duration = settings.duration;
                            _setupAnimations();
                            if (settings.isPulsing && !_controller.isAnimating) {
                              _controller.repeat(reverse: true);
                            } else if (!settings.isPulsing && _controller.isAnimating) {
                              _controller.stop();
                            }
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Changes applied successfully'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Apply'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.mouseCursor ?? SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap ?? () => _showCustomizer(context),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              width: widget.width ?? double.infinity,
              height: widget.height ?? 150,
              margin: widget.margin,
              child: CustomPaint(
                painter: _AmbientLightPainter(
                  colors: widget.colors,
                  ambientIntensity: widget.ambientIntensity,
                  spreadRadius: widget.spreadRadius * _pulseAnimation.value,
                  blurRadius: widget.blurRadius,
                  shape: widget.shape,
                  borderRadius: widget.borderRadius,
                  rotationAngle: _rotationAnimation.value,
                ),
                child: Container(
                  padding: widget.padding,
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

class _AmbientLightPainter extends CustomPainter {
  final List<Color> colors;
  final double ambientIntensity;
  final double spreadRadius;
  final double blurRadius;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final double rotationAngle;

  _AmbientLightPainter({
    required this.colors,
    required this.ambientIntensity,
    required this.spreadRadius,
    required this.blurRadius,
    required this.shape,
    required this.borderRadius,
    required this.rotationAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final Path containerPath;
    if (shape == BoxShape.circle) {
      containerPath = Path()..addOval(rect);
    } else {
      containerPath = Path()
        ..addRRect(
          borderRadius?.toRRect(rect) ?? RRect.fromRectXY(rect, 12, 12),
        );
    }

    // Create ambient light layers
    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          blurRadius * (i + 1) / colors.length,
        )
        ..imageFilter = ui.ImageFilter.blur(
          sigmaX: blurRadius / 2,
          sigmaY: blurRadius / 2,
        )
        ..colorFilter = ColorFilter.mode(
          colors[i].withOpacity(ambientIntensity / (i + 1)),
          BlendMode.srcOver,
        )
        ..style = PaintingStyle.stroke
        ..strokeWidth = spreadRadius / (i + 1);

      // Create rotating gradient for ambient effect
      final gradient = SweepGradient(
        colors: [
          colors[i].withOpacity(0),
          colors[i].withOpacity(ambientIntensity),
          colors[i].withOpacity(0),
        ],
        stops: const [0.0, 0.5, 1.0],
        transform: GradientRotation(rotationAngle + (i * 3.14159 / colors.length)),
      );

      paint.shader = gradient.createShader(rect);

      canvas.drawPath(containerPath, paint);
    }
  }

  @override
  bool shouldRepaint(_AmbientLightPainter oldDelegate) =>
      colors != oldDelegate.colors ||
      ambientIntensity != oldDelegate.ambientIntensity ||
      spreadRadius != oldDelegate.spreadRadius ||
      blurRadius != oldDelegate.blurRadius ||
      shape != oldDelegate.shape ||
      borderRadius != oldDelegate.borderRadius ||
      rotationAngle != oldDelegate.rotationAngle;
}