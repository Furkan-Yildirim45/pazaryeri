import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';
import '../controller/search_bar_page_controller.dart';
import '../controller/product_widget_controller/general_search_bar_controller.dart';

class GeneralSearchBar extends StatefulWidget {
  const GeneralSearchBar({super.key, required this.searchBarPageItems});
  final SearchBarPageItems searchBarPageItems;

  @override
  State<GeneralSearchBar> createState() => _GeneralSearchBarState();
}

class _GeneralSearchBarState extends State<GeneralSearchBar> {
  final SearchBarPageController searchBarPageController = Get.find<SearchBarPageController>();
  final GeneralSearchBarController searchBarController = Get.put(GeneralSearchBarController());
  final String hintText = "İstediğiniz ürünü ve kategoriyi aratabilirsiniz";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchBarPageController.setCurrentPage(widget.searchBarPageItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: GestureDetector(
        onTap: (){
          // _switchToSearchPage();
        },
        child: GetBuilder<GeneralSearchBarController>(
          init: GeneralSearchBarController(),
          builder: (searchBarController) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: context.sized.dynamicHeight(0.06),
                    decoration: _buildMainContainerDecoration(context),
                    child: Row(
                      children: [
                        _buildSearchIcon(context, searchController: searchBarController),
                        _buildSearchBarTextField(context, searchBarController),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

/*   void _switchToSearchPage() {
    if(searchBarPageController.currentPage.value == SearchBarPageItems.home){
      searchBarController.changeClicked();
      searchBarPageController.showPage(searchBarLocalPageItem: SearchBarLocalPage.search);
    }
  } */
  Expanded _buildSearchBarTextField(
      BuildContext context, GeneralSearchBarController controller) {
    return Expanded(
      child: Padding(
        padding: context.padding.onlyLeftLow,
        child: Padding(
          padding: EdgeInsets.only(bottom: Get.height * 0.013,right: context.sized.normalValue),
          child: TextField(
            onTap: (){
              // _switchToSearchPage();
            },
              textAlignVertical: TextAlignVertical.center,
              controller: controller.getSearchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: context.general.textTheme.titleSmall?.copyWith(
                    color: Colors.black54,
                    overflow: TextOverflow.ellipsis
                  )),
              onSubmitted: controller.onSubmitted),
        ),
      ),
    );
  }

  BoxDecoration _buildMainContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: ProjectColor.lightGrey.getColor(),
      border: Border.all(color: Colors.black26),
      borderRadius: context.border.normalBorderRadius,
    );
  }

  Padding _buildSearchIcon(BuildContext context,
      {required GeneralSearchBarController searchController}) {
    return Padding(
      padding: context.padding.onlyLeftLow,
      child: IconButton(
        onPressed: (){
          _iconButtonOnPressed(searchController);
        },
        icon: Icon(
          searchController.isClicked.value ? Icons.arrow_back_outlined : Icons.search,
          color: ProjectColor.apricot.getColor(),
        ),
      ),
    );
  }

  void _iconButtonOnPressed(GeneralSearchBarController searchController) {
    switch(searchBarPageController.currentPage.value){
      case "search":
        searchController.changeClicked();
        searchBarPageController.changeCurrentPageValue(searchBarPageItem: widget.searchBarPageItems.name);
      case "searchResultForCouple":
        searchController.changeClicked();
        searchBarPageController.changeCurrentPageValue(searchBarPageItem: widget.searchBarPageItems.name);
      case "favorite":
      case "shoppingCard":
      case "pastOrders":
      case "searchResultForLonely":
      case "home":
        searchBarController.changeClicked();
        searchBarPageController.changeCurrentPageValue(searchBarLocalPageItem: SearchBarLocalPage.search.name);
    }
  }
}

//tum herşey yukarıda var dosya kodlarını tek tek chatgpt ye at senaryoyu at bakalım ne dicek!