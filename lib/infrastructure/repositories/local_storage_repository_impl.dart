import 'package:coffee_app/domain/datasources/local_storage_datasource.dart';
import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<List<Coffee>> loadCoffees({int limit = 10, offset = 0}) {
    return datasource.loadCoffees(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Coffee coffee) {
    return datasource.toggleFavorite(coffee);
  }
}
