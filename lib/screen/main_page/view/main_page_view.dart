import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:untitled/product/extension/string/string_extension.dart';
import 'package:untitled/product/widget/custom_bottom_nav_bar.dart';
import 'package:untitled/screen/profile/favorite/view/favorite_view.dart';
import 'package:untitled/screen/profile/profile_page/view/profile_View.dart';
import 'package:untitled/screen/profile/shopping_card/view/shopping_card_view.dart';

import '../../../product/utility/page_utility/profile_view_utility.dart';
import '../../home/home_page/view/home_page_view.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> with ProfileViewUtility{
  final PageController _pageController = PageController();

  int _selectedIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: buildBackgroundLinearGradient(),
        ),
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: [
            SalomonBottomBarItem(icon: Icon(BottomNavBarItems.home.getIconData()), title: Text(BottomNavBarItems.home.name.capitalize())),
            SalomonBottomBarItem(icon: Icon(BottomNavBarItems.favorite.getIconData()), title: Text(BottomNavBarItems.favorite.name.capitalize())),
            SalomonBottomBarItem(icon: Icon(BottomNavBarItems.shopping.getIconData()), title: Text(BottomNavBarItems.shopping.name.capitalize())),
            SalomonBottomBarItem(icon: Icon(BottomNavBarItems.profile.getIconData()), title: Text(BottomNavBarItems.profile.name.capitalize())),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const <Widget>[
          HomePageView(),
          FavoriteView(),
          ShoppingCardView(),
          ProfileView(),
        ],
      ),
    );
  }
}
