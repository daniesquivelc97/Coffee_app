import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Images Url', () {
    test('imageUrl list has correct length', () {
      expect(imageUrl.length, 5);
    });

    test('imageUrl list contains valid URLs', () {
      for (final url in imageUrl) {
        expect(Uri.parse(url).isAbsolute, true);
      }
    });
  });
}
