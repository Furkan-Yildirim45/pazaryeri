

import 'package:get/get.dart';

import '../../../../product/init/init.dart';
import '../../../../product/model/product_model.dart';
import '../model/comment_model.dart';

class ProductDetailController extends GetxController{
  Rx<ProductModel>? model = ProductModel().obs;
  RxList<CommentModel> commentItems = <CommentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    commentItems.value = ProjectInit().generateDummyComments();
    final arguments = Get.arguments;
    if (arguments != null && arguments is ProductModel) {
      model?.value = arguments;
    }
  }
}