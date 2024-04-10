import 'package:coffee_app/presentation/screens/screens.dart';
import 'package:coffee_app/presentation/views/views.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('Test HomeScreen widget', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await mockNetworkImagesFor(() => tester.pumpWidget(const ProviderScope(
            child: MaterialApp(
              home: HomeScreen(pageIndex: 0),
            ),
          )));
      expect(find.byType(HomeScreen), findsOneWidget);

      expect(find.byType(Scaffold), findsOneWidget);

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.byType(FavoritesView), findsNothing);

      expect(find.byType(CustomBottomNavigation), findsOneWidget);
      expect(
          tester
              .widget<CustomBottomNavigation>(
                  find.byType(CustomBottomNavigation))
              .currentIndex,
          0);
    });
  });
}
