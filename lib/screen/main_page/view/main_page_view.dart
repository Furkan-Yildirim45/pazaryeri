import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/utility/page_utility/main_page_utility.dart';
import 'package:untitled/product/widget/custom_bottom_nav_bar.dart';
import 'package:untitled/product/widget/general_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with MainPageUtility{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor(),),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: context.padding.onlyTopNormal,
          child: SingleChildScrollView(
            child: Padding(
              padding: context.padding.horizontalNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildSearchBar(context),
                  buildBlackFridaySlider(context),
                  buildGridViewSpecialSuggestion(context),
                  buildInfluencerSuggestionLvb(context),
                  buildBigSaleContainer(context),
                  popularProductGirdView(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
