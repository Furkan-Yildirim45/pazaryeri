import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/controller/product_widget_controller/added_to_card_controller.dart';
import 'package:untitled/product/navigator/navigator_manager.dart';
import 'package:untitled/product/navigator/navigator_route_items.dart';
import 'package:untitled/product/widget/general_search_bar.dart';
import 'package:untitled/screen/profile/favorite/controller/favorite_controller.dart';
import 'package:untitled/screen/profile/shopping_card/controller/shopping_card_controller.dart';

import '../../../../product/utility/page_utility/profile/favorite_utility.dart';

class FavoriteView extends StatelessWidget with FavoriteUtility {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GeneralSearchBar(),
              GetBuilder(
                init: FavoriteController(),
                builder: (controller) => Expanded(
                  child: Padding(
                    padding: context.padding.onlyTopNormal,
                    child: ListView.builder(
                      itemCount: controller.favoriteProductItems?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildFavoriteProductCard(context, index,controller);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildFavoriteProductCard(
    BuildContext context,
    int index,
      FavoriteController favoriteController,
  ) {
    return GestureDetector(
      onTap: () {
        NavigatorController.instance.pushToPage(
            NavigateRoutesItems.productDetail,
            arguments: favoriteController.favoriteProductItems?[index]);
      },
      child: Container(
        margin: context.padding.onlyBottomLow,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: context.border.lowBorderRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildProductDetailWithoutButton(
              context: context,
              index: index,
              model: favoriteController.favoriteProductItems?[index],
            ),
            buildProductDetailButton(context,
                width: double.infinity, title: 'Sepete Ekle', onPressed: () {
                  final ShoppingCardController controller = Get.put(ShoppingCardController());
                  controller.addProductToShoppingCard(favoriteController.favoriteProductItems?[index]);
                  AlertController().showAlert();
                }),
          ],
        ),
      ),
    );
  }
}
