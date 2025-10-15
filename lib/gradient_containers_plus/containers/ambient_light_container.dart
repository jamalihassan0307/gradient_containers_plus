// ignore_for_file: unused_field

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/ambient_light_customizer.dart';

/// A container that creates an ambient light effect with a rotating gradient border
class AmbientLightContainer extends StatefulWidget {
  /// The colors for the gradient border
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

  /// The spread radius of the ambient light (border width)
  final double spreadRadius;

  /// The blur radius of the ambient light
  final double blurRadius;

  /// The speed of the ambient light animation
  final Duration animationDuration;

  /// Whether the ambient light should pulse
  final bool isPulsing;

  /// The scale factor for the pulse effect (1.0 means no scaling)
  final double pulseScaleFactor;

  /// Whether to show a sharp border in addition to the glow
  final bool showSharpBorder;

  /// The multiplier for the glow width
  final double glowWidthMultiplier;

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
    this.spreadRadius = 4.0,
    this.blurRadius = 12.0,
    this.animationDuration = const Duration(seconds: 5),
    this.isPulsing = false,
    this.pulseScaleFactor = 1.2,
    this.showSharpBorder = false,
    this.glowWidthMultiplier = 3.5,
  })  : assert(ambientIntensity >= 0.0 && ambientIntensity <= 1.0),
        assert(pulseScaleFactor >= 1.0),
        assert(glowWidthMultiplier > 0),
        assert(colors.length >= 2);

  @override
  State<AmbientLightContainer> createState() => _AmbientLightContainerState();
}

class _AmbientLightContainerState extends State<AmbientLightContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotationAnimation;
  List<Color> _currentColors = [];
  double _currentIntensity = 0.5;
  double _currentSpread = 4.0;
  double _currentBlur = 12.0;
  bool _currentPulsing = false;
  double _currentPulseScale = 1.2;
  Duration _currentDuration = const Duration(seconds: 5);
  bool _showSharpBorder = false;
  double _glowWidthMultiplier = 3.5;

  @override
  void initState() {
    super.initState();
    _currentColors = List.from(widget.colors);
    _currentIntensity = widget.ambientIntensity;
    _currentSpread = widget.spreadRadius;
    _currentBlur = widget.blurRadius;
    _currentPulsing = widget.isPulsing;
    _currentPulseScale = widget.pulseScaleFactor;
    _currentDuration = widget.animationDuration;
    _showSharpBorder = widget.showSharpBorder;
    _glowWidthMultiplier = widget.glowWidthMultiplier;
    
    _controller = AnimationController(
      duration: _currentDuration,
      vsync: this,
    );

    _setupAnimations();
    
    // Always repeat the animation for rotation, pulsing is controlled separately
    _controller.repeat();
  }

  void _setupAnimations() {
    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: _currentPulseScale)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50.0,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: _currentPulseScale, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50.0,
      ),
    ]).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
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
      builder: (context) {
        // Store temporary settings that can be applied or discarded
        List<Color> tempColors = List.from(_currentColors);
        double tempIntensity = _currentIntensity;
        double tempSpread = _currentSpread;
        double tempBlur = _currentBlur;
        bool tempPulsing = _currentPulsing;
        double tempPulseScale = _currentPulseScale;
        Duration tempDuration = _currentDuration;
        bool tempSharpBorder = _showSharpBorder;
        double tempGlowMultiplier = _glowWidthMultiplier;
        
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
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
                            initialColors: tempColors,
                            initialIntensity: tempIntensity,
                            initialSpread: tempSpread,
                            initialBlur: tempBlur,
                            initialPulsing: tempPulsing,
                            initialPulseScale: tempPulseScale,
                            initialDuration: tempDuration,
                            onSettingsChanged: (settings) {
                              setState(() {
                                tempColors = settings.colors;
                                tempIntensity = settings.intensity;
                                tempSpread = settings.spread;
                                tempBlur = settings.blur;
                                tempPulsing = settings.isPulsing;
                                tempPulseScale = settings.pulseScale;
                                tempDuration = settings.duration;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          // Additional settings specific to the new border style
                          Row(
                            children: [
                              const Text(
                                'Show Sharp Border',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                value: tempSharpBorder,
                                onChanged: (value) {
                                  setState(() {
                                    tempSharpBorder = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Glow Width Multiplier: ${tempGlowMultiplier.toStringAsFixed(2)}x',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Slider(
                                      value: tempGlowMultiplier,
                                      min: 1.0,
                                      max: 10.0,
                                      onChanged: (newValue) {
                                        setState(() {
                                          tempGlowMultiplier = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                                    // Apply changes
                                    if (mounted) {
                                      setState(() {
                                        _currentColors = tempColors;
                                        _currentIntensity = tempIntensity;
                                        _currentSpread = tempSpread;
                                        _currentBlur = tempBlur;
                                        _currentPulsing = tempPulsing;
                                        _currentPulseScale = tempPulseScale;
                                        _currentDuration = tempDuration;
                                        _showSharpBorder = tempSharpBorder;
                                        _glowWidthMultiplier = tempGlowMultiplier;
                                      });
                                      
                                      // Update animations with new settings
                                      _controller.duration = _currentDuration;
                                      _setupAnimations();
                                    }
                                    
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
            );
          }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the inner content area dimensions
    final innerStrokeWidth = _currentSpread;
    final containerWidth = widget.width ?? double.infinity;
    final containerHeight = widget.height ?? 150;
    
    final double effectiveWidth;
    if (containerWidth == double.infinity) {
      effectiveWidth = double.infinity;
    } else {
      effectiveWidth = containerWidth;
    }
    
    final double effectiveHeight = containerHeight;
    
    // Calculate inner container dimensions
    final innerWidth = effectiveWidth != double.infinity 
        ? math.max(0.0, effectiveWidth - innerStrokeWidth * 2) 
        : double.infinity;
    final innerHeight = math.max(0.0, effectiveHeight - innerStrokeWidth * 2);
    
    // Get background color from theme
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    
    // Calculate border radius for inner container
    final BorderRadius effectiveBorderRadius = widget.borderRadius ?? BorderRadius.circular(12);
    final double baseRadius = effectiveBorderRadius.topLeft.x;
    final BorderRadius innerBorderRadius = BorderRadius.circular(math.max(0.0, baseRadius - innerStrokeWidth));

    return MouseRegion(
      cursor: widget.mouseCursor ?? SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap ?? () => _showCustomizer(context),
        child: Container(
          width: effectiveWidth,
          height: effectiveHeight,
          margin: widget.margin,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              // Calculate pulse effect if enabled
              final double pulseValue = _currentPulsing ? _pulseAnimation.value : 1.0;
              
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Ambient glow border layer
                  CustomPaint(
                    size: Size(effectiveWidth, effectiveHeight),
                    painter: _AmbientOuterEffectPainter(
                      strokeWidth: _currentSpread,
                      radius: baseRadius,
                      gradientColors: _currentColors,
                      intensity: _currentIntensity,
                      animationValue: _controller.value,
                      glowSpread: _currentBlur,
                      glowWidthMultiplier: _glowWidthMultiplier,
                      pulseScale: pulseValue,
                    ),
                  ),
                  
                  // Inner content layer (blocks internal glow)
                  Container(
                    width: innerWidth,
                    height: innerHeight,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: innerBorderRadius,
                    ),
                    child: ClipRRect(
                      borderRadius: innerBorderRadius,
                      child: Container(
                        padding: widget.padding,
                        child: widget.child,
                      ),
                    ),
                  ),
                  
                  // Optional sharp border
                  if (_showSharpBorder)
                    CustomPaint(
                      size: Size(effectiveWidth, effectiveHeight),
                      painter: _AnimatedGradientStrokePainter(
                        strokeWidth: _currentSpread,
                        radius: baseRadius,
                        gradientColors: _currentColors,
                        animationValue: _controller.value,
                        intensity: _currentIntensity,
                      ),
                    ),
                ],
              );
            },
          ),
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

/// Painter for creating the outer ambient glow effect
class _AmbientOuterEffectPainter extends CustomPainter {
  final double strokeWidth; // Base border width
  final double radius; // Border radius
  final List<Color> gradientColors; // Gradient colors
  final double intensity; // Color intensity
  final double animationValue; // Animation value for rotation
  final double glowSpread; // Blur amount (sigma)
  final double glowWidthMultiplier; // Multiplier for glow width
  final double pulseScale; // Scale factor for pulsing effect

  _AmbientOuterEffectPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradientColors,
    required this.intensity,
    required this.animationValue,
    required this.glowSpread,
    required this.glowWidthMultiplier,
    required this.pulseScale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the glow paint stroke width
    final double glowPaintStrokeWidth = strokeWidth * glowWidthMultiplier * pulseScale;
    
    // Create paint for the glow effect
    final Paint glowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = glowPaintStrokeWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, glowSpread);

    // Calculate the rectangle for the border
    final Rect rect = Rect.fromLTWH(
      strokeWidth / 2, // Left boundary
      strokeWidth / 2, // Top boundary
      size.width - strokeWidth, // Width
      size.height - strokeWidth // Height
    );

    // Adjust radius for the border position
    final Radius borderRadius = Radius.circular(math.max(0, radius - strokeWidth / 2));
    final RRect glowRRect = RRect.fromRectAndRadius(rect, borderRadius);

    // Create the animated gradient
    final List<Color> effectiveColors = gradientColors
        .map((color) => color.withValues(alpha: intensity))
        .toList()
      ..add(gradientColors.first.withValues(alpha: intensity)); // Add the first color again to close the loop
    
    final SweepGradient sweepGradient = SweepGradient(
      center: Alignment.center,
      colors: effectiveColors,
      startAngle: 0.0,
      endAngle: math.pi * 2,
      transform: GradientRotation(animationValue * 2 * math.pi),
      tileMode: TileMode.repeated,
    );

    // Apply gradient shader to the full area
    glowPaint.shader = sweepGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Draw the blurred glow border
    canvas.drawRRect(glowRRect, glowPaint);
  }

  @override
  bool shouldRepaint(covariant _AmbientOuterEffectPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius ||
        !_listEquals(oldDelegate.gradientColors, gradientColors) ||
        oldDelegate.glowSpread != glowSpread ||
        oldDelegate.intensity != intensity ||
        oldDelegate.glowWidthMultiplier != glowWidthMultiplier ||
        oldDelegate.pulseScale != pulseScale;
  }

  // Helper method to compare lists
  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

/// Painter for creating a sharp animated gradient border (optional)
class _AnimatedGradientStrokePainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final List<Color> gradientColors;
  final double animationValue;
  final double intensity;

  _AnimatedGradientStrokePainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradientColors,
    required this.animationValue,
    required this.intensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Create paint for the border
    final Paint borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    
    // Calculate the rectangle for the border
    final RRect outerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        strokeWidth / 2, 
        strokeWidth / 2, 
        size.width - strokeWidth,
        size.height - strokeWidth
      ),
      Radius.circular(math.max(0, radius - strokeWidth / 2)),
    );
    
    // Create the gradient with proper opacity
    final List<Color> effectiveColors = gradientColors
        .map((color) => color.withValues(alpha: intensity))
        .toList()
      ..add(gradientColors.first.withValues(alpha: intensity));
    
    final SweepGradient sweepGradient = SweepGradient(
      center: Alignment.center,
      colors: effectiveColors,
      startAngle: 0.0,
      endAngle: math.pi * 2,
      transform: GradientRotation(animationValue * 2 * math.pi),
      tileMode: TileMode.repeated,
    );
    
    // Apply the gradient shader
    borderPaint.shader = sweepGradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    
    // Draw the border
    canvas.drawRRect(outerRRect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant _AnimatedGradientStrokePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius ||
        !_listEquals(oldDelegate.gradientColors, gradientColors) ||
        oldDelegate.intensity != intensity;
  }

  // Helper method to compare lists
  bool _listEquals<T>(List<T>? a, List<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}