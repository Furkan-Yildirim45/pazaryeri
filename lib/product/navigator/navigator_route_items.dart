import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled/screen/basic/create_profile/view/create_profile_view.dart';
import 'package:untitled/screen/basic/verification_code/view/verification_code_view.dart';
import 'package:untitled/screen/basic/welcome/view/welcome_view.dart';
import 'package:untitled/screen/home/home_page/view/home_page_view.dart';
import 'package:untitled/screen/main_page/view/main_page_view.dart';
import 'package:untitled/screen/onboarding/view/onboard_view.dart';
import 'package:untitled/screen/product/product_detail/view/product_detail_view.dart';
import 'package:untitled/screen/profile/address/view/address_view.dart';
import 'package:untitled/screen/profile/favorite/view/favorite_view.dart';
import 'package:untitled/screen/profile/past_orders/view/past_orders_view.dart';
import 'package:untitled/screen/profile/payment/view/payment_view.dart';
import 'package:untitled/screen/profile/profile_page/view/profile_View.dart';
import 'package:untitled/screen/profile/shopping_card/view/shopping_card_view.dart';
import 'package:untitled/screen/profile/wallet/view/wallet_view.dart';

import '../../screen/unknown_page/view/unknown_view.dart';

class NavigatorRoutes {
  static const String init = "/";
  final List<GetPage<dynamic>>? routes = [
      GetPage(name: NavigatorRoutes.init, page: () => const WelcomeView()),
      GetPage(name: NavigateRoutesItems.home.withSlash, page: () => const HomePageView()),
      GetPage(name: NavigateRoutesItems.favorite.withSlash, page: () => const FavoriteView()),
      GetPage(name: NavigateRoutesItems.shoppingCard.withSlash, page: () => ShoppingCardView()),
      GetPage(name: NavigateRoutesItems.profile.withSlash, page: () => const ProfileView()),
      GetPage(name: NavigateRoutesItems.wallet.withSlash, page: () => const WalletView()),
      GetPage(name: NavigateRoutesItems.payment.withSlash, page: () => PaymentView()),
      GetPage(name: NavigateRoutesItems.productDetail.withSlash, page: () => const ProductDetailView()),
      GetPage(name: NavigateRoutesItems.onBoarding.withSlash, page: () => const OnboardView()),
      GetPage(name: NavigateRoutesItems.mainPage.withSlash, page: () => MainPageView()),
      GetPage(name: NavigateRoutesItems.welcome.withSlash, page: () => const WelcomeView()),
      GetPage(name: NavigateRoutesItems.createProfile.withSlash, page: () => const CreateProfileView()),
      GetPage(name: NavigateRoutesItems.verificationCode.withSlash, page: () => VerificationView()),
      GetPage(name: NavigateRoutesItems.unknown.withSlash, page: () => const UnknownView()),
      GetPage(name: NavigateRoutesItems.pastOrders.withSlash, page: () => const PastOrdersView()),
      GetPage(name: NavigateRoutesItems.addresses.withSlash, page: () => AddressesView()),
      GetPage(name: NavigateRoutesItems.creditCard.withSlash, page: () => const UnknownView()),
      GetPage(name: NavigateRoutesItems.accountSettings.withSlash, page: () => const UnknownView()),
      GetPage(name: NavigateRoutesItems.checkOut.withSlash, page: () => const UnknownView()),
  ];
}

enum NavigateRoutesItems {
  init,
  home,
  favorite,
  shoppingCard,
  profile,
  wallet,
  pastOrders,
  addresses,
  creditCard,
  accountSettings,
  checkOut,
  payment,
  productDetail,
  onBoarding,
  mainPage,
  welcome,
  createProfile,
  verificationCode,
  unknown,
}

extension NavigateRoutesItemsExtension on NavigateRoutesItems{
  String get withSlash => "/$name";
}