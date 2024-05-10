import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/widget/general_app_bar.dart';
import 'package:untitled/product/widget/general_search_bar.dart';

import '../../../../product/color/project_color.dart';
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
              const GeneralSearchBar(),
              buildBlackFridaySlider(context),
              buildGridViewSpecialSuggestion(context),
              buildInfluencerSuggestionLvb(context),
              buildBigSaleContainer(context),
              popularProductGirdView(context),
            ],
          ),
        ),
      ),
    );
  }
}