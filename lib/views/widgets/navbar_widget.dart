import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: <NavigationDestination>[
            NavigationDestination(
              icon: Icon(selectedPage == 0 ? Icons.home : Icons.home_outlined),
              label: ' ',
              tooltip: 'Home',
            ),
            NavigationDestination(
              icon: Icon(selectedPage == 1 ? Icons.chat_bubble : Icons.chat_bubble_outline),
              label: ' ',
              tooltip: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(selectedPage == 2 ? Icons.person : Icons.person_outline),
              label: ' ',
              tooltip: 'Profile',
            ),
          ],
          selectedIndex: selectedPage,
          onDestinationSelected: (int index) {
            selectedPageNotifier.value = index;
          },
        );
      },
    );
  }
}