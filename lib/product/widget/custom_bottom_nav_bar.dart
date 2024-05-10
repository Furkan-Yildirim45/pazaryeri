
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:untitled/screen/main_page/controller/main_page_controller.dart';

import '../utility/page_utility/profile_view_utility.dart';

class CustomBottomNavBar extends StatelessWidget with ProfileViewUtility{
  const CustomBottomNavBar({super.key, required this.controller});

  final MainPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          gradient: buildBackgroundLinearGradient(),
        ),
        child: SalomonBottomBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.onItemTapped(index,context),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            SalomonBottomBarItem(icon: Icon(BottomNavBarItems.home.getIconData()), title: Text(BottomNavBarItems.home.name.capitalizeFirst ?? "")),
            SalomonBottomBarItem(icon: Icon(BottomNavBarItems.favorite.getIconData()), title: Text(BottomNavBarItems.favorite.name.capitalizeFirst ?? "")),
            SalomonBottomBarItem(icon: Icon(BottomNavBarItems.shopping.getIconData()), title: Text(BottomNavBarItems.shopping.name.capitalizeFirst ?? "")),
            SalomonBottomBarItem(icon: Icon(BottomNavBarItems.profile.getIconData()), title: Text(BottomNavBarItems.profile.name.capitalizeFirst ?? "")),
          ],
        ),
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