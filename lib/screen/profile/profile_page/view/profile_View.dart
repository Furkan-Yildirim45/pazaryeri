import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/utility/page_utility/product_detail_utility.dart';
import 'package:untitled/product/utility/page_utility/profile/profile_view_utility.dart';
import 'package:untitled/product/utility/page_utility/basic/welcome_utility.dart';

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
              buildGeneralProfileContainer(context)
            ],
          ),
        ),
      ),
    );
  }
}
