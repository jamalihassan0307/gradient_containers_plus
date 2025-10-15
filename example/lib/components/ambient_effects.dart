import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/ambient_light_customizer.dart';

class AmbientEffectsSection extends StatefulWidget {
  const AmbientEffectsSection({super.key});

  @override
  State<AmbientEffectsSection> createState() => _AmbientEffectsSectionState();
}

class _AmbientEffectsSectionState extends State<AmbientEffectsSection> {
  // Ambient Light Container State
  List<Color> _ambientColors = const [Color(0xFF00F5FF), Color(0xFF00FFAB)];
  double _ambientIntensity = 0.7;
  double _spreadRadius = 25.0;
  double _blurRadius = 35.0;
  bool _isPulsing = true;
  double _pulseScale = 1.3;
  Duration _animationDuration = const Duration(seconds: 1);

  void _showCustomizationInfo() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tap to customize effects, long press for more options'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onAmbientSettingsChanged(AmbientLightSettings settings) {
    setState(() {
      _ambientColors = List<Color>.from(settings.colors);
      _ambientIntensity = settings.intensity;
      _spreadRadius = settings.spread;
      _blurRadius = settings.blur;
      _isPulsing = settings.isPulsing;
      _pulseScale = settings.pulseScale;
      _animationDuration = settings.duration;
    });
    Navigator.pop(context);
  }

  void _showCustomizer({
    List<Color>? initialColors,
    double? initialIntensity,
    double? initialSpread,
    double? initialBlur,
    bool? initialPulsing,
    double? initialPulseScale,
    Duration? initialDuration,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AmbientLightCustomizer(
                  initialColors: initialColors ?? _ambientColors,
                  initialIntensity: initialIntensity ?? _ambientIntensity,
                  initialSpread: initialSpread ?? _spreadRadius,
                  initialBlur: initialBlur ?? _blurRadius,
                  initialPulsing: initialPulsing ?? _isPulsing,
                  initialPulseScale: initialPulseScale ?? _pulseScale,
                  initialDuration: initialDuration ?? _animationDuration,
                  onSettingsChanged: _onAmbientSettingsChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(height: 24);
    const horizontalSpacing = SizedBox(width: 16);

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
        spacing,
        Row(
          children: [
            // Interactive Customization
            Expanded(
              child: GestureDetector(
                onTap: () => _showCustomizer(),
                onLongPress: _showCustomizationInfo,
                child: AmbientLightContainer(
                  height: 120,
                  colors: _ambientColors,
                  ambientIntensity: _ambientIntensity,
                  spreadRadius: _spreadRadius,
                  blurRadius: _blurRadius,
                  isPulsing: _isPulsing,
                  pulseScaleFactor: _pulseScale,
                  animationDuration: _animationDuration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Customize',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Tap to edit',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            horizontalSpacing,
            // Mystical Orb Effect
            Expanded(
              child: GestureDetector(
                onTap: () => _showCustomizer(
                  initialColors: const [Color(0xFFFF69B4), Color(0xFF8A2BE2)],
                  initialIntensity: 0.6,
                  initialSpread: 30,
                  initialBlur: 40,
                  initialPulsing: true,
                  initialPulseScale: 1.15,
                  initialDuration: const Duration(milliseconds: 1500),
                ),
                child: AmbientLightContainer(
                  height: 120,
                  shape: BoxShape.circle,
                  colors: const [
                    Color(0xFFFF69B4),
                    Color(0xFF8A2BE2),
                  ],
                  ambientIntensity: 0.6,
                  spreadRadius: 30,
                  blurRadius: 40,
                  pulseScaleFactor: 1.15,
                  animationDuration: const Duration(milliseconds: 1500),
                  child: const Center(
                    child: Text(
                      'Mystical',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        spacing,
        // Sunset Glow Effect
        GestureDetector(
          onTap: () => _showCustomizer(
            initialColors: const [Color(0xFFFF8C00), Color(0xFFFF0080), Color(0xFFFF4500)],
            initialIntensity: 0.5,
            initialSpread: 35,
            initialBlur: 45,
            initialPulsing: false,
            initialPulseScale: 1.0,
            initialDuration: const Duration(seconds: 1),
          ),
          child: AmbientLightContainer(
            height: 100,
            colors: const [
              Color(0xFFFF8C00),
              Color(0xFFFF0080),
              Color(0xFFFF4500),
            ],
            borderRadius: BorderRadius.circular(20),
            ambientIntensity: 0.5,
            spreadRadius: 35,
            blurRadius: 45,
            isPulsing: false,
            child: const Center(
              child: Text(
                'Sunset Glow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        spacing,
        // Northern Lights Effect
        GestureDetector(
          onTap: () => _showCustomizer(
            initialColors: const [Color(0xFF80FF00), Color(0xFF00FFFF), Color(0xFF9370DB)],
            initialIntensity: 0.6,
            initialSpread: 40,
            initialBlur: 50,
            initialPulsing: true,
            initialPulseScale: 1.4,
            initialDuration: const Duration(seconds: 3),
          ),
          child: AmbientLightContainer(
            height: 100,
            colors: const [
              Color(0xFF80FF00),
              Color(0xFF00FFFF),
              Color(0xFF9370DB),
            ],
            borderRadius: BorderRadius.circular(15),
            ambientIntensity: 0.6,
            spreadRadius: 40,
            blurRadius: 50,
            animationDuration: const Duration(seconds: 3),
            pulseScaleFactor: 1.4,
            child: const Center(
              child: Text(
                'Northern Lights',
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
    );
  }
}