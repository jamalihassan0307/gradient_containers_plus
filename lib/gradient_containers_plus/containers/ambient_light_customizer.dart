import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AmbientLightCustomizer extends StatefulWidget {
  final List<Color> initialColors;
  final double initialIntensity;
  final double initialSpread;
  final double initialBlur;
  final bool initialPulsing;
  final double initialPulseScale;
  final Duration initialDuration;
  final ValueChanged<AmbientLightSettings> onSettingsChanged;

  const AmbientLightCustomizer({
    super.key,
    required this.initialColors,
    required this.initialIntensity,
    required this.initialSpread,
    required this.initialBlur,
    required this.initialPulsing,
    required this.initialPulseScale,
    required this.initialDuration,
    required this.onSettingsChanged,
  });

  @override
  State<AmbientLightCustomizer> createState() => _AmbientLightCustomizerState();
}

class _AmbientLightCustomizerState extends State<AmbientLightCustomizer> {
  late List<Color> colors;
  late double intensity;
  late double spread;
  late double blur;
  late bool isPulsing;
  late double pulseScale;
  late Duration duration;
  bool isPickingColor = false;

  @override
  void initState() {
    super.initState();
    colors = List.from(widget.initialColors);
    intensity = widget.initialIntensity;
    spread = widget.initialSpread;
    blur = widget.initialBlur;
    isPulsing = widget.initialPulsing;
    pulseScale = widget.initialPulseScale;
    duration = widget.initialDuration;
  }

  void _notifyChanges() {
    widget.onSettingsChanged(AmbientLightSettings(
      colors: colors,
      intensity: intensity,
      spread: spread,
      blur: blur,
      isPulsing: isPulsing,
      pulseScale: pulseScale,
      duration: duration,
    ));
  }

  void _showColorPicker(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: colors[index],
              onColorChanged: (Color color) {
                setState(() {
                  colors[index] = color;
                  _notifyChanges();
                });
              },
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Done'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildColorList() {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ...colors.asMap().entries.map((entry) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: InkWell(
                  onTap: () => _showColorPicker(entry.key),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: entry.value,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              )),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {
              setState(() {
                colors.add(Colors.blue);
                _notifyChanges();
              });
            },
          ),
          if (colors.length > 1)
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                setState(() {
                  colors.removeLast();
                  _notifyChanges();
                });
              },
            ),
        ],
      ),
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
    String? suffix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.toStringAsFixed(2)}${suffix ?? ''}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value,
                min: min,
                max: max,
                onChanged: (newValue) {
                  setState(() {
                    onChanged(newValue);
                    _notifyChanges();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Colors',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildColorList(),
          const SizedBox(height: 16),
          _buildSlider(
            label: 'Intensity',
            value: intensity,
            min: 0.0,
            max: 1.0,
            onChanged: (value) => intensity = value,
          ),
          _buildSlider(
            label: 'Spread',
            value: spread,
            min: 0.0,
            max: 100.0,
            onChanged: (value) => spread = value,
            suffix: 'px',
          ),
          _buildSlider(
            label: 'Blur',
            value: blur,
            min: 0.0,
            max: 100.0,
            onChanged: (value) => blur = value,
            suffix: 'px',
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                'Pulsing Effect',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Switch(
                value: isPulsing,
                onChanged: (value) {
                  setState(() {
                    isPulsing = value;
                    _notifyChanges();
                  });
                },
              ),
            ],
          ),
          if (isPulsing) ...[
            _buildSlider(
              label: 'Pulse Scale',
              value: pulseScale,
              min: 1.0,
              max: 2.0,
              onChanged: (value) => pulseScale = value,
              suffix: 'x',
            ),
            _buildSlider(
              label: 'Animation Speed',
              value: duration.inMilliseconds / 1000,
              min: 0.5,
              max: 5.0,
              onChanged: (value) =>
                  duration = Duration(milliseconds: (value * 1000).round()),
              suffix: 's',
            ),
          ],
        ],
      ),
    );
  }
}

class AmbientLightSettings {
  final List<Color> colors;
  final double intensity;
  final double spread;
  final double blur;
  final bool isPulsing;
  final double pulseScale;
  final Duration duration;

  const AmbientLightSettings({
    required this.colors,
    required this.intensity,
    required this.spread,
    required this.blur,
    required this.isPulsing,
    required this.pulseScale,
    required this.duration,
  });
}