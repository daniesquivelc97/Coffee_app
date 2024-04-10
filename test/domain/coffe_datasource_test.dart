import 'package:coffee_app/domain/datasources/coffees_datasource.dart';
import 'package:coffee_app/infrastructure/models/coffee_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCoffeesDatasource extends Mock implements CoffeesDatasource {
  @override
  Future<CoffeeResponse> getCoffeeImage() async {
    return CoffeeResponse(file: 'https://example.com/image.jpg');
  }
}

void main() {
  group('CoffeesDatasource', () {
    test('getCoffeeImage returns a CoffeeResponse', () async {
      final mockDatasource = MockCoffeesDatasource();
      final coffeeResponse =
          CoffeeResponse(file: 'https://example.com/image.jpg');

      await mockDatasource.getCoffeeImage();

      final result = await mockDatasource.getCoffeeImage();

      expect(result.file, equals(coffeeResponse.file));
    });
  });
}
