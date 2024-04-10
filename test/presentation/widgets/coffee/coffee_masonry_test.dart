import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('CoffeeMasonry Widget', () {
    testWidgets('CoffeeMasonry with images', (WidgetTester tester) async {
      // Mock data
      final List<Coffee> coffees = [
        Coffee(file: imageUrl[0]),
        Coffee(file: imageUrl[1]),
        Coffee(file: imageUrl[2]),
      ];

      await mockNetworkImagesFor(() => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: CoffeeMasonry(coffees: coffees),
              ),
            ),
          ));

      expect(find.byType(CircularProgressIndicator), findsWidgets);
    });

    testWidgets('CoffeeMasonry with empty list', (WidgetTester tester) async {
      final List<Coffee> coffees = [];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CoffeeMasonry(coffees: coffees),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(Image), findsNothing);
    });
  });
}
