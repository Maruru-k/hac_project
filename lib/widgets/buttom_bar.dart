import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:hac_project/theme/tdp_colors.dart';

class TdpNavigationBar extends StatelessWidget {
  final List<Widget> pages;
  final int currentPageIndex;
  final ValueChanged<int> onChange;

  const TdpNavigationBar({
    super.key,
    required this.pages,
    required this.currentPageIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: TdpColors.lightBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: NavigationBar(
          onDestinationSelected: onChange,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            const NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Главная',
            ),
            const NavigationDestination(
              icon: Icon(Icons.message_outlined),
              label: 'Обращения',
            ),
            NavigationDestination(
              icon: Transform.scale(
                scaleX: -1,
                child: const Icon(Icons.restore_outlined),
              ),
              label: 'Платежи',
            ),
            const NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Профиль',
            ),
          ],
        ),
      ),
      body: pages[currentPageIndex],
    );
  }
}
