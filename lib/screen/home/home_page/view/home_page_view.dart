import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/utility/page_utility/main_page_utility.dart';
import 'package:untitled/product/widget/general_app_bar.dart';
import 'package:untitled/product/widget/general_search_bar.dart';

import '../../../../product/color/project_color.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with HomePageViewUtility{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),),
      body: SafeArea(
        child: Padding(
          padding: context.padding.onlyTopNormal,
          child: SingleChildScrollView(
            child: Padding(
              padding: context.padding.horizontalNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
        ),
      ),
    );
  }
}