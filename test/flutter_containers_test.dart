import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';

void main() {
  group('Gradient Containers Plus Tests', () {
    testWidgets('renders vertical gradient container', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VerticalGradientContainer(
              height: 150,
              child: const Center(child: Text('Test')),
            ),
          ),
        ),
      );

      expect(find.byType(VerticalGradientContainer), findsOneWidget);
    });

    testWidgets('renders radial gradient container', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RadialGradientContainer(
              height: 150,
              child: const Center(child: Text('Test')),
            ),
          ),
        ),
      );

      expect(find.byType(RadialGradientContainer), findsOneWidget);
    });

    testWidgets('renders sweep gradient container', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SweepGradientContainer(
              height: 150,
              child: const Center(child: Text('Test')),
            ),
          ),
        ),
      );

      expect(find.byType(SweepGradientContainer), findsOneWidget);
    });

    testWidgets('renders animated gradient container', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AnimatedGradientContainer(
              height: 150,
              child: const Center(child: Text('Test')),
            ),
          ),
        ),
      );

      expect(find.byType(AnimatedGradientContainer), findsOneWidget);
      await tester.pump(const Duration(seconds: 2));
    });

    testWidgets('renders glassmorphic gradient container', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GlassmorphicGradientContainer(
              height: 150,
              child: const Center(child: Text('Test')),
            ),
          ),
        ),
      );

      expect(find.byType(GlassmorphicGradientContainer), findsOneWidget);
      expect(find.byType(BackdropFilter), findsOneWidget);
    });

    testWidgets('renders neon gradient container', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NeonGradientContainer(
              height: 150,
              child: const Center(child: Text('Test')),
            ),
          ),
        ),
      );

      expect(find.byType(NeonGradientContainer), findsOneWidget);
      final container = tester.widget<Container>(find.byType(NeonGradientContainer));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.boxShadow!.length, greaterThan(1));
    });
  });
}
