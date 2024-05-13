import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/widget/general_search_bar.dart';

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
              Obx(() {return selectAndShowPage(context);})
            ],
          ),
        ),
      ),
    );
  }
}