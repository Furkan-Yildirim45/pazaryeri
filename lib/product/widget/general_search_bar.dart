import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/controller/product_widget_controller/general_search_bar_controller.dart';

import '../color/project_color.dart';

class GeneralSearchBar extends StatelessWidget {
  const GeneralSearchBar({super.key});

  final String hintText = "İstediğiniz ürünü ve kategoriyi aratabilirsiniz";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: GetBuilder<GeneralSearchBarController>(
        init: GeneralSearchBarController(),
        builder: (controller) {
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: context.sized.dynamicHeight(0.06),
                  decoration: _buildMainContainerDecoration(context),
                  child: Row(
                    children: [
                      _buildSearchIcon(context),
                      _buildSearchBarTextField(context, controller),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Expanded _buildSearchBarTextField(
      BuildContext context, GeneralSearchBarController controller) {
    return Expanded(
      child: Padding(
        padding: context.padding.onlyLeftNormal,
        child: Padding(
          padding: context.padding.onlyBottomLow,
          child: TextField(
              textAlignVertical: TextAlignVertical.center,
              controller: controller.getSearchController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: context.general.textTheme.titleSmall?.copyWith(
                    color: Colors.black54,
                  )),
              onSubmitted: controller.onSubmitted),
        ),
      ),
    );
  }

  BoxDecoration _buildMainContainerDecoration(BuildContext context) {
    return BoxDecoration(
      color: ProjectColor.lightGrey.getColor(),
      border: Border.all(color: Colors.black26),
      borderRadius: context.border.normalBorderRadius,
    );
  }

  Padding _buildSearchIcon(BuildContext context) {
    return Padding(
      padding: context.padding.onlyLeftNormal,
      child: Icon(
        Icons.search,
        color: ProjectColor.apricot.getColor(),
      ),
    );
  }
}
