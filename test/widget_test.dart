import 'package:coffee_app/config/router/app_router.dart';
import 'package:coffee_app/config/theme/app_theme.dart';
import 'package:coffee_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('MainApp', () {
    testWidgets('MainApp renders MaterialApp.router with correct configuration',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const MainApp());
        await mockNetworkImagesFor(() => tester.pumpWidget(
              const ProviderScope(
                child: MainApp(),
              ),
            ));
      });

      final materialAppFinder = find.byType(MaterialApp);
      expect(materialAppFinder, findsOneWidget);

      final MaterialApp materialApp = tester.widget(materialAppFinder);

      expect(materialApp.routerConfig, appRouter);
      expect(materialApp.debugShowCheckedModeBanner, false);
      expect(materialApp.theme, equals(AppTheme().getTheme()));
      expect(find.byType(MainApp), findsOneWidget);
    });
  });
}
