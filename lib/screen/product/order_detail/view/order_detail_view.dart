import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/color/project_color.dart';
import 'package:untitled/product/model/product_model.dart';
import 'package:untitled/product/navigator/navigator_manager.dart';
import 'package:untitled/product/utility/project_utility/image_utility.dart';
import 'package:untitled/product/widget/custom_bottom_nav_bar.dart';
import 'package:untitled/product/widget/custom_elevated_button.dart';
import 'package:untitled/product/widget/page_divider.dart';
import 'package:untitled/screen/product/order_detail/controller/order_detail_controller.dart';

import '../../../../product/utility/page_utility/product/order_detail_utility.dart';

part 'part/product_detail_in_order_detail.dart';

class OrderDetailView extends StatelessWidget with OrderDetailUtility {
  OrderDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black12, width: 1)),
        title: Text(
          "Sipariş Detayları",
          style: context.general.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: context.padding.onlyRightNormal,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalNormal,
          child: GetBuilder(
            init: OrderDetailController(),
            builder: (controller) => ListView(
              children: [
                buildOrderSummary(context),
                ProductDetailInOrderDetail(model: controller.orderDetailItem?.value,),
                buildOrderAddressCard(context),
                buildPaymentInfo(context,controller.orderDetailItem?.value),
                buildSellingContract(context),
                context.sized.emptySizedHeightBoxLow
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(controller: controller,onTap: (int index) {
        NavigatorController.instance.pop();
        NavigatorController.instance.pop();
        controller.onItemTapped(index, context);
      },),
    );
  }
}
