import 'package:Pazaryeri/product/controller/search_bar_page_controller.dart';
import 'package:Pazaryeri/screen/home/search/view/search_view.dart';
import 'package:Pazaryeri/screen/home/search_result/view/search_result_view.dart';
import 'package:Pazaryeri/screen/unknown_page/view/unknown_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget selectAndShowPage(
    {required BuildContext context,
    required String pageName,
    required Widget currentPageWidget}) {
  final currentPageValue =
      Get.find<SearchBarPageController>().currentPage.value;
  print("currentPageValue :$currentPageValue");
  final result;
  if (currentPageValue == pageName) {
    result = currentPageWidget;
  } else if (currentPageValue == SearchBarLocalPage.search.name) {
    result = SearchView();
  } else if (currentPageValue ==
      SearchBarLocalPage.searchResultForCouple.name) {
    result = const SearchResultView();
  } else {
    result = const UnknownView();
  }
  return result;
}
