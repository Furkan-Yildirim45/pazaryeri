import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/widget/general_search_bar.dart';
import 'package:untitled/screen/home/search/view/search_view.dart';
import 'package:untitled/screen/home/search_result/view/search_result_view.dart';
import 'package:untitled/screen/unknown_page/view/unknown_view.dart';

import '../../../../product/controller/general_page_controller.dart';
import '../../../../product/utility/page_utility/home_page_utility.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with HomePageViewUtility{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: ListView(
            children: [
              GeneralSearchBar(),
              Obx(() {
                switch (generalPageController.currentPage.value) {
                  case PageType.home:
                    return _buildHomePageContent(context);
                  case PageType.search:
                    return SearchView();
                  case PageType.searchResult:
                    return const SearchResultView();
                  default:
                    return const UnknownView();
                }
              },)
            ],
          ),
        ),
      ),
    );
  }

  Column _buildHomePageContent(BuildContext context) {
    return Column(
      children: [
        buildBlackFridaySlider(context),
        buildGridViewSpecialSuggestion(context),
        buildInfluencerSuggestionLvb(context),
        buildBigSaleContainer(context),
        popularProductGirdView(context),
      ],
    );
  }
}