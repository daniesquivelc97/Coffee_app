import 'package:coffee_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    test('getTheme returns ThemeData with correct values', () {
      final appTheme = AppTheme();
      final themeData = appTheme.getTheme();

      expect(themeData.useMaterial3, true);
    });

    test('getTheme returns ThemeData with correct type', () {
      final appTheme = AppTheme();
      final themeData = appTheme.getTheme();

      expect(themeData, isA<ThemeData>());
    });
  });
}
