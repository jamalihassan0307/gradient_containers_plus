import 'package:flutter/material.dart';
import 'package:flutter_containers/flutter_containers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Gradient Containers Example')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: GradientContainers(),
        ),
      ),
    );
  }
}
