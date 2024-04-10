import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:flutter/material.dart';

class CoffeesSlideshow extends StatelessWidget {
  const CoffeesSlideshow({
    super.key,
    required this.coffeeImages,
  });

  final List<Coffee> coffeeImages;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.8,
        autoplay: true,
        itemCount: coffeeImages.length,
        itemBuilder: (context, index) => Slide(coffee: coffeeImages[index]),
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
      ),
    );
  }
}

class Slide extends StatelessWidget {
  final Coffee coffee;
  const Slide({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10),
        ),
      ],
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FutureBuilder<void>(
            future: precacheImage(NetworkImage(coffee.file), context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              } else {
                return FadeIn(
                  child: Image.network(
                    coffee.file,
                    fit: BoxFit.cover,
                    width: 150,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const DecoratedBox(
                          decoration: BoxDecoration(color: Colors.black12),
                        );
                      }
                      return child;
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
