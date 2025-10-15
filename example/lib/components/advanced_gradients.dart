import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';

class AdvancedGradientsSection extends StatelessWidget {
  const AdvancedGradientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Advanced Gradients',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildMeshGradient(),
        const SizedBox(height: 24),
        _buildGradientText(),
        const SizedBox(height: 24),
        _buildGradientBorder(),
        const SizedBox(height: 24),
        _buildLinearGradients(),
      ],
    );
  }

  Widget _buildMeshGradient() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mesh Gradient',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        MeshGradientContainer(
          height: 150,
          colors: const [
            Colors.blue,
            Colors.purple,
            Colors.pink,
            Colors.orange,
          ],
          child: const Center(
            child: Text(
              'Modern Mesh Effect',
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

  Widget _buildGradientText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gradient Text',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: GradientText(
            'Beautiful Gradient Text',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.red],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradientBorder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gradient Border',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GradientBorderContainer(
          height: 150,
          colors: const [Colors.blue, Colors.purple],
          borderWidth: 4,
          backgroundColor: Colors.white,
          child: const Center(
            child: Text(
              'Gradient Border with White Background',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 16),
        GradientBorderContainer(
          height: 150,
          colors: const [Colors.orange, Colors.red],
          borderWidth: 4,
          child: const Center(
            child: Text(
              'Gradient Border with Transparent Background',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLinearGradients() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Linear Gradients',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        LinearGradientContainer(
          height: 150,
          colors: const [Colors.blue, Colors.purple],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          child: const Center(
            child: Text(
              'Horizontal Gradient',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        LinearGradientContainer(
          height: 150,
          colors: const [Colors.orange, Colors.red],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
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
        ),
        const SizedBox(height: 16),
        LinearGradientContainer(
          height: 150,
          colors: const [Colors.green, Colors.yellow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          child: const Center(
            child: Text(
              'Diagonal Gradient',
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