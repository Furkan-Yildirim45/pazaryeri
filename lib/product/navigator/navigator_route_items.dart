import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../screen/basic/create_profile/view/create_profile_view.dart';
import '../../screen/basic/verification_code/view/verification_code_view.dart';
import '../../screen/basic/welcome/view/welcome_view.dart';
import '../../screen/home/home_page/view/home_page_view.dart';
import '../../screen/home/search/view/search_view.dart';
import '../../screen/home/search_result/view/search_result_view.dart';
import '../../screen/main_page/view/main_page_view.dart';
import '../../screen/onboarding/view/onboard_view.dart';
import '../../screen/product/all_comments/view/all_comment_view.dart';
import '../../screen/product/order_detail/view/order_detail_view.dart';
import '../../screen/product/product_detail/view/product_detail_view.dart';
import '../../screen/profile/address/view/address_view.dart';
import '../../screen/profile/card/view/card_view.dart';
import '../../screen/profile/favorite/view/favorite_view.dart';
import '../../screen/profile/influencer_suggestion/view/influencer_suggestion_view.dart';
import '../../screen/profile/notification/view/notification_view.dart';
import '../../screen/profile/past_orders/view/past_orders_view.dart';
import '../../screen/profile/payment/view/payment_view.dart';
import '../../screen/profile/profile_page/view/profile_View.dart';
import '../../screen/profile/shopping_card/view/shopping_card_view.dart';
import '../../screen/profile/wallet/view/wallet_view.dart';
import '../../screen/unknown_page/view/unknown_view.dart';

class NavigatorRoutes {
  static const String init = "/";
  final List<GetPage<dynamic>>? routes = [
      GetPage(name: NavigatorRoutes.init, page: () => const WelcomeView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.home.withSlash, page: () =>  const HomePageView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.favorite.withSlash, page: () => FavoriteView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.shoppingCard.withSlash, page: () => ShoppingCardView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.profile.withSlash, page: () => const ProfileView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.wallet.withSlash, page: () => const WalletView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.payment.withSlash, page: () => const PaymentView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.productDetail.withSlash, page: () => const ProductDetailView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.onBoarding.withSlash, page: () => const OnboardView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.mainPage.withSlash, page: () => MainPageView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.welcome.withSlash, page: () => const WelcomeView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.createProfile.withSlash, page: () => const CreateProfileView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.verificationCode.withSlash, page: () => VerificationView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.unknown.withSlash, page: () => const UnknownView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.pastOrders.withSlash, page: () => PastOrdersView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.addresses.withSlash, page: () => AddressesView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.creditCard.withSlash, page: () => CreditCardView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.accountSettings.withSlash, page: () => const UnknownView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.checkOut.withSlash, page: () => const WelcomeView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.searchResult.withSlash, page: () => const SearchResultView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.search.withSlash, page: () => SearchView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.allComment.withSlash, page: () => AllCommentView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.notification.withSlash, page: () => const NotificationView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.influencerSuggestion.withSlash, page: () => const InfluencerSuggestionView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
      GetPage(name: NavigateRoutesItems.orderDetail.withSlash, page: () => OrderDetailView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
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
  searchResult,
  search,
  allComment,
  notification,
  influencerSuggestion,
  orderDetail,
}

extension NavigateRoutesItemsExtension on NavigateRoutesItems{
  String get withSlash => "/$name";
}