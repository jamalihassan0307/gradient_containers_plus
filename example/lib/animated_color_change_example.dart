import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';

class AnimatedColorChangeExample extends StatelessWidget {
  const AnimatedColorChangeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Animated Color Change Container',
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
            [Colors.green, Colors.yellow],
            [Colors.red, Colors.orange],
          ],
          child: const Center(
            child: Text(
              'Animating between color sets',
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
