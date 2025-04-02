import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// A widget that provides beautiful gradient container templates with advanced features.
class GradientContainers extends StatelessWidget {
  /// Creates a gradient containers widget.
  const GradientContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container Template 1
        _buildGradientContainer1(),
        const SizedBox(height: 20),

        // Container Template 2
        _buildGradientContainer2(),
        
        const SizedBox(height: 20),
        
        // Container Template 3
        _buildGradientContainer3(),
        
        const SizedBox(height: 20),
        
        // Container Template 4
        _buildGradientContainer4(),

        const SizedBox(height: 20),
        
        // Container Template 5
        _buildGradientContainer5(),

        const SizedBox(height: 20),
        
        // Container Template 6
        _buildGradientContainer6(),

        const SizedBox(height: 20),
        
        // Container Template 7
        _buildGradientContainer7(),

        const SizedBox(height: 20),
        
        // Container Template 8
        _buildGradientContainer8(),

        const SizedBox(height: 20),
        
        // Container Template 9
        _buildGradientContainer9(),

        const SizedBox(height: 20),
        
        // Container Template 10
        _buildGradientContainer10(),
      ],
    );
  }

  /// Template 1: Vertical gradient container with rounded corners.
  Widget _buildGradientContainer1() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Vertical Gradient',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Template 2: Radial gradient container with a shadow effect.
  Widget _buildGradientContainer2() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          colors: [Colors.orange, Colors.red],
          center: Alignment.center,
          radius: 0.85,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Radial Gradient',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Template 3: Sweep gradient container with pattern overlay.
  Widget _buildGradientContainer3() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const SweepGradient(
          colors: [Colors.green, Colors.teal, Colors.blue],
          center: Alignment.center,
          startAngle: 0,
          endAngle: 2 * 3.14159,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: PatternDecoration(
                pattern: PatternDecorationPattern.dots,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Sweep Gradient',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Template 4: Animated gradient container with shimmer effect.
  Widget _buildGradientContainer4() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Colors.purple,
            Colors.blue,
            Colors.purple,
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.1),
                ],
                stops: const [0.0, 0.5, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Animated Gradient',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Template 5: Glassmorphic gradient container with blur effect.
  Widget _buildGradientContainer5() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.2),
            Colors.white.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: const Center(
            child: Text(
              'Glassmorphic Effect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Template 6: Neon gradient container with glow effect.
  Widget _buildGradientContainer6() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00FF87), Color(0xFF60EFFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00FF87).withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: const Color(0xFF60EFFF).withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Neon Glow',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Template 7: Gradient container with animated pattern.
  Widget _buildGradientContainer7() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6B73FF), Color(0xFF000DFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: const AlwaysStoppedAnimation(0),
            builder: (context, child) {
              return CustomPaint(
                painter: AnimatedPatternPainter(
                  pattern: PatternDecorationPattern.grid,
                  color: Colors.white.withOpacity(0.1),
                  animation: 0,
                ),
              );
            },
          ),
          const Center(
            child: Text(
              'Animated Pattern',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Template 8: Gradient container with 3D effect.
  Widget _buildGradientContainer8() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C3E50), Color(0xFF3498DB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(-5, -5),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          '3D Effect',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black26,
                offset: Offset(2, 2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Template 9: Gradient container with metallic effect.
  Widget _buildGradientContainer9() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey[300]!,
            Colors.grey[100]!,
            Colors.grey[300]!,
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.1),
                ],
                stops: const [0.0, 0.5, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Metallic Effect',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Template 10: Gradient container with holographic effect.
  Widget _buildGradientContainer10() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple.withOpacity(0.8),
            Colors.blue.withOpacity(0.8),
            Colors.pink.withOpacity(0.8),
          ],
          stops: const [0.0, 0.5, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.pink.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.1),
                ],
                stops: const [0.0, 0.5, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Holographic Effect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A custom pattern decoration for containers.
class PatternDecoration extends Decoration {
  final PatternDecorationPattern pattern;
  final Color color;

  const PatternDecoration({
    required this.pattern,
    required this.color,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return PatternDecorationPainter(
      pattern: pattern,
      color: color,
      onChanged: onChanged,
    );
  }
}

/// Pattern types for container decorations.
enum PatternDecorationPattern {
  dots,
  lines,
  grid,
}

/// Custom painter for pattern decorations.
class PatternDecorationPainter extends BoxPainter {
  final PatternDecorationPattern pattern;
  final Color color;

  PatternDecorationPainter({
    required this.pattern,
    required this.color,
    VoidCallback? onChanged,
  }) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    final size = configuration.size!;
    final rect = offset & size;

    switch (pattern) {
      case PatternDecorationPattern.dots:
        _paintDots(canvas, rect, paint);
        break;
      case PatternDecorationPattern.lines:
        _paintLines(canvas, rect, paint);
        break;
      case PatternDecorationPattern.grid:
        _paintGrid(canvas, rect, paint);
        break;
    }
  }

  void _paintDots(Canvas canvas, Rect rect, Paint paint) {
    const spacing = 20.0;
    for (var x = 0.0; x < rect.width; x += spacing) {
      for (var y = 0.0; y < rect.height; y += spacing) {
        canvas.drawCircle(
          Offset(rect.left + x, rect.top + y),
          1.0,
          paint,
        );
      }
    }
  }

  void _paintLines(Canvas canvas, Rect rect, Paint paint) {
    const spacing = 20.0;
    for (var y = 0.0; y < rect.height; y += spacing) {
      canvas.drawLine(
        Offset(rect.left, rect.top + y),
        Offset(rect.right, rect.top + y),
        paint,
      );
    }
  }

  void _paintGrid(Canvas canvas, Rect rect, Paint paint) {
    const spacing = 20.0;
    for (var x = 0.0; x < rect.width; x += spacing) {
      canvas.drawLine(
        Offset(rect.left + x, rect.top),
        Offset(rect.left + x, rect.bottom),
        paint,
      );
    }
    for (var y = 0.0; y < rect.height; y += spacing) {
      canvas.drawLine(
        Offset(rect.left, rect.top + y),
        Offset(rect.right, rect.top + y),
        paint,
      );
    }
  }
}

/// Animated pattern painter for container decorations.
class AnimatedPatternPainter extends CustomPainter {
  final PatternDecorationPattern pattern;
  final Color color;
  final double animation;

  AnimatedPatternPainter({
    required this.pattern,
    required this.color,
    required this.animation,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    final rect = Offset.zero & size;

    switch (pattern) {
      case PatternDecorationPattern.dots:
        _paintDots(canvas, rect, paint);
        break;
      case PatternDecorationPattern.lines:
        _paintLines(canvas, rect, paint);
        break;
      case PatternDecorationPattern.grid:
        _paintGrid(canvas, rect, paint);
        break;
    }
  }

  void _paintDots(Canvas canvas, Rect rect, Paint paint) {
    const spacing = 20.0;
    for (var x = 0.0; x < rect.width; x += spacing) {
      for (var y = 0.0; y < rect.height; y += spacing) {
        canvas.drawCircle(
          Offset(rect.left + x, rect.top + y),
          1.0,
          paint,
        );
      }
    }
  }

  void _paintLines(Canvas canvas, Rect rect, Paint paint) {
    const spacing = 20.0;
    for (var y = 0.0; y < rect.height; y += spacing) {
      canvas.drawLine(
        Offset(rect.left, rect.top + y),
        Offset(rect.right, rect.top + y),
        paint,
      );
    }
  }

  void _paintGrid(Canvas canvas, Rect rect, Paint paint) {
    const spacing = 20.0;
    for (var x = 0.0; x < rect.width; x += spacing) {
      canvas.drawLine(
        Offset(rect.left + x, rect.top),
        Offset(rect.left + x, rect.bottom),
        paint,
      );
    }
    for (var y = 0.0; y < rect.height; y += spacing) {
      canvas.drawLine(
        Offset(rect.left, rect.top + y),
        Offset(rect.right, rect.top + y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(AnimatedPatternPainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
