import 'package:coffee_app/domain/datasources/coffees_datasource.dart';
import 'package:coffee_app/domain/repositories/coffee_repository.dart';
import 'package:coffee_app/infrastructure/models/coffee_response.dart';

class CoffeeRepositoryImpl extends CoffeeRepository {
  final CoffeesDatasource datasource;

  CoffeeRepositoryImpl(this.datasource);

  @override
  Future<CoffeeResponse> getCoffeeImage() {
    return datasource.getCoffeeImage();
  }
}
