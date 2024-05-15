

import 'package:get/get.dart';

import '../../../../product/init/init.dart';
import '../../../../product/model/product_model.dart';
import '../model/comment_model.dart';

class ProductDetailController extends GetxController{
  Rx<ProductModel>? model = ProductModel().obs;
  RxList<CommentModel> commentItems = <CommentModel>[].obs;
  Rx<int> index = 0.obs;
  RxBool isProductDetail = false.obs;

  @override
  void onInit() {
    super.onInit();
    commentItems.value = ProjectInit().generateDummyComments();
    final arguments = Get.arguments;
    if (arguments != null && arguments is Map) {
      if (arguments.containsKey('model') && arguments['model'] is ProductModel) {
        model?.value = arguments['model'];
      }
      if (arguments.containsKey('index') && arguments['index'] is int) {
        final _index = arguments['index'];
        index.value = _index;
      }
    }
  }
}

