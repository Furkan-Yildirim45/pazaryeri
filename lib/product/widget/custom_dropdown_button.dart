import 'package:Pazaryeri/product/color/project_color.dart';
import 'package:Pazaryeri/product/controller/product_widget_controller/custom_dropdown_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

class CustomPopupMenuButton<T> extends StatelessWidget {
  const CustomPopupMenuButton({super.key, required this.items, required this.text, required this.controller});

  final DropdownController<T> controller;
  final List<PopupMenuEntry<T>> items;
  final String text;


  @override
  Widget build(BuildContext context) {
    final GlobalKey<PopupMenuButtonState<T>> popupKey = GlobalKey<PopupMenuButtonState<T>>();
   return Padding(
      padding: context.padding.onlyTopNormal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: context.general.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: () {
              popupKey.currentState?.showButtonMenu();
            },
            child: SizedBox(
              width: context.sized.width,
              height: context.height * 0.07,
              child: Container(
                width: context.sized.dynamicWidth(0.24),
                padding: EdgeInsets.symmetric(horizontal: context.padding.horizontalLow.horizontal),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F1),
                  borderRadius: context.border.normalBorderRadius,
                ),
                child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.selectedValue.value?.toString() ?? '',
                      style: context.general.textTheme.bodyLarge?.copyWith(color: Colors.black)
                    ),
                    PopupMenuButton<T>(
                      key: popupKey,
                      shape: RoundedRectangleBorder(side: BorderSide.none,borderRadius: context.border.lowBorderRadius),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconColor: ProjectColor.apricot.getColor(),
                      iconSize: context.sized.mediumValue,
                      itemBuilder: (context) => items,
                      onSelected: controller.updateSelectedValue,
                      color: Colors.white,
                    ),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}