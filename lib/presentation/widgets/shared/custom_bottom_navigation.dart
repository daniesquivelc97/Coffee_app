import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key, required this.currentIndex});

  final int currentIndex;

  void _onItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (value) => _onItemTap(context, value),
      items: const [
        BottomNavigationBarItem(
          key: Key('Home Icon'),
          icon: Icon(
            Icons.home_max,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            key: Key('Favorites Icon'),
            Icons.favorite_outline,
          ),
          label: 'Favorites',
        ),
      ],
    );
  }
}
