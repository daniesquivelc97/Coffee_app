import 'package:coffee_app/infrastructure/models/coffee_response.dart';

abstract class CoffeesDatasource {
  Future<CoffeeResponse> getCoffeeImage();
}
