import "package:flutter/material.dart";
import "package:gradient_containers_plus/gradient_containers_plus.dart";
import "package:gradient_containers_plus/gradient_containers_plus/containers/ambient_light_customizer.dart";

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
  late bool _showSharpBorder;
  late double _glowWidthMultiplier;

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
    _showSharpBorder = false;
    _glowWidthMultiplier = 3.5;
  }

  Future<void> _showCustomizer(BuildContext context) async {
    // Store temporary settings that can be applied or discarded
    List<Color> tempColors = List.from(_colors);
    double tempIntensity = _intensity;
    double tempSpread = _spread;
    double tempBlur = _blur;
    bool tempPulsing = _isPulsing;
    double tempPulseScale = _pulseScale;
    Duration tempDuration = _duration;
    bool tempSharpBorder = _showSharpBorder;
    double tempGlowMultiplier = _glowWidthMultiplier;
    
    final result = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
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
                            'Customize Ambient Effect',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          AmbientLightCustomizer(
                            initialColors: tempColors,
                            initialIntensity: tempIntensity,
                            initialSpread: tempSpread,
                            initialBlur: tempBlur,
                            initialPulsing: tempPulsing,
                            initialPulseScale: tempPulseScale,
                            initialDuration: tempDuration,
                            onSettingsChanged: (settings) {
                              setState(() {
                                tempColors = settings.colors;
                                tempIntensity = settings.intensity;
                                tempSpread = settings.spread;
                                tempBlur = settings.blur;
                                tempPulsing = settings.isPulsing;
                                tempPulseScale = settings.pulseScale;
                                tempDuration = settings.duration;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          // Additional settings specific to the border style
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Show Sharp Border',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Switch(
                                value: tempSharpBorder,
                                onChanged: (value) {
                                  setState(() {
                                    tempSharpBorder = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Glow Width Multiplier',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('${tempGlowMultiplier.toStringAsFixed(2)}x'),
                                ],
                              ),
                              Slider(
                                value: tempGlowMultiplier,
                                min: 1.0,
                                max: 10.0,
                                onChanged: (newValue) {
                                  setState(() {
                                    tempGlowMultiplier = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: const Text('Cancel'),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: FilledButton(
                                  onPressed: () => Navigator.pop(context, true),
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
            );
          }
        );
      },
    );

    if (result == true) {
      // Apply changes
      setState(() {
        _colors = tempColors;
        _intensity = tempIntensity;
        _spread = tempSpread;
        _blur = tempBlur;
        _isPulsing = tempPulsing;
        _pulseScale = tempPulseScale;
        _duration = tempDuration;
        _showSharpBorder = tempSharpBorder;
        _glowWidthMultiplier = tempGlowMultiplier;
      });
      
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Effect updated'),
          duration: Duration(seconds: 1),
        ),
      );
    }
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
      showSharpBorder: _showSharpBorder,
      glowWidthMultiplier: _glowWidthMultiplier,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Customize",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Tap to edit",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
