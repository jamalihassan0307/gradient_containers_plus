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

# flutter_gradient_containers

A Flutter package that provides beautiful and customizable gradient container templates for your Flutter applications. This package offers pre-designed container widgets with various gradient styles, shadows, and rounded corners to enhance your app's visual appeal.

## Features

* 10 pre-designed gradient container templates
* Multiple gradient types (Linear, Radial, Sweep)
* Advanced effects (Glassmorphic, Neon, 3D, Metallic, Holographic)
* Customizable patterns (dots, lines, grid)
* Animated patterns and shimmer effects
* Responsive design with flexible width
* Easy to integrate and use

## Getting started

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  flutter_gradient_containers: ^0.0.1
```

## Usage

Import the package in your Dart code:

```dart
import 'package:flutter_gradient_containers/flutter_gradient_containers.dart';
```

### Basic Usage

Use the `GradientContainers` widget to display all gradient templates:

```dart
const GradientContainers()
```

### Individual Container Usage

You can also use individual containers by creating custom widgets:

```dart
// Example of a custom gradient container
Container(
  width: double.infinity,
  height: 150,
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      colors: [Colors.blue, Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  child: const Center(
    child: Text(
      'Custom Gradient',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)
```

## Available Templates

1. **Vertical Gradient**
   - Linear gradient from blue to purple
   - Subtle shadow effect
   - Rounded corners

2. **Radial Gradient**
   - Radial gradient from orange to red
   - Enhanced shadow effect
   - Rounded corners

3. **Sweep Gradient**
   - Sweep gradient with green, teal, and blue
   - Pattern overlay
   - Rounded corners

4. **Animated Gradient**
   - Multi-color gradient with shimmer effect
   - Animated pattern overlay
   - Rounded corners

5. **Glassmorphic Effect**
   - Transparent gradient with blur effect
   - Subtle border
   - Modern glass-like appearance

6. **Neon Glow**
   - Bright gradient with glow effect
   - Multiple colored shadows
   - Text shadow for readability

7. **Animated Pattern**
   - Deep blue gradient background
   - Custom animated pattern overlay
   - Rounded corners

8. **3D Effect**
   - Professional color scheme
   - Multiple shadows for depth
   - Text shadow for depth

9. **Metallic Effect**
   - Grey gradient with shimmer
   - Subtle shadow
   - Shader mask for metallic look

10. **Holographic Effect**
    - Multiple colored shadows
    - Transparent gradient layers
    - Shimmer effect overlay

## Customization

You can customize the containers by modifying:
- Colors
- Gradient types
- Shadow effects
- Border radius
- Pattern types
- Animation effects

## Additional information

For more information about this package, visit:
* [GitHub Repository](https://github.com/jamalihassan0307/flutter_containers_first_extention)
* [Pub.dev Package](https://pub.dev/packages/flutter_gradient_containers)

To contribute to this package:
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

For issues and feature requests, please use the GitHub issue tracker.
