import 'package:coffee_app/infrastructure/models/coffee_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Coffee Response', () {
    test('Create Coffee Response object', () {
      final coffee = CoffeeResponse(file: 'coffee.jpg');

      expect(coffee.file, 'coffee.jpg');
    });

    test(
        'coffeeResponseFromJson should convert valid JSON string to CoffeeResponse object',
        () {
      String jsonString = '{"file": "https://example.com/image.jpg"}';

      CoffeeResponse coffeeResponse = coffeeResponseFromJson(jsonString);

      expect(coffeeResponse.file, 'https://example.com/image.jpg');
    });

    test('Should encode CoffeeResponse to JSON', () {
      CoffeeResponse coffeeResponse =
          CoffeeResponse(file: 'https://example.com/image.jpg');
      String jsonResult = coffeeResponseToJson(coffeeResponse);
      expect(jsonResult, '{"file":"https://example.com/image.jpg"}');
    });
  });
}
