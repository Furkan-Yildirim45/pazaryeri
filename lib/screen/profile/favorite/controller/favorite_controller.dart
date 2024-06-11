import 'package:get/get.dart';

import '../../../../data/project_data.dart';
import '../../../../product/model/product_model.dart';

class FavoriteController extends GetxController {
  RxList<ProductModel>? favoriteProductItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    favoriteProductItems?.value = ProjectData.instance?.favoriteProductItems ?? [];
    print(favoriteProductItems?[0].isFavorite);
  }

  void addFavoriteProductItems(ProductModel? product) {
    if (product != null) {
      favoriteProductItems!.add(product);
      update();
    }
  }

  void removeFavoriteProductItems(ProductModel? product){
    if(product != null){
      favoriteProductItems?.remove(product);
      update();
    }
  }
}
