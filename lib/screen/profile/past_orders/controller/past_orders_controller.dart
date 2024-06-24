

import 'package:Pazaryeri/data/project_data.dart';
import 'package:Pazaryeri/product/model/product_model.dart';
import 'package:get/get.dart';

class PastOrdersController extends GetxController{
  RxList<ProductModel>? pastOrderProductItems = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    pastOrderProductItems?.value = ProjectData.instance?.pastOrderProductItems ?? [];
  }
}