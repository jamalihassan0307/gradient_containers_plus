import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';

class BasicGradientsSection extends StatelessWidget {
  const BasicGradientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Basic Gradients',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildVerticalGradient(),
        const SizedBox(height: 24),
        _buildRadialGradient(),
        const SizedBox(height: 24),
        _buildSweepGradient(),
      ],
    );
  }

  Widget _buildVerticalGradient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Vertical Gradient',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        VerticalGradientContainer(
          height: 150,
          colors: const [Colors.blue, Colors.purple],
          child: const Center(
            child: Text(
              'Simple Gradient',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRadialGradient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Radial Gradient',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        RadialGradientContainer(
          height: 150,
          colors: const [Colors.purple, Colors.blue],
          radius: 1.2,
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Radial Effect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSweepGradient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sweep Gradient',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SweepGradientContainer(
          height: 150,
          colors: const [Colors.pink, Colors.purple, Colors.blue],
          startAngle: 0,
          endAngle: 3.14159,
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Sweep Effect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}