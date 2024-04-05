import 'package:coffee_app/domain/datasources/local_storage_datasource.dart';
import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> dataBase;
  IsarDatasource() {
    dataBase = openDB();
  }

  Future<Isar> openDB() async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CoffeeSchema],
        inspector: true,
        directory: directory.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<Coffee>> loadCoffees({int limit = 10, offset = 0}) async {
    final isar = await dataBase;
    return isar.coffees.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<void> toggleFavorite(Coffee coffee) async {
    final isar = await dataBase;
    final favoriteCoffee =
        await isar.coffees.filter().fileEqualTo(coffee.file).findFirst();
    if (favoriteCoffee != null) {
      // Delete
      isar.writeTxnSync(() => isar.coffees.deleteSync(favoriteCoffee.isarId!));
      return;
    }
    // Insert
    isar.writeTxnSync(() => isar.coffees.putSync(coffee));
  }
}
