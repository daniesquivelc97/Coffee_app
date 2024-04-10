import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(currentCoffeeImageProvider.notifier).loadNextImage();
  }

  @override
  Widget build(BuildContext context) {
    final currentImage = ref.watch(currentCoffeeImageProvider);
    final isLoading = ref.watch(currentCoffeeImageProvider.notifier).isLoading;
    final List<Coffee> coffeeImages = imageUrl;
    final dateTime = DateTime.now();
    final currentDate = DateFormat('EEEE dd').format(dateTime);
    return Column(
      children: [
        const CustomAppBar(),
        CoffeesSlideshow(
          coffeeImages: coffeeImages,
        ),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : CoffeeCard(
                  coffee: Coffee(file: currentImage.file),
                  title: 'Our Products',
                  subtitle: currentDate,
                ),
        ),
      ],
    );
  }
}
