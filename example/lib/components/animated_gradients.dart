import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';

class AnimatedGradientsSection extends StatelessWidget {
  const AnimatedGradientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Animated Gradients',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildRotatingGradient(),
        const SizedBox(height: 24),
        _buildColorChangeGradient(),
      ],
    );
  }

  Widget _buildRotatingGradient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rotating Gradient',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        AnimatedGradientContainer(
          height: 150,
          colors: const [Colors.orange, Colors.purple, Colors.blue],
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Rotating Animation',
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

  Widget _buildColorChangeGradient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color Change Gradient',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        AnimatedColorChangeContainer(
          height: 150,
          colorSets: const [
            [Colors.blue, Colors.purple],
            [Colors.orange, Colors.red],
            [Colors.green, Colors.yellow],
          ],
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Color Transition',
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