import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:untitled/product/extension/string/string_extension.dart';
import 'package:untitled/product/utility/product_detail_utility.dart';
import 'package:untitled/product/utility/profile_view_utility.dart';
import 'package:untitled/product/utility/welcome_utility.dart';

class ProfileView extends StatefulWidget{
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with WelcomeUtility, ProductDetailUtility ,ProfileViewUtility{
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: _buildBackgroundLinearGradient(),
        ),
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              customPositionedMarketPlaceTitle(context, marketPlaceTitle: marketPlaceTitle(context,textColor: Colors.white)),
              buildGeneralProfileContainer(context, pageDivider: pageDivider(context,padding: EdgeInsets.zero))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: _buildBackgroundLinearGradient(),
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
      ),
    );
  }
  LinearGradient _buildBackgroundLinearGradient() {
    return const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFDAC6B5),
            Color(0xFFb59376),
          ],
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