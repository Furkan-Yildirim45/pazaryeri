import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/data/project_data.dart';
import 'package:untitled/product/navigator/navigator_manager.dart';
import 'package:untitled/product/navigator/navigator_route_items.dart';
import 'package:untitled/product/widget/general_search_bar.dart';

import '../../../../product/model/product_model.dart';
import '../../../../product/utility/page_utility/profile/favorite_utility.dart';

class FavoriteView extends StatelessWidget with FavoriteUtility{
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
              Expanded(
                child: Padding(
                  padding: context.padding.onlyTopNormal,
                  child: ListView.builder(
                    itemCount: ProjectData.instance?.favoriteProductItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildFavoriteProductCard(context, index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildFavoriteProductCard(BuildContext context, int index,) {
    return GestureDetector(
      onTap: (){
        NavigatorController.instance.pushToPage(NavigateRoutesItems.productDetail,
        arguments: ProjectData.instance?.favoriteProductItems[index]);
      },
      child: Container(
        margin: context.padding.onlyTopLow,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: context.border.lowBorderRadius),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildProductDetailWithoutButton(context: context,index: index,model: ProjectData.instance?.favoriteProductItems[index],),
                            buildProductDetailButton(context, width: double.infinity,title: 'Sepete Ekle'),
                          ],
                        ),
                      ),
    );
  }
}
