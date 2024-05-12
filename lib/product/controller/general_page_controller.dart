
import 'package:get/get.dart';

enum PageType {
  home,
  search,
  searchResult
}

class GeneralPageController extends GetxController {
  var currentPage = PageType.home.obs;

  void showPage(PageType page) {
    currentPage.value = page;
    update();
  }
}