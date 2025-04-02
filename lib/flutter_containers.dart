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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                pattern: PatternDecoration(
                  pattern: PatternDecorationPattern.dots,
                  color: Colors.white.withOpacity(0.1),
                ),
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
    return _PatternDecorationPainter(
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
class _PatternDecorationPainter extends BoxPainter {
  final PatternDecorationPattern pattern;
  final Color color;

  _PatternDecorationPainter({
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
