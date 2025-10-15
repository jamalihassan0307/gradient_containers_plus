import 'package:flutter/material.dart';

/// A collection of pre-defined beautiful gradients.
class GradientPresets {
  /// A gradient that evokes the serene and refreshing colors of the ocean.
  static const LinearGradient oceanBlue = LinearGradient(
    colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// A gradient that captures the warm and vibrant hues of a sunset.
  static const LinearGradient sunset = LinearGradient(
    colors: [Color(0xFFF7941D), Color(0xFFED1C24), Color(0xFFF26522)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// A gradient that represents the rich and lively greens of a lush forest.
  static const LinearGradient lushForest = LinearGradient(
    colors: [Color(0xFF009245), Color(0xFFFCEE21)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// A gradient that combines the soft and delicate shades of a blooming rose.
  static const LinearGradient bloomingRose = LinearGradient(
    colors: [Color(0xFFF5857B), Color(0xFFF9A8D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// A gradient that mirrors the cool and tranquil tones of a winter morning.
  static const LinearGradient winterMorning = LinearGradient(
    colors: [Color(0xFFB2D1E0), Color(0xFFE0E6E9)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// A gradient that radiates the bright and cheerful colors of a sunny day.
  static const LinearGradient sunnyDay = LinearGradient(
    colors: [Color(0xFFFFD500), Color(0xFFFF8C00)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
