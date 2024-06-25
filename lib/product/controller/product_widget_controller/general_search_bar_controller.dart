import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../search_bar_page_controller.dart';

class GeneralSearchBarController extends GetxController {
  final _searchController = TextEditingController();
  TextEditingController get getSearchController => _searchController;
  final searchedWords = [].obs;
  var isClicked = false.obs;
  final SearchBarPageController searchBarPageController =
      Get.put(SearchBarPageController());

  void onSubmitted(
      {required String word, List<ProductModel>? searchProductItems}) {
    searchedWords.add(word);
    if (searchProductItems?.isNotEmpty ?? false) {
      List<ProductModel>? matchedProductItems = searchProductItems!
          .where((product) =>
              product.productName?.toLowerCase().contains(word.toLowerCase()) ??
              false)
          .toList();

      if (matchedProductItems.isNotEmpty) {
        searchBarPageController.changeCurrentPageValue(
            searchBarLocalPageItem: Get.find<SearchBarPageController>().searchBarPageItemForThisView.value == SearchBarPageItems.home.name
                ? SearchBarLocalPage.searchResultForCouple.name
                : SearchBarLocalPage.searchResultForLonely.name,
            matchedProducts: matchedProductItems);
      }
      _searchController.clear();
      update();
    }
  }

  void delete(int index) {
    searchedWords.removeAt(index);
  }

  void changeClicked() {
    isClicked.value = !isClicked.value;
    update();
  }
}
