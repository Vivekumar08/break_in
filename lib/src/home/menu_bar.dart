import 'package:break_in/src/utils/symbols.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuBar extends StatelessWidget {
  final Widget child;

  const MenuBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Symbols.grid,
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Symbols.home,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Symbols.rate,
            label: 'Rate',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/recents')) {
      return 1;
    } else if (location.startsWith('/search')) {
      return 2;
    } else {
      return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 1:
        GoRouter.of(context).go('/recents');
        break;
      case 2:
        GoRouter.of(context).go('/search');
        break;
      case 0:
      default:
        GoRouter.of(context).go('/library');
        break;
    }
  }
}
