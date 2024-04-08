import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavoriteButton extends ConsumerWidget {
  final Coffee coffee;
  const FavoriteButton(this.coffee, {super.key});

  showToast(Color style) {
    Fluttertoast.showToast(
      msg: '¡Product added to favorites!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: style,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final style = Theme.of(context).primaryColor;
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.green,
            size: 25,
          ),
          onPressed: () {
            ref.read(currentCoffeeImageProvider.notifier).isLoading = false;
            ref.read(favoriteCoffeesProvider.notifier).toggleFavorite(coffee);
            ref.read(currentCoffeeImageProvider.notifier).loadNextImage();
            showToast(style);
          },
        ),
      ),
    );
  }
}
