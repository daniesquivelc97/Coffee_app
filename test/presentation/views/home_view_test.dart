import 'package:coffee_app/presentation/views/views.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('HomeView Widget', () {
    testWidgets('Initial state - loading indicator displayed',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            const ProviderScope(
              child: MaterialApp(
                home: HomeView(),
              ),
            ),
          ),
        );
      });

      expect(find.byType(CircularProgressIndicator), findsNWidgets(4));
    });

    testWidgets('Loading state - slideshow and coffee card hidden',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () => tester.pumpWidget(
            const ProviderScope(
              child: MaterialApp(
                home: HomeView(),
              ),
            ),
          ),
        );
      });

      expect(find.byType(CoffeesSlideshow), findsOneWidget);
      expect(find.byType(CoffeeCard), findsNothing);
    });
  });
}
