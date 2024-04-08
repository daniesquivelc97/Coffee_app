import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CancelButton widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: Consumer(builder: (context, ref, _) {
              ref.watch(currentCoffeeImageProvider);
              return const CancelButton();
            }),
          ),
        ),
      ),
    );
    final iconFinder = find.byIcon(Icons.cancel_rounded);
    expect(iconFinder, findsOneWidget);
  });
}
