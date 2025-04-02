<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# gradient_containers_plus

A Flutter package that provides beautiful and customizable gradient container templates for your Flutter applications. This package offers pre-designed container widgets with various gradient styles, shadows, and rounded corners to enhance your app's visual appeal.

<div align="center">
  <kbd>
    <img src="image/image.jpg" width="200" alt="Jam Ali Hassan"/>
  </kbd>
  <br/>
  <br/>
  <b>Jam Ali Hassan</b>
  <br/>
  <i>Flutter Developer</i>
</div>

## Screenshots

### Vertical Gradient Container
<p float="left">
  <img src="screenshots/vertical_gradient_container.png" width="200" alt="Vertical Gradient"/>
  <img src="screenshots/custom_gradient_container.png" width="200" alt="Custom Vertical Gradient"/>
</p>

### Radial Gradient Container
<p float="left">
  <img src="screenshots/radial_gradient_container.png" width="200" alt="Radial Gradient"/>
  <img src="screenshots/custom_radial_gradient.png" width="200" alt="Custom Radial Gradient"/>
</p>

### Sweep Gradient Container
<p float="left">
  <img src="screenshots/sweep_gradient_container.png" width="200" alt="Sweep Gradient"/>
  <img src="screenshots/custom_sweep_gradient.png" width="200" alt="Custom Sweep Gradient"/>
</p>

### Glassmorphic Gradient Container
<p float="left">
  <img src="screenshots/glassmorphic_gradient_container.png" width="200" alt="Glassmorphic Effect"/>
  <img src="screenshots/custom_glassmorphic_gradient.png" width="200" alt="Custom Glassmorphic Effect"/>
</p>

### Neon Gradient Container
<p float="left">
  <img src="screenshots/neon_gradient_container.png" width="200" alt="Neon Glow"/>
  <img src="screenshots/custom_neon_gradient.png" width="200" alt="Custom Neon Glow"/>
</p>

### Animated Gradient Container
<p float="left">
  <img src="screenshots/animated_gradient_container.gif" width="200" alt="Animated Gradient"/>
  <img src="screenshots/custom_animated_gradient.gif" width="200" alt="Custom Animated Gradient"/>
</p>

## Features

* 6 pre-designed gradient container templates:
  - Vertical Gradient Container with customizable colors and direction
  - Radial Gradient Container with adjustable radius and center point
  - Sweep Gradient Container with configurable start and end angles
  - Animated Gradient Container with smooth color transitions
  - Glassmorphic Gradient Container with blur and transparency effects
  - Neon Gradient Container with customizable glow effects
* Responsive design with flexible width and height
* Customizable borders, shadows, and corner radius
* Easy integration with any Flutter widget
* Comprehensive documentation and examples
* Platform Support: Android ✓ | iOS ✓ | Web ✓ | Windows ✓ | macOS ✓ | Linux ✓

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  gradient_containers_plus: ^1.0.5
```

## Usage

Import the package in your Dart code:

```dart
import 'package:gradient_containers_plus/gradient_containers_plus.dart';
```

### Available Containers

1. **Vertical Gradient Container**
   ```dart
   VerticalGradientContainer(
     height: 150,
     colors: const [Colors.blue, Colors.purple],
     child: const Center(child: Text('Vertical Gradient')),
   )
   ```

2. **Radial Gradient Container**
   ```dart
   RadialGradientContainer(
     height: 150,
     colors: const [Colors.orange, Colors.red],
     radius: 0.85,
     child: const Center(child: Text('Radial Gradient')),
   )
   ```

3. **Sweep Gradient Container**
   ```dart
   SweepGradientContainer(
     height: 150,
     colors: const [Colors.green, Colors.teal, Colors.blue],
     startAngle: 0,
     endAngle: 2 * 3.14159,
     child: const Center(child: Text('Sweep Gradient')),
   )
   ```

4. **Animated Gradient Container**
   ```dart
   AnimatedGradientContainer(
     height: 150,
     colors: const [Colors.purple, Colors.blue, Colors.purple],
     duration: const Duration(seconds: 2),
     child: const Center(child: Text('Animated Gradient')),
   )
   ```

5. **Glassmorphic Gradient Container**
   ```dart
   GlassmorphicGradientContainer(
     height: 150,
     colors: const [Colors.white, Colors.white],
     blurSigma: 10,
     borderWidth: 1,
     child: const Center(child: Text('Glassmorphic Effect')),
   )
   ```

6. **Neon Gradient Container**
   ```dart
   NeonGradientContainer(
     height: 150,
     colors: const [Color(0xFF00FF87), Color(0xFF60EFFF)],
     glowIntensity: 0.5,
     glowSpread: 2,
     child: const Center(child: Text('Neon Glow')),
   )
   ```

## Customization

Each container can be customized with:
- Custom colors and gradients
- Border radius and width
- Container dimensions
- Padding and margin
- Specific effects (blur, glow, animation duration)
- Shadow properties
- Child widget positioning

## Documentation

For detailed documentation, please visit our [API Reference](https://pub.dev/documentation/gradient_containers_plus/latest/).

## Additional information

For more information about this package, visit:
* [GitHub Repository](https://github.com/jamalihassan0307/gradient_containers_plus)
* [Pub.dev Package](https://pub.dev/packages/gradient_containers_plus)
* [Issue Tracker](https://github.com/jamalihassan0307/gradient_containers_plus/issues)

## Contributing

We welcome contributions! To contribute to this package:
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Developer

Developed by [Jam Ali Hassan](https://github.com/jamalihassan0307)

- 🌐 [Portfolio](https://jamalihassan0307.github.io/portfolio.github.io)
- 📧 Email: jamalihassan0307@gmail.com
- 🔗 [LinkedIn](https://www.linkedin.com/in/jamalihassan0307)
- 💻 [GitHub](https://github.com/jamalihassan0307)
