import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../model/product_model.dart';

enum SearchBarPageItems {
  home,
  favorite,
  shoppingCard,
  pastOrders,
  search,
}

enum SearchBarLocalPage {
  search,
  searchResultForCouple,
  searchResultForLonely,
}

class SearchBarPageController extends GetxController {
  var currentPage = SearchBarPageItems.home.name.obs;
  RxList<ProductModel> items = <ProductModel>[].obs;
  var searchBarPageItemForThisView = SearchBarPageItems.home.name.obs;

  void changeCurrentPageValue(
      {List<ProductModel>? matchedProducts,
      String? searchBarPageItem,
      String? searchBarLocalPageItem}) {
    if (searchBarPageItem != null || searchBarLocalPageItem != null) {
      if (searchBarPageItem != null) {
        currentPage.value = searchBarPageItem;
      } else if (searchBarLocalPageItem != null) {
        currentPage.value = searchBarLocalPageItem;
      }
      if (matchedProducts != null) {
        items.value = matchedProducts;
      }
      print("changeCurrentPageValue :${currentPage.value}");
    } else {
      Exception("Girdiğin page null!");
    }
    print(currentPage.value);
    update();
  }

  void setCurrentPageForThisView(SearchBarPageItems items) {
    currentPage.value = items.name;
    searchBarPageItemForThisView.value = items.name;
  }
}
