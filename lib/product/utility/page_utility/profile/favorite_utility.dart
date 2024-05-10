

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../color/project_color.dart';
import '../../../widget/custom_elevated_button.dart';
import '../../project_utility/image_utility.dart';

mixin FavoriteUtility{

  Padding buildProductDetailButton(BuildContext context,{
    required double width,
    required String title,
    double? height,
    TextStyle? textStyle,
}) {
    return Padding(
      padding: EdgeInsets.all(context.sized.lowValue),
      child: CustomElevatedButton(
        height: height,
        width: width,
        shape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius),
        backgroundColor: ProjectColor.apricot.getColor(),
        onPressed: () {},
        child: Text(
          title,
          style: textStyle ?? context.general.textTheme.titleSmall
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  SizedBox buildProductDetailWithoutButton(BuildContext context, int index) {
    return SizedBox(
      height: context.sized.dynamicHeight(0.18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: context.padding.onlyRightLow,
            width: context.sized.dynamicWidth(0.3),
            height: context.sized.dynamicWidth(0.3),
            child: Container(
              margin: EdgeInsets.all(context.sized.lowValue),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageUtility.getImagePath("9")),
                  fit: BoxFit.cover,
                ),
                borderRadius: context.border.normalBorderRadius,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: context.padding.onlyTopNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('XXX Erkek Parfüm',
                      style: context.general.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  const Text('Nivea'),
                  Text('\$${(index + 1) * 10}.99',
                      style: context.general.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ProjectColor.apricot.getColor())),
                  Padding(
                    padding: context.padding.onlyTopNormal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildProductFavoriteCardPropertyButton(context,
                            onPressed: () {}, text: "Kargo Bedava"),
                        buildProductFavoriteCardPropertyButton(context,
                            onPressed: () {}, text: "Hızlı Teslimat"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomElevatedButton buildProductFavoriteCardPropertyButton(
      BuildContext context, {
        required void Function() onPressed,
        required String text,
      }) {
    return CustomElevatedButton(
      onPressed: onPressed,
      height: context.sized.mediumValue,
      width: context.sized.dynamicWidth(0.28),
      shape: RoundedRectangleBorder(
        borderRadius: context.border.normalBorderRadius,
      ),
      child: Text(text,
          style: context.general.textTheme.labelLarge
              ?.copyWith(fontWeight: FontWeight.w400)),
    );
  }
}