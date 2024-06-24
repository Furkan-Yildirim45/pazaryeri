import 'package:Pazaryeri/product/controller/global_controller.dart';
import 'package:Pazaryeri/product/controller/search_bar_page_controller.dart';
import 'package:Pazaryeri/screen/home/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/utility/page_utility/profile/profile_view_utility.dart';
import '../../../product/widget/custom_bottom_nav_bar.dart';
import '../../home/home_page/view/home_page_view.dart';
import '../../profile/favorite/view/favorite_view.dart';
import '../../profile/profile_page/view/profile_View.dart';
import '../../profile/shopping_card/view/shopping_card_view.dart';
import '../controller/main_page_controller.dart';

class MainPageView extends StatelessWidget with ProfileViewUtility {
  MainPageView({super.key});
  final MainPageController controller = Get.put(MainPageController());
  final GlobalController globalController = Get.put(GlobalController());
  final SearchBarPageController searchBarPageController = Get.put(SearchBarPageController());
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: buildBackgroundLinearGradient(),
        ),
        child: CustomBottomNavBar(controller: controller),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.getPageController,
        onPageChanged: controller.onPageChanged,
        children: <Widget>[
          const HomePageView(),
          FavoriteView(),
          ShoppingCardView(),
          const ProfileView(),
        ],
      ),
    );
  }
}
