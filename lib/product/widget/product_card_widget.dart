import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';
import '../utility/project_utility/image_utility.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: context.border.lowBorderRadius,
        ),
        padding: EdgeInsets.all(context.sized.lowValue),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(context),
            _buildProductTitleText(context),
            _buildPriceText(context),
          ],
        ),
      ),
    );
  }

  Expanded _buildProductImage(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: context.border.lowBorderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              ImageUtility.getImagePath("9"),
              fit: BoxFit.cover,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildProductTitleText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Text("XXX Erkek Vücut Parfümü",
          style: context.general.textTheme.bodySmall),
    );
  }

  Padding _buildPriceText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "\$99",
            style: context.general.textTheme.bodyMedium?.copyWith(
                color: ProjectColor.apricot.getColor(),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
