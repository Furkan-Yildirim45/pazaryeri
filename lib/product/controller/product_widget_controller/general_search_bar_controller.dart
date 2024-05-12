
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled/data/project_data.dart';
import 'package:untitled/product/model/product_model.dart';

import '../general_page_controller.dart';

class GeneralSearchBarController extends GetxController {
  final _searchController = TextEditingController();
  TextEditingController get getSearchController => _searchController;
  final searchedWords = [].obs;
  var isClicked = false.obs;
  final GeneralPageController generalPageController = Get.put(GeneralPageController());

  void onSubmitted(String word) {
    searchedWords.add(word);
    List<ProductModel>? matchedProducts = ProjectData.instance?.productItems
        .where((product) => product.productName.toLowerCase().contains(word.toLowerCase()))
        .toList();
    if (matchedProducts?.isNotEmpty ?? false) {
      generalPageController.showPage(PageType.searchResult);
    }
    _searchController.clear();
  }

  void delete(int index) {
    searchedWords.removeAt(index);
  }

  void changeClicked(){
    isClicked.value = !isClicked.value;
    update();
  }
}

//todo:knk geçmiş aramalara bastıgımda onu aratmasını ayarlamadım.