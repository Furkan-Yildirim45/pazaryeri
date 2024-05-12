import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/widget/general_app_bar.dart';
import 'package:untitled/screen/profile/card/model/credit_card_model.dart';

import '../../../../product/navigator/navigator_manager.dart';
import '../../../../product/utility/page_utility/profile/address_view_utility.dart';
import '../../../../product/utility/page_utility/profile/credit_card_utility.dart';
import '../../../../product/widget/custom_bottom_nav_bar.dart';
import '../../../../product/widget/custom_elevated_button.dart';
import '../../../../product/widget/general_shadow.dart';

part 'part/cardBottomSheet.dart';

class CreditCardView extends StatelessWidget with AddressViewUtility,CreditCardUtility {
  CreditCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        textColor: ProjectColor.apricot.getColor(), isLeadingActive: true,),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: ListView(
            children: [
              buildAddNewAddress(context, text: "Yeni Kart Ekle",
                  icon: Icons.add_outlined,
                  onPressed: () {return buildShowModalBottomSheetForCardView(context: context,);}),
              buildLvbForAddressCard(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(controller: mainPageController,
        onTap: (int index){
          NavigatorController.instance.pop();
          mainPageController.onItemTapped(index, context);
        },
      ),
    );
  }
}