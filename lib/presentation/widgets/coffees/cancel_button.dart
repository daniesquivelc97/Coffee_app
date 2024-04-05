import 'package:coffee_app/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CancelButton extends ConsumerWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
            Icons.cancel_rounded,
            color: Colors.red,
            size: 25,
          ),
          onPressed: () {
            ref.read(currentCoffeeImageProvider.notifier).isLoading = false;
            ref.read(currentCoffeeImageProvider.notifier).loadNextImage();
          },
        ),
      ),
    );
  }
}
