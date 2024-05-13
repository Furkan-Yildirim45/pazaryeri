import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/model/product_model.dart';
import 'package:untitled/product/utility/page_utility/profile/favorite_utility.dart';
import 'package:untitled/product/widget/page_divider.dart';

class ProductCardWithSellerInfo extends StatelessWidget with FavoriteUtility {
  const ProductCardWithSellerInfo({
    super.key,
    required this.index,
    this.buttons,
    this.topPlace, this.productModel,
  });
  final ProductModel? productModel;
  final int index;
  final List<Widget>? buttons;
  final Widget? topPlace;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: index == 4 ? EdgeInsets.zero : context.padding.onlyBottomNormal,
      elevation: 2,
      shape: RoundedRectangleBorder(
          borderRadius: context.border.normalBorderRadius),
      child: Padding(
        padding: context.padding.horizontalLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topPlace ?? buildCardTopPlace(context),
            CustomPageDivider(),
            buildProductDetailWithoutButton(
              index: index,
              context: context,
              buttons: buttons,
              model: productModel,
            )
          ],
        ),
      ),
    );
  }

  Padding buildCardTopPlace(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Satıcı: ',
                  style: context.general.textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey)),
              Padding(
                padding: context.padding.onlyLeftNormal,
                child: Text(topPlace == null ? productModel?.seller ?? "" : "",
                    style: context.general.textTheme.bodyMedium?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green, // Background color
                  borderRadius: context.border.lowBorderRadius, // Oval shape
                ),
                padding: context.padding.horizontalLow,
                child: Text(topPlace == null ? productModel?.productRating ?? "0.0" : "",
                    style: context.general.textTheme.bodyMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}