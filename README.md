# gradient_containers_plus

<div align="center">
  <kbd>
    <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/banner/banner.png" width="200" alt="Jam Ali Hassan"/>
  </kbd>
  <br/>
  <br/>
  <b>Jam Ali Hassan</b>
  <br/>
  <i>Flutter Developer</i>
  <br/>
  <br/>
  
  [![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/jamalihassan0307)
  [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jamalihassan0307)
  [![Portfolio](https://img.shields.io/badge/Portfolio-255E63?style=for-the-badge&logo=About.me&logoColor=white)](https://jamalihassan0307.github.io/portfolio.github.io)
  <br/>
  [![Pub Version](https://img.shields.io/pub/v/gradient_containers_plus?style=for-the-badge)](https://pub.dev/packages/gradient_containers_plus)
  [![Platform](https://img.shields.io/badge/Platform-Flutter-02569B?style=for-the-badge&logo=flutter)](https://flutter.dev)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
</div>

## Overview

A Flutter package that provides beautiful and customizable gradient container templates for your Flutter applications. This package offers pre-designed container widgets with various gradient styles, shadows, and rounded corners to enhance your app's visual appeal. Now with advanced features like animated color changes, rotating gradient borders, ambient light effects, and interactive containers! Each section includes animated GIF demos so you can see the effects in action at a glance.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  gradient_containers_plus: ^1.1.2
```

## Usage Examples

### 1. Basic Gradient Containers

#### Vertical Gradient Container
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/vertical_radient.PNG" width="400" alt="Vertical Gradient"/>
</div>

```dart
VerticalGradientContainer(
  height: 150,
  colors: const [Colors.blue, Colors.purple],
  child: const Center(
    child: Text('Vertical Gradient'),
  ),
)
```

#### Radial Gradient Container
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/radial_gradient.PNG" width="400" alt="Radial Gradient"/>
</div>

```dart
RadialGradientContainer(
  height: 150,
  colors: const [Colors.orange, Colors.red],
  radius: 0.85,
  child: const Center(
    child: Text('Radial Gradient'),
  ),
)
```

### 2. Animated Effects

#### Animated Gradient Container
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/rotating_gradient.PNG" width="400" alt="Rotating Gradient"/>
  <br/>
  <!-- No GIF available for this demo yet -->
</div>

```dart
AnimatedGradientContainer(
  height: 150,
  colors: const [
    Colors.purple,
    Colors.blue,
    Colors.purple
  ],
  duration: const Duration(seconds: 2),
  child: const Center(
    child: Text('Animated Gradient'),
  ),
)
```

#### Color Change Gradient (NEW!)
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/color_change_gradient.PNG" width="400" alt="Color Change Gradient"/>
  <br/>
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/color_change_gradient.gif" width="400" alt="Color Change Gradient Animation"/>
</div>

```dart
AnimatedColorChangeContainer(
  height: 150,
  colorSets: [
    [Colors.blue, Colors.purple],
    [Colors.red, Colors.orange],
    [Colors.green, Colors.yellow],
  ],
  duration: const Duration(seconds: 3),
  curve: Curves.easeInOut,
  child: const Center(
    child: Text('Color Change Effect'),
  ),
)
```

### 3. Special Effects

#### Glassmorphic Gradient Container
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/glassmorphic_effect.PNG" width="400" alt="Glassmorphic Effect"/>
</div>

```dart
GlassmorphicGradientContainer(
  height: 150,
  colors: const [Colors.white, Colors.white],
  blurSigma: 10,
  borderWidth: 1,
  child: const Center(
    child: Text('Glassmorphic Effect'),
  ),
)
```

#### Neon Gradient Container
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/neon_effect.PNG" width="400" alt="Neon Glow"/>
</div>

```dart
NeonGradientContainer(
  height: 150,
  colors: const [
    Color(0xFF00FF87),
    Color(0xFF60EFFF)
  ],
  glowIntensity: 0.5,
  glowSpread: 2,
  child: const Center(
    child: Text('Neon Glow'),
  ),
)
```

### 4. Interactive Effects

#### Liquid Press Effects (NEW!)
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/liquid_press_effects.PNG" width="400" alt="Liquid Press Effect"/>
  <br/>
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/liquid_press_effects.gif" width="400" alt="Liquid Press Effects Animation"/>
</div>

```dart
LiquidPressContainer(
  height: 100,
  colors: const [Colors.purple, Colors.deepPurple],
  curve: Curves.easeInOutBack,
  animationDuration: const Duration(milliseconds: 800),
  child: const Center(
    child: Text('Press Me!', style: TextStyle(color: Colors.white)),
  ),
)
```

#### Interactive Containers (NEW!)
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/interactive_containers.PNG" width="400" alt="Interactive Containers"/>
  <br/>
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/interactive_containers.gif" width="400" alt="Interactive Containers Animation"/>
</div>

```dart
LinearGradientContainer(
  height: 100,
  colors: const [Colors.green, Colors.teal],
  onTap: () {
    debugPrint('Container tapped!');
  },
  child: const Center(
    child: Text('Tap Me!', style: TextStyle(color: Colors.white)),
  ),
)
```

### 5. Ambient Light Effects (NEW!)
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/ambient_light_effects.PNG" width="400" alt="Ambient Light Effects"/>
  <br/>
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/ambient_light_effects.gif" width="400" alt="Ambient Light Effects Animation"/>
</div>

```dart
AmbientLightContainer(
  height: 120,
  colors: const [Color(0xFFFF69B4), Color(0xFF8A2BE2)],
  ambientIntensity: 1,
  spreadRadius: 7,
  blurRadius: 0,
  showSharpBorder: true,
  child: const Center(
    child: Text('Ambient Light Effect'),
  ),
)
```

### 6. Rotating Border Effects (NEW!)
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/rotating_border_effects.PNG" width="400" alt="Rotating Border Effects"/>
  <br/>
  <!-- No GIF available for this demo yet -->
</div>

```dart
AmbientLightContainer(
  height: 150,
  colors: const [Colors.cyan, Colors.blue, Colors.purple],
  ambientIntensity: 0.8,
  spreadRadius: 5.0,
  blurRadius: 0.0,
  showSharpBorder: true,
  glowWidthMultiplier: 3.0,
  animationDuration: const Duration(seconds: 3),
  child: const Center(
    child: Text('Rotating Border'),
  ),
)
```

### 7. Different Shapes (NEW!)
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/different_shapes.PNG" width="400" alt="Different Shapes"/>
</div>

```dart
// Circular container
LinearGradientContainer(
  height: 150,
  shape: BoxShape.circle,
  colors: const [Colors.blue, Colors.purple],
  child: const Center(
    child: Text('Circle', style: TextStyle(color: Colors.white)),
  ),
)

// Rounded container
LinearGradientContainer(
  height: 150,
  borderRadius: BorderRadius.circular(75),
  colors: const [Colors.orange, Colors.red],
  child: const Center(
    child: Text('Rounded', style: TextStyle(color: Colors.white)),
  ),
)
```

### 8. Preset Gradients (NEW!)
<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/preset_gradients(sunset).PNG" width="400" alt="Sunset Preset"/>
</div>

```dart
// Using preset gradients
LinearGradientContainer(
  height: 150,
  colors: GradientPresets.sunset,
  child: const Center(
    child: Text('Sunset Preset', style: TextStyle(color: Colors.white)),
  ),
)
```

<div align="center">
  <img src="https://raw.githubusercontent.com/jamalihassan0307/gradient_containers_plus/refs/heads/main/screenshots/preset_gradients(ocean_blue).PNG" width="400" alt="Ocean Blue Preset"/>
</div>

```dart
// Ocean Blue preset
LinearGradientContainer(
  height: 150,
  colors: GradientPresets.oceanBlue,
  child: const Center(
    child: Text('Ocean Blue Preset', style: TextStyle(color: Colors.white)),
  ),
)
```

## Features

### 🎬 GIF Demos

Watch animated features in action! Each section includes an animated GIF demo.

✨ Multiple pre-designed gradient container templates:
  - 🎨 Vertical & Linear Gradient Containers with customizable colors and direction
  - 🔄 Radial Gradient Container with adjustable radius and center point
  - 🌈 Sweep Gradient Container with configurable start and end angles
  - ✨ Animated Gradient Container with smooth color transitions
  - 🌟 Glassmorphic Gradient Container with blur and transparency effects
  - 💫 Neon Gradient Container with customizable glow effects
  - 🔄 Animated Color Change Container with smooth transitions between color sets
  - 💧 Liquid Press Container with interactive spring animation effects
  - 🌈 Ambient Light Container with customizable glow and rotating border effects
  - 🔄 Mesh Gradient Container for beautiful color mesh effects

🎯 Advanced Features:
- ✨ Rotating gradient borders with customizable animation speed
- 🔌 Interactive containers with tap, hover, and custom cursor support
- 🌟 Ambient light effects with customizable glow and intensity
- 🎭 Multiple shape options: circle, rectangle, and custom border radius
- 🎨 Ready-to-use preset gradients for quick implementation
- 💧 Spring-based liquid press animations for tactile feedback

🛠️ Core Features:
- 📱 Responsive design with flexible width and height
- 🎨 Customizable borders, shadows, and corner radius
- 🔌 Easy integration with any Flutter widget
- 📚 Comprehensive documentation and examples
- 💻 Full Platform Support:
  - Android ✓
  - iOS ✓
  - Web ✓
  - Windows ✓
  - macOS ✓
  - Linux ✓

## Customization

Each container can be customized with:
- 🎨 Custom colors and gradients
- 🔲 Border radius and width
- 📐 Container dimensions
- 📏 Padding and margin
- ✨ Specific effects (blur, glow, animation duration, rotation speed)
- 🌗 Shadow properties
- 📍 Child widget positioning
- 🔄 Animation properties (duration, curve, pulse scale)
- 💫 Interactive properties (onTap, onHover, mouseCursor)
- 🌈 Ambient light settings (intensity, spread, blur)
- 🎭 Shape options (rectangle, circle, custom border radius)

## Documentation

For detailed documentation, please visit our [API Reference](https://pub.dev/documentation/gradient_containers_plus/latest/).

## Additional Information

- 📦 [Pub.dev Package](https://pub.dev/packages/gradient_containers_plus)
- 💻 [GitHub Repository](https://github.com/jamalihassan0307/gradient_containers_plus)
- 🐛 [Issue Tracker](https://github.com/jamalihassan0307/gradient_containers_plus/issues)

## Contributing

We welcome contributions! To contribute:
1. 🍴 Fork the repository
2. 🌿 Create your feature branch
3. ✍️ Commit your changes
4. 🚀 Push to the branch
5. 📬 Create a Pull Request

## License

This project is licensed under the MIT License (2025) - see the [LICENSE](LICENSE) file for details.

## Contact

- 👨‍💻 Developed by [Jam Ali Hassan](https://github.com/jamalihassan0307)
- 🌐 [Portfolio](https://jamalihassan0307.github.io/portfolio.github.io)
- 📧 Email: jamalihassan0307@gmail.com
- 🔗 [LinkedIn](https://www.linkedin.com/in/jamalihassan0307)
