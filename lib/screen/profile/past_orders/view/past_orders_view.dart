import 'package:Pazaryeri/product/controller/search_bar_page_controller.dart';
import 'package:Pazaryeri/product/utility/page_utility/profile/past_oders_view_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/model/product_model.dart';
import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/navigator/navigator_route_items.dart';
import '../../../../product/utility/page_utility/profile/favorite_utility.dart';
import '../../../../product/widget/general_app_bar.dart';
import '../../../../product/widget/general_search_bar.dart';
import '../../../../product/widget/product_card_with_seller_info.dart';

class PastOrdersView extends StatelessWidget
    with FavoriteUtility, PastOdersViewUtility {
  PastOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        textColor: ProjectColor.apricot.getColor(),
        isLeadingActive: true,
      ),
      body: Padding(
        padding: context.padding.horizontalNormal,
        child: ListView(
          children: [
            GeneralSearchBar(
              searchBarPageItems: SearchBarPageItems.pastOrders,
              searchBarProductItems: pastOrdersController.pastOrderProductItems,
            ),
            Obx(
              () => _buildProductLvb(context),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildProductLvb(BuildContext context) {
    return Container(
      margin: context.padding.onlyTopNormal,
      width: double.infinity,
      height: context.sized.dynamicHeight(0.268) *
          (pastOrdersController.pastOrderProductItems?.length ?? 0.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pastOrdersController.pastOrderProductItems?.length,
        itemBuilder: (context, index) {
          return ProductCardWithSellerInfo(
            index: index,
            productModel: pastOrdersController.pastOrderProductItems?[index],
            topPlace: _buildTopPlace(
                context, pastOrdersController.pastOrderProductItems?[index]),
            buttons: [
              buildProductFavoriteCardPropertyButton(context, onPressed: () {
                NavigatorController.instance.pushToPage(
                    NavigateRoutesItems.orderDetail,
                    arguments:
                        pastOrdersController.pastOrderProductItems?[index]);
              },
                  text: "Detaylar",
                  textColor: Colors.white,
                  backgroundColor: ProjectColor.apricot.getColor())
            ],
          );
        },
      ),
    );
  }

  Padding _buildTopPlace(BuildContext context, ProductModel? productModel) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(productModel?.productDate ?? ""),
              Row(
                children: [
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: context.padding.onlyLeftLow,
                    child: Text(
                      'Teslim edildi',
                      style: context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
