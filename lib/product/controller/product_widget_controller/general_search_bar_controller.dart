
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class GeneralSearchBarController extends GetxController {
  final _searchController = TextEditingController();
  TextEditingController get getSearchController => _searchController;
  final searchedWord = [].obs;

  void onSubmitted(String word) {
    searchedWord.add(word);
    _searchController.clear();
  }

  void delete(int index) {
    searchedWord.removeAt(index);
  }
}