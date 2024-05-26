import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';

import 'image_utility.dart';

mixin BackgroundImageUtility {
  Container backgroundImageUtility(
    BuildContext context, {
    required Widget child,
  }) {
    return Container(
      width: context.sized.width,
      height: context.sized.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(ImageUtility.getImagePath("welcome")),
        fit: BoxFit.cover,
      )),
      child: child,
    );
  }
}
