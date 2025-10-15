import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';

class SpecialEffectsSection extends StatelessWidget {
  const SpecialEffectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Special Effects',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildGlassmorphicEffect(),
        const SizedBox(height: 24),
        _buildNeonEffect(),
      ],
    );
  }

  Widget _buildGlassmorphicEffect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Glassmorphic Effect',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GlassmorphicGradientContainer(
          height: 150,
          colors: const [Colors.blue, Colors.purple],
          blurSigma: 15,
          borderWidth: 2,
          borderRadius: BorderRadius.circular(20),
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
      ],
    );
  }

  Widget _buildNeonEffect() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Neon Effect',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        NeonGradientContainer(
          height: 150,
          colors: const [Colors.pink, Colors.purple],
          glowIntensity: 0.7,
          glowSpread: 3,
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Neon Glow Effect',
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