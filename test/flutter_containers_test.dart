import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';
import 'package:gradient_containers_plus/example/lib/main.dart' as example;

void main() {
  group('Gradient Containers Plus Tests', () {
    testWidgets('renders all gradient containers', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: example.HomePage()));

      // Verify that all containers are rendered
      expect(find.byType(VerticalGradientContainer), findsNWidgets(2));
      expect(find.byType(RadialGradientContainer), findsNWidgets(2));
      expect(find.byType(SweepGradientContainer), findsNWidgets(2));
      expect(find.byType(AnimatedGradientContainer), findsNWidgets(2));
      expect(find.byType(GlassmorphicGradientContainer), findsNWidgets(2));
      expect(find.byType(NeonGradientContainer), findsNWidgets(2));
    });

    testWidgets('containers have correct decoration properties', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: example.HomePage()));

      // Find all containers
      final containers = tester.widgetList<Container>(find.byType(Container));
      
      // Verify that each container has the expected properties
      for (final container in containers) {
        expect(container.decoration, isNotNull);
        expect(container.decoration is BoxDecoration, isTrue);
        
        final decoration = container.decoration as BoxDecoration;
        expect(decoration.borderRadius, isNotNull);
        expect(decoration.boxShadow, isNotEmpty);
      }
    });

    testWidgets('animated gradient container animates', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: example.HomePage()));
      
      // Find the animated gradient container
      final animatedContainer = find.byType(AnimatedGradientContainer).first;
      expect(animatedContainer, findsOneWidget);
      
      // Pump the animation
      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('glassmorphic container has blur effect', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: example.HomePage()));
      
      // Find the glassmorphic container
      final glassmorphicContainer = find.byType(GlassmorphicGradientContainer).first;
      expect(glassmorphicContainer, findsOneWidget);
      
      // Verify it has a BackdropFilter
      expect(find.byType(BackdropFilter), findsOneWidget);
    });

    testWidgets('neon container has glow effect', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: example.HomePage()));
      
      // Find the neon container
      final neonContainer = find.byType(NeonGradientContainer).first;
      expect(neonContainer, findsOneWidget);
      
      // Verify it has multiple box shadows for glow effect
      final container = tester.widget<Container>(neonContainer);
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow!.length, greaterThan(1));
    });
  });
}
