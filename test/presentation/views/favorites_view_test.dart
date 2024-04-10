import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:coffee_app/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavoriteCoffeesNotifier extends Mock
    implements StorageCoffeesNotifier {}

void main() {
  group('FavoritesView widget', () {
    testWidgets('FavoritesView - Empty state', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          overrides: [],
          child: MaterialApp(
            home: FavoritesView(),
          ),
        ),
      );

      expect(find.text('¡Sorry!'), findsOneWidget);
      expect(find.text('You do not have favorite products'), findsOneWidget);
      expect(find.byIcon(Icons.favorite_outline_sharp), findsOneWidget);

      expect(find.text('Add some product to your favorites'), findsOneWidget);
    });
  });
}
