import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../router/constants.dart';
import '../utils/symbols.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      useLegacyColorScheme: false,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Symbols.grid,
            label: 'Categories',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
          icon: Symbols.home,
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Symbols.rate,
          label: 'Ratings',
        ),
      ],
      currentIndex: _calculateSelectedIndex(context),
      onTap: (int idx) => _onItemTapped(idx, context),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location == home) {
      return 1;
    } else if (location == categories) {
      return 2;
    } else {
      return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 1:
        GoRouter.of(context).go(home);
        break;
      // TODO: Define root for ratings
      case 2:
        GoRouter.of(context).go('/search');
        break;
      case 0:
        GoRouter.of(context).go(categories);
        break;
      default:
        GoRouter.of(context).go(home);
        break;
    }
  }
}
