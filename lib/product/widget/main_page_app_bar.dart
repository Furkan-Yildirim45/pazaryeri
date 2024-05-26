import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:kartal/kartal.dart';

import '../color/project_color.dart';
import '../navigator/navigator_manager.dart';
import '../navigator/navigator_route_items.dart';
import '../utility/page_utility/basic/welcome_utility.dart';
import '../utility/project_utility/image_utility.dart';
import 'custom_elevated_button.dart';

class MainPageAppBar extends StatelessWidget with WelcomeUtility {
  const MainPageAppBar(
      {super.key, this.isLeadingActive = false, required this.textColor});

  final bool? isLeadingActive;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.only(left: context.width * 0.25),
              child: marketPlaceTitle(context, padding: EdgeInsets.zero)),
          _buildAppBarButton(
            context,
            onPressed: () {
              NavigatorController.instance
                  .pushToPage(NavigateRoutesItems.notification);
            },
            child: Image.asset(
              ImageUtility.getImagePath("notification_appbar"),
              color: ProjectColor.apricot.getColor(),
              height: context.sized.mediumValue,
              width: context.sized.mediumValue,
            ),
          )
        ],
      ),
    );
  }

  CustomElevatedButton _buildAppBarButton(
    BuildContext context, {
    required void Function() onPressed,
    required Widget child,
  }) {
    return CustomElevatedButton(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: context.border.normalBorderRadius),
      onPressed: onPressed,
      width: context.sized.dynamicWidth(0.16),
      height: context.sized.dynamicHeight(0.12),
      child: child,
    );
  }
}
