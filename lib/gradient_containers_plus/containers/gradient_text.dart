import 'package:flutter/material.dart';

/// A text widget that displays text with a gradient color
class GradientText extends StatelessWidget {
  /// The text to display
  final String text;

  /// The gradient to apply to the text
  final Gradient gradient;

  /// The text style (excluding color)
  final TextStyle? style;

  /// Text alignment
  final TextAlign? textAlign;

  /// Text direction
  final TextDirection? textDirection;

  /// Maximum number of lines
  final int? maxLines;

  /// Text overflow behavior
  final TextOverflow? overflow;

  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(bounds),
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
        textDirection: textDirection,
        maxLines: maxLines,
        overflow: overflow,
      ),
    );
  }
}