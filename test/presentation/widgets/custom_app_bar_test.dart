import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomAppBar widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(),
        ),
      ),
    );
    final iconFinder = find.byIcon(Icons.coffee_outlined);
    final textFinder = find.text('Coffee Bucks');
    final iconButtonFinder = find.byIcon(Icons.exit_to_app_outlined);

    await tester.tap(find.byIcon(Icons.exit_to_app_outlined));
    await tester.pump();

    expect(iconFinder, findsOneWidget);
    expect(textFinder, findsOneWidget);
    expect(iconButtonFinder, findsOneWidget);
  });
}
