import 'package:Pazaryeri/product/color/project_color.dart';
import 'package:Pazaryeri/product/controller/search_bar_page_controller.dart';
import 'package:Pazaryeri/product/utility/project_utility/background_image_utility.dart';
import 'package:Pazaryeri/product/widget/main_page_app_bar.dart';
import 'package:Pazaryeri/product/widget/select_and_show_page.dart';
import 'package:Pazaryeri/screen/home/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/utility/page_utility/home_page_utility.dart';
import '../../../../product/widget/general_search_bar.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with HomePageViewUtility,BackgroundImageUtility{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            backgroundImageUtility(context, child: const SizedBox.shrink()),
            ListView(
              children: [
                MainPageAppBar(textColor: ProjectColor.apricot.getColor()),
                Padding(
                  padding: context.padding.horizontalNormal,
                  child: Column(
                    children: [
                      GeneralSearchBar(searchBarPageItems: SearchBarPageItems.home, searchBarProductItems: Get.find<HomePageController>().popularProductItems,),
                      Obx(() => selectAndShowPage(context: context,pageName: getPageNameItem,currentPageWidget: ({data}) => buildHomePageContent(context),),)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
    );
  }
}