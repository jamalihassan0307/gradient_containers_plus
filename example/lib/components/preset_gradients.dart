import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/vertical_gradient_container.dart';

class PresetGradientsSection extends StatelessWidget {
  const PresetGradientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Preset Gradients',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Beautiful pre-defined gradients ready to use.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        _buildPresetExamples(),
      ],
    );
  }

  Widget _buildPresetExamples() {
    return Column(
      children: [
        VerticalGradientContainer(
          height: 150,
          gradient: GradientPresets.oceanBlue,
          child: const Center(
            child: Text(
              'Ocean Blue',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        VerticalGradientContainer(
          height: 150,
          gradient: GradientPresets.sunset,
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Sunset',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        VerticalGradientContainer(
          height: 150,
          gradient: GradientPresets.lushForest,
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Lush Forest',
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