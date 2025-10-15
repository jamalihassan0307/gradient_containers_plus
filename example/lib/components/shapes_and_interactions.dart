import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';

class ShapesAndInteractionsExample extends StatelessWidget {
  const ShapesAndInteractionsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Interactive Gradients',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildShapes(),
        const SizedBox(height: 24),
        _buildInteractiveContainers(),
        const SizedBox(height: 24),
        _buildLiquidEffects(),
      ],
    );
  }

  Widget _buildShapes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Different Shapes',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: LinearGradientContainer(
                height: 150,
                shape: BoxShape.circle,
                colors: const [Colors.blue, Colors.purple],
                child: const Center(
                  child: Text(
                    'Circle',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LinearGradientContainer(
                height: 150,
                borderRadius: BorderRadius.circular(75),
                colors: const [Colors.orange, Colors.red],
                child: const Center(
                  child: Text(
                    'Rounded',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLiquidEffects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Liquid Press Effects',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: LiquidPressContainer(
                height: 100,
                shape: BoxShape.circle,
                colors: const [Colors.indigo, Colors.blue],
                child: const Center(
                  child: Text(
                    'Press Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LiquidPressContainer(
                height: 100,
                colors: const [Colors.purple, Colors.deepPurple],
                curve: Curves.easeInOutBack,
                animationDuration: const Duration(milliseconds: 800),
                child: const Center(
                  child: Text(
                    'Slow Effect',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LiquidPressContainer(
          height: 100,
          colors: const [Colors.orange, Colors.deepOrange, Colors.red],
          borderRadius: BorderRadius.circular(20),
          springDescription: const SpringDescription(
            mass: 1.0,
            stiffness: 800.0,
            damping: 15.0,
          ),
          child: const Center(
            child: Text(
              'Bouncy Spring Effect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveContainers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Interactive Containers',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        LinearGradientContainer(
          height: 100,
          colors: const [Colors.green, Colors.teal],
          onTap: () {
            debugPrint('Container tapped!');
          },
          child: const Center(
            child: Text(
              'Tap Me!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        MeshGradientContainer(
          height: 100,
          colors: const [Colors.purple, Colors.blue, Colors.pink],
          onTap: () {
            debugPrint('Mesh container tapped!');
          },
          mouseCursor: SystemMouseCursors.precise,
          child: const Center(
            child: Text(
              'Custom Cursor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        GradientBorderContainer(
          height: 100,
          colors: const [Colors.orange, Colors.red],
          backgroundColor: Colors.white,
          onTap: () {
            debugPrint('Border container tapped!');
          },
          child: const Center(
            child: Text(
              'Interactive Border',
              style: TextStyle(
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