import 'package:get/get.dart';
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
      update();
      print("changeCurrentPageValue :${currentPage.value}");
    } else {
      Exception("Girdiğin page null!");
    }
    print(currentPage.value);
  }

  void setCurrentPage(SearchBarPageItems items) {
    currentPage.value = items.name;
  }
}
