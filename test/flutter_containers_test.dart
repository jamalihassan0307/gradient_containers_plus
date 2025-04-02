import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gradient_containers/flutter_containers.dart';

void main() {
  group('GradientContainers Widget Tests', () {
    testWidgets('renders all gradient containers', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: GradientContainers()));

      // Verify that all four containers are rendered
      expect(find.byType(Container), findsNWidgets(8)); // 4 main containers + 4 pattern containers
      
      // Verify text labels
      expect(find.text('Vertical Gradient'), findsOneWidget);
      expect(find.text('Radial Gradient'), findsOneWidget);
      expect(find.text('Sweep Gradient'), findsOneWidget);
      expect(find.text('Animated Gradient'), findsOneWidget);
    });

    testWidgets('containers have correct decoration properties', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: GradientContainers()));

      // Find all containers with gradient decorations
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
  });

  group('PatternDecoration Tests', () {
    test('creates correct pattern painter', () {
      final decoration = PatternDecoration(
        pattern: PatternDecorationPattern.dots,
        color: Colors.white,
      );
      
      final painter = decoration.createBoxPainter();
      expect(painter, isA<_PatternDecorationPainter>());
    });
  });
}
