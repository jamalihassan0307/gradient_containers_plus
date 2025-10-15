import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';
import 'ambient_effect_customizer.dart';

class ShapesAndInteractionsExample extends StatefulWidget {
  const ShapesAndInteractionsExample({super.key});

  @override
  State<ShapesAndInteractionsExample> createState() => _ShapesAndInteractionsExampleState();
}

class _ShapesAndInteractionsExampleState extends State<ShapesAndInteractionsExample> {
  bool _isCircle = false;
  BoxShape get _shape => _isCircle ? BoxShape.circle : BoxShape.rectangle;

  void _showCustomizationInfo() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tap to customize effects'),
        duration: Duration(seconds: 2),
      ),
    );
  }

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
        _buildShapeToggle(),
        const SizedBox(height: 16),
        _buildShapes(),
        const SizedBox(height: 24),
        _buildRotatingBorderEffects(),
        const SizedBox(height: 24),
        _buildInteractiveContainers(),
        const SizedBox(height: 24),
        _buildLiquidEffects(),
        const SizedBox(height: 24),
        _buildAmbientEffects(),
      ],
    );
  }

  Widget _buildShapeToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Rectangle'),
        Switch(
          value: _isCircle,
          onChanged: (value) {
            setState(() {
              _isCircle = value;
            });
          },
        ),
        const Text('Circle'),
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

  Widget _buildRotatingBorderEffects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Rotating Border Effects',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AmbientLightContainer(
                height: 150,
                shape: _shape,
                colors: const [Colors.cyan, Colors.blue, Colors.purple],
                ambientIntensity: 0.8,
                spreadRadius: 5.0,
                blurRadius: 0.0,
                showSharpBorder: true,
                glowWidthMultiplier: 3.0,
                animationDuration: const Duration(seconds: 3),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ambient Light Container with Sharp Border'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    'Sharp Border',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AmbientLightContainer(
                height: 150,
                shape: _shape,
                colors: const [Colors.pink, Colors.purple, Colors.deepPurple],
                ambientIntensity: 0.8,
                spreadRadius: 4.0,
                blurRadius: 0.0,
                showSharpBorder: false,
                glowWidthMultiplier: 5.0,
                animationDuration: const Duration(seconds: 5),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Ambient Light with Wide Glow'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    'Glowing Border',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        AmbientLightContainer(
          height: 100,
          colors: const [
            Color(0xFF00BFFF), 
            Color(0xFF1E90FF), 
            Color(0xFF0000FF)
          ],
          shape: _shape,
          ambientIntensity: 0.9,
          spreadRadius: 3.0,
          blurRadius: 0.0,
          showSharpBorder: true,
          glowWidthMultiplier: 2.5,
          animationDuration: const Duration(seconds: 2),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Blue Electric Container Tapped'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: const Center(
            child: Text(
              'Blue Electric',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAmbientEffects() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Ambient Light Effects',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: _showCustomizationInfo,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            // Interactive Customization
            Expanded(
              child: AmbientEffectCustomizer(
                initialColors: const [Color(0xFF00F5FF), Color(0xFF00FFAB)],
                initialIntensity: 0.7,
                initialSpread: 5.0,
                initialBlur: 0.0,
                initialPulsing: false,
                initialPulseScale: 1.3,
                initialDuration: const Duration(seconds: 1),
              ),
            ),
            const SizedBox(width: 16),
            // Mystical Orb Effect
            Expanded(
              child: AmbientLightContainer(
                height: 120,
                shape: BoxShape.circle,
                colors: const [
                  Color(0xFFFF69B4),
                  Color(0xFF8A2BE2),
                ],
                ambientIntensity: 1,
                spreadRadius: 7,
                blurRadius: 0,
                pulseScaleFactor: 1.15,
                animationDuration: const Duration(milliseconds: 1500),
                child: const Center(
                  child: Text(
                    'Mystical',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Sunset Glow Effect
        AmbientLightContainer(
          height: 100,
          colors: const [
            Color(0xFFFF8C00),
            Color(0xFFFF0080),
            Color(0xFFFF4500),
          ],
          borderRadius: BorderRadius.circular(20),
          ambientIntensity: 1,
          spreadRadius: 7,
          blurRadius: 0,
          isPulsing: true,
          child: const Center(
            child: Text(
              'Sunset Glow',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Northern Lights Effect
        AmbientLightContainer(
          height: 100,
          colors: const [
            Color(0xFF80FF00),
            Color(0xFF00FFFF),
            Color(0xFF9370DB),
          ],
          borderRadius: BorderRadius.circular(15),
          ambientIntensity: 1,
          spreadRadius: 7,
          blurRadius: 0,
          animationDuration: const Duration(seconds: 3),
          pulseScaleFactor: 1.4,
          child: const Center(
            child: Text(
              'Northern Lights',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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