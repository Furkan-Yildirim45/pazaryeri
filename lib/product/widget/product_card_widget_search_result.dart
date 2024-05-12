import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';
import '../utility/project_utility/image_utility.dart';

class ProductCardWidgetSearchResult extends StatelessWidget {
  const ProductCardWidgetSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.sized.lowValue),
      margin: EdgeInsets.all(context.sized.lowValue),
      decoration: BoxDecoration(
        borderRadius: context.border.normalBorderRadius,
        boxShadow: const [BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 1),
          blurRadius: 2,
          spreadRadius: 2,
        )],
        color: ProjectColor.lightGrey.getColor(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: context.border.normalBorderRadius,
                image: DecorationImage(image: AssetImage(ImageUtility.getImagePath("9")),fit: BoxFit.cover)
            ),
            width: double.infinity,
            height: context.sized.dynamicHeight(0.24),
          ),
          Padding(
            padding: context.padding.onlyTopLow,
            child: const Text('Yüz Bakım Kremi'),
          ),
          Text('368.00 TL',style: context.general.textTheme.bodyMedium?.copyWith(color: ProjectColor.apricot.getColor()),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(context.sized.dynamicWidth(0.01)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: context.border.lowBorderRadius,
                    boxShadow: const [BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                    )]
                ),
                child: Text('Kargo Bedava',style:
                context.general.textTheme.bodySmall,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}