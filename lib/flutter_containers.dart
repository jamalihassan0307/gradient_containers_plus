library flutter_containers;

import 'package:flutter/material.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/// A widget with different gradient container templates.
class GradientContainers extends StatelessWidget {
  const GradientContainers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container Template 1
        _buildGradientContainer1(),
        const SizedBox(height: 20), // Add some space between containers

        // Container Template 2
        _buildGradientContainer2(),
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
      ),
      child: const Center(
        child: Text(
          'Template 1',
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
          'Template 2',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
