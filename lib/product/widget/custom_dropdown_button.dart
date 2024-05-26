import 'package:Pazaryeri/product/controller/product_widget_controller/custom_dropdown_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  CustomDropDownButton({super.key, required this.items, required this.text});

  final DropdownController<T> controller = Get.put(DropdownController<T>());
  final List<T> items;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,style: context.general.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,color: Colors.grey
          ),),
          SizedBox(
            width: context.sized.width,
            child: Container(
              width: context.sized.dynamicWidth(0.24),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: context.border.normalBorderRadius,
              ),
              child: DropdownButton<T>(
                iconSize: context.sized.mediumValue,
                padding: context.padding.horizontalLow,
                iconEnabledColor: ProjectColor.apricot.getColor(),
                isExpanded: true,
                value: controller.selectedValue.value,
                underline: const SizedBox.shrink(),
                onChanged: controller.updateSelectedValue,
                items: items.map((T value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: Padding(
                      padding: context.padding.onlyLeftNormal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(value.toString()),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
