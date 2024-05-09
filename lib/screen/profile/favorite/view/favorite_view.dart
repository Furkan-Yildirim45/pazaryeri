import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/utility/project_utility/image_utility.dart';
import 'package:untitled/product/widget/custom_elevated_button.dart';
import 'package:untitled/product/widget/general_search_bar.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/widget/general_app_bar.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(textColor: ProjectColor.apricot.getColor()),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const GeneralSearchBar(),
              Expanded(
                child: Padding(
                  padding: context.padding.onlyTopNormal,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: context.border.lowBorderRadius),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildProductDetailWithoutButton(context, index),
                            _buildProductDetailButton(context),
                          ],
                        ),
                      );
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

  Padding _buildProductDetailButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.sized.lowValue),
      child: CustomElevatedButton(
        width: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: context.border.normalBorderRadius),
        backgroundColor: ProjectColor.apricot.getColor(),
        onPressed: () {},
        child: Text(
          'Sepete Ekle',
          style: context.general.textTheme.titleSmall
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  SizedBox _buildProductDetailWithoutButton(BuildContext context, int index) {
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
                        _buildProductFavoriteCardPropertyButton(context,
                            onPressed: () {}, text: "Kargo Bedava"),
                        _buildProductFavoriteCardPropertyButton(context,
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

  CustomElevatedButton _buildProductFavoriteCardPropertyButton(
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
