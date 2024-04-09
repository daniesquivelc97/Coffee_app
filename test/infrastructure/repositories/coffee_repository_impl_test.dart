import 'package:coffee_app/domain/datasources/coffees_datasource.dart';
import 'package:coffee_app/infrastructure/models/coffee_response.dart';
import 'package:coffee_app/infrastructure/repositories/coffee_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCoffeesDatasource extends Mock implements CoffeesDatasource {}

void main() {
  group('CoffeeRepositoryImpl', () {
    late CoffeeRepositoryImpl coffeeRepository;
    late MockCoffeesDatasource mockDataSource;

    setUp(() {
      mockDataSource = MockCoffeesDatasource();
      coffeeRepository = CoffeeRepositoryImpl(mockDataSource);
    });

    test('getCoffeeImage calls datasource.getCoffeeImage', () async {
      final coffeeResponse =
          CoffeeResponse(file: 'https://example.com/image.jpg');
      when(() => mockDataSource.getCoffeeImage())
          .thenAnswer((_) => Future.value(coffeeResponse));
      final result = await coffeeRepository.getCoffeeImage();
      expect(result.file, coffeeResponse.file);
    });
  });
}
