import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

class MockGoRouter extends Mock implements GoRouter {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  group('CustomBottomNavigation widget tests', () {
    testWidgets('Widget displays correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CustomBottomNavigation(
            currentIndex: 0,
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Favorites'), findsOneWidget);
    });
  });
}
