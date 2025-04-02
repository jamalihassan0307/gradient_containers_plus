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
    <img src="image/image.jpg" width="200" alt="Jam ali Hassan"/>
  </kbd>
  <br/>
  <br/>
  <b>Jam ali Hassan</b>
  <br/>
  <i>Flutter Developer</i>
</div>

## Developer

Developed by [Jam ali Hassan](https://github.com/jamalihassan0307)

- 🌐 [Portfolio](https://jamalihassan0307.github.io/portfolio.github.io)
- 📧 Email: jamalihassan0307@gmail.com
- 🔗 [LinkedIn](https://www.linkedin.com/in/jamalihassan0307)
- 💻 [GitHub](https://github.com/jamalihassan0307)

## Features

* 6 pre-designed gradient container templates
* Multiple gradient types (Linear, Radial, Sweep)
* Advanced effects (Glassmorphic, Neon)
* Animated gradients
* Responsive design with flexible width
* Easy to integrate and use

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  gradient_containers_plus: ^1.0.1
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
- Custom colors
- Border radius
- Width and height
- Padding and margin
- Specific effects (blur, glow, animation duration)

## Additional information

For more information about this package, visit:
* [GitHub Repository](https://github.com/jamalihassan0307/gradient_containers_plus)
* [Pub.dev Package](https://pub.dev/packages/gradient_containers_plus)

To contribute to this package:
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

For issues and feature requests, please use the GitHub issue tracker.
