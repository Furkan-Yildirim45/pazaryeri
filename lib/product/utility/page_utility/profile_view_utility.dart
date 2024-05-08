import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/screen/profile/wallet/view/wallet_view.dart';

import '../../color/project_color.dart';
import '../../widget/custom_elevated_button.dart';

mixin ProfileViewUtility {
  Positioned buildGeneralProfileContainer(
    BuildContext context, {
    required Widget pageDivider,
  }) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Container(
            padding: context.padding.horizontalMedium,
            width: double.infinity,
            height: context.sized.dynamicHeight(0.84),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: context.border.normalBorderRadius),
            child: Column(
              children: [
                //profile container
                buildProfileContainer(context),
                buildProfileContentListViewBuilder(
                    pageDivider: pageDivider, ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded buildProfileContentListViewBuilder({
    required Widget pageDivider,
  }) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              pageDivider,
              buildProfileContentItemsButton(context, enumItem: ProfileLvbItems.values[index]),
            ],
          );
        },
      ),
    );
  }

  Container buildProfileContainer(BuildContext context) {
    return Container(
      padding: context.padding.verticalMedium,
      child: Row(
        children: [
          //profilePhoto
          CircleAvatar(
            maxRadius: context.sized.dynamicHeight(0.05),
            backgroundImage:
                const AssetImage("assets/images/profile_photo.png"),
          ),
          Padding(
            padding: context.padding.onlyLeftMedium,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Leyla Kaya",
                  style: context.general.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  'Premium',
                  style: context.general.textTheme.titleSmall
                      ?.copyWith(color: ProjectColor.midBrown.getColor()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildProfileContentItemsButton(
    BuildContext context, {
    required ProfileLvbItems enumItem,
  }) {
    return Padding(
      padding: context.padding.verticalLow,
      child: CustomElevatedButton(
        onPressed: () {
          _navigateToPage(context, enumItem);
        },
        height: context.sized.dynamicHeight(0.06),
        elevation: 0,
        backgroundColor: Colors.transparent,
        width: context.sized.width,
        child: Row(
          children: [
            Padding(
              padding: context.padding.onlyRightMedium,
              child: Icon(
                enumItem.getIcon(),
                size: context.sized.mediumValue,
                color: ProjectColor.midBrown.getColor(),
              ),
            ),
            Text(
              enumItem.getLabel(),
              style: context.general.textTheme.bodyLarge?.copyWith(
                  color: ProjectColor.midBrown.getColor(),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Positioned customPositionedMarketPlaceTitle(BuildContext context,
      {required Widget marketPlaceTitle}) {
    return Positioned(
      top: 0,
      left: context.sized.dynamicWidth(0.24),
      child: marketPlaceTitle,
    );
  }

  LinearGradient buildBackgroundLinearGradient() {
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        Color(0xFFDAC6B5),
        Color(0xFFb59376),
      ],
    );
  }

  void _navigateToPage(BuildContext context, ProfileLvbItems enumItem) {
    final Map<ProfileLvbItems, Widget> pages = {
      ProfileLvbItems.wallet: const WalletView(),
    };
    context.route.navigateToPage(pages[enumItem]!);
  }
}


enum ProfileLvbItems{
  wallet,lastOrders,addresses,creditCard,accountSettings,checkOut,
}

extension ProfileLvbItemsExtension on ProfileLvbItems {
  String getLabel() => {
        ProfileLvbItems.wallet: 'Cüzdanım',
        ProfileLvbItems.lastOrders: 'Geçmiş Siparişlerim',
        ProfileLvbItems.addresses: 'AddreAdresslerimsses',
        ProfileLvbItems.creditCard: 'Adresslerim',
        ProfileLvbItems.accountSettings: 'Hesap Ayarları',
        ProfileLvbItems.checkOut: 'Çıkış Yap',
      }[this]!;

  IconData getIcon() => {
        ProfileLvbItems.wallet: Icons.account_balance_wallet,
        ProfileLvbItems.lastOrders: Icons.history,
        ProfileLvbItems.addresses: Icons.location_on,
        ProfileLvbItems.creditCard: Icons.credit_card,
        ProfileLvbItems.accountSettings: Icons.settings,
        ProfileLvbItems.checkOut: Icons.shopping_cart,
      }[this]!;
}