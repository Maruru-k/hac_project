import 'package:flutter/material.dart';

class TDPNavigationBar extends StatelessWidget {
  final List<Widget> pages;
  final int currentPageIndex;
  final ValueChanged<int> onChange;

  const TDPNavigationBar({
    super.key,
    required this.pages,
    required this.currentPageIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onChange,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
