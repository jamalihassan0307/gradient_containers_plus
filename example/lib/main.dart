import 'package:flutter/material.dart';
import 'components/basic_gradients.dart';
import 'components/special_effects.dart';
import 'components/animated_gradients.dart';
import 'components/preset_gradients.dart';
import 'components/advanced_gradients.dart';
import 'components/shapes_and_interactions.dart';

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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Beautiful Gradient Containers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'This package provides various gradient container templates with advanced features like patterns, shadows, and effects.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 32),
              BasicGradientsSection(),
              SizedBox(height: 32),
              SpecialEffectsSection(),
              SizedBox(height: 32),
              AnimatedGradientsSection(),
              SizedBox(height: 32),
              PresetGradientsSection(),
              SizedBox(height: 32),
              ShapesAndInteractionsExample(),
            ],
          ),
        ),
      ),
    );
  }
}
   
