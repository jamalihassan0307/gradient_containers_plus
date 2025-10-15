import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gradient_containers_plus/gradient_containers_plus.dart';
import 'package:gradient_containers_plus/gradient_containers_plus/containers/vertical_gradient_container.dart';

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
      final container = tester.widget<VerticalGradientContainer>(find.byType(VerticalGradientContainer));
      final boxShadow = container.buildDecoration(tester.element(find.byType(VerticalGradientContainer))).boxShadow;
      expect(boxShadow != null, true);
      expect(boxShadow!.isNotEmpty, true);
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
      final container = tester.widget<RadialGradientContainer>(find.byType(RadialGradientContainer));
      final boxShadow = container.buildDecoration(tester.element(find.byType(RadialGradientContainer))).boxShadow;
      expect(boxShadow != null, true);
      expect(boxShadow!.isNotEmpty, true);
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
      final container = tester.widget<SweepGradientContainer>(find.byType(SweepGradientContainer));
      final boxShadow = container.buildDecoration(tester.element(find.byType(SweepGradientContainer))).boxShadow;
      expect(boxShadow != null, true);
      expect(boxShadow!.isNotEmpty, true);
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
      final container = tester.widget<GlassmorphicGradientContainer>(find.byType(GlassmorphicGradientContainer));
      final boxShadow = container.buildDecoration(tester.element(find.byType(GlassmorphicGradientContainer))).boxShadow;
      expect(boxShadow != null, true);
      expect(boxShadow!.isNotEmpty, true);
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
      final container = tester.widget<NeonGradientContainer>(find.byType(NeonGradientContainer));
      final decoration = container.buildDecoration(tester.element(find.byType(NeonGradientContainer)));
      expect(decoration.boxShadow != null, true);
      expect(decoration.boxShadow!.length > 1, true);
    });
  });
}
