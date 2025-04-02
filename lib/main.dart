import 'package:flutter/material.dart';
import 'package:flutter_gradient_containers/flutter_containers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gradient Containers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gradient Containers Demo'),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
