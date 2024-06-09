import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/navigator/navigator_route_items.dart';
import '../../../../product/utility/page_utility/basic/welcome_utility.dart';
import '../../../../product/utility/project_utility/background_image_utility.dart';
import '../../../../product/utility/project_utility/image_utility.dart';
import '../controller/privacy_policy_controller.dart';

part 'parts/phone_number_widget.dart';

part 'parts/privacy_policy_widget.dart';

class WelcomeView extends StatelessWidget
    with WelcomeUtility, BackgroundImageUtility {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(
        context,
        text: 'Kodu Gönder',
        onPressed: () {
          NavigatorController.instance
              .pushAndRemoveUntil(NavigateRoutesItems.verificationCode);
        },
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          backgroundImageUtility(
            context,
            child: Padding(
              padding: context.padding.horizontalNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  marketPlaceTitle(context),
                  welcomeAboardText(context),
                  enterYourNumberText(context),
                  const PhoneNumberWidget(),
                  informationText(context),
                  const PrivacyPolicyWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
