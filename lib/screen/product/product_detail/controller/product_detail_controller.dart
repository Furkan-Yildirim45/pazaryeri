import 'package:Pazaryeri/screen/profile/favorite/controller/favorite_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../product/init/init.dart';
import '../../../../product/model/product_model.dart';
import '../../../../product/model/route_arguments_model.dart';
import '../model/comment_model.dart';

class ProductDetailController extends GetxController {
  Rx<ProductModel>? model = ProductModel.create().obs;
  RxList<CommentModel> commentItems = <CommentModel>[].obs;
  Rx<int> index = 0.obs;
  RxBool isProductDetail = false.obs;

  @override
  void onInit() {
    super.onInit();
    commentItems.value = ProjectInit().generateDummyComments();
    final arguments = Get.arguments;
    if (arguments != null && arguments is RouteArgumentsModel) {
      if (arguments.model != null) {
        model?.value = arguments.model!;
      }
      if (arguments.index != null) {
        index.value = arguments.index!;
      }
    }
  }

  void changeFavoriteValue(ProductModel? model) {
    final FavoriteController favoriteController = Get.put(FavoriteController());
    if (model != null) {
      if (model.isFavorite!) {
        favoriteController.removeFavoriteProductItems(model);
        model.isFavorite = false;
      } else if (model.isFavorite! == false) {
        favoriteController.addFavoriteProductItems(model);
        model.isFavorite = true;
      }
    }
    print("tıklandı");
    print(model?.isFavorite);
    update();
  }
}
