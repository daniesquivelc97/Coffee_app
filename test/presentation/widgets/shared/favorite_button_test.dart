import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mockito/mockito.dart';

class MockFlutterToast extends Mock implements Fluttertoast {}

void main() {
  group('FavoriteButton', () {
    testWidgets('FavoriteButton widget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: Consumer(builder: (context, ref, _) {
                ref.watch(currentCoffeeImageProvider);
                return FavoriteButton(Coffee(file: 'https://example.com'));
              }),
            ),
          ),
        ),
      );
      final iconFinder = find.byIcon(Icons.favorite);
      expect(iconFinder, findsOneWidget);
    });

    testWidgets('showToast method test', (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: FavoriteButton(Coffee(file: 'file'))));
      expect(find.text('¡Product added to favorites!'), findsNothing);
    });
  });
}
