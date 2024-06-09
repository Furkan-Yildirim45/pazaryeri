import 'package:Pazaryeri/product/utility/project_utility/image_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../product/utility/page_utility/basic/welcome_utility.dart';
import '../../../../product/utility/page_utility/product/product_detail_utility.dart';
import '../../../../product/utility/page_utility/profile/profile_view_utility.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with WelcomeUtility, ProductDetailUtility, ProfileViewUtility {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: buildBackgroundLinearGradient(),
        ),
        child: ListView(
          children: [
            Container(
              width: context.width,
              height: context.height * 0.12,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    ImageUtility.getImagePath("profile_app_bar"),
                  ),
                  fit: BoxFit.fitWidth,
                ),
                gradient: buildBackgroundLinearGradient(),
              ),
            ),
            buildGeneralProfileContainer(context)
          ],
        ),
      ),
    );
  }
}
