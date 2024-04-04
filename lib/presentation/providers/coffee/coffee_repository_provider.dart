import 'package:coffee_app/infrastructure/coffee_api_datasource.dart';
import 'package:coffee_app/infrastructure/repositories/coffee_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coffeeRepositoryProvider = Provider((ref) {
  return CoffeeRepositoryImpl(CoffeeApiDatasource());
});
