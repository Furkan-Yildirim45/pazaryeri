import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/model/product_model.dart';
import 'package:untitled/product/utility/page_utility/product_detail_utility.dart';
import 'package:untitled/product/utility/page_utility/profile/favorite_utility.dart';
import 'package:untitled/product/widget/general_search_bar.dart';
import 'package:untitled/product/widget/product_card_with_seller_info.dart';

import '../../../../product/widget/general_shadow.dart';

class ShoppingCardView extends StatelessWidget
    with ProductDetailUtility, FavoriteUtility {
  ShoppingCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFloatActionButton(context),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: ListView(
            children: [
              const GeneralSearchBar(),
              buildProductCardLvb(context),
            ],
          ),
        ),
      ),
    );
  }

  final int lvbItemCount = 5;

  Padding buildProductCardLvb(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: lvbItemCount * context.sized.dynamicHeight(0.288),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lvbItemCount,
          itemBuilder: (context, index) {
            return ProductCardWithSellerInfo(
              index: index,
              productModel: ProductModel(
                  productUrl: "9",
                  productBrand: "Nivea",
                  productPrice: "300",
                  productDate: "11.05.2024",
                  seller: "XXXXXX",
                  productRating: "4.7",
                  productName: "XXX Erkek Parfüm"),
            );
          },
        ),
      ),
    );
  }


  Container customFloatActionButton(
    BuildContext context,
  ) {
    return Container(
      width: context.sized.width,
      height: context.sized.highValue,
      decoration: BoxDecoration(
          boxShadow: [generalShadow()],
          color: Colors.white,
          borderRadius: context.border.normalBorderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$10.99',
                  style: context.general.textTheme.titleLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text('Toplam Tutar',
                  style: context.general.textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey)),
            ],
          ),
          buildProductDetailButton(context,
              width: context.sized.dynamicWidth(0.5),
              title: "Alışverişi tamamla",
              height: context.sized.dynamicHeight(0.07),
              textStyle: context.general.textTheme.titleMedium
                  ?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
