import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/model/product_model.dart';
import '../../../../product/widget/custom_elevated_button.dart';
import '../../../../product/widget/product_card_widget_search_result.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key, this.productItems,});
  final List<ProductModel>? productItems;

  @override
  Widget build(BuildContext context) {
    print("productItems.lenght :${productItems?.length}");
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: SizedBox(
        width: double.infinity,
        height: context.sized.dynamicHeight(0.681),
        child: ListView(
          children: [
            _buildMenuButtonRow(context),
            _buildProductCardWidgetGridView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCardWidgetGridView(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var crossAxisCount = 2;
        var spacing = 10.0;
        var totalSpacing = spacing * (crossAxisCount - 1);
        var itemWidth = (constraints.maxWidth - totalSpacing) / crossAxisCount;
        var itemHeight = itemWidth * 1.24;
        var itemCount = productItems?.length ?? 0;
        var rowCount = (itemCount / crossAxisCount).ceil();
        var gridHeight = itemHeight * rowCount + (spacing * (rowCount - 1));

        return Container(
          margin: context.padding.onlyTopNormal,
          width: double.infinity,
          height: gridHeight + context.sized.normalValue,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
              childAspectRatio: (itemWidth / itemHeight),
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return ProductCardWidgetSearchResult(model: productItems?[index]);
            },
          ),
        );
      },
    );
  }

  Row _buildMenuButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMenuButton(
            context: context,
            onPressed: () {},
            icon: Icons.sort_outlined,
            text: "Sırala"),
        _buildMenuButton(
            context: context,
            onPressed: () {},
            icon: Icons.filter_alt_outlined,
            text: "Filtrele"),
      ],
    );
  }

  CustomElevatedButton _buildMenuButton(
      {required BuildContext context,
      required String text,
      required void Function() onPressed,
      required IconData icon}) {
    return CustomElevatedButton(
      padding: context.padding.horizontalNormal,
      onPressed: onPressed,
      height: context.sized.dynamicHeight(0.06),
      width: context.sized.dynamicWidth(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: context.border.normalBorderRadius,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: ProjectColor.apricot.getColor(),
          ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: context.general.textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
