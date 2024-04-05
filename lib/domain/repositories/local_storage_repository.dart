import 'package:coffee_app/domain/entities/coffee.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Coffee coffee);
  Future<List<Coffee>> loadCoffees({int limit = 10, offset = 0});
}
