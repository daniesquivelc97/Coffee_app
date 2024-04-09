import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/domain/repositories/local_storage_repository.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalStorageRepository extends Mock
    implements LocalStorageRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('StorageCoffeesNotifier', () {
    late MockLocalStorageRepository mockRepository;
    late StorageCoffeesNotifier notifier;

    setUp(() {
      mockRepository = MockLocalStorageRepository();
      notifier = StorageCoffeesNotifier(localStorageRepository: mockRepository);
    });

    test('loadNextPage increments page and updates state correctly', () async {
      final coffee1 = Coffee(file: 'file1');
      final coffee2 = Coffee(file: 'file2');
      final coffees = [coffee1, coffee2];

      when(() => mockRepository.loadCoffees(offset: 0, limit: 20)).thenAnswer(
        (_) => Future.value(coffees),
      );

      await notifier.loadNextPage();

      expect(notifier.page, 1);
      expect(notifier.state.length, 2);
      expect(notifier.state[coffee1.file], coffee1);
      expect(notifier.state[coffee2.file], coffee2);
    });

    test('toggleFavorite adds/removes coffee from state correctly', () async {
      final coffee = Coffee(file: 'file1');

      when(() => mockRepository.toggleFavorite(coffee))
          .thenAnswer((_) => Future.value());

      await notifier.toggleFavorite(coffee);
      expect(notifier.state.containsKey(coffee.file), true);

      await notifier.toggleFavorite(coffee);
      expect(notifier.state.containsKey(coffee.file), false);
    });

    test('favoriteCoffeesProvider returns correct value', () async {
      final container = ProviderContainer();
      final favoriteCoffees = container.read(favoriteCoffeesProvider);
      expect(favoriteCoffees, {});
    });
  });
}
