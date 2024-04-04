import 'package:coffee_app/infrastructure/models/coffee_response.dart';

abstract class CoffeeRepository {
  Future<CoffeeResponse> getCoffeeImage();
}
