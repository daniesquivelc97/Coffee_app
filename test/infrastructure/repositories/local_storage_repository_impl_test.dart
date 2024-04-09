import 'package:coffee_app/domain/datasources/local_storage_datasource.dart';
import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorageDatasource extends Mock
    implements LocalStorageDatasource {}

void main() {
  group('LocalStorageRepositoryImpl', () {
    late LocalStorageRepositoryImpl localStorageRepository;
    late MockLocalStorageDatasource mockDataSource;

    setUp(() {
      mockDataSource = MockLocalStorageDatasource();
      localStorageRepository = LocalStorageRepositoryImpl(mockDataSource);
    });

    test('loadCoffees calls datasource.loadCoffees', () async {
      final List<Coffee> coffees = [
        Coffee(file: 'https://example.com/image.jpg'),
        Coffee(file: 'https://example.com/image2.jpg'),
      ];
      when(() => mockDataSource.loadCoffees(limit: 10, offset: 0))
          .thenAnswer((_) => Future.value(coffees));
      final result =
          await localStorageRepository.loadCoffees(limit: 10, offset: 0);
      expect(result, coffees);
    });

    test('toggleFavorite calls datasource.toggleFavorite', () async {
      final coffee = Coffee(file: 'https://example.com/image.jpg');
      when(() => mockDataSource.toggleFavorite(coffee))
          .thenAnswer((_) => Future.value());
      await localStorageRepository.toggleFavorite(coffee);
    });
  });
}
