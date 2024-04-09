import 'package:coffee_app/domain/repositories/coffee_repository.dart';
import 'package:coffee_app/infrastructure/models/coffee_response.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCoffeeRepository extends Mock implements CoffeeRepository {}

void main() {
  group(CoffeeNotifier, () {
    late MockCoffeeRepository mockRepository;

    setUp(() {
      mockRepository = MockCoffeeRepository();
    });
    test('currentCoffeeImageProvider returns correct CoffeeResponse', () {
      const coffeeImage = 'https://example.com/image.jpg';

      final container = ProviderContainer(
        overrides: [],
      );

      container.read(currentCoffeeImageProvider);

      expect('https://example.com/image.jpg', coffeeImage);
    });

    test('loadNextImage sets state and isLoading correctly', () async {
      final notifier = CoffeeNotifier(imageUrl: mockRepository.getCoffeeImage);
      final coffeeResponse =
          CoffeeResponse(file: 'https://example.com/image.jpg');
      when(() => mockRepository.getCoffeeImage())
          .thenAnswer((_) => Future.value(coffeeResponse));
      await notifier.loadNextImage();

      expect(notifier.isLoading, false);
      expect(notifier.state, coffeeResponse);
    });
  });
}
