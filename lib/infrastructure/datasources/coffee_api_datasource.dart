import 'package:coffee_app/infrastructure/models/coffee_response.dart';
import 'package:dio/dio.dart';

import '../../domain/datasources/coffees_datasource.dart';

class CoffeeApiDatasource extends CoffeesDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://coffee.alexflipnote.dev'),
  );
  @override
  Future<CoffeeResponse> getCoffeeImage() async {
    final response = await dio.get('/random.json');
    return CoffeeResponse.fromJson(response.data);
  }
}
