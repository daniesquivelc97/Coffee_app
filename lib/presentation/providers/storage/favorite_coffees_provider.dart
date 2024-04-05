import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/domain/repositories/local_storage_repository.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteCoffeesProvider =
    StateNotifierProvider<StorageCoffeesNotifier, Map<String, Coffee>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageCoffeesNotifier(localStorageRepository: localStorageRepository);
});

class StorageCoffeesNotifier extends StateNotifier<Map<String, Coffee>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageCoffeesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Coffee>> loadNextPage() async {
    final coffees =
        await localStorageRepository.loadCoffees(offset: page * 10, limit: 20);
    page++;

    final tempCoffeesMap = <String, Coffee>{};
    for (final coffee in coffees) {
      tempCoffeesMap[coffee.file] = coffee;
    }
    state = {...state, ...tempCoffeesMap};
    return coffees;
  }

  Future<void> toggleFavorite(Coffee coffee) async {
    await localStorageRepository.toggleFavorite(coffee);
    final bool isCoffeeInFavorites = state[coffee.file] != null;

    if (isCoffeeInFavorites) {
      state.remove(coffee.file);
      state = {...state};
    } else {
      state = {...state, coffee.file: coffee};
    }
  }
}
