import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../base/gradient_container_base.dart';

/// A container that displays a modern mesh gradient effect
class MeshGradientContainer extends GradientContainerBase {
  /// The colors for the mesh gradient
  final List<Color> colors;

  /// The blend mode for the mesh gradient
  final BlendMode blendMode;

  /// The number of horizontal cells in the mesh
  final int horizontalCells;

  /// The number of vertical cells in the mesh
  final int verticalCells;

  /// The frequency of the mesh pattern
  final double frequency;

  /// The phase offset of the mesh pattern
  final double phase;

  const MeshGradientContainer({
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
    this.colors = const [Colors.blue, Colors.purple, Colors.pink, Colors.orange],
    this.blendMode = BlendMode.srcOver,
    this.horizontalCells = 8,
    this.verticalCells = 6,
    this.frequency = 0.5,
    this.phase = 0.0,
  });

  @override
  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      shape: shape,
      borderRadius: shape == BoxShape.rectangle ? (borderRadius ?? BorderRadius.circular(12)) : null,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(51),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width ?? double.infinity,
      height: height ?? 150,
      padding: padding,
      margin: margin,
      decoration: buildDecoration(context),
      child: shape == BoxShape.circle 
        ? ClipOval(
            child: CustomPaint(
              painter: _MeshGradientPainter(
                colors: colors,
                blendMode: blendMode,
                horizontalCells: horizontalCells,
                verticalCells: verticalCells,
                frequency: frequency,
                phase: phase,
              ),
              child: child,
            ),
          )
        : ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: CustomPaint(
          painter: _MeshGradientPainter(
            colors: colors,
            blendMode: blendMode,
            horizontalCells: horizontalCells,
            verticalCells: verticalCells,
            frequency: frequency,
            phase: phase,
          ),
          child: child,
        ),
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
}

class _MeshGradientPainter extends CustomPainter {
  final List<Color> colors;
  final BlendMode blendMode;
  final int horizontalCells;
  final int verticalCells;
  final double frequency;
  final double phase;

  _MeshGradientPainter({
    required this.colors,
    required this.blendMode,
    required this.horizontalCells,
    required this.verticalCells,
    required this.frequency,
    required this.phase,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final cellWidth = size.width / horizontalCells;
    final cellHeight = size.height / verticalCells;

    for (int i = 0; i < horizontalCells; i++) {
      for (int j = 0; j < verticalCells; j++) {
        final path = Path();
        final x = i * cellWidth;
        final y = j * cellHeight;

        path.moveTo(x, y);
        path.lineTo(x + cellWidth, y);
        path.lineTo(x + cellWidth, y + cellHeight);
        path.lineTo(x, y + cellHeight);
        path.close();

        final colorIndex = ((i + j + (phase * 10).round()) % colors.length);
        final nextColorIndex = (colorIndex + 1) % colors.length;

        paint.shader = LinearGradient(
          colors: [colors[colorIndex], colors[nextColorIndex]],
          begin: Alignment(
            math.sin((i + j) * frequency + phase),
            math.cos((i + j) * frequency + phase),
          ),
          end: Alignment(
            math.cos((i + j) * frequency + phase),
            math.sin((i + j) * frequency + phase),
          ),
        ).createShader(path.getBounds());

        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_MeshGradientPainter oldDelegate) =>
      colors != oldDelegate.colors ||
      blendMode != oldDelegate.blendMode ||
      horizontalCells != oldDelegate.horizontalCells ||
      verticalCells != oldDelegate.verticalCells ||
      frequency != oldDelegate.frequency ||
      phase != oldDelegate.phase;
}