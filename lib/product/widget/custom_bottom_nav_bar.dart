
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:untitled/product/extension/string/string_extension.dart';

import '../utility/profile_view_utility.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with ProfileViewUtility{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: buildBackgroundLinearGradient(),
      ),
      child: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: [
          SalomonBottomBarItem(icon: Icon(BottomNavBarItems.home.getIconData()), title: Text(BottomNavBarItems.home.name.capitalize())),
          SalomonBottomBarItem(icon: Icon(BottomNavBarItems.favorite.getIconData()), title: Text(BottomNavBarItems.favorite.name.capitalize())),
          SalomonBottomBarItem(icon: Icon(BottomNavBarItems.shopping.getIconData()), title: Text(BottomNavBarItems.shopping.name.capitalize())),
          SalomonBottomBarItem(icon: Icon(BottomNavBarItems.profile.getIconData()), title: Text(BottomNavBarItems.profile.name.capitalize())),
        ],
      ),
    );
  }
}

enum BottomNavBarItems{
  home,favorite,shopping,profile
}

extension BottomNavBarItemsExtension on BottomNavBarItems {
  IconData getIconData() => {
    BottomNavBarItems.home: Icons.home_outlined,
    BottomNavBarItems.favorite: Icons.favorite_border_outlined,
    BottomNavBarItems.shopping: Icons.shopping_basket_outlined,
    BottomNavBarItems.profile: Icons.person_outline,
  }[this]!;
}