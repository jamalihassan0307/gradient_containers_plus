import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/animated_gradient_container.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/glassmorphic_gradient_container.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/neon_gradient_container.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/radial_gradient_container.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/sweep_gradient_container.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/vertical_gradient_container.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gradient Containers Plus Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gradient Containers Plus'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Beautiful Gradient Containers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'This package provides various gradient container templates with advanced features like patterns, shadows, and effects.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              _buildExamples(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamples() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Vertical Gradient Container',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        VerticalGradientContainer(
          height: 150,
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
        const SizedBox(height: 24),
        const Text(
          'Custom Vertical Gradient',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        VerticalGradientContainer(
          height: 150,
          colors: const [Colors.orange, Colors.red],
          borderRadius: BorderRadius.circular(20),
          child: const Center(
            child: Text(
              'Custom Colors & Border Radius',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Radial Gradient Container',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        RadialGradientContainer(
          height: 150,
          child: const Center(
            child: Text(
              'Radial Gradient',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Custom Radial Gradient',
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
              'Custom Colors & Radius',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Sweep Gradient Container',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SweepGradientContainer(
          height: 150,
          child: const Center(
            child: Text(
              'Sweep Gradient',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Custom Sweep Gradient',
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
              'Custom Colors & Angles',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Animated Gradient Container',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        AnimatedGradientContainer(
          height: 150,
          child: const Center(
            child: Text(
              'Animated Gradient',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Custom Animated Gradient',
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
              'Custom Colors & Duration',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Glassmorphic Gradient Container',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        GlassmorphicGradientContainer(
          height: 150,
          colors: const [Colors.white, Colors.white],
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
        const SizedBox(height: 24),
        const Text(
          'Custom Glassmorphic Gradient',
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
              'Custom Colors & Blur',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Neon Gradient Container',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        NeonGradientContainer(
          height: 150,
          child: const Center(
            child: Text(
              'Neon Glow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Custom Neon Gradient',
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
              'Custom Colors & Glow',
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