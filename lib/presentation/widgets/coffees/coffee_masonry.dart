import 'package:animate_do/animate_do.dart';
import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CoffeeMasonry extends StatefulWidget {
  final List<Coffee> coffees;
  final VoidCallback? loadNextPage;

  const CoffeeMasonry({
    super.key,
    required this.coffees,
    this.loadNextPage,
  });

  @override
  State<CoffeeMasonry> createState() => _CoffeeMasonryState();
}

class _CoffeeMasonryState extends State<CoffeeMasonry> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 100 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        itemCount: widget.coffees.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:
                      FadeIn(child: Image.network(widget.coffees[index].file)),
                )
              ],
            );
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeIn(child: Image.network(widget.coffees[index].file)),
          );
        },
      ),
    );
  }
}
