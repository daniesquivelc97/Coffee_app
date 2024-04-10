import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('CoffeesSlideshow widget', () {
    testWidgets('CoffeesSlideshow with images', (WidgetTester tester) async {
      final List<Coffee> coffeeImages = [
        Coffee(file: imageUrl[0].file),
        Coffee(file: imageUrl[1].file),
        Coffee(file: imageUrl[2].file),
      ];

      await mockNetworkImagesFor(() => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: CoffeesSlideshow(coffeeImages: coffeeImages),
              ),
            ),
          ));

      expect(find.byType(Slide), findsNWidgets(3));
    });
  });
}
