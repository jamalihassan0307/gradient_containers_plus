import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';

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
              const GradientContainers(),
              const SizedBox(height: 32),
              _buildCustomExample(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Custom Container Example',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6B73FF), Color(0xFF000DFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: const AlwaysStoppedAnimation(0),
                builder: (context, child) {
                  return CustomPaint(
                    painter: AnimatedPatternPainter(
                      pattern: PatternDecorationPattern.grid,
                      color: Colors.white.withOpacity(0.1),
                      animation: 0,
                    ),
                  );
                },
              ),
              const Center(
                child: Text(
                  'Custom Animated Pattern',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Code Example:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '''Container(
  width: double.infinity,
  height: 150,
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFF6B73FF), Color(0xFF000DFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: Stack(
    children: [
      AnimatedBuilder(
        animation: const AlwaysStoppedAnimation(0),
        builder: (context, child) {
          return CustomPaint(
            painter: AnimatedPatternPainter(
              pattern: PatternDecorationPattern.grid,
              color: Colors.white.withOpacity(0.1),
              animation: 0,
            ),
          );
        },
      ),
      const Center(
        child: Text(
          'Custom Animated Pattern',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  ),
)''',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
} 