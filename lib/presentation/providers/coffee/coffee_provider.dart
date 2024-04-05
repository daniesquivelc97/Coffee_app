import 'package:coffee_app/infrastructure/models/coffee_response.dart';
import 'package:coffee_app/presentation/providers/coffee/coffee_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentCoffeeImageProvider =
    StateNotifierProvider<CoffeeNotifier, CoffeeResponse>((ref) {
  final coffeeImage = ref.watch(coffeeRepositoryProvider).getCoffeeImage;
  return CoffeeNotifier(imageUrl: coffeeImage);
});

typedef CoffeeCallBack = Future<CoffeeResponse> Function();

class CoffeeNotifier extends StateNotifier<CoffeeResponse> {
  CoffeeCallBack imageUrl;
  bool isLoading = false;

  CoffeeNotifier({required this.imageUrl}) : super(CoffeeResponse(file: ''));

  Future<void> loadNextImage() async {
    if (isLoading) return;
    isLoading = true;
    print('Is loading $isLoading');
    final CoffeeResponse coffee = await imageUrl();
    state = coffee;
    isLoading = false;
  }
}
