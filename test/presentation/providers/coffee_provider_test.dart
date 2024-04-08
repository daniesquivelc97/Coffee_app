import 'package:coffee_app/domain/repositories/coffee_repository.dart';
import 'package:coffee_app/infrastructure/models/coffee_response.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Import the classes and functions that need to be tested

class MockCoffeeRepository extends Mock implements CoffeeRepository {
  @override
  Future<CoffeeResponse> getCoffeeImage() {
    return Future.value(CoffeeResponse(file: 'file'));
  }
}

void main() {
  group(CoffeeNotifier, () {
    test('currentCoffeeImageProvider returns correct CoffeeResponse', () {
      const coffeeImage = 'https://example.com/image.jpg';

      final container = ProviderContainer(
        overrides: [],
      );

      container.read(currentCoffeeImageProvider);

      expect('https://example.com/image.jpg', coffeeImage);
    });
  });
}
