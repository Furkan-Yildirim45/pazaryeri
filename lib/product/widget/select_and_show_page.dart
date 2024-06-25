import 'package:Pazaryeri/product/controller/search_bar_page_controller.dart';
import 'package:Pazaryeri/screen/home/search/view/search_view.dart';
import 'package:Pazaryeri/screen/home/search_result/view/search_result_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

Widget selectAndShowPage({
  required BuildContext context,
  required String pageName,
  required Widget Function({dynamic data}) currentPageWidget,
  dynamic data,
}) {
  final currentPageValue = Get.find<SearchBarPageController>().currentPage.value;
  print("currentPageValue :$currentPageValue");

  Widget result;

  if (currentPageValue == pageName) {
    result = currentPageWidget();
  } else if (currentPageValue == SearchBarLocalPage.search.name) {
    result = SearchView();
  } else if (currentPageValue == SearchBarLocalPage.searchResultForCouple.name && pageName == SearchBarPageItems.home.name) {
    result = SearchResultView(
      productItems: Get.find<SearchBarPageController>().items,
    );
  } else if (currentPageValue == SearchBarLocalPage.searchResultForLonely.name && pageName != SearchBarPageItems.home.name) {
    result = currentPageWidget(data: Get.find<SearchBarPageController>().items);
    Get.find<SearchBarPageController>().currentPage.value = pageName;
  } else {
    result = _buildHasNotPage(context);
  }

  return result;
}

//ben burda ne yapmalıyım?
///burda home ile diğer sayfaların ayrı tutmalıyım bunu nasıl yaparım su sekilde
///search olucak okey,asıl sayfa olucak okey,burda currentPageValue lonely olup home ye eşit olmazsa resultu currentPageWidgeta atamalıyım 
///ve gerekli searchu yapmalıyım o sayfanın listesindeki!

Center _buildHasNotPage(BuildContext context) {
  return Center(
      child: Text(
        'Üzgünüz, bu sayfa bulunamadı!',
        style: context.general.textTheme.labelLarge,
      ),
    );
}
