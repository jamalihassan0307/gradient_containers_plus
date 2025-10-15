import 'package:flutter/material.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/ambient_light_customizer.dart';

class AmbientEffectCustomizer extends StatefulWidget {
  final List<Color> initialColors;
  final double initialIntensity;
  final double initialSpread;
  final double initialBlur;
  final bool initialPulsing;
  final double initialPulseScale;
  final Duration initialDuration;

  const AmbientEffectCustomizer({
    super.key,
    required this.initialColors,
    required this.initialIntensity,
    required this.initialSpread,
    required this.initialBlur,
    required this.initialPulsing,
    required this.initialPulseScale,
    required this.initialDuration,
  });

  @override
  State<AmbientEffectCustomizer> createState() => _AmbientEffectCustomizerState();
}

class _AmbientEffectCustomizerState extends State<AmbientEffectCustomizer> {
  late List<Color> _colors;
  late double _intensity;
  late double _spread;
  late double _blur;
  late bool _isPulsing;
  late double _pulseScale;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _initializeSettings();
  }

  void _initializeSettings() {
    _colors = List<Color>.from(widget.initialColors);
    _intensity = widget.initialIntensity;
    _spread = widget.initialSpread;
    _blur = widget.initialBlur;
    _isPulsing = widget.initialPulsing;
    _pulseScale = widget.initialPulseScale;
    _duration = widget.initialDuration;
  }

  void _onSettingsChanged(AmbientLightSettings settings) {
    setState(() {
      _colors = settings.colors;
      _intensity = settings.intensity;
      _spread = settings.spread;
      _blur = settings.blur;
      _isPulsing = settings.isPulsing;
      _pulseScale = settings.pulseScale;
      _duration = settings.duration;
    });
  }

  Future<void> _showCustomizer(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
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
                child: Column(
                  children: [
                    const Text(
                      'Customize Ambient Light',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    AmbientLightCustomizer(
                      initialColors: _colors,
                      initialIntensity: _intensity,
                      initialSpread: _spread,
                      initialBlur: _blur,
                      initialPulsing: _isPulsing,
                      initialPulseScale: _pulseScale,
                      initialDuration: _duration,
                      onSettingsChanged: _onSettingsChanged,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              _initializeSettings();
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              debugPrint('Ambient settings applied: Colors: ${_colors.map((c) => c.value.toRadixString(16))}, Intensity: $_intensity');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Changes applied successfully'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Navigator.pop(context);
                            },
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text('Apply'),
                          ),
                        ),
                      ],
                    ),
                  ],
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
    return AmbientLightContainer(
      height: 130,
      onTap: () => _showCustomizer(context),
      colors: _colors,
      ambientIntensity: _intensity,
      spreadRadius: _spread,
      blurRadius: _blur,
      isPulsing: _isPulsing,
      pulseScaleFactor: _pulseScale,
      animationDuration: _duration,
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
    );
  }
}