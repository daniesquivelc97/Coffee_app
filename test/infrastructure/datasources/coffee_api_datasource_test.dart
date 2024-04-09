import 'package:coffee_app/infrastructure/datasources/coffee_api_datasource.dart';
import 'package:coffee_app/infrastructure/models/coffee_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('CoffeeApiDatasource', () {
    late CoffeeApiDatasource coffeeApiDatasource;
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
      coffeeApiDatasource = CoffeeApiDatasource();
      coffeeApiDatasource.dio = mockDio;
    });

    test('getCoffeeImage should return CoffeeResponse', () async {
      final responseData = {'file': 'https://example.com/image.jpg'};
      final coffeeResponse = CoffeeResponse.fromJson(responseData);

      when(() => mockDio.get('/random.json')).thenAnswer(
        (_) => Future.value(
          Response(
            data: responseData,
            requestOptions: RequestOptions(),
          ),
        ),
      );
      final result = await coffeeApiDatasource.getCoffeeImage();
      expect(result.file, coffeeResponse.file);
    });
  });
}
