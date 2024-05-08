import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:untitled/product/extension/string/string_extension.dart';
import 'package:untitled/product/utility/page_utility/product_detail_utility.dart';
import 'package:untitled/product/utility/page_utility/profile_view_utility.dart';
import 'package:untitled/product/utility/page_utility/welcome_utility.dart';
import 'package:untitled/product/widget/custom_bottom_nav_bar.dart';

class ProfileView extends StatefulWidget{
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> with WelcomeUtility, ProductDetailUtility ,ProfileViewUtility{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: buildBackgroundLinearGradient(),
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
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

}
