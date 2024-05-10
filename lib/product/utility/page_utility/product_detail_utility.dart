

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/widget/page_divider.dart';

import '../../../screen/product/product_detail/model/comment_model.dart';
import '../../../screen/product/product_detail/view/product_detail_view.dart';
import '../../color/project_color.dart';
import '../../widget/custom_elevated_button.dart';

mixin ProductDetailUtility {
  Container sellerProfileContainer(
      BuildContext context, {
        String? url,
      }) {
    return Container(
      margin: context.padding.onlyRightNormal,
      height: context.sized.dynamicHeight(0.11),
      width: context.sized.dynamicHeight(0.11),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: context.border.normalBorderRadius,
        image: url != null ? DecorationImage(image: AssetImage(url)) : null,
      ),
    );
  }

  Text productNameAndCode(BuildContext context,{required TextStyle textStyle}) => Text('Yüz Bakım Serumu PZ5354686', style: textStyle,);

  Text productShopName(BuildContext context) => Text('M.Lawrence Serum', style: context.general.textTheme.titleLarge,);

  Row productRating(BuildContext context,{required double starSize}) {
    return Row(
      children: [
        //total star average
        Container(
          margin: context.padding.onlyRightLow,
          padding: context.padding.horizontalLow,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: context.border.lowBorderRadius,
          ),
          child: Text(
            '4.3',
            style: context.general.textTheme.titleMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
        //star point
        buildStarPoint(starSize),
        //divider
        buildVerticalDivider(context, starSize),
        //değerlendirme
        Text(
          '1234 Değerlendirme',
          style: context.general.textTheme.labelSmall
              ?.copyWith(color: Colors.grey,fontSize: context.sized.dynamicWidth(0.025)),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Container buildVerticalDivider(BuildContext context, double starSize) {
    return Container(
      margin: context.padding.horizontalLow,
      width: 2,
      height: starSize * 1.5,
      color: Colors.black54,
    );
  }

  SizedBox buildStarPoint(double starSize) {
    return SizedBox(
      width: starSize * 5,
      height: starSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Icon(
            Icons.star,
            size: starSize,
            color: index == 4
                ? Colors.grey
                : ProjectColor.starYellow.getColor(),
          );
        },
      ),
    );
  }

  Positioned quantityButton(
      BuildContext context, {
        bool? isLeft,
        required String text,
      }) {
    return Positioned(
      top: 0,
      left: (isLeft ?? false) ? 0 : null,
      right: (isLeft ?? false) ? null : 0,
      child: CustomElevatedButton(
        shape: RoundedRectangleBorder(
            borderRadius: context.border.lowBorderRadius),
        onPressed: () {},
        width: context.sized.dynamicHeight(0.06),
        height: context.sized.dynamicHeight(0.06),
        child: Text(
          text,
          style: context.general.textTheme.titleLarge,
        ),
      ),
    );
  }

  Column buildCommentWithDivider(BuildContext context, int index,{required List<CommentModel> commentItems}) {
    return Column(
      children: [
        Container(
          margin: context.padding.onlyTopNormal,
          height: context.sized.dynamicHeight(0.13),
          child: Column(
            children: [
              Row(
                children: [
                  buildStarPoint(context.sized.dynamicHeight(0.015)),
                  buildVerticalDivider(context,context.sized.dynamicHeight(0.015)),
                  const SecureNameWidget(name: "Furkan Yıldırım"),
                  Padding(
                    padding: context.padding.horizontalNormal,
                    child: Text('-',style: context.general.textTheme.titleLarge,),
                  ),
                  Text(commentItems[index].commentDate,style: context.general.textTheme.labelLarge),
                ],
              ),
              Padding(
                padding: context.padding.onlyTopLow,
                child: Text(commentItems[index].comment,maxLines: 3,overflow: TextOverflow.ellipsis,),
              ),
            ],
          ),
        ),
        CustomPageDivider(),
      ],
    );
  }

  Column buildSellerAndProductInfo(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.padding.onlyTopNormal,
          child: Row(
            children: [
              sellerProfileContainer(context,url: "assets/images/product.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productShopName(context),
                  productNameAndCode(context, textStyle: context.general.textTheme.titleSmall?.copyWith(color: Colors.grey) ?? const TextStyle()),
                  productRating(context, starSize: context.sized.dynamicHeight(0.015),),
                ],
              ),
            ],
          ),
        ),
        CustomPageDivider(),
      ],
    );
  }


}