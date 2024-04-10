import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/presentation/providers/images_url.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('CoffeeCard Widget', () {
    testWidgets('CoffeeCard with title and subtitle',
        (WidgetTester tester) async {
      final coffee = Coffee(file: imageUrl[0].file);
      await mockNetworkImagesFor(() => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CoffeeCard(
                    coffee: coffee,
                    title: 'Title',
                    subtitle: 'Subtitle',
                  ),
                ),
              ),
            ),
          ));

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
    });

    testWidgets('CoffeeCard without title and subtitle',
        (WidgetTester tester) async {
      final coffee = Coffee(file: imageUrl[0].file);
      await mockNetworkImagesFor(() => tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CoffeeCard(
                    coffee: coffee,
                  ),
                ),
              ),
            ),
          ));

      expect(find.text('Title'), findsNothing);
      expect(find.text('Subtitle'), findsNothing);
    });
  });
}
