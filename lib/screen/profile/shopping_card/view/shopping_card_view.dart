import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/utility/page_utility/product_detail_utility.dart';
import 'package:untitled/product/utility/page_utility/profile/favorite_utility.dart';
import 'package:untitled/product/widget/general_search_bar.dart';

class ShoppingCardView extends StatelessWidget with ProductDetailUtility,FavoriteUtility{
  ShoppingCardView({super.key});
  final int lvbItemCount = 5;

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

  Padding buildProductCardLvb(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        height: lvbItemCount * context.sized.dynamicHeight(0.288),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lvbItemCount,
          itemBuilder: (context, index) {
            return buildProductCard(context,index);
          },
        ),
      ),
    );
  }

  Padding buildCardProductSellerInfo(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Satıcı: ',style: context.general.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              Padding(
                padding: context.padding.onlyLeftNormal,
                child: Text('Ege Avcı', style: context.general.textTheme.bodyMedium?.copyWith(color: Colors.black,fontWeight: FontWeight.bold)),
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
                child: Text('5.0', style: context.general.textTheme.bodyMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container customFloatActionButton(BuildContext context,) {
    return Container(
      width: context.sized.width,
      height: context.sized.highValue,
      decoration: BoxDecoration(
          boxShadow: [buildGeneralShadow()],
          color: Colors.white,
          borderRadius: context.border.normalBorderRadius
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  '\$10.99',
                  style: context.general.textTheme.titleLarge?.copyWith(
                      color: Colors.black,fontWeight: FontWeight.bold
                  )
              ),
              Text(
                  'Toplam Tutar',
                  style: context.general.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey
                  )
              ),
            ],
          ),
          buildProductDetailButton(context,
              width: context.sized.dynamicWidth(0.5),
              title: "Alışverişi tamamla",
              height: context.sized.dynamicHeight(0.07),
              textStyle: context.general.textTheme.titleMedium?.copyWith(color: Colors.white)
          ),
        ],
      ),
    );
  }

  Card buildProductCard(BuildContext context,int index) {
    return Card(
      margin: index == 4 ? EdgeInsets.zero : context.padding.onlyBottomNormal,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: context.border.normalBorderRadius),
      child: Padding(
        padding: context.padding.horizontalLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCardProductSellerInfo(context),
            pageDivider(context),
            buildProductDetailWithoutButton(context, index)
          ],
        ),
      ),
    );
  }
}
